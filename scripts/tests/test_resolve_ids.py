"""Tests for scripts/resolve_ids.py (real network calls, 3 ids)."""
import os
import subprocess
import sys
import tempfile
import unittest

SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "resolve_ids.py")


def run(text):
    with tempfile.NamedTemporaryFile("w", suffix=".md", delete=False) as f:
        f.write(text)
        path = f.name
    try:
        p = subprocess.run([sys.executable, SCRIPT, path], capture_output=True, text=True, timeout=120)
    finally:
        os.unlink(path)
    return p.returncode, [l.split("\t") for l in p.stdout.splitlines()]


class ResolveIds(unittest.TestCase):
    def test_arxiv_ok(self):
        code, rows = run("Voir arXiv:1903.05168.")
        self.assertEqual(code, 0)
        self.assertEqual(rows[0][1], "ok")
        self.assertIn("Pitfalls", rows[0][2])

    def test_doi_ok(self):
        code, rows = run("DOI 10.1103/PhysRevLett.109.268101")
        self.assertEqual(code, 0)
        self.assertEqual(rows[0][1], "ok")
        self.assertIn("Agliari", rows[0][3])

    def test_extract_doi_with_parentheses(self):
        code, rows = run("(voir 10.1016/0378-4371(90)90345-s) et 10.1073/pnas.2409160121.")
        self.assertEqual(code, 0)
        self.assertEqual([r[0] for r in rows], ["10.1016/0378-4371(90)90345-s", "10.1073/pnas.2409160121"])
        self.assertIn("Hemmen", rows[0][3])

    def test_arxiv_ko(self):
        code, rows = run("arXiv:9999.99999")
        self.assertEqual(code, 1)
        self.assertEqual(rows[0][1], "ko")


if __name__ == "__main__":
    unittest.main()
