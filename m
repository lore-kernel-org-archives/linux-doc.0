Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C2B57D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Jun 2018 16:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934579AbeFLQeg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Jun 2018 12:34:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:53134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933751AbeFLQef (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jun 2018 12:34:35 -0400
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E2A3208B5
        for <linux-doc@vger.kernel.org>; Tue, 12 Jun 2018 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528821275;
        bh=EzzfG0a8cu2r/pCtb2ro4nWK49y1X5ywdX3P6HHd85Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EXURu2tjqcluA73MwGSzhl3UGrN0Qh3K+9N9V3OMxPO0Jo7gEI5iYWIfkaHt6CLNW
         /R+gP9okergUCM3dxXCvqX2E0XR5nMQGitjNLUvKdnVj5LPpH1InXqLFQ36+5jzfl8
         I6yi63J+T6TlUf2nsQ0Frz2JhfaTRyWgju0J1RaI=
Received: by mail-wm0-f42.google.com with SMTP id r125-v6so171493wmg.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Jun 2018 09:34:34 -0700 (PDT)
X-Gm-Message-State: APt69E3C6ZyqHTnbZAIfFW7ZcjEyfjYtVnsVxMJBdyQvmv0/svJExOjj
        w8JBoQzXkztM3+Ua2fZp25flB5GIIS23P2mu2149tw==
X-Google-Smtp-Source: ADUXVKL98ubFXu0LpnRR7ZjC7wwdY0MyzBWVwTr3dYL+lGHZUzp2U6DqUD8BN9BI1wRrQRbARyKYZQq+Ob306zb8Zjg=
X-Received: by 2002:a1c:f902:: with SMTP id x2-v6mr709578wmh.116.1528821273566;
 Tue, 12 Jun 2018 09:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-7-yu-cheng.yu@intel.com>
 <CALCETrU6axo158CiSCRRkC4GC5hib9hypC98t7LLjA3gDaacsw@mail.gmail.com>
 <1528403417.5265.35.camel@2b52.sc.intel.com> <CALCETrXz3WWgZwUXJsDTWvmqKUArQFuMH1xJdSLVKFpTysNWxg@mail.gmail.com>
 <CAMe9rOr49V8rqRa_KVsw61PWd+crkQvPDgPKtvowazjmsfgWWQ@mail.gmail.com>
 <alpine.DEB.2.21.1806121155450.2157@nanos.tec.linutronix.de>
 <CAMe9rOoCiXQ4iVD3j_AHGrvEXtoaVVZVs7H7fCuqNEuuR5j+2Q@mail.gmail.com>
 <CALCETrXO8R+RQPhJFk4oiA4PF77OgSS2Yro_POXQj1zvdLo61A@mail.gmail.com> <CAMe9rOpLxPussn7gKvn0GgbOB4f5W+DKOGipe_8NMam+Afd+RA@mail.gmail.com>
In-Reply-To: <CAMe9rOpLxPussn7gKvn0GgbOB4f5W+DKOGipe_8NMam+Afd+RA@mail.gmail.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 12 Jun 2018 09:34:21 -0700
X-Gmail-Original-Message-ID: <CALCETrWmGRkQvsUgRaj+j0CP4beKys+TT5aDR5+18nuphwr+Cw@mail.gmail.com>
Message-ID: <CALCETrWmGRkQvsUgRaj+j0CP4beKys+TT5aDR5+18nuphwr+Cw@mail.gmail.com>
Subject: Re: [PATCH 06/10] x86/cet: Add arch_prctl functions for shadow stack
To:     "H. J. Lu" <hjl.tools@gmail.com>
Cc:     Andrew Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 12, 2018 at 9:05 AM H.J. Lu <hjl.tools@gmail.com> wrote:
>
> On Tue, Jun 12, 2018 at 9:01 AM, Andy Lutomirski <luto@kernel.org> wrote:
> > On Tue, Jun 12, 2018 at 4:43 AM H.J. Lu <hjl.tools@gmail.com> wrote:
> >>
> >> On Tue, Jun 12, 2018 at 3:03 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> >> > On Thu, 7 Jun 2018, H.J. Lu wrote:
> >> >> On Thu, Jun 7, 2018 at 2:01 PM, Andy Lutomirski <luto@kernel.org> wrote:
> >> >> > Why is the lockout necessary?  If user code enables CET and tries to
> >> >> > run code that doesn't support CET, it will crash.  I don't see why we
> >> >> > need special code in the kernel to prevent a user program from calling
> >> >> > arch_prctl() and crashing itself.  There are already plenty of ways to
> >> >> > do that :)
> >> >>
> >> >> On CET enabled machine, not all programs nor shared libraries are
> >> >> CET enabled.  But since ld.so is CET enabled, all programs start
> >> >> as CET enabled.  ld.so will disable CET if a program or any of its shared
> >> >> libraries aren't CET enabled.  ld.so will lock up CET once it is done CET
> >> >> checking so that CET can't no longer be disabled afterwards.
> >> >
> >> > That works for stuff which loads all libraries at start time, but what
> >> > happens if the program uses dlopen() later on? If CET is force locked and
> >> > the library is not CET enabled, it will fail.
> >>
> >> That is to prevent disabling CET by dlopening a legacy shared library.
> >>
> >> > I don't see the point of trying to support CET by magic. It adds complexity
> >> > and you'll never be able to handle all corner cases correctly. dlopen() is
> >> > not even a corner case.
> >>
> >> That is a price we pay for security.  To enable CET, especially shadow
> >> shack, the program and all of shared libraries it uses should be CET
> >> enabled.  Most of programs can be enabled with CET by compiling them
> >> with -fcf-protection.
> >
> > If you charge too high a price for security, people may turn it off.
> > I think we're going to need a mode where a program says "I want to use
> > the CET, but turn it off if I dlopen an unsupported library".  There
> > are programs that load binary-only plugins.
>
> You can do
>
> # export GLIBC_TUNABLES=glibc.tune.hwcaps=-SHSTK
>
> which turns off shadow stack.
>

Which exactly illustrates my point.  By making your security story too
absolute, you'll force people to turn it off when they don't need to.
If I'm using a fully CET-ified distro and I'm using a CET-aware
program that loads binary plugins, and I may or may not have an old
(binary-only, perhaps) plugin that doesn't support CET, then the
behavior I want is for CET to be on until I dlopen() a program that
doesn't support it.  Unless there's some ABI reason why that can't be
done, but I don't think there is.

I'm concerned that the entire concept of locking CET is there to solve
a security problem that doesn't actually exist.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
