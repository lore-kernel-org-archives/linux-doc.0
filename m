Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8BD47D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932309AbeFGSsu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:48:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932268AbeFGSsu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 14:48:50 -0400
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com [209.85.128.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54ACE20895
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528397329;
        bh=HfInhCyX/FTxEMsMJGmwxfuf7NZf4eBRhMw3s/6QFxA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PMmipzukHGtQ8CmyBx0yvgnS7RJ9un9zdoQFFcXBmd2DcvroUtNRXmKaLHV5B9k1q
         61fe2IgbZwOYHuTRIpRtY0X2vgGYmrl4qExtGVm9hsMoQrN3wTm0ZN4P2X4+ic1DvJ
         aHwcC3VDnS1i7Z4Ejuj/iRHBgxYpGVD3iSfC0Lpc=
Received: by mail-wr0-f176.google.com with SMTP id k16-v6so10893573wro.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 11:48:49 -0700 (PDT)
X-Gm-Message-State: APt69E3l8mWrPxKMNFv8npU2mm0pmVJEDYmcadEqmkWAWKh439OGbAm4
        SzeIQTDwMXH3hZBv4JzqmZ2rG9SVNMQD0J6DjnN2Dg==
X-Google-Smtp-Source: ADUXVKIPTs1I8dvveoP0fR8ZOInjWi2OXekZcMP/Ic3PqS81cZZcEViIYLFVCicMbBcJKzAJwM0DvuEmSR22DP+gGwY=
X-Received: by 2002:adf:b445:: with SMTP id v5-v6mr2547603wrd.67.1528397327870;
 Thu, 07 Jun 2018 11:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-7-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-7-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 11:48:35 -0700
X-Gmail-Original-Message-ID: <CALCETrU6axo158CiSCRRkC4GC5hib9hypC98t7LLjA3gDaacsw@mail.gmail.com>
Message-ID: <CALCETrU6axo158CiSCRRkC4GC5hib9hypC98t7LLjA3gDaacsw@mail.gmail.com>
Subject: Re: [PATCH 06/10] x86/cet: Add arch_prctl functions for shadow stack
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

On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> The following operations are provided.
>
> ARCH_CET_STATUS:
>         return the current CET status
>
> ARCH_CET_DISABLE:
>         disable CET features
>
> ARCH_CET_LOCK:
>         lock out CET features
>
> ARCH_CET_EXEC:
>         set CET features for exec()
>
> ARCH_CET_ALLOC_SHSTK:
>         allocate a new shadow stack
>
> ARCH_CET_PUSH_SHSTK:
>         put a return address on shadow stack
>
> ARCH_CET_ALLOC_SHSTK and ARCH_CET_PUSH_SHSTK are intended only for
> the implementation of GLIBC ucontext related APIs.

Please document exactly what these all do and why.  I don't understand
what purpose ARCH_CET_LOCK and ARCH_CET_EXEC serve.  CET is opt in for
each ELF program, so I think there should be no need for a magic
override.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
