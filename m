Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7BA17D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 09:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfEaJ5s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 May 2019 05:57:48 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41520 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfEaJ5s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 May 2019 05:57:48 -0400
Received: by mail-oi1-f193.google.com with SMTP id b21so3314921oic.8
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/dabiI1+zXohN0XPJPWZWWtcKfqB2v/nUShweQXWc0=;
        b=e32JUU3PfkhWWkA3PguBCXaJsg7lPEFltaK4JUSnF6IbCO9/3/VgXrN9kHh3T04HLU
         cc4gQFNRfzpdnn3Zlkl3O/QinrY8vWDnieuJJwrqkt0dvkzgU7PDufYQXYPqEMNesADO
         JVaQC2W7ZHVecGYxyIF1y9IjnOSSWo9uVr8tnjnGR/TrX7YhkC2+GmF2tE5qi7m3/FYn
         BfTdJ9JkODL+hIo8f7g/TB0zWHG/iD4uzthFPjhkMd1kviqjgSmtvoJPj1I2+Rb2A3IN
         KPSBDVByMZKy33HHr8kFjSobFkI5QhXEmahv2OcciHPwIGZXWvZ6+fRFSfkNx/Xuce6j
         T5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/dabiI1+zXohN0XPJPWZWWtcKfqB2v/nUShweQXWc0=;
        b=n5N0s/Fl1PuC+8KU8f3RLNnXWY+YR7HroVzdWTXBa/LkEOOd1TJgWkkvnl3ZneRH0J
         I4jtzyScE0pwuwoKR91r3rn2RzpZTwapvOofceTmCV+L73Xf/dhicCTlMFgRXanpf7RK
         BAMF+6tSPyFPofCcsqqkTBwKIMbk5U7FlR8ogLX7DkOlSD4uAMOnjqqkO5XnIYlbDkWC
         X0TQbxf78ppEhnzeKKAbD4W9I+HcNigNxcrQiWDfeGkDoT2BhKorAdy7iBM3HHQ+e5p4
         dDQH3vshvk3HDV6aIC4bZeNgWFkwPD0hTIBc6iv83n8Whzh3mcZY1XSl4LUJ0CNg1XLA
         WSVg==
X-Gm-Message-State: APjAAAUOTR5oGuHJMIKs9R4qd0dtW5kmVanqDCH07yoLMPdZrPd8j+Ik
        kUdq66EcEtQ1ZN0mySALTcQud93DNCHgbhfhdPxyAg==
X-Google-Smtp-Source: APXvYqxTrzMK8mZublRee/EYe0PadumD22Hhgu5bTyuirvM1rEu/qvQvgb6zLiAISTocJYvBThR/Q2W5owRyw3GKgfY=
X-Received: by 2002:aca:bfc6:: with SMTP id p189mr5781082oif.121.1559296667221;
 Fri, 31 May 2019 02:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190529141500.193390-1-elver@google.com> <20190529141500.193390-3-elver@google.com>
 <EE911EC6-344B-4EB2-90A4-B11E8D96BEDC@zytor.com>
In-Reply-To: <EE911EC6-344B-4EB2-90A4-B11E8D96BEDC@zytor.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 31 May 2019 11:57:36 +0200
Message-ID: <CANpmjNOsPnVd50cTzUW8UYXPGqpSnRLcjj=JbZraTYVq1n18Fw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: Move CPU feature test out of uaccess region
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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

On Wed, 29 May 2019 at 16:29, <hpa@zytor.com> wrote:
>
> On May 29, 2019 7:15:00 AM PDT, Marco Elver <elver@google.com> wrote:
> >This patch is a pre-requisite for enabling KASAN bitops
> >instrumentation:
> >moves boot_cpu_has feature test out of the uaccess region, as
> >boot_cpu_has uses test_bit. With instrumentation, the KASAN check would
> >otherwise be flagged by objtool.
> >
> >This approach is preferred over adding the explicit kasan_check_*
> >functions to the uaccess whitelist of objtool, as the case here appears
> >to be the only one.
> >
> >Signed-off-by: Marco Elver <elver@google.com>
> >---
> >v1:
> >* This patch replaces patch: 'tools/objtool: add kasan_check_* to
> >  uaccess whitelist'
> >---
> > arch/x86/ia32/ia32_signal.c | 9 ++++++++-
> > 1 file changed, 8 insertions(+), 1 deletion(-)
> >
> >diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
> >index 629d1ee05599..12264e3c9c43 100644
> >--- a/arch/x86/ia32/ia32_signal.c
> >+++ b/arch/x86/ia32/ia32_signal.c
> >@@ -333,6 +333,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal
> >*ksig,
> >       void __user *restorer;
> >       int err = 0;
> >       void __user *fpstate = NULL;
> >+      bool has_xsave;
> >
> >       /* __copy_to_user optimizes that into a single 8 byte store */
> >       static const struct {
> >@@ -352,13 +353,19 @@ int ia32_setup_rt_frame(int sig, struct ksignal
> >*ksig,
> >       if (!access_ok(frame, sizeof(*frame)))
> >               return -EFAULT;
> >
> >+      /*
> >+       * Move non-uaccess accesses out of uaccess region if not strictly
> >+       * required; this also helps avoid objtool flagging these accesses
> >with
> >+       * instrumentation enabled.
> >+       */
> >+      has_xsave = boot_cpu_has(X86_FEATURE_XSAVE);
> >       put_user_try {
> >               put_user_ex(sig, &frame->sig);
> >               put_user_ex(ptr_to_compat(&frame->info), &frame->pinfo);
> >               put_user_ex(ptr_to_compat(&frame->uc), &frame->puc);
> >
> >               /* Create the ucontext.  */
> >-              if (boot_cpu_has(X86_FEATURE_XSAVE))
> >+              if (has_xsave)
> >                       put_user_ex(UC_FP_XSTATE, &frame->uc.uc_flags);
> >               else
> >                       put_user_ex(0, &frame->uc.uc_flags);
>
> This was meant to use static_cpu_has(). Why did that get dropped?

I couldn't find any mailing list thread referring to why this doesn't
use static_cpu_has, do you have any background?

static_cpu_has also solves the UACCESS warning.

If you confirm it is safe to change to static_cpu_has(), I will change
this patch. Note that I should then also change
arch/x86/kernel/signal.c to mirror the change for 32bit  (although
KASAN is not supported for 32bit x86).

Thanks,
-- Marco
