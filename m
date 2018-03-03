Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5B977E244
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 15:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752127AbeCCPip (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 10:38:45 -0500
Received: from mail-qt0-f181.google.com ([209.85.216.181]:41383 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbeCCPio (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Mar 2018 10:38:44 -0500
Received: by mail-qt0-f181.google.com with SMTP id j4so15513120qth.8;
        Sat, 03 Mar 2018 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=OhqI+ncdWMh3XI5dM3E+YX02o36cRbHV5wuOA7QlTmc=;
        b=GJy28f6Y/e0dYlEUpX75zEVZjXmwh4ROOTe+Q6E9BlUMVRWV6h1WIUihBz8an/cVA7
         jCIZ8Esq+C6xecl05r7f5SAb6h1ZCpDLk6Cvy3xJsqMHTrAu82kz7v/En3nMHAzmMRVj
         XqJEGqp53FXq7l4SAtsVQGpd6+W8on5+myVoRK6m1gol93EIWInJgP8o1XTNJNYq+fUO
         IW4cAtj33zPVkzuWwepN8/xscag78I8fOcOn6gsF43ZqhgeLzTrOTnfElu8au7vL6JGV
         hyROkJ4H8Y8un+eErph2ECBTjdsCLWtCNJMD84TNency+Cq9uQSL+pbGgqYBDhgGNOlL
         UepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=OhqI+ncdWMh3XI5dM3E+YX02o36cRbHV5wuOA7QlTmc=;
        b=UwnSJ8mjsf/BdW4P4D/mvL5Zirvh8b+QdhLHrfxZ3I69dJkRtZDQz8PKR+CMC3u97S
         quqIxBvE3lzHsdFzDVqdVNfjfTiob2dxRaknfWJ4W0Cy5M0F6fduI6q4rrDfUbIyHu7t
         Ohf6Gk0gplGjt1kLioqu9YiXNSB8SjWmuIQdW2x3xfL2pahkUtBjiAjHPEq67ZcnwkxS
         CTkVHYoQO0RR3JLOttMXqJXiV+bEFfR4CHAE+YxFSmFhCPpUXR7++6SAzidUD6yCo0Z2
         ZgStrfvUfDKnab8Ejj6V4HVGwErbcQ112qGbZRMId4nQwDt+UNnGeeuJS6tBbfcpTlt6
         AGqQ==
X-Gm-Message-State: AElRT7GLYtGpDk17MBaJkDcqjF+UEowhAOt65Nn5AuiFjaV1EC/zc/Dk
        gNr0gZgZcpx459QWf8KLcoSjLV7FQB2tDr2YkOk=
X-Google-Smtp-Source: AG47ELtMfAb6Zj/H+nmVkqnMIo/jzB7hOQ09hwVF4N+RQVcva0CXx500K0BccUmkEwak+mzcVDtUq+NjVUDyNQyqohY=
X-Received: by 10.200.39.217 with SMTP id x25mr13630380qtx.266.1520091523613;
 Sat, 03 Mar 2018 07:38:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.195.80 with HTTP; Sat, 3 Mar 2018 07:38:43 -0800 (PST)
In-Reply-To: <CAE2855vbQyMwu8pmH-Sq1kA+=h5TJPWddTWPQoVdEqOn6sAyBw@mail.gmail.com>
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
 <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
 <CAHp75VfL82ujwBa1h0B8nEgBtFcBJPmS9ir7H5YWByDgxFGskA@mail.gmail.com> <CAE2855vbQyMwu8pmH-Sq1kA+=h5TJPWddTWPQoVdEqOn6sAyBw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 3 Mar 2018 17:38:43 +0200
Message-ID: <CAHp75Vcnuc48xb167hu5nz3iv9uSp2jRw+M-w=yBihex6RTXYQ@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Aaron Durbin <adurbin@chromium.org>
Cc:     Daniel Kurtz <djkurtz@chromium.org>,
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

On Thu, Mar 1, 2018 at 11:24 PM, Aaron Durbin <adurbin@chromium.org> wrote:
> On Thu, Mar 1, 2018 at 1:02 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Mar 1, 2018 at 9:22 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>> On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <andy.shevchenko@gmail.com>
>>> wrote:
>>
>>> "earlycon simply does not utilize the information".
>>>
>>> earlycon parses iotype, mapbase and baud (from options).  However, it is
>>> hard-coded to assume that the clock used to generate the UART bitclock is
>>> always "BASE_BAUD * 16" (1843200).  While this may be true for many UARTs,
>>> it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48 MHz
>>> clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk" and
>>> uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
>>> actually a set up in acpi_apd.c when there is an acpi match for "AMD0020",
>>> with a rate read from the .fixed_clk_rate param of the corresponding
>>> apd_device_desc.
>>>
>>> This patch attempts to add a way to inform earlycon about this clock.  As
>>> noted above, the information is actually already in the kernel and used by
>>> 8250_dw - I would happy be to hear recommendations for wiring this data
>>> into earlycon that doesn't require adding another command line arg.
>>
>> And it should not require that for sure!
>
> But it does require that. There's an input clock to the uart ip block.
> That is a design constraint by the hardware and is required to make
> baud calculation work.

I mean it should not be user's headache to provide this information to
the system.

> It's not a firmware problem.

If it's ACPI, then it's definitely firmware issue, since SPCR provides
a baudrate.

> Its the driver's problem in that it
> assumes an input clock to the uart block that does not reflect
> reality.

So, driver can't get this info from device tree or what?

>> Okay, configures a necessary IPs to feed UART with expected 1.8432M clock.
>
> That's only possible if there is a clock divider on the front end of
> the uart block. For this hardware that's not the case. I actually did
> this very thing on intel chromebook devices, but it was only possible
> because there was a hardware divider that could be tuned to reach the
> assumed clock that the code currently assumes.

OK.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
