Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56344483BEE
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559024; cv=none; b=Q13sXR5a6V0h0ig3JMqtrC1OvXCf5gOBG4ejQnaF3hrvJPnOx9As50j2xX//CfsowbTLM3yFCzbIBSVtqGtRLKxDfwY97uAZ2A5uzaqlWZ26ycWPnaVk8rqw9FcQtIX/6xce1i50BvpfVd3gZHOFQzjmy2I+544gRmNuvId7RNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559024; c=relaxed/simple;
	bh=h2dbDUsrNzzcBLzHkNW+FD2Z6I/D1g8VZ+8HCKQ5mnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DijglgUK4Sdgl6jB1oTj0wZkq/hQG/327dLz/k40dQKEaxeF3wDdn/Nzr6LQN8aaN+Rh/QIxzC6SYPO51c5wobl7RRZLAJVv4t+DBmPMfT7LGQp+61qZ/TrDNfsPLlCNarf2vmDf4vbDg2VMAUNud7Vuv57X+DoHQnWbhQE2c3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEVadRcL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEVadRcL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso2328295ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559022; x=1787163822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CHx1iwCwh21fCkE+4XWz3PtqrzLKNwwReumRsHpQLk=;
        b=OEVadRcLVC9gBuUEcJiz+KSWmMW0wPcuASUAbE1J6JWpjxb/Ey4w1fy0FCEN6ttMyE
         eKZNk08tGMVgENj0Uoq3jRZMmhH+pGHdo/PHtlLsJ5sPL+f5QswhUtRBAmoY4gSw5bv3
         0E1u9TA5reQRFxcDmW79Kmkfl+QVz09UB+N3MUO5EJPJ5+TFxtVajwpbSt8QBX3UUuoU
         nX1j5lDVEVJZrMlucwgnRHf2NVHw5aU8bmy7g7lYE/H9vSBIZaW5gR4NcS3Of6FbTP6J
         nrai5gld0E2FtDzPDogj5iq836j8jNoR5NEOlb/+q5d4qDriaC7ZXJvmXq54px+TSSqp
         vrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559022; x=1787163822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CHx1iwCwh21fCkE+4XWz3PtqrzLKNwwReumRsHpQLk=;
        b=iUWCaFXMFayE2xMe5hv5Yr6Y0O33sWNRMqG0PFP7YPtaSliGB4UR+nhVF451dvRnnM
         aUwo63SQKuwwPHh9CIo0lRBBiGPSUCiTbLUP7T431oFo7PevXghg1BANRmlrjEW/mNV+
         RegrENyamyVpKeQPKWNjfem0wKTuHasoAs5wNpp+KLgnru3etu86BG3NregvfxusvvXu
         NtBK0xWfytm+TEUJdeyN+j4MaT4XojXosBNOiahwT7cDiyhYMz7Cyt8IAW+j7Rv1Di1r
         ZMKpSCjOQ0uxL09Rb7nFlBBXc6rshONN69PLhcGOMQHuSJ3Z0K0Q/xrplS/2wSbi/Ixu
         Ee+Q==
X-Gm-Message-State: AOJu0YxYSjY0VNFRQc9KBJVFtqUz16hnsaXoCXlOZZJRbK9UST84ZVQA
	hGJUFRLrzsjnS8evfbVvHqdxnAqS2Ma7CYxUiDGdUfEWcXaht+EeNA80
X-Gm-Gg: AR+sD12xP0QjjTd6BasXKqEwMDVbVAFcDwFz49NiLC3uV8PGRZ3urIEylHqW7zb8x2S
	yxU750S4AdgBNKrq73kd+OyfsVewJlfGE+htJulhrXV4Os66csDoXta4wIXJ4DZpE+dHfLCQnyT
	GZiLgo9pEyyRVrwYkjQ/B5pQy75j0QAq1mbgzdPu0huJEqG2Q1GR/zQ+vZw444QZUv1y9gk43qI
	3A4UN8OesDDM57UBA8iysMpJOaNjMkkRpAK2WSaB4NxBrnbk2VRXloasAnr3tvzqggY6k8EDELW
	kRRsZ98+sTSlHFED461CGg3XtkjPvTDzvcBF9WsmBFRpVaJNKsqQjm6zQd3rFODWz8N2hwpGuyd
	D3lMQNHZX/j09c0IhTrwuJVMj7G0iDXe+99cU+WtNxLqE4LuK3Rw6B6xhkBJ7qnO6yQ68c77Kxx
	xBB3syEpxBFh9T/jKb0ZlOLBs2fg52Ms5JCT3i72E3hFdsFRcXqOppQzA5D1RY/G0WTgQ7ByKSp
	mY=
X-Received: by 2002:a17:903:124a:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d371d81b8cmr13174645ad.8.1786559022336;
        Wed, 12 Aug 2026 11:23:42 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:42 -0700 (PDT)
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
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v3 2/6] docs: sphinx-pre-install: add macOS Homebrew support
Date: Thu, 13 Aug 2026 02:23:19 +0800
Message-ID: <20260812182327.53694-3-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812182327.53694-1-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
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

