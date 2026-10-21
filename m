Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551734;
	b=fKdakMnUpZXiAKiQAOgDmXJyTd5lmtr2i1KquNVYpaUfOCBwnWNDM1MQy9l0e6PExkij
	 RoyWjfcppoTAMXyiwG2iNfuKkxsTHDoujVjgLUsq5GTUJlQWPvI+Mrt9kEaXOKPm3r9Ro
	 +h+1UujgEOfszeImWkJf4AVcawdSNxJfsM0uhmQc1PIxbHyFLVcEy2zsqg5d5JAwh2o+V
	 T2oQtoP9ajDy2GIwpMfk2y4apM4wRMbQXdP2Con2+chGBjfkED7IRzX+lh4iYb1O/k4aG
	 RFjnjeq5TLW4oZ4gfg/nfrQYNdPUZM1hXtm33eegy2U/U0w2o4131syBl3P8MmUh0zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=4l8D+g46BhJXR54tnUksC3FlAbkAHjuNecXGmypvgEN36JG6b/bs5nz/tb1dxgLk+VcH
	 ML6tdJoWo7RXhSTcOiwR6kclbpRAvKyTQIgLNLPO5sRvNLjRkUNGjPNu12AZo4bWvoLZy
	 q0nxyljHzRFYjC/k1oaKZ9lysGfolQpPMMOpDADOcTPGdttaiJjCJRij6G73R8psyJv88
	 gVs0tSWQAgAhr1IM4uo20dirFE6NJKufDDIQMHUqa8i3/JDKVPBt1CyVqYwJiAZswii77
	 41YxTnvwlZqnThWn14vbaFJIDN+3zpbBOuf+ab/b1sra8e9kuIUri8Ab283siWP/hRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF6606A329
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76AF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so482694eec.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551734; x=1793156534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=OyKb+VRiHivA263Xy2QCsTKpkhUU/d0NypsLDpV8kv7ulF6+EIdhvwgHbCnhpjZYk/
         2TWHksOUYx/GptVqd+dFLK3WNM+ZSKBtKVb8WO2MtQsgLPjPsPoTPlhU8RPNpxIyp9Kg
         Bn6Z6AqEWD8kFB+Sj+2WTDCEFuXnEzzUjG1jE4dUVLNfOjraEmVhBuP7mLuBKCSdV7XN
         No9wkl3As8JurEkIejQWxvPNqqUajCNUHV2CmB0/CJKPMFoeSiEPiP6czha0Hw+8bhsq
         Y8i6qYReNzupZH99xefaLCFp8p4cI4wTizG3rqpgEyPiiWljZlLaAbd28K765Zgtvirk
         NvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551734; x=1793156534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=xhOtvWPXmYwmqPhbDxuKGkapMwdfd9LiYt/os5Xs2ryYwDWD5iCKLQcYzAz1qWMZoe
         BgNlPIsDO7R/Bb2pgVi90mJDGdgjlnI95ZZLdp1m2JyKsERbw+ZbUJvhOAyZU0vEPYYh
         3heYBuI1k4WFgE4fYy3UT/pNzUZ/f2O5TMl5gVWIPYV4k0EjVwxvT6XKf1NRA2A9LcSf
         ghNqI++HIvjYgR6QMhDNw2fePnlQYO0NSoN+E/Q05lCMdu4tWuZJF3ByPQ8yQftljGZD
         pb5/jcAy7e9FkI9fm3tlJYHi3tBVNtkqdnn2orOP1S22P3EwYTAL2JSE6fA88FzSBSUX
         aLhA==
X-Forwarded-Encrypted: i=1; AKwUvBz3CxFdkuU+frus2CD9g1EFuCDPAkNpr87w4rVh2R02FWgKyYdCWVYuQi8uq3H4X/5Z+G6bS/ET/ck=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAc46LGt2SQ2cL6kb6wZrlcCOQ97XIxy/FdhIVN+nQ/pqNxwcD
	pmRVhXi8rZrtMDzJZZj6PCOkP+Hgi5E3NCJCZObMsvVMqiEvBI6nIjBdL6FnosrCnkM=
X-Gm-Gg: AYBFou1IM8FBptE6nxYybRZzZ8IiHr97L9qS+k9L8+euqCS5iKxPFQ4wPA3cKceKnim
	YuTeylvLmveUNQqXFdFUWUDHIOGppjwn6h6hw22WKFgYTMpSlEBwEBdSGwkqomsw1SMVYCvjhX1
	4OPvhdbuYeL1pTl6pv6fbWKcI76dAArBTaLDXZiABS2E4sGTSQ4Am0tGM/FGW46jDAFf7vxj02K
	XVhMeitgQGnt+zVILtkERNK2Yyg9sSI0RY/Our3wm21wdGrVlmnUpqs+9OQ1hyy4kU8WUfuYKFQ
	Bq6JuvCCTUTHc2n9GBBfl3c3OFyqHrtGUy3uo3REPf0qjb8eZ+f3tVgkQ0DM6jHRMTkgKckbEJV
	7eBlr3GMwpxwtVuE2XCUKO7SkuqoM/KUvpsiDbuwiyPO/MGlLtLe8Klclxv11XELXsb+Hx9BEnO
	Spdeui+smFt5X1d/Do2WOvLqcpqeptqShMCRbDnYorCZ/SL7ELm9/wSLJMazrRnf3R4ewbfreVS
	uhi3bZuRrCZCjTD+m+EVBYkCgC59GKOw2u1ndLMyrIIgE1184vtfdgmAOg=
X-Received: by 2002:a05:7301:860a:b0:366:6ada:a052 with SMTP id 5a478bee46e88-3674d84d319mr1455767eec.8.1792551733311;
        Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:06 -0700
Subject: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=ZR+1jUcctG0ML9NJYbjTUXiZ8OahgDHMRTQAoKHG93om+tIlU/j0W9gBsUuED/bEbOC9JNX7F
 VW+Hbti7lLVDZsu/l9Qg2XhvBk8KokV79WhdB/IsNbYhtchl42/JUIF
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

