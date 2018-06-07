Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 467E97D08C
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 15:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934317AbeFGPrn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 11:47:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933959AbeFGPrl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 11:47:41 -0400
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com [209.85.214.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7CE52088F
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528386461;
        bh=mDTXmyladVBd3eh/mjrYcjmTj9XAgNFR2n7J1EwIYXw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t4b22XPhi1V8EcA81pcTXxuOrm3Dp/1GNdaGWLiZCnbLwCbzNu5aoN1wEFh8lASMj
         NscDMbnHFJCYLGG5LY5YGGhh2b5CzjB48YjIigLUttiwAkcImaTKsEVDf/Y6+A0K2U
         f+b6RUuXSz9JAgJpoxWdjskNN+6i/NNHf2l2l574=
Received: by mail-it0-f46.google.com with SMTP id a3-v6so13260269itd.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 08:47:40 -0700 (PDT)
X-Gm-Message-State: APt69E1HBm52dCj52+w5x5AdtXZfpacIkHAZ092RcAkyObndpPXu3bN9
        5gfilSTu+20xprV7CeqfgJlOOfJMYrEdRNTZrC1G0A==
X-Google-Smtp-Source: ADUXVKLQn7MAttUV/AWjvOdW64m/ElOISsEQbeEIlXfdTTn5GiAqrfNx++kIR2/1Hr6to1wRwcFfoUHLlgdMZr5e6hM=
X-Received: by 2002:a24:d050:: with SMTP id m77-v6mr2392521itg.147.1528386460335;
 Thu, 07 Jun 2018 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143705.3531-1-yu-cheng.yu@intel.com> <20180607143705.3531-3-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143705.3531-3-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 08:47:28 -0700
X-Gmail-Original-Message-ID: <CALCETrWwGCZ+Fbk+O8T6S48teHj60bQQiHQ49=SsKUOpm8VLBA@mail.gmail.com>
Message-ID: <CALCETrWwGCZ+Fbk+O8T6S48teHj60bQQiHQ49=SsKUOpm8VLBA@mail.gmail.com>
Subject: Re: [PATCH 2/9] x86/cet: Add Kconfig option for user-mode shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
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

On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> Introduce Kconfig option X86_INTEL_SHADOW_STACK_USER.
>
> An application has shadow stack protection when all the following are
> true:
>
>   (1) The kernel has X86_INTEL_SHADOW_STACK_USER enabled,
>   (2) The running processor supports the shadow stack,
>   (3) The application is built with shadow stack enabled tools & libs
>       and, and at runtime, all dependent shared libs can support shadow
>       stack.
>
> If this kernel config option is enabled, but (2) or (3) above is not
> true, the application runs without the shadow stack protection.
> Existing legacy applications will continue to work without the shadow
> stack protection.
>
> The user-mode shadow stack protection is only implemented for the
> 64-bit kernel.  Thirty-two bit applications are supported under the
> compatibility mode.
>

The 64-bit only part seems entirely reasonable.  So please make the
code 64-bit only :)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
