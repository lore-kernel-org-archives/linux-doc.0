Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D987372684
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843080; cv=none; b=huu6OEtjZBCGBU3q+PRpQzXPismHfwNtvMqLrQ7MLwH6zxgfSn+yN/jpu2NN59F8icpltG3MqbU9PxAIqRCEP6wvfJ82YT6fqzMM6ZYSgyK2L3PaISNUVyNR2UlwMwgphj+SgUMzOPVKDHNqV834KQwFK1cpwcl8OS/Q8kNhxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843080; c=relaxed/simple;
	bh=/UWyFxIqZ0kNMlHfoi7yu8dKm9vFSeq3QcEOL4MLFuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SL+OVq3d68q5cFGFn97GXVKoi7FayHTirHG3JljSSvF4yHuNws1ydrky6Lehh4q9GHiq+isSMc3DEf1g/a0P61D9lRGK3HMFbcaVvvgpSgre+S1AH0Uzu3vIb6dV/iJzwLgz7a9X8+1x9W8o4se01HymWt0ym8TKjjNLG0nCaRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6058a955e04so3294084137.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843078; x=1777447878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQwgq6EqJNpFWLWCEPv0RlVhigX0dz3qmgahm/Rlf/g=;
        b=LPMUTDxfoLTcXIsArAeMs3W8GJEVBt2g8RpOaE70h1z9czN5IFw24dCeYMV6S3tR7r
         14t4S4H0OoHqwtwyM5Vcb2Lu1GlIHJssMrMvMEj6BZcqIStFVBxh0u+0IONZDgV+MJNS
         BnmFpwfRh6Au7ZICW2Jkg3riSbsuDpB31sIz5qL+rifADjgnlr94b1Vt9FmqHzoLAkxO
         i89V27PQd8HbjRp2VmyNxErhlk6wJVFl1jw6ygFT8Pb+7nLyKlxgaLy0uUL1pEG1HRzK
         aB7+/Emm9hks0nqGGkRdbznkBhCmDh/Q9+r1S+SbXPar3AgCCGqNfpQUCZFi990gcXwO
         duZw==
X-Forwarded-Encrypted: i=1; AFNElJ9uQgr38Q+TFeZBZVmJZO5tMD2q4dvd1///cBm+fUUBiAtMLSdqBGDvtIOZR06nfIToQhsH0hienQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgP+DzP9q0PHZm18C+7UQCHvqklvc99rXOK8440ozqghpD0wr
	bWAOg7sz/eiYLt+dTvjtjIC1XnKhYGNTiI7yPB7PY2ajvT3HN9FCHHdShhCcgRVmyDM=
X-Gm-Gg: AeBDiesu7HqB14iw0G88HZ60zx4rOe1T3ziZs3bQtoyIKSOVnASFa2fpahsbDaVrchu
	/+wGEI/lLhlL6QhrakfbicJgJS+eDUi2zFX/88vmH+icTmkoRF0txquKIk5POqjouJ3KyWFuq9t
	oXj4iNeOno+/avxOO/+VYBGCOpZYKTQHfgG+Onl3QWijJHIwiquC7SynDTYUcODVPyXEPxCN0FC
	AW3Cjc/6eQrwzpl89ue/kltY4c/+MWYrnhLFrP9CVjqo4trLkFrdXNla8fQ4s9/1hos/0csiIKk
	Mwzq4pUmD99/x5YMeHTUZmutJnuhXC5lMpbc/Rm4p40PdlH+WwDPzBKLIQ2pYw5BtJjTmozCN8w
	HteHr7MET8FjJLUBI7uizim72HnmxcSaqnp2I60+Z2QvhP6optu5StT2zaGqWwGSJ2T75GoknDp
	F6/4g30yfhSpe4uE5qnb9DTj6AJ7FRk2kAcqTUtqSTZOnGwJryAC4V0NM6AGXgM1zdn9w8nDAfh
	e3V0oVD0A==
X-Received: by 2002:a05:6102:290b:b0:613:3fff:febc with SMTP id ada2fe7eead31-616fb5839aamr6900960137.2.1776843078350;
        Wed, 22 Apr 2026 00:31:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617482b3ac4sm7761466137.12.2026.04.22.00.31.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:31:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so3738734241.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:31:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/enDESQoRY4ZBivv07vr0tjSoosMYCAUsud2qdrNPWLn99OmZq7ja87mVVhnehIpvpu9lezUtM63k=@vger.kernel.org
X-Received: by 2002:a05:6102:5a93:b0:602:8742:1fa with SMTP id
 ada2fe7eead31-616fc3bb2f8mr7873346137.9.1776843077349; Wed, 22 Apr 2026
 00:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
 <20260421-v7-0-0-net-next-driver-removal-v1-v1-11-69517c689d1f@lunn.ch>
In-Reply-To: <20260421-v7-0-0-net-next-driver-removal-v1-v1-11-69517c689d1f@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 09:31:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWz=ucmKxHXmzKj=oTn6yMVxPnkNxtG6X2C3ts_ZCg4Cw@mail.gmail.com>
X-Gm-Features: AQROBzBru55g_Cp5qhyGna3PYI2tAgoVWvZO0sTyGM38iTeLxvBDeekBc6dxHxI
Message-ID: <CAMuHMdWz=ucmKxHXmzKj=oTn6yMVxPnkNxtG6X2C3ts_ZCg4Cw@mail.gmail.com>
Subject: Re: [PATCH net 11/18] drivers: net: cirrus: cs89x0: Remove this driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 22 Apr 2026 at 03:04, Andrew Lunn <andrew@lunn.ch> wrote:
> The cs89x0 was written by Bonald Becker 1993 to 1994. It is an ISA
> device, so unlikely to be used with modern kernels.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Thanks for your patch!

> --- a/drivers/net/ethernet/cirrus/Kconfig
> +++ b/drivers/net/ethernet/cirrus/Kconfig
> @@ -17,36 +17,6 @@ config NET_VENDOR_CIRRUS
>
>  if NET_VENDOR_CIRRUS
>
> -config CS89x0
> -       tristate
> -
> -config CS89x0_ISA
> -       tristate "CS89x0 ISA driver support"
> -       depends on HAS_IOPORT_MAP
> -       depends on ISA
> -       depends on !PPC32
> -       depends on CS89x0_PLATFORM=n
> -       select NETDEV_LEGACY_INIT
> -       select CS89x0
> -       help
> -         Support for CS89x0 chipset based Ethernet cards. If you have a
> -         network (Ethernet) card of this type, say Y and read the file
> -         <file:Documentation/networking/device_drivers/ethernet/cirrus/cs89x0.rst>.
> -
> -         To compile this driver as a module, choose M here. The module
> -         will be called cs89x0.

This is the driver for the old twentieth-century ISA device...

> -
> -config CS89x0_PLATFORM
> -       tristate "CS89x0 platform driver support"
> -       depends on ARM || (COMPILE_TEST && !PPC)
> -       select CS89x0
> -       help
> -         Say Y to compile the cs89x0 platform driver. This makes this driver
> -         suitable for use on certain evaluation boards such as the iMX21ADS.
> -
> -         To compile this driver as a module, choose M here. The module
> -         will be called cs89x0.

This is the more modern DT-based part...

> --- a/drivers/net/ethernet/cirrus/cs89x0.c
> +++ /dev/null

> -#if IS_ENABLED(CONFIG_CS89x0_PLATFORM)

[...]

> -static const struct of_device_id __maybe_unused cs89x0_match[] = {
> -       { .compatible = "cirrus,cs8900", },
> -       { .compatible = "cirrus,cs8920", },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, cs89x0_match);

[...]

> -#endif /* CONFIG_CS89x0_PLATFORM */

However, no users of these compatible values ever appeared upstream.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
