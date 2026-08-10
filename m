Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7F3F4DEE
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372409; cv=none; b=MbJUk5Gdeq+T3ObioslbdlNwQMYhNysg6uYDgXytehKXSs1GQWuZvm6ONp/hKbHQc+07sgaIbgkpmcS6sYen1ew81MMrhvT9AZ+fyvCo27/+Bh4YnxKLKahff/BG9rK512g9hUdGPQaoEnD4Q8IAASphR6tgijiRjQ/AXjv3w88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372409; c=relaxed/simple;
	bh=SkWJziYAltGYw0TJ8LmA/O3aXe/nbpzfJr3gzN3OpRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Md3gcmNkb3oUAwUIeOL8kFTJN73g5iI3X36AwDIUmwBqbXxnt+w52ZnG4+sA55WW6GUB2ivYduDdJRJSUyjLLIVns/yt3nXb8ooy8MtC4qAQ7h12+EDJZL6QGcl3IEGvw/hMGhzffW2Ao/ZsRvxatO7UK56g1SMtvcgh5vUy9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNSaq1mL; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNSaq1mL"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1809658a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372406; x=1786977206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eGPyLBs9QZ3Nwm6ypDb5+mFyEwjns3mEiwXdV8ptF0=;
        b=GNSaq1mLmI2ROmYXZ/l5mgBpfoPgjNKryi35qJsNK5bTr26ACuah7ZUoDMGEWKWs4Q
         NLINFVRSM8twcHEk8VlF6IhMFbAZHs+dKcAftF2ay2ahKi8G/IH3fCDYQk3wbwvv7iMW
         aJ4m+q3vYR8MX50BG/euYuGxEH+P2HiVyXdsvfyVSGCKmZqae3anu38hU4xMuCqSP0Te
         cAqklaQNJFXVl8GqOHC1MCfkjlQ/JaI3XsJb/fPamwfBHdmW90jc2Z41fEV2EWdtsphc
         qVrRIbwDB/ec6YMFfmdgKQqXkZ8BNSfCrCl2Q70XQruwA9r4x+k2rxadwqc2zj5jHsy/
         CHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372407; x=1786977207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eGPyLBs9QZ3Nwm6ypDb5+mFyEwjns3mEiwXdV8ptF0=;
        b=G3rHvzkMYNjSgtwuQHU365XV33wVNPST2pYyYCxZtLw1tEBO2+/QPybloDj+t0njJw
         tZqF5n3hjFlbPfTlYh/64zS9baxAeIxQEzqbxujn6Eb4TfhhDU92t0HMCbT2Po6ApizP
         dNSu2byYDfVXUVRFIxtaiwMxOVP9VpVCtB4zolbQx8GiS+wuTzq2Tb3zakiEXdzSpghO
         DTmxBUDEwC72heoQbIFtTRO1Jxjhh8cRQOwwyPQo9yp9OrXybWjS5PGvXIxDtpnKi0cF
         T8pM/Y56vWUk+gejOoEYypRBUW4nAvVIMByN50mqHU8JIu0Px10A9Fi+7Z3QT9fQ+RXp
         nL8A==
X-Gm-Message-State: AOJu0YwWZP7o2P6Jqvs1a9ckmJnPePfWpXsY27dvTo/eM8QHLCNc9nZQ
	iD87wqxbmorLyGitOddtAOrCHkkQjm5+qJchTwoCugQ1L5S4NvGsVdsE
X-Gm-Gg: AR+sD11afVUQsVBGxOpqXzb7Wgyg4KijnbV1SqnCGkPeXrdu6K/OvW539vq2kG5PUmA
	/rM71j6DuUWJx6L0lvMTZhu8OP/uJPU0g9SJkrZJJ9mKiPLWK6LSRbu/bunviiZoZEFJmrZVt6P
	+TqYZtHpU0Syvq8YrBJdJZCPm8eamrQ1hd8pJdpe9TwAP/e9BC6v+JvZaJXi/kk4buSoAcLgluA
	hfLOeoH9vOAc8on+G5DN69d52YG8j7OZZJxljF7VkEWmpNuH8ig3+rTyqGnSXE7K/bWGpGbrYAO
	iM+h5BAEunJCkpTEvll0y6J7+yCCaJIALmqELAm+xVD11fBQQR0EABR1/UL0IuGJWjP/Xb1HI9Q
	nBUp06Yfp56aRZ6jrITA5xnvURdQWddHPF7OsEYZShekQv4YrYMK8UQfaENqaGB9i1JFlrauUsk
	2Ams80tEji3Hox4SM5C2JLZyhzX1/jOVLkSQ7BcEjpYHHYNI1SkDe8iGcsJIYi80YWnJM59jJYV
	Ak=
X-Received: by 2002:a17:90b:3bcb:b0:392:c868:35af with SMTP id 98e67ed59e1d1-392c8683878mr3727898a91.20.1786372406427;
        Mon, 10 Aug 2026 07:33:26 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:26 -0700 (PDT)
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
Subject: [PATCH v2 2/5] docs: sphinx-pre-install: check GNU Make version
Date: Mon, 10 Aug 2026 22:33:06 +0800
Message-ID: <20260810143311.57775-3-chenmiao.ku@gmail.com>
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

The kernel documentation build requires GNU Make 4.0 or newer, but the
Sphinx dependency checker only verifies that a make executable exists.
This lets incompatible make implementations pass the check and fail
later during the build.

Check the GNU Make version on all supported systems. Prefer a compatible
gmake command, which is how Homebrew provides GNU Make on macOS, and
fall back to make. Document the requirement and the macOS gmake
invocation.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/doc-guide/sphinx.rst |  4 ++-
 tools/docs/sphinx-pre-install      | 41 +++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 1e105542a..4fb716e77 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -147,7 +147,9 @@ documentation. After installing MacTeX, restart the terminal or run
 ``eval "$(/usr/libexec/path_helper)"`` so its command-line tools are visible.
 The default virtualenv mode is recommended on macOS because PyYAML is
 installed from ``Documentation/sphinx/requirements.txt`` rather than from a
-Homebrew formula.
+Homebrew formula. The script also checks for GNU Make 4.0 or newer; when
+Homebrew provides it as ``gmake``, use ``gmake htmldocs`` instead of
+``make htmldocs``.
 
 Installing Sphinx Minimal Version
 ---------------------------------
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 1b9d77ec3..54f36c3b8 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -40,6 +40,7 @@ from kdoc.python_version import PythonVersion
 
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
+MIN_MAKE_VERSION = PythonVersion("4.0").version
 
 
 class DepManager:
@@ -308,6 +309,44 @@ class MissingCheckers(AncillaryMethods):
 
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
+        except (OSError, subprocess.CalledProcessError):
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
+        candidates = (
+            os.environ.get("MAKE"),
+            self.which("gmake"),
+            self.which("make"),
+        )
+
+        for make in candidates:
+            version = self.get_make_version(make)
+            if version and version >= MIN_MAKE_VERSION:
+                return
+
+        self.deps.add_package("make", DepManager.SYSTEM_MANDATORY)
+
     def check_perl_module(self, prog, dtype):
         """
         Does perl have a dependency? Is it available?
@@ -1559,7 +1598,7 @@ class SphinxDependencyChecker(MissingCheckers):
         # Check for needed programs/tools
         self.check_perl_module("Pod::Usage", DepManager.SYSTEM_MANDATORY)
 
-        self.check_program("make", DepManager.SYSTEM_MANDATORY)
+        self.check_make()
         self.check_program("which", DepManager.SYSTEM_MANDATORY)
 
         self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
-- 
2.50.1 (Apple Git-155)

