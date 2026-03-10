Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001F306498
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154841; cv=none; b=CbZyC1iU/VwHk4qLMpiIkvSjlOiFQTCHR3CGuVtVaZZFnX/c4Ma1ToVAhL/ejIa+DzILThQg/kMa45//tX/JPzsu+Nnp0kCV8iyf8txQBiFhqjgZ1tibP8+UuSENUkg4jDmqJU/oR7l5sMYdVb1ZbEprzBENuPdeDjvuy8PQJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154841; c=relaxed/simple;
	bh=E4y5SjxQYFIHYx8OjoVFKchVjF6kT29GZOvgR2ljlWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juu9ykZhH5KZTAgzrzyzeKIAZhnW5ZikVa1TS6obY9e1uK+Ow1rSaGK3ey9+vPnHY9C/5MjhwTvrbaemtMsnt4QYLg7zCnO5SCWlhDFXHXzAiiiciOb/fKzSYrrjjm7PxSFnqKZQafhxYysPLslRlTqpnAquxsytHmXPneC8TZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94dd0f3c4b7so7640458241.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154837; x=1773759637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbdnccCezu2uMC00sjJ2cmGPWS7DRd2NbCZXVo+mkHA=;
        b=Kxy5TQRDUK/iR3eWgTVIkDprC0NnwYMePN5Zx3voTNZb9uwHjlEyUtvhteNSHYZH82
         tOv3Qf0sbIHtbXzhwAAnDgklB8YZIfaz6KBDvHPwep5uEO1eIzyd/p3vtBoDaF6asVfE
         /aJfeGlOIDmqLNirYCHgO1zVwv6K43BKMMIZ5Ch83p6IwXgA2knCAo+V9476TSa8H0M+
         K4Xaomyz7PHrBszXwRG6u3xk/33pwX1U8VV5i9p6huKlUw4epcVoFoQowkVHtj3zmI24
         HEIfJkPSSKKXRxxyTevtDk3NPeikuC3r7jjJKyEpH0344YNzLeCrpDQ1hJyup9E79zDw
         G0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVIGjGUSi3nV5CnrNGmMTJOq3UX7y/McR0I+kA6rfZX9mSFhOVH94uetFtxrNZLuIxV2hzBd48k8Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYYZXKBsWA2fFgw8qBpMqm3vCxPCqK4W5n5JM3C3t9SHT/HLK
	WzkSjOotQvdTMyZIjYvTk851pgl9CfexpjiPYaeeyLTAB7dPyuN3bvK3/AHGL5JP
X-Gm-Gg: ATEYQzy6kC3APDgYEZ1x+t2u68ovz3dqrFA9WlWi7kIttcdEFuEE3FmsQ2vegOtIail
	4GB2a8qb7pGo7g8YE21jjUWD99lq+7BtNVegaawcYllXlieNN6S+QczwXbbV70hr2QcIyNt3+Du
	l4LcKQLHo/+z8z/3Krd1wRmIbkhENWYGSddbbrD/eSTjgbOKHZ9k3BqxzgCcsmRD/1XHYUO9p59
	Nkp6w5XT0mUK/MYui3MZrziRvSLQApLbFM+0GoqV1knhKJoAyh1tInM807tDh81gadhp8oQ2END
	21C6fomtNcIFFUVagU6J6ZPI9EE9B8G3D1kd6NDhZM/05EJdpD1J4I3XkHgauTDG16+R66po3l1
	koGvHA7cmjgHYmhdHQgA6d6B1JHq6gjBXG+IWgohaTFLYXDM9GA8sLgwjurGtk5aiymghnwGYYY
	4NNkdaAsRgAZQLaaoVfYxl+3uGrAUktntgwDLZrGaYcFljqQ/onqJI98J+n+Di8wNU
X-Received: by 2002:a05:6102:32c1:b0:5ff:b684:f7c5 with SMTP id ada2fe7eead31-5ffe5ed0a52mr5820579137.8.1773154836712;
        Tue, 10 Mar 2026 08:00:36 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ea681505csm2868619241.4.2026.03.10.08.00.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:00:36 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5675d609621so10887463e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp5usAwZQUf7kUH8uSTrAVeQ8f3gJcjKbHTP+xF+4ZRKfu3gAdslT2qD3/Vr2QPHrjb7CybXVo2Pc=@vger.kernel.org
X-Received: by 2002:a05:6102:b10:b0:5ff:ae5c:c669 with SMTP id
 ada2fe7eead31-5ffe635a574mr5925123137.37.1773154835193; Tue, 10 Mar 2026
 08:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com> <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:00:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiF0qF35Lyti=7ts9Uw35Z8Q234BHH7BmEteM=hHOGZw@mail.gmail.com>
X-Gm-Features: AaiRm53MlUq7KDaXohTp5AuH5MwNn7SEvlXJchnY2cRz9zIrHfYicONv2V0J46M
Message-ID: <CAMuHMdUiF0qF35Lyti=7ts9Uw35Z8Q234BHH7BmEteM=hHOGZw@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	brgl@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Fri, 6 Mar 2026 at 18:30, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> With everything else now in place, we can convert the remaining parts of
> the reset subsystem to becoming fwnode-agnostic - meaning it will work
> with all kinds of firmware nodes, not only devicetree.
>
> To that end: extend struct reset_controller_dev with fields taking
> information relevant for using firmware nodes (which mirrors what we
> already do for OF-nodes) and limit using of_ APIs only to where it's
> absolutely necessary (mostly around the of_xlate callback).
>
> For backward compatibility of existing drivers we still support OF-nodes
> but firmware nodes become the preferred method.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit 9035073d0ef1de81 ("reset:
convert reset core to using firmware nodes") in reset/next.

> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c

> @@ -951,18 +965,18 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
>         return 0;
>  }
>
> -static void reset_gpio_add_devlink(struct device_node *np,
> +static void reset_gpio_add_devlink(struct fwnode_handle *fwnode,
>                                    struct reset_gpio_lookup *rgpio_dev)
>  {
>         struct device *consumer;
>
>         /*
> -        * We must use get_dev_from_fwnode() and not of_find_device_by_node()
> +        * We must use get_dev_from_fwnode() and not ref_find_device_by_node()

ref_find_device_by_node() does not exist. What should it be?

>          * because the latter only considers the platform bus while we want to
>          * get consumers of any kind that can be associated with firmware
>          * nodes: auxiliary, soundwire, etc.
>          */
> -       consumer = get_dev_from_fwnode(of_fwnode_handle(np));
> +       consumer = get_dev_from_fwnode(fwnode);
>         if (consumer) {
>                 if (!device_link_add(consumer, &rgpio_dev->adev.dev,
>                                      DL_FLAG_AUTOREMOVE_CONSUMER))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
