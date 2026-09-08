Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4930BB80
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883940; cv=none; b=OxvFKlkcUuoJd8H4VjkcyDmFbg4QQRU9leK3ACr9Wh+tI/hvz+TLFprZzqLWdCOwVBp/iqHl90VdtqU2B5j/rdTTzr2CGaBTIpVzx1a2py1DVFktLxBB1/5pj/YLoTEeqv4nPEZihcaaTXINVTiR5k7dTUmw/M5dELQHpjzyPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883940; c=relaxed/simple;
	bh=ngRQZd35Jt8WtlvrkxLAiPGXLe55YxX1GcCgc8p/Miw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTMaYRv47duiM6RdagZ/T/YSMces/nX4YjbkIh03jdzZsrxq5uVpn9htKGoanjIJzNZSqaHjUjOjZimrODLwoVzphxSmOeuY4H0cydcszTYV2gmChPWjO5oOgXbeUtVSfaJl6e5xBndLN8q7DiBjRQcDIpJf6cbMAnb3gFAnHSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4J8Q2yy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4J8Q2yy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso40935935ad.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883937; x=1789488737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=e4J8Q2yyLgnaI3DuH2ilWxg3DHl3Q0BkXvbDPlZXmC2w4+ftoonQL77NoEVp338iiX
         gJFWe/t0mVVAw1ODfUoCMFm1GWazrQZ4Yx5xlxl0TXHt9oKcEOd5UO6SgZsIkGSalrcw
         8KqiUvLhF9XFYJGdo2jbToC+/M/DQh5KuJndIHo5NfPeDp5MBK+SpTddcwyCDXa6Gw3d
         Wi+U3v3cfm0E3s8HY+LEas8r7lq4ckD0dtfZCO3vOJkVO25cxCEkqRBp5dYvza6Rt4iu
         bl1MVzlG7rcvcoBQZ1g6gjLwoK7qQxNvqfnv2YZVDf3sQESJLZ8gB8jvrrZnEPWr28OI
         NIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883937; x=1789488737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=k4Udbx5DYj7jM2g+9E2pNjigtPJUAf2nhPFdNIGX+kfDgRK31yki9vU2FJ/EZI2dI0
         g5IzqTV6qtCmyHNcEMIV5Mt7epxlU2QVP7ecNvr7Ml2YEK6d5QUTErikBZU/KE0Nvslb
         8/T7wuuVCdmKFkcF5rBOn0GhhhA0pdsC7ZLLz1UNe8PCOG55tfyYHY/vt9z92IggXH+h
         4rk+t1zdpmxJ0DQyjHvUvlCL3kr9FGu/mFC/fnwGTlXc8whv2Hf8JZxruC9BHL1BIH4H
         UFQlc4a21gOHRPiZ3wFmlzqdZ4wb94v8A356f/ze9CnBC8UAn6VSorlwXbR0P+8hciXy
         olfg==
X-Forwarded-Encrypted: i=1; AKwUvByxOZXgdPscQrLWk/NdUaXhb5bBZlJmHnOFaBxS198QZRzimemuOQJ3fkHOeXNq4im3VsOTC+n9JBU=@vger.kernel.org
X-Gm-Message-State: AFuF++lglj2JanG9FLu/+YQ9QF53LnqrS4xO7YWmNLAVCIQeYZ02N9Dp
	o9wc7kpf7A4X0HCR5ypCFmdDQ+XNrhLnTW0/JrawGAej6mXJNLjQl7r0
X-Gm-Gg: AYBFou2eAamq1d+HlOBbxjFifwWOEbaWpPBCKlpVy6oyyeLgMUT9ccE2oTjjfnJ5lwP
	UoPOCmU3RUB1uDGj02IgtVdg1ZzT1d76WdqvmJHr5drcvvDfvIdoTphh6J1RjkBvKvuIcTJcnv+
	wJs8aC6wmfudtPv7kh3HYfK7ORTEA8WEWI9jc8sAPEJ1SHGgbNhgHAmtt56W3x9A8YitSApMJ8l
	ZJzIfB0e3veYzuBg+veVtPUVEsPs/ihHoRKnWKrZz08N8hmYkWVAusbe/IGXmX+cITtyzWbPWHg
	cHGNiKUHvCBlRxUEZEu0sz2m1I+I0/UM6b5DXfvbNAtMMqaqWffo+wyvzw0la2C5gxij9gwq4JU
	lE5jWW3p9PvJgPO+el9aCf0YZUzUL2jAzFPg2MVvxnw6K2YXyXu+ySjTUPPdIbg/ADqqsxFeIbw
	Jku+wZXIETYqfXrW9jgQr1ANpRTuoiIoEAiaMYjaTowwxvUgqBvEqZNsulX5gqPVoDOcAIWdS0f
	A==
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr170023395ad.5.1788883937378;
        Tue, 08 Sep 2026 09:12:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b419sm61093785ad.13.2026.09.08.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <ba945a15-bd57-4c6a-a738-53177a9cd814@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:47AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the temperature sensor ADC (TSADC)
> controller found on the Axiado AX3000 and AX3005 SoCs.
> 
> The controller monitors the on-die temperature. An SoC may contain
> multiple TSADC controllers at different locations on the die, each
> represented by a separate Devicetree node.
> 
> AX3005 uses the same programming model as AX3000 and is compatible
> with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
> used as its fallback compatible.
> 
> Also add a MAINTAINERS entry covering the binding and driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
