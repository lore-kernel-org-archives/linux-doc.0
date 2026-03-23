Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CBB3859F2;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=exlVp5My7c3DyNkPJ6UcEdzSL9IHUXTWf7FPoY9qumNFyIQMk7Loza+HUdMwx8eU0Gwund2i015iQof7lldNh8wtpC2z+k2DBM572rR/w5a/k1a+VLQC9xcMl8CuUpY7HpS4y8DYmG6GJGWAeca/zsaI+PlTc6C5pGsqP/Y07C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=BFO+bQXgmdQHXLJcGT6y1ITcuEWmfE5np+ylBh2HDxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFk/j5RpjD7mchPkce9/sjJ1J60Noqt/dnHcIvihNlaCCL1R4PqawgJbGU1reTdQv0tDURvC/4EFdk88gKjwMcOt9wSW7l+Kk44dHimlrbOGscJ6u7pdX+vHlvTDoGbC8u/iqKGA1PdEr72mkTz2DctjlW5ypirVf4YyNwJmz9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO7P1hoE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO7P1hoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44BAC4AF0D;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=BFO+bQXgmdQHXLJcGT6y1ITcuEWmfE5np+ylBh2HDxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PO7P1hoEHznXBS3njW9xi3P8P2o2XTkYtXGMPz9PxRCIoR7Q1Tx5ywBCDPivllZDL
	 CfymcQVyxepQ9okOXRjb8XYFMxsHpbL2btIohOyM9SU7owNrLbzEPjh5C9VEmMKWJH
	 wW/+KS7UIvEmSOztvpaUIMz/6vtpRTudKVg8Rh+ficeiVVe15KSBQH+AuTmbWxd5O4
	 NJByhMJRsGoFKm+QpV1sZaenA9xU9pzlC/sNznMoXgV6R0xQFU23UCI6XucKhkCCBb
	 r9nBgS5O2UpVc/cymmV6emO3vzt+0tUwB04IDhgvD4EoU5kCCDMpaQdyOjPvje8y8L
	 yaLEbvH9yteYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWk-2P9E;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 08/10] docs: kdoc_yaml_file: use a better name for the tests
Date: Mon, 23 Mar 2026 10:10:51 +0100
Message-ID: <d1c4cd94547d843af0debf9e317e006d55d705f1.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of always using a name with a number on it, use
the name of the object directly whenever possible.

When the name is already used, append a number prefix at
the end.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_yaml_file.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_yaml_file.py b/tools/lib/python/kdoc/kdoc_yaml_file.py
index 1e2ae7c59d70..0be020d50df0 100644
--- a/tools/lib/python/kdoc/kdoc_yaml_file.py
+++ b/tools/lib/python/kdoc/kdoc_yaml_file.py
@@ -25,6 +25,7 @@ class KDocTestFile():
         self.config = config
         self.test_file = os.path.expanduser(yaml_file)
         self.yaml_content = yaml_content
+        self.test_names = set()
 
         self.tests = []
 
@@ -102,13 +103,10 @@ class KDocTestFile():
         if not symbols:
             return
 
-        base_name = "test_" + fname.replace(".", "_").replace("/", "_")
         expected_dict = {}
         start_line=1
 
-        for i in range(0, len(symbols)):
-            arg = symbols[i]
-
+        for arg in symbols:
             source = arg.get("source", "")
 
             if arg and "KdocItem" in self.yaml_content:
@@ -120,6 +118,21 @@ class KDocTestFile():
 
                 expected_dict["kdoc_item"] = msg
 
+            base_name = arg.name
+            if not base_name:
+                base_name = fname
+            base_name = base_name.lower().replace(".", "_").replace("/", "_")
+
+
+            # Don't add duplicated names
+            i = 0
+            name = base_name
+            while name in self.test_names:
+                i += 1
+                name = f"{base_name}_{i:03d}"
+
+            self.test_names.add(name)
+
             for out_style in self.out_style:
                 if isinstance(out_style, ManFormat):
                     key = "man"
@@ -128,8 +141,6 @@ class KDocTestFile():
 
                 expected_dict[key]= out_style.output_symbols(fname, [arg]).strip()
 
-            name = f"{base_name}_{i:03d}"
-
             test = {
                 "name": name,
                 "description": f"{fname} line {arg.declaration_start_line}",
-- 
2.53.0

