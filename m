Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB3A27DF90
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 15:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752247AbeFAP2J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 11:28:09 -0400
Received: from mail-vk0-f68.google.com ([209.85.213.68]:44532 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbeFAP2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 11:28:07 -0400
Received: by mail-vk0-f68.google.com with SMTP id x66-v6so15743285vka.11;
        Fri, 01 Jun 2018 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=20zPuoZgOEFwYmuiEX9SniMaCM+gKv+glRxJKdJnCIc=;
        b=OgjnAhULarcB9EP2MGaa12R9WR03XZxuxZzpIMnPKxkevwk7nZVPI9u7XyfgMLNJiq
         TnKVlERv6vG+zw3CL6IjWlp/wWFmU+qJtiKbUQfbq2g969221QMiNipp3sd3spvW0rgF
         jSVi8fw3SlKAi0zp2hA4xeIUr3fbVCeHORFbAqQphnDirMnrByfrC2mPpd6RQTbHxdiT
         mnc4fN6MbB9fKTCAR1GL9VHlCCgtDPPCDDowLuyNv6qZCBa2qmgCW/X71DODs4iAK22M
         VRCKoJKazQdo7/cjvj7O0CGDzEHQAs0iRWGHYjlg4wPEdRLpU59ZQ/l3ZihHwI3+APjf
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=20zPuoZgOEFwYmuiEX9SniMaCM+gKv+glRxJKdJnCIc=;
        b=OFPDnSiavhb3UH69yhueXP7kTbu4KlZLjVJjFCOmZMMXkJwedRN09QIxLWm8ZiJCbV
         F7UGjkP1yOsCtu4nmLukNeffvTDfgJlhUi+NbQG8frjEdITMGUyLEnYnVNwuN6S4RyrL
         U9tu+DsCE4R+vhClvb9N/esiPBndCueq7hhziTJV9kxSA/sXoEHXgEeh2tKMsuCZCTBT
         4/QbBen7/OlYN/+bRUJF3CHmDrgUF8Y8lynSPnoy9LAoVm2I6w6uLdTekNuqlbFGRszg
         ji680JNsw09dyHrQUObmCiYicmc0LLtUwBTSFK9Eq0NDF6j9ayTjQ+kBPqLSLa1C4wZk
         ExFA==
X-Gm-Message-State: ALKqPwd41+VbWqTdnJcIwKf20dGTxNVCdfAWLh0BHTUFbfdIhF1gSiGI
        x++72a8XCOZHZixTdKNNfQejJJNq1LDY/o89yPs=
X-Google-Smtp-Source: ADUXVKJ8QglhZa2krHTzWUSE10EhatOrRBtzrOw442dGDzLvqZ9DHSEuxkSkvmRg2wnGHG2wHM27xDNRPMvgE1jw4g4=
X-Received: by 2002:a1f:e686:: with SMTP id d128-v6mr7080939vkh.176.1527866886551;
 Fri, 01 Jun 2018 08:28:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:7a0a:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 08:28:06 -0700 (PDT)
In-Reply-To: <20180601151905.yilldc6vbachfw4k@pathway.suse.cz>
References: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
 <CA+55aFxHHSRnDbbNGq6SwNAwEt0EhX15n_pNqon3MzGYJgMJmA@mail.gmail.com>
 <20180601114738.kdoggkha2yosjgbv@pathway.suse.cz> <20180601151905.yilldc6vbachfw4k@pathway.suse.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jun 2018 17:28:06 +0200
X-Google-Sender-Auth: Xdlh3-YqFEqGlbeDSSaCnKtFotQ
Message-ID: <CAMuHMdX6ACCiEs=EEbQV3=Ah7BZT1RJ1G0kZKeYKi_KzWoKZgQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] lib/vsprintf: Remove atomic-unsafe support for printk
 format %pCr
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Petr,

On Fri, Jun 1, 2018 at 5:19 PM, Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2018-06-01 13:47:38, Petr Mladek wrote:
>> On Fri 2018-06-01 06:00:47, Linus Torvalds wrote:
>> > On Fri, Jun 1, 2018 at 4:29 AM Geert Uytterhoeven
>> > <geert+renesas@glider.be> wrote:
>> > >
>> > > This patch series:
>> > >   - Changes all existing users of "%pCr" to print the result of
>> > >     clk_get_rate() directly, which is safe as they all do this in task
>> > >     context only,
>> > >   - Removes support for the "%pCr" printk format.
>> >
>> > Looks good to me.
>> >
>> > What tree will this go through? The normal printk one? Just checking
>> > that this doesn't end up falling through the cracks because nobody
>> > knows who would take it...
>>
>> I will take it via printk.git. There already is bunch of vsprintf
>> changes for-4.18.
>
> It is in printk.git, branch for-4.18-vsprintf-pcr-removal now.

Thank you.

> Also I have added Cc: stable@vger.kernel.org into the commit messages.

I can confirm all stable version references ("v4.x+") match.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
