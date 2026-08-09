Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813093C4577
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270784; cv=none; b=sBaQyFbaezVvh6cbFAaloVr0VwZfzEXQcGPE5sp52/ntZyoTe49qIuFLlqdASm+nVQaUhDzh4zrAC4waiUUqtSTKSVBhbxEoQ1xkU7jipClCf4reNjnPgkTkIBzvSzZeH3fJtXaVSDj6xuhgWVQy1rU8zp97i1iXvICwyVTwnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270784; c=relaxed/simple;
	bh=/i6kEpz5wmIoaseuOyVhaNR4V1C7KIvR8SZtaPFOafU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWSTfcT8bg//1bUsvtpvkjdCGM89K7h59LXwcKJd/JRAJlH3XqhoWfclYMtkrlQNAqp0EKp6wbtjReh3DYcfbQmlLUBbJ9uxV5AvCxUBbW+SGhtJFsAN2Qkp2WLAtBfCjR92KcHAtr61MHUeuIwno7R00Pe+J/uUPyxh+f8Zs/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MD8gvEG1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MD8gvEG1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso624007a12.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786270782; x=1786875582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPwYJ1xuRDlGdV5WCrmZ+pmRm2w/eGmXKPl/ug4pFzw=;
        b=MD8gvEG1S4t/EuEALsziJ670Hz8OlFs1HqeBNS7nXYDZWEnHd9lD3OMKTJGYgcWITw
         +B9+ECDn0b3bg3obZrBe01PQDhMA72R3RvJJ5wq3YdWBD97earaBDqV3xF1DQOsfHSzr
         uFtSJXMrEThfHfwjQlLXSUE6y2TpTEmqXUojhK09DLrjyAHEIgmQKSaPoZst/rLkz+gJ
         lvv35UtcA3rqPhXtwIK/9gvbfDmLd/TLn+znl/VjtUPA3PGXD1csKzrfLlg3nuKaSz/G
         S9D9ba11zQt/hdrgEIzWHPAhH0T5pB0J6fplL3qWwC7LWWH2D4L+ooJr0P6qlcocOoWe
         IuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786270782; x=1786875582;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPwYJ1xuRDlGdV5WCrmZ+pmRm2w/eGmXKPl/ug4pFzw=;
        b=sNg/qQBb7qRNbSIzLGxKIGEnyBMdwPEB5soGFvwP+eJRGN3E6n5WNDbrzpDlUHzoPV
         NzKTofmaKOpowo3ilEXPPj8rh8/PhxWL2n1aChq0+RQYsGjTFro0fTqZXX4iLTUzDs5+
         MR6UGet5Gwq5ZLf5mERdxBsE08vZoylDmcL5lGzgdIp1+aAz2DS/8CBluB2Sz2uOD3yE
         83fkW3qF/GT/kaQ7le6mR1qafaQZ8UQP7yB+Vj4Y8Wdorz8mxOnv3POa+uPfbkc8Lyq+
         RQWt6MOQrk/QkFe7wr9zTeVIJjHmK4QCjws7X4HfIEqVJ+ye9KNUzrAXffTzMtoJ8k3F
         VtKg==
X-Gm-Message-State: AOJu0YxxBHCcRB+MPE+Rn4C/WCjup1+UAYu8zQ9LD2KO4nGIgBMyIPMx
	eCRDzxaMd4OozyaMwKIQ6POYS/8Tqqkl2rfFD1zaoSKYpzz6GZxQO2XF
X-Gm-Gg: AR+sD11LpuIwsqd+H/cDWJXVSfeBRFeEzT09TpCbst9o4gukXco7kW/J0q5q5/qTb0Z
	/uo/6xdAxlV7NWtVUjeIMt5X5C6mDBkrtO/dYR5/kYDrKKHfR7yDvBfjKNwUutxFHBWU6PwI919
	kJG5XZwaHfm7NqL3LdpZRAls9mnT5UAThGkY9T+VIWixSRR+NFy0VdrNphvCb8Xz4+LnszNxu6I
	8oHyooDigp+ck4BNSI9lTJo7DV/SachCeXgQsAe0gvZ4nhNdd+EwSM87p0s1FP4+jtOpq5Dhxpf
	lhMVvVaMl4DEyObPhk1dpkh5RsHbF/jRUVswKglGLP9TCjjWR7Hqrg+sdMYsvdrEafgGjuS9oT5
	wl97kDJRdWaIuC8pjg8B9tDpTwXwWYO6OGA2mD7j5zkIIDQ8OC+NoiH06njrmx9Pkk6ef6IL0wK
	/x37Aud6iA9nE3ZxuP8m5x/Sy/YwAosf2ZapvCwR8I1aQDOt7sNNHfk+cUJwXo+0a+59WY9U9wq
	xI=
X-Received: by 2002:a05:6a20:9e48:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3cb85ee77c2mr46113590637.25.1786270781667;
        Sun, 09 Aug 2026 03:19:41 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm31496134eec.7.2026.08.09.03.19.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 03:19:41 -0700 (PDT)
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
Subject: [PATCH v1 2/2] docs: sphinx-pre-install: check GNU Make version
Date: Sun,  9 Aug 2026 18:19:21 +0800
Message-ID: <20260809101923.13176-3-chenmiao.ku@gmail.com>
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

The kernel documentation build requires GNU Make 4.0 or newer, but the
Sphinx dependency checker only verifies that a make executable exists.
This lets incompatible make implementations pass the check and fail
later during the build.

Check the GNU Make version on all supported systems. If make is missing
or too old, report it as a missing dependency. Also accept a compatible
gmake command, which is how Homebrew provides GNU Make on macOS.

Document the requirement and the macOS gmake fallback.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/doc-guide/sphinx.rst            |  4 +-
 .../translations/zh_CN/doc-guide/sphinx.rst   |  2 +
 Documentation/translations/zh_CN/how-to.rst   |  3 +-
 tools/docs/sphinx-pre-install                 | 52 ++++++++++++++++++-
 4 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 62aca56b8..d9b9e025f 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -136,7 +136,9 @@ commands are printed without ``sudo``. The PDF dependencies are provided by
 the ``mactex`` cask; use ``--no-pdf`` when only building HTML documentation.
 The default virtualenv mode is recommended on macOS because PyYAML is
 installed from ``Documentation/sphinx/requirements.txt`` rather than from a
-Homebrew formula.
+Homebrew formula. The script also checks for GNU Make 4.0 or newer; when
+Homebrew provides it as ``gmake``, use ``gmake htmldocs`` instead of
+``make htmldocs``.
 
 Installing Sphinx Minimal Version
 ---------------------------------
diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
index 154142318..93f27d35a 100644
--- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
+++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
@@ -114,6 +114,8 @@ PDF和LaTeX构建
 ``sudo``。PDF 依赖通过 ``mactex`` cask 提供；如果只构建 HTML 文档，请使用
 ``--no-pdf``。macOS 用户建议使用默认的 Python 虚拟环境，因为 PyYAML 会从
 ``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
+脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为 ``gmake``，
+请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
 
 Sphinx构建
 ==========
diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index e8c91d81a..84f277124 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -106,7 +106,8 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
 sudo。PDF 构建所需的 MacTeX 通过 Homebrew cask 安装；如果只构建 HTML 文档，
 可以执行 ``./tools/docs/sphinx-pre-install --no-pdf``。macOS 用户建议使用默认
 的 Python 虚拟环境，因为 PyYAML 会从 ``Documentation/sphinx/requirements.txt``
-安装，而不是通过 Homebrew 安装。
+安装，而不是通过 Homebrew 安装。脚本还会检查 GNU Make 4.0 或更高版本；如果
+Homebrew 将其安装为 ``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
 
 如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
 sphinx 虚拟环境，即只需要执行::
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 51a296cc7..079655078 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -40,6 +40,7 @@ from kdoc.python_version import PythonVersion
 
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
+MIN_MAKE_VERSION = PythonVersion("4.0").version
 
 
 class DepManager:
@@ -308,6 +309,55 @@ class MissingCheckers(AncillaryMethods):
 
         return None
 
+    def get_make_version(self, cmd):
+        """Get the GNU Make version, or None if cmd is not GNU Make."""
+        if not cmd:
+            return None
+
+        try:
+            result = self.run(
+                [cmd, "--version"],
+                capture_output=True,
+                text=True,
+                check=True,
+            )
+        except (subprocess.CalledProcessError, FileNotFoundError):
+            return None
+
+        match = re.search(
+            r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULTILINE
+        )
+        if not match:
+            return None
+
+        return PythonVersion.parse_version(match.group(1))
+
+    def check_make(self):
+        """Check for GNU Make 4.0 or newer."""
+        make = self.which("make")
+        version = self.get_make_version(make)
+
+        if version and version >= MIN_MAKE_VERSION:
+            return
+
+        # macOS commonly has an incompatible /usr/bin/make, while Homebrew
+        # installs GNU Make as gmake. Also accept gmake on other systems when
+        # it is the only compatible command available.
+        gmake = self.which("gmake")
+        gmake_version = self.get_make_version(gmake)
+        if gmake_version and gmake_version >= MIN_MAKE_VERSION:
+            make_name = os.path.basename(make) if make else "make"
+            gmake_name = os.path.basename(gmake)
+            make_ver = PythonVersion.ver_str(version) if version else "unknown"
+            gmake_ver = PythonVersion.ver_str(gmake_version)
+            print(
+                f"Note: {make_name} ({make_ver}) does not meet the GNU Make "
+                f"requirement; use {gmake_name} ({gmake_ver}) instead."
+            )
+            return
+
+        self.deps.add_package("make", DepManager.SYSTEM_MANDATORY)
+
     def check_perl_module(self, prog, dtype):
         """
         Does perl have a dependency? Is it available?
@@ -1535,7 +1585,7 @@ class SphinxDependencyChecker(MissingCheckers):
         # Check for needed programs/tools
         self.check_perl_module("Pod::Usage", DepManager.SYSTEM_MANDATORY)
 
-        self.check_program("make", DepManager.SYSTEM_MANDATORY)
+        self.check_make()
         self.check_program("which", DepManager.SYSTEM_MANDATORY)
 
         self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
-- 
2.50.1 (Apple Git-155)

