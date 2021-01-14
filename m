Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9ACC433E9
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 15:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF6223A69
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 15:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbhANPQQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 10:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729261AbhANPQP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 10:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610637288;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xebwHfHcV3Q7qy8BZ+3Wm/tS6e8Jbu19X2ks+jrPpcI=;
        b=UZSUGYFkybXhpqeJvnHOGBA57qLXoY3aAh4ZNt+j6XJEdTKR2A6SwCRRQJ1svPtvwHwIFi
        sB4eev2KLmUiQzgjg6faOtuF1QqGFMOipCMnbEY6njiPqFuY75cfre5PajDqrOKXE9UgkY
        p3k2fdaTxwNW2qwcbZ1j5CrwabO8774=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-nRrRXO3dMHWblk0o18IUcA-1; Thu, 14 Jan 2021 10:14:44 -0500
X-MC-Unique: nRrRXO3dMHWblk0o18IUcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796DA800050;
        Thu, 14 Jan 2021 15:14:41 +0000 (UTC)
Received: from treble (ovpn-120-156.rdu2.redhat.com [10.10.120.156])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A87B219C48;
        Thu, 14 Jan 2021 15:14:38 +0000 (UTC)
Date:   Thu, 14 Jan 2021 09:14:36 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Joe Perches <joe@perches.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH v4] x86/entry: emit a symbol for register restoring thunk
Message-ID: <20210114151436.o3d6goua62mjyooo@treble>
References: <20210112115421.GB13086@zn.tnic>
 <20210112194625.4181814-1-ndesaulniers@google.com>
 <20210112210154.GI4646@sirena.org.uk>
 <20210113165923.acvycpcu5tzksbbi@treble>
 <CAKwvOdnAMsYF-v1LAqttBV3e3rHhSFZmPcRRV0+v=+9AyMFgNA@mail.gmail.com>
 <20210114103928.GB12284@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210114103928.GB12284@zn.tnic>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 14, 2021 at 11:39:28AM +0100, Borislav Petkov wrote:
> On Wed, Jan 13, 2021 at 09:56:04AM -0800, Nick Desaulniers wrote:
> > Apologies, that was not my intention.  I've sent a follow up in
> > https://lore.kernel.org/lkml/20210113174620.958429-1-ndesaulniers@google.com/T/#u
> > since BP picked up v3 in tip x86/entry:
> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/entry&id=bde718b7e154afc99e1956b18a848401ce8e1f8e
> 
> It is the topmost patch so I can rebase...
> 
> Also, I replicated that text into linkage.h and removed the change over
> SYM_CODE_START and I've got the below.
> 
> Further complaints?
> 
> ---
> From: Nick Desaulniers <ndesaulniers@google.com>
> Date: Tue, 12 Jan 2021 11:46:24 -0800
> Subject: [PATCH] x86/entry: Emit a symbol for register restoring thunk
> 
> Arnd found a randconfig that produces the warning:
> 
>   arch/x86/entry/thunk_64.o: warning: objtool: missing symbol for insn at
>   offset 0x3e
> 
> when building with LLVM_IAS=1 (Clang's integrated assembler). Josh
> notes:
> 
>   With the LLVM assembler not generating section symbols, objtool has no
>   way to reference this code when it generates ORC unwinder entries,
>   because this code is outside of any ELF function.
> 
>   The limitation now being imposed by objtool is that all code must be
>   contained in an ELF symbol.  And .L symbols don't create such symbols.
> 
>   So basically, you can use an .L symbol *inside* a function or a code
>   segment, you just can't use the .L symbol to contain the code using a
>   SYM_*_START/END annotation pair.
> 
> Fangrui notes that this optimization is helpful for reducing image size
> when compiling with -ffunction-sections and -fdata-sections. I have
> observed on the order of tens of thousands of symbols for the kernel
> images built with those flags.
> 
> A patch has been authored against GNU binutils to match this behavior
> of not generating unused section symbols ([1]), so this will
> also become a problem for users of GNU binutils once they upgrade to 2.36.
> 
> Omit the .L prefix on a label so that the assembler will emit an entry
> into the symbol table for the label, with STB_LOCAL binding. This
> enables objtool to generate proper unwind info here with LLVM_IAS=1 or
> GNU binutils 2.36+.
> 
>  [ bp: Massage commit message. ]

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

