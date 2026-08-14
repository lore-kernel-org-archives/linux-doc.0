Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1FB3EC824
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743875; cv=none; b=etSOxlDaAR0tczln8vuUN7cVuNH/vfHcD3RRbpZSCD5OootBGMhmuyEjRA3e7/GCLQhoXNt8HVmpqypybC7/MYhajVLoOc4FNYDLBMtyVhAV56x+U1EXA8qL/TptWST2fNdgRC6tgKYBtTWjE5S0ZIAWMSaZSDjx92KEIOMkJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743875; c=relaxed/simple;
	bh=jHQTrHx9cRtuPQJEUfGJd5bfvC7k+OVYc4Z8SEzo/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWOUNqirTFoAA6WIH+cI3yCFvnqM+tCUy8Z9DARhOjuMO2SWIB3aaAP0R+BJjBOyt8YfKBThKOgBS/xxALFl53Cac3gZG2su52SeV+j0ukV/QnYj8DMlKqta+jhfEvIhljLjMKgOXKfILxlk7wHZqiz3/YZSWqv4enLkzydWGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFpuW9WU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFpuW9WU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbf0dc8c871so891182a12.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743874; x=1787348674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkVVrdAK9iWpv+mtoFZiSwPkYIpP4oPpqC5PfGzOJMk=;
        b=dFpuW9WUEKJHX3E7NTDSZZnkPX/nGj2lqGCyPsaNwtNj+3xPBPYR2kfjDqAIQGs1zs
         BLUeaZ77maGNkzR9jE3VrEIAwzJhKB06lYl/Gf57heiJdZMD6pQ9CYPV+mcrAfk0Le0i
         tk4n0qrWebEGzed9F9BPRIHEdyFOoo5+5JZZLubMla+4RvqFuCJBicnciZZpzlEe8xKz
         mgAbkFtnjyTqPJdnzqBHFGyH4nFOsvj69zgkOjs2en8iCxu6irpHj7hHjhVz7GPrOUgM
         UbJVsCzxo5jH0k6P+HpIJZfeWGfRNKBMVCZX9z24Wa1nQp4fTv0me10tB3Mcq/RkAQRJ
         Uljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743874; x=1787348674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkVVrdAK9iWpv+mtoFZiSwPkYIpP4oPpqC5PfGzOJMk=;
        b=GMd3+Y6rt4v4hy2fVizvUCPoY5a8HK7OGkUbKF65VCjyxjkrNUljyaROQMT4gnpQF5
         xTb4c/ndDhYoarfJAlIYC4KwnXkIiIoR1cBb1MK7/UgL2yu6kv10RrrChCviLYmk9RCK
         1DxT9ImWbl2uuFIpBgR5chx0eOHfjFeonYzj9h6FcNBH5NPUie6EYAv+vyfGVFwVljJQ
         fFh2l6p8ValsHrJ6zIcvr8swgX43zuResXow9Ej9QGmLBoV0eryp/Ks94PQi1BCCkqNB
         Az8oMHBaASZ5qFeiUxJKnTFp2gPq9N9kqg9JiHHnvSytAwT47EPeSjRYsTnwI2VR/w9z
         Qmng==
X-Gm-Message-State: AOJu0Ywrgpv6zPIIgP597qH9THisQTSgx+tgkkKmi6ZZ2yAxmM2o1CpO
	NGMN2Ud14vBkq6aP9xM4bX+izS4GAxz0q8Nj7Tz/KVOgATnsVKuq7Th9
X-Gm-Gg: AR+sD12YL2BkX/BpNyAaR5BdrwKB5NxtdKpUi2OgBWIdB55GlXMtanycoCRGRfQUxzU
	Hp3tQvp5MsXiLl270eN8dKZNInHafbbCyU6iy0k/IXJUTYL9t1ZeeyY9tKgxtmTqSpEsrl9XS44
	9RUMtHKObIS7jw070EJzBKv4FnVv1mQmBmO8i5z2tE0h9ftxhiTq4Jyi3NubOEhYwyehpAJ1soE
	+c/VSNcKZo02l3HoBXM+Hyhxz3KaWLnjyGl8YKRbbwWzV891I4GFGYcp6QSj08Oft5c9bz0dnW0
	tricpcYkokbKPG8Lxut+WpGmZgO9Xp4RGaJVJCK84r71HC4IGX38CAZfZA4tcXRMYT8ulAXO7xC
	NpbKhtRKIf96ONRzfkGnEiJ1U1KlrMYzECiQC56u6Gzk21Z3jQgpMRRXCps2a0gIWRByvOEFiI0
	jMS2JKwqh2d3EvDlvf4E7QqPh1H2/b1x72myg75YxySprGx51DqWWJaRiyrERMijd3m0yiXCn1J
	aA=
X-Received: by 2002:a05:6a21:339f:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3cc71cfc71cmr10066558637.27.1786743873567;
        Fri, 14 Aug 2026 14:44:33 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:33 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 2/6] docs: sphinx-pre-install: add macOS Homebrew support
Date: Sat, 15 Aug 2026 05:44:14 +0800
Message-ID: <20260814214419.49925-3-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814214419.49925-1-chenmiao.ku@gmail.com>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependency checker currently reports an unknown distribution on macOS
and cannot provide installation hints.

Detect macOS and include its product version in the status output. Use
Homebrew for formula dependencies and install the command-line-only MacTeX
cask without sudo. Only require Homebrew when dependencies need to be
installed, install the DejaVu and Noto CJK fonts needed for PDF output, and
explain how to refresh PATH after installing MacTeX.

Keep PyYAML in the virtualenv requirements because Homebrew does not
provide a PyYAML formula. Check the module even on macOS: it is required by
the parser_yaml extension regardless of how Sphinx is installed. When it is
missing, direct users to the default virtualenv mode.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/sphinx.rst |  18 +++++
 tools/docs/sphinx-pre-install      | 110 +++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 51c370260..1e105542a 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -131,6 +131,24 @@ It supports two optional parameters:
 ``--no-virtualenv``
 	Use OS packaging for Sphinx instead of Python virtual environment.
 
+macOS uses a case-insensitive APFS volume by default, but the kernel tree
+contains file names that differ only in case. Before cloning the tree, use
+``diskutil apfs list`` to find the APFS container identifier, replace
+``diskX`` below with that identifier, and create an additional case-sensitive
+volume with::
+
+	diskutil apfs addVolume diskX APFSX Linux
+
+On macOS, the script uses Homebrew for system dependencies. Homebrew
+commands are printed without ``sudo``. The PDF toolchain is provided by the
+``mactex-no-gui`` cask, while the required DejaVu and Noto CJK fonts are
+installed from Homebrew font casks; use ``--no-pdf`` when only building HTML
+documentation. After installing MacTeX, restart the terminal or run
+``eval "$(/usr/libexec/path_helper)"`` so its command-line tools are visible.
+The default virtualenv mode is recommended on macOS because PyYAML is
+installed from ``Documentation/sphinx/requirements.txt`` rather than from a
+Homebrew formula.
+
 Installing Sphinx Minimal Version
 ---------------------------------
 
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093..1956f1369 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -518,6 +518,24 @@ class MissingCheckers(AncillaryMethods):
         a decent coverage.
         """
 
+        if sys.platform == "darwin":
+            sw_vers = self.which("sw_vers")
+            if sw_vers:
+                try:
+                    result = self.run(
+                        [sw_vers, "-productVersion"],
+                        capture_output=True,
+                        text=True,
+                        check=True,
+                    )
+                    version = result.stdout.strip()
+                    if version:
+                        return f"macOS {version}"
+                except (subprocess.CalledProcessError, FileNotFoundError):
+                    pass
+
+            return "macOS"
+
         system_release = ""
 
         if self.which("lsb_release"):
@@ -716,6 +734,93 @@ class SphinxDependencyChecker(MissingCheckers):
 
         return self.get_install_progs(progs, "apt-get install")
 
+    def give_macos_hints(self):
+        """Provide package installation hints for macOS using Homebrew."""
+        progs = {
+            "Pod::Usage":    "perl",
+            "convert":       "imagemagick",
+            "dot":           "graphviz",
+            "ensurepip":     "python",
+            "python-sphinx": "sphinx-doc",
+            "rsvg-convert":   "librsvg",
+            "xelatex":        "mactex-no-gui",
+            "latexmk":        "mactex-no-gui",
+        }
+
+        if self.pdf:
+            font_dirs = [
+                os.path.expanduser("~/Library/Fonts"),
+                "/Library/Fonts",
+                "/System/Library/Fonts",
+            ]
+            pdf_fonts = {
+                "font-dejavu": ["DejaVuSans.ttf"],
+                "font-noto-sans-cjk": ["NotoSansCJK.ttc"],
+            }
+
+            for package, names in pdf_fonts.items():
+                files = [
+                    os.path.join(font_dir, name)
+                    for font_dir in font_dirs
+                    for name in names
+                ]
+                self.check_missing_file(files, package, DepManager.PDF_MANDATORY)
+
+        install = self.deps.check_missing(progs)
+
+        if self.verbose_warn_install:
+            self.deps.warn_install()
+
+        if not install:
+            return None
+
+        formulae = set()
+        casks = set()
+        notes = []
+        for package in install.split():
+            if package == "yaml":
+                notes.append(
+                    "PyYAML is not provided as a Homebrew formula. Use the "
+                    "default virtualenv mode so it is installed from "
+                    "Documentation/sphinx/requirements.txt."
+                )
+                continue
+
+            if package == "mactex-no-gui" or package.startswith("font-"):
+                casks.add(package)
+            else:
+                formulae.add(package)
+
+        commands = []
+        if formulae:
+            commands.append("\tbrew install " + " ".join(sorted(formulae)))
+        if casks:
+            commands.append("\tbrew install --cask " + " ".join(sorted(casks)))
+
+        if not commands:
+            self.distro_msg = "\n".join(notes)
+            return None
+
+        if not self.which("brew"):
+            notes.append(
+                "Homebrew is needed to install the missing dependencies. "
+                "Install it from https://brew.sh/ and re-run this script."
+            )
+            self.distro_msg = "\n".join(notes)
+            return None
+
+        if "mactex-no-gui" in casks:
+            notes.append(
+                "After installing MacTeX, restart the terminal or run:\n"
+                "\teval \"$(/usr/libexec/path_helper)\"\n"
+                "before re-running this script."
+            )
+
+        if notes:
+            self.distro_msg = "\n".join(notes)
+
+        return "\nYou should run:\n" + "\n".join(commands)
+
     def give_redhat_hints(self):
         """
         Provide package installation hints for RedHat-based distros
@@ -1138,6 +1243,8 @@ class SphinxDependencyChecker(MissingCheckers):
             re.compile("Kali"):                       self.give_debian_hints,
             re.compile("Mint"):                       self.give_debian_hints,
 
+            re.compile("macOS"):                      self.give_macos_hints,
+
             re.compile("openSUSE"):                   self.give_opensuse_hints,
 
             re.compile("Mageia"):                     self.give_mageia_hints,
@@ -1458,6 +1565,9 @@ class SphinxDependencyChecker(MissingCheckers):
         self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
         self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
 
+        # PyYAML is required by Documentation/sphinx/parser_yaml.py. The
+        # macOS installation hints explain that it is installed from the
+        # virtualenv requirements, rather than from a Homebrew formula.
         self.check_python_module("yaml")
 
         if self.pdf:
-- 
2.50.1 (Apple Git-155)

