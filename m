Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7117C7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 19:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388191AbeKGExP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 23:53:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50870 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388065AbeKGExP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 23:53:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id 124-v6so7123472wmw.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 11:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ff/unWpMYqcJyC/XCKzSyImdSvdxesphNOgvcWfV+bk=;
        b=l6kTCtOPNRfKeJ7KL2f13bJCfI1UYCOAf5I1KstoDRVJ1mL+sIEZLE/B57oYb9iB/J
         4fOLTRTsUpwioiO7XV72khVAZPAUHhAot+2kTyUpyrWKqRqz9ZjlSGITsAU+kl9I33zS
         Hymr2VpU39WWCBVWN5oiMR0uKqlwSUJGZ1Oy9U1XWsDVrF5UMGdYMbYb0TcV6AYxXsIS
         Hr5khBayLxxF7IIISHRg2/GDfek46yE+BZoI8yk5seVkrUFRSYQiVkRVcGOCXz3TFbU/
         Wu8H4yGxvlggD4dK7byoQ4GSztdIUsdCloMCIus7wjP/ThMnVzci3sx6auy1YLnNlqLh
         QGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ff/unWpMYqcJyC/XCKzSyImdSvdxesphNOgvcWfV+bk=;
        b=CvhoXEe7jiBikN81tyMGVrBfg7DCyYNbGtQirUD2+hKNIcs3ez4qT6UenJiALTYgSc
         Xd+SGkizEcJqnp7FWAf3waxTtxtaApg2OphS6JQ4w6i4qONiiO7YUuM8eWpYo6w6cPCa
         LGubb6klToD9yldcEbccXL7LHdF3oxRwHGrUGgL6JeEfzKO8EJ9/9vyf4LnFAFiuyAk2
         KVNa/CbMSP0L69cNVDFAxsNAVoqtIaCfDZu0Fsp4P0Gu9mM/mUfvpnoNv4RU9I98jVdY
         I+e5DxkxeuyujJNLPZ6cBeLHbB7VqLBFCN3KQwzl6zhDwQij3F8qyRLIjjesatWZccYv
         W5lQ==
X-Gm-Message-State: AGRZ1gI70qDoSsFipAIX58SO+PCqKL0m9eor/gaoW1uGtYN/Q0i0uNxq
        Fezeg2diwo5XsWGHApu9lFnFfmbcdniwTUJYuYC7oQ==
X-Google-Smtp-Source: AJdET5eH1LOXpnXBAwkcnppgBnvZNtenDWR31FfuLNSHVj3Lls82Pgo8tZPo7vX3RDUFbnA6z2SLAcSm8NqqBDs7r3o=
X-Received: by 2002:a1c:2b45:: with SMTP id r66-v6mr2951052wmr.128.1541530547984;
 Tue, 06 Nov 2018 10:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-22-yu-cheng.yu@intel.com>
 <ee5a93f7-ed42-dcc5-0e55-e73ac2637e84@intel.com>
In-Reply-To: <ee5a93f7-ed42-dcc5-0e55-e73ac2637e84@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Tue, 6 Nov 2018 10:55:36 -0800
Message-ID: <CALCETrVfQ8oumNUx6jCFDm0JOD+7qPjaeYvC6pGyodMBcf0VRw@mail.gmail.com>
Subject: Re: [PATCH v5 21/27] x86/cet/shstk: Introduce WRUSS instruction
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 6, 2018 at 10:43 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 10/11/18 8:15 AM, Yu-cheng Yu wrote:
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -1305,6 +1305,15 @@ __do_page_fault(struct pt_regs *regs, unsigned long error_code,
> >               error_code |= X86_PF_USER;
> >               flags |= FAULT_FLAG_USER;
> >       } else {
> > +             /*
> > +              * WRUSS is a kernel instruction and but writes
> > +              * to user shadow stack.  When a fault occurs,
> > +              * both X86_PF_USER and X86_PF_SHSTK are set.
> > +              * Clear X86_PF_USER here.
> > +              */
> > +             if ((error_code & (X86_PF_USER | X86_PF_SHSTK)) ==
> > +                 (X86_PF_USER | X86_PF_SHSTK))
> > +                     error_code &= ~X86_PF_USER;
> This hunk of code basically points out that the architecture of WRUSS is
> broken for Linux.  The setting of X86_PF_USER for a ring-0 instruction
> really is a mis-feature of the architecture for us and we *undo* it in
> software which is unfortunate.  Wish I would have caught this earlier.
>
> Andy, note that this is another case where hw_error_code and
> sw_error_code will diverge, unfortunately.
>
> Anyway, this is going to necessitate some comment updates in the page
> fault code.  Yu-cheng, you are going to collide with some recent changes
> I made to the page fault code.  Please be careful with the context when
> you do the merge and make sure that all the new comments stay correct.

I'm going to send a patch set in the next day or two that cleans it up
further and is probably good preparation for WRUSS.
