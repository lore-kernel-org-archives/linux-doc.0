Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB33C8C7F
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443821; cv=none; b=FCXACJUxuNeErr/2JvbNJKsF8M/Uy6w8/0iV52g4RIe1CM9s+fBUnWzu/+C6a/UpYX5H62jIuOAxsfnQlofRBqSptYlk8xU+vfFDOvLqovZSD2zXC5yYxXK35cbBYQxuLwK5zBXQ1gh8TG1PM8XFf89zQPDPtBhGjjZeu9Y5aOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443821; c=relaxed/simple;
	bh=VXMTp2hT1DfVPOVdph3cytpYtZD4f7PiQbS6Q3IV+8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buGgB+v2UXOSgwQWx6DLTJw3T+uDxMtnllElPWBzOmHwKwF4mqg/Xqzwc6cIGVzn2qhIxOnFgsbW4mog9CG6qQTZuIEvTpbKGYnB6sdrdnGVkHn2FMUnjRuKxHg+G3z0L81sVrasqpGMED7WgQ4mecYFE4IocxrGQXGFYjx5WhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZ4gdmDT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZ4gdmDT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so9233085e9.2
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779443818; x=1780048618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3SzrBOlCrckP+aA4rKT29EYfixN0BXUD7FV7+QYzVI=;
        b=mZ4gdmDTjO51kdV0W/2CTZ0fAFBztitUCQhQNgb6AvUymYUrUWi7RlEyYqt49sqRNs
         tXT3NOKAlOX92lTRWeCcPZ48ZA7MwFOYwmnoMPUCglQHHiYlp5j2iFpXwbkTfCmWSDRr
         yl6+j0rZc5hDmCXCXPB4NrQ4i4sJrz3lGDU12A0yf2ZHBFCyQOMpMSYx2ppBKKkrty3o
         YkB6gBAHUwGMZkj3SAsZu4oCt1Mseq9um2z/S7UkZARlc7xnru4BRFbOx4Y0VPkVXJCq
         he4fz0j+G3yDLkNmmRVwd0LWSTBPTYJ5peduPsCKujBCwrISuLOHVy0iRhKlbB8W11gF
         axag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443818; x=1780048618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3SzrBOlCrckP+aA4rKT29EYfixN0BXUD7FV7+QYzVI=;
        b=WCH89NMMcDyJcRBamQjNO6iAdfhYAxRg5mZnnqV4knkECPZhKKUkEheBkQ0RjLND38
         I0kVSLSHUCNHoPr/czWTgxJvsJ62UXzIQE5xFXxclNuCE+8DjdA/dZ/e938u3i9eKxnj
         Ci9bob4RhQja+VS6wTxE3ISbjLC1bm5uE0Mc/7VqKh7vVRrM1QKaxZZSW9TMdSx6FqGg
         aON5UrmIDANLEBzvVmbJtm8rQOZNZ6xc4CEQ/PXxj4yXcIfFS69nTmYpPFup/ZmC77qL
         IKR1gmvXilukb5AufhzFSxCtOcb+5eKu/I608PvVsimKH8VG0J1hnhRu0oBH7Q/MOJ5Y
         oF0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Dqb08iw1Ul4/HnPd4hnFijPzDu4tqnyYDldYMHcu5w9AFotbMY2P7KiVG+nmwEqzq0Zw9u6kWfIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0qlk0eYSIsKTJMTxHil83MBcdrxkxZAwzEwx5V03W9bKUl6A
	1DVXu9PhQuc8rbsh9/CNd/loHLuSi7b0FR2U9cd8zO2xzU2pA3ZxmuzD67h1aUnkms0=
X-Gm-Gg: Acq92OG07okHG22/hngprtsS2/n+F118h7I9QoJhb7whkaW9rUTy/uoRgWI50+IE5qi
	pVnVRkE6O6OSmpMhvhldQK1Kq0p340ZLv8bTnd+WYTK0ZQNSN8X3psK6FlduH6ZZ/zYa1PdSaoD
	oF+y8OWjy7iS2IWOdHjdsApoCLz3/S7U0f8ZtRjCxLPJFJKCHNTSomG9z0np/fYoyLViIdjt9Hu
	ATLfG8LWJfKr294WLyovmtomH8Fb6w0L/57QfUkqJ1dt4VuavSD8BB6sAvNBAMvQpnjd9Ccw5zj
	0BA6KjFVsZnYf1X0mTRWhrjPV7BbOmDDwZfMWu5+BbfE2xWk1yWbBP43snSo4ZxRJNvgZ7amnJK
	8ztRaJE4lifN7dLYx6CdO2EkPaeLpzZl6I7YATE4iGu8fijKtdPcr8xuolw27iuViksz0A0JnaL
	00+9zgnMWxfhX9F/QBOki0o/qGpw3gpfpTDI8IjFlA/Q==
X-Received: by 2002:a05:600d:8444:20b0:490:3b8b:6ba2 with SMTP id 5b1f17b1804b1-4904249af9amr27400615e9.8.1779443818210;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm29624265e9.4.2026.05.22.02.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:56:57 -0700 (PDT)
Message-ID: <0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org>
Date: Fri, 22 May 2026 12:56:55 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/28] mtd: spi-nor: swp: Create helpers for building
 the SR register
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
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> The status register contains 3 or 4 BP (Block Protect) bits, 0 or 1
> TB (Top/Bottom) bit, soon 0 or 1 CMP (Complement) bit. The last BP bit
> and the TB bit locations change between vendors. The whole logic of
> buildling the content of the status register based on some input
> conditions is used two times and soon will be used 4 times.
> 
> Create dedicated helpers for these steps.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 83 +++++++++++++++++++++++++++++------------------
>  1 file changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 540cd221c455..8aa0fe297188 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -125,6 +125,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
>  	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
>  }
>  
> +static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
> +{
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 val = pow << SR_BP_SHIFT;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> +		val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
> +	if (val & ~mask)
> +		return -EINVAL;
> +
> +	sr[0] = val;

As sashiko already noticed, I think too this should have been sr[0] |= val
