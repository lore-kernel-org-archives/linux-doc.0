Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035349;
	b=KQS9ua3cSnwIg/vwRRoK7ZL+hLuTtKGPRPKSZdE9V6gySaGLMgZmB/D3Nz15fC0rmpmW
	 +ZmDzt26+/gROQR11Y1tzNImyhOAEQFPDyy0wvdTgU80gxIUFrheDwhnrnqxPA27PTVgq
	 JbdvhP/C+rTV1IrX+amxbqubN2gF85TqIyVGs8YzvQBYAyrxI0tayHu+pQMtZ2v1kIoca
	 I+MHQyAEHqhM8TJlvUEvyHPfG5M2DaOWxPa5kMU+SrRfcaTmZHV5Y7PqYJlifnBz8Oof9
	 7G6pT4qcTI8p/9hfRYaLWMkqGF8yM0Wwt7QoA7B6T8oM0W5LRxfRltC8Zu4VkZDAxdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
	b=gjb6wV/Cf5AUo/w4LuD693ClHQY8il7ni8DZ7gCpoPbfjfKypMSUIUFQDmSwBD4Hxvqc
	 lr37Lool6xo8ZTD+pVK+pJjNWUJ+FNGNV87sKlboyslaG1DCAP2Lh8mKFV/VrLu0yHxEz
	 yT5v0xdkRmbPI102qFxn7S6pJ2/K3kRE3Sd2TaO9rUXtztM553l03gGXTKfIiYXc2FcXn
	 dmW4/lf/oDYa4+UZP1rRdMWxdJwpHobJFJ5f9O5NzvwaTz69LMZIj68NMpTX+AFKPuLzH
	 3FmfgWNrEuA/JBrDzuRn9A86aQIdGEQwcZ9AWcG5dZHea3OTh78cC4klWlesRciNA9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMvG3eK2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30252606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30252606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMvG3eK2
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365d725440so14035191cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795035348; cv=none;
        d=google.com; s=arc-20260327;
        b=X5z9Ac0HxHQg2wIKOdtf8cVuvQyF8wW8RLsiEMJy+x9FeDF4AynIOT+FinCIM8Zt+l
         z3IpMglQJYtESQTOLjSRgoUQnUepmLgUGVVnOZjp01mkqQvSCdFvPgqjWpMiNwwK7xZu
         s4xXp7mNMuaXeu8zwXMCvgLvj2cvbVSA+5+wNwDBHPhc2eYVHp4Nk8TlNZBIIrvMY7Nz
         ac21zjONLOeZJQi649pxfUfaw2bfRjVsmplmxgbroTCcdsEw29kXByN6oI1ItzcaEzYe
         VxPangHKB+SztplETviZTl8T+ypdJkiJZjTgH1kJocjLR1z4t7i1wE4gzfcx4L3w/dSl
         tFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        fh=NJsm9z+NRtuZ9vHk67uwqJun3jeuLFyLBr8SdBwLJrk=;
        b=kvQLUL9a+mICne4m+KgI7Y1upe5Bu6BlxXQZRyRngzK0o6r08GU4MPQhELGzg84Exl
         4KVqPLecj/o8k8wDaU1yQ9qEQEF7PAA0xBXcdu26ErG8dC84/adyh3qWjuJRHLGJsCoH
         wYjLtEHLYhDqrjozO7seDGv9ht0Wt5xXjw8JHMkaEK2Ac6BRt2ger0dVm93QKqSTPlTx
         jkHjqXq3rR8awX7XJa4cPlnOMUL/r0bPSx8EGtZJHpopDfg2bVeLRANMXy69wyGeiqzk
         Gs8T+KGqnLM5ECLBkYgTnIYfkb4TLix+aRgDB+UZSFLq3GK7ypAmxlCXNl3ZmjFGBsEa
         YBOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035348; x=1795640148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        b=pMvG3eK2aogC2094P8BxtFGVGw293e8DdAnCtmwV4/ccDI7oFw8bf27i1rafYOyEyH
         UScSXoO37zMScoqsh8SFOSaoOg7T1R8UkmY4dEDC86Z9RHndvxy/MNb2aZjmHC2JgHVg
         DJ2r2u/dbJmzln7n/h0b1p8ybAPbVEuiFCZO7MCfjOszY7+LzzVpOdR0WQUtG9g7t89d
         JfFgn988ZtXxMY7AtF0SdLN5VmjKT5KEJX+qxBFUWSWmwZvebrWFMctLbr7K8E5iqWJM
         i9YkA3Ix1P7fExqfh3TpsLAQ0QGONZqKAWlyWx4X5spRwqwaFV1J8NG1x1voh2Qaj1dU
         /URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035348; x=1795640148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        b=vpelH7PMQl3S/M229a2cMm4OqllAZga8CRvzY7OOBVQ+O1c5NzVeHore90Ynw6Znft
         lUIoHPpQuVJSAeS1mgRt8J6fK+JhGgumVXRgrwXHXB74z3HWS0itAhTf4jyV1MqoWAoI
         F8yGLqCIujyqVkSGfgS/XWClP2a5cs7tYb3KRJILMVOAPyxVqKcTSV0S4a9Vu4e9BSkP
         MHbp5fgrIdKpU3/rTYIkZYUhMZtaEQmOWfVrk1xS0D0G5ZHrCsxPYnfgs8F8gLpOErg2
         dh04q+EOa75QQ4/bIR8B5lytzLqBGxB1B6ZAUFEvbkSarcP0qx0IQo/AsAM1M7J7xVzA
         Kitg==
X-Gm-Message-State: APuU4Z/IESNdyGFplJmerhcBSta0adecsV17rCZ7MFw7MVQ9cxBnypFr
	rWu6H6PLyXN1RNoW+vyuBeDyH6iJ2h8y2I96FowxyubwgaUf+/FfuxxKBU9Emwk7Ej9db5hNhfc
	Onm93OmsHTkQyRaM0bPmMQd5Q8tdKkOk=
X-Gm-Gg: AYBFou1Zu8Wvn/GJroW43+Ozbnr1wK/pwwuxMgvkdNRJAjlvgYvrcnXdz5JPpBmoTRX
	Vppx/ZhIdLoCHSbh1k6XH1NO+xAKk4n1uKv0wYCyhA4b+7j2vvRl+HM+dUxdPBqU0ffpbizabO3
	95RXQdCorEB+sy6nqVGx1dGjnIvW49NDXu/EPM8zdQZhrS0A1VRYsWpBEOX/LqXDVx+sb68sxZ3
	PcSKcCclI3sKJtnWo/Tz/XmSghhm5ClYChRkZtupEJcrKpJMZMsCn1TCNGcgaH48o8R0yybXYAz
	4Fxi/ltZZLPSQXtT+O0YtavKqbQcFZdtmYt57hHALo47z+VIindP1uObanqgCfaOaRAIfVoIj6k
	t3ec2JQI2CkNxzDd1yjybhqMXsG0Hu5SmMM48QDGjrOHEe0YfYioauymqy7CQT01dknj1e+c/xD
	gBMNLgpmDf30se23L1tECGBUAw3tNhDA/JdaXDT/EonQrGcqyQEiuG0qRV8lC0QWc+6O/LWwI5B
	ySBWHcogHOYekFCepdXbCzk
X-Received: by 2002:a05:622a:40b:b0:55d:37d8:5037 with SMTP id
 d75a77b69052e-55d5a75b268mr57892941cf.77.1795035347887; Wed, 18 Nov 2026
 12:55:47 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 18 Nov 2026 17:55:37 -0300
X-Gm-Features: Aa3M54rVivx-ML4dxqs1VpuRKkdym9eRYRSCdvf3byQfdD2fvFb5_szmJ4VAN5U
Message-ID: <CAMAsx6ftHy7DPPcDXXCaOsEFA-xyGtgLD079PmzJst7c+-YvCg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add researcher guidelines
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 15 de nov. de 2026 =C3=A0s 11:07, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the kernel researcher guidelines into Brazilian Portuguese and
> link the page from the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Preserve the existing toctree indentation when adding the new entry.
>
Hi Gabriel,

Thanks for the translation. I compared it with the original and I'm happy
with it as is.

I'm working on a separate series to keep only the plain filenames in the
pt_BR process index toctree. That doesn't need to block this patch, and we
can standardize it in your next contributions.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
