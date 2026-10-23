Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760749;
	b=PNQCTkNZafJSMEZBejRXDOF7lggeKec35GEm9CGTZTSW/FNIstmXR7TjGzIRa358Lywx
	 RJzKiPEVD9yZDetuFdxMQdEDcieMqjmlXG2WpNI884qHsb3L38qWlUDmNaNBCO25yOovB
	 Pv0sIN54HU4N3gKPvovGH3cc5AgkGWsmVzjpSKJU/C6D6+ybLaLohRcQg6KgQfDhOttRP
	 TSKJhOShZ1qQwF/cKGfP72pKUG8KYWY7ZkdMYY6VaL4VR5T8reAuw28ewFDyukFRSy2OO
	 MsZ+AxtxvzjvaDK3U1CwHD+L6I0tfy9yYO/9Moe5lhjW6uD3cmHLJv3z8mNtlzI6CIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
	b=HZ9jxkFWQSPhVM1mKSQF/tyFPpGEC+KzZYsz62Pkl/zqG2htBU7Sfn4yVH6TVuKFujr+
	 FDucidy9shIMuHimkG3V2OPVBNV8uGC2Bwp5BN8XEijit1JEZIUiLIBYxuMbHlx3IDBGf
	 cwpCP44jjaTXuwnmAg8fCqI/Gv1RKQV4zFtHyoNr9nM3Ug7xueYmdlVPFeg+9asFAx09l
	 aw9QMtWBUKcQmnfJtmDPmqihMlfsshgYx9MLQWbX1bzuSxU/y26ThjpZUcJjOH/9jXEZ4
	 0pgwwwv1P0UaTuFGErHvysRsm7c7xJcSMJzSXyjvxstrLIBUoJcfJvlzH390+Pdu7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJSW7Uwv;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C6606A31B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 13:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJSW7Uwv
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df160bb9cso139117f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760748; x=1793365548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
        b=EJSW7Uwvc9VIQKX//Xz/6190XnWyzJkG41GalNWHkkritdFp3zIu+bx2yHo3g+xkFx
         iaFym5hps+GZ+aitaPXu1JReTXQex7xjzzn4ITw1h5ygd1/iThAHYYeb0Bn2qMQlxnyB
         KMI+MvgVf371fv8FpwyXTk4AB52s3DAG2WoWRGVxMKat8V1QT7t1BEQbdPoADsfkw5zU
         BO91XcuN7JQ9xLLf73Ip29ETexYykRsaUuwlUIcDnxDe4h4Gw7BqM8XxybPqYZUylQxA
         OTFHGLq+AWf1UyfPvyV3Kne5gke9DM3Y2Kub5I3o2O4tqjgjSdj8HBwNpbc9nMitKbg5
         iIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760748; x=1793365548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
        b=BlDEay9R7869XwW/NQje9F0Jr2E+rv4b4xjCBiiUBbZQllne8+tienm9NiGVfSPqww
         oZxJs+Dr01BPWPQ3g7IhkRC2xP8jYOMtfpm89f9QH3mTd4q/TXgA91sdykpBHDF2Fwnk
         cJV2HpNxRiXXeJJlNsqHwJ39o0ZnGyrZ+7FzXhDMJZRgcgVXL3nWzhJqUHUh37VsQKWJ
         fAVigCMikrGRvFUkv8QAlgHHAfAP1gj9F3cwQnacwoAaqKgP09xL34pFoTp0IxSVU3we
         qykX3UwbPE0jU5beLSTf0iS22m0q8bFLvHJ4Awb6sPiQNR//hMxvrlynUGuXNfTyY6bb
         ehKg==
X-Forwarded-Encrypted: i=1; AKwUvBz3vBu8kPLQ6nWgWFR2zMDZxvqdalCpU09XlivQyOpiw+ttSxyreMbfyeYL68aTGhtuRCfHF2Ib2M0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlOTVMqoIJQ2w6wEaUpjkZEhP2L225ktWqphyoqW0RbLm33Poe
	gZn+s5Bfaj+QK4CeoMTTwtnAwAaYvg3Jb1BLeJB4ujACtwZN4TMgZWoF6eTc/lXjso95BQ==
X-Gm-Gg: AYBFou3mUwh4vbZBM98rDoMm0DYALCd2lHVHdlvqRzA4HxyreIpL20hpuXTXl9gPL+H
	v9f59+TV/GjBbIHjoGJCTGMeWMcJYiZxlsr8ME4sFWYQJn9ySK6h7sMAdpA5uV0Ue0jXOv692eC
	6dahDEDN832rfo/rjQxY6umaRdGUeq2hdLJ0X5yRjSwyKPe5AEB3M+XsvVscEO+duoh2yw7uiFj
	JM4xY3mjoj/WevmqaMaj3VAe3/CEXCg+/N4U4AL9BZ2V0HdMp0j7K6bnoXPPZG7YfAPJJlyDEE8
	0sZW1aSQWkOLNmUMD/MBY0rxBrldEl7eXVZTwdZ/eR+/FMfgZ7cPILs6KXo6afqSLjbhweXZvKw
	qOOYarva6w4nlGZyvaojlhz2H92SFBRr5oJqO7Wf9RYPooXB7wNYIQ5J+WbRVLFtwDUBs+dZfGp
	ZDn2u1dj9s1/PpAhQ17kOv9ejs74ho2aKihSNhaoZqgQKMqS7RRZ7x+XetfW6V04NyDQEruQbNN
	RA0aI1XAML7bleanrqIZEBAk0IJhMRIRYHtpiJTit+IBWxeVR2M/K9Rc+z9xnEp1yx3ar60+mJh
	PVs=
X-Received: by 2002:a05:6000:bc5:b0:48c:698b:502c with SMTP id ffacd0b85a97d-48e3854bff8mr3167307f8f.1.1792760747709;
        Fri, 23 Oct 2026 06:05:47 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38061c7dsm4658755f8f.54.2026.10.23.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:05:47 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH v2 1/2] docs: kdoc: handle nested commas in CMatch arguments
Date: Fri, 23 Oct 2026 14:04:14 +0100
Message-ID: <20261023130444.26270-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023130444.26270-1-emmaonana18@gmail.com>
References: <20261016231148.7b5a88ef@foz.lan>
 <20261023130444.26270-1-emmaonana18@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMatch argument extraction splits macro arguments at top-level commas,
but it currently also splits on commas inside nested expressions.
This breaks transformations that capture a macro argument containing a nested call.

Only treat delimiters at the outer macro argument level as separators.

add a regression test for a nested call with comma-separated arguments.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/c_lex.py | 3 ++-
 tools/unittests/test_cmatch.py | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index efbc23c01abd..532e2c5a815e 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -430,7 +430,8 @@ class CTokenArgs:
                 if inner_level < 0:
                     break
 
-            if tok.kind in [CToken.PUNC, CToken.ENDSTMT] and delim == tok.value:
+            if (inner_level == 0 and tok.value == delim and
+                    tok.kind in [CToken.PUNC, CToken.ENDSTMT]):
                 pos += 1
                 if self.greedy and pos > self.max_group:
                     pos -= 1
diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
index 109141cd2ab8..978e02acfa4d 100755
--- a/tools/unittests/test_cmatch.py
+++ b/tools/unittests/test_cmatch.py
@@ -259,6 +259,13 @@ class TestSubSimple(TestCaseDiff):
 
         self.assertLogicallyEqual("REPLACE(arg1, arg2)\nbar();", result)
 
+    def test_sub_nested_commas(self):
+        """Commas in nested expressions aren't macro argument delimiters"""
+        line = f"{self.MACRO}(a, inner(b, c), d)"
+        result = self.matcher.sub(r"\1|\2|\3", line)
+
+        self.assertLogicallyEqual("a| inner(b, c)| d", result)
+
     def test_sub_mixed_placeholders(self):
         """Replacement rule for \0, \1 and additional text"""
         line = f"{self.MACRO}(foo, bar)\nbaz();"
-- 
2.43.0

