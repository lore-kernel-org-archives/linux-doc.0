Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A822236E0;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501022; cv=none; b=r5npWPEiwlU87jFnX/TUDNy+tnlTzoGoYWcj/USuznwzq1wnTQDTdzF+qzT8JjYcZHrnRMk9UOS69rokw+8UjZ/esCAp6HKWsra8t/e3ICFmb1QneZ9d1xyl6+tTdSuQgsUKCRA1OA5RohRI85xk6Pk7Xp8dJT9m6h6zS818Ko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501022; c=relaxed/simple;
	bh=C2cStPoOoGCftK6fYM/VQjKEO1UC2wtJ9483nmjaklU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOVcYER9lEHbEe5ghdl8BsTOcIpVOkmVCLunLCb9adkakyYgq6UsOonwMlsKVcxLGUOvKZ3oXZwb0pU+RScw/mR0dEXTp/OsjygrHoanhbajCBWjewQQIfTuB4QqynqzvFdfX+Z/lB2+2X9fgenMKAdHoRlKTjcvO8ic9ykm58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff2d5tvP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff2d5tvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEE1C2BC86;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501022;
	bh=C2cStPoOoGCftK6fYM/VQjKEO1UC2wtJ9483nmjaklU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ff2d5tvPIUy7sYereZn22wwUrmunMAY8+6pclEQDTx7pMtmbEGdDmF9yoxDK1dnx2
	 xyL0VFLR8+c9xq4vo9RBRuGMYtZDbZvp7uBQEX9JahvtNjZDoabpbBX6D65SQKODft
	 et2VW2sFnssDRglBJXZjg2uXu61H12gnbXkmBQ2qmkucpihgU94PwHoT8JbjntBliv
	 pOnRzwRbxM9lyDjXeTirvYqXxIbfvJfMCeeap+7zk9GuhJf0ombpOmHbd4XEU3C4vq
	 ifMT+eMX1AJ7RCiabmB8lKyIY3fKHkkPzSAt22EfoIGPb/5YfoOdEK7LVGbkQAVcRo
	 /CD8IAG+85Czg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vke32-0000000BNMG-2QwZ;
	Tue, 27 Jan 2026 09:03:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 3/3] tools: sphinx-build-wrapper: improve its help message
Date: Tue, 27 Jan 2026 09:03:34 +0100
Message-ID: <e0ccee75f7e7fb499e0f59d5b84469f4b6a21627.1769500383.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769500383.git.mchehab+huawei@kernel.org>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Besides the parameters that are passed via command line arguments,
the wrapper's behavior is affected by several environment variables.

Document that. While here, use __doc__ for its description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 8080ace60680..b7c149dff06b 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -814,20 +814,42 @@ def jobs_type(value):
     except ValueError:
         raise argparse.ArgumentTypeError(f"Must be 'auto' or positive integer, got {value}")  # pylint: disable=W0707
 
+EPILOG="""
+Besides the command line arguments, several environment variables affect its
+default behavior, meant to be used when called via Kernel Makefile:
+
+- KERNELVERSION:  Kernel major version
+- KERNELRELEASE:  Kernel release
+- KBUILD_VERBOSE: Contains the value of "make V=[0|1] variable.
+                  When V=0 (KBUILD_VERBOSE=0), sets verbose level to "-q".
+- SPHINXBUILD:    Documentation build tool (default: "sphinx-build").
+- SPHINXOPTS:     Extra options pased to SPHINXBUILD
+                  (default: "-j auto" and "-q" if KBUILD_VERBOSE=0).
+                  The "-v" flag can be used to increase verbosity.
+                  If V=0, the first "-v" will drop "-q".
+- PYTHON3:        Python command to run SPHINXBUILD
+- PDFLATEX:       LaTeX PDF engine. (default: "xelatex")
+- LATEXOPTS:      Optional set of command line arguments to the LaTeX engine
+- srctree:        Location of the Kernel root directory (default: ".").
+
+"""
+
 def main():
     """
     Main function. The only mandatory argument is the target. If not
     specified, the other arguments will use default values if not
     specified at os.environ.
     """
-    parser = argparse.ArgumentParser(description="Kernel documentation builder")
+    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
+                                     description=__doc__,
+                                     epilog=EPILOG)
 
     parser.add_argument("target", choices=list(TARGETS.keys()),
                         help="Documentation target to build")
     parser.add_argument("--sphinxdirs", nargs="+",
                         help="Specific directories to build")
     parser.add_argument("--builddir", default="output",
-                        help="Sphinx configuration file")
+                        help="Sphinx configuration file (default: %(default)s)")
 
     parser.add_argument("--theme", help="Sphinx theme to use")
 
@@ -843,7 +865,7 @@ def main():
                         help="place build in verbose mode")
 
     parser.add_argument('-j', '--jobs', type=jobs_type,
-                        help="Sets number of jobs to use with sphinx-build")
+                        help="Sets number of jobs to use with sphinx-build(default: auto)")
 
     parser.add_argument('-i', '--interactive', action='store_true',
                         help="Change latex default to run in interactive mode")
-- 
2.52.0

