Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3568455600
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401432; cv=none; b=KSM9KPLy55vKxWen3P6KEX7K/zyWAYeMq87VwMC8lXF1puFQpdIWZvYakdpo1XzQV05pS9usVN9GnRzh1QIVD9fbL8YaaTIFgcHujRPmU5uxXBWoggmuNizW10TxJZQCbyD8t4UDKVVa3iMWQ7oByA2J13c7A1L37780lQXQACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401432; c=relaxed/simple;
	bh=ywhjiYa8sz83VLckyrtdhzFmvCtPRCP4Hc4K0b9W5kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiOctwWokH5zSOOY1mF4jvME+6z+q9jebIgoY8mBpGmf2IapJgH9PC8b+YlFfWr5z7rwEkWHVAiaEPeuDzxK4uVPucWHygZqQZqUckncp8YMX68izqIWEvBM0qqnrYkW+8Npfb2PHOWI4Y3+YUMMTuqfM7EF0UJvYSExYYQx2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1omn6uf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1omn6uf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b0dd3e1d0so847055e9.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401429; x=1790006229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=Y1omn6ufOmc6TMlYctDhWyQL4V0fiPDtr4OPJz12u7h/dqorDa4z0/3veP3eVU+E2l
         lIHxTkyebhYrUB6SZfe5djhUOU/jPXiaGCj2GS8S6MffLUAKLRcQOYaoIxW2XuL9VqJd
         8xsXLe2klBnrDsYI4/BMvqAiPpTUJsE/gDefPij0GFMVkoqPqZ7+ps9uIg5TwvwkkGWU
         IiEmgzMJicqztKRML7fhbY6MLrBO+shWdig93H2IUoZEEsokg9LdeUYCmUdW1CXyZALa
         4HMEgoUsKRTMUQJSs8EEvf8dUJgrx/bFhtUz/0TLRMvDjNp2N05rIj1i1BB8JL4KtL5Y
         wFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401429; x=1790006229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=LcR2KlpuHWUvt7WRcodUN9rCELHtAlb2g+K1ZEps9o0Fykw4cM+8Q8aGD/CH6gGmZA
         7V6TIIGDJvFVnm7OdQRP9j0oYnIoTDL4rqV9+QZfhyTKw7LsBbsInwcSEQFYyDmOQOTL
         AbjZy0nlo12n3WKgYmN7MHCJsoPNppefR5bEiqJ3LOTr0oZgY7pn+0UZ85aBxwndbYfM
         JMg1VjccPLOVtk6m4kyrOWtOtOvigxTO+xdO1itQ7JHTXEFTwy2OSu6NyzQou7+w/KOj
         wd0neEj3gxA6+IusklUrtb733m7zL38zQXai19dI5zn8OWU5aU4SUxtjSt53n5emLWRY
         73dA==
X-Gm-Message-State: AFuF++mLxmwKWhFkYeb3OExydAH2sUdttoIpqCBVsuZY0/IBlgFmqT37
	j+3mneswLv35uLXeANI4ROQhgdCmkDlBTLJi0dgIbbEb2ck3u9fy0zUQkYFTCXjnemZrsg==
X-Gm-Gg: AYBFou2Mq+7CYJGQj0bYCP31p/ZEfl+Olk5QB6WZSC3YXdZyqGVTdVrH+K5atE6tENE
	xy36OooQUsgukDvItuaG3P9vgBiVstUR6P7AJnRYkzyV97mP4dy9pOeevizOl0FJmIhFSPoKxZG
	x8mEeysdew05vV+fkqXR9bWMioHUjdETT0ShgTTUWOccHClBmMp4och5wSL5EKWfAIb40ATt5V3
	BT+Q9oOFcUX3ijpc+2tLVG0Bz7+E3SFhDzzULoEjUlwBHS4ayedJVhRGLwwpAx0nWYICR6haRU9
	iVR7JGI7EpiIOsRBO7UFjp/VpW9KNuFAsJWWCb5MYwSJs43ufUeZJUC2j4B5N0+q8VT+B0ufALt
	sWks7SpvZdoSzx87EhFf3bNzSErKCra1Dr5E1bBEn3sca9p0HLVnpuPkvez4qlOwYuBZ0iLF4IS
	fb5jyCgpIUEJGeYvpqQMLStDBCXQwXtWnpDN4emTBvPkDowdYp168IDLdPjQIe2WGMt3D1i6VWT
	jEd8OTQNxraieLdKyKb
X-Received: by 2002:a05:600c:19c8:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49e7a68a919mr41608245e9.2.1789401428854;
        Mon, 14 Sep 2026 08:57:08 -0700 (PDT)
Received: from Nuel20.localdomain ([105.113.61.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6aa69csm787275e9.11.2026.09.14.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:57:08 -0700 (PDT)
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
Subject: [PATCH] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Mon, 14 Sep 2026 16:51:27 +0100
Message-ID: <20260914155127.21515-1-emmaonana18@gmail.com>
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

