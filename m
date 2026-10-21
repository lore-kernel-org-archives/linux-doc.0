Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551733;
	b=b3DCzI7Vmj8p6ChREE62nNp+b0xmLgBTDs4QkMKFKiZAUTQAiPFX7r6+oalSRMl7tIq3
	 bEeHYPN+pifCI5I8xplJT5FLwnFz1qtAKpLnd+ID5Yj0TDGbd1MTfzhQKTqr/DI2gN/Yu
	 iK2RoTQOEY1b5lxa9mnAfC8oaCm3gVtO1iXY2O7A7tc61UqfTFkcnHDHlA5FsoAmRTokD
	 IjBm/vq3zasHD5oeYKzfzg/NCFAv155i92z0IhkoP9u/eImX+bJ2TfgdoFJw/xSYw96Bv
	 eFIG8lENSQSVGsBQAm5Ut9546MVCcOT47d4A3CYtgRpDw6fL8puOT+RmyUMNFS2hzEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=Zdv+azXMa8xnGtnBtQqPq9m0db0yj1h76VLkG5NWoZGHz+68Hs9AV9RVufEHuu0otUv0
	 Fpyjs0areeKLOo5Y6jJRWmQ6I9/iFWNTB6nrJ/I03JoNGpaoKRYE/+y9ivtzPMGeDjzML
	 fS00v2+3FmCJHYrfCWdg95ThcGxRuynaXkFUIuJfQQevgHdQQC2isWJxPm4nP7b3HPX2w
	 ahlQDuWOWcVPhA8S6mwyKNXwMjxpWCcf/ay+/isJsrmJ3aJvJ1KnE2mVLz3RDBzJ4eXuZ
	 XiTpwvotjiRYA4SFAdh0kI00ekclMOSDIAerpQ02I2t9nA6ld0BIaLcFYQ24CN1t4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACC606A32D
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48ACC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso471372eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551732; x=1793156532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=X8kWAAgGwp0SKv+CFS7ojR51KNSrqnta/qAkbfHkLtuT0riX+O6xGeNfLd/TJMB+kt
         n//S5DfSTuB3UBax1bjyFY8/IedkMSGEBMUZDVleIyW9E4urbhooEfjcQcrDYB2UmeDb
         KXJdCDF5wSU1ufbez/VijPdHZeBSZ41H+EOHQGlh1gTl6qIfJv8VTfND/LHVohkMF1SK
         ScI+He46Fa3sLjoabRoa7RO5t95OBKUFWrkUzn9Xgglz6+Ua2q+pye8dDH5hpJ7ZPO85
         5wJ+jvaQuRjgGQwXvGDv+8FXxSdf/OLIK6nthEo+ioQZeF+YFfcjXjLPkkSix8CrD0zB
         8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551732; x=1793156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=GES0w/0dG85/VM7s8qSXBAgjRI2+tB7335KXnSU19JWf4SBaJy0Y2tAZyPG3ftD9Wn
         CWohRZm76KgTxRNrTLr7HKRYT/3plOJg2244utfUZT7jycP3gtWPTsSSWKKtYM3vX816
         GocmohaXrKCooTJMz7BXfSzmLHtS1/XvrZ/Skk6AvfISiIKip0PhBE5ZMS58O2UtuFpe
         RjgBTCk00/s19EdiVF49C9WEf6f0ltwIeoE4PGF1ZaFnzvgpUCzsJV/GsH07K8d/RkqG
         wZXJMgu5V6daHRbBbmPnJ9cqemb7RSBR5O4WnRBffKkdyciUlelEcnLjAuaE1v9hnD1u
         R3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzWMFasLGYZNs6sOr9jVcc6TOIw8++X9c4jQx4SSbdR4n2Vkj429jwzuzfZ1asdEGcdtJTlHtrWwas=@vger.kernel.org
X-Gm-Message-State: AFq9FYILK2BPIeRIQLJn8C2qtOyfjhsNfPFHZgoA4lvN6V0U4JYNKvI0
	vB0RupF54tM1PDR+6Y+oh05zvY9cdhFYP4D4jnyv/ODWKYyFOQF0NqyOATi0aOyfRCY=
X-Gm-Gg: AYBFou0mmfTsnITb+Wr7Wn9JL/JOp73uUzdg5my9lBBEowkbEOzoMNlDMWGunALU6Iv
	32fZbPMHKuMJI+VjQioKqb4wT6FpF0BultidEdIBuR+EyzaZoPt/5Cx5HLQrK+JJ+3TWr1wupBq
	L5CkSca5owQcXXnw/3bNZCbl63PEQbcnfUisGBWJYA9j5wIEfPy+eEbHXDwq9jHNHxc+3NEspRM
	svGXo4YoywL8Vc8IGxn8oIx+y4jKzARe+ujXGubdpV5GiNkTkwS/suB9KBEaCw3MmCHMri1gtBL
	lf94f0eCLhjk23e5DhE2q7fAFoqss1m/sZJ5sL8HqZy5IAG53IbizXKuef/bVRYdZcgNQdFpnAC
	pEivb//TlwURDYK/Wd/0MvqRlhp6TxHIUtijX7uzbdzWacjpJCdApdRnGrQi7khW8/a/09Ee44j
	0n0y5dj2aDs5v07tZab07VDLAY6Dqx2AVno5qd2NAywYsz6+8sJbUdfS6D3S8sELi+ZDh55rsm/
	Oq0o4xMaZZDTaFn24HESPYX4srUXrE5enGyD9vZ87C+qWYvAMH3GDAw7MARDO69yDN0W4StJ7aL
	F4rE
X-Received: by 2002:a05:7300:80d6:b0:35d:2c2b:215a with SMTP id 5a478bee46e88-3674f11d996mr1956331eec.35.1792551732270;
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:05 -0700
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=rko2sOAQYQ6YKmixqBcMieuEhqCema6ugmvbB19RSjqYLJ6NH3/YxenCEWl9qOkYndCiSaPqT
 niDkVQkKgGdD5uBHGU+odEvuQ/LIugQuoWlYefGKh2frpz7WWdi9J/6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

