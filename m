Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036C4A498C
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595057; cv=none; b=K8Xr2v4KNEGTr7yng9f6wewnxOOE6UP9c6KLFhJ5XJdj2t99mTg5zzpiuhanmKtNc2KguLZR7VSiFjQsP9SETIxFL6e1Kk5YtkqO+5f9xXJ9hkP/QRIsUlzTurD37QFX73m3HGxVn8AnnE31zklfchglhpHE3hvNxL6POPf9HDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595057; c=relaxed/simple;
	bh=eVwAxwIHPv5sTNmzVLKDZnp4GCwOva7HQs7nyqQVR/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vmi4Muy+ML/s5fcg3mcSRYGYSPdrwRveHNJF4LGGcTA2NduBCgK3JNr6LWcvEOhGVHc8AWTMVs3Akm3C3jcgznycYfpK7Pkw2btQ3GQtXTIf9e/375+QuKK5zc85BiDZefBvNqiHcsjOj3iavzR05hOPbqMAjiDRnS0/L37y0oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjXdezg7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjXdezg7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b93204449so308555e9.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789595046; x=1790199846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjY+yTooIwgjzGQxDpIA0K3uDvsszA1PxNKQSXHovCI=;
        b=RjXdezg7hC3I0tRdRlyfrlijC4LDjc0TUA+UGSGqRStz6tQyGa/sXzeJtmp8eEPiu2
         TiOer+mzoeACb2LJnI1kqqEP4mBXket7J7x0Kfeibrx+XzgfYScgk4RM+Zodip51DNGo
         8R9czOBSJ4xLBpAfCUai9vHaDiw47aYde/SzfjTd7Razpvt/IDLFfbzS2321cmjCkJCI
         pQiL4Fn31o11exQH5gtyQlSP4Fx3zkbLWNi1esx/pQY53XxItdlTTJKJUwiQ8+W3X6v1
         smKsnF1gCRhJGNl9fbMNfSF4PHqbnMUmTZ+K8yJtxk/gAnmSNI8jpvva69Z5c13GohGt
         AWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595046; x=1790199846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjY+yTooIwgjzGQxDpIA0K3uDvsszA1PxNKQSXHovCI=;
        b=gWYG2vJfmejOvNNylT4uYCidPZO737HiMEwDgtEu8nww7vo59ZWFbuZnJERcdhYeKs
         jF+GrZXKB7Io77+a4fnIDYOlDTa750Mf+w6dYISp7S2Y9zHH6Pt+EXo1jfJUXoUVLXzp
         lWtvL8/dpzEVwI0q8AcO3WG0zkQukgnlUMDPqFyEBQTNw37E/9pYG7PNRlv0PugTpFEP
         LGMd/tzkRwhl4qUDp7FhI+IwEIpyOKhAKpPcOKTxfWlVsbVULPpg4TNUBfx/+6C8DN0Z
         DZz58aBWCz4QsUGmS71CzynpayL9SCpD+Td7YV9SS+rMVHMl1auczT/eF8vWnZ4kIjIK
         qJ3A==
X-Gm-Message-State: AFuF++lcDgiAvTV11eoo9HIVj+urF+S1B3n9/NrTraTCHk78rDca9l65
	eFmxwpkwxFsvL8ITG3XrLMuEmvNCk5jf9bDloPXCq/rwYYYAxIh4Qpt5lDjhcyStBGkN5KQZ
X-Gm-Gg: AYBFou3TieExgduqbznQL/kDRSjnz8JYDOwcRB16o2O7bz4hQzvK0788ZmZDL1hgBge
	I6ibW/2ckX0Xjt5hul5eLXP3U+fLmTW+u63Xje0RtSqHn/DQf0Pdiz5LyRiaKgb0UC77kRMRWCV
	efiqvOf8tftAyUJ1+hwrv4wef+RZXq7uYG+WDdf9ByXkMWrelJV9Q3UanM6pbNFz96veyoyeipA
	oYf/cpRNCXz+0/KzRQ7pFo06js61+Nq9djmR8Cd7zQi7/thtzybYE3lPxtEzvWGWhfup3K5EotS
	WeA/xj/KhhE3ilPdid3EbwD2/f9WUhta0URlSTRXsSv1M2LJl9HA+l41yaKq0hZXxbdRr0tZWQp
	H8p3dXIwLdybJ6VN2Tbxk/VhqbI7Ag4Hh69cpoJ2j9cr6WZvRlIr642i1oykanubd2ka1TuQgCz
	asdksdYaGDMV3eis6+IjJpcmi6xz6BPgrscBa0BmzRLYgS01oFwD2cR/iilaE8mlF3ExpD5y639
	f6ifQ0ayZHy1Cea32k=
X-Received: by 2002:a05:600c:5489:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49eb732b2c8mr49393815e9.2.1789595045874;
        Wed, 16 Sep 2026 14:44:05 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.73.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm35176755e9.5.2026.09.16.14.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:44:04 -0700 (PDT)
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
Date: Wed, 16 Sep 2026 22:43:57 +0100
Message-ID: <20260916214357.22573-1-emmaonana18@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
Changes in v2:
- Add Assisted-by: LLM as requested by Jonathan Corbet.

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

