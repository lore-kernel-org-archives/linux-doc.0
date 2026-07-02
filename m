Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9098E37A831
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020578; cv=none; b=mMMLe1JC+GRwRYoAZFu4JCEjKY1AtRGO7GAzV5Nf6zYbEfMlkrrO1aSBk1BBoMdqon6sEwRCbpG4BDCw+KJGTHqTV5zSnkyB803JnEJ4BlLmf0ceDIu6JfO4YDOwurBxK3yQAIOdS3NSH8HJdWaCvqe+oJX5wkNMDUf4A7dveB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020578; c=relaxed/simple;
	bh=UdMJM06ebK67YQ2Mnbs0Jp1/l3ZNaXIh/MKaQ3oYKr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkHbb8V/ZcZgLRECAPDqohfEJ2DODgUUlySVvhiQclBRmiveoaN2yj5kP+HqqRG7t+3d4PP9MwPtEeE8lBVHy2u2qt64EPzKmNdKRi39w7mPtwcG1X4kqifSTas8Gf6aA3Cqz12GIPASeFsbvqUYSqswtom+IGzR5XsfQ6UNkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOnhQbf1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOnhQbf1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47362928f65so2135132f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020575; x=1783625375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zAwDyBfy9pmItaLqNOcnGFdZ3qhtmyuBm6fxfzFEds4=;
        b=MOnhQbf1/CqJFRSRzJybl3CWwBroY7cPKOcHx4jCNrtLqHUMyB6ujxtqzQhD4Q4xDh
         sudlR5oq3V72pp9i+NAt6O2GCCUkUdhSrA3AGe12ObYoXHPiguj9xOgRJ7m17BoLLkVO
         /F+TD0qhA47QA4NF3Ziw/3TsbzePPCk6tDNX0VYltyakCRYMVig7jUAwZIE67tCxWvvJ
         3VcdZMQyB793F7+xbGrSL3cMFnO/qVVWUDYuSYjeUTb6CdXMPPSFVHr1Xy1gJXBG1/fM
         4/MGvCAXEPHeGMgK84h+38rMddq9Ozuv6Y2ITiznjFl7luuxkSUkr9A9HGWRPzREg024
         In1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020575; x=1783625375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAwDyBfy9pmItaLqNOcnGFdZ3qhtmyuBm6fxfzFEds4=;
        b=LJn5lt2Ht+f0bv0cDxLFSc5cLHP0obWS+8bnQYlgs98ww3FD67+1y/1DdjCfe6xfSk
         HTuBImbtxO0oH7NY3Rv9YhT7vWVliDQ1B9rJqr2H2DTJUrY0JTHiVjdmqVlYg5ijIm+n
         1QlphH5B8WBORUFzSiVKtVRcUNTmGu1/RvfYH3SCK/zn7r4Jh0BcruOo/Lc1ZQGrxUiS
         XVFfmIPb1wCowoeAoTSOK068uMSlb770eEiEGY0mMgTzyYUEPTcn4e/gl0445paRYGJ5
         5Qr5Z8ad9q01hZQfURNg08QUiQqYr2/wLgt8UaCJo1dxoM1qkjilAIwtaVB1rF/9w2NX
         AWtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+mAkkBvLnQfIduG8ocZAOARO1sElCzaBc0pgaoxrHXlGKGA+YExygN6u+1GLuB2VnVWGvSiUcRnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqApghGz8Zy8pz1wi/RwdAgITELPgsUoMsIRWJWfePpX9zrMZv
	VQjnZNCC6qIpzHVmzI2l7GwEQWUuyRrKg5heleedDEn2auax4nKuBB/p
X-Gm-Gg: AfdE7clqietIe8zaRD3ZNgAwWzY6SbtZUr62+ybk0YiYRrdqz7vj1DPFwQG8rzWOKAd
	phEkBa1z0CPQ5iG5ajXHrBJPcGJAgxhLxUhrgfEzF7WiF5siHbZTLCDevImgFbOMWQupYCjw1sC
	z71U0UNqsT4D2DDG9BjrB6r28A+EOj1Y/Az43+vIxGoPsMEgNo2YfSBxm8NlmxmDVc5i0RmeqeJ
	qSfwdSxm7tgwNV6YV2mmXFkmMo+apYj1yCzRE0ej1WWLGmqbmxmh3CTC+eIFmVemC6oOw5HKRMj
	xJSiPR0yOEmGld569xSpnnyjIaB0v9t+K2+HAoBqIQqNDBxsUFkGnQTE8/VWJDRFBCJGDB2vskD
	d4/dlhWOyeow/jQX12aXDsjf4I5V5ry4np6TRh4WE7jHY9Z0EG2vR5521VS1yPrye7KRupBV03C
	isPr/cmLL8vuYNk6vKpi8O03+MFlSQEnhr1JbZUX83Susj79sliw45uRC8ZO3xaxetyze1klOTB
	Dl8xqVR
X-Received: by 2002:adf:ea82:0:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-4775be03177mr9148509f8f.37.1783020574993;
        Thu, 02 Jul 2026 12:29:34 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm11113317f8f.8.2026.07.02.12.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:29:33 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d6a56d05-0c6f-49a5-9281-1194b62ab86e@gmail.com>
Date: Thu, 2 Jul 2026 20:29:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
To: Selvamani.Rajagopal@onsemi.com, Andrew Lunn <andrew@lunn.ch>,
 Piergiorgio Beruto <pier.beruto@onsemi.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Jerry Ray <jerry.ray@microchip.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Selvamani,

On 6/29/26 18:23, Selvamani Rajagopal via B4 Relay wrote:
> +if NET_VENDOR_ONSEMI
> +
> +source "drivers/net/ethernet/onsemi/s2500/Kconfig"
> +
> +endif # NET_VENDOR_ONSEMI
> +
> diff --git a/drivers/net/ethernet/onsemi/Makefile b/drivers/net/ethernet/onsemi/Makefile
> new file mode 100644
> index 000000000000..f3d4eb154313
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for the onsemi network device drivers.
> +#
> +
> +obj-$(CONFIG_S2500_MACPHY) += s2500/
> +
> diff --git a/drivers/net/ethernet/onsemi/s2500/Kconfig b/drivers/net/ethernet/onsemi/s2500/Kconfig
> new file mode 100644
> index 000000000000..f2e8d5d1429d
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# onsemi S2500 Driver Support
> +#
> +
> +if NET_VENDOR_ONSEMI
> +
> +config S2500_MACPHY
> +	tristate "S2500 support"
> +	depends on SPI
> +	select NCN26000_PHY
> +	select OA_TC6
> +	help
> +	  Support for the onsemi TS2500 MACPHY Ethernet chip.
> +	  It works under the framework that conform to OPEN Alliance
> +	  10BASE-T1x Serial Interface specification.
> +
> +	  To compile this driver as a module, choose M here. The module will be
> +	  called s2500.
> +
> +endif # NET_VENDOR_ONSEMI

S2500_MACPHY still has that duplicate dependency from being inside two
of these:
'if NET_VENDOR_ONSEMI..endif'

And I already pointed it out on v5:
https://lore.kernel.org/all/90f84945-e83f-40a8-8d9e-a477c45579e9@gmail.com/

:(

- Julian Braha
