Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 673577D043
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 11:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751454AbeFALBB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 07:01:01 -0400
Received: from mail-io0-f193.google.com ([209.85.223.193]:35163 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbeFALA7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 07:00:59 -0400
Received: by mail-io0-f193.google.com with SMTP id u4-v6so5481268iof.2;
        Fri, 01 Jun 2018 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdHBR+n5d8gALnIE8+o7cxXHIGzrOa5hMAb3bKD4nPk=;
        b=EVNik65U4ka4qkm96ykqY9pMkfBL+fbelDcKBVV9CbMZ1XVxj6mxJ00AwpQZIFX7vg
         Y7aw200pckbp9KorzuwMjV/5q7XJCITEDwZRK9ouDQxd3lMYkiJFrwkpyTxBOTJGcqWc
         n7fyoeN87DFdy4Ga8FsHNukMKJQ3B3P6Qh/po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdHBR+n5d8gALnIE8+o7cxXHIGzrOa5hMAb3bKD4nPk=;
        b=D78Dr87/qBe/VhWY7brp0uYWSikH6SjD44fM146TYIwVp/04Rt1bknXS4V13RxuDhd
         wF2cxrn1BuBUk9/LVmw2cb2s+SqjoKa8/yjvsHibPBoZ31RFLYJPh/vBaY8Naq8tbjPt
         1DwQr2DPT8wRgNcvNVE8JgWYNxc7JRt1E1G6hFYmp4OTaMS/EoHgcJ3l6C8SVASlmLLa
         fkEPZcAMO8FQ8u6WXcCsK3PJpVIocUzkb7s6VREiRQMyKwP7e97rW4II9D4EXJdKu852
         x5LHPG3M6EIoCCEoHFHuEJDk6IAVpXOuBqCAfEwVmGfdS02w0j34HV+Pyu9t06zhe+rh
         zQMw==
X-Gm-Message-State: APt69E0O1B8pWIGPV6qm62FJLUjs/jC5H7YpWQ2DEu7IwrE+eJwbGi+w
        1xKrWfoKkekxWNns5q8G509eAPc7QQznNVNKWMI=
X-Google-Smtp-Source: ADUXVKLSA5KbFa6msp1BjwxdmSd6V0hW/87GwT4imRTeBGhuNiC4CkocFU30l3T0vvWtw84PXvwJt42H10d18SCJnaY=
X-Received: by 2002:a6b:f914:: with SMTP id j20-v6mr10418901iog.238.1527850858635;
 Fri, 01 Jun 2018 04:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Jun 2018 06:00:47 -0500
Message-ID: <CA+55aFxHHSRnDbbNGq6SwNAwEt0EhX15n_pNqon3MzGYJgMJmA@mail.gmail.com>
Subject: Re: [PATCH 0/4] lib/vsprintf: Remove atomic-unsafe support for printk
 format %pCr
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     baijiaju1990@gmail.com, Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-clk@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 1, 2018 at 4:29 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> This patch series:
>   - Changes all existing users of "%pCr" to print the result of
>     clk_get_rate() directly, which is safe as they all do this in task
>     context only,
>   - Removes support for the "%pCr" printk format.

Looks good to me.

What tree will this go through? The normal printk one? Just checking
that this doesn't end up falling through the cracks because nobody
knows who would take it...

               Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
