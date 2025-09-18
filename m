Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8C304BAB;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=liyForztzLwcFX6ucemt2IzqhSScp0vLDQGTEhZBn+DJNlwoz8Wj6RV5vxiA22Mv2AkVXwAQm1ed8y3DMlUWSMMdVYFl7oCMwy9HYaFW5nBIPAx0/tSAq9CBjOjn+DlUYUoiICwDbIupV7gunJ0ZtpSHbufTWvL87zzIuK4PlV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=PUUaTyw8rlc0Hc2z+x0BdPRC+RKe/Sri73mjZjht+w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtzGX3q2XN17sS0wfiZNKJKsp9FnmA6OLnOLFrnPMAhPolliajEockJyqfQotXhMG/r4wiRUffJ9dkvE+74YhTEFi6GlKZjQJ8MaMn8DjL/ooOOXx/rrtp6hmUbyZNV1i4gAYkhlygyY5Kp9xYxqkMMjO2IjH/cvLvIF63yXFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TciCRFNb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TciCRFNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C256EC4AF0B;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=PUUaTyw8rlc0Hc2z+x0BdPRC+RKe/Sri73mjZjht+w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TciCRFNbAjmoTG9R/zfKSvON4u6mU+PjQ5bAY+3QiWkmXyQ7Jx1YSfcFWJC7AGYAM
	 M3uRFn09WzdMIIiiuIFh/5lZBM2QoejnUgSJUnmFZoHbTZKDfJO0loYykzw0TijhKr
	 AQMWIpz2RpTH9hXGTaJLcfv5MqBXYHPfXRzL6S25eCr606ZNrvERn742fFc24OITMX
	 oamxYIt63y6nK131McDFMYtDNxYxIMIRijLTr7Uq3Ro429ULW9vYwXkDzLToJGOS19
	 CWogoEvteuGJNQQ2C2GFMVmoCPHbALw6fCzfVQPLze4wNa8ZhByKNRlJ4pbJGZBVcV
	 t5yd4E2prtIBw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crt5-0ma2;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 15/24] tools/docs: sphinx-build-wrapper: add an argument for LaTeX interactive mode
Date: Thu, 18 Sep 2025 13:54:49 +0200
Message-ID: <9e5b9a8becc981b47ca3bf3ddce034f273400738.1758196090.git.mchehab+huawei@kernel.org>
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

By default, we use LaTeX batch mode to build docs. This way, when
an error happens, the build fails. This is good for normal builds,
but when debugging problems with pdf generation, the best is to
use interactive mode.

We already support it via LATEXOPTS, but having a command line
argument makes it easier:

Interactive mode:
	./scripts/sphinx-build-wrapper pdfdocs --sphinxdirs peci -v -i
	...
	Running 'xelatex --no-pdf  -no-pdf -recorder  ".../Documentation/output/peci/latex/peci.tex"'
	...

Default batch mode:
        ./scripts/sphinx-build-wrapper pdfdocs --sphinxdirs peci -v
	...
	Running 'xelatex --no-pdf  -no-pdf -interaction=batchmode -no-shell-escape -recorder  ".../Documentation/output/peci/latex/peci.tex"'
	...

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index c57c732b879c..50761f125bc9 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -173,7 +173,7 @@ class SphinxBuilder:
         if not verbose:
             self.sphinxopts += ["-q"]
 
-    def __init__(self, builddir, verbose=False, n_jobs=None):
+    def __init__(self, builddir, verbose=False, n_jobs=None, interactive=None):
         """Initialize internal variables"""
         self.verbose = None
 
@@ -183,7 +183,11 @@ class SphinxBuilder:
         self.kernelversion = os.environ.get("KERNELVERSION", "unknown")
         self.kernelrelease = os.environ.get("KERNELRELEASE", "unknown")
         self.pdflatex = os.environ.get("PDFLATEX", "xelatex")
-        self.latexopts = os.environ.get("LATEXOPTS", "-interaction=batchmode -no-shell-escape")
+
+        if not interactive:
+            self.latexopts = os.environ.get("LATEXOPTS", "-interaction=batchmode -no-shell-escape")
+        else:
+            self.latexopts = os.environ.get("LATEXOPTS", "")
 
         if not verbose:
             verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
@@ -584,12 +588,16 @@ def main():
     parser.add_argument('-j', '--jobs', type=jobs_type,
                         help="Sets number of jobs to use with sphinx-build")
 
+    parser.add_argument('-i', '--interactive', action='store_true',
+                        help="Change latex default to run in interactive mode")
+
     args = parser.parse_args()
 
     PythonVersion.check_python(MIN_PYTHON_VERSION)
 
     builder = SphinxBuilder(builddir=args.builddir,
-                            verbose=args.verbose, n_jobs=args.jobs)
+                            verbose=args.verbose, n_jobs=args.jobs,
+                            interactive=args.interactive)
 
     builder.build(args.target, sphinxdirs=args.sphinxdirs, conf=args.conf,
                   theme=args.theme, css=args.css, paper=args.paper,
-- 
2.51.0

