Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268307;
	b=e6zUJxUIVpkCxSlz5O8IjCe23Vfkb1iz5hQNsU1F2pIR+Lk/EZxATbrvDRSVWjrA8ZPl
	 JD8Zb+qlGfaAf2vbvgmbOCZVmF/sC9YZSqvb2zN75JKAHzvIIHYRewesNcuENB3GTj7kV
	 EmROSWXHMOximgSYYbOAQ7VHhquwpVbDFf7x4RwNIzDuHVc5OYGGMS0jHraInhKVyCX73
	 UstVPbEUd4R/7Nlge6MOl8Y0pP6lwqDPBLOkVll7BOdy9TdtTqgHAxunvsaoCmYRJlU+R
	 FttcIQjdf7CWXNxHXiPnS7aoOYYVlDKzro00doVcs2uLPrCIEoUwFNeEQwWlekotJxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
	b=GCr6p5MCIJNT88Y2Y2vO+HfR9vQt+CQhTIga3FA6m/UPgjtkCof9u7P7D7Ja3e60CqxV
	 8UKEf6trrMcwEeKYF84OPW35ZjlskqmGIYb515UzXWwTnbsYccWBcn+jwz3fjZj5uI9vW
	 fud4oK86EUiC7Iw83kZq6nLckFnoSW1qXReIKNQpiTuepmVSEUVCLoAn8vSHN+tt5B/Wu
	 OOC9NkjmNMxKlfvYuWGf6ltQIu3hn7yrU4FnbSgg3cpV2mzo9sME8qUngpQjXJ8jMK7kG
	 QaedL9JA2W47sZ8fYMgqljSFvx2ZFrT0UTu6RC8VtJm8CmjWbnm/mG6+bbOgVwXtJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=H1R2lLqH;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C8606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=H1R2lLqH
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso893583a12.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268304; x=1793873104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=H1R2lLqHn2Lr6k+r6OdZgfppHvcjyP6TZWTLyu5FilYMTbK3u3CZpeuCjjZIdi4jnC
         0TwveKR9jA6jVTkHNUrcAW5Tw1tmadniatMZ/qV5n4QHz4UpZeLMCH6YQcpCWNXHiqxm
         sw8RqXVy0A85Vy4bcECMhm6L0/zQylmNx98oc9kMhu0oZgHWGKa9CkqcG5v4I07BYGt8
         CgLVdi11r6LTfqrelvyydvPWPfjIYWzxZUqu9juiWWPud6Vj39Og6UeHebRhF8opkpqo
         QTVfn2BUYNe+MeNX4dHVQkUb1CFSbYgbCR2R0c9GD4Um/2KcLIxENbQuIx0sssnOk+oO
         cWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268304; x=1793873104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=j2OkkBEmVvjY/gnArsddEckFw7zRYJgbI4Qbx9oL807mtyRgZHtmdUAGpI5VzFWBst
         6trY5pEKaR01jE3l8hPp9LYcD04VSJE6Cw9zb6Vx/x36ArEYUP4fl2/yVxlbbzLmrSvZ
         MetcpPgZjLwH/haBffQ9nYK5zpvBm9Q0gJnuJvNBFhch0PO8D1PaM2KEn1Ss00WbARrU
         58wI8zjr3ZCAIFku/ieEjwMJbrKDZkA7O4O3Jlo3BKXHTr2EnQuBg5LMTiw5c1VZrnH6
         T3rZ4IbNd1I2EXTZ/Isp4TkSos7OCsVTLUjiqZ2h2Pe6J1wIHBFoMmRMNpLjcUuS/0jq
         Lwpw==
X-Forwarded-Encrypted: i=1; AKwUvBzE90Px3zi8UpnrgwqQgTsMgjz3/vgIK/Efff7w3VEJXgAPp76h4B2uOBb17287XarafrIpQtRmAHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmJmDMjk5zihY1hdG96M6Rr8Qzk6eAVMo9udCKabu1vc6lJmju
	fZeIYWwdZmbGRLvBW3rcVG0ilJq75d278kWCxWRKP+OrRHYGKx5Hrh1mUZxgXJU99R8=
X-Gm-Gg: AYBFou2fb3vWrGstjipKQPHiEBhjxC4LiRHTGFfD7oHJeXyAUmdLXhdg5Lx8WQbW2gB
	4+jQPcQKhiEa903a8TH4rslr1pPaFGD0yGPnLZWeG0uWb+KiW09EXGRYS99g3qvCxjBjsQe3ILA
	M2P6rzT0ARXlYGZjP9fLu6UCJ1ZrVbf4Zz8rEub0/j6Pcr392bGQ5uCk+dBTpXX+RnRfUy6sgpn
	i1e1mbaua6UdXJVvOab4dmhG18rfgwcMcfOUeQE/J6rpAM8G/mI8qNc7TWoj75xRkAc8jlNi8DC
	xXebrao1wOf7SRYmFW0oeF+pKly82An2IRRhK7OTpE2QJB6MCdNGMRAkceAhFYbWKXVeQJmETh6
	nno2YqGLLIJoPRn7sSpwA7GVrP3LxrICohSsLea0OVfNuaDV7rzGuNk2gjxkuwugsTd49TL9yLJ
	S6ULTt0VXOhyDJmBE+so3f8Ye5ZcgzV18P/+pHF/pqiSNuZUz/Hgx6AWlhDGsrhALg7y+P9FhHM
	x5ITqI3J4Dnus04IQg0Z+sv29+jK8QrDXRfZLuTblEWjdXSEcOs3mZr1FPOShn8BnpU+WyXyTRn
	UgAvLMTkV/zZP2L9DjPpohp5H15CbH19ZyDlwQ==
X-Received: by 2002:a17:906:ee82:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c49d10fc56bmr194240166b.3.1793268303706;
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm705408566b.81.2026.10.29.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:04:58 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auMX4kbsflE9kK3Q@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>=======
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>
>Did anyone implement a variable length challenge? That seems a bit
>strange. There is also a very important crypto warning here that the

Yes. TPM2_Quote accepts variable-length qualifyingData, represented by
TPM2B_DATA with an explicit length. This varies per request on the same
TPM:

[1] TPM Library Part 2, section 10.3.3, page 136: TPM2B_DATA.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_2_Structures_Version_185_pub_c0a962a931.pdf#page=136

[2] Part 3, section 18.4.2, page 158: TPM2_Quote qualifyingData.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf#page=158

The PSA Attestation API, section 4.4, also requires one implementation to
support 32-, 48-, and 64-byte challenges:
https://arm-software.github.io/psa-api/attestation/1.0/api/api.html

FIRME DEN0149 1.0 ALP2, section 8.12, Table 8.23, page 100, likewise
defines an explicit Platform challenge size parameter in x4[31:0].
FIRME itself does not mandate the specific 32/48/64-byte set:
https://documentation-service.arm.com/static/699c3b70b60ef220b14ec14d?token=#page=100


>userspace use of the challenge must not create a "signing oracle". Ie
>do not pass naked network data into the challenge..

Agreed that we should document safe challenge construction.


[..]


