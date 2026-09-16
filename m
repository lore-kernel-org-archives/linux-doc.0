Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462C4E06E9
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593055; cv=none; b=J+gPLsabypGSmaxijuCEiKZwcyXzBGSZ6OuGUiLtfoAzEwl94l3BR9peq9CZZbrz/1o5nvf7FuOKeinUm8E6YLMKhTwK9LGUAXVx2gbnsu2gR+MlPG9aRNkU7YPvribKQs6OfGbK2uiNWzOHyJVCag62M1+9NGUK60vLLPWDJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593055; c=relaxed/simple;
	bh=ywhjiYa8sz83VLckyrtdhzFmvCtPRCP4Hc4K0b9W5kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLyRrKXDgK1tNtVTAozCnWj3/PzGNjTTZOIvEzbB3ZtvNjax2YHWwc7Jd4ffCP5PaVbAbmW5oPLMAjbPEBc3ctUPBCx2OVe8KJyEb2fUIv50WuCJjklVArfw8kkoEc8VT2v4idC3qJ2PyNqsxnuDuWGWxHUEcjwNEt3h83rN34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8QoSzwK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8QoSzwK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so26191f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593035; x=1790197835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=o8QoSzwKAJvAF95bDjle0Ra7fpr+vdC/oGehT6Y3AHFp893+jxprGKH417/+7jZiQL
         IQi9CuYbKxFk8Gvy2rEPnMIu2pVq3k9PpSDWT1PH/9TPyeLYvLwWeJLtpCtcdXwpdtsd
         ORjATGpjZ6cTg8fyrG5FG0jmx74ZAmL6bYeaTmobVE/M3vaVrvXTJ72C0AMiX57IO3In
         Ro1/lQxLunoGMmIb2sx3sgka7heSnWM4nO0qDyn/PzkL8tYZhdLLCWPiXZfwRNg/mAET
         3NaiaORC8hIfXPnGrBoiR5k4ZbgXysBD4GfMMq+kJUx9cvq8wiBi/CvRk/w/ICzE5lok
         DSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593035; x=1790197835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=X9fkUiy8F+NR4pGZ91g5Nql/QvbDs/dUfuZc6N6kiepSmYMBg6BmJLuVMVlfjCiASN
         h4rKLKV6a2rje9fICPzsT5vwh5nHpMZdkhOQyi5NIILu51mkNNjoOOtkM7wIW0byo/s2
         UBgpCR+TiAcegAq4flmucALdJALgI7N91AFfXUz1bUl7zF8jG60nXuHJ9div+fblHCZU
         x+dSBV7b++K85C5eqkjugvQwlKBYFULKsMj3l82sQFtSYbkfoR+Ywckriebl6VzdGc6z
         JNOWZ5pYl5rU937vFiIEDn8VzxFrRahT5EZUBd2ZQQ1AVV+GYU5hRY0En9VolWd+MF3m
         8Keg==
X-Gm-Message-State: AFuF++kZHCrfffjaxM6drHV2/07Dv0QyvLdw9FGKfY5fQ6UMSTm9xpwG
	pfiDGsefeHmuPcoR0O8+WDan96zYTv/Lmjsv9Gx11wqmmTm5djW/XrAm8Vzk8k/IaAiGVCH/
X-Gm-Gg: AYBFou16pa3EqaD6oxRvBn1l3Its4itxWmdvPAA+Fk/kMElGLW/jU+ENeGsM152/uv+
	QE9uMAE8wmuOIwIQLqVzsWA6mNYVlKt0Fsvg2lEpkXJeXJy3Esr1NBuvaDgmi5T4GVT3VwD+OQl
	jN9wMWZe3bpU0ukgDA4qdsobB0P7zDrq0UUBDyz5wBqFcxMPX/U3tt81MxAqG2S8GXgXlAOpS1v
	mlFpd7rzjEeqJuY9R5iIqCuFvMt/tiT5w9oVQ8Misq8d0jceo8c+0KnTOkt+FloHmjgcxCFzLUa
	lPF0Grm/vpSM55cR7/gFueWOX7GCyjUzcG0z1Lq86TP3tbN07ie93aoNI156sTS1hxAWE1O+PP9
	rirhnj37q6xHHHyHgKclkAhhMIvonVNpz9ZKreOe2xlt/eSei8ztOj6b8DuEF6XNU1DAchr4oY6
	W3iawuyVJHgqETwcTuQae1IQ96orFb2ayqnbpcIc2IUVT/IYU+zz/OVecbfj8hrIo9HoS/PO1Bt
	Vz+27vmWm+fZ6nOO1J8
X-Received: by 2002:a05:600c:4ec7:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49f1d516b6fmr45330575e9.0.1789593034942;
        Wed, 16 Sep 2026 14:10:34 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.73.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm19858565e9.1.2026.09.16.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:10:34 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksander.lobakin@intel.com,
	aleksandr.loktionov@intel.com,
	tudor.ambarus@linaro.org,
	emmaonana18@gmail.com,
	bvanassche@acm.org
Subject: [PATCH v2] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Wed, 16 Sep 2026 22:10:12 +0100
Message-ID: <20260916211012.16821-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc reports struct_group_tagged() members as excess because
the macro transformation rewrites it to an anonymous struct and drops their
member names.

Keep the tag and member name when transforming struct_group_tagged(). The
nested members are then recorded as names such as fast.order; accept the
existing unqualified @order documentation tag during validation.

Add a regression test based on struct page_pool_params.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/0cf8ea5f-418f-45f0-907c-3d1ed4f03e9f@infradead.org/
Fixes: 2f07ddbd5793 ("docs: xforms_lists: better evaluate struct_group macros")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py  |  4 ++-
 tools/lib/python/kdoc/xforms_lists.py |  2 +-
 tools/unittests/test_kdoc_parser.py   | 37 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index d9ad1ddc87dd..ced09504f3d7 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -635,7 +635,9 @@ class KernelDoc:
                 continue
             if param_name.startswith("{unnamed_"):
                 continue
-            if param_name in self.entry.parameterlist:
+            if param_name in self.entry.parameterlist or \
+               any(actual.endswith('.' + param_name)
+                   for actual in self.entry.parameterlist):
                 continue
 
             hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..9e8b3a6b1da1 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -60,7 +60,7 @@ class CTransforms:
         #
         (CMatch("struct_group"), r"struct { \2+ };"),
         (CMatch("struct_group_attr"), r"struct { \3+ };"),
-        (CMatch("struct_group_tagged"), r"struct { \3+ };"),
+        (CMatch("struct_group_tagged"), r"struct \1 { \3+ } \2;"),
         (CMatch("__struct_group"), r"struct { \4+ };"),
     ]
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..1a8287e99f2e 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,43 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
+
+class TestStructGroupTagged(GenerateKdocItem):
+    def test_nested_struct_group_tagged_members(self):
+        source = """
+            /**
+             * struct page_pool_params - page pool parameters
+             * @fast: Fast path parameters.
+             * @order: Order of pages.
+             * @pool_size: Number of pages.
+             * @slow: Slow path parameters.
+             * @netdev: Net device pointer.
+             * @queue_idx: Queue index.
+             * @flags: Flags.
+             */
+            struct page_pool_params {
+                struct_group_tagged(page_pool_params_fast, fast,
+                                    unsigned int order;
+                                    unsigned int pool_size;
+                );
+                struct_group_tagged(page_pool_params_slow, slow,
+                                    struct net_device *netdev;
+                                    unsigned int queue_idx;
+                                    unsigned int flags;
+                );
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
+        self.assertEqual(entries[0].warnings, [])
+
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

