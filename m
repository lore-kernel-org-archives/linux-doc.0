Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C173CA4A9
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270780; cv=none; b=cAsmtmT2Sfgz2tt+2ldOzDPnIh134bnwFQ+Dez3JRlHabVy362rQIIeN/3FBlRmb9pLbbbERQLjuPb0HW/9Td59pWh0iY9Zl9oXBTzwuPrdl58UGBTh2fpl/cg0Uu7cFKrfgdlwAdaKWIrDsbW/ntLh2EiZJUVbxDBvP8Uyy1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270780; c=relaxed/simple;
	bh=XFpa9qqJHXQ75q8ftQFv3NfSfTXAQFOerS7OCU49TIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3s29PLNOXem62F/zi9YIZRAt1IHdDwB8nTvXhBSuCav4AQ1Y9kAiYqwCsfrD+xoTtdfojUuJGI62lCSlPT7SKeBZVM2umibyu7AudIt5zCqaMSUOzssyq51fTKr7RxsngtJvoNKqC38cBvUL0h+rQfsgY3KXsvTxvvtMAs6FB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyHv7c7C; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyHv7c7C"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so937045a91.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786270778; x=1786875578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0GQIEu3grCj2nut7YybPJeaOsz3yt22QKb2C8hAm64=;
        b=VyHv7c7Cuakcji0XWr4pXZ07xwrATIupaNHN6P/s5CdgdmZ410T4d4his2R4eFj3UH
         tFusVhnFhAOMYgNeG6j8Znyj9HiqUhC3ui5UugmP+GJIMHhdZuoiiqpypv7MrmcNbGc2
         usVP/n5XCMdfgYgdhK6xQn69CjB40w4EQrobxuo0VVw8uUOBKDUqrDFYkY6RXel0/39s
         AUpQzE/27xgrydOujU5qmZlbQ9bYdmui7sMN3kSkv+7adV8g8MDH30hZ/RGysTe/1FBZ
         fscJXoSw/jYgqJpLJjJTuyV5fkADo1+Ea3WM8X1LUb1ri8DZMfJ38movnW/xGMFqtJw1
         xefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786270778; x=1786875578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0GQIEu3grCj2nut7YybPJeaOsz3yt22QKb2C8hAm64=;
        b=eO6x8uBYDDrhfZC1dSkBZYboyNfRlwGYV9OgT7XsqeLEeqEUQfjhBulGlvYJyMc493
         6iVGoO2ELFrivrZaGF6mOVn8xWaFG3O+YlTOx0hzm/h+itw6DzDgZZk500Q0JozRp/nI
         9MVJBmx4lOFeiIwXDqEWjxWa0vrstUD5CmPW/0cmTLvXBTnenUbIQhvcuDI9Aff+ZOOc
         THPBWkB0vgikynmRwoDN+BXc0dMa5cxi4Yl2XsOJbNtBg0aRffrule/M8RbJi/sSFYU0
         RCa98s69T86nLhYT8HJNFHtkBUbYz4UNz8bH5umW5zXo++Wn7eIREzvZrSFhIwgRMZMh
         mJVw==
X-Gm-Message-State: AOJu0YyqPahr+glXHlsZFEbe64g/4W0yuw07jO/A8hC8Vt8F0Sl74Xm8
	LrSx4YjPEyUHlj6bMOfBGtWtdvKdaJNjdu+2utxtmPf1yyOB6unFviXO
X-Gm-Gg: AR+sD13IP8o2S/6uXZYtCTgjXWoLlYzm1map0mSrPNneX0V9aSzQ8MMmI+vXS7KZ+vf
	QZu8mcv/VwHWZLlzfFMQ4+Roa4rgQwpwWAQ+X5zdPoq4U0PiSwh2icWMw5sx4ESbKF+3XQXUzSQ
	xzRgTcOop89FMt6Pl4QFThCKKMOmwq0lqmUCL2AowYGMRHQ+JeycFQPpt2VcHfzh/GuW/wF//fE
	s4uteNur7IJcRi9KMJAoAmAy91+Y6FfqcDlZI0lW1IU1SBn8+G0ltVf3BZddWN2Na0NlI2XMaxB
	2nI0QxLyqNZ9PXWne8m2gAT0dKXKWVdfBxBtOU5QWG3ALbsyBgGzErqh6k9pv9I3D7LaQrEclSZ
	w0tbaaDfQfwFgkBOo5SnEEbDJeau9JAeL0pD1wn32MABUm0m2Xb9J0rFqOqOxkaSWtEg4F2xJO8
	rE//LmpYoCdWySEPFPB3q+u3JGHvedIfx+CPqpRfqJoys7Rf2gp7UZfYJPvq2sybZ+iyjtIc+bL
	10=
X-Received: by 2002:a17:90b:3a81:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-3903c634c04mr28765977a91.21.1786270777871;
        Sun, 09 Aug 2026 03:19:37 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm31496134eec.7.2026.08.09.03.19.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 03:19:37 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew support
Date: Sun,  9 Aug 2026 18:19:20 +0800
Message-ID: <20260809101923.13176-2-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260809101923.13176-1-chenmiao.ku@gmail.com>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The dependency checker currently reports an unknown distribution on macOS
and cannot provide installation hints.

Detect macOS and include its product version in the status output. Use
Homebrew for formula dependencies and install MacTeX as a cask without
sudo. Keep PyYAML in the virtual environment requirements because
Homebrew does not provide a PyYAML formula.

Document the macOS setup and the --no-pdf option.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/doc-guide/sphinx.rst            |  7 ++
 .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
 Documentation/translations/zh_CN/how-to.rst   |  6 ++
 tools/docs/sphinx-pre-install                 | 89 ++++++++++++++++++-
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 51c370260..62aca56b8 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -131,6 +131,13 @@ It supports two optional parameters:
 ``--no-virtualenv``
 	Use OS packaging for Sphinx instead of Python virtual environment.
 
+On macOS, the script uses Homebrew for system dependencies. Homebrew
+commands are printed without ``sudo``. The PDF dependencies are provided by
+the ``mactex`` cask; use ``--no-pdf`` when only building HTML documentation.
+The default virtualenv mode is recommended on macOS because PyYAML is
+installed from ``Documentation/sphinx/requirements.txt`` rather than from a
+Homebrew formula.
+
 Installing Sphinx Minimal Version
 ---------------------------------
 
diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
index 3375c6f3a..154142318 100644
--- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
+++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
@@ -110,6 +110,11 @@ PDF和LaTeX构建
 
 	使用Sphinx的系统打包，而不是Python虚拟环境。
 
+在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
+``sudo``。PDF 依赖通过 ``mactex`` cask 提供；如果只构建 HTML 文档，请使用
+``--no-pdf``。macOS 用户建议使用默认的 Python 虚拟环境，因为 PyYAML 会从
+``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
+
 Sphinx构建
 ==========
 
diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1..e8c91d81a 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -102,6 +102,12 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
 开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
 您通过 pip/pypi 安装最新版本 Sphinx。
 
+如果您使用 macOS，脚本会使用 Homebrew 输出安装命令，Homebrew 命令不需要
+sudo。PDF 构建所需的 MacTeX 通过 Homebrew cask 安装；如果只构建 HTML 文档，
+可以执行 ``./tools/docs/sphinx-pre-install --no-pdf``。macOS 用户建议使用默认
+的 Python 虚拟环境，因为 PyYAML 会从 ``Documentation/sphinx/requirements.txt``
+安装，而不是通过 Homebrew 安装。
+
 如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
 sphinx 虚拟环境，即只需要执行::
 
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093..51a296cc7 100755
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
@@ -716,6 +734,69 @@ class SphinxDependencyChecker(MissingCheckers):
 
         return self.get_install_progs(progs, "apt-get install")
 
+    def give_macos_hints(self):
+        """
+        Provide package installation hints for macOS using Homebrew.
+
+        Homebrew formulae and casks must not be installed with sudo. MacTeX
+        is a cask, while the other dependencies are formulae.
+        """
+        if not self.which("brew"):
+            if not self.distro_msg:
+                self.deps.add_package("Homebrew", DepManager.SYSTEM_MANDATORY)
+                self.deps.check_missing({})
+                self.deps.warn_install()
+                self.distro_msg = \
+                    "Homebrew is required for macOS support. Install it from " \
+                    "https://brew.sh/ and re-run this script."
+            return None
+
+        progs = {
+            "Pod::Usage":    "perl",
+            "convert":       "imagemagick",
+            "dot":           "graphviz",
+            "ensurepip":     "python",
+            "python-sphinx": "sphinx-doc",
+            "rsvg-convert":   "librsvg",
+            "xelatex":        "mactex",
+            "latexmk":        "mactex",
+        }
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
+        for prog in self.deps.missing:
+            if prog == "yaml":
+                self.distro_msg = \
+                    "PyYAML is not provided as a Homebrew formula. Use the " \
+                    "default virtualenv mode so it is installed from " \
+                    "Documentation/sphinx/requirements.txt."
+                continue
+
+            package = progs.get(prog, prog)
+            if package == "mactex":
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
+            return None
+
+        return "\nYou should run:\n" + "\n".join(commands)
+
     def give_redhat_hints(self):
         """
         Provide package installation hints for RedHat-based distros
@@ -1138,6 +1219,8 @@ class SphinxDependencyChecker(MissingCheckers):
             re.compile("Kali"):                       self.give_debian_hints,
             re.compile("Mint"):                       self.give_debian_hints,
 
+            re.compile("macOS"):                      self.give_macos_hints,
+
             re.compile("openSUSE"):                   self.give_opensuse_hints,
 
             re.compile("Mageia"):                     self.give_mageia_hints,
@@ -1458,7 +1541,11 @@ class SphinxDependencyChecker(MissingCheckers):
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

