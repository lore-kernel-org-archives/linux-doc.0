Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF036DA03
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442796; cv=none; b=I7O7Bz8Gcgqhm2EWprRB3wsfKxh3j8BXU5n2DZ6rsOgGi0WGe5nFhzvvoFf89LqYdT1Jh0XetfsH54CF7SZM9tYHNUfFR2pGikqJo67BZoCs+se9zEliAAH8V26ZbUNcL49jHUjO+fm0s5fjua38W6de7dEGmsjMmtdLdVXL2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442796; c=relaxed/simple;
	bh=9oCu4Lneu99co+mYBGu/auRMtfjyl07++3cN/bPv5F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdfeqagUuS3h7PART7VS6dfhbOUmu7LoTsk3aSAiypTp1zUbG3AqdXnEaqjjpI1stKAl5qr786Oqgng65uZSifmfCnh/vz/uiOwAz30yxCOFI4VMg2LL/vWo00Bod7RIak4//CKdKSRMy0ccSFRR16Eh9xvwtH0n4YaUXvQmxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6X7woR3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6X7woR3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3523733f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779442793; x=1780047593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4EjzCYBZo6gDDp6/NnHFvlpvgywvXkHrB1KsgSmjjY=;
        b=D6X7woR32k3X6bkMCcE8/Awx3scNlV7W+5yCVGwsMjUy0XpeyZ1YL/KfBl96RKUI9E
         tA9HNEVUV/MnIbA0wrhEzIhznUQlZeuz/tvTVAVii/YFR2Z8nzMnUr6B0tZ5n1rTGUqE
         eM0YS9WNWFH/7qtyyE5VPRzGHVd0K+b65LLn+4OeiDYzSY/Qb05IOMZjnIVIA0oggPEY
         zWsIJfVITGAaXrmrGDQj139K2xwU6laD7Ywghyyx0eb/5eZwLu28E7tkmmpgu18raSjS
         2UQmJ9mp4ZocucI5y35McyFCvmAQaGIts7TwGZebi4t2Ua0jcfKwYwLUAf9g7rDek66h
         +2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442793; x=1780047593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4EjzCYBZo6gDDp6/NnHFvlpvgywvXkHrB1KsgSmjjY=;
        b=VWElFHyh48cOm7RluALS8RSDkyLrD/V2dTTBRb/2rSK4weGayXhPdlb/MPq7IF6dE5
         pTS/ueEsACsJW6HBQ7RP2H0/qpnFBUJEX7Rfg7RkuO5Pn2Wnb7qQUPz0AaINjVyhkXB7
         hT96wgZDYOyAKRutKYVT9SxY80Cw9fW5dsti1cUhYYywbd5sl7rZSIDyaRt1KMTV/gaY
         Ttg1oj8nVPd7cIYOdOZluJsWPB4iLjjIFx7Y+jn6cMpdUmfST+juafDB8GgGT8aTigRl
         wXFnlT273DP2kwzAj1n2QhYKV9jn7LVrz/yoUk0691GhHnSqzFX7fDFWyb5xTK6BreIj
         R38A==
X-Forwarded-Encrypted: i=1; AFNElJ+YwMPZef/reBD7MLVAwwxzCgXrh24WpPoL02fZ+CffDFxjYOy/93mElVISOi6H8m+ZwTVg+gCWUNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQeaSF8X65ZZLZigQYimVKiDzaFP204euo/KM+RLfDIhIiWCZ
	Yb1/QFgT0RCtc6ews2JSGx5fgxEdS+2fsHh/1XeSSHyqtcN/ELFhVbM7GbAAyO0UjyE=
X-Gm-Gg: Acq92OFKAQF6lTNXXww5p5Z8RfB2bRcsLdHzvevL/K9+gWP8LDZPA9y8EcPbFXHrTCS
	BBkcwPjAWo+1jtsk4PitB0elKAbbhWvGroGQbXEUW67bj4YAGbBha4v6tzbmGFVDRBG+Gx8iUgr
	MDjDur456BSj+k/wXYJaGTQoSAOec8e0Pd8GUZ0T08i8FSBsIGCZvr474nGoNkKKQmY/lD1Telq
	8rPbmJkP6frAkBl1oGMMB3YfuB7qM534MjsAIifAjKiW/Fz3jazEIZNbpN+tjKLtD3wMqmJbjVk
	q/9+tNv2RRjaCmDR5BKEHXKSQuSwwbb4U/lVREDpCk1FD/PTAouM9DeVhyIi76dJpRFg7VWd5rs
	xKXr6htuMz5hsJoTMrB4ca8NXOyvHWBrzZPxa7jKKwqTCYnJ3lNmnUUCZ3fA/FwI5CouJHQIIOf
	TcgqKfjPNPeNpxq08u9QPZCqG3ELfG2IC/eTPxUnYh0Q==
X-Received: by 2002:a05:6000:290c:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45eb38af531mr4204251f8f.28.1779442792871;
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f6ffsm2725005f8f.1.2026.05.22.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Message-ID: <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
Date: Fri, 22 May 2026 12:39:48 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
> intermediate variable.

Please squash this in the patch that needs it.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 07269e09370a..540cd221c455 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -62,6 +62,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
>  	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
>  	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 bp, val = sr[0] & bp_mask;
> +	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
>  
>  	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
>  		val = (val & ~SR_BP3_BIT6) | SR_BP3;
> @@ -81,7 +82,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
>  	if (*len > nor->params->size)
>  		*len = nor->params->size;
>  
> -	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
> +	if (tb)
>  		*ofs = 0;
>  	else
>  		*ofs = nor->params->size - *len;
> 

