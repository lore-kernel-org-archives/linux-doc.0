Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 655ED7D91B
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Jun 2019 20:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfFFU0s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Jun 2019 16:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbfFFU0r (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Jun 2019 16:26:47 -0400
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC08F2083E
        for <linux-doc@vger.kernel.org>; Thu,  6 Jun 2019 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559852807;
        bh=KPzI+YwSmOs28yM0mu03w5J/5AGDUhBeJx6OEeWoVX4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sQw0Lu9CAjfPFLxj0f4izZgbct9wON3UkoluMWtqqvnVZi7LX6+PqbRKcUNtGFPRC
         VwSx/IwIvxNRl/Eh2ce4stDlwhsMthuxOUrJ/gpf6YOh6guy7TBeQP/aoPkMh3L+/v
         d2/JTlzLlzvCzvUELTMuYV1T3nAUPyJwHIqwc0MM=
Received: by mail-wm1-f54.google.com with SMTP id t5so1219686wmh.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Jun 2019 13:26:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVkE/R6SctdcX/+OayDmS7jVM4FL0bOTfXKLy5e7WDdUQmf3GV7
        8Vc0AwyKyj84D154xv2vcmHP5Sz+3C+gqNBbTy7HVQ==
X-Google-Smtp-Source: APXvYqwZv50PloUZATpBbGT4OO6zXzFDR47DeJkyJO1yLg4R1WCRiHzDw51jl+w40n+V1KyBop2vJW/Rtz8YXJjW/A4=
X-Received: by 2002:a1c:6242:: with SMTP id w63mr1265538wmb.161.1559852805470;
 Thu, 06 Jun 2019 13:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190606200926.4029-1-yu-cheng.yu@intel.com> <20190606200926.4029-10-yu-cheng.yu@intel.com>
In-Reply-To: <20190606200926.4029-10-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 6 Jun 2019 13:26:34 -0700
X-Gmail-Original-Message-ID: <CALCETrVhw4U939E2RorUMorxx8VqLyg2Zm8qEMUSM5pX+cc2FQ@mail.gmail.com>
Message-ID: <CALCETrVhw4U939E2RorUMorxx8VqLyg2Zm8qEMUSM5pX+cc2FQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/14] x86/vdso: Insert endbr32/endbr64 to vDSO
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 6, 2019 at 1:17 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> From: "H.J. Lu" <hjl.tools@gmail.com>
>
> When Intel indirect branch tracking is enabled, functions in vDSO which
> may be called indirectly must have endbr32 or endbr64 as the first
> instruction.  Compiler must support -fcf-protection=branch so that it
> can be used to compile vDSO.

Acked-by: Andy Lutomirski <luto@kernel.org>

>
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

You're still missing your Signed-off-by.
