Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E33F86E7
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372412; cv=none; b=DpSkvFLJX9RALWa/5aKCP9MxnbioymVzIkPqvRjxqx6ZWoPRo5QU2KP2guuzH+DmExTdVSbKSRoDHQN4n3A40LhQVFfqDwqzENyTLFM7Q1kwPFJPI6JbtmYB3lHX3fSPKdLqMV/qZNLZSwm+m7d3a2m9GK5vxwMg/0qWfj+bSPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372412; c=relaxed/simple;
	bh=64TB55FHYFwfaYz9gCVrUPYWAOUkrsbqFhpR+gClBKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9Mrw5XVaCl8yIaK2keCNUABqOBW4V/gffz/ZHOrMVFBgazY+d8RHe/2nFS10Fk1KdzhiXg+pqJcEcPFs9rAjpfwZQXhM1WhTucEcu+Tb3QkkoILKPhHi6+jDx32QAeupOVz42ZMAcM+Oql7PG34onulvOSX+rA0TY2z4mGguzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzQvdwry; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzQvdwry"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfff5f88dbso30154015ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372409; x=1786977209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mW6857ZUCKMxTWq8NsQePygvrLZZIX0lwqlDz2Pl/S8=;
        b=LzQvdwryqh/oRypoaAwf9nrotr1vFHaayuFEFk9n1CSCYkXdkCPJClrUF4SP0mU1dF
         KJOHdYwM5ux1pJjMJK8ZiYhT5Opkwp3/dkrsFa71AeubkmLePUBvUl4prVKcyfJLYK1l
         Fi8QTTPzG1sN4lZ0YtWCG31VvCxMzV0qvm9yc6vIIniQDLmazemLKFC7yBeu9KSzR/r8
         6KgU33BcxI0T6gBzSP3b2ko3rWh9LVrJ9dNv6Jml3K8T5p786eGSFdqqo9UKn+vCnotK
         d2qXXHLTaGb5yl/bsk7NZ+IIOj/a1ikT3Au0fem+eZzsgaWhBklrlPrIiVYoWYXZTizC
         BxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372409; x=1786977209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mW6857ZUCKMxTWq8NsQePygvrLZZIX0lwqlDz2Pl/S8=;
        b=Cqop1hz6stywOTGREnlOQeRmkruNWaiyWl+MyDXCHHZV5RBAIzxbSXv0TATk1Zr+ke
         3Rk9y3vWwm6HMNO35Jiq212MWGHH0SXGkxRxQLr9nIpH3TJeWRqOA35f7FmuXRC969KG
         uFEanBNgP2zmPTVSApqjZ4rED7DVVrhtRP6nDUYaxtpWyDHgGM8vk2Ko+R6J8EMdK5dt
         gohFBtRcdcprjhPnL2a3Rf27ITi9mBoPYFjbMU9Z1ic9GCEicBSoO+9uiQJpamCtHYdX
         aAXl8HcnyVnDcL4gnk8hR6myEpVIs7CVkiueZ7XsL2piuhE9KfSDsTPs0rngAAGYjS/T
         BBpw==
X-Gm-Message-State: AOJu0YwCGZ4Vbnc0qxu8vCEyOFtFJ0CwApvphGcxkHFo47y06tNkklqr
	nTpnfKntLn/UrxNk1yJcI4szlr74husEu5eHvbf47LkYqSXEw4l/qlhS
X-Gm-Gg: AR+sD13+MgWlslmNyUE5cfBWlWc8wVIWlx6yeysT9hSOn1PLdkThEYoTTkCEN6e1WxA
	x6xcPUsovggpAiZOEzzKp2L0ZSA2nPEkh4QNBUOi35w76gtmp7Ah5hheiazodG6FbinknYsCslj
	dB0wlXmSsT8D5GLa/tzqIGHU7hxEjgRkMO0+wxFv33m4WjqljeCFFIFDpy+Na/URjN9GoAyWYoN
	U6GmJreYOXg6UUtfEPQIq5Snkrj9nNR1ZQzcYaYTyW7JQJY7xMiq42leXve1NdtkqGWdIEnn6s2
	/zn9Er901xAXF+bKoQ4W9GtwuEGhLFp8OWqVRdf/CQDJgzgqlhIX5KHk8eYg5jsyIuGJUr9aDhB
	wZJ0rcauvvAtA5pN7YDF4bgzxUqwnukaUT5dveSHDv+1jCivXZDvL/bwAWoDre8J7eb+0QqgaNU
	kkAGnXEXESp02R5tFycVbRSLbqn3nXMNOdAnGyLaI1KD1QJ0AGHyyFOWTkMusXkhc9iadIsQ1rw
	CY=
X-Received: by 2002:a05:6a21:3a44:b0:3cb:eb06:ce09 with SMTP id adf61e73a8af0-3cc1a38a664mr3122778637.25.1786372409128;
        Mon, 10 Aug 2026 07:33:29 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:28 -0700 (PDT)
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
Subject: [PATCH v2 3/5] docs: sphinx-build-wrapper: prefer gmake
Date: Mon, 10 Aug 2026 22:33:07 +0800
Message-ID: <20260810143311.57775-4-chenmiao.ku@gmail.com>
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

Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
wrapper invokes make directly when generating Info and Rust
documentation. This can make the dependency check succeed while those
documentation targets still use an incompatible make implementation.

Honor MAKE when it names a compatible GNU Make. Otherwise check gmake
and then make, selecting the first GNU Make 4.0 or newer. This keeps the
wrapper's selection consistent with sphinx-pre-install.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 tools/docs/sphinx-build-wrapper | 55 ++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 1bb962202..aa6a297db 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -71,6 +71,7 @@ from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
 #
 VENV_DEFAULT = "sphinx_latest"
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
+MIN_MAKE_VERSION = PythonVersion("4.0").version
 PAPER = ["", "a4", "letter"]
 
 TARGETS = {
@@ -97,6 +98,46 @@ class SphinxBuilder:
     with the Kernel.
     """
 
+    @staticmethod
+    def get_make_version(cmd):
+        """Return the GNU Make version, or None for another make."""
+        if not cmd:
+            return None
+
+        try:
+            result = subprocess.run(
+                [cmd, "--version"],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.PIPE,
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
+    def get_make(self):
+        """Select the first GNU Make 4.0 or newer in preference order."""
+        candidates = [
+            self.env.get("MAKE"),
+            shutil.which("gmake"),
+            shutil.which("make"),
+        ]
+
+        for cmd in candidates:
+            version = self.get_make_version(cmd)
+            if version and version >= MIN_MAKE_VERSION:
+                return cmd
+
+        sys.exit("GNU Make 4.0 or newer is required")
+
     def get_path(self, path, use_cwd=False, abs_path=False):
         """
         Ancillary routine to handle patches the right way, as shell does.
@@ -569,9 +610,10 @@ class SphinxBuilder:
         texinfo directory.
         """
 
+        make = self.get_make()
         for output_dir in output_dirs:
             try:
-                subprocess.run(["make", "info"], cwd=output_dir, check=True)
+                subprocess.run([make, "info"], cwd=output_dir, check=True)
             except subprocess.CalledProcessError as e:
                 sys.exit(f"Error generating info docs: {e}")
 
@@ -787,12 +829,11 @@ class SphinxBuilder:
 
         if rustdoc and target in ["htmldocs", "epubdocs"]:
             print("Building rust docs")
-            if "MAKE" in self.env:
-                cmd = [self.env["MAKE"]]
-            else:
-                cmd = ["make", "LLVM=1"]
-
-            cmd += [ "rustdoc"]
+            make = self.get_make()
+            cmd = [make]
+            if make != self.env.get("MAKE"):
+                cmd.append("LLVM=1")
+            cmd.append("rustdoc")
             if self.verbose:
                 print(" ".join(cmd))
 
-- 
2.50.1 (Apple Git-155)

