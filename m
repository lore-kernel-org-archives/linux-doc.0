Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533938;
	b=Q6H/RoKFhFeDCPsZBVkr582p1LVZQ8vpsxjtKdRgi9G+bb6Nifc0KI8Q0yDzcLw6hkSM
	 aKKsYBC0PPxP5QqBq9ojRZx6aDn4d0KfldkuTYRNN3G3Ke+OOkDpQaXtyB7ZpoV3gwhh4
	 rDauM5mxupJ9Zvol7s7aynlsBGkviZGXi/M6o/1g3EDHpLqhkTTbNMx3G301LRsIc2+Qk
	 4eYczNkr4YWe2U9mJADsgyGKINJ7E02vk4NeylJrubko+6YS12tswNpBgvnU7nrO6vkLv
	 8hfhzQXk/wSJPBPWQvmp3/D1xaIQDwjSGd5I0/BPYGIlNO6hZzSnQ2uiWaZTs5DIGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=2IQ4Q1gwF7RIUfL1HO757Z1bmFQ0MS8Ns/V9GKKLtoVcRy6dHUav4Hd7piwrjzQXKdu4
	 aTIazm9L2oT2/GzstcpYxY1P1sF2K5DV4eJqQc4jLGRUW3NEoHcmbs9dtpEUrpfRizKJ+
	 eq90im1E0k/TFKLVLp8Qa1u8ykO5bgEuzRTJJAH1IHyQ1R6DN+u8VI3Mpkt6JyoTIBKGJ
	 T7Fz7gtVoe8pUu25mG0QmCdRoINpMep7I4rkKMDfbtZWRXcxcn9X4c7szOgoD7IhIWPEP
	 qljJcrQrRwvJs/t1EaHCJT2Ju6H3LsLA/Z/PQvmNRh6Zkpqv+jSAus/HJprp7HVI3IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="AsV8CSY/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A4606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=AsV8CSY/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso201059eec.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=AsV8CSY/FdkRK3D9/1KNe7BgVcelwRhs1z0mHznTdxwQMr2iFbwwUB363Vf/p9W9KX
         8fS00qkgynfdEfGy6SOYp8MxhNrU7cn3ddfa74UpAzElWvKuf139ystaiXV3nCUylyA3
         8qqDxRQh0zGIhkVCWgO7Dddtrjjns1+8/StDLU3JgXwU2YSK3uCqkLdyYylhtJ6eUZga
         Dp/cgvsKpzWR0AoHd9+GAAQon9o1sSSedj8aGuCU24TQyOEB0JymXZ8kS+/eBQTYNNHZ
         AEd/ddl0aYNJzOcDn2Uf356RCVarHLYaN/HSVH5q6UkejoqdNucHypbK05mH9+E/lsbl
         czsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=WiAsg6wYn6Z+gYFhbuucSbxrJALGQAbTnKpoVS+v7oo5CGEwUxEGbmFUx9LI8dyPNt
         DV9oxh2Eg1u6f6z9ZrcSw+E83MJDF0TEqn0BmGpILdJb4XTRJB+HNdYwuv+8kdSfdFn8
         ag5Jct+i6RHen+rx8x3HgUiat79XDmOHC+OGxKZSUy/2YhLuZ04TnekumbwuR7bsosC3
         RUPdmisjlHtnifQ28P6Yw2QB8lifwer2Xkgi7x4AS9zeouTtpp4nCgOSIov3shJ3Z2Jl
         p76YqWIs1zdk4r4/Q0MM5WERNnrtmXjVRotNRfBnVqUjr5oImRXAlr55F1ah36SuAoIo
         eSiA==
X-Forwarded-Encrypted: i=1; AKwUvBy1CSu0osSZcPyOjWuQzobP0Dtst6N+LZgoUI82l3l5fwYiIjujF1VSlGtCAZSemiiYvxdgcoHyL70=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgPfVzQzzZSy3jb/vnDgnXULtVLLl5lyYCJNwxWLKFVAZ1y5dQ
	ImjopX4qFQpRokL6NE1dJLqvtW9um4T84NrrsGFldSKCEH1PoZRM2qffA+q3Qsn5Arg=
X-Gm-Gg: AYBFou3SmS7XE0FoApeZIBsW/g493gIkuHR7JlGgl+1/m70I161GeyuNFtq/sEXF8he
	eHkIX+t7NbDVWMFHlHZ5cN6RGL6hR095EfACKLK9n6JtdZOGASEcw6ct2Zf4asL2cE/0bI82oPF
	yvAAZ8+o9wDh4Ucp0vUiq03A53R1vMq+BLziNhKQV4OqyvnsJ0vZlyIj2zvviF+heF9PfFvyojE
	m1vp6ZVpv5J1D4x8dVLDCT6Pn5c1JKTpRy7rxWkGdAY52LoA8iE94DfZh/CsNYw5b8c7UH5CkYz
	bR6svDaPePLWhWRwfRWTfAq5CrohH+FnT908oGbTIN/h7wCD1EKCv0EDNr4aVheo/NVIpw1t5OR
	ZfdQvSHZlUGGoqO0dvWCGhwmExpXTxHOUl+uXrSD4bztASq9wxHhkbjQFWmQCTDJdgy4viFGcSp
	MdhdcDt4TOEF8spP4+3Tf1kskfoco21cLtGZhjT7cEbq1TzHcRMKErvZvTltDSFuTyzmC6uvhzx
	zXb9g0SEQxj
X-Received: by 2002:a05:7300:f3c7:b0:366:3257:771c with SMTP id 5a478bee46e88-3674eb33844mr720723eec.16.1792533937462;
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:30 -0700
Subject: [PATCH v3 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=rZJt5k4qDB1MMTkhJjfIYX2LMM4Ew4G5PDKXZLCBM8NiAQFJTDWyj8o51aUe5b5PQWBLGGThR
 +D+asvvMwBdCTWgGnz439D/A/lN3CURvvsvaFuTkffY1vlFLkAIh0Yu
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

