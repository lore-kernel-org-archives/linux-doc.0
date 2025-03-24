Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF925E836
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826341; cv=none; b=jOZ8pq/OX1t1/HTkP2OkQwu3MHrxg+SyXX7BdAf5bnQeYWusJILg+Tkl0EPeAZUYnB+jLR9y5thtuNuV9Axum9rSco8NESkVZA5PPEuEgOcL1AI3eGCavtEeax3U+MhvP3d0cy/Tw209rTc+VhMTmLdUNpQHypcy0tRXu6J4+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826341; c=relaxed/simple;
	bh=IoiJglPwGwlJpMC0UMeANARMm2kcf7CCM08KAayvmOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyYZe2dxDIrbjen8TBRW3i3yiNqtWXFW3WuYkSWL7lHX2c+0vmAZSj7K8wpi9UieJAXuKey+vMKomg12qmd1w54zToLtzIHOKvvT0tzNDzZDy818q1iWspCCSgtIUOXjfwX0mIRuFnnHywi1z19uAnTpQGJYolvxAI07kZS7nCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gmg/8sTf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gmg/8sTf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso33333755e9.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742826338; x=1743431138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNdG9O5jTJR2BZ94MdoCjTahgOrdl4gZ3SIR34gpAIA=;
        b=Gmg/8sTfsyom6GXNFz3D5cwXI/pwPd3gGm+8dHn6yGbqxZAqxFtneZONSMw37tYPT8
         aVDZ0YCAjhXxDVuk9D/5KauYINP/jLXUk6b8Ys+VQT/4Ian5eF7tKCNFsoPb/l6gA54p
         pOVVDn8pJ0J+QJRL1lNz+rkO2oumd8rqc/i3KJ6GeqEQp5e0jijYu1A7E0QSZtsfHMNW
         yapczrLRXrhYQen0coO/gu4JMMYL1xuzkw7kijnFrSqCTEIVRhxuMdAPRMjbSBCdnKwe
         pCg0p7M6Jd4YrLwP0C3dtps1TO1xFQFhNV7TUx9wCLSJm1XTEu5ibY5yY/FnH6+VcEqR
         gnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826338; x=1743431138;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNdG9O5jTJR2BZ94MdoCjTahgOrdl4gZ3SIR34gpAIA=;
        b=GZT2J4FPF1p7yDxxZlcP3aR5Tmdu0tWi7gGmg89XLwy2fP8MgXeN8VWth3Dc+dkHLR
         evvBF7VvR/TIDWwDWS58/cohszqaCSop0/hO4mnvxcloueM3EJjL5wA7pIwY7/n0glVj
         cfqVMozdgNU6/u22ncOhJwJv3ek3OrRxuztE9qD3mlajtKGwj1aSUTvq6TqRrS8iJpAH
         UUsmN7rQLvc6ByXfTKgTK2/MnENx08DSSprohNIm/KV4SbyURa1iquWswAGrmeLNqSgN
         Cl6GVD0NNFvC2r5P3DAd31UjOo7Fq2FKtQiYtrh8nhRKsUX0jfntMYrhdcR+LZuGEnll
         LPhg==
X-Gm-Message-State: AOJu0YzjjNWNaJnAq93KbNY50eXAdeDOH6oNCkCy9oqBGGD9Qxe9j3v3
	M04+rNqAfKLwm/MPUNN5YHhwn+OWDVZkrWPoC83rcdBOGRimHICv1pk+Ni3U1KQ=
X-Gm-Gg: ASbGncuS+L6W+/0W0FqxfnNUcfgnrGFu6FkMEA8UKaK9dQpYIFB2KauNWd05xYAYQlX
	Vgd6FR2GcKGJd3/TB17GMBlMoHqh8qNSJc5DruHNfD4a+1inM2g2GL60rHWkY4HoGC53ceAcFnx
	rMmpE08cZpkL+N0eObYVa3Tb1InQzwQ5O4Zn8cteQ/eSKS0KzfEOdXMG6tRO2+r63cZwt7Lvsey
	NmWkn3Gfi4d5UAZnmpPnN/MEER9ptb4ax6f5fJulObd3ZNJ3WQ4ukPYQW5kEzh66O4TATZFg17P
	M2eiyNAXQ6mtCr8qntb1lmnm+foFvTJYF3E1m8KH7gT65qFQR6Ht
X-Google-Smtp-Source: AGHT+IFacJgdL0YCtYfMpOjSJaGjYTLUuJu+RCC/1A/kfH6d1pa/dPUdShqy13vrh/HjglhK4TnpBw==
X-Received: by 2002:a05:600c:45d4:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43d50a3189fmr122312855e9.23.1742826338160;
        Mon, 24 Mar 2025 07:25:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm178498245e9.40.2025.03.24.07.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 07:25:37 -0700 (PDT)
Message-ID: <3ea4b352-c679-45e8-8ab9-84ba074c3e88@tuxon.dev>
Date: Mon, 24 Mar 2025 16:25:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: page_alloc: Add kernel parameter to select
 maximum PCP batch scale number
To: corbet@lwn.net, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, paulmck@kernel.org, xiongwei.song@windriver.com,
 ying.huang@intel.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, geert+renesas@glider.be,
 wsa+renesas@sang-engineering.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126095138.1832464-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241126095138.1832464-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26.11.2024 11:51, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Commit 52166607ecc9 ("mm: restrict the pcp batch scale factor to avoid
> too long latency") introduced default PCP (Per-CPU Pageset) batch size as
> a configuration flag. The configuration flag is CONFIG_PCP_BATCH_SCALE_MAX.
> 
> The ARM64 defconfig has CONFIG_PCP_BATCH_SCALE_MAX=5. This defconfig
> is used by a high range of SoCs.
> 
> The Renesas RZ/G3S SoC is a single CPU SoC, with L1$ (I-cache 32Kbytes,
> D-cache 32 Kbytes), L3$ (256 Kbytes), but no L2$. It is currently used in
> a configuration with 1 GiB RAM size. In this configuration, starting with
> commit 52166607ecc9 ("mm: restrict the pcp batch scale factor to avoid too
> long latency") the "bonnie++ -d /mnt -u root" benchmark takes ~14 minutes
> while previously it took ~10 minutes. The /mnt directory is mounted on SD
> card. Same behavior is reproduced on similar Renesas single core devices
> (e.g., Renesas RZ/G2UL).
> 
> Add a new kernel parameter to allow systems like Renesas RZ/G3S to
> continue have the same performance numbers with the default mainline
> ARM64 config. With pcp_batch_scale_max=5 (the default value) the bonnie++
> benchmark takes ~14 minutes while with pcp_batch_scale_max=0 it takes
> ~10 minutes.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Can you please let me know your input on this patch?

Thank you,
Claudiu
