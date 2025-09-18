Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB33305E29;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=KFS7j5p25NeulfAwycnGNVB9XJHI/kvOaXwMmsIHs8kaENBAKhsZ7jhA1EwPHJOMvyheHEFSWYGhU/Jx0A90dbhyPPt3cIU111ZiSAXWVVrdQeg2eaPpk4QZCSFdd5fnYs6DHspZgasi4kLjdvZiHiNJcuL4Ag2qihSg7RT+WT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=5h0Y2l0VICf3uSdAhL346MOGEeZeAoHZKXVIcjeYSFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO0yAn4ijTDpJ4PLup8EoyWJ43tQ+s1kx0Gx4pGv4oLJQvLxuIHSPjpR2qqhIaJINRHWUgWXGk+eu14F3P2mbI9q3AeG44BCo9zvdEKi0bFCUoKy9TBTrX34LT/uyD6icHZo11T9dLdKdY6A8FkiiLOj9YCMO1nuYHyn8te36dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCMrCqG7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCMrCqG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F872C116D0;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196507;
	bh=5h0Y2l0VICf3uSdAhL346MOGEeZeAoHZKXVIcjeYSFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCMrCqG7ctX+pVvP6a/KXeUHdrHQq+lo+vQf0AiCROyz9+D7XnSXsZ1rcf3JRi43+
	 EFW6+W4SasJrXPvbtwoSd47DGAOVVeHNV2weriIBV4dh7lkasigtz30AIL4Pw0WIWW
	 27qquDem5WqvyTXakF7/dINwECygPHQ15sYwIJKXf9ucIvVm8K2l8GeHwaQtaEQ3ew
	 FGilNrFz7X1YLB/obTMOTKGV5vPoMOPLbRBvFOM76hKEqiXihGqdayu9msrvGEdDNc
	 QyMQ8/sT4TUvzxtmKzj7Map9p6TO53QyrzaWSpUfMIkgHWzoTxD+q+thR0o8tWkUv4
	 7MaE+Ou+Q7VFg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crto-286H;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 24/24] tools/docs: sphinx-build-wrapper: add support to run inside venv
Date: Thu, 18 Sep 2025 13:54:58 +0200
Message-ID: <e34fa63a61e75a0ec86b37c9b5fafa6677f44c6c.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sometimes, it is desired to run Sphinx from a virtual environment.
Add a command line parameter to automatically build Sphinx from
such environment.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 103b0044bb0b..6ed3d58ec277 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -69,6 +69,7 @@ from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
 #
 #  Some constants
 #
+VENV_DEFAULT = "sphinx_latest"
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
 PAPER = ["", "a4", "letter"]
 
@@ -171,8 +172,10 @@ class SphinxBuilder:
         if not verbose:
             self.sphinxopts += ["-q"]
 
-    def __init__(self, builddir, verbose=False, n_jobs=None, interactive=None):
+    def __init__(self, builddir, venv=None, verbose=False, n_jobs=None,
+                 interactive=None):
         """Initialize internal variables"""
+        self.venv = venv
         self.verbose = None
 
         #
@@ -220,6 +223,21 @@ class SphinxBuilder:
 
         self.get_sphinx_extra_opts(n_jobs)
 
+        #
+        # If venv command line argument is specified, run Sphinx from venv
+        #
+        if venv:
+            bin_dir = os.path.join(venv, "bin")
+            if not os.path.isfile(os.path.join(bin_dir, "activate")):
+                sys.exit(f"Venv {venv} not found.")
+
+            # "activate" virtual env
+            self.env["PATH"] = bin_dir + ":" + self.env["PATH"]
+            self.env["VIRTUAL_ENV"] = venv
+            if "PYTHONHOME" in self.env:
+                del self.env["PYTHONHOME"]
+            print(f"Setting venv to {venv}")
+
     def run_sphinx(self, sphinx_build, build_args, *args, **pwargs):
         """
         Executes sphinx-build using current python3 command.
@@ -254,7 +272,12 @@ class SphinxBuilder:
             if self.n_jobs:
                 n_jobs = str(self.n_jobs)
 
-            cmd = [sys.executable, sphinx_build]
+            if self.venv:
+                cmd = ["python"]
+            else:
+                cmd = [sys.executable,]
+
+            cmd += [sphinx_build]
             cmd += [f"-j{n_jobs}"]
             cmd += self.sphinxopts
             cmd += build_args
@@ -772,12 +795,16 @@ def main():
     parser.add_argument('-i', '--interactive', action='store_true',
                         help="Change latex default to run in interactive mode")
 
+    parser.add_argument("-V", "--venv", nargs='?', const=f'{VENV_DEFAULT}',
+                        default=None,
+                        help=f'If used, run Sphinx from a venv dir (default dir: {VENV_DEFAULT})')
+
     args = parser.parse_args()
 
     PythonVersion.check_python(MIN_PYTHON_VERSION, show_alternatives=True,
                                bail_out=True)
 
-    builder = SphinxBuilder(builddir=args.builddir,
+    builder = SphinxBuilder(builddir=args.builddir, venv=args.venv,
                             verbose=args.verbose, n_jobs=args.jobs,
                             interactive=args.interactive)
 
-- 
2.51.0

