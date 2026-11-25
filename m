Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620235;
	b=f9HrMUp/3I/JI22ZKBUIPgHv3m4ba0JzFoa0OrI+LGZb/Hsg7IRqABbkXw++49w1hQ/G
	 EA5/fNjWaoR2TWEnapNsuW3zq9kDZpdGVjxsWVN55+mC2iwuLsOO2sEQVj8iTsIvphYql
	 MtEYuD0hFjY5+rb9LtokMapWyvY0G5T6hBg9zk7iZermx3iIK2aQZQQoA8b7D91W55VfY
	 xrYFKBjXX9BFdp3IdQD1Q5wDzEIgGakTs3j+1uuVW381w6uh8rfEiOXOuTm0O3xPUR+7/
	 kNaIOvWl+gZNGUaZmpCW365to5yW92gOHk/3riQq9OByqi2gLiR9550yxPj77XZXEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
	b=YmTG54lKlngZgSPsQNBf1wFutJtxMaQXNGazJ4FNcl7QH47UGWE4ICGYONGV5QMNyOQ3
	 TPgNY3y1bckLgK1h0Ccbuub7qsY18MMe01uiW6Dexycj0p3jtbrgKOA5nTGoIOwq5MCVD
	 ut57twJoezL73qjuApsGuKXJlHFOPFSyTJBDokJWkIVowrMlGfddHNQvGC244bfb5ZNWx
	 4/dRlSMjBtRmccx/CdAVUKu38nsudsXpZHbhsQXgzxQDdV4YRTtlfPW097GXi21jj1DWi
	 tkdNvCklGKxIpb1nWNf3rNpnweJOkXia58eV2w52SDA8/x6ie1CTMK0zMUiLwYR7Y1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HV59Go/c";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908FF606A6AF
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908FF606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV59Go/c
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso5640125e9.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620234; x=1796225034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=HV59Go/cpYxcL5WAtD+1Xny/BMhy0t9/kE+xSUBeIAXT2ybiCQLIyTQ4h3HkOSA2iq
         gNyH9I8G/McXyIPTXuzl14x+pjVZ87BluZhtNOeTcSGH4nzsaFp3M6hxc1PnlWFzuXK3
         QNdVzw/Aejc2xEcOcciscKn5TAVulJgU5L99QIYaUJPpzsS92Cd0hVkaEzdBtnIwti4U
         pxmm7IGW1a67oLYNGiSKwli/TzIA8SRprYd/iw9Ry8YwYmozZZAGEDyTU/xj6VEZn/be
         2S4/cgN4xMsLbNse50VLvxG0hag43J4BvpXXIFgacs9GnWPvyHuoy1fRcnJxLdGbM6vr
         erGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620234; x=1796225034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=jxFvjvBBy6nEwrA/bW+MnZcvtdjl367QqtlSDBbfpF7lPYeLebJC1hEBhJc79r9K35
         4nChQ+evcE6pNoaI53wF/+S/G/3X5embdCzmcnp2c09gvoYjaw2fliyPp+siYN47Hkxq
         DKPKUBKbOk2ui2hkMffdDluVo6h2d/IhVDxGQ83WLC2NwX6mSQ+jMpNLmqFxGrNw4sMK
         s2tx/8Th5DhahjN6fAHEo25Su2bU+hsZE+i/p8q0DC8RvZAkyVzzhpRu78HOWVVGRxng
         G/a8Tm33MU847dZQ/E9PuEzbThjJYQVZuUWVEkKVW82hwT6l0BiIAlXPixLC+FHnuRNY
         NgVw==
X-Forwarded-Encrypted: i=1; AL+hErHQ+bJfo29KSkGfcAlQkxL08/BpKGYfbqBss9BLwsqDgwin0evz5nILZKyqqmwaUxGITgoiyuGMjhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nflr6egMaTiXOxLCKdVrQs2Xqkrm0XEV0W/emBgVbQmW+ebCb
	fo4CW6L2lZEV6MhbVUQi/hsr/tx+jxglPrfFhIJyjiSwmWpHYSFlsh4T
X-Gm-Gg: AZFdTZdxEV+IUcryrSvr+AV4bhmwd2bRcbY1F4eHaICBYO6N7qlRlproafEGgUEEsWS
	YGMltreBvYa980KhEUIGsWjPXSrrQytej8ME2lL6Egkg5zQUfkj6xBlmiyUGLh+o7pbrhQ68VaF
	oIUAsOE+RQb3DZCWsm2ptluxSORvWD0f982K6/e38AF4g5EEUIWmRzpx0QylIjmMs9pMKoMojWa
	1iGGR3jhgvOZmj3LRUR+Alf7xAYCE0BEYTbTYYVjU57kK1bSy/PUYN8e6lK6Th59KekpC8i3p06
	CyGkPf4sxMXkWwuJqTgBRIZNpZcR86pRWRG4c2boOkplsDHaI9p49pB9XeBxdohzudTBjDpgwIU
	OZrtCnHjGxgN+s7DCGSq4p85f5aitGJbDmFj41U+HJDgdonaAanhTi4BLFf3wZiHH/Yqoot10C0
	q/beh3MRLDNxZY5iRK4UWzZMKOJjS1YJLiDTKtZzjWGfGVRW6qv8r+dlv4W2KCRWxZyPx8N+pQU
	L1O13AiDNfHwgxCWszIeBgiOei/FHwKwgrtHXy6Vzk2UWX5aLTWWMI2UcNsjvYRz/2KUnvTb+pW
	xi8Cvj7M/17s8U27lO5X
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr344398855e9.0.1795620233772;
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm316515815e9.2.2026.11.25.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Date: Wed, 25 Nov 2026 17:23:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 7/8] PCI: cadence: Use phy bulk data api to simplifiy
 the logic
Message-ID: <awb9XRze_e8xt9tA@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:38PM +0800, Inochi Amaoto wrote:
> According the document of cadence PCI controller, it use multiple
> phys for multi-lane setup, so replace the loop of phy operation
> with phy bulk apis.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Minor nitpick in commit title: s/simplifiy/simplify/

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
