Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B2B9D7E281
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 19:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752200AbeCCTMY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 14:12:24 -0500
Received: from mail-yb0-f194.google.com ([209.85.213.194]:41342 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbeCCTMX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Mar 2018 14:12:23 -0500
Received: by mail-yb0-f194.google.com with SMTP id b12-v6so4484006ybn.8
        for <linux-doc@vger.kernel.org>; Sat, 03 Mar 2018 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4GmKgIhxV+Sm7y37wyP00s8Hqi10//V4jKDhUrAxOeg=;
        b=T2t3z+BdWIekWEFfW+1Xx5KYSQaZ5Yney9wsuNAG0caWPrvQhoTjwwqD23RyruIN0Y
         1RoZ9Q+XwJ7cWgKuN25BpWG4HhFYrn8abtVpjtIb48LkTtcpScxWfxcJNlM5OkPUp3BZ
         7BvmOpyAvumL11ro5bmZjEe6i7qcS7GNGbxx/e5Imj86OFX9ORogyzTpYoYCnFAS5PHU
         ON3bdtujtypapwY7W3mJXMTOARCkZHK3ufVRVFw99KPsxUFgxuCmwvMrib+MlQ7maAjn
         LZCvFGbd5kAxZVM6T8m1tdjSwzWMzjc5+TX5X0Hg6PzLEIf7K3H1mtXexcWcpYPqIgQ2
         iN8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4GmKgIhxV+Sm7y37wyP00s8Hqi10//V4jKDhUrAxOeg=;
        b=XShZJ/ts1UwFgr7BSjCzerfFYT12/NhQVtjxImyvlq/xi27hZ21jsOvsGEXFvJ1DmN
         iriSsz0b722zRqFPYvOxGK4Af35CfLF/VhmHIBuJa8n4vZtoHeG40jeTuCzyZuUU4Fp2
         3aG+pFKaDsJFipMiCRXtmIb1j0ytRh20rxUfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=4GmKgIhxV+Sm7y37wyP00s8Hqi10//V4jKDhUrAxOeg=;
        b=C/TDZuiMTPV2d1ShUVOYxuJ/wDyeNtRpQLZVEqYYIickM3gt01ivKM/D1k4qKxd/CL
         gHLhpMpI36ZMGk0Uw/51zbG/Ah2eYLShwAY22SyAall1gV1Syr/pfbi+qjNjYeiSA3CY
         hRPiPPab4PDL7DmzXUEAoobTqWCYAU3t28Pv6CjEP4X2r1WiTxNAWhuM30Rbtkekb7Dm
         2z5QADZXDVXPGChF1BVx48G5b97DG980mLfR9Wbo2uRIxFGW0bF8HZOn69uQLwY/GvXw
         Oo6HJUcCoJCBzxybUCNd9gguMA+iu5cWlFRIEbjG5r3HlgxCMMlIH3KqQPW6xnVDXk1e
         pJWA==
X-Gm-Message-State: AElRT7EcOat95baAc4wmoux6n3WzmrezORyOekDmH7Du8m+LzjNmLVEO
        lAoQJgcUQ7iMt34XKCkRI3NLWy371aXR5GvzaG1Oqw==
X-Google-Smtp-Source: AG47ELs4Q6F0zL+d/3JVK4ivpg5S0Pl7XWWM56J5CU6im4nOEm4lUwUUp37W0v9E8T/QLxoFHzLKebPKRIbfLmkrNPw=
X-Received: by 2002:a25:bd42:: with SMTP id p2-v6mr6205077ybm.214.1520104342325;
 Sat, 03 Mar 2018 11:12:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:b219:0:0:0:0:0 with HTTP; Sat, 3 Mar 2018 11:12:21 -0800 (PST)
In-Reply-To: <CAHp75Vcnuc48xb167hu5nz3iv9uSp2jRw+M-w=yBihex6RTXYQ@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
 <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com>
 <CAE2855vbQyMwu8pmH-Sq1kA+=h5TJPWddTWPQoVdEqOn6sAyBw@mail.gmail.com> <CAHp75Vcnuc48xb167hu5nz3iv9uSp2jRw+M-w=yBihex6RTXYQ@mail.gmail.com>
From:   Aaron Durbin <adurbin@chromium.org>
Date:   Sat, 3 Mar 2018 12:12:21 -0700
X-Google-Sender-Auth: _r9b5AfMxxhb9TKp7BHG7gw0QJU
Message-ID: <CAE2855vimGkRscxZ4tOQ90NGECWe8x2Xg=OV0hgh=Ktf41SU=g@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Aaron Durbin <adurbin@chromium.org>,
        Daniel Kurtz <djkurtz@chromium.org>,
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

On Sat, Mar 3, 2018 at 8:38 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Mar 1, 2018 at 11:24 PM, Aaron Durbin <adurbin@chromium.org> wrote:
>> On Thu, Mar 1, 2018 at 1:02 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>>> On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <andy.shevchenko@gmail.com>
>>>> wrote:
>>>
>>>> "earlycon simply does not utilize the information".
>>>>
>>>> earlycon parses iotype, mapbase and baud (from options).  However, it is
>>>> hard-coded to assume that the clock used to generate the UART bitclock is
>>>> always "BASE_BAUD * 16" (1843200).  While this may be true for many UARTs,
>>>> it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48 MHz
>>>> clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk" and
>>>> uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
>>>> actually a set up in acpi_apd.c when there is an acpi match for "AMD0020",
>>>> with a rate read from the .fixed_clk_rate param of the corresponding
>>>> apd_device_desc.
>>>>
>>>> This patch attempts to add a way to inform earlycon about this clock.  As
>>>> noted above, the information is actually already in the kernel and used by
>>>> 8250_dw - I would happy be to hear recommendations for wiring this data
>>>> into earlycon that doesn't require adding another command line arg.
>>>
>>> And it should not require that for sure!
>>
>> But it does require that. There's an input clock to the uart ip block.
>> That is a design constraint by the hardware and is required to make
>> baud calculation work.
>
> I mean it should not be user's headache to provide this information to
> the system.
>
>> It's not a firmware problem.
>
> If it's ACPI, then it's definitely firmware issue, since SPCR provides
> a baudrate.
>

earlycon is another implemetnation of driver binding/settings that is
done before the rest of the kernel driver stack. SPCR provides
baudrate, but that's only one piece to the puzzle. You need to know
the UART input clock which you admit is hard coded in the current
driver. It's not possible to configure the divisor in the UART without
knowing the external clock. That's a real dependency that can't be
worked around. The moment the code attempts to configure the baud it
has to know the input clock -- otherwise the calculation is inherently
wrong. Or are you suggesting to lie about the baud such that the the
math works out even though the values are not real?

>> Its the driver's problem in that it
>> assumes an input clock to the uart block that does not reflect
>> reality.
>
> So, driver can't get this info from device tree or what?

There is no device tree on x86. And ACPI driver binding is not fully
initialized when earlycon is being processed. Yes, this can be solved
by getting up the entire ACPI stack, but then that's not really
'early' in the kernel's initialization sequence.

>
>>> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.
>>
>> That's only possible if there is a clock divider on the front end of
>> the uart block. For this hardware that's not the case. I actually did
>> this very thing on intel chromebook devices, but it was only possible
>> because there was a hardware divider that could be tuned to reach the
>> assumed clock that the code currently assumes.
>
> OK.
>
> --
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
