Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913816;
	b=vOv291twZDpPg6qNG45Oxp4PZwb9kxi3Sek7x2DarkO8/gJD4JsR0+I0llp1i3zJ5cE/
	 mE0tUiYcLNbB788b0gC9RHTn1NdUrRezejVwwhhPyOpP3WvF5VZka96yMRq+I24wUaO51
	 hcESBZSpD1jUVayhzbUDxmws+mbTMAsmux7W1zKToAEF+BQ7pY9C/shQEhE7wYt8dlWvK
	 fPOPGxWFeeKnFLS2yi6Lhnh+gXAcQWF1Qm5JZHT7T0csPo6IwcusM6ijasrtECiFqLoha
	 wElcyvCwm8ixZMy8niAb18j9Zvg8lp+fM1I6FFiR9pHS1MfHzkg6u8AUgE0F4OxfIOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
	b=jQrProrgC1YjM3g6zj9dtbyfR5Dw1ZUjsWfHrAWxDK6USiBBure0p+DnkzXxcAieddTX
	 zr5E5ulizmNXv4gk4SMZTYAdEwV7NoPT9DsO3Fk0/46qrAHLXde6sIlrfSQpa28z4dstU
	 Ztt+q6mc4KAPDgo29sbCJi6+6/a5fbMrmr0+J1Mm02rAEQAQ3mgzPcCWG5y+fgZCEFBK9
	 ZY5XLzbGphYPge8BKM+PIN1dwMfU3wYBsjqXstcSFJeFtOTpQ72rERDKy5TIXncHTwTKU
	 W3nDLtPABsbC4ClaAdDhgwuuvG1O2F/3adVl0SGblQlYpdhqRp7aF0a7ckOSjNIy5Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16E606A323
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D16E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50715c2757so585653466b.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913814; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6o/oGGwMjrQYL2/ttFfOqD0OfBKZNmN1NtXPEX9oJhSqcVbRHgcP4M2LUINiQ4OMY
         KX0dtAHvgurDTZZFzphCw+8P3mqP0GqYe4/DDGJKwCW5V2NcNFz4YW01w8j1Sz+nyVh+
         G/Ol1ivO/NZGmX/nFJWY8PXd6NZgD0atZdudPWiudcf/MhlBQgtPD5It+wIM6jdEimXO
         DHKkyfsO+yIowvHrsJFywA1jbispFRMf9CEe/Dcx1LiKOlDPMAch4aPsjrqDB+wX3vAA
         zxWGLLM0uIHLCKbxv2PlkZucaVjpIZYFz49onCqk36j8GfqqZdVwcyAZ3O6Ce2Cu67Li
         YpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        fh=c1XKa1hPtchuvgMc7fxbMNQaPPwSxP51O/gvzkqiejM=;
        b=aFaTJ215zRP78gRrivvoVnIvSmlQ5zv66nFbJjfS4AAfXUPKho4A4q3P5HdildczvV
         scEtmmdv4gWUlju8t01OoGmt9q6EP4cTKZf64MOBx6aSrfyoXXm56GtHlH0pQ8Mkak5s
         4xUIViy1Q8MbyfynBh5W8m87Z46Z7yeKjYomYCXIb+2iBCfoc1fjd++2FKoqSiqc6wr4
         7g5020osozEOqe0xHNmDiei4vWYso2uvyH97IZJeS2yRl3bs+NkYxkShvs8gFZrflMFk
         1lI78KAzkCmGTJkh6eS0tphY/Zz+SIqptKJ88uiy5A6IUW+wGA34Z+aMcOiUyBzWekob
         TT9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913814; x=1795518614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=x2Hk1hKblfNfbBuIqPiQYQh2uP0SnQ8rF7azyRg4NYKTU3Fu7PbhEJPFEoY3qlSRFz
         T4COaEzFG92WXLtKX6fk63E1vsACOSPW5/ek9/aUiaptwVWyj+sJ2Q5rkTNyTSVXvxvx
         /5A9XHhMAAhtfAmWhFuuektMe6yqNzmace6YCtiehHL0xRx+KtowsiimYXlOejq/riSs
         S3s/uOKUsSWxJ3NHmOH3DkVJqg05gQzE8l7IhIRUxwEIe41jJmJInn8KzA4qLOVcGYze
         umI/PvB/VnSZkn4nBMxrMKsahoMhc9+btYRJpOYNhS2bITRufspALvbSPqUfA+f99JaT
         9A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913814; x=1795518614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=ku8HbGTcgNAA9/lVwpeRPPBzFzqcuOA/UMMHJvgNpMyVNwX/TqSPctdmIk6Dr2Co88
         Q1yShdRGjnTA51A4gOa7scCY0afypGE4yfIs+XWsuhRZqhZKIfstZp7+aqQXl8IC/lic
         1okHPaHuBwWHsAlSSTuMCtK6vLm8aChF7L4824XTWiS2l3CYy0w4BUR1IlyMbtHhlUE8
         roOB7ZKZZkISu/ghE9POb8X8Sg+/GqmCNbBnb+JBxqjfpc7mhXXRDTrOK7iPy/aVnQJ/
         zfBbxwy2PgU7o3UR1hHbU65sywiNwCQmdikhghPkCjTXog+cGcXkriMCNFKE5v6+FMjk
         Jf4Q==
X-Forwarded-Encrypted: i=1; AL+hErFBbB5ehzd/+4zQxd5dAoc+U0UBLq+hhxFZWwl1femdJqtW0teXC+LlmoxE6oPttPin8vP6C9kdqTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DrU+W7Nrak6ekKJooqov9WRmWGu4glCUNYgJRmUDzngfocWfn
	Qbz0YTk4RJ8Mryx/pu/TiRdObK2CacZ6OMMDElOXuC+5+TrUAh9VrxkwyMYswsISEjoOpSSNZt3
	NRT1sNClDRuG4MiCEuZbnIh1Ojf7avK8=
X-Gm-Gg: AYBFou21O9nXbgXZmH7z0xXGdp9X5GsAXq+BxXneB2d0aya2bk9wmezAvfXSfzvFOix
	vkYbx0lSpl+XtxV+GPHWfEpeYPzzMWCiTrNh0yThKRucSx5U3KKcqvczD36CUQ9qCKJibYNJFK8
	h6QlGg7ean5KR4+xnxRBJgojZp0R4Z9B3cCIbnKQZQohTDfYdJ3mTHvSexpXe12cvJVMh5gFlCq
	4tqKHuiN+acjvrIBvssUxpMm9MPKgTxkyeFSBZWc+6GYZ62Az8yGuB5iAPIoS3PxvsDdJTAZlEo
	ZxU+i/LNBjt0SINhk5ePh8VSzvVQXux7uvOCB5EKLBXK0C5wa3rWyr1ot3LjzFUBXN0AnW2QNzU
	U1/ZbAVQU08HedC9/h4ogl4vBis/m1iBVCoQrXgY/BcjvvW+GutWKL5d0PMvujy9ddiAAbSwqk3
	a51e73NJvDvI3VTlDHEByZsr4840YYRAdaXDS8vmbLZVKQ
X-Received: by 2002:a17:907:6d06:b0:c2e:2944:d6cb with SMTP id
 a640c23a62f3a-c5096328166mr1059994766b.13.1794913813640; Tue, 17 Nov 2026
 03:10:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:02 +0100
X-Gm-Features: AclHuK-Br5Vbz1VzqXOUMBwObsh3mCpAfEThlMEgldrsDt8fW8D9WyXgT-y8mRs
Message-ID: <CA+=Fv5SCPN9wTpZ-FMToWtNerfPswbExZxEHtt=gwrXf+S994A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
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
> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/err_marvel.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 85f7a56816ce..46c521cea9a0 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -37,7 +37,6 @@ marvel_env_state(u16 state)
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> -#ifdef CONFIG_VERBOSE_MCHECK
>         struct ev7_pal_environmental_subpacket *env;
>         struct { int type; char *name; } ev_packets[] =3D {
>                 { EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
> @@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_sub=
packets)
>                        marvel_env_state(env->state), env->cabinet,
>                        env->drawer, env->pe, env->sensor, env->state);
>         }
> -#endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
>  static int
>
> --
> 2.56.1
>

Looks good to me:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
