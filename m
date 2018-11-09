Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A11E57D099
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Nov 2018 00:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbeKIKXs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Nov 2018 05:23:48 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35223 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbeKIKXs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Nov 2018 05:23:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so149166wrv.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 16:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UdhTRWSUVEcWBscAsLhgTjRfmWQlTGz+ikL0XCjUXZA=;
        b=SQgyPuvlFn/v52UaPq733+x1QveHknP5PUo2HaPfIecqcPf+VPCamW3qR4YBLxdR6Z
         ykFO57bwa5kLPlH8rFYOT4Pz+ABEcmzQGmK2ZDjNXSJmMCDIFHEhmnFP7tqvY202S1UK
         AYCfX7DIBXRSytZjK71k6yMBc8r3RqwJwZ12E53Hjq4SCQbQ5WnsAdkF5vBXO9NcrE+t
         ktODzQ4IAIHABS1CJvoEoSeRkWCjalwK4mg84eOWIzdmKzvqDWMLZPvKSRXHBMxkWBm5
         gEtDFyEed9LbjcZZqhPwq1QKVCTfPq3b+1E6ClsdUg3tTiO3keHgbUTMaU9RPIrZgxMY
         sd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UdhTRWSUVEcWBscAsLhgTjRfmWQlTGz+ikL0XCjUXZA=;
        b=URJweKKSwopfv17HhwRic9LagXiPMmzxN4olrmcAkzlRV3zJquDmntqxulf36S5LuY
         a1PY/n2NlS6unrLjGuuS5ngNHCZgDgTs8i9HDTuGxZ7RNagQ23mQv8gq/d+Z+XPcBBVw
         UNPkDzuDzNDsdVtMTd14wlQjVejTzqJrixkE2M6KgrP05mml29OacWBE8GH5V72TEVkE
         bEt5qcgzsdm8pgibs0S++L7IgQ4F40LJu1x8FnE4NabJ/ILb2NlZRF4CddGAXXHCqVAC
         mbOt+CNCiVNCk/D3c05oZ9ESvvCRLHxZoVS+gEDlCiRVCqDIptsRJyR4DUlBjY49ZZ/c
         Mmww==
X-Gm-Message-State: AGRZ1gLhiY5w8OxcgQz2N9qnIqmICkB9kjQ5atb6DZeK8fFWSSHuul9Y
        q3EDrJvPQMkM7hqebvnatmu7S/jFhtTyS/z8KNKqzQ==
X-Google-Smtp-Source: AJdET5cYxU7/HdcJI6HzaCJqKjhQjRlWchMCbOoRJoXvvvobrFzj2a/Ez6JxT+gZ/a5Dq/uus+FdBMYiByviDgLFMmk=
X-Received: by 2002:a5d:4450:: with SMTP id x16-v6mr5986222wrr.308.1541724338245;
 Thu, 08 Nov 2018 16:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-5-yu-cheng.yu@intel.com>
 <CALCETrVAe8R=crVHoD5QmbN-gAW+V-Rwkwe4kQP7V7zQm9TM=Q@mail.gmail.com>
 <4295b8f786c10c469870a6d9725749ce75dcdaa2.camel@intel.com>
 <CALCETrUKzXYzRrWRdi8Z7AdAF0uZW5Gs7J4s=55dszoyzc29rw@mail.gmail.com>
 <043a17ef-dc9f-56d2-5fba-1a58b7b0fd4d@intel.com> <20181108220054.GP3074@bombadil.infradead.org>
 <ead230ab-a904-50d6-c4cf-46d5804f6151@intel.com> <20181109003225.GQ3074@bombadil.infradead.org>
In-Reply-To: <20181109003225.GQ3074@bombadil.infradead.org>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 8 Nov 2018 16:45:26 -0800
Message-ID: <CALCETrWbYwxDtkp7jjf=L7xFubEOP3+DuCQFHdf7bVy0MqqvXQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/27] x86/fpu/xstate: Add XSAVES system states for
 shadow stack
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Dave Hansen <dave.hansen@intel.com>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>, X86 ML <x86@kernel.org>,
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

On Thu, Nov 8, 2018 at 4:32 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Nov 08, 2018 at 03:35:02PM -0800, Dave Hansen wrote:
> > On 11/8/18 2:00 PM, Matthew Wilcox wrote:
> > > struct a {
> > >     char c;
> > >     struct b b;
> > > };
> > >
> > > we want struct b to start at offset 8, but with __packed, it will start
> > > at offset 1.
> >
> > You're talking about how we want the struct laid out in memory if we
> > have control over the layout.  I'm talking about what happens if
> > something *else* tells us the layout, like a hardware specification
> > which is what is in play with the XSAVE instruction dictated layout
> > that's in question here.
> >
> > What I'm concerned about is a structure like this:
> >
> > struct foo {
> >         u32 i1;
> >         u64 i2;
> > };
> >
> > If we leave that to natural alignment, we end up with a 16-byte
> > structure laid out like this:
> >
> >       0-3     i1
> >       3-8     alignment gap
> >       8-15    i2
>
> I know you actually meant:
>
>         0-3     i1
>         4-7     pad
>         8-15    i2
>
> > Which isn't what we want.  We want a 12-byte structure, laid out like this:
> >
> >       0-3     i1
> >       4-11    i2
> >
> > Which we get with:
> >
> > struct foo {
> >         u32 i1;
> >         u64 i2;
> > } __packed;
>
> But we _also_ get pessimised accesses to i1 and i2.  Because gcc can't
> rely on struct foo being aligned to a 4 or even 8 byte boundary (it
> might be embedded in "struct a" from above).
>

In the event we end up with a hardware structure that has
not-really-aligned elements, I suspect we can ask gcc for a new
extension to help.  Or maybe some hack like:

struct foo {
  u32 i1;
  struct {
    u64 i2;
  } __attribute__((packed));
};

would do the trick.
