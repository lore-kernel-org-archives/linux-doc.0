Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1144A7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 16:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753334AbeFGQ2U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 12:28:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:33044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753094AbeFGQ2T (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 12:28:19 -0400
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com [209.85.128.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DEE520896
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528388898;
        bh=38Rz2dZgQXagFKQ3f+bPO04YOpSlZ2JS+BqQIL6xGgE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Cywthi7bEMC8sfl2A1bTc31jpIyxNyFF1TCt2S9q2oQUyjTk2AfjMwB9SxOgncX1y
         t9OD39opUGq3YGL7lzhsfnDHIeI52+r15K5reNXG+/BAKfWPOypR4XlF1MQBlu2bgo
         fj1PXpzQOmJ3SXMKAOdGenj5SgqXFYrzivrBCk0Y=
Received: by mail-wr0-f176.google.com with SMTP id h10-v6so10484766wrq.8
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 09:28:18 -0700 (PDT)
X-Gm-Message-State: APt69E1cd56kAlfRQyVMKX2xVlH1mJgHoY+Xz9lcK3JIiStlPmaIvxpC
        idmxIN8YjtCwDGmUX8giBki9UijRK73YHEvdZtiDLg==
X-Google-Smtp-Source: ADUXVKKmxuaxVyOv0EyBqtymYnlqmOj/ufhYIQBB85Q6WVdDk3RUP6GF9Xvdl7E6prJPG3qBSWDGj/WEIRfIVNQrP/w=
X-Received: by 2002:adf:85ec:: with SMTP id 41-v6mr2313210wru.120.1528388897175;
 Thu, 07 Jun 2018 09:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143705.3531-1-yu-cheng.yu@intel.com> <20180607143705.3531-3-yu-cheng.yu@intel.com>
 <CALCETrWwGCZ+Fbk+O8T6S48teHj60bQQiHQ49=SsKUOpm8VLBA@mail.gmail.com> <1528387137.4636.6.camel@2b52.sc.intel.com>
In-Reply-To: <1528387137.4636.6.camel@2b52.sc.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 09:28:05 -0700
X-Gmail-Original-Message-ID: <CALCETrWEeBbhGgJ2rVMAQGOK3BUuRSCWzuhmpO=WrmwO85Tnaw@mail.gmail.com>
Message-ID: <CALCETrWEeBbhGgJ2rVMAQGOK3BUuRSCWzuhmpO=WrmwO85Tnaw@mail.gmail.com>
Subject: Re: [PATCH 2/9] x86/cet: Add Kconfig option for user-mode shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
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

On Thu, Jun 7, 2018 at 9:02 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> On Thu, 2018-06-07 at 08:47 -0700, Andy Lutomirski wrote:
> > On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > >
> > > Introduce Kconfig option X86_INTEL_SHADOW_STACK_USER.
> > >
> > > An application has shadow stack protection when all the following are
> > > true:
> > >
> > >   (1) The kernel has X86_INTEL_SHADOW_STACK_USER enabled,
> > >   (2) The running processor supports the shadow stack,
> > >   (3) The application is built with shadow stack enabled tools & libs
> > >       and, and at runtime, all dependent shared libs can support shadow
> > >       stack.
> > >
> > > If this kernel config option is enabled, but (2) or (3) above is not
> > > true, the application runs without the shadow stack protection.
> > > Existing legacy applications will continue to work without the shadow
> > > stack protection.
> > >
> > > The user-mode shadow stack protection is only implemented for the
> > > 64-bit kernel.  Thirty-two bit applications are supported under the
> > > compatibility mode.
> > >
> >
> > The 64-bit only part seems entirely reasonable.  So please make the
> > code 64-bit only :)
>
> Yes, I will remove changes in "arch/x86/entry/entry32.S".
> We still want to support x32/ia32 in the 64-bit kernel, right?
>

Yes, I think.  But that's not in entry_32.S


>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
