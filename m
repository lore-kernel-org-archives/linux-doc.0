Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9B2DFF3F
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269214; cv=none; b=KJpYpkMPiU+no6iLUhlVMRHQpfVAnP9ObF0b7jhY2X/lZ233BY5Qx9cxqPu3/WJnDh8JzjG6O0Jpd8LoDAPjYzvknY0qTRJJg/+YCtVriMMMn+TBTGayxTczYjt8atWC3cxzU32gzlW/WyUZaRoY9TaM1JRqrljeoG/mzPtWzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269214; c=relaxed/simple;
	bh=IrK4RuTQd6Gh9ID4xjBsHXpyEVfmDXJk3B/kMTgF98w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EbB6SAJWNotjVUciPOiaEnFrVWqvrcBp0VNLjlw02b/eW4S35gdXcmfE72ZpAMsvopFif+N1GKXUuEckmVicooVz70Vk/cirzMt7dzL+jW89eAylffXpE+8XTYog1mMiKVmyu7WhkZubkuR06tuhuUMJxVeuqZHgYpuXjgwcoco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShXR0WzS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShXR0WzS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so299039a91.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 20:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269211; x=1789874011; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IvPt/wZXxxujTbMZWfSIeh9piDl1KqYp+kykFsa0uBU=;
        b=ShXR0WzSEcjxRW8IiiqttXSxB9lMgaa2ZOk5lEz+lTJNnHlMo/FW3p7cxucgCPK4u/
         n6SajbtuhPkTtfV5dkLlkbzoxtYRDRs4pMoUkCJrQHaiLOf+udpzX14bUOgWgsl9KYQQ
         5eUodWSOBOaDoGroVtVTLBfZ2WIgt7sEk1kPqTMGRQXVFkSgtquLNqEmqlYLGw29Fugv
         2GwxkcDVRpEuVFofm05qOPXabW/X5qIJvV63h9ZBAuN84O1qScBxbqeekmdABtKHcgCm
         QJU5+aPzJQIB+R3munsbkEOa55ZxlHSoIlTxtR0BYutbzO98KzRVU18q+nAiVcuA70lb
         ohhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269211; x=1789874011;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvPt/wZXxxujTbMZWfSIeh9piDl1KqYp+kykFsa0uBU=;
        b=j9htji2j773OJhtJ8Hfvk/vk/RB2ASfkEoLoZhQ7wGsNsyTuWUuEO6gzeF2UTxOtgb
         GxTGrg9jUYIq/hRbunWPLWpF/yzG7dOYbMpo3LI+fdjDrNN6aq+lVX156AMBUMrBNGGQ
         cj/wa8te3E2LUt50jh6+mjkckI9uR4vCSIK7iilRL78dRKxYFmLAw7ydeZntyRYRspjE
         lZycWqtluIzg/h2l1q0jQw77JYEp50SWh+7fn774AVLVo916D/Q8mX3EFSVYo4ZShFVb
         vjJAp3Vmrm/5muW1GehTk/MtIamLneqncRCSW175IiyOdXxq0rv7+DWqUMxPeOeul4c9
         sbBA==
X-Forwarded-Encrypted: i=1; AKwUvBzb5k3MYapDr0OhLqWVASqQUgv0rP9Nbq0HKR17Z/FhYDXrK93z4w48FIhPay6btLZlGslOmSa/fck=@vger.kernel.org
X-Gm-Message-State: AFuF++kdH6yf4YfgFdivv8e//+5rIgRyOVQK1iInOhSWRLQPSd3THsb7
	HWDMZGAlh1yDgXXTOG9aB9jg0rqd6twH4cXb+9jvK8+iDk6jXPaY3M43
X-Gm-Gg: AYBFou1sGMqDtQF7xaF9EiQ8L7GNk7LVJrmuU/q0er2WBU3AoewxA4XdWv6gau7goyp
	wD9/9oMe1O3pcD0K2iX1z8MyO6s0ry6YxV3vpLfzK2Q0ug5r38nLD+z+JpgWOS+5uvWCQp94I3x
	jtLO7EcWUQ6d3+6HCxKgDP6l8KnLf1xL5Oo6bDorDNs+vLNKE8P7HF/mkBqpFUnlLyT8NF2g2iC
	hyv0VYNJ1nPKsortkX/B/NPSuYhQF9XoWv3IYrlTROfUwe5cV0s9FNIZth+lgQxioH99X1zb4SI
	jGlIIK0qDC4z74NrGd7jpK90em8QrvEkAte4yU4EZx54YZJfCE0IMOskeguLiZ+wVDTCfWEBxPJ
	XL3sqPkgpcpEkZw5XTjrQch+BMTDeWFd8U6oYmWTu6SmIxirZTe9bBUaipnBd8sXw9oq4DRNAs1
	+yp0bpa81QYzVHxP3cHuC22jRsuO14aOyxbrYznoPaXUBE/eoKxGMIeNu6xVp+qpGFc7A7jwh9e
	qUDD9eQ
X-Received: by 2002:a17:90b:48cf:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39d9c359923mr11760988a91.3.1789269211221;
        Sat, 12 Sep 2026 20:13:31 -0700 (PDT)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d987e755fsm13251142a91.0.2026.09.12.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:13:30 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 13 Sep 2026 12:13:23 +0900
Subject: [PATCH] docs: sphinx-pre-install: warn about unsupported Docutils
 versions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QpAQBBFf0XzbGpnifgVedhYTG1LO0jJvxsez
 72ne28Qn9gLtNkNyZ8svEYFyjMYFhdnjzwqgzW2Mg0VOK6DoGwLxwu3pHWU3YXw5cfOQbCeqHS
 WjCkdgc6oNPH1X3T987zDx5TjcgAAAA==
X-Change-ID: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.3

Sphinx declares the range of Docutils versions it supports, but a
distribution can relax that upper bound when it wants to ship a newer
Docutils.  The pair then installs happily, and htmldocs builds without
a complaint, so nothing looks wrong until pdfdocs is run.

Fedora 44 ships such a pair: Sphinx 8.2.3 (which declares
"docutils>=0.20,<0.22") is patched to accept "<0.23" and is installed
alongside Docutils 0.22.4.  make pdfdocs then fails to produce four of
its books.  admin-guide runs out of TeX main memory 13 pages in:

  ! TeX capacity exceeded, sorry [main memory size=6000000].
  \sphinxafterbreak ->\copy \sphinxcontinuationbox

while arch, core-api and translations stop on

  ! Dimension too large.
  \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
  \end{sphinxVerbatim}

Both come from the large literal blocks those books include whole --
memory-barriers.txt, devices.txt, kernel-parameters.txt and
arch/sparc/oradax/dax-hv-api.txt.  Keeping everything else fixed and
varying only the two versions shows that neither component is at fault
on its own:

  sphinx   docutils   core-api   admin-guide
  ------------------------------------------
  8.1.3    0.21.2     ok         ok
  8.2.3    0.21.2     ok         ok
  8.2.3    0.22.4     FAILS      FAILS
  9.1.0    0.22.4     ok         ok

Sphinx gained Docutils 0.22 support in 9.0.0 and upstream decided not
to backport it to 8.2.x [1], so this pair will stay broken rather than
be fixed in a later 8.2 point release.

Check for it, since sphinx-pre-install exists precisely to catch a
documentation build environment that will not work.  Ask the
interpreter behind sphinx-build for its Docutils version -- a venv and
the system install can differ -- and warn when Sphinx is older than
9.0.0 while Docutils is 0.22 or newer.  Only warn: the build is left to
proceed, and htmldocs is unaffected.

Note that the bound Sphinx itself declares is of no use here, as that
is the very thing the distribution has changed.

[1]: https://github.com/orgs/sphinx-doc/discussions/14055

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Verified on Debian 13 over six Sphinx/Docutils combinations: the warning
appears for 8.2.3 with 0.22.4 and for nothing else, including the
boundaries at Sphinx 9.0.0 and Docutils 0.21.2.  Also checked on the
Fedora 44 host, where it fires as it should, and in a venv built from
Documentation/sphinx/requirements.txt, which resolves to Sphinx 9.1.0
and stays quiet.  make htmldocs and make pdfdocs are otherwise
untouched; the warning does not change the exit status.

This lands in the same area as Chen Miao's "docs: sphinx-pre-install:
improve dependency checks" series [1], which adds a GNU Make version
check alongside the existing Sphinx one.  It applies cleanly to mainline
today, but I am happy to rebase if that series goes in first.

[1]: https://lore.kernel.org/linux-doc/20260814214419.49925-1-chenmiao.ku@gmail.com/
---
 tools/docs/sphinx-pre-install | 69 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093a41..d22287451e9b 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -41,6 +41,13 @@ from kdoc.python_version import PythonVersion
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
 
+# Sphinx only learned to cope with Docutils 0.22 on its 9.0.0 release, and
+# upstream chose not to backport that to the 8.2.x series:
+#     https://github.com/orgs/sphinx-doc/discussions/14055
+# So the pair below is broken for good, not just until the next point release.
+MIN_DOCUTILS_SPHINX = PythonVersion("9.0.0").version
+DOCUTILS_BREAKS_AT = PythonVersion("0.22").version
+
 
 class DepManager:
     """
@@ -490,10 +497,72 @@ class MissingCheckers(AncillaryMethods):
             self.need_sphinx = 1
             return
 
+        self.check_docutils(sphinx)
+
         # On version check mode, just assume Sphinx has all mandatory deps
         if self.version_check and self.cur_version >= RECOMMENDED_VERSION:
             sys.exit(0)
 
+    def get_docutils_version(self, cmd):
+        """
+        Get the Docutils version a sphinx-build command would use.
+
+        Docutils is a Python module rather than a program, so it has to be
+        asked of the very interpreter that runs sphinx-build: a venv and the
+        system install can hold different versions. Take it from the script's
+        shebang, falling back to the interpreter running this script.
+        """
+        python = sys.executable
+
+        try:
+            with open(cmd, "r", encoding="utf-8") as f:
+                match = re.match(r"^#!\s*(\S+)", f.readline())
+                if match:
+                    python = match.group(1)
+        except (OSError, UnicodeDecodeError):
+            pass
+
+        try:
+            result = self.run(
+                [python, "-c", "import docutils; print(docutils.__version__)"],
+                capture_output=True,
+                text=True,
+                check=True,
+            )
+        except (OSError, subprocess.CalledProcessError):
+            return None
+
+        match = re.match(r"^\s*([0-9]+(?:\.[0-9]+)*)", result.stdout)
+        if not match:
+            return None
+
+        return PythonVersion.parse_version(match.group(1))
+
+    def check_docutils(self, sphinx):
+        """
+        Warn when Sphinx is paired with a Docutils it cannot handle.
+
+        Sphinx declares the Docutils range it supports, but distributions
+        sometimes relax that upper bound to ship a newer Docutils. The pair
+        still builds HTML, so nothing looks wrong until pdfdocs is run and
+        the LaTeX output turns out to be broken.
+        """
+        if not self.cur_version or self.cur_version >= MIN_DOCUTILS_SPHINX:
+            return
+
+        docutils_version = self.get_docutils_version(sphinx)
+        if not docutils_version or docutils_version < DOCUTILS_BREAKS_AT:
+            return
+
+        curver = PythonVersion.ver_str(self.cur_version)
+        docver = PythonVersion.ver_str(docutils_version)
+        minver = PythonVersion.ver_str(MIN_DOCUTILS_SPHINX)
+
+        print(f"WARNING: Sphinx {curver} does not support Docutils {docver}.")
+        print(f"         Docutils 0.22 and above need Sphinx {minver} or later.")
+        print("         PDF builds are known to produce broken LaTeX with this")
+        print("         combination, even though HTML builds fine.")
+
     def catcheck(self, filename):
         """
         Reads a file if it exists, returning as string.

---
base-commit: 5225b8eec4c9bb21aecff6295fab6346a3c3738e
change-id: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

