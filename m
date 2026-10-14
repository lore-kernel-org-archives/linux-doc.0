Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3D4A6CE4
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017106; cv=none; b=buvH+TNFOb7K0bgqEbdzfgu9sAX5gEwSU3t5iVG3V1E7nlan2MPb2FVthxTK1grypp9L/d3SR99NhQrqLrDGiKwm8a1tW7UF9LtOJvahnjdvMKtM8SvPHMJF6EXA6Spy4QBH0eCDEU1Y28LlRX4Ogrn9C1xBo/2dHz1PO9v1Dlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017106; c=relaxed/simple;
	bh=e8AVypFcDpfdqFKE+7LYw0E3D2q4xn1i6UyrrzKEcsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbSzBdbf3tXsfFMzQQNoyk5cBruOJLFSZOlAhf2uKP0eteCAKTgCx7d8ySkcetRTSG6AWPWlfa+mNkelM6elWWkBDsQOrKrJY9wpIDiSxJWVG0rHsaKZ9tgIAl002ZCtspvsClBLIFWu/KCSE89EyRQNnkpikJxvxvMjTFzZ+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDE2yJAB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDE2yJAB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4ba4425so713308f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792017103; x=1792621903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzeUoH4s3R1vjJ6KljgBZ8kapLArpobGIe88CwWkAgM=;
        b=tDE2yJABcesOiY8WErmRXowj5J8AjTQ+03xDLagyOKCXlMsmH+Wos3ugvA9NpkWQSB
         2Q6CGZ+SpRNKcyRwln9On96EwQ5DG6nJ0Ws5cxnh98W5kwHCXJMi1ZDKkZO7kQqT2fjU
         E3XN+ftbMs/eGGSJt4wvhknGl6ji1uHm8PaB2u/iujWgHHiD1CFzrWS2+P84jYRwFYda
         82wn/OsUuAR7c7Rnvb4rmHiRpScCkCU3yMv80wbNiQNUM84bcLLPQoZh8GvTvw9ZzoJV
         mydzrwtSY8S/UVgLT/PeKUmCuvEKCxWKVdlQwAz/JjaJSavPHXGHr4DYrIcLm7a//pBM
         SYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017103; x=1792621903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzeUoH4s3R1vjJ6KljgBZ8kapLArpobGIe88CwWkAgM=;
        b=fsZktlrbl0u11cZ29bAGDuQGtryd9S3VAaf9IPAb6CakUSyrGTZdLfljQFgC3DR3LS
         OA2BtUDOzjSH/E24EHaf5Mwyj5Gs8JMoBWJsmqBnPNX+5naCAdjCS4btc0zuTLNgu/X9
         lVDWoWaPdPHoODf0yCV2y4eJJTFitijRCU990KQ8fOJCyUxfoArjzVsz78bWQR272xXQ
         IUYGzyvhKrOuKRZ/ah34E94ksth01v/ss92XZOpyCa1UhT2eTYjENDMqb+Dy4MBSA7iC
         YPzWNCJ1svYIDBSvraa3UW2fgK0XnoQaYxwGKWSB9z0MSd/rrp7feLpFl44sPC2nI/9C
         LLGg==
X-Gm-Message-State: AFq9FYK5SZycZeCvNBUMtxE6NlSFui9/4oJA1P6Nf2HxBBD0iPZH38SC
	Y+rL7ZhCUBQQ1ZR7eV84z/nx1B6D7NYjVQiTDGRq+EJa3yJIei8e14QSo0P5IyI0rDAGww==
X-Gm-Gg: AYBFou2VCkghAReDOP5v800/Sm4KBLQZttceglUHP9vWTNWV2idOUquC/6i4qJyecJ0
	yqQG5ztJrEGTZMTz8bHT64IpJqL7uCU9QVcAdbVsEz/wxF7vbzmTBX5AheV1m+1ds6a2W13hqr2
	MxyBPN85YgSlJHC8k7rMFcLQaoX19iuKDc52vL94qyN41LoiWG+U4J48dZaO6LY351UzUZe8yP8
	vNXQio0UfbNxU2Cml0ZbN9LZGWaC3Bz5emWstl4ypNroJVWyZKHuXKx07HYB6exQVgo+Epz1NEZ
	vpc+gtsYLCVQIQ8JkMbFgB8lroNzvo07HfQhV0V905TuuMmuKn9buWVfv0pvX5/N8ThfG6s0kL0
	DupSUSTF44eSNJQ2p1UxfVM9tWaAGCXCfsLZDNFgHMoCllxQgdbkW8A9X9lp97uGVPydFoi73+J
	0HXcBnVzpy7Star62tzdIb4mfowdWUE3hx1Gffov7fYhLeg955pXKVO/lsPvo5rNoHdK22rja05
	pRi3yT0dUDI+B9vMUOnO9rKFCx15GC6voELdtY=
X-Received: by 2002:a05:6000:29d2:b0:48d:f14a:9184 with SMTP id ffacd0b85a97d-48df14a92bcmr2500800f8f.4.1792017103192;
        Wed, 14 Oct 2026 15:31:43 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.9.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5265sm15620662f8f.41.2026.10.14.15.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:31:42 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	emmaonana18@gmail.com,
	rmk+kernel@armlinux.org.uk
Subject: [PATCH v2] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
Date: Wed, 14 Oct 2026 23:31:34 +0100
Message-ID: <20261014223134.14772-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc fails to parse tracepoint declarations that use
TRACE_EVENT_FN(), e.g. gpu_power_status:

  drivers/gpu/drm/panthor/panthor_trace.h:28 ... Unrecognized
  tracepoint format ...
  ... expecting prototype for gpu_power_status(). Prototype was for
  TRACE_EVENT_FN() instead

tracepoint_munge() only matches TRACE_EVENT(), so the macro name is
kept as the prototype and the TP_PROTO() arguments leak into the
parameter list as garbage.

Match TRACE_EVENT_FN(), TRACE_EVENT_FN_COND(),
TRACE_EVENT_CONDITION() and TRACE_EVENT_SYSCALL() the same way as
TRACE_EVENT() and list them explicitly at the call site in
process_proto_function().

Add a regression test for the gpu_power_status declaration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 18 +++++++++++++++++-
 tools/unittests/test_kdoc_parser.py  | 28 ++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 80d4245acd17..a65bda3e81b9 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1545,6 +1545,22 @@ class KernelDoc:
         if r.search(proto):
             tracepointname = r.group(1)
 
+        r = KernRe(r'TRACE_EVENT_FN\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_FN_COND\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_CONDITION\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
+        r = KernRe(r'TRACE_EVENT_SYSCALL\((.*?),')
+        if r.search(proto):
+            tracepointname = r.group(1)
+
         r = KernRe(r'DEFINE_SINGLE_EVENT\((.*?),')
         if r.search(proto):
             tracepointname = r.group(1)
@@ -1604,7 +1620,7 @@ class KernelDoc:
                 self.entry.prototype = self.syscall_munge(ln,
                                                           self.entry.prototype)
             else:
-                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
                 if r.search(self.entry.prototype):
                     self.entry.prototype = self.tracepoint_munge(ln,
                                                                  self.entry.prototype)
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 4baa78ca02b3..04dafae412e4 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -444,6 +444,34 @@ class TestContextLockStruct(GenerateKdocItem):
         self.assertEqual(entries[0].name, "debugfs_cancellation")
         self.assertEqual(entries[0].warnings, [])
 
+class TestTraceEventFn(GenerateKdocItem):
+    def test_trace_event_fn_declaration(self):
+        source = """
+            /**
+             * gpu_power_status - called when hardware turns on or off
+             * @dev: pointer to device
+             * @shader_bitmap: bitmap
+             */
+            TRACE_EVENT_FN(gpu_power_status,
+                TP_PROTO(const struct device *dev, u64 shader_bitmap),
+                TP_ARGS(dev, shader_bitmap),
+                TP_STRUCT__entry(__field(u64, shader_bitmap)),
+                TP_fast_assign(__entry->shader_bitmap = shader_bitmap;),
+                TP_printk("%s", __get_str(dev_name)),
+                my_register, my_unregister
+            );
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "trace_gpu_power_status")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

