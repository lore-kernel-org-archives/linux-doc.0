Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39FEC7D09D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 11:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750795AbeFALEG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 07:04:06 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:46873 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbeFALEF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 07:04:05 -0400
Received: by mail-qk0-f196.google.com with SMTP id k86-v6so19515807qkh.13;
        Fri, 01 Jun 2018 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Mzvm3rQamaIwlibG1POCVSrrJwzlFt9su+RSQOus9SQ=;
        b=nM18F3wiW3Yj8YlQMBVGYcfMHXkXWa1JnntQtcYHJXV44MbH36V/Kc2Ajg/Y6m6/xk
         k32MRPjteVGjBeF6kPseTp7iirHqQYxr567OHTup15RIb0/F+wbhXauu4NtqYklG4BB7
         QwqCQIWDfZeQ4HoGjpBNJE/DCbMIC8vkYx7oYwRRWvaxARhq1YaeL0DxzTTQXynSWTWa
         u9O4Ox2dI5lD4txrlVutqLrj0k/CGhU/2SzrAN97DHSwUzDfVeJIqFShcrvywNU/eoyt
         7Ts8YjPBukOnyhw3WCbKdg4aCp1CRz4MG1KLcGQZjmIThEx3Gi5sNG4L/lWLqE1rbHA0
         3MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Mzvm3rQamaIwlibG1POCVSrrJwzlFt9su+RSQOus9SQ=;
        b=ZVPrk+vstiNRi2R3NLbCjqByZPmyUI8nLFuxPe2Pe6/qjZI751ym32J0jHNxe+2jEC
         0ToE19ssXfujotYFs4du6l/3aiszs5ddr/sN/gV7+vv58MnODfkN6cc7hEsjjzo+QmB0
         y56e1E6wiQfGKfzQDhFZAKqeVgLFw1spndWqrEAA3DoKSar2SD5kZ1V/sKnxBf0k/N9m
         FTpNEOPJ0FJIVt5aowYySVRAWPyOSXn6pLA3qBmNNeoE1bEWh8soIrzwmaXE/a3Xt/U9
         a+bd99y2rNRh15s4xD3DXM2rLons0tE4eA8Avy3OmCZTfkXHzavhLdFY6njL2UZZHrvU
         YCHw==
X-Gm-Message-State: APt69E0eACWTYLs/Dk/cAcw4xGI+OC2woCbglzs1IwogTKWHe2lScL9a
        2iNt84s6Lyln56dmS0X3jo9PnhQ085oWJNid1eo=
X-Google-Smtp-Source: ADUXVKKUMRCTKlGXvJPonvD2cvGkaGVQoG7VuPj+V0vsxVJ6XEMrmkawtU9NuHEiRAHw0oAJYahX66SKukiIQibgq7g=
X-Received: by 2002:a37:1399:: with SMTP id 25-v6mr9156411qkt.83.1527851044306;
 Fri, 01 Jun 2018 04:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 04:04:03 -0700 (PDT)
In-Reply-To: <CA+55aFxHHSRnDbbNGq6SwNAwEt0EhX15n_pNqon3MzGYJgMJmA@mail.gmail.com>
References: <1527845302-12159-1-git-send-email-geert+renesas@glider.be> <CA+55aFxHHSRnDbbNGq6SwNAwEt0EhX15n_pNqon3MzGYJgMJmA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jun 2018 14:04:03 +0300
Message-ID: <CAHp75VeCmeBkUfnmx2F-czHCVVDm32WiGzvih8xozPEdv8P_Hw@mail.gmail.com>
Subject: Re: [PATCH 0/4] lib/vsprintf: Remove atomic-unsafe support for printk
 format %pCr
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, Jun 1, 2018 at 2:00 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Jun 1, 2018 at 4:29 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>>
>> This patch series:
>>   - Changes all existing users of "%pCr" to print the result of
>>     clk_get_rate() directly, which is safe as they all do this in task
>>     context only,
>>   - Removes support for the "%pCr" printk format.
>
> Looks good to me.
>
> What tree will this go through? The normal printk one? Just checking
> that this doesn't end up falling through the cracks because nobody
> knows who would take it...

We discussed few month before with Petr that he would take care of the
patches against vsprintf.c.
I think this is the case here.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
