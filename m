Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946275;
	b=KD7w847te2knVTCoqPnSs3W5jFeghAni1M+/eKGRJmEtJOndoGD8H9GDWz0OcVaND/Xk
	 YgQpIVoytg5ruxUopQKNiln3ESS/sUTsqiAym4JHEjpGns0HYYrm+tghJZni4GwRy89l0
	 2KmUlvbIzfC7GmUGJTSW6yjoXoMHuy1S5VI2vc2n6xuo6i+RlCKjq07xzY5CMawg3BTMo
	 /TrnZ8d5rQWUf3QBvU65a5DCPgvCImtR24TstTSQwqHs67luueWwtUKtHPrkWg3T5IF/r
	 j34QXpO/et5568bNg8PEAK15pU710Rb6splrHuJrdvtOD3f0hjQjEfjBWKpV5KpzAkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
	b=r/GBq4d6ASSNNFzfmS7l5FEJLH8PmGPTlliuoAHNia6rk4AYtqKWS4kzzFeVPARzmuUD
	 i0otx610H7EKWvOmpoEc3besOKrt5dvp4YNYFKlwr52a/8UeK/Pqs2BlGCgR5L8dyoEhV
	 Q9VApsN0+aO4uS/wGLhTAmlZ6j9xxBQSQ2Tdd7HMh8wJAOiRKUU++LWUFV/emK+S4jRpx
	 ZlT/kbGN5dYm3AkPuOLfAIWgKhM56InygH3tTH1PEed4A3XnIqF7R95/48RCUM0zM+j+K
	 gFyPqipflsm+SELkFrBdZjUC9KIeA2Jp+UAHTajJajVS9g4WKYCoJl3BvEiKy+D6MHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qUYi/5Le";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D4606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 20:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUYi/5Le
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so491221a12.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946273; cv=none;
        d=google.com; s=arc-20260327;
        b=Wxxw7D/kOr8u/s19S+aZrGZl6qoQOWmgxhL2dLbprIEvzAlfT4Z6+BcTUuLaemhVNG
         4mQh4tCrlS674Gf7UHowohwEq8JsgrbwTEwwZaj+2vCuZgWelPUQJ/FC3RKXWTPDxzlm
         fR+XvR+WwBO1MuQIl/phGXGN2OMCOmt4wAZ37zXwdxskTQ6imHbGVG/RNa0vW2FlhBEC
         uIFwz1WIJ2Xy4BzC0mqiZ7BplgduV0KUCFChygRWv8j8LNFol3tmBSPh108pGo0wPl9G
         P7KGuMfUwMSxHCobJXwzprccYG6FC/BV2SGLIkftiSc63o78uG4R0fjbOnEkKWevfXwX
         1IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        fh=epJLgSFsxsL6SALxTVdie+sgcgfNGmJF0DkXmg5c05g=;
        b=ntbzrCFmBO3lF5ILPP0YrdHYJipw31Dmsahd5xg4vyLz0I3cfqiyH5xdUqdvmLdcBY
         JZuSipX/BX3M645d0UBQgKbYnBXM1z+TNjiacIBVJpzGSHLpu+idRCmhixenmHTUZHWO
         GhAkaTgRVNOl2dYfHqGMAkxnOAOFc48GrMm+pE2P+t7JC+ddRu53GEfoNU8XAsPtFU8H
         rD4kE8K6RuV5wmibge7GCq3SDyySaq3j//P3xMDLOK1kvKv6F88vHo6WTcuteA7QOe3e
         j6IEuuf4cE371qBGNVtwraspAzdaV5iB+azpyTOi5C7ZJr6d68T3NKgluCbVoRUvrYLl
         Y/Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946273; x=1795551073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=qUYi/5LegcyQhwlyDIHJSec0Wq3K+2MDjMtllRf2GD5+J5Uig/9eXAdGiQqKo8/rkQ
         UZY0yqFZJmXO5C+fY26YLqJTbicpoAFPaJne0z8tdr73jeA/O2peN0eoZQcjhpUXqVvW
         tAguCwDvHD48dKuWDUvRTubsfVcr5EjJrOWnWZ/j5/NTQVb87KZo5z9P8J1rVPZL7Y1c
         HhM6ygFFx0bpOQOkzjfHIHOd/Wp8IxoLnVzNadw9xrLc0YiACFGTCSdIxM2ydYHCOQ0A
         4Ikl7srSRBUzfzX30kFmwKpbgGeBSk4v5zhjeQwEF8VcqpIO+zaYvtltHJ2V41XuVmtM
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946273; x=1795551073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=KEkdfuer25kpqWLuPi475ElpwNJaRpTKhd7r4DdWsYJb9k20LFbU9yG6M5X1Y4g0P3
         Mx9ZoYxw78Q4S6O84pSrRuTwpX1aqUmH3DGQSrtbyjkm9GzGoh0iQA2qXry+4LsdyCLj
         o8sg9hxF1fT8D098ciTddMwYOM7+LvR07i3rpMWmFVtLDZDwoe+Qwp2s/jar5Yd/L73Q
         TRArovQBdpG7O1ZtB1BIgtkvkXrXV7hVUHEpU37sdNxUGadNdJWSyEeqwTV/oYIwgWG5
         lRuqHaenUSHjqYQYlYZEszvJbzel3qA+j+4HHTuCQZ8avm62UL4k69jkcG87tc2BJITX
         +wGQ==
X-Forwarded-Encrypted: i=1; AL+hErFKujtz8Z8Fohuh9fPyoIE1TaPXyES1bRNp12eNb2KAkEyy82qYYOhRRqWdhSlQxXgoAoqxxRVKaMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J+TTLnpbeA94yxu/eV702UNviCCHJhL97CYBvHW4YeCJX6wZT
	M2jkSlNY7BjFUJco5WYsaCJerPQBd1Nzurw6pRY5UDSuQ1XK1PFAHVWl/3uWzPs6g4BtnJGoGKj
	SZbwQEe7PMqNZ51ihA1QwUHdYsbVVCX4=
X-Gm-Gg: AYBFou00cgLl0p+B3Yw/J3ve8oKnfqH7SLwiI7EuQpAYCA5Ei7Xwrf4wqPrt8dPEUwf
	ZDNwjm8uVIefpPdPmlfRepwUMIjPfcWuZfPR20BJReQJ3EvBW1fiCaFT5Qlho3CEaDBm55pHSS6
	eQ+59xi+GkQl3YCbbooIX5D/B/KziIuQHVqEdLO0CQrIu3R+6LJl8ooHyeJrWPOTHLWYEgZ7/Hg
	4XrTc2ybsrEyvIayKrR3Cx0fcMYAMGITZ3Ez0aLTDDXtNLftklCOZ0ntOVqT5G/Z8Lrq6yqYwah
	Gao8eLafwawJsaXMoknKkL6RmD9CdQnzNShMGrfGaietHqrmSb8FL/1ur2CFSW6wSoNgCmGfpG2
	ZctmHoHg60dMnbvyGGACvD3/rR6KRW2somYyoYvm0gjGimOevNXAWY3u5CfLDJtSfAttqfKDXv8
	b9rH6jjQ6k65wkAmos5OyBT8gM
X-Received: by 2002:a05:6402:1598:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b888111f83mr296086a12.41.1794946273014; Tue, 17 Nov 2026
 12:11:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 21:11:01 +0100
X-Gm-Features: AclHuK_Xa5-PlkYMr0Ybe8c0xscp1fzE_6udpNRIkvpkKayBgek5aLFyZAumq5Y
Message-ID: <CA+=Fv5SFdf9Gr0zTGXJSW0GVB0eFoyp4a6PCWQ4PY2q3LGZTcw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket layout
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 7:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 30 +++++++++++++++++++-----------
>  2 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..9304ae74877d 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,21 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +#ifdef CONFIG_VERBOSE_MCHECK
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +#endif /* CONFIG_VERBOSE_MCHECK */
> +
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +65,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>

Thanks, this builds on its own now with VERBOSE_MCHECK=3Dn.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
