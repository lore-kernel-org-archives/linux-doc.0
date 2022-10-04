Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4B5C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 19:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiJDTYc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 15:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiJDTYb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 15:24:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089F067478
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 12:24:30 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q7so6378028pfl.9
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=TPHGjn63G4Sj8mZqFRVnqMa0MXMfRBRw4erndCFr2yc=;
        b=N62in1FHINxzmpEMCxU1iYHaOAzaej9i3j46sXOtPXoNR+pnNbuAfgPGOWR0M9aNRx
         FEybgsaF2Wj0UOJ4KmCZJPR8YXthw0ow2bau2vicE2MOXSf7UQWfApIDbTrlrboQ5js5
         ZfuVhu1x6EtUT6X3rjEQV1fJMnlg/mTn3ESLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=TPHGjn63G4Sj8mZqFRVnqMa0MXMfRBRw4erndCFr2yc=;
        b=2w+GcNjCTrUFjz8haPweiDP4Nu17cRQvsFvwcM5K36WTT/sN/18OVOAqu5yZvS4Ykg
         jkydZ/a5JMwAq0xOazUAjbUWTIDZkpt9mJNIxiFxdFh6L5OJPKxzTXrSPKICbNcAHvrk
         E4QXMVeSyDQ9O8DZMGIBD5UZEbdPafAb20XPqcnuG21LTEB5j55DiQ4arK6jb56697m0
         JMtt6a/VpfiUccHGGXivdExktgn/kP63gFjwe3jPP0kI/h7ep9/C/D6yuKrOyqdWypy2
         LfP9E+qb84DKZpHMZlY4DDZqeZ67WslxN135gyBj/FBSTbyaVzizoVUoOppzBoBBcQPZ
         PKnQ==
X-Gm-Message-State: ACrzQf1BEGmHTm00YLqLCW/vHZaSEtiZfL/XbdvMJxuWGkfe1orjsUlb
        Vt2Tq2Lsh+Wkhgq4KEnBezJr9A==
X-Google-Smtp-Source: AMsMyM4HxL0s5qvx/MF11QUaz7zgb8PObZXUvmqkMZ2tOrL2yDra9OycFNKkIhPW7kbGndOV83ZFTg==
X-Received: by 2002:a63:da03:0:b0:439:dcdd:67f4 with SMTP id c3-20020a63da03000000b00439dcdd67f4mr24551120pgh.27.1664911469526;
        Tue, 04 Oct 2022 12:24:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d1-20020a170903230100b00177efb56475sm9328173plh.85.2022.10.04.12.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:24:28 -0700 (PDT)
Date:   Tue, 4 Oct 2022 12:24:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [OPTIONAL/RFC v2 37/39] x86/cet: Add PTRACE interface for CET
Message-ID: <202210041224.E4C63B1@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-38-rick.p.edgecombe@intel.com>
 <202210031658.EEC88324FD@keescook>
 <YzvyYDOg8GZIBtz8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzvyYDOg8GZIBtz8@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 04, 2022 at 11:44:16AM +0300, Mike Rapoport wrote:
> On Mon, Oct 03, 2022 at 04:59:43PM -0700, Kees Cook wrote:
> > On Thu, Sep 29, 2022 at 03:29:34PM -0700, Rick Edgecombe wrote:
> > > From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > > 
> > > Some applications (like GDB and CRIU) would like to tweak CET state via
> > 
> > Eee. Does GDB really need this? Can we make this whole thing
> > CONFIG-depend on CRIU?
> 
> GDB, at least its Intel fork uses this. I don't see how they can jump
> between frames without an ability to modify shadow stack contents.
> 
> Last I looked they used NT_X86_CET to update SSP and ptrace(POKEDATA) to
> write to the shadow stack.

Okay, thanks! I appreciate having specific examples. :)

-- 
Kees Cook
