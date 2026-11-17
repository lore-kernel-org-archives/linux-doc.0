Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917999;
	b=4poGwMdzCcWsSiQohbwalXEqgQEcyNXfa3KisxbhudH0pPVqPyiTv+FH+Jw/cJdPpiw9
	 KV4K50L3XIZc1ZaHhwoqygeEosRkATcE7duCwVpje4uwk8awnpbLLVgOPhUCm9+hiRAjM
	 8YvRn/h2cX6ncoKc/V/OSjl0Si4Xb+cXKCUDoWeIfwY7IcAFV5Gd4JbIEiSJmAfFAfovI
	 eP0y7ZdCJ4Re1N9pAwlZzyTTT0eN2yF6Xkp72uVZIz1gmB9mp3u8EFBN7xhjbo24ErxoO
	 dozB32ft7nI+aJRZw9dS6yA8UQxPlO9KyFCYSDQZHXF69g9bH9tFWmZhYxi7iorXBFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
	b=mSXxq2LGuvKdeRPLQQEGHk+tg5vNBISfLFkhgCPGuHxRRYe+FmCWQjYsGsXYexR/4/m/
	 /W4Bu8XSH9sK/cX/pLYVXmYflasZ4+7ackKDOebxNvr5w8nuKLWPUM2y/DrQ8qJeHBVWE
	 +Z1ejAvAGIVCoYa3R2fnyvPEJRf0+UEgqwhZTHceZ933kGrXV2yDucdMzl1xGEQ8zLIuZ
	 UxOJK7AUGaMd2G75j43W3zfbmSA6kLKnmsd9WCiBVxL3/h4HzS2kAXFqMOHGnT57m3gPS
	 CtSLC26kYyLev7Crr1wO28HXgMrk4UKTyxE4Qo/eJXpQEg2cz2XkIh7WnO8FMyyNG0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9A606A881
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D9A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so5589569a12.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917997; cv=none;
        d=google.com; s=arc-20260327;
        b=mEBpJbpy5YWFZkL0QZ4HpQ3VPPofRVXtnDV877fBBqhSTC1MLwwSCOm4Oz8CVuGBrz
         YPUONJPddeIg+kxL+FoU5h0pt2KArbFNDDS4r3XlUBXPmd/XZySKdWIONkffNFOf+Vuw
         uV59Zq+E7CT4yf9D53eJ6TQUOqwakY7LQCXDr9HNgWCdcEV6vCXuYSpFkG/HfIkEkjxv
         67YgcXj6hSFZFu0Ql7naxnvBMYFmJSrpf30bD9JkX6N9vs7j+FALx8VwdSZhmHnVvlT1
         IcGRq64gd+/Rcyuk/pnnbeMtkDuTMxD46qm0SB5u4JF47VLq5Ww1easeRrfNv9Znggey
         AgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        fh=mKc1xrDAGZ9eU5J5Rfk4nxtIYHmZq509YnMzXYEko0k=;
        b=XhKBFBplCxLBJM3ky3lUYh5iKDOp3qXcJqNC4xMiHlC8b6ctzX4WE0v8UGew1rWG1T
         ielMY68jtkCLX3EkLYuprM51+aDi1R0nqASWbhj4+K6HoaowKEEY6wsBkEp1rMC0H7VI
         ndBeVDjRN4thoVFScnjgD/bm8oj37gNQ6SfjcZRNoNnii5HigVuOAzojAALKhhPlu2gO
         Oy+cl6sJEtaMRBEfAiEBdw84C1QnXV0QbgCpgLaGRmfNim/SXSiYuA8hEmaUhkKi8skS
         kwlZWw6JntknhMBJGaM1rRDbEjjx5J9ciSzEPFe4CQw91iNNNShra3wG45jWGcHBAcQV
         GUcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794917997; x=1795522797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=oz3feJS1iAIJQC7p7Mwm1JmwyC1qiU6R72jdHYTvotIELPBf9qMxlog1xtibjUkxgU
         3zG+MEu723WNTYbZ5YYZ8Df56Vtx50NLmAXa5i++s8nTZ2uAI4gVwwNpLP/o2CMOe4eg
         lF9+9E/74uoDjUdpcR1MCP2KgEwHgeOmiBdyGWB0q2UqyXLTtn4QTeLYg3nPdTtix8Qh
         DRZkorWs7NAj+2mcAE1YNat0DZsk868MZmh+EYRECG3mmX9gLw65JkdgO2RlO30SdaLL
         0D5aKyBpnYENo+0zdqGX4kjkEDJ3fKeUAVtbkK/FnkbcHPAiBvFkvzVrHIIKxVHXw2aq
         sd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917997; x=1795522797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=jZI+uZsJJ7CuUMglxYtIVxQCmYj1cUAUiyXlmHkKoWwQC1WRmjs1MaWJVfvwBdH8JU
         ytDKm11+r9genGt+g04SA2+r5vOsX1dUsfaNioa2l/grOMLV7j0SxwMr5t+SHb240Tyw
         Nz3djTIsAKweglMWmAvPKf5gm4Vk3eMpZTaPlbDYq6PobvQrRmXx3eV0EukpJi2/2RcN
         q2N8hgIEGe4lb1I553NnEj0vCYPNcKPtc6Stb0gKRFAnG2WKnQUnpJuWCJ4SWtG1rU39
         0gRbIfIN5uipYH7k2kKXxqI9cyDsPH8FPY6mjmxjUGlmANtoGrS++Kaxk06IDhUw77q4
         trJw==
X-Forwarded-Encrypted: i=1; AL+hErGisvccFtBgsSsZ3MzdfCyNS42IH+QfP3N44hzOx5zxOD5YfoDZmN12bHTfIBIzA5QBs+zZFZO5oBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95GPFatYhcBhJ0IG0SpzGFAWg6vHW8wpzIoX278ryGbgsY/jNX
	FaJ/NNTgo7x6mrd14mK5bh5yljgpO+Y4WNtX33MzK/FDF3WF03gPKJnle5d1g9mRGOkv3h29pcj
	nYl5429jpp85UOdUNPcC2sM0GeesQ/13UAuypOg59og==
X-Gm-Gg: AYBFou3TpBBLJIGLj5LcYEICeZoA6wcYUZObACuXy09WZHVIMdRRITt9QcNw7t7EXwE
	Ky0ECluox97ILZFaH4I4QwfwVoHX22yx9gVbBalWKqBRk0/t4lX8l5TCyf3FFfse3ai7NsiHmZI
	4U56Wp8f5GDhc/xnF1sqyZ3s54+QknwVRE/wltX3kjLjC33uMDgd7TOyKV9+LVCKusrorRzFmY4
	vhUrjuIaxutXf0j95KHS6JdskkPWbiX9uM0WPPQ4UWTr9yDBGRpBAIYRlnhAgqfTEx0ETI/rGiT
	BSG81rY75pE9Vs82oInzrkNHgPki0QJQUl72H6XzLi/y/YV7p+ERuWxEIQi8V1+NSRQZxKTBeTg
	dHns+KQpEwH0UjfG1QahQWxw2hhx4GLElfw5/6QEFpZKGK609u+/5QSqi2OvhlZ3TsqWwxJJlB3
	f0uIetPjAJuzIPDhSB
X-Received: by 2002:a05:6402:1ed5:b0:6b7:e861:8f50 with SMTP id
 4fb4d7f45d1cf-6b7e8619543mr6865668a12.37.1794917996838; Tue, 17 Nov 2026
 04:19:56 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org> <20261116174238.GC2299285@ziepe.ca>
In-Reply-To: <20261116174238.GC2299285@ziepe.ca>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Nov 2026 12:19:45 +0000
X-Gm-Features: AclHuK_ulY4P51VnkuhR_K0XogE5A7oe02gNjInWa6kLbfDjJ1Wh2QAX_5471Bc
Message-ID: <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line parameter
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

Thanks for the review feedback.

On Mon, 16 Nov 2026 at 17:42, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
>
> > Instead, I propose handling this in the generic IOMMU core via a
> > kernel command-line parameter. This makes it available uniformly
> > across both Device Tree and ACPI systems and across all IOMMU drivers.
>
> Something like this could be useful, but also Leon's series will allow
> userspace to do it from the initrd too. IDK if that is more/less
> interesting to Android.

Could you point me to the series you are referring to? I want to be
sure I'm looking at the right patches :)

>
> >  static unsigned int iommu_def_domain_type __read_mostly;
> >  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
> >  static u32 iommu_cmd_line __read_mostly;
> > +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
>
> We can allocate memory at this point.. No need for a fixed array.

Will fix.

Thanks,

Peter
