Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C8B307D910
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 09:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfE2JqX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 05:46:23 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43087 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfE2JqX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 05:46:23 -0400
Received: by mail-ot1-f65.google.com with SMTP id i8so1356693oth.10
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAjjxbCt4+5cgrjM01YSZfWgmJp/G0TutPxW6NVwEDU=;
        b=WQaepMq9EUAZlBGja8x+6V2uZFtIQk3PNlb6V0omGbOscHfRltBYF1H4Sz4MgglHTr
         H1HdGO5gNzCww1LCKLX4yPTpXByz8a35WWSD7LpTu2YiHF0MHykRR2b+zDM7yITrzjqm
         gRcrGXb7qp9VaKtASl++u8hHIu4bZa61zyGrpEYuwvmtUEOb6rFMTYBid7k+DfkGRQ/m
         8+QYU3zYSg8TNsBgk67wuDSftmNvLVzhA1qRv/B113ggurbfWKEeJigFqKqSBiJXGkMk
         HzCxVyQYFPqPWBj01lKkBb5SH89GoRLV8PCkmiEv7qEuHSidudmbvhbk3lbyySBFo5KJ
         pU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAjjxbCt4+5cgrjM01YSZfWgmJp/G0TutPxW6NVwEDU=;
        b=taH521NvpkapkgPWl4pnnIvXETMv0RBq30R/SeJQA8P/7QHheDYVS+DiEvfp091Q0y
         56ZwlNxFKb4t7xRcyjGhlgg4RQJlC+Kn+KMVF0Cq7D/oxBWKnFiMcawhDLzUmCtcEwy1
         xsNq28SyhNQnh4YFzkGThOfJr1DOISuWJdU/sHEBK77S/I3HCY+Q5c0GLRsccfIaGFRM
         iwK2jjvknBsBOVAf52BIzAIybM07/opr5163Tqc8HwGvY8JLPYNwm4TRe3pQaOKo/vST
         6AZUg9NjSS1up0skKKOqtieEji7PHGgTiQ8IeG4AS1iVEHNPxfSCtehAipSTUd9oZc8E
         eLhQ==
X-Gm-Message-State: APjAAAXCdXWU/GmYbyg8EnAS0k7HDjkBv0Ww9WcOIFCqN0gp0hn3G6+2
        DGvFdk1t2ClC883eICkf0wK24izWXHvdBnzXXQ0JQA==
X-Google-Smtp-Source: APXvYqyLP4MZKeZUKtaWWXhxl83UK6QddmJ7w7xbwzhKkP69jfLbidndYG/yefEQZQ6LO2DO7d5bpShx7K/ubAx01C4=
X-Received: by 2002:a9d:62cd:: with SMTP id z13mr2621053otk.251.1559123182136;
 Wed, 29 May 2019 02:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190528163258.260144-1-elver@google.com> <20190528163258.260144-2-elver@google.com>
 <20190528171942.GV2623@hirez.programming.kicks-ass.net> <CACT4Y+ZK5i0r0GSZUOBGGOE0bzumNor1d89W8fvphF6EDqKqHg@mail.gmail.com>
In-Reply-To: <CACT4Y+ZK5i0r0GSZUOBGGOE0bzumNor1d89W8fvphF6EDqKqHg@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Wed, 29 May 2019 11:46:10 +0200
Message-ID: <CANpmjNP7nNO36p03_1fksx1O2-MNevHzF7revUwQ3b7+RR0y+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/objtool: add kasan_check_* to uaccess whitelist
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 29 May 2019 at 10:55, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, May 28, 2019 at 7:19 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, May 28, 2019 at 06:32:57PM +0200, Marco Elver wrote:
> > > This is a pre-requisite for enabling bitops instrumentation. Some bitops
> > > may safely be used with instrumentation in uaccess regions.
> > >
> > > For example, on x86, `test_bit` is used to test a CPU-feature in a
> > > uaccess region:   arch/x86/ia32/ia32_signal.c:361
> >
> > That one can easily be moved out of the uaccess region. Any else?
>
> Marco, try to update config with "make allyesconfig" and then build
> the kernel without this change.
>

Done. The only instance of the uaccess warning is still in
arch/x86/ia32/ia32_signal.c.

Change the patch to move this access instead? Let me know what you prefer.

Thanks,
-- Marco
