Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D27647E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 21:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754553AbeCGVY1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 16:24:27 -0500
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45723 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754389AbeCGVYY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 16:24:24 -0500
Received: by mail-qt0-f193.google.com with SMTP id v90so4378093qte.12;
        Wed, 07 Mar 2018 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=18Fkw59ceXzKTxluf0ZdW+yT8LW3uL6DTXlXPys/7W4=;
        b=U+kE/w/OrQVE9lBKxyFtjEjZ0oGtpchJy/Y0GsCGIqm0QEkDEKLy3T/PhM0/P/ooTk
         Q1JZL5HABEvkLZbtrHW3jQcQXF+pBWqRAnax2Kryn2JHwyMETniQ/perdZfyZeJIIM3f
         7vk8jZEtp4r3Kq8hNkzI7MULH/g/VcNTQvovYvK5ryBbkgV8b3LhuVPr21PdHP9PGH/3
         PvSoaav0YySSqioqyKt6uC+vmJXTuh5GE1z+QieXQDZwuGXiQ4jDCuaak2pbYWov2bOh
         bycSFLMrLGKyZf/yIBBLMVGXm5O8pJv5M37rkKuxtxcTiIJ0CTGNcTY1GWfojncw0JH9
         8+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=18Fkw59ceXzKTxluf0ZdW+yT8LW3uL6DTXlXPys/7W4=;
        b=Ouw85w31jZRPmSk5ARaXQZ7+cDy0dcWejpVZddoJnBrs5hQvccoe+J/JnCFBlPaCMi
         q57D3Vlbqt4TGOaIQKVgu5m8xh1uXi0bMM3CPMW5Fir4TQXP1dnQeXF2wPkGmuUFLQ7I
         A2QJADd7KpxATVTRm4Ct2YG3r3H+e2QRUVJ7aJMQDT9RrSbENBXVDymfYhZWPdeoRRAN
         5C3mRqY8G/ekc5IJJKBtdVH6gW2wclCdDlt5E/sKeOrf34veTm01XHoTDMY5FaKmWi4m
         BWvuYqe+JcM+N6FQ8M9bWA3VuIoBzAbG9MyXPia/ae2GfpJYS8HoeCVTibqfD9q44hwZ
         Jbhg==
X-Gm-Message-State: AElRT7FhKFpRJV6gswPHhLduWnDR96QwAa3MCHgx1ID5xIOGjTvsjC63
        /TQsZLtZ5Lu9R8DDYXA3TSxsXt2DOAy7svSI/kw=
X-Google-Smtp-Source: AG47ELvm/Bvaz4B/3NRO5Hca+KBLuoVG7/o91XwX7OBhi0RPHamEQ222wpiKYuGEB/zMnLHxhw8mgAT1RcWSjsCNSKw=
X-Received: by 10.200.47.53 with SMTP id j50mr1414196qta.185.1520457863592;
 Wed, 07 Mar 2018 13:24:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.185.46 with HTTP; Wed, 7 Mar 2018 13:24:23 -0800 (PST)
In-Reply-To: <20180221233825.10024-1-jhogan@kernel.org>
References: <20180221233825.10024-1-jhogan@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Mar 2018 22:24:23 +0100
X-Google-Sender-Auth: DDyO_JiM0Rwoz7PUh-PnsDrAyl4
Message-ID: <CAK8P3a2qV5n57f7=FC0nYZWfeXCVaOaK4R_7Wr74p3ZMyuwJNQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Remove metag architecture
To:     James Hogan <jhogan@kernel.org>
Cc:     "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-gpio@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 22, 2018 at 12:38 AM, James Hogan <jhogan@kernel.org> wrote:
> These patches remove the metag architecture and tightly dependent
> drivers from the kernel. With the 4.16 kernel the ancient gcc 4.2.4
> based metag toolchain we have been using is hitting compiler bugs, so
> now seems a good time to drop it altogether.
>
> Quoting from patch 1:
>
> The earliest Meta architecture port of Linux I have a record of was an
> import of a Meta port of Linux v2.4.1 in February 2004, which was worked
> on significantly over the next few years by Graham Whaley, Will Newton,
> Matt Fleming, myself and others.
>
> Eventually the port was merged into mainline in v3.9 in March 2013, not
> long after Imagination Technologies bought MIPS Technologies and shifted
> its CPU focus over to the MIPS architecture.
>
> As a result, though the port was maintained for a while, kept on life
> support for a while longer, and useful for testing a few specific
> drivers for which I don't have ready access to the equivalent MIPS
> hardware, it is now essentially dead with no users.
>
> It is also stuck using an out-of-tree toolchain based on GCC 4.2.4 which
> is no longer maintained, now struggles to build modern kernels due to
> toolchain bugs, and doesn't itself build with a modern GCC. The latest
> buildroot port is still using an old uClibc snapshot which is no longer
> served, and the latest uClibc doesn't build with GCC 4.2.4.
>
> So lets call it a day and drop the Meta architecture port from the
> kernel. RIP Meta.

I've pulled it into my asm-generic tree now, which is also part of linux-next,
and followed up with patches removing frv, m32r, score, unicore32
and blackfin. I have not removed the device drivers yet, but I'm working
on that.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
