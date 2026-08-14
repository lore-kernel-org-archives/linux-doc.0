Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641323ECBCF
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743879; cv=none; b=kihqNUX4axeSNndUu/g1szkbp63NzgnIxzAZTXmlCo9Osy6qbE/uHz5YXiOO5cQTADV3xSRKM2i/Tqp5AB+vY4FehrItz/R/bUgLHREggyaA6Dic42zEAJJLCJBGxmiMBRVkO196HtsSzT5jwHwIgMhNG18QhE345y2B99/Giow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743879; c=relaxed/simple;
	bh=xKFZ9Vz8OJAAmvPW1EGN8mwA1pKRyL+4q+f5g03vOI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uY1DmPkAUroezQQHzaIoH4QsOJB6k+adKu9NFyx+DLUDXJICtMrm+zYM+vlE9TmpRYZOCDvIrvK1LfD+5u2LzDsXtJ7huxzwy9eL6lVto/705Bus54SR+LledePI4gXuohG/vnmJKV5v8cnUZun2V8DnZsGOKrWKPjivDpjTcf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsZt6QNy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsZt6QNy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so21141615ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743877; x=1787348677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fsj/ChwjVSroo4iHvgI4/yCeHJiG8xSqz51KIR6jdP0=;
        b=YsZt6QNyg0P5lH8WNlyT8fRiVEbOfiAW5heHOsxOJ8wDXLRNu+5BuMy9oT0qqFR5Tx
         0hkkjigJjaPcMGL1tHz9snu0dfEHGKYZlJz1aowUTaNhCF3SiawkmnL2FH2SzQBYFc7P
         O4ewsyILdIqwrJATIic3qsljy4R2yAgJlDh1YMA8MWQ0MGPDsVoNacKz/FzcUijH3o07
         92Z8MpQAJqLO7lnaswgFi6lGEQUpLaY2q7OebZ5EuWtGnh/Yn0schYSWLdRwQzs8XTeP
         q/uX1Y3N7ykovRECV9N65wCp/WOr43QoVrgohjUtdPDoy2h1LTPNU4BdEkJx0AD8cBH5
         Ga3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743877; x=1787348677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fsj/ChwjVSroo4iHvgI4/yCeHJiG8xSqz51KIR6jdP0=;
        b=n/qvz0RsqFtQEJhOHhFDMTJCGxSay14dxZ0UObcrLt3Pd+6P3VQTqeLDBYjgoboksc
         Q6+H/DTNSECujBL6Sd0olaGT9YwCpeFziwATRn3/PnWwPN8Ef+FVwxOpmhnXBDjcIUSh
         DOuGbwU0rp34KRrgGmBHqUbmDblUVtlu1jDhf28f2b05BSP+bqqDxeCRqnbeAbYEuh6N
         2CAX41wzLFW1+zLF9Z6IFxnq8eCDyQraPNd9nX1jfCNf5nGOH3u53p0CsOolzq7qcxZx
         5roIpq6MlljScWByAFih7RCDy1BGIAWK0B78ZNXQNjll3UjXNiuz1SY5Tw0S0CtjicQr
         DJEw==
X-Gm-Message-State: AOJu0YwkMtw5YpS3piM+O/j6CMLhVspcjf79V84mqRwoL9G8XaQzZJ0Q
	Of6JxJcTHV3tB6Ulba6tbn35GhI4Say7vjwYGjw5Ic8fUrirHlaqBkbx
X-Gm-Gg: AR+sD11EtCAqTv3LhqCWc4N9osguyYuvlShykvHAMvafUeGFOaEPy76hnA/NAlpZR0L
	7g1eMLPEqwNjPtl/QQUclPkz4KFd70WXL6tniECRyvCvxgRdjel+9+pwTjW1nhcdGf6A9XTuF02
	wV4vC11FNcW6pMEQTUjnUcwf/Znc/FkKbQ3IBNSDo99UGp4TOc6stMISsZsr85j28HFHQ+AZ4D8
	eSZB7LNOHZe0CQnG1bw/x92PRqj5GDycyEX7WLHQqjKUZeMMrKGg02Pjl6VojYrdHhJx8W1To43
	pw3vrSXM0XBD7GHPnJTHF11qujQq8NpivdsKwyUaV3BrxhvTWj3wPB8VeyypBKd6YPxxoZjh+E6
	7OZiTi99MCdv980RtNOnIKqGwKUBqcOGyVepByVyxZXeWOZSreAJgdNWWLPKR3hKP5zzSjOujSC
	guGSfj0Hie0AJi9GPR514KivW/WWYAzpS+SHvEAlh/GLx3lW2/mvED6V84C1tduWfoo1BiQfKhf
	Lw=
X-Received: by 2002:a05:6a20:a11d:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3cc71d5545dmr9768406637.5.1786743876482;
        Fri, 14 Aug 2026 14:44:36 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:36 -0700 (PDT)
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
Subject: [PATCH v4 3/6] docs: sphinx-pre-install: check GNU Make version
Date: Sat, 15 Aug 2026 05:44:15 +0800
Message-ID: <20260814214419.49925-4-chenmiao.ku@gmail.com>
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
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

