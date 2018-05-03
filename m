Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0A447E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 16:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751307AbeECQvR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 12:51:17 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:54655 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbeECQvP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 12:51:15 -0400
Received: by mail-it0-f67.google.com with SMTP id z6-v6so24588iti.4
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=30Oq18U4xmXn2JafT+F7MH9At1tcCj3XpK7q+etq0LI=;
        b=px3vwguMlab1Xi9sXrc1ZHFGGO2Ch19fAJESB36c9oEzoGwEPgJBb23yn89UG97wcy
         NpS9CZ++2S1dtZvrlH163KAHvi9TQFTDHBeisgCmNHQNOG13/eFuzrix+2jGVW2wtDha
         sIiBuZbigkc4kG9J/YTKn2BefZeFFWT52E4NP6Te0MxsXtO7DaBFLFoipsjKZJRoF+Z+
         giODriWU/6We6d6I6sO13+CuPx9mteNxI5UUgTJ0uDajkQL7eKcxoF6DvarPXzWWKAKe
         a46Dfx/n9buItvWXsvSKsmLmXOKd191wUZuByF/BkDH04DcwD/bT+E+PzR2lnvSgDfzk
         vAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=30Oq18U4xmXn2JafT+F7MH9At1tcCj3XpK7q+etq0LI=;
        b=lecj7RxERoviAhVTRqDRRQjZrEJnwFerrExtaUWMZEldc4yG0xhhesG2PnpBurXjCg
         NLI6ZJlS9NztyP60a0MiAD2xij0PfrDLd6YrxOIZIKWegF67pp8UeSx0MulYsgteNAb8
         4GSrFd59JoTWwR5yvbGu+JhAf5qpnVFqPnbCzrC7lUTdw9JoTnbbfXANnYO/+E7R3E9Y
         +5BG5n+/S1PPicn6Xo5cIWKC1Bn7yRXj30iy9kAlb66msBiZZr/p0v0RvBN+bscbZTKl
         4aU+PA6ddoa25kr3GaJATCLb8SNdKJrUcvxHigizxiQP0noWTP/i8amYorF4OjkAVRKg
         qz8Q==
X-Gm-Message-State: ALQs6tBXu8WeTuu+LqeNU1MtyGISlunKYLA6jxa5hcwk84YxzG5VVDlE
        E4JA4bPkzthP7RfFhTLwjIO6B2rSDBrkLubG/7ZQIw==
X-Google-Smtp-Source: AB8JxZqLcZxVtRQWHXZpuqiGBYOp7jW5s++TJ3KwNUP8UbkDJl5+ZjDsRSlXQw0PsRP28xlFHTa+B3RDf6HKOO8ivfI=
X-Received: by 2002:a24:6282:: with SMTP id d124-v6mr25072925itc.134.1525366274710;
 Thu, 03 May 2018 09:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Thu, 3 May 2018 09:51:14 -0700 (PDT)
In-Reply-To: <20180503152432.q742zvdbv6xtvo34@kshutemo-mobl1>
References: <cover.1524077494.git.andreyknvl@google.com> <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
 <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com>
 <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com> <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
 <CAAeHK+zh0LSpq2VFJeHrV7AETnL1b9R+yex3iPMg5SetbEyxwg@mail.gmail.com> <20180503152432.q742zvdbv6xtvo34@kshutemo-mobl1>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 3 May 2018 18:51:14 +0200
Message-ID: <CAAeHK+xzcjVm+E+nHLNcZ1jDOMM3ha2fH+Y0G26RU7aO81BSdw@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 3, 2018 at 5:24 PM, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> On Thu, May 03, 2018 at 04:09:56PM +0200, Andrey Konovalov wrote:
>> On Wed, May 2, 2018 at 7:25 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

>> I wasn't able to find anything that calls follow_page with pointers
>> passed from userspace except for the memory subsystem syscalls, and we
>> deliberately don't add untagging in those.
>
> I guess I missed this part, but could you elaborate on this? Why?
> Not yet or not ever?

Check out the discussion here:
https://www.spinics.net/lists/arm-kernel/msg640936.html

>
> Also I wounder if we can find (with sparse?) all places where we cast out
> __user. This would give a nice list of places where to pay attention.

The way I tested this is I added BUG_ON(top byte tag is set) to
find_vma and find_extend_vma and ran a modified version of syzkaller
that embeds tags into pointers overnight. The only crashes that I saw
were coming from memory subsystem syscalls. I then temporarily added
untagging to suppress those crashes
(https://gist.github.com/xairy/3aa1f57798fa62522c8ac53fad9b74ca), and
didn't see any crashes after that.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
