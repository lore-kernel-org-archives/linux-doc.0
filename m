Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA8207E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 18:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1947289AbeCBSfv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 13:35:51 -0500
Received: from mail-ua0-f171.google.com ([209.85.217.171]:43790 "EHLO
        mail-ua0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1426870AbeCBSfs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 13:35:48 -0500
Received: by mail-ua0-f171.google.com with SMTP id b13so6628275uam.10
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nU3GjIQkjZypVpWEmHMR4D47DyorMa4HDmMMLhKIUTs=;
        b=GJwB21hiaPTtR1jUh1QlDl90FriL5sPd6mIizVrp8DNdB0SSB6OnlzcFHt4p0afkPY
         F7fvXELbYCez/lfoYmA6SYnI3/flfSnoJGwBEHL8ZIM0w/imTRUJR5ocFfncTXSjPo2b
         1lg5K8Idg0rDWUN3v53F7DBSuOKd4YGMgeU3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nU3GjIQkjZypVpWEmHMR4D47DyorMa4HDmMMLhKIUTs=;
        b=pjOBCA9usjUthxyCNpt0wh71hvJXHtckDNvgl7JnpQxdMPY4DaSZ/FYjFbPDhMbpTd
         7xa5JjTEPvtIBNgFZlYdbR0k65VyKKkniOLGgjvCs8nWDUsLe/tpPjN04hKEAAuaBo84
         N2Z+4xDzf4wA6Decq+9znaOPK5eYs/CAu5gKGFY56FQ4OUwesjVtotMfmjfmbpO21Ouy
         TWzoKAH1Bs8BrFj1fueh/LQiroXGsVxKrNzi2P+I7jLpJPtfz61emkWThussT78wobNq
         Sq52kcpWY4LoaZ0vsRvVrZ8+PGx3m0y8jChU/POAnhY07JiUEUawEZaN516xwwoCDOi0
         O1kg==
X-Gm-Message-State: APf1xPAjHm1GSnEVRTW706d87MTX+qxwGCrIFp5far0AMmJXgGc4D5oB
        HDz92HKIfUZWswIQEdfMsWs80VL843VANSstQpBwfQ==
X-Google-Smtp-Source: AG47ELu9QigM8gJatKoMdklLOZT4EeYv7jGt/pONcGURy2cpPCp4t7+aw65DdXnyurMKKf0ay4EfIzue7jhHjM1f0Sk=
X-Received: by 10.176.83.88 with SMTP id y24mr4261851uay.121.1520015747011;
 Fri, 02 Mar 2018 10:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com> <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
In-Reply-To: <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
From:   Daniel Kurtz <djkurtz@chromium.org>
Date:   Fri, 02 Mar 2018 18:35:35 +0000
Message-ID: <CAGS+omB76qbiuYjs7Rakff2JB7263_m5TRYDgvKM+wdBpaedNA@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     adurbin@chromium.org, Brian Norris <briannorris@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jslaby@suse.com, mingo@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        marc.zyngier@arm.com, frederic@kernel.org, dwmw@amazon.co.uk,
        tom.saeger@oracle.com, zohar@linux.vnet.ibm.com,
        alexander.levin@verizon.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 1:02 PM Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> > On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <
andy.shevchenko@gmail.com>
> > wrote:

> > "earlycon simply does not utilize the information".
> >
> > earlycon parses iotype, mapbase and baud (from options).  However, it is
> > hard-coded to assume that the clock used to generate the UART bitclock
is
> > always "BASE_BAUD * 16" (1843200).  While this may be true for many
UARTs,
> > it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48
MHz
> > clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk"
and
> > uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
> > actually a set up in acpi_apd.c when there is an acpi match for
"AMD0020",
> > with a rate read from the .fixed_clk_rate param of the corresponding
> > apd_device_desc.
> >
> > This patch attempts to add a way to inform earlycon about this clock.
As
> > noted above, the information is actually already in the kernel and used
by
> > 8250_dw - I would happy be to hear recommendations for wiring this data
> > into earlycon that doesn't require adding another command line arg.

> And it should not require that for sure!

> I would look to this later. It's late here. I need to do a bit of
> research for the answer.

> > I see that support was also added recently to earlycon to let it use
ACPI
> > SPCR to choose a console and configure its parameters... but AFAICT,
this
> > path also doesn't allow specifying the uart clock.

> Fix your firmware then. It should set console to 115200 like (almost)
> everyone does.
> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.

The console is 115200 when it is enabled.  However, the firmware does not
always enable it by default.
The problem is that the UART IP block has a fixed 48 MHz input clock, but
earlycon assumes this clock is always 1843200.

I looked a bit further, and I think this patch (or something similar) is
still required to teach generic earlycon how to handle an explicit
port->uartclk (ie, one that is not 1843200).
The extended string can then be explicitly set on the kernel command line
for this kind of hardware.

In addition, we can add another patch with a new quirk detector in
drivers/acpi/spcr.c:acpi_parse_spcr() to handle this hardware.
acpi_parse_spcr() can then use the extended option string to pass in the
appropriate UART clock to setup_eralycon().

This would again allow a user to just use the simple command line parameter
"earlycon" if the device's firmware has a correctly confiured ACPI SPCR
table.

Thanks,
-Dan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
