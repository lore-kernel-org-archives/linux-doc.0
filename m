Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A22BF7E244
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 15:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751989AbeCCP40 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 10:56:26 -0500
Received: from mail-qk0-f181.google.com ([209.85.220.181]:43521 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbeCCP4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Mar 2018 10:56:25 -0500
Received: by mail-qk0-f181.google.com with SMTP id j4so15664752qke.10;
        Sat, 03 Mar 2018 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=yiPWoJMV1T3F4uyGDeFvvSQuBs7cD78MykuqNCi2ytA=;
        b=UuORIC9292vSDn03C3/KZhJ64oZb5nCms4/Wgo+oI1Fc6w+LezV/TvbHHU68b0yIWj
         gm3kX3pwPzXisuDxJKZqg98qN0VekLaMHBnaInqBQo9AvYhHEigq/rP7xNkfYxabudHo
         m8Hjkrp7o+ETYJ/I1io3iSIN0LYFXiIn3yrsNzAswdjAOOVotQMVXsWya65xObUsT4rz
         MIK1hNaHHdpTD7PD3XITIhWmEXOD6olhAqabAVM5yvYqCA0gQZ2NbYTIWCh3OqfyrSGg
         2ambAx4DvM/MI2uL54rHdFY32aDZ0sqeqrGxON7zAuociuINsv5pbfHHex3m06g3UXL8
         53rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=yiPWoJMV1T3F4uyGDeFvvSQuBs7cD78MykuqNCi2ytA=;
        b=WX7hMcDkke2c5ffD+Aq88uC3ALGjSkKO1Idqdj0n6o0ZAEVU/pbjC91vZZniHBpKe9
         JStJy5vuRouFwa9D9EoN2Iy/fj2c75fZCXkNk0CFBFH6bMTvHOTBP9RYU0vsDjZQYCsO
         Jv5VsNc6iz4Z57s/sEnd/mg/OA/l3idnfyGcPupXbMP8IiBzT9McRPabhUXzqU+qlQ5j
         jy2tZiCHYCO6233S0st4AWwaeLEjwCq/tl5RoZ88XsDaTzqqKna84FHqKkunOMc2envK
         8X3+DsjVnYY/QR6K3GYzRJQppe7ka0DrpHxvMcip0u5+BO1Q+VYiD6n77GXsgsN+pct0
         x2vQ==
X-Gm-Message-State: AElRT7GL1dOD4eOqX9BbarQJ9lqNGkEojat2nHDsTd+I8VCw4mVV1PCA
        n4QrqBThJhXoE48CbxLVY4zv8Y1kLQnpjKHSHpY=
X-Google-Smtp-Source: AG47ELs0Qqd3XZarf/zHrhRGuQk9DusEMmxPSfJInnr/N0TnNvyhdZaGhfTS8dL2xlKunhSVqCLVbM6Tso3Aln4UXvo=
X-Received: by 10.55.207.82 with SMTP id e79mr4461364qkj.219.1520092584672;
 Sat, 03 Mar 2018 07:56:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.195.80 with HTTP; Sat, 3 Mar 2018 07:56:24 -0800 (PST)
In-Reply-To: <CAGS+omB76qbiuYjs7Rakff2JB7263_m5TRYDgvKM+wdBpaedNA@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
 <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com> <CAGS+omB76qbiuYjs7Rakff2JB7263_m5TRYDgvKM+wdBpaedNA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 3 Mar 2018 17:56:24 +0200
Message-ID: <CAHp75Veu=0w2sWpgn0mNFa0G3Gwp2SpHv55vPgLiWjrCAzaiGw@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Daniel Kurtz <djkurtz@chromium.org>
Cc:     Aaron Durbin <adurbin@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
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

On Fri, Mar 2, 2018 at 8:35 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> On Thu, Mar 1, 2018 at 1:02 PM Andy Shevchenko <andy.shevchenko@gmail.com>
> wrote:
>> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>> > On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <
> andy.shevchenko@gmail.com>
>> > wrote:

> the UART bitclock
> is
>> > always "BASE_BAUD * 16" (1843200).  While this may be true for many
> UARTs,
>> > it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48
> MHz
>> > clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk"
> and
>> > uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
>> > actually a set up in acpi_apd.c when there is an acpi match for
> "AMD0020",
>> > with a rate read from the .fixed_clk_rate param of the corresponding
>> > apd_device_desc.

> As
>> > noted above, the information is actually already in the kernel and used
> by
>> > 8250_dw - I would happy be to hear recommendations for wiring this data
>> > into earlycon that doesn't require adding another command line arg.

Brief look at the code shows that ->setup() call back is executed
after setting initial (which is hardcoded) clock.

What you need is to either create another type of earlycon for your
device with accompanied ->setup() callback, or patch 8250_early.c.

>> > I see that support was also added recently to earlycon to let it use
> ACPI
>> > SPCR to choose a console and configure its parameters... but AFAICT,
> this
>> > path also doesn't allow specifying the uart clock.

It does specify baudrate. It means it's _firmware_ responsibility to
configure UART device properly.

>> Fix your firmware then. It should set console to 115200 like (almost)
>> everyone does.
>> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.
>
> The console is 115200 when it is enabled.  However, the firmware does not
> always enable it by default.

Another firmware bug.

> The problem is that the UART IP block has a fixed 48 MHz input clock, but
> earlycon assumes this clock is always 1843200.

> I looked a bit further, and I think this patch (or something similar) is
> still required to teach generic earlycon how to handle an explicit
> port->uartclk (ie, one that is not 1843200).
> The extended string can then be explicitly set on the kernel command line
> for this kind of hardware.

No.

> In addition, we can add another patch with a new quirk detector in
> drivers/acpi/spcr.c:acpi_parse_spcr() to handle this hardware.
> acpi_parse_spcr() can then use the extended option string to pass in the
> appropriate UART clock to setup_eralycon().

Definitely no. It's not defined in SPCR spec.

> This would again allow a user to just use the simple command line parameter
> "earlycon" if the device's firmware has a correctly confiured ACPI SPCR
> table.

NAK to the patch, see above alternatives.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
