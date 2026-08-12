Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8162483BFF
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559027; cv=none; b=DaoG/pSsEnaQLzmUp/Td+/EhVz3B6qLsEwvwYEicfOYWvaazJ7Z5d+BL9gVbcsH7SF+VSmVMG8FyFzXjoO7p2CxyQUmRl9L0JD9P6lcJwS0E+woBk4dVVp6ARB+f9poO064WJhUr5lOSyTWlile2yBoZ7wwURJrM5jPrn0FvlE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559027; c=relaxed/simple;
	bh=JjjMb2uu1YODGgc9Ljh3eGSqXYdCYd1Db9x2dvf0KKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxpqEBLnE7XDbuoHZGHupzm5e2fB5Qlaju8wacKm0zbMTvdleQ0MSXFJyqSp0h7FCu/20BQC5URk+IWgznjQ+mf3rQPWCFX2c9jzw8zZ7+PsAOK9qetsJX5VZOq96Llt/L7GtwcBWXMvjQH4v5y9uGYGEJqtBbmps8nUnbM98M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZopdtSgm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZopdtSgm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso17192065ad.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559025; x=1787163825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr17zKegf0CAV0ad1vKq8vQpyQFYqiFtNOs4y/ElO2E=;
        b=ZopdtSgm4PPqhGGjA/j9UpWu22cdVW7ectT34IFAjTd9lDx4FcnPoZ3bVF9fGFH5B/
         Ih9DFcl4ASeUBIrAY9Y2EV63eRUvypfCiWRaDPpHENun/t6DPETYXLIml4uujFNuXYmI
         HUXFxgiLPa+otP8fP7OyuoZKNsJGFLDiyOaCSbF7Bd/N0qViuMfDpM5n0oomeWMQdYQC
         /32cLZaUdHvVWrihFeR3irMvRNtgWLo04pqdAuLgizSJ9wtRYWn6z9vZ7le8Yn4u3MLf
         speOVMNRcWAdOXsEph4M6f/wg4Qxw4aX0uD7LZawmDbxe6Nej/JvUyFDZn5Vwn3prHKn
         3WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559025; x=1787163825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr17zKegf0CAV0ad1vKq8vQpyQFYqiFtNOs4y/ElO2E=;
        b=Kpot0LC57GBUXtwwDDuvDf07zO6+gtFNzffVpyyMzmLhqpGKaHCOTC/6XIqEoC9Gzj
         WKX/y+7qyMhUGDlDo5olHolIvVyXv686PbaqoViocAXCuovXPVLeqihZJQ7ssjjnokNE
         KSh39XTbU51VSfDqGVSpGoY3REV3DxoMqPZ+cU2sfY1+J9DFMqZx9WycLR21/A3Mw3KM
         bHPQ1On7BoLLKNMKJiViZuSim3JhycLDEU70xBAUH5egVM+2ggWcgp2mOUkB7lUBqP/0
         IyDKGQj+d6g1wJSR8VFvxZhaOJle5+7t0ncFJZ8H8TlT1arQI7haa43YY+gzoStr+o2n
         o59w==
X-Gm-Message-State: AOJu0Yy4chT8jjKKAqZOjci1ORnDOSsW7vohDCKWmL48cDblPyfB2NgW
	hyTqcLc6iJ5Q1hXvxaPCquOsvQZSSN9aENHXMvIxEooevkdNLV5wG02P
X-Gm-Gg: AR+sD12vot9utfppGgR0aKJvtdj+Pz6DV7Tr9NVwaYbbddEpi3BLf9P0v2D8i2ckLJu
	PAXkLG2awr/PiL4qNO3Ltb6WmT+kg907s7Z6KlKfaG4vd3UF+jqbSqi74lLxu3es6DUdBs0Lng1
	e1n3EzKjbFM8IVVirrpIqjtRaW1Ps/XYj/FUfOK2XaOK3+Ww6cst30c5CuB75o2VPK8NGkb9hS/
	Q8yWvKWixboZBMFx79QccXCJpdjBJ5WX4UIgLZyRKqFc79poWAzqH+/XvWh5KzI5UQQPymh0HRX
	mg6qqy6HkkCAH/hwsS2yn152v2dkQIanRJtWPGCqNDwa+ELvboeOeR8DhqvUKiFr1UGN72RQjaV
	kSyOF8Vlp2G9rQm6UFPjqcBPWkaHrL8IpxexRqepOLSA6RMiXYqp/Gp8z/m7pM0K35H6Swy2AuX
	57lE8n1gScpXIrE3+bO9/NRQ/+oVNrSGosXEioTf7N9h76KRuHjUEG2J45FtmOSSuhaMXFfew9I
	Vo=
X-Received: by 2002:a05:6a21:3949:b0:3b1:a9ce:507e with SMTP id adf61e73a8af0-3cc55423418mr433328637.32.1786559025024;
        Wed, 12 Aug 2026 11:23:45 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:44 -0700 (PDT)
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
Subject: [PATCH v3 3/6] docs: sphinx-pre-install: check GNU Make version
Date: Thu, 13 Aug 2026 02:23:20 +0800
Message-ID: <20260812182327.53694-4-chenmiao.ku@gmail.com>
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

The kernel documentation build requires GNU Make 4.0 or newer, but the
Sphinx dependency checker only verifies that a make executable exists. This
lets incompatible make implementations pass the check and fail later during
the build.

Check the GNU Make version on all supported systems. Prefer a compatible
gmake command, which is how Homebrew provides GNU Make on macOS, and fall
back to make. Use the common kdoc detector so the dependency checker and
build wrapper apply the same selection logic. Document the requirement and
the macOS gmake invocation.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/doc-guide/sphinx.rst |  4 +++-
 tools/docs/sphinx-pre-install      | 10 +++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

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
index 1956f1369..7625ac5a4 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -37,6 +37,7 @@ import os.path
 src_dir = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(src_dir, '../lib/python'))
 from kdoc.python_version import PythonVersion
+from kdoc.gmake_detect import find_gmake
 
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
@@ -308,6 +309,13 @@ class MissingCheckers(AncillaryMethods):
 
         return None
 
+    def check_make(self):
+        """Check for GNU Make 4.0 or newer."""
+        if find_gmake(os.environ.get("MAKE")):
+            return
+
+        self.deps.add_package("make", DepManager.SYSTEM_MANDATORY)
+
     def check_perl_module(self, prog, dtype):
         """
         Does perl have a dependency? Is it available?
@@ -1559,7 +1567,7 @@ class SphinxDependencyChecker(MissingCheckers):
         # Check for needed programs/tools
         self.check_perl_module("Pod::Usage", DepManager.SYSTEM_MANDATORY)
 
-        self.check_program("make", DepManager.SYSTEM_MANDATORY)
+        self.check_make()
         self.check_program("which", DepManager.SYSTEM_MANDATORY)
 
         self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
-- 
2.50.1 (Apple Git-155)

