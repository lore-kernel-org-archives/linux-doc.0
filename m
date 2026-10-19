Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=lJcu5nwDd8n6CS9n7Iw6ucDjhHBUKTEh527zJQ9iex/GYOPN2hb59f7ohOM1zsRtwdjr
	 UrN7Zbm8NzYDKm5/gGvr9e593Qz9iN45ZL/oKN/Umh7JjpLFUfYTMfmtrUpumCodvkK7k
	 RjselSD92RYCOhw9w8TJJIPi4UmdaoUiTEeteLRu4csl2Ovfi3RFtt3I2iPq3WoUFnENt
	 HlE9n+PYkOAIPtXsBdrXGCel5qHDrcrP855//lkhObIp7DGGGsutFrSUva5cTcGrmjt7M
	 gPF4n0XNHTrTKuB0CVYKHO+P9U/RIpDwgq8Qh3weUUldK6AUvn+0Nqi82vKgke46fmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=J/f8AAHebLisoMyxOIVbRFhDIJ4aXc8OlgYXbNv6RK13cw1HnvTqvelhsEHDYl0lHYeY
	 hexXP4cs4G0itoUgW1fZ6tARETnwf63XgVhJ4+gr33e0yyU/4IZWUfBqDe98OZoTCQZQ+
	 53epNV5U9nhKmrV+vpHgIpauY9eYUnnU+HiQlo+z/xHB4TTVQsXLAhVUjlo9nEl4oRb1D
	 11G1glTBnTZxBO73etQJ6L00iJ0GL6niRSbzxPc+bUJpUpZIsqSFTGq/L3QzBVb7Fyllo
	 6Q4+hbEEd+YBfkjuKlEEuznzrwRCHZGVZHrCb3TOU3V+RfOL+vIpC2qMt8HYLjK7SYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFRtXTw7;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D7606A32C
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 18:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFRtXTw7
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-188406bb948so164330c88.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=ZFRtXTw7gETa3yOcrSTIGpZYMi+kw21LliD3YuH+3Ou03Uyrxljt+Kz3ovut8tfawa
         LY8N//60fJ0qRWZGeg9TlHHGwAwok8uK8CNW220QLmfNiVtgYHkxNBNgLw6Kx1Bak/v/
         KguNOrjpqW8TdJs7zUksEU9M6ZknGedZRtq6NA1Q6cZAc5erECLAlHNlj7b5+HtEldYq
         6Ut5RrSL7DhLmxT6AtCCRDaQJmBtQJlyW+f0qtdmzSbnXCyC0vv/OfumrmqaHcwtf2fR
         2vWheWtUvm27LAEOpoTaxiZr3GH+BWXdKFsEBQ/pmOo8cJaBZx4oKDkOEvQik5MWXLH3
         BOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=0xrU2gGlCUI5fIKaDbJU+B4GVfDGFkx+nGe1NsMFpGcGit8jsEihADSIxpJDKHCEFk
         EGLNo2l07c//srZq8UnoWQSFjagjIUqEo/Rid78wYVTQw77GxWNQ0t8RildcPrhSIaZN
         j/OMK9Ie4fvGJvALjlivGxFjlwWgPyXQRqblLQ8iDHLgTpTN2XpQufJir9Qkb6MO1lpe
         5e2uepcviYdPVgBZHAa5ayrLK/5r3NT5ShJcjfWh985yRRViGXUUTSKMszv309M9fDCg
         /xTB/lseUfxbl8X5isR1unQbXe7RjRQ8Mrp2SZSJ2aiZJg7o/q8OCDFLNd4rPY+jxow/
         mBlQ==
X-Forwarded-Encrypted: i=1; AKwUvByzDxVhjfnQ/v4xN0cxTK1j0bYXfJr7DX/4imvLOA5wPK6tsloHokV+GGV090yJU3mTCxI5Z4F8wOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ojPXCTrSf6tXSeOFL1Z7M4oYG0EmUznxXikZnXcZjtVmn7qk
	ig5vElrNLkbjnxZtYsqKP0OfDsLAJjuXFgdk6mIiOxaJbBWomk7psKA/nPTitZCB5zg=
X-Gm-Gg: AYBFou17f0qeA/Ntck83GBanqoBmOGT1lJqURBLn9go6O4GnV0Nf18BxobGuftnhJQs
	duibGVcRa/u1t8oY32+H+dWELP5TaCSQg4nA+FfVkB6bKHDkgm3kUQzLZwLQqKTe3DRvEUIiYzi
	5k5WhbtH4rPIqGlxMdizgaSBJXDaM4xZ6vw21GcvhrGGERwCeDXT6EATIyIYcYosq/lc3FOuWpK
	NAsOoeAgrEuLADVAKjdw5U1IPXIbqQum0j7gPtCwSdSvwsPPCOO5n1d93aTSNYhqPdTtF75/S6R
	WdjLfIdq/6I32hTZiuHnB1LIgbyLNN/EwWiCPcHANlHZVk5o9H34C64vLF+39W+NJC+AToA8TsC
	ks5HgcBqq1pWMDL4gswkaOlry7voSz9C5J8cTzdu3uLY2+mEzTZamTBsoaixDS8Qy2GaRzavgIT
	hYCOdgnG83dVx7oAHbRISF7QjDpSOAscI7mdO5wUHnw1LWV7IPp2ySgfd5pdYlAZuv
X-Received: by 2002:a05:7022:b043:10b0:144:c128:4c4d with SMTP id a92af1059eb24-185139aa945mr12351075c88.38.1792435544338;
        Mon, 19 Oct 2026 11:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:14 +0000
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK
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
Message-Id: <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=Kh57j8s7DigWfkjHFM25DugGH1/bTpHjS2ftggA6TludMkXbm72al+7MlNKKvjFQkZ2BdLHJL
 cA+nHKU/lXfD8+FFfFBtdWxIKqrGJKB3rxBJfK43MXO25pJmZ/UkQJ2
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

