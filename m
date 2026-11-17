Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913906;
	b=oNhZYZIgBehbFinJJ8EMxg9vPe1rttQBtFiS1/1rx4XAaOp1H2vuB2LBkoPCynyd9Gzu
	 NfvPq6w7GlO1XtgdrgSqMkUgSlAON0Lzh9kHLLu06KcmeGsjqU+kK4NnW3Zyfzh4s9x0V
	 U8+q33QO6Wq16ORbZ0I/dXWts3yNRdUW++sRp0WF40b+Cux9yHEL8kK8a4FZWoVIWN2Vv
	 RBYzYTvpTg+KQpJveaVe16PeXTrnexL2WjeiV85fpH2UsVlU0gxNhyDIRKqZYKyl86+mx
	 8cN0cmYvmS4Ooc02jwFljAOoZpNECR9IMqVOWgaF6M0GFxVk5dQMrcysUCX9R6ScUeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
	b=rEU5IckNUpfv6Nhugg4SDNoK0+s0XkkDFtvB4VJl1RKcHzr0ZBAfOQqGIjO4PhPccyhC
	 XVxCPsEuj/2lchgQ3YNorXtFz4sbLc00u9V4UTlKHQLC3zuEDev9gMmfW06020rlpiDn9
	 VO/8T7ZP5urJqhpPhRc7PgN8XBxYGu8JVaoz1rKSdS1RWU5x6kCYKhYTBafPYB1z1vSnm
	 wrFP3K7KWIPoY7R1H4LnCSBwNczH7fpWg6LD77JmeJkH468AXCxQ9sboiISj3Lh7NDksn
	 vl4EHoCfGyFK7Is58WWDeE4D9s7FBXgOh0ZbrQkPQv7zC/feKYxI/XXQFkG8H3ez3nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A0606A323
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so298935966b.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913904; cv=none;
        d=google.com; s=arc-20260327;
        b=qEuUMT2HMQCFO83wdzcfgRkOasHAuXT+EhaESu/wcWbmmEEPn7siA2IYaB4mPVkLzW
         l5MDnQ+b34qJyXUtLoevbYwU108gfEPFYAFwmtd/neCcUKVvVDoLPdEfQ3b7rAia4uqf
         ddQvCjd3oAPaE/lUg/nLmhgr884j8yiEPv4FCrF1zO+KgATP84HGoSBtoGS4FGkE53cn
         Fmka7Hw+H8smQk5HG6xNIC8/vbA/Px3MFzPUMbiyTF9h9OpjprjC01frhYf5sCzHf8+3
         1grGFUy4H8mXW+GZxPJZ3e+E+6m18ZLqHE3IeTIPvWgVkyctM4D1QGXTAjbv6MAslldc
         Vovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        fh=6n+iqLDCeTv/3nWmEFJIv8HaqW4zzDT9MAUz9yhYxMg=;
        b=U+3FpnnFX+ZgJf8yRN3W5R74a1nBgNBdLmUyeqTDcGCXkzHNJIf8dcogg0mbAb3Q8c
         ODdNexIr9OrB+dA3xSLBYpylcWLED//HH/LCR+GVy0O4nTSU0pj8KXW4gRUDq5Tu8nuL
         0iaWxcaIcryBrN0958q3qld6wJ+GxJPKUJ+TgD0+SrHv5oK1g17Gi+jBmDy5xqBgMGPA
         P4+bBIPfApgAt7hRPOxjRAfkL38A5/JQ7112+uarr/fjPpeo5oLS3ctuDMJS+1GTz8Bz
         tm5MhjpVOhEBZIct+zAfSND159gWTtrBRB/ozlXFFkQIZv1veALgqPvIuEwRXDcQsIhH
         3ZWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913904; x=1795518704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=yyzwQXWUh3hlTm75j49756a3u40dxwVtzSwHSTRdU1++KQVLHeGLEY5oKwXhbCuaYH
         6nWczAtsAkgzqx7tarkVTwqE/NcVSVZoNK6OuqrefHsu23luGO9vLTl0ReCdUF488lYn
         Xctf0sJGtjqLQoPJcntw5NhbgQ1nt+25ZO5G9d6SB0G6QMIK+9CNoivLQNtlpfq8YlX2
         bvCKhmaKDMno2IJ2CF+XBc6YetjTb5aYwyiC80kbZ0zb4Mtd9yiOq9GZfVJP1lOB2jXz
         W2YR+wlO7NuhGWOJ237/w17lVlBl32uKbC1Xb7lNg+J4sMz5FU92rzdEDYH6v/ndnBFN
         3FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913904; x=1795518704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=IjiF4wIjGqHwXFYtGknRvx2cZMPA375qzGCaxRTwbBoTOVuhQ9rNMunH5VYxuPDMSA
         YB01yM92aa+W0GMeF5Ca0G6UMDkXOKoiHAiAxGo1Iv3qrEP2nwTkQKGdu/MnGq78yhV+
         RFVVkDk1x8Sq/V64EmbVmRCeQY8PeB5aoo7vM93IwOIS1PXCQv1Yaq3EYO5cZIl6iQTy
         1haNCBrD2DiaLWu2S33naFnwEJdgwqUpoyRjsOkUgOAkS/6bdNDPNcngqekVi6+ZWoi8
         zUMSvyW4OCO2tPUNHCEKk852gJQ4HOl2DmQPgeRUhEdLUwnW3sYOVuklzYgG8rkj9iDF
         FTRA==
X-Forwarded-Encrypted: i=1; AL+hErFRm6rSwqYOPvtmVfOeXj+jcXvvU1Hi64V58vCaPLm8D/V1ioY4NOq5inWRFMhlYTURJztFUPdb95E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5hIDoy0scfXFPXU8m4E1tWvjjaOBUKh2se4XGSQ3CGTvKh9o7
	wAXPcWaGUSehDrL2BVF50TGHFHQtdbS0o9YumRHojmdaQzRj5Wo6El4Ih469rBG/acqGBtlM6SG
	FLEW4kif5EVFCjCiB4/mofYwJ6Is6VHI=
X-Gm-Gg: AYBFou1Dj5yeZo4Nx8R/l3K1HYxGm4/PGVLCSewWnQ0j++2KRAunJfD7H1lJwZOZ8/d
	uW9Rx9bRoUe9vMaxpijgyS0Mi5rk8Rzjscx2HmK893P8htdWqTsI0aQ5LvswSfHzXgMkFaN5I0P
	XjVS7TxeO5Y00W2eOVQiF3s540uPmRzEntUdmWmBRQ7/BMrKacC5gOfi5gmeMj/f5cBliElkRYt
	bdiR+nhHGlGNQii88+ebCRUJN1vscoXqsEVEdlgYaTuJCAuFVewCDjxUFFakjhTIP6nZ1hmkgFc
	qJxzeHSQoe1Nrx4tUoiy8Zt6dNwwIJu0iYGlaUDFchozIImOo12Ll2eUekpyUhXbfXdyRgVDBZy
	siyQm28LVgtFPjtqt8EZSBG20SrlsH0AxxI6pFxFp1yBcN27d9/WY2jqVqHZIGurAO1fdzyfSPs
	vErK5uR0RHTUgvkrw/m/q/9H4=
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr1499165666b.48.1794913904361; Tue, 17 Nov 2026
 03:11:44 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:11:32 +0100
X-Gm-Features: AclHuK_ySbd-btf70cw_u0VyMg7YEG-_OS2SndJeElSe33r8vAUxyZLJAiFwxJQ
Message-ID: <CA+=Fv5R9GknyU62ZwcGPvH9u_ucK=qP3j0mE5s-YMJgVbkGs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/core_marvel.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 7525f3ed6b62..169a1df6adb2 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/memblock.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
> @@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long o=
ffset)
>         return status;
>  }
>  EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> +
> +static int __init marvel_env_init(void)
> +{
> +       if (alpha_mv.init_arch !=3D marvel_init_arch || !alpha_using_srm)
> +               return 0;
> +
> +       return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_en=
v",
> +                                                              -1, NULL, =
0));
> +}
> +device_initcall(marvel_env_init);
>
> --
> 2.56.1
>

Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
