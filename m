Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913869;
	b=GDf0OaNdKUiculFMPy/8MJO/B7oWTvsdfcecKKACZJHshcGmGC0BGgEqAJnbYuvloKJR
	 QTLnMkKhkqNZVhPZG0nm+R0DxMo9lS6nVFWRUlCo06LkKGfi/yWOOb9XXcCl451H1YDkR
	 7XynDFtE2d7yji1/ix6MonQt4lAX77sADB4AhXiZGkA+zBaOSiGomxJEQb83RKLZJ5Y+k
	 6x7zxgSPyEfqzZ+TVuShJTQoMBIyWFYeqTXi/Bvpo11roQzxBzJK3HEx1UIGKen2VkWVY
	 OrhEiwc9Y/jFFLQ2NiCGDlxmk/X5Mp9hawnxYg+djhq5fwfnpezTbg4ziTDigTpiM8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
	b=DkqvtCbeSmHKrzt6Swt4tWGjjA6KSxVnkQgbuRWcSsrNVX7tfkOo+Doyt2ODaF2URr0f
	 Ft/C3NRisk07H2uhi7ju4mnbU0HxEfCfps2X0cIm/q/q5QQZAaOQHaoJh88mM4ShlW3o1
	 7EykI7KiJ91bHRDCRofVngnOSjt4fqf8KjjRm5Xte5qdbzGqVleqxPcZBDxUrgrxmGeXa
	 PI1Jh6FZxX6tWXs3q7RgD6BIMwIRXkWpVwki/HZiJ+ErKMDKVEQyHe+WnRAxwvq7Sm+NR
	 1DZWbuosAyiyvR95NSycIAErY44BDoD0Eo+4WwaGoY208v0i9upvpnsBzrThUfkG8Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CCD606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CCD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so6884425a12.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913867; cv=none;
        d=google.com; s=arc-20260327;
        b=lN0oRTVMLp5J8wgIyKgPIWHbK7tZLoEs57pH7Es/cbwVobXmC6YM9zzY02KBprlJ4B
         6PQlfv2bQJMfnIv11ewhYG+cMiFUUwaORm979HEm2CwEUsN+IHyPqahVAAAA6YnfQegV
         moWc5fqBvwQOdneap5ftwIPgCi/BbYql+B6M6m8W1L8GJzNYPjFZF7jSIH4uJDOMqheu
         0F/zqcl8+U9rczFnO4ezuLsBS1py9L98BGhoCzZUfRQD44BholkWS4t7BcEMgTCws4OY
         L2aW4DDD8SyWhUYb3nwnl3HPO2U23Qx4uO5477BPh93xZiOn2bm9XXcB4ckac/8A00Qv
         qd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        fh=wXKGnMw3ggtQVzQH9N9+9dGPwD9AMn1gdRiblNpvgR4=;
        b=fRKQGY6s+2WM6Q2HW6+xQaSSOBz0wxbmCc3j34umFjyj8DzZSAvMZ8W92sm4vgfkyS
         lYvoHyL51TjJlk3OnQ+eAoDkWVCE1Wif3lAi+rGloFPNUdRf7DIhuM7bPCtJAAZ07aX9
         rjwWEzX/o7WzkoU6Y0144+aCcZYevLgBMJkLf8PsiPZkAmugwbRTcG/fM77/wzf4th3U
         vFAfPG88ZE6W/5nDuNs+re6lCZfRFP+joLZK+ZJ2gUOmgnU+AV0uQdZlfmhShF1670Ez
         dBXIZ+Lj7B7SuNZtOGZsUt4ClFSMHoKunyB/JJc8ASxEY5yQ7RO7bFZz4zxbjyDFPH1j
         jSHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913867; x=1795518667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=moIxETzHa0Oq01n7L4mzCWZwm33Qlqm57PUEdjACdCaFiZo0ueGyZTZaC/wKy5SOMK
         oXI0FM9+gSkDnkpXkD6q1VLY/HTVf4Z4buQ9pQMLMXvVB7vUyLnBFQbzotk6yVCr4iC5
         PfqYo4e11phlxLS+s6bPmjvyYm9H2cEjqvYUpvv60l+cCAz4oo31FFdQZuofiiHnUXk4
         9ZwUdgDAc0puWw+LIme2GDkOcXdRnvM/sLPo6bULbEvwYYc0NSjyfWsLmydzKblH1JO7
         hX9DD6A2nVioNZfFT60yg7Q397SzaWnpnFkWdV/ovcu7DMmLQhPK+iKjZG6jsXS5WS9s
         vP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913867; x=1795518667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=Y0m3JKyv8fGBStTxBCDJdN23fRzIYPhpmeXSPUGoVTYft4xvfZaGHOGL1VrzvhHPzg
         kdJFCa7k4Img+WE6qxNv6X84KvuoXVDbskh84JIKdF8CjaNdplfg8DjWURsR7/jKsPOj
         agzBQ8qR9PLsE22yStZN2ZCzuujewAXVM2CuM95x9AIVjiBeABW41U1sQY/0oIWhmGOG
         CIlDF5WxPh8zYtNsiaV/QSiogaP4GVGbnd3ily0jgwfxYszCowCIKRNyfG8+vj/8D66x
         8VYPJcxdayCAUBj1zoTb907r+LJMA3ZzN07V9OFKzgtnqtkZ231bSFI+MJRxxpJQ0Gir
         kNig==
X-Forwarded-Encrypted: i=1; AL+hErGGWAuXWN8FXSUCE+Tqr4gOj64JPDDeoHi4XzgSNXc9MLrVUWWj60+P6yVCXWeiGX31XIt42Het+Bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xW70FqIApmnhhKpo0vPA4bQvVNvcUU7DeBtFlzyYs8rYlA1y7
	h4/ft4HFSp3+SIGymtBdxcbtiIBI/p+uiu3RX/+MJip3EoQWpjGBhiKZNysi8xncqpgVUWiB3XX
	zIVdb3dekJNG/T490bKfI3VGp9AE3sto=
X-Gm-Gg: AYBFou2s0uQgOpzGvwfKcUS0L/0WNPhDzE7Vuz9VepqwWZTIn4xwvpVBm02MDvmJtGl
	z5PN/lAlZB32gwwbpQFT8ELEMhi4dZQl/LMD6/Br/7UOwxHDOMgh1ECpfGqEgdy23tioaOTzO92
	KxLN2cKF0jtLidonoX/pHInOPRkLUNP71EaY/wHkulZUyev1+ng2mk5Oi4A1eaW4LX2OB1U/hO/
	waqHlzdEBXiAALUwTPVN/mhqlVei2WjqnouW+NDjv7y1XWVYBJGduWY03MpZA5hUBfuXXLY2unV
	nOn0zLos7Qp5L2ZAI7fmRuykdya3jM2c6qKi6d5vXKM8XhV/GhzrutKuNFmSGGxpl6AoP4aahs9
	WNts7P0eobRRT0KXsktlmZYUqp0mXhnWOPzQR+oCrZHO500Q8v6DEMFd+3Qt/MaLt9qL4wEljxs
	2vxpo+09KgL0S+8A8Ukn9bTUc=
X-Received: by 2002:a05:6402:c711:10b0:6b7:8b36:93f1 with SMTP id
 4fb4d7f45d1cf-6b7c098803fmr6702619a12.10.1794913866951; Tue, 17 Nov 2026
 03:11:06 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:54 +0100
X-Gm-Features: AclHuK-uU12m5JYQTGHnnby9FLfe8TB5m1Dddww0eP2k7bEnEFbxsuNSOldafTc
Message-ID: <CA+=Fv5S9+y3vuSpFd2MHFEAFOwa3Q_8gqPV=yei-ej0Zo-V-9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/marvel_env.h | 5 +++++
>  arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> index 16ccd2002a11..dbbf827a18ad 100644
> --- a/arch/alpha/include/asm/marvel_env.h
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -2,6 +2,8 @@
>  #ifndef __ALPHA_MARVEL_ENV_H
>  #define __ALPHA_MARVEL_ENV_H
>
> +#include <linux/notifier.h>
> +
>  /*
>   * Ask the console to refresh the environmental readings of the GCT node=
 at
>   * @offset from the start of the GCT. Returns the console status, which =
is 1
> @@ -9,4 +11,7 @@
>   */
>  long marvel_cfgtree_partial_update(unsigned long offset);
>Reviewed-by: Magnus Lindholm <linmag7@gmail.com>Reviewed-by: Magnus Lindho=
lm <linmag7@gmail.com>
> +/* Called from machine check context on each environmental system event.=
 */
> +extern struct atomic_notifier_head marvel_env_notifier;
> +
>  #endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 46c521cea9a0..6e0b0aabdaca 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -17,10 +17,14 @@
>  #include <asm/smp.h>
>  #include <asm/err_common.h>
>  #include <asm/err_ev7.h>
> +#include <asm/marvel_env.h>
>
>  #include "err_impl.h"
>  #include "proto.h"
>
> +ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
> +EXPORT_SYMBOL_GPL(marvel_env_notifier);
> +
>  static const char *
>  marvel_env_state(u16 state)
>  {
> @@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_=
subpackets, int print)
>                         status =3D MCHK_DISPOSITION_REPORT;
>         }
>
> -       if (print)
> +       /* The frame is processed twice; notify on the printing pass only=
. */
> +       if (print) {
>                 marvel_print_680_frame(lf_subpackets);
> +               atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL)=
;
> +       }
>
>         return status;
>  }
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
