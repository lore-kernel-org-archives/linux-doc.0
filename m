Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E99450F2
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 02:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908508; cv=none; b=twIfZJ5wrorDKd5/VBtbDQix70K3ye6jqNG83xgOJ/7zSJKMpqk0vRBAow1UNgJ8YV1nEAjuNmMWacT8w3w73Vz2NXLwJZcutpvd0piwFQ7EM9/iqwq/IliX12qTfg332mO8ouYAgAu0dEf2nXEzC/kKYDM3wduUNYviydpLWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908508; c=relaxed/simple;
	bh=SXO+SobDH6cVcgzb3z/5p2jgvfKdpafjqM7lqmZB1AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0ybWLBsNkuhwrIWMdzhE/C9glU5DynpSc9IROxOyQp75nr+eXJS58mFHpjGeap8gGEqHTeHH3HqWsN3XliyGkuaO5CGZNg97OvrpQ+5qeGB1NZL3QPPpzZLXZPTKwtiPKYcOJab1kblu3twO3POqs3dbamfW49Wa/maURgBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxH7ySt0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxH7ySt0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01eeeed23so643185e9.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 19:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790908505; x=1791513305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rnR4B1VLG/A6C9Ykh3FwKXCJ1NovidmATqbVT+/lH0=;
        b=hxH7ySt0oHHAGg2seCsaFX6ofPyBlVmu/rAX9Or3NzUdFCAx9srE/zGg0KSz/Xrj+F
         GD+BbWmxwMxAgq3D8o/KqVpyEPAohJ7JnqLFOB1cm90iJJJv40dUjmT0cFHyjgsv1kcm
         Q5Okd02OEGZMYs0dYtqJaSKpo5gG0cxHvh8UOrl0ZW6xGHv9i91haidy/edG+BZTDrxO
         vJQZw+jp+uiO8TShkOjFYpfOP82hjoSpj/RyFbRmszr7dBOodUQAORVDj0xue+y2KCo7
         NVU9pm7Ju/6VZxBBNyFfEv8U8BmpA/cr81tVxituKzRMF2RwuIg1Ll+yS8Y2eZDYpgPB
         cviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790908505; x=1791513305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rnR4B1VLG/A6C9Ykh3FwKXCJ1NovidmATqbVT+/lH0=;
        b=l63Oh964S4C0miiVTFP2QtGLIvYvxMyz57DVOzBDVwn0EpRoB1OAy7L7FQ0+GioHwc
         Sf5QhFstJU6sm7HfWMAtoL5QJ0LmlVc6KEKknYxz7h1VpD5jkpy2EdSQcGrkCe88hmxF
         Pd7S2DMeSwAs9uXeDWFQNq4v50IaipjcHPhkjeeuoato2wGT9JOMt4xaNkqyDCPDjm7s
         nEaFRSjp3k6vNq6BHD4mQyDRILZmGo5qPQFDYw6GZRNuci5cwsXqPTrtMtatTr06rPvc
         /IL+jepCbX2JXgWRAG2Fh6HeYHJqjygKL8tBKSML/bK+SF0aaDNudJ4XlJ0Px2zPd5dV
         i5zg==
X-Gm-Message-State: AFuF++kowZIWev2FtyekZ/QAPaOeJmiXPCS0/V46tvHG0daGOqAfJ3b7
	bqmM6/WsfclvRwiHWXNdUsNjDrx2XArl0gnEvgfn1sM/oebQcw86ieMtf1mflzQLuMNkUUCY
X-Gm-Gg: AYBFou34ENGC60HM5Gf4ejFBIqC2O//FOltsg/SQ+u8dkc7V6HrYD6/x7U0fXWF815T
	LqjZEfrwAV87j7/kX1wIH5eQSKQxfk76fm05mX8APZLE8ti053m184voCEoFf2pO+0jHAZd/4Mf
	+U1zS5GrcDMZvR1E27iNRW+UL50SOzXeNz9orFsT5wLkzUtaRp0D3KZq5dGhtzahBejbPOobae4
	siLWfbTIP304l1eSVnNfsJVa4P3qUNp0zjjJWv1jgpbeDmOAQ4pZzhv+DVOsu9TLwDq9nTjUIit
	00c2foyS+Vv5cHYMcbPQBNRgfyYH1Z8wrKU/yPn/cmuvyKRDe5GQD2e6Gm+PZoyGNeoBw3AHpg5
	Jf1JNSCSp55xNHzWhc2nnGB6w2zl0+fJngZb7514tHyqwE6KYuhhoyaTRB1QAU3q/Ttlqvezk6K
	yiEkstt0Nska1zGs0ABZzOD7fZ5zUgj0MxiK8mbiH8Sb5sU0CJjvwOB4iFjO/Hw5YATOzuH3haq
	PsbqsEw7Bn1Bd1G/X2GKg==
X-Received: by 2002:a05:600c:6217:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a027452677mr24180105e9.0.1790908504828;
        Thu, 01 Oct 2026 19:35:04 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03043fae5sm16283935e9.0.2026.10.01.19.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:35:04 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
Date: Fri,  2 Oct 2026 03:34:56 +0100
Message-ID: <20261002023456.19470-1-emmaonana18@gmail.com>
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
index d9ad1ddc87dd..28c325665c17 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1542,6 +1542,22 @@ class KernelDoc:
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
@@ -1601,7 +1617,7 @@ class KernelDoc:
                 self.entry.prototype = self.syscall_munge(ln,
                                                           self.entry.prototype)
             else:
-                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                r = KernRe(r'TRACE_EVENT|TRACE_EVENT_FN|TRACE_EVENT_FN_COND|TRACE_EVENT_CONDITION|TRACE_EVENT_SYSCALL|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
                 if r.search(self.entry.prototype):
                     self.entry.prototype = self.tracepoint_munge(ln,
                                                                  self.entry.prototype)
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..398e11a8737e 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,34 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
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

