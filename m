Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 14B787E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 19:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1161226AbeCATXH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 14:23:07 -0500
Received: from mail-ua0-f196.google.com ([209.85.217.196]:33392 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161217AbeCATXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 14:23:05 -0500
Received: by mail-ua0-f196.google.com with SMTP id p12so4628275uad.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Mar 2018 11:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YplxC9X3Rzd/Q1FWvQVYIYsgQlspyiMvec/eHUeKlN0=;
        b=dt3m7pl7ZR8eONBBKb8z5E6phJ/iq1+cg0KJLk8sPQAu5z/3xFA3B5B06p/A00xKNj
         lLGGJ5t7O247/9lTLJhLgArqbxkQUrUhwleoY6zNmUYcdGT4qkYM7QEWxEpqtBgPYPv3
         yo/L5EjPbHRSm19ejzZ/dMjoOgT7LMAZYeyzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YplxC9X3Rzd/Q1FWvQVYIYsgQlspyiMvec/eHUeKlN0=;
        b=EVHl58rlr6b7yXfmBohV6h+UK7/axXY2/YfHP3mIQQPVFrbTGXOXzZkZNQpP5nz6cz
         ewX8f/5Y1L7Se4qQj9Ax+DVa/EBmVJ9IM1CGQejxxw1K8U9uZVaYuyYxI8KHX6XXbP8H
         dF6ClEcxta0Kr8icFtRZhiMPiHRRnRpIvtMTyZ8GLzK60BZM0zpd9KkQ3UTKvMqb4tv1
         878hlNsHawn/KEX8rrp9NQs7O3WIWs3YvpSGs4LO4bip3umnnAlxqGKEWO+ZkGEC2iJQ
         XBB3TChm7ZXXAsSZK1MZysjkEbCZLlzTLeUgLpMN+fXv5ZMaBdmaV3DPuGUMDBnZX0pA
         D+9A==
X-Gm-Message-State: APf1xPBCXtvnoUGRRQ+0861uhA2UvfJHqid9gLLw4BbMbDfl7nH6SaMa
        aNEMO+ZOJqQsA2WN/h/dqJg7x2+/+299KsILjwsySA==
X-Google-Smtp-Source: AG47ELvZG3ETTW12VHepikzSxlZr6DzIUhLqu0o0DqLJhJOeEbWR+XO2s2xEnwdEDosavEAbS5Zb7fcJo1+BF2j6l04=
X-Received: by 10.176.83.88 with SMTP id y24mr2006165uay.121.1519932184226;
 Thu, 01 Mar 2018 11:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20180301184335.248378-1-djkurtz@chromium.org> <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
In-Reply-To: <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
From:   Daniel Kurtz <djkurtz@chromium.org>
Date:   Thu, 01 Mar 2018 19:22:52 +0000
Message-ID: <CAGS+omCfVUPb0yq3XOEqO_zQ0_uppkKaGhqtB0OqXmQDK9xH1Q@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     adurbin@chromium.org, Brian Norris <briannorris@chromium.org>,
        corbet@lwn.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jslaby@suse.com, mingo@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, cdall@linaro.org,
        paulmck@linux.vnet.ibm.com, marc.zyngier@arm.com,
        frederic@kernel.org, dwmw@amazon.co.uk, tom.saeger@oracle.com,
        zohar@linux.vnet.ibm.com, alexander.levin@verizon.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 11:47 AM Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Thu, Mar 1, 2018 at 8:43 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:

> Please, hold on with new versions.
> I'm not satisfied (yet?) by the approach.

Copying over your comment on v1:

> It needs to be discussed.

Sure.

> First of all, if you are going to do this you need to add a parse of
> human readable formats (IIRC kernel has helpers), i.e. "48M", "38.4M"
> and so on.

> Next, I was under impression that purpose of earlycon (in difference
> to earlyprintk) is to re-use existing drivers as fully as possible.

> So, what exactly happens in your case? Are your driver lacks of
> properly set clock? Or earlycon does simple not utilizing this
> information?

"earlycon simply does not utilize the information".

earlycon parses iotype, mapbase and baud (from options).  However, it is
hard-coded to assume that the clock used to generate the UART bitclock is
always "BASE_BAUD * 16" (1843200).  While this may be true for many UARTs,
it isn't true for AMD's CZ/ST which has a 8250_dw and uses a fixed 48 MHz
clock.  The main 8250_dw driver uses devm_clk_get to get the "baudclk" and
uses its rate to initialize uartclk.  For AMD CZ/ST, this "baudclk" is
actually a set up in acpi_apd.c when there is an acpi match for "AMD0020",
with a rate read from the .fixed_clk_rate param of the corresponding
apd_device_desc.

This patch attempts to add a way to inform earlycon about this clock.  As
noted above, the information is actually already in the kernel and used by
8250_dw - I would happy be to hear recommendations for wiring this data
into earlycon that doesn't require adding another command line arg.

I see that support was also added recently to earlycon to let it use ACPI
SPCR to choose a console and configure its parameters... but AFAICT, this
path also doesn't allow specifying the uart clock.

-Dan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
