Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581074;
	b=3wtPf8KQNrzZXgAOYK3R7I3QrJFJFL7Cu7lR2gcNoOO2NByG+V5Cw4zU2/HlQqG6Say3
	 lYZ8apKpaHWT8Bd5JWKEgQ2P8W4OSP1+u14mZiTrnPsTNtA/eoGsRt36AAAxYhJF/Tu5t
	 WK7KdDyzefvE8DpMH9jv3mMOhkCj9iK2EwV8JieWlk/IJ457L6TdT2Ldm1dX4nHMIegfa
	 AoX373Fl3sGfOLl4gx1CsnORRKPk9me7Mb89VP0aQIaFi+ZaPbZjKuwW8KHv/KAtz9iuz
	 W6z0HqmttM/5up8EVqrNBnNraG1oLKiCayPRGt5PSfi93+PZlsPpNIS8vmOJLG5VBeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
	b=rfSmt4n1qHaWysjevY5ohqLYxf5t/A5mvK31Ys2reNQs+dE3b8B4rIX+Cu+oyM0E3i4V
	 15dsE9ct7+FiffsVRK3OH6D/rfciEYy0Bu1kKEwA10DV4Fq1chB/TyCDcBb57odRH2DIf
	 ZntRgcs3sBWgXpFb6zfg9MPErBoIy0tcN3BkSAsQ2Hz3OXJFcvBKZ6dgjEg84J5VQtt0L
	 MopT3oAyW/6YcNvSLxGBWByqkIKVpFTs4QfU2tdEk3uWVK6dPu8gAlWb2hH1twrCuEWPp
	 WMGpsJSTkjiYzerA6WciFAJOnrAwCA2ZKoso2/OHr1y1oQZUVzmvTbEgYAvaAJIWUvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BEB606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53644ab1f7bso47633661cf.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581073; x=1796185873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=t9xaBilIOSfrKNfdyYoYv0fqw8MH2K4V/ls2xdv/XMF2Y7q+0FeBKT08Y8d356eHZx
         ZZrO0XeB7oddmjUFHDeCZuq09o6W4o3F5l679+WsVsjdpvVjrBPpYqTziW7ImtZ350k8
         p1iBOcySHX2sS+BpiR9BlFHzYvx1Xf5ON00IpOEVWKdWm1jVnlRFvOGGzkWOZ7Fji893
         S8y5w1WZGalKSlup2KqBhICVzJi2gliF55C2HldJQMjAtm7KkLZy2sC67sVDx8rhKCws
         c1q3Kwib5FBhJNmqRxDoxocCrWBe2NOGQ4Hdek/jYKrlEBbApxyLcDVCiAAO6dN3AfZl
         nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581073; x=1796185873;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=y7BhqX032JrK2sIpzXX1lucJREYU1f7dSIzfkN48m74I/sejXVAdnsfyKcbGPVG8eC
         3uslWzpI0invK4vXKQJ3oMtprSCKkxbJWl5WVYxEDmzpDUPgDFHJMcYIW6zh0HSUt0UV
         MM0IXekOMbqJtDA2+d9CuhqHUpFoVyuXfga+7vXkOU9L392gepBNrqguFdY7dI3OrMQH
         Jd3Ax+lUz/kMjh8QA3L/DpLjOm81iy9FLPWyvTimrI4MU/XlZRNXOgl3SO8EktuP3t7Z
         XfZftQ1as8baYRllNJ4IW/lGQLI9smnH5jqVB25zUou/l+KBz8cuutPw8V25KuBokrcn
         lZjg==
X-Forwarded-Encrypted: i=1; AL+hErEcBeoPrETtp6o0kGpSNaYHxbhOQrs12oK003xK08XjJMxkW2QYYg/QhhJppeVF8a2sEm9M9W2RdEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X2owfPVlgXyZxntW81ats40w1Gkt3Rv367mV/YUWWUGd6rdG7
	/cS9BTk6nsFEjhn2E5/M5GTguiwwV6i6oRfArxHHw8I+x8ufezTqlEU=
X-Gm-Gg: AZFdTZcetonJ/nHgc5dEfmEdN/PLj/+vQLBV9k1Atb4jKuzwCQjpQ3807Q5aQul0fnh
	usQF1+GTd5YfSifI0/vlI7Nr6msPlaLorJNGakDwEtzlmqY/E2ysxYa84xzd86mq1PlXrss2Gc8
	c/VbAMdtlNEJcqiplwCDs90jz6kyesM+VMg23AvohOPRxE6VrvTE87rGDF2oX3oQ+oMp/eF+jc1
	jp5Cox4yuUFiTG9dgcjsHN4tjyxOu5dmRbpLEqAYKzgyxF6triV6MmEGzsLObWQK1/+pBmIBwK6
	SOPgpi7r8jjfOLCQDkufQfSy3buEvExllbsZFOzyay/rTlsneWRTsSYpzYEvoE48wQURVIKGriw
	g7L/DsJ0AcNVVVWWktsnUeRJAOe6oFBLYuG/EaH6kse7a0f4OuXArzaCbsiQf8AgXDhJhGwWDp+
	M/18WW0NaedZTxNSpq1dUEPCk6682HruE6NlTBdWza5AcMCXme0v+cC83UHunB53DHYEwvhNeG1
	pWKvSueuXghfeKD8Z2xc20T28mWgcYg60ofx336VbHpVphUDZpG6qv3DwYAioBy3TbliOjLCHod
	GRk8ns/N85KdrPfcg281SWfyFhu0igTWFBRzo7EH72jprqALhAa28xS+AReLaU/iMF+pSauWxuP
	I10/YlwuTGKZrGEZutcPFvEAiKi3MmtY0HxJRuxeQOGBDNGCOTaPEiKWlmLOF/RFwwNQ+WrubcC
	j9SLUQgt83ynZceQc=
X-Received: by 2002:ac8:6545:0:b0:55c:f5a5:3900 with SMTP id d75a77b69052e-55d76aa8574mr311966681cf.62.1795581072923;
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm143087821cf.27.2026.11.24.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 04:31:11 -0000
Subject: [PATCH RESEND v2] Documentation: kunit: document --summary and
 --failed
 options
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179558107134.36587.13120861622026385297@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Resending: no changes since v2 (26 Oct), only Daniel's Reviewed-by added.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


