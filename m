Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD43F4DFC
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372406; cv=none; b=ixEV366ERAUXKujS7oWC9olvcs91i8BBqp1O/6IcbjHUBdZZmmL4bIeLGD3J3fFsseRC1kGIGDyFbH+aW38lnXtSa2rbJPo3wzGMupJrSr3Ei6jrpaRkdPQbXBDuyxCqO0hakXGSgg/twwnuNI2A6/Tsv4jl+c00TEVY3VEY97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372406; c=relaxed/simple;
	bh=6/wSjlMr/KNyZmqRuyV2PMhBMKI664SqeBp2S7tEdu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLqtaPSr53Yg64+Hh8XWwHTGkfFyOLo3AJjE8smYwL494kWtW2dBn/cjDRinjLmUsdFIhw+U8S6D1wB3oWVTutvgUDXc3jORMJdhCRZ/yQgMc21rzLnzW8KOkXCkm6mX2/+jyrHWG5oCOmJmklIqRXZoexH67mCRjlroWCCTmXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHznw/yg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHznw/yg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1331871a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372404; x=1786977204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GPUA3qfNyS6NHODtebpstn+B5QpoZwQkRGKMZKYxpg=;
        b=jHznw/ygG7pQZDmaQ6Q+fHZkUyw5ZNQt2cGblzBViaRe3sx8szKYaV6llf6IfwpVjn
         V5fhvKTPS4MqDmRoCrFURJvbSEFtFDcwSEauvmO2V+sTzoIUWmmakWjCuojxn4I9VwRZ
         4StAaUZkqo195clBF0V6ytnKmjcEe1Wy7OzXhPWXIVsIxYuCljt5/vnV1SBIxAqPxUVT
         rPEv5fFyJoE2igyQm2wj7CMzaYI4iBWqwgOTL1nxnmwXRIltSyJVAB2LXKeI2RjzgOST
         YodIRtEzY6yZ68YsIWdsMGSdcfE6r3xHSUnREUSkFYdQls/maq7Ypmfwzj8jad4tkhMU
         Avlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372404; x=1786977204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GPUA3qfNyS6NHODtebpstn+B5QpoZwQkRGKMZKYxpg=;
        b=i1o/PNa95czz4bVrcn1notu950RwodSewOf4c8o19xnl+y0he3UjsO2BVl9TafUaY+
         Y6YNeN9h8am2pypmZ1y3nmA7koOSNFIUlgpigHI0nAro3NjSECsdSi4oJSOFZH2egBD4
         yhoD0d4thZuxEIidZKPy7bkfP6isSll2hXDLduf8SDaz5mQNKWruL69kDDmP4s7kaODd
         92FFIxgiyr67WzDsI5UEdGi/jwANQM8WU4AJrbjvbX7D1XvQB19S4/KJznJYAc14Kgru
         WG2NEbmR3W9vTCL1j7sFezpKIwsFobBt/NP6sFu82c8eEA8fZgWE4WYqVag/uQmj0QC+
         pazQ==
X-Gm-Message-State: AOJu0YzBQMxWoPou1tTAcfk5bZ7hCpb5L4pEu51KwBToO0K8NIYe8rSU
	n1w2eIVcTastpWlqrM7G84JA+zjNdOxW97YDNL5goTG9mga30wGeb4zA
X-Gm-Gg: AR+sD13CZUhplPz4VULHGv19jk+affAsBGMifikGgQpJbr/mgFySwrW9G+vZPF1jMan
	Iu5vyyvlOoRrEp8MNsDmJQH+B3tOXDoBtjIR0k+wXsEuC10s7FjPjJV/jFUFuhVXeGHaYdB+n4S
	9udx1CIqGUBs5XfGFNP778EiPnfTXuO5ElrC0CMmHBMZQ/EQ1ASVRPxzJAx4dRakxC5BbpbWazK
	8uIMI0csqqWF0jyLwWsiceUT8QKropFZaz1SyiL6HDrXQq8cMQmdwu6y1zVD3HWPDoodd7jRF66
	d8VXSIIAgLWcGKxS2tOnTTnSS13VPoBCvwN+Vr0MT8QVQFDk4WMKPgGTIYmZ3TAcam+TG7Sly8D
	b3BVAK5hR4tKLUYUmox/Brg4M0Qqe7Ro09hohsPKEmsseGEk+DrbeKXMgNxleSrBWZERDcAUqIR
	kYpmEauy1g+fHj6DSABeFOILEdplIr94Qa6EUhaV1bHvqbtWSJBwxnnHX9JqatKOD4UZvAkiqIi
	WE=
X-Received: by 2002:a17:90b:390e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-392823ea541mr19035970a91.16.1786372403647;
        Mon, 10 Aug 2026 07:33:23 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:23 -0700 (PDT)
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
Subject: [PATCH v2 1/5] docs: sphinx-pre-install: add macOS Homebrew support
Date: Mon, 10 Aug 2026 22:33:05 +0800
Message-ID: <20260810143311.57775-2-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810143311.57775-1-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependency checker currently reports an unknown distribution on
macOS and cannot provide installation hints.

Detect macOS and include its product version in the status output. Use
Homebrew for formula dependencies and install the command-line-only
MacTeX cask without sudo. Only require Homebrew when dependencies
actually need to be installed, install the DejaVu and Noto CJK fonts
needed for PDF output, and explain how to refresh PATH after installing
MacTeX.

Keep PyYAML in the virtual environment requirements because Homebrew
does not provide a PyYAML formula. Document the macOS setup, the
--no-pdf option, and how to create a case-sensitive APFS volume before
cloning the kernel tree.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/doc-guide/sphinx.rst |  18 +++++
 tools/docs/sphinx-pre-install      | 113 ++++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 1 deletion(-)

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
index 965c9b093..1b9d77ec3 100755
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
@@ -1458,7 +1565,11 @@ class SphinxDependencyChecker(MissingCheckers):
         self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
         self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
 
-        self.check_python_module("yaml")
+        # PyYAML is installed from Documentation/sphinx/requirements.txt in
+        # the virtualenv recommended on macOS. Homebrew does not provide a
+        # PyYAML formula, so do not ask for a nonexistent brew package here.
+        if not (sys.platform == "darwin" and self.virtualenv and self.need_pip):
+            self.check_python_module("yaml")
 
         if self.pdf:
             self.check_program("xelatex", DepManager.PDF_MANDATORY)
-- 
2.50.1 (Apple Git-155)

