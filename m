Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78F737E281
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 19:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752323AbeCCT1P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 14:27:15 -0500
Received: from mail-yw0-f173.google.com ([209.85.161.173]:35257 "EHLO
        mail-yw0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752309AbeCCT1N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Mar 2018 14:27:13 -0500
Received: by mail-yw0-f173.google.com with SMTP id d205so4418806ywe.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Mar 2018 11:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/N/X5/QV54myHP9RaEZagCBv94nEkTtBpcOSOGEzPD0=;
        b=bUNBHBi3py2s0fTQf9Cn4rFuDpPO1RIBeCjH8kcWOOAe/lbuWAn7xgzfU6cqQUQt/d
         UCVl4UA/YHiior99vAG0gdcB73TyQwiXtxykuk3yxHpaz1IeDamB/5Cs1zCHFKYSn4Uk
         6lNkBR3skiQ9gvdjhmRFMDh2FJdpLelJa3tKKL9Etr/FO1gJcasn03UMouiNLRPb/lfY
         fbD+HTY2OnNiujvittGfc+Yj8Sdn0UVjxTXJ6JzA7udKwHhBDDVdzNKsAqTFuIu0Mtvv
         /VNNyMXMrzMf+BcSSQrQ4ZI+bUBe9w0iRgGFmfw9+Ox77nBnWRHfVbAf9xfii6VZ5pr6
         J0zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/N/X5/QV54myHP9RaEZagCBv94nEkTtBpcOSOGEzPD0=;
        b=ngIeBAgQpkU6arRW1UXHJ3ISpKk/CvzI7j3qvxXd09AygIQ/VpsDQl2qsNo3tQC4Le
         U3D7bkMWi80IgfOEyyqc72evxJPpWjqzMGJuZqdhhIQwKwkKYCy8bZtT9+PFJKbvN1C2
         rjd4eS2lpkVcQdRkUMCbV8X+LAqTE6ghm80+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=/N/X5/QV54myHP9RaEZagCBv94nEkTtBpcOSOGEzPD0=;
        b=UHzlvSc8Z9b/7fCigHEaxBuLi/upf0HJWkfxfQ/m8bkRxysqUl7OoiFqrKPzFqZocr
         FUQ0wFY7WDdsIsHkkLnYpNT0RAsRzrPN2a6vD6OXx3ywxyZ1oFajmeM0I9AUdW3Q/lfN
         tMfkOmlYY4jC3ZS/bIwyE9hqIDDFjKHn6fuo/j/Cc0d11s2kjAYRdHR3G4RcwGbg2Xyn
         XF/Z70pbl1z3boXosDowBo/r+tVGqbmI+1nfZi/LnM44G4JUEorfat5/Efy40PaO+xNf
         Hki7VMHu/crhsRCXr1xZvvUyIp7t5Ur3Gxlgup25HvPfO7qLZ5nE7XJRdWfxhfHDPsSj
         MbCg==
X-Gm-Message-State: APf1xPBknq0yPrshlfBYXJfHtXMls25/QATCZa6CmfE0Y8/+8n3pq24r
        UQjK3kkhkpo2CGfbfAjFcA9BVyj/UV83mb8JsyCO8w==
X-Google-Smtp-Source: AG47ELs0vKXv0dQedVprR3YDm+1yRSuBGkqyHr3xaNtUma0Q/+NVXOCdnmp6vV+aN1kVrSLywY56HAWoxeZL+fetIKE=
X-Received: by 10.129.92.85 with SMTP id q82mr6354001ywb.138.1520105232623;
 Sat, 03 Mar 2018 11:27:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:b219:0:0:0:0:0 with HTTP; Sat, 3 Mar 2018 11:27:11 -0800 (PST)
In-Reply-To: <CAHp75Veu=0w2sWpgn0mNFa0G3Gwp2SpHv55vPgLiWjrCAzaiGw@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
 <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
 <CAGS+omB76qbiuYjs7Rakff2JB7263_m5TRYDgvKM+wdBpaedNA@mail.gmail.com> <CAHp75Veu=0w2sWpgn0mNFa0G3Gwp2SpHv55vPgLiWjrCAzaiGw@mail.gmail.com>
From:   Aaron Durbin <adurbin@chromium.org>
Date:   Sat, 3 Mar 2018 12:27:11 -0700
X-Google-Sender-Auth: ByVlha7TELgY4_v8mTbBE9m4UCk
Message-ID: <CAE2855sBoLaXjFwSKMqH7y9+6sO87-mrRM6Ojm+Xam4vwE3gjQ@mail.gmail.com>
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

On Sat, Mar 3, 2018 at 8:56 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Mar 2, 2018 at 8:35 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>> On Thu, Mar 1, 2018 at 1:02 PM Andy Shevchenko <andy.shevchenko@gmail.com>
>> wrote:
>>> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>> > On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <
>> andy.shevchenko@gmail.com>
>>> > wrote:
>
>> the UART bitclock
>> is
>>> > always "BASE_BAUD * 16" (1843200).  While this may be true for many
>> UARTs,
>>> > it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48
>> MHz
>>> > clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk"
>> and
>>> > uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
>>> > actually a set up in acpi_apd.c when there is an acpi match for
>> "AMD0020",
>>> > with a rate read from the .fixed_clk_rate param of the corresponding
>>> > apd_device_desc.
>
>> As
>>> > noted above, the information is actually already in the kernel and used
>> by
>>> > 8250_dw - I would happy be to hear recommendations for wiring this data
>>> > into earlycon that doesn't require adding another command line arg.
>
> Brief look at the code shows that ->setup() call back is executed
> after setting initial (which is hardcoded) clock.
>
> What you need is to either create another type of earlycon for your
> device with accompanied ->setup() callback, or patch 8250_early.c.

If I'm understand you correctly, you are suggesting new driver code
that sets the clock accordingly within the port structure such that
the baud rate calculation actually works based on the correct input
clock? Why wouldn't we just extened the generic earlycon driver like
the original patch to support providing the clock? Anything in the
earlycon path that tries to set a baud rate will fail once the
hard-coded input clock assumption doesn't hold true. Why not provide
the ability to correct the assumption for platforms that need it?

>
>>> > I see that support was also added recently to earlycon to let it use
>> ACPI
>>> > SPCR to choose a console and configure its parameters... but AFAICT,
>> this
>>> > path also doesn't allow specifying the uart clock.
>
> It does specify baudrate. It means it's _firmware_ responsibility to
> configure UART device properly.

baudrate != input clock. The issue is that once the driver code
attempts to set a baud rate w/o having the correct input clock then
things break.

>
>>> Fix your firmware then. It should set console to 115200 like (almost)
>>> everyone does.
>>> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.
>>
>> The console is 115200 when it is enabled.  However, the firmware does not
>> always enable it by default.
>
> Another firmware bug.

It's more complex than that. You seem to take the stance that the
firmware should bring every IP block out of reset and/or clock and
power gating. That then subsequently requires the kernel to enable all
those soc drivers that put those devices in power or clock gated state
to reach the maximum power savings. While that's certainly possible,
it just leads to bloated kernels. That is orthogonal to the problem of
setting baud rate w/o knowing the proper input clock frequency,
though.

If we do make the assumption the firmware sets up the uart, but the
kernel earlycon has a different baud rate specified than what firmware
set up then the baud rate calculation would be wrong as well since the
input clock isn't known. As such one cannot use earlycon when: 1.
firmware doesn't set up uart 2. firmware baud rate != earlycon
specified baud rate.  Providing the proper input clock for the device
in question solves both 1 and 2.

>
>> The problem is that the UART IP block has a fixed 48 MHz input clock, but
>> earlycon assumes this clock is always 1843200.
>
>> I looked a bit further, and I think this patch (or something similar) is
>> still required to teach generic earlycon how to handle an explicit
>> port->uartclk (ie, one that is not 1843200).
>> The extended string can then be explicitly set on the kernel command line
>> for this kind of hardware.
>
> No.
>
>> In addition, we can add another patch with a new quirk detector in
>> drivers/acpi/spcr.c:acpi_parse_spcr() to handle this hardware.
>> acpi_parse_spcr() can then use the extended option string to pass in the
>> appropriate UART clock to setup_eralycon().
>
> Definitely no. It's not defined in SPCR spec.
>
>> This would again allow a user to just use the simple command line parameter
>> "earlycon" if the device's firmware has a correctly confiured ACPI SPCR
>> table.
>
> NAK to the patch, see above alternatives.
>
> --
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
