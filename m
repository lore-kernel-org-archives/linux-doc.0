Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64C8B7E22F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 21:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1161923AbeCAVYM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 16:24:12 -0500
Received: from mail-yb0-f172.google.com ([209.85.213.172]:34701 "EHLO
        mail-yb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161500AbeCAVYK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 16:24:10 -0500
Received: by mail-yb0-f172.google.com with SMTP id e3-v6so2702058ybk.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Mar 2018 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=6Feh5M0NXp0+mWVaYKxpjQSE+w8KrZs9lmeEI6DIBqE=;
        b=QLccx/Tq9nnXknPUY3ONxaAUjwZ5bjLdOaCwCsqTWlcqQ0FKOt3rVIdUOpV+ROy+Pu
         Y17jMbD5L0/vb9rgHCaiCBH4DMurUlEHO2KPBRe7Z++z6CF5WjU2le+gqo96VsNskzUU
         LLa1OcKCFmPLVylT21Zkd23itz5uzehsmk8JbjhhV0ANvldr7y72AOfuOTSZhl2FZYnC
         qg3pGxk0FuzSt1FEhfyz6whjHPpInyc5DmN3twAJ0nZamhCIpbBufa11TmolxhbR1pYl
         fvXAzmZOSbx9l/ee/s3M1UDIGa2LXLjB/yiUMv4680Y1PsyauFfXupEUws91wHHauGRM
         meOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=6Feh5M0NXp0+mWVaYKxpjQSE+w8KrZs9lmeEI6DIBqE=;
        b=K2vkhuCH+SwX4lsdxlxrUb9W5RDOHQp4eZdUFezyFq+3GzNK8UtkrSTsj8tGoxsCwA
         rGaEkoZ6QqYB4Sr6iNFl8wcrJkNkoDdEdGF9uYON0ke7YjB7dNZzZbuK33nmYyHlXtrR
         El7OHyecQmvKpJi1PIcCQfns33pWdhwRtbkCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=6Feh5M0NXp0+mWVaYKxpjQSE+w8KrZs9lmeEI6DIBqE=;
        b=qbXTM24XmhQ8WRY1uOapjEOLokrN8bL7Uj8QF6IsS2VG2SiVAF97d1DMnCeS1A9e1B
         NOG0idoTYpyhIus0BQkfYxYbUEJMe/gOnSH9tGb3y1jWXpRUJEZmKhT/TKDt+a84mUKQ
         Iku/N5cJgKlezp0m0ZNbrg/FX6qLYugIzBRMck45OHO2ai8P1wung1BqkEZNu4Pbz909
         nw2kQHVTu0JTkN5ALlk0a/Sn99DD4NhYNXHSFKifSIXm3hvEzA2wG88EvBtDYgOF7QOA
         3CWMaVoiO/ZbN7M6Rtb9oP/Yon5gjfuYTZ3V1COX6+Sbdzqf/7wikwxNYTYL0mYWphmB
         JCxQ==
X-Gm-Message-State: AElRT7E8BseGqHPwFJaz+uJWeTOYTRFU8lQlByHxZslp16vFj8IEj1Ed
        p8ADkhk+qziMg2QBC/b1ag2wHdD4nbQYs3LoTV46DQ==
X-Google-Smtp-Source: AG47ELvmdXU2V25Rvdoq+qxNQqZry/SxMTjpl/Y2g2baqNJ+2GrP15KGd2+sS1pG60FBWmqOARK1YAtMdfVv/WD1gzU=
X-Received: by 2002:a25:bd42:: with SMTP id p2-v6mr2308923ybm.214.1519939449043;
 Thu, 01 Mar 2018 13:24:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:f81e:0:0:0:0:0 with HTTP; Thu, 1 Mar 2018 13:24:08 -0800 (PST)
In-Reply-To: <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com> <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
From:   Aaron Durbin <adurbin@chromium.org>
Date:   Thu, 1 Mar 2018 14:24:08 -0700
X-Google-Sender-Auth: JN3mM_pz1HSb1QoFAIcxnScaKeM
Message-ID: <CAE2855vbQyMwu8pmH-Sq1kA+=h5TJPWddTWPQoVdEqOn6sAyBw@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Kurtz <djkurtz@chromium.org>,
        Aaron Durbin <adurbin@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
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

On Thu, Mar 1, 2018 at 1:02 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>> On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <andy.shevchenko@gmail.com>
>> wrote:
>
>> "earlycon simply does not utilize the information".
>>
>> earlycon parses iotype, mapbase and baud (from options).  However, it is
>> hard-coded to assume that the clock used to generate the UART bitclock is
>> always "BASE_BAUD * 16" (1843200).  While this may be true for many UARTs,
>> it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48 MHz
>> clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk" and
>> uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
>> actually a set up in acpi_apd.c when there is an acpi match for "AMD0020",
>> with a rate read from the .fixed_clk_rate param of the corresponding
>> apd_device_desc.
>>
>> This patch attempts to add a way to inform earlycon about this clock.  As
>> noted above, the information is actually already in the kernel and used by
>> 8250_dw - I would happy be to hear recommendations for wiring this data
>> into earlycon that doesn't require adding another command line arg.
>
> And it should not require that for sure!

But it does require that. There's an input clock to the uart ip block.
That is a design constraint by the hardware and is required to make
baud calculation work.

>
> I would look to this later. It's late here. I need to do a bit of
> research for the answer.
>
>> I see that support was also added recently to earlycon to let it use ACPI
>> SPCR to choose a console and configure its parameters... but AFAICT, this
>> path also doesn't allow specifying the uart clock.
>
> Fix your firmware then. It should set console to 115200 like (almost)
> everyone does.

It's not a firmware problem. Its the driver's problem in that it
assumes an input clock to the uart block that does not reflect
reality.

> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.

That's only possible if there is a clock divider on the front end of
the uart block. For this hardware that's not the case. I actually did
this very thing on intel chromebook devices, but it was only possible
because there was a hardware divider that could be tuned to reach the
assumed clock that the code currently assumes.

>
> --
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
