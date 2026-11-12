Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495589;
	b=OnpFFKxVEB/eAM4sTavvsMs2IY5SyVIeQdBkSVdnr4ug17WaPGtPm3dPQWcS0h0Ejs85
	 5O6ycTI3zzmT4BcOuumKGBFMPUwUfmF8qng47PBctXgtrSCkuZy01Rw7VK1aXBmguCe/r
	 dyfe07g65yko4JRM48RCA89yrHST7FeL306uH1WSnebaSTrHMSXsz6m0NJwdFRVD6OZ2L
	 9rY6Ru0FVKTWo8xkNmyF+ipyPKn+br8yTSdnr/MUqbmkWqkCt89h4Ep1x6hEzmhwuPErf
	 +oY29WLYYMPo9zcOSFy6tkM4KqFIVD0VPzNhSA1F1W8Jo5zOUUl69GOXmsMOvsFWzBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
	b=kUNF1H6h4asv5jtgeKaVdhueZKdhnfLP0QECmVZaqjkUh6lGo38/ta7C2ovex0kv+b3l
	 V+NxYIvlXFFDyy7jCDChywiq4MmEh+0IxQ0/RcR5tDYl3Ve/THENiakKOuqtzEQvcvWWs
	 t26QZr5u98a16Zgim14T5hrRimtVmfGgYgibqG/Q6vYu/z5/mzB8509MiQm9/pK3ZNdCB
	 DTYuEow9kuvFHkOcfXIaw/20aLcmnOGwusF53HDx3oyZqQUI7SBRC2SUxmExJ4Gh9IbpX
	 Tjm0OAXdeRpwIrsYY5/zDbIVoDw5Bxdi09yeNPDQ39pBFoqmQW2FyitDMrRjahKaCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=J+z2zQ8V;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD3606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 14:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDD3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=J+z2zQ8V
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1176513241.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794495588; x=1795100388; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
        b=J+z2zQ8VHRJcFFqlTADvcSOmWe6eY03hnRX5vJEZ2vp6PkhAZXob4HPUAeA5Nz2n+x
         ez5YSJar1gW8xx/OhHDz15mhL3bhP2d78EbbkAFjWGC3AdHGieXev9cQqPKbVWOCZCMW
         R0VGWUALgmyVvdc/SdpzfFxPvE9RDU6MxVEw5KNEME3KBOUE9JgYqe6yQgqsTbHgMNso
         bPRYs3vz2LSLZoKuc1694QigbenpXDTWTxa2785Wgn175jxTQGopyRsaJjKggy40lUsu
         NLyGNPpfVf6oPwG0Xnfh+yaEV1DcYXPve38+rKv0EsMneWgHvQhYHt6yNkkjO00zsnEJ
         YCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495588; x=1795100388;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWI7ugCczmlr7WYE/mOm+2XZ65nCDibs51EgikULhns=;
        b=ZAtgkQhbA6X/sHQnMAOpAMq7dmeaoDwhlOe0AcJ/hVVok2uNoqx6KAvZb1nVqU8t36
         FTM9MdYJH2rsyQq+T48az8uX2zDzX74dGyQaAA0RFAp94AGAaWiwXl7Pix6jvVPTlHPY
         zxY0G+WUsLagsivHV3IUD4telxzXxCEPm3Ay3VbXkNTM7OuWAOpT68TsjB9zGsiV/lf8
         8rmSTQQgAgQN00fccMhYRx402Teu737firOTU5l5cOPdfmhCPhNxpg7UH9k9GIvqCrgW
         zm4PScTSeWtCHAN1bC14V0zUrHMbgh5GITNiTL6h/aWtJukZ+4TxHEoovzCFHMQqYGdK
         8PMA==
X-Forwarded-Encrypted: i=1; AL+hErES7ESCHCpetAJOKtXjQibMQTfMZQZ2BjoSQRLXFHITzHmN0wiPnkGUWs0VTLGeTxbmiOz5JgADKSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aSLZlfO0lmkFgt+tyi9Iw7g7Hc19g/8OITmwihL/h3+JU0U22
	/DUgKyc4c6Bo79MRXAkGkv9rBWH1dW4847vj8Are2GTJEYZhz6/K6SpNbiXUofBMuCM=
X-Gm-Gg: AYBFou2lUDf1aoRLCkxtDncBHeBRCG5/yX/KLaypoWQdph0vIZTLmhgkqI9rGnqIXso
	dyEgHWYLDIg7Sdkz4ArF2SJsKAyMXMCLYr0nskij50hiRlBv//X2Gw2FTOwtdZC3os4A7D6iCWj
	rRV9lRgl/xoj03KmNRS9fbXnmVECdF+pwpvV+KqGNWkr1i+6pS+Wa3ULxMWj6TpH3g22AFI1pXW
	ZK26lC22L2HxiLRGlWu9yw1WQ08PzuDxlsNV97b8j9C9HtFQhZEaD1XvHtnE0poFw01aO0M/UpC
	mQ3JWfDZoPlSw/EZ/derGgHlOpxlLn7jLknc6D+59PgtOkmGd/chLGONVS/VKcF92Ee1p/0fP68
	fRQZRx0rlD16/KMB8yEpDKBdBgw6DyQCp3oG0D0VCMFk0jG/7n/SpfsnVc2F0XkyGlwZ+tivByM
	nrGgchP8nWl4AXDxomy2+O0lFHETtWdvDcPnIG2wRhtmvKxL5mxVqstcLRJ2SzGzmC160nQS/hp
	lC+dKDCBxA3Cncggo66kGwIF+T52xwABTm7aqbm1tCiZR9GHPju6JdUcHjWnyQ9mK189d0757wI
	DZMYSWzV/HFF5gqXMvxjkZKsIuySPpyZ24fzIaesFIdzgjNd0wyHLWBISM+hd7AwlZbg2G2D8UO
	DOnLinlloel7pgQsPdc0j9nHLzlZ69So=
X-Received: by 2002:a05:6102:f11:b0:7c3:8150:83e7 with SMTP id ada2fe7eead31-7d4fb24dcfdmr2020028137.9.1794495588205;
        Thu, 12 Nov 2026 06:59:48 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm5739554137.2.2026.11.12.06.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:59:47 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 09:59:46 -0500
Message-Id: <DMTBLFVSOEYG.K5WAQC5KN7IQ@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chen Pei" <cp0613@linux.alibaba.com>, "George
 Guo" <guodongtai@kylinos.cn>, "Kexin Liu" <liukexin@kylinos.cn>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Sourabh Jain" <sourabhjain@linux.ibm.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v3 1/5] kho: reject zero bootmem scale
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>

On Thu Nov 12, 2026 at 5:38 AM EST, Mike Rapoport (Microsoft) wrote:
> kho_bootmem=3D0% sets bootmem_scale to 0, and then the bootmem areas are
> sized using the explicit sizes that default to 0. KHO remains enabled,
> but there is no usable bootmem to load the next kernel.
>
> Reject zero scale the same way zero explicit sizes are rejected.
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers"=
)
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index 6f1f55fe31819..b30ba686cb301 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -703,16 +703,22 @@ static int __init kho_parse_bootmem_size(char *p)
>  	if (p[len - 1] =3D=3D '%') {
>  		/* unsigned int max is 4,294,967,295, 10 chars */
>  		char s_scale[11] =3D {};
> +		unsigned int scale;
>  		int ret =3D 0;
> =20
>  		if (len > ARRAY_SIZE(s_scale))
>  			return -EINVAL;
> =20
>  		memcpy(s_scale, p, len - 1);
> -		ret =3D kstrtouint(s_scale, 10, &bootmem_scale);
> -		if (!ret)
> -			pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> -		return ret;
> +		ret =3D kstrtouint(s_scale, 10, &scale);
> +		if (ret)
> +			return ret;
> +		if (!scale)
> +			return -EINVAL;
> +
> +		bootmem_scale =3D scale;
> +		pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> +		return 0;

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>=20

>  	}
> =20
>  	/* parse ll[KMG],mm[KMG],nn[KMG] */





--=20
Pasha

