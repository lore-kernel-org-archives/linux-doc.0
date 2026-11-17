Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913753;
	b=SSHu36T3ssi/6h7fpZEbyeHw9VupWF0GQAdCRbafd3ZGiKif2YElO1bIOdC8dgtROQl1
	 T1D0MEx23SP2clb21V1ycbCTCAJ5XJPte6xC//ZOWvv394e8KY8OXPBP57kbPrwSO2H8W
	 mNd1n2eEFqjqSH5T9UTq2KYTOhhph74Ss4WiZ1Shq0hYvTOn8OU0pEWa785MO0pKYJnYp
	 f/2Iid8NSq1J4t6HRO9Ud1N/uqltsR8K3Z5DbnL03V8lzFQJydAoabub1RLf+onJr7Fh9
	 ULiZPkcjX/TbNt5HeHHfyUeQIGmWgI7U+odmu4No6QW7K3yOWX1VJZOoWdU8GPnGnxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
	b=rjogVCzb57fRG3q2qrwTD4J2MWUfiDmEcKjs4wTTQ9U9TJo3V5sujPE+KFiFkjwjomv3
	 AhYpBJKZUI/GuP5o4TAbu7LWmPOKPlpyTNcaovII73+aznfai/EhVSO5w8h3I6kMkrfaN
	 VHgLMXTqCejvmNRMkSfzatXJ4d8EuEAABVKTsIJEfDJJKMttgZ+ZsHLvRtanUIeoiDV/M
	 dgjzwEL5qntG+vXrJNtFTfrpudmOYDpjz6rzG4aTUpSRCRPcpUNHiwCa+XI+RLS9Jw+eR
	 yoJpJATQi6tsnNCktnHl8ZuYy6MfOwgi/4iOGPU6L6NppN+2YCBcDv797l2dt1WZs7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/On8or2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C6606A329
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12C6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/On8or2
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso286769866b.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913751; cv=none;
        d=google.com; s=arc-20260327;
        b=TFhbCjdeBHVoz4VA0L+Qk7cYnc58bZ89TbQ42puAI/uLWfQShcNoYPNM6HvUxg+BW0
         JNuTUuzIKWu1f+7ZOWpOW1h9jbqufYFS5y+VYMTmf1HhB3COyPlXt+AgI4Ymrhzt6rAm
         OPNkmCyoTOET696Cpm+dfgJsAqFnpflL/aDfPC94hmyVQDW5MG/rbu4Ycu3K1MXmaebg
         w6/v5IqkuiEOE7xElOXz306L5fYalBGQNLeMCRgBTidops4wxRTLyE2/E/kNI8KeB4/j
         cBm1Wv73KVUAXciQhsiQXbhXDwx4dskVi+a4CkzWrMO2LGgM0+RnGXc0ZYkzcyStGovO
         gqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        fh=l8sJ+HuUX/4nen8nLsTEfGX4gVbEHFbSuR6kQG7i5Bo=;
        b=eyFXiGpBpE064eJO2z68einmlWn0uhlaEGxLJNndHE9ZoOeyUw0TpDvSillGvBAIws
         YsXObe10xLfAK6/5rTMCxl7FTZB1tQWKr5ls11CX5RJksyyvA0M3C/wIuaR3hxSPOz79
         lIczkHeQRjwARwzguWiZ2F4cDA/VCFBJ5RHl/JloiATa+XtINjvdSXDCFjHBBihDhjhL
         QYQmZ4JzV7v2X+cH067X9CmRuu3ktw0S1bVYTOpzc8U3ZipAmNJmGgE7b3XWpGMcEiBS
         wlR/I0DN1Nwz0Wz4bRAd55+m33wB4Uk6yvKwi0LnW9bJeXKE0Nve/iXHTVm6oHjUhhgM
         fSfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913751; x=1795518551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=o/On8or2Oy8aXwijm1DRzoNacf/V3nZElWzRSDwSRPXorudIiUm7z5ReWWOfwU7t+N
         FxE/Zvi47jjzme9Lysc90014NGArwMqIcUWi1NYFUM8PGTsn0bgMLOPQrBG43NR0rn+r
         OAL9Xdd5h+X7DKdyMUjyhkIzkyeE3GBWqk42Xc0VSLCaZ+S0UPci6he5xnxPl94FgAaj
         wttOV9UE9SqgW7Uw8I13SZYbzfRGSfffzi2z866IVOZrsXAq8YgbJFOApgpnjlrIQK/N
         CKvAAkRpHLdc6K9YBdByBff7iopDEzkKBYCjKdwo84c44cflbcMF8ZrDZFb2PtRkXdPF
         YiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913751; x=1795518551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=gT1RLY6RilhOyR+mn2TtjE/8xk23l63FlkT4RDthV6vueqsdzAxxmMvp3qjgt5dzFl
         F//ZQ9EvafjIGW69brt2jCjs8xELk4OrgLwrwO4cC6BzI0TwjVd4TmMd1uP5XVrIIXcS
         UjkiWNp6VqB+zwY347Gl0cGw5VVNjCqhSBKcPDXYP9mgdHaIMKEqfj23mpG1JVB0KBHv
         Ev4Z4KhgxpnbgEN8KWE9MoYvBeMffUnwX/sljRBT9uf8eyvvzlUYF21BlgnVBTPfpxWC
         ZKeNlC7Lj9tj+5UaMbqc40eFV0NhQlkDloTZP9uukGY5zUE8A3MFxe723X4huOYND1HF
         Duvw==
X-Forwarded-Encrypted: i=1; AL+hErERZaF4tgvPV+D1LSGtVtcZltrvDNhdF0JpBtFQReX2v12dC+FYW79SkSQ3YebJqRepuOk+IFRyIUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BIHoahApaABI9yEoKZAbeE63Hs/PjJXqkUkxvkrqtMMo4xc99
	kORqm5uzinw/1qbDWWDJcnmIQosmKJhJWHfekazlTzTVUpqhXyiWadxRDEMiwVoOaSFAwel7Woh
	/o4iOREY/7/BSS+8zNRC7COcDDICSKpM=
X-Gm-Gg: AYBFou1QngVm1ROwS0PwG8BSipO/U42ZWAQXKRx3o7xzuX4yuHyIX7ZGCY/D5ytZblR
	qo3sw4eWHZ18/XxiThtUVJgEuwQbSb3mctzaxrrAk4ea3lAV5Ts6x+UKXZrXoTuZxBvP/QzlIlH
	yWPNK42j+IHecvSUh34pjdHUX/kAmkLPQS+FYny5oLMf7HHYSZpEwnM0sI0JnSxZ9yQruzI0FpB
	3U0Pl3dr63pqvfF82a+1Ta9q8L63tixuLCgks6Ea2NZoM5bHjA/5I8uY1gXe0w4ieRIfV+DdDsR
	UOKlRQZuBvXIPnU/j/z7IaQA67YN4O7GQ+jbp7RUR643RUD+f5pOj8vmSxYd4kxI+TiInuv9x2t
	PE+qxcbmmpeAMKJYQos3cTFM8XW3kvzyuMqAq5bhMlhWAK2QyvMFSoO3nICoXZJd1Ac/sOwBzov
	zBuesMXF4ejFukiTDfEVIxsTc=
X-Received: by 2002:a17:907:94c2:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c50963cccbdmr1046355966b.38.1794913751100; Tue, 17 Nov 2026
 03:09:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:08:59 +0100
X-Gm-Features: AclHuK9H_8vU3hJPZ8dHPtT7XE9N0U_m1mhQuXonsqEgANhu7g6ac_7o1E3AWCc
Message-ID: <CA+=Fv5Ttsa=cbSPJSxx86krBNwcm=DRNNASfV+tvZY-sYySU6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket layout
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
>  arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
>  2 files changed, 29 insertions(+), 15 deletions(-)
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
> index c0c0ccefc467..85f7a56816ce 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,19 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
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
> +

After the reorder this sits outside the CONFIG_VERBOSE_MCHECK block but
is only used inside it until 2/7, so this patch alone warns with
VERBOSE_MCHECK=3Dn (and fails with CONFIG_WERROR):

  arch/alpha/kernel/err_marvel.c:25:1: warning: 'marvel_env_state'
defined but not used [-Wunused-function]

Wrapping it in #ifdef CONFIG_VERBOSE_MCHECK here and dropping that in
2/7 with the other one fixes it.

Growing the struct to 16 bytes is safe, since
ev7_collect_logout_frame_subpackets() steps by each subpacket's own
length (err_ev7.c).

>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
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


Magnus
