Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02901C84D8
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509311; cv=none; b=qvKsO5Y3XObMy7MmJ6o0Tol/8n0U89MozHkegWJ5tZkUf6JxWWPZsmtjrGImiOodWuP0KZSCKOBUkmuNdxGp1FhK7t28z91HOCTy173zVT1mWsDdPnyJZ21Ge+H7kwy3pQ9HFDcEDkDwekjtE2YC/+FbuAQAaq3FMu2EMtyXHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509311; c=relaxed/simple;
	bh=tCCjly+Qh5AY74QbK5LfS4mXEJXwkw/OWlEpJf5244k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0bNwWkmKTx9E6rvWiKKLRHu1T1sQC3Lrb9wvNpuMvCtTdpqKsU4JlHsNUyO4QoQ/9K5Ztjgz8uzTmYXEgnSTYCSvU2SSJYyYeG3E/Nt9q9eP5Y62/QsnitcMwhG/POz3TIji3r8oHF3rk1auCInAIJ8IHdAIa3119FdRlPbZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoH3j/SJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoH3j/SJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abad214f9c9so109410466b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509308; x=1741114108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=IoH3j/SJJNMyiCNeXqg+0ck4j8VISqO5IN9kZ5nBdSnw9B3b4QcdgP5xP67i9rpDxX
         dmTS2sxtoRltGWqdZvOserGg7UJhrR3BixI/OXKBDKtSDThMkPp5Mze3LXLzGFV3g0tj
         pRHBYiCOKVK+GcpBi1OKpuL+ZuGa4xeBvln5nRp1fc4qz2YXfkMrT9SB4L7XWyoGujBn
         E3PYoLNkZoZr/RzT557MuOvqOthd1f1TCQkS0gihwQAnYtVIzvusr265UD/UOiC/c2CJ
         COQ9hrI/cMSEUg9jqyFs6q/yCivfqO6Gbmps9BmvaMKbdk0ilfCCcFVkhbbTxUCnYeQD
         g0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509308; x=1741114108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=cIJTv8JQjgy31PAtksgg/ppmbKTNMIovhDeLLfmu+Vc9fwO8wAgIx/r4h7zfu4NTCj
         1bELOlmm/raPyiCzySeaylMM4R5BhHhXAcUKDE+qVlwF8Fd8qZJhhVZZa3Mxshs9kkKO
         pV7q2el+jRaQpolv7I5l9GaSJsX1BIEL4M0WaYWovmXYLmVvfDwZ2RXrfAErvjhJa+KZ
         5+i/FuxzomBWN9yWmD/cUv7TO16rZxoBI1BbfenTLOyeshaH/Shl0rLpeBi+5hFEs8Jx
         OZWGY8J7xkNgoVshW5E+TOzQQ/nBiJiPsq2W/YZTkJNG6xSS0+4QY7N4EMGIqLGBUry8
         Q2ow==
X-Forwarded-Encrypted: i=1; AJvYcCW/zp7hXsQC5Ufj+dYzDAiilraq0Nwy0nNhNEG3UdxMYBEzrgG7VvucZuDwGBCEwU11onvjMeAHSkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNEAjST/TuEm8yzgM4Xo79zc67kBpPKENOMjGarQUxMu/bT8i
	cdBRO0YGEKk69dWLc1+HvTCrEigtCv2GFvsSTEv31D5+WFscVOFCmG/h4kFl7ao=
X-Gm-Gg: ASbGncvZLHz9ksS2bSbRZO9qfASQNC8J12lIoGhT/+0eC+hDaZwpXO1euSBn/fnh8Sv
	/60EivMlj+vZAqN4FLqZUo7UXvy5WcnZGNZcy4P5vE1ubGbMtthxh4CNVaTRulZS3olRDy05T84
	NcU+KJLLsoprQ8V4h6uQ8Exja2stooc2wTy+Wmnvtf3+DUZaXbFCHtPU7QOAJ/YAfRraTUvyCU5
	WC0t3oT46NOsIXMr0iLKwGnjIbC8KsQOCI7QFn/aLeckh4g5/7y92SmFJFlUTevogZxA41ENLt5
	XLR/WgcdZjQydSKqKUhkNUrXG/P8x7hKhxbJ3vcfsc/65kWeW07UceW1PgPq6sPTLQSfgdWcWkQ
	=
X-Google-Smtp-Source: AGHT+IFKOZhRHtEHCCTN5BHVYVCPkFDsRkb7jCM4fs2ECH+kp2S3Jaa2qQ2qzrnOEoKDVZtT2N63uw==
X-Received: by 2002:a17:907:2d20:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abc09a14d0dmr792407366b.4.1740509307824;
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive
Date: Tue, 25 Feb 2025 19:48:22 +0100
Message-ID: <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree bindings patches go usually via driver subsystem tree, so
obviously testing only SoC branches would result in new dtbs_check
warnings.  Mention that linux-next branch is decisice for zero-warnings
rule.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
index 1b32430d0cfc..5423fb7d6047 100644
--- a/Documentation/process/maintainer-soc-clean-dts.rst
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
 No changes to the SoC platform Devicetree sources (DTS files) should introduce
 new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
 results of issues in an included DTSI file, are considered existing, not new
-warnings.  The platform maintainers have automation in place which should point
-out any new warnings.
+warnings.  For series split between different trees (DT bindings go via driver
+subsystem tree), warnings on linux-next are decisive.  The platform maintainers
+have automation in place which should point out any new warnings.
 
 If a commit introducing new warnings gets accepted somehow, the resulting
 issues shall be fixed in reasonable time (e.g. within one release) or the
-- 
2.43.0

