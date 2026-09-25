Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CF50AC33
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 23:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379668; cv=none; b=bPJzJfrIagZvI8PhBl4yCY5SYvRMSYAABIKrZk/mRQ9DKoLM1lxFPJJQ3G9hzmb1NLY9YjSdiCqKDkqvsiN4ctKeWJuRE0J/PjcgBmu2cLVuA4WhWpWIiY6aD20zlE4wWsUuR9naODIaqDfom+PA/L3ua92c8xOfxCnMVyYEhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379668; c=relaxed/simple;
	bh=15t9VWkP7QiHkzM8D4lmF0SEX3KKg3AbakmNUHKq74A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXJC9p5Afvmm8ww/cpQT0VTjwBUKp7IBodaUrY75PwytgvUD1vqkWnCw8tjsILhtx6nNAubrio8zQEvyBSCjrPbUXEflXWbbb9zgKvFwzDNrhvaOuoO+PiExcNMb++fRFVL3p5miXqRnjyl7IuPGO1Qttz5wTMWTV8DRFjwQ7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBGfGGKb; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBGfGGKb"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf2dd01d2so102143a12.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 16:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790379663; x=1790984463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sz8mUo105caQZQgw5WFP5RDz3VaEzvcLBK6zhPp5/Yg=;
        b=JBGfGGKb/KMjYGQeVBbQV9/dsPBE4lVKl7SCGCmf25j10Di+pjZToC0dp5ULHZvDMU
         AEaUvS1pPDyFNL/gLeIlJ/HV/iCrnYYU4Gu50fxNTaaNS1W4zTmrinFL+0BuLbp+RrVZ
         f7ONrUpWjazzo/XNnJW5d9bdJXl/V1eRa+1Eh/PnxblIv+HJRPVYWEhZkpi4DJGCe7Hh
         //H9DS5ldoZOeWoN210FSKIufTsvuMWleGC6OM8MfycwcPb1LCjGEJqinhJE6QJ7P//A
         6Kw3ItU1Dq4Z8T9Zm57sJRc6tpUVDOSFsA/EtpsIZT2YLwdApWtalm2Z9mGbBgsRlxI7
         yYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790379663; x=1790984463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sz8mUo105caQZQgw5WFP5RDz3VaEzvcLBK6zhPp5/Yg=;
        b=mTpGfoCWTfjBkR9oO0Swg0jw+DFRVjZ3ikmfYXxN2q8YtvRtc9EjaLkcJaZ8O4cZRP
         PAUSiRIlVdb8EKIMhNrETREEQecYOzdahOFweU0sH9jiDIGuFU9dMpFSIul3G4yVIN9+
         UpfD7Jlnsb5zxiNIqcEMD4QaTo1rIYd7JSRXoFRbIdFpUveNu6oM7GyknF2KP19FH/F8
         +d3XBtWWd2g97lsj91be51XCS76+SWNu9ZXEnYWtZ3pqVkDOaBcLqwqerUORz+j1aObp
         28ifafmJ4eg4lIl9sueDXk2ju6KzM62jv8Vpm2yhK+NxakM4WY2nZVz6PAY4JLJAIT64
         Xykg==
X-Forwarded-Encrypted: i=1; AKwUvBzBYgbS+/HYNRNT8aunvf/oqdwyk+UwvWFy8UjjVW4F1/RnGU3Sv+TgtjqIqRmXmzuGKI2RRGAQdsU=@vger.kernel.org
X-Gm-Message-State: AFuF++kMNcdTwnVuo6OyL6HglR8IvluGEFsS/RZpAC73IuAauyvl0el0
	4lc87FBCpW7Q1GoQ7UlXrwaASTutvuirGUvoQPi+1xOx2msRtrWOtCmQ
X-Gm-Gg: AYBFou0cGo0+BzxOl/hzNn3Gf63h7y15Iuj1LpYrEbzMP4xldfefOFRQHJBgrjAxHmA
	hgpLQ2QSvx4bS7UH82QjzmP670V2B/QpAnV+gsBXKV/iFBDyMZ1L3M9Afh1aRHD2wHnbgy2wgNT
	BWcfwVb7UnFcIapte+2IVrwXWivMRiQBZiCxEXsVBtmoweF+rKkMjVXYRk7vidnLMcCEZ9WJGUl
	HeSuwVK93NSIcZ10pzcIlV9YI8aNRO223LIMAaLD1vsFldYy4PLnV0F5DVw7VvRQL/gsJDF/TQE
	EJCPruGCJK55TmWJXfg8XELQW1PZEfnHDqFkjh40rqDOZfwQNichtp2rl1l+3WdF8MG7IILj0l0
	nQl7gg5Q22UNTutCNGmW7VmWn5Vbe+VWBba0EKVP233Sy6SiND3PjJ2qcklWt7e2wo0jkxe6qSp
	Ls7JwpYK3B5lwR7DKkx2XFQTGRcdzSH2hnKPneydlTug+/DsalFQRK0vVuLUPkbw6wNaRneEOqz
	PmIIlRVzyXnKfZvO2mO
X-Received: by 2002:a17:906:eecb:b0:c2a:f931:3fbb with SMTP id a640c23a62f3a-c2af93145b5mr213354366b.2.1790379663132;
        Fri, 25 Sep 2026 16:41:03 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.3.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm178813366b.32.2026.09.25.16.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:41:02 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: peterz@infradead.org,
	elver@google.com,
	bvanassche@acm.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	emmaonana18@gmail.com,
	tudor.ambarus@linaro.org
Subject: [PATCH] docs: kdoc: parse context_lock_struct() as struct declaration
Date: Sat, 26 Sep 2026 00:40:54 +0100
Message-ID: <20260925234054.128477-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc fails to parse struct declarations wrapped in
context_lock_struct(), e.g. struct debugfs_cancellation:

  include/linux/debugfs.h:245 ... error: Cannot parse struct or union!

Add a struct transform that expands context_lock_struct() to a plain
struct declaration, and apply the struct transforms to the whole
declaration before split_struct_proto(), matching what dump_var() and
dump_function() already do for their prototypes. The member-only
transform in dump_struct() is then redundant.

Add a regression test for the debugfs_cancellation declaration.

Fixes: 6e530e2e3119 ("debugfs: Make debugfs_cancellation a context lock struct")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py  | 11 +++++++----
 tools/lib/python/kdoc/xforms_lists.py |  1 +
 tools/unittests/test_kdoc_parser.py   | 26 ++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index d9ad1ddc87dd..80d4245acd17 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -831,6 +831,13 @@ class KernelDoc:
         #
         source = source
         proto = trim_private_members(proto)
+
+        #
+        # Expand macro-based declarations, like context_lock_struct(),
+        # into a plain struct/union declaration before splitting it,
+        # as dump_var() and dump_function() already do.
+        #
+        proto = self.xforms.apply("struct", proto)
         struct_parts = self.split_struct_proto(proto)
         if not struct_parts:
             self.emit_msg(ln, f"{proto} error: Cannot parse struct or union!")
@@ -841,10 +848,6 @@ class KernelDoc:
             self.emit_msg(ln, f"expecting prototype for {decl_type} {self.entry.identifier}. "
                           f"Prototype was for {decl_type} {declaration_name} instead")
             return
-        #
-        # Go through the list of members applying all of our transformations.
-        #
-        members = self.xforms.apply("struct", members)
 
         #
         # Deal with embedded struct and union members, and drop enums entirely.
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..9f2c750a811b 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -62,6 +62,7 @@ class CTransforms:
         (CMatch("struct_group_attr"), r"struct { \3+ };"),
         (CMatch("struct_group_tagged"), r"struct { \3+ };"),
         (CMatch("__struct_group"), r"struct { \4+ };"),
+        (CMatch("context_lock_struct"), r"struct \1"),
     ]
 
     #: Transforms for function prototypes.
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..4baa78ca02b3 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,32 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
+class TestContextLockStruct(GenerateKdocItem):
+    def test_context_lock_struct_declaration(self):
+        source = """
+            /**
+             * struct debugfs_cancellation - cancellation data
+             * @list: internal, for keeping track
+             * @cancel: callback to call
+             * @cancel_data: extra data for the callback to call
+             */
+            context_lock_struct(debugfs_cancellation) {
+                struct list_head list;
+                void (*cancel)(struct dentry *, void *);
+                void *cancel_data;
+            };
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "debugfs_cancellation")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

