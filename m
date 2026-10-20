Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506468;
	b=ow8FTcNzd4CzTzFkhZ/0NOwthi1hfRvDUzob2T+2snLTW2ei7udf0mrGiEsEnuLsYsxG
	 pLxtRkEaZRxBN00DtrJiAVLevzWF5hLHpFaP6h4aW06+LvmNBRgnBMX7xpZxElPGufN9n
	 VOFpv4fKEuhlySCGJvtGUCLxXC21jYs2EdE23rxMQFoG5qauDLHAMGogY9lZUVOzGjicW
	 LZyTOlHtJCDKdpvf34m/x0QShLE2W6D4E2rDHlbgDsjt0CglZAX3YKkvdJmrMTJaBGSLd
	 IfXhOiWeFqLvVMEjDwoXp5PTtmBcdW8mKkZdcsB1VjV4fKZWNgL2CJ3ruRItjXTeQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
	b=ng9hGjfikipvUxES08cFufsYTrSp/G084ScUJByvbc9P9gybEfkZVeSojo9vkN1kHx2g
	 F8U70ZFlF3Y4+P0ZwP8lIV7MGmo74e7a8bzGIaTqLRwMRzM6PahEzPHwvHplKzuGD1aON
	 otiyDqWZNkXuVsed4r27ThjEdjtRgKiWwLtYhcJeFwo5WJtbbrMsHYGI8FzN+wv06FXtK
	 z/xYnLar74qc6nW2bBjOBIQSan5pONQ9Dkx8NWTbKOimFHv2aUXfKNkM2zb1QYYWee87F
	 HYsa7G469LeEXXc5x+FJUxNZMvUG7fYvSImwpyXmRgcOP9ij5Y9wBnluALqdazClNhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72458606A32F
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72458606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91bbce8b00cso7483966d6.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506467; x=1793111267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=X9eOmd0MHVJiLpZa4cT4z4LcM6QV6Zh8LasqDEKQJryNFrsyTpXe8C2GA5JHRHRHUh
         f+ZY8STqPP2xvorDdgtZk0o66VY/FBMgPeWW7xqkvAdiUkMAoKSsb0pRX7tvB9CHyP13
         wnAdpSHEfxZywh9nfSmm5LX4HxOBN20HZHqqPGQlhRoWAymUi2qAXTag5wzaxZRG550I
         JrIgYHtIemPegeV/UT7fEuu5TwjnCcBKeLrx1XFirvxvM294rXTV3zP7Z3dteRiDJLzr
         GUj0jcgmXRd7LGzhej/7j4h9DLv64Gh0YdJp+yb4Sh8mS/43UoCNqxaFNqCTEXJ9u8xa
         Dcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506467; x=1793111267;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=UpCxil1xXhR6MGcgsTkH1llVwMChkP6hK/66D33OMl8p+pSdBZqer4hegirxkvLwiw
         GhyuyFWgO29nN4VLSoS2Y/3vtpW6aM1WsfVdojytbwucCOhXOP+YEXjhgeG+5LKwUWnQ
         e10g23fpYeatdGukDLY4LqMCjbUzS1arZfkI6hkKAkYkpojtaXsO6sn2YQy7l3D8VL7H
         mmGHvgFBEiDl5toeLEwB9uuMN9gtjJTntokexzG3Y4m1tXcZYQhkiduXsbdH5D2UUoRb
         UV2aMhUwwbZ/43RDjHhe1vOh5fjUa6R7w/+OuXG2eX3+flDidfOUQ7+CX5XjdUjutHRw
         YZOg==
X-Forwarded-Encrypted: i=1; AKwUvBxHfT7a3K8EJxMWXsTzPxDK9/ZOss/0YPW6Puk6xJsZHMImL0uuOI1/6gFj4S5dRtKUjrqE0RZllH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqetDHPVMiPyb9lKOv3xcr4V6y5W/jOf1baugfaxRllOig8gja
	/Js1SaJ7BK9YVBd29RnOQ2zwHTm5CHQ2Miw5uY223TpXeYcLaAvVp40=
X-Gm-Gg: AYBFou1JxfgqGE7rVZQggOaV7OBjsMYJX4nzzjqUHU9fZnYTbvpd1dzWYflrZ0NDmKP
	Ybmq/OgqWWX6pBhgcpYAC3MtTr319v8jmYDvjwT3A3wJc5jN2cLpR2BWJvrshPfghEvhGHTsa1m
	yoXlvFc8Ug2pE+xjf4Ap0QDUMvu7pfN4FT9TBD7eZRk+RMDVtna0WgUm6qrUt6tVsQOYHE/z4j+
	yQrT7eDZ3dD0d4b0DUWD9HJQ+d9Nu12vLCD2Q6YrsPKz6s5nJx65He4F7p9RYBXDQ0MtXDnttrH
	9PIXpi46XIZ50R8rgF9qOo1DUp6pAfHcaj23wm6Nc6pYU/7bFR9/pXDCHu0sqhvO8PrhQaEybPR
	tE12oSR59lLqrMedHn7CdEb25eb1jSULkAhlTXFRLECbPACe/KUyN+XEHciedA1C7MRu0dqRRkb
	uxXYym6y+lNadruca+qGjGVlCtUviULHDo3QU+2j4JfqzxPm5KOufcUdb3Bkoe526mMlqIc539k
	Hpcq0ZfcTguZE3yHzUubW4s9AjU29Kep5wkSt6VmvbIoLfAeU5ZTKhQl0wTfCiaQRNWD9Y07hKf
	MMjUbT4vKftMra5+EjUbxyvz4MSN7vaXT3xEyUY=
X-Received: by 2002:a05:620a:1a19:b0:93e:7156:f814 with SMTP id af79cd13be357-93f4c1c5518mr352969385a.11.1792506467179;
        Tue, 20 Oct 2026 07:27:47 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0d7c74sm234996985a.35.2026.10.20.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:27:46 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Tue, 20 Oct 2026 12:10:33 +0000
Subject: [PATCH] Documentation: kunit: document --summary and --failed options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <179250646543.2190262.8632957027583518623@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
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


