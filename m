Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482223;
	b=PpwjNil/wVbGHGMb/UrAlZuqbggb3O4cU3YZXIzt0mtxBu1oT28MlSRjxKo6RSyvyuM2
	 H39+KribTzzeSvvXA7kn9n/17MxJkXDgT1P73n+4J8JXpAowiLLtCbwKPjIPnCgbnTt7g
	 WFyUACELPP4VELcuuWOMUkEen4qbkC2by+/SzNr3KSdel9H3E2KzMBVrqB8WQuDwaJZB4
	 2BaH4+zPh1RKc+O77yqnKGEx7gOAYvdtLvSNqwHO0gIAYE7AuNdZ1F/t9wxu6g6Si9iDt
	 9q6L6kgN1nB5YNTWBI3CD1wYny34pIo/On9GodAz12kkJ6SAU/WRHC2vqTdaOmnOdGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=QcEipmo23aTxH7a2ZCmCRQ6J0IG+AdwZY8TsRRzpSbUvpj+V8nr8uoupQyRFR9kwOjf1
	 c8h7BY9uiR9k2dKuWE4tmj05qCroYFBA4VeBC1YtOw0w+MHpecn36u+OGIYp3zYc1K9SX
	 Sdotms769yEcbSQyrkJ81wVIYNP16LwVjl1MzKz+bY+2hLLLnBYsx840kIfhHSnqivrSJ
	 8R2ow9kTG2sVp7t50+TK5hYOVL720GHPuMVueyGNYXOpZoN/4JtJxlWjtEJTAlPqruwhh
	 1aKhVRIoqY6EBpT3G4nZD/4fEZb+1bADtps3sRQpT1kIqKqX9p0/tTvlfVdp90kcKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09E606A326
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C09E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524308eec.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482222; x=1793087022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=jcz2VWjkuRfgXbBhx/KKl5w3vkhEDoiY+Wlol1+XvK0xP+awL4v9Q10OcBvf4rFcl4
         mO/gUbwhDOwJgHa3+CTRFamicC8LDSXg83G8H2GKq93UyarAqRuppkGft3Muf8i/cpEz
         8cIbYEJLL6oweIwHxr+I1CSZS62dOD8k8EJNS1Rg6GMdNsxGAC4/4U1/46f6YsuHoBFZ
         IUy7jtA/n60fl3/GARvQ8sikZqHc5EvHkGrcUHxWUP0ZRCjEgWxnqBUw8TXkzNuGd5JP
         u/YzV0jowInNgDG43z2AzzZ1Jm0upj4IGqA8LugeJuUe+edGwWHoVzfB57k1XHwcIGzm
         YlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482222; x=1793087022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=oaFYxBR2Nnu2BcAG1wg1uMmJjA1D066Pzlesfg+EFLeAvZzFngjhK7Skxzxl5x949o
         psioUcyEk6mEnYUApe7iTzh3Dtha/eV6jaiAfPmuD3lYrVzO3V3jex+flxLvyqLvXY1o
         ExLmU0oN5Qp3iiVxV9EtCyRdbdG0CvvWW7wzRn5NrNiLgpNrQnmNprmbmbSKMul3DQQG
         71NzPz4FhwKNmIp4NKvHdQfIws1dwm8DCH0pa7XIBVJU5yvdnIJE9TojYmv8FpzCOYzx
         zH3MBLWipSTUJxphAr/iSbflbtcesttCrkQvNIECEmhpXWcoQAgm8JZz6z/voklLq12C
         EaHA==
X-Forwarded-Encrypted: i=1; AKwUvBxay+b84MRgAcxP32UKNMV4wuw184Snwp2fSOgMnGlYYSnl+8f1mXZOuC+f2Wm4QoDAmgjKkXRCMac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnRoZpoevcWZlkzRH4RmI+3yVBjdUm3Jx4S0nQo72BMM0d8c3b
	YRwfH6X7+Zhivr1+zpk+Thy8u8O2Sq5+NGT6W5eLscyBGn0pXnkzrTuos1q+aArVlKM=
X-Gm-Gg: AYBFou1I8eUNURqWZOReTZ85SEf6Uxq1XvIXVbcYXxJzdU8PcSNbB12wooGlTUcssXb
	6iMCi6344j18neNmXquZorvp3b0PKgpWlWZt+sev/8zGQL4aB3JovUflDZux62EkHLHPkiL8o4U
	iIEJa+W4cGoG8M7ZdPm5oe4waqD6AL8ZIC8pcQAFbHC13M7QlWpkPeYq9kG1ux/fDCRtB7rPPvr
	J8Xd3f59URwc8FJCjfmNP2o+AwwKMTf2JTD9t2IUQTuDjmJzGedHmCUZNkFYbKIWehWnvxl+kgp
	tpn6HB2OFkafTGhrrx8ZBoHm/YZVYbSLirRjQRMNs+oWN99dosEdsdC+g27xAQnROxqq9jmwYri
	f+1modmu4z9Ebr2TifAv/WtI6J2dnNCw1djk3ZQqR+ceFeVZRBWRa97Ax19l4xwvvrBtHdh1Kuk
	TKZJ8sDVbxgi9haTagNNMSg803eyQjUYtYJ23XsB4qiMj0QCo8SNnEUcGo4kLzK0/Nu7BrYsZRL
	Q==
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr14671485eec.8.1792482222408;
        Tue, 20 Oct 2026 00:43:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:37 -0700
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=Gc8fMRC2VdUO2eazAV2eIUKk/69CqdZf3MnaUZXQVl+m50iPHpTIDDuZqOY9uzqOQHCX4/rxi
 Yd1BAvbA5N2ApiBCaavG6v3/71xIelOS9dkW1XSGs9FjolgOS1/HLic
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

