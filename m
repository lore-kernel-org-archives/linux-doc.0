Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 901157E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 20:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1161436AbeCAUC1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 15:02:27 -0500
Received: from mail-qt0-f170.google.com ([209.85.216.170]:44321 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161432AbeCAUC0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 15:02:26 -0500
Received: by mail-qt0-f170.google.com with SMTP id g60so9146226qtd.11;
        Thu, 01 Mar 2018 12:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=WDyIH1krvqTZxOKUIpkFGl78BGSAW3guXkG36iui3MQ=;
        b=MSYaADQPFM0ayMan5zwsLlAMkp5jGmXcnYrneZOBWNU/aa1+8HMjRVWkIxEfE1MBdW
         8tMWDNAdD1YLJpsJ9Eea0nIWwgG8siHczEaYAP8pxiwhFgc2/JDWTLc+jfkv93XaAaxd
         K00ZlbRdBI0wBiVftB921QhugUvBeA3ekI/xgf+ez01LqlUPmrMaN8XjdfvjZpxD0GlR
         TQdZlqiD/+sAYFMwqqpHlCvrhUKnMiFqbHAxWeUTNU/IWEdcurbShurpK4D4YAEBzX6e
         EPHC9jdXpfxB+jkuveLnOn4NPGle28zhJcPPe3AcS+GoPJX0FzMdVgayMb8zUXYML6QW
         oXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=WDyIH1krvqTZxOKUIpkFGl78BGSAW3guXkG36iui3MQ=;
        b=BcuYUgy8bb9818kM65J4NZ3o/dydXVaQpbFRJjl0y0qpZSQEgFPHIhAfPPrm5SpHmq
         vXrr+TpzPsdGuUTtxUba5k8JA7e9WBES3NZorovsgiyhgLg/NmNjci7Zo9YEPw3OesWf
         ekCBYzeHuPYEpra2qYGhr3lQJn0qTnxvLq9MiprugmUlMu6J7HGstmogbb4A7htEOYUC
         zWIqmWOFq/NBV7jnG/iAw9JhY5bw/A6dbBtzFKNbzdvx6myP95Ats3870iGjF93oAGB6
         Ry2EeOO8qSAHQ9bcon0+JLzCJ50rNGGFHiQJf44cRBrW1Bxra9muJSplfVfBLFpAudcM
         D8Nw==
X-Gm-Message-State: AElRT7HDBjxnkrdl5pO0rlR4179mAASHoPUk1CtuRjO8Ne5f4b2GhcYs
        1pGYvfp8LC27QsHyaRcBXw//FXqdbpOi8THbx48=
X-Google-Smtp-Source: AG47ELtXp/Ubc+XGWVVJn88UX/r1X/ceKi/uBXTiVNSHZPLukGeJ8WmePjjZltetoOEhRlhA3KXaXLdh/UeSQvalkbs=
X-Received: by 10.200.26.79 with SMTP id q15mr4650817qtk.174.1519934545169;
 Thu, 01 Mar 2018 12:02:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.195.80 with HTTP; Thu, 1 Mar 2018 12:02:24 -0800 (PST)
In-Reply-To: <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Mar 2018 22:02:24 +0200
Message-ID: <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Daniel Kurtz <djkurtz@chromium.org>
Cc:     adurbin@chromium.org, Brian Norris <briannorris@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Tom Saeger <tom.saeger@oracle.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <andy.shevchenko@gmail.com>
> wrote:

> "earlycon simply does not utilize the information".
>
> earlycon parses iotype, mapbase and baud (from options).  However, it is
> hard-coded to assume that the clock used to generate the UART bitclock is
> always "BASE_BAUD * 16" (1843200).  While this may be true for many UARTs,
> it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48 MHz
> clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk" and
> uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
> actually a set up in acpi_apd.c when there is an acpi match for "AMD0020",
> with a rate read from the .fixed_clk_rate param of the corresponding
> apd_device_desc.
>
> This patch attempts to add a way to inform earlycon about this clock.  As
> noted above, the information is actually already in the kernel and used by
> 8250_dw - I would happy be to hear recommendations for wiring this data
> into earlycon that doesn't require adding another command line arg.

And it should not require that for sure!

I would look to this later. It's late here. I need to do a bit of
research for the answer.

> I see that support was also added recently to earlycon to let it use ACPI
> SPCR to choose a console and configure its parameters... but AFAICT, this
> path also doesn't allow specifying the uart clock.

Fix your firmware then. It should set console to 115200 like (almost)
everyone does.
Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
