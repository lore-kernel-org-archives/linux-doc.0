Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A383D3CED
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368994; cv=none; b=VgX0cIMery+DjVx7w9BfU+Pk0lGVZZlsuQdB+veOju82Em7aeWpuwdpEN08UgKMAt/LxBbHBBrFX4rQDMQJjnizgNwjYwDd7nTM1WSzW3E6S+LgvEteJpWuS5fKYnM71ih8KuCH6uSib2dOjFyLcPV9yR/Tes/Ju/hkCS4tuCL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368994; c=relaxed/simple;
	bh=BIc3wHAs8s2sPATriFf+fq+uKIS7NsyRMXlyBl5vVsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iq5jnQnpmpUp6hssEWrCl7yzxoqI6NuIKJW2M2mtWzSUV6w0s/Rgj4zeVaJpmeTbvwQVfZ5nVgHPd6Mv5jgOVHMYUz5+BmGW++JGzAZ5Omnahpq82th1LpXpDzhG/52ZMcUtTiZB323A9lGQSJncflISwTcFF09xXARBnfspWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso468673241.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368992; x=1774973792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmRf0clXa/z48rdOhDwIqsCZTl6MAr1IPl0XdGWzmtg=;
        b=e0JpVBK6cxthIxQZsURDJZ/TCqOisWQnREJYd7X65hNQwuelC+KmE/nEhpC+Th1mDK
         tBAjbbH7/15AbSIFJ+Xul5aHxe9DOxhTQ1lvEhKiT/8M04bWL9DZYXZeK68DXWl5Ghcz
         v+2Z6Wzjr/i7qyEfYpPQm5Nhgpq/pxjmieD92uIcufjTGr6Kpf0OYLbOzV40YyNGjjD+
         fEPAQFK+CGoMp8y183/4HgM0mqn5g43yOtr6B9uJg63HmgYIMVGGsLJN9vlZZKukQ3bw
         pC+j5Y1++bJOSb/ODg1lBDep0kn53YjKsFC/CB2IoEiWVXW8OepZcDvnb5LsaSGZW/G6
         Aogg==
X-Forwarded-Encrypted: i=1; AJvYcCXEOShtRnNLcPbvW6SkTGJVjPpVuYxUdNaaneQV11gCeYZwvBgV0c84WMyjbLvvRohpyZLoScH1L70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kBlfTRmKqQ5hPkLlCL0MYVZoW4xd6nGohmqhpyY6KqmqdLUu
	sF6C1y/VZYLkLev6zO8J6GW6GnjNwMrtAsAXtcC3GgAaPJvwF6HiQ0Chlm8IVDA1QE4=
X-Gm-Gg: ATEYQzydUInwfFM7zmYsVPxHo05k1JAe7ISVKNke0w6G0MaJG2sIg2fn/kwxH/jWFWC
	wHZ2ci3/p80C1shdVzxWS29/O+IzMjtCPFE+nv52wgnPBJ8NfsJZQZXnAt517xIHD+twD5BEFmj
	7wVJHpJFlpgPGqSUMWsGfe4wAJDUui7d6qr2rIBdCjPT9S/QG8Jj2G7hWtqyP3IZ/BRK2Y51rb8
	BecJ9E2r8UJ61V9vkCgne5sWfHtsd9pwzMSYsjKrFXBM+x9DtD1cia1f99S/FvC4k4oczt6VK+8
	cAoz6rE9s/fy1PFVFhi0vie55ngBPPFe+YS8HhnreVQdAzov2KAMu7pX6CUXBBXAselzKcsXmAn
	bdNuQIrWsv5okN0BF6h5ge0XgVeQlMYPnzGfMlBnIg4N0VxCh6EvtvYB0kRp3rdUMMl8ekdrN4g
	7VC1X0B3ITNS0UVfo5rm6mHYz/gr6ZLcBjPQQjUnr0b84LnOeg942B5KDUUI6HRBdU
X-Received: by 2002:a05:6102:2b85:b0:5ff:fbe4:8a4 with SMTP id ada2fe7eead31-6038726704cmr242432137.21.1774368992134;
        Tue, 24 Mar 2026 09:16:32 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8b0ceesm10958174137.5.2026.03.24.09.16.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5673804da95so684073e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5uYf2F8MCpujVUVM5s/Kqp5yh/HqELze4jq5hHzNy/Z9UGZZA2bp3yd7Y+MbM5zcHtuhgi81nZwo=@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:603:270c:9ece with SMTP id
 ada2fe7eead31-60386ebc7d7mr249544137.11.1774368990997; Tue, 24 Mar 2026
 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com> <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 17:16:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
X-Gm-Features: AQROBzCujwdtX4JkcLDjVnd6LogBn_okx21mGqzFRhZGg9NW5EWThevgncjlCbw
Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: move hogs into GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 9 Mar 2026 at 13:43, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
>
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit d1d564ec4992945d ("gpio:
move hogs into GPIO core") in gpio/gpio/for-next.

This breaks GPIO on the Renesas Marzen (R-Car H1) board:

    -gpio_rcar ffc40000.gpio: driving 32 GPIOs
    +gpiochip_add_data_with_key: GPIOs 512..543 (ffc40000.gpio) failed
to register, -22
    +gpio_rcar ffc40000.gpio: failed to add GPIO controller
    +gpio_rcar ffc40000.gpio: probe with driver gpio_rcar failed with error -22

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -960,6 +960,98 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
>         }
>  }
>
> +int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
> +{
> +       struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
> +       struct fwnode_reference_args gpiospec;
> +       enum gpiod_flags dflags;
> +       struct gpio_desc *desc;
> +       unsigned long lflags;
> +       const char *name;
> +       int ret, argc;
> +       u32 gpios[3]; /* We support up to three-cell bindings. */
> +       u32 cells;
> +
> +       lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +       dflags = GPIOD_ASIS;
> +       name = NULL;
> +
> +       argc = fwnode_property_count_u32(fwnode, "gpios");
> +       if (argc < 0)
> +               return argc;
> +       if (argc > 3)
> +               return -EINVAL;

The GPIO hog at [1] has a gpios property with two entries:

    gpios = <17 GPIO_ACTIVE_LOW>, <18 GPIO_ACTIVE_LOW>;

hence argc = 4, which is considered invalid.

The check should take into account the actual value of #gpio-cells,
and handle the presence of multiple GPIOs.

"git grep -Ww gpio-hog -- arch/*/boot/dts/ | grep 'gpios\s*=.*>,'" finds
several other places where multiple GPIOs are specified.

> +
> +       ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (is_of_node(fwnode)) {
> +               /*
> +                * OF-nodes need some additional special handling for
> +                * translating of devicetree flags.
> +                */
> +               ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +               if (ret)
> +                       return ret;
> +               if (!ret && argc != cells)
> +                       return -EINVAL;
> +
> +               memset(&gpiospec, 0, sizeof(gpiospec));
> +               gpiospec.fwnode = fwnode;
> +               gpiospec.nargs = argc;
> +
> +               for (int i = 0; i < argc; i++)
> +                       gpiospec.args[i] = gpios[i];
> +
> +               ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               /*
> +                * GPIO_ACTIVE_LOW is currently the only lookup flag
> +                * supported for non-OF firmware nodes.
> +                */
> +               if (gpios[1])
> +                       lflags |= GPIO_ACTIVE_LOW;
> +       }
> +
> +       if (fwnode_property_present(fwnode, "input"))
> +               dflags |= GPIOD_IN;
> +       else if (fwnode_property_present(fwnode, "output-low"))
> +               dflags |= GPIOD_OUT_LOW;
> +       else if (fwnode_property_present(fwnode, "output-high"))
> +               dflags |= GPIOD_OUT_HIGH;
> +       else
> +               return -EINVAL;
> +
> +       fwnode_property_read_string(fwnode, "line-name", &name);
> +
> +       desc = gpiochip_get_desc(gc, gpios[0]);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       return gpiod_hog(desc, name, lflags, dflags);
> +}

[1] https://elixir.bootlin.com/linux/v6.19.9/source/arch/arm/boot/dts/renesas/r8a7779-marzen.dts#L196

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
