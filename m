Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE0DC4332F
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 04:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJDEhK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 00:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJDEhJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 00:37:09 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6EA2EF3D
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 21:37:08 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so17504227pjs.4
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 21:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=xlDrlQKwusKzG3w+2ZOP4CcXq+zZWkgG9x1cLqQziDo=;
        b=odgDB/DEuXgA+WrZz6TjnUf48uHEz6xVUowwFk90ZSRmN0rDQA5zML6bpuOD7X7GF8
         /KZHdaswo+8JuDe3Csmn4YdnRd9hgamqnyxLBtwUZ56B68ah76aL6kvE8q0HmB6tVB8W
         HxbwTxJamv43wu8rKK9RpxGA1mUjcURvDFA0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xlDrlQKwusKzG3w+2ZOP4CcXq+zZWkgG9x1cLqQziDo=;
        b=v9/YJI4xKbWCc3dCvR4HbHvsrOtyE8qEN6AYbWpaJ/jEi+vi9m00Psho1rsZ0pPmcS
         z6oH3XyU/lhr9Ij0hgfu9HCvfSIG8///JUbMAZ0tm5QKtTBI/VBPk1QBxT8DLns63Tq0
         jsxOX0WTkFD37E8T8+U7//p17cs89RnQih5GUlcPP3cT191eqA01zrBTSTFNoSUKkiEi
         2drE3Vm815rFBHkBTx5xjPIZwUYgoFIQkNcOyNYOoKAwSM0EmT73wL0pceESWM+Lv6k0
         1TKXoIOxXlvFBLawEiqlMCnMlAym38xEzy/Ql9jmYp7Zom0qhE4R20y3zKLBSaGz+23w
         X5aQ==
X-Gm-Message-State: ACrzQf0jDJc8bVC3lboGujqX+Ct2NsWXiuYgi6QFyvEz35pa0zYjd2h6
        woo2utyRDXcSInTy6XhZFECGQw==
X-Google-Smtp-Source: AMsMyM4qeEoRKRKBeqFCue+av93c+r/cyDjYIuWyLxLLgIQRMwKE7npwCrHCbEWQqNlsNeNAkq6c/w==
X-Received: by 2002:a17:90b:4a50:b0:203:1204:5bc4 with SMTP id lb16-20020a17090b4a5000b0020312045bc4mr15770725pjb.79.1664858228262;
        Mon, 03 Oct 2022 21:37:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q5-20020a17090a4f8500b001fbb0f0b00fsm10907573pjh.35.2022.10.03.21.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 21:37:07 -0700 (PDT)
Date:   Mon, 3 Oct 2022 21:37:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
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
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com
Subject: Re: [PATCH v2 29/39] x86/cet/shstk: Support wrss for userspace
Message-ID: <202210032129.44F6E027D@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-30-rick.p.edgecombe@intel.com>
 <202210031525.78F3FA8@keescook>
 <6ea0841f-5086-9569-028b-922ec01a9196@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ea0841f-5086-9569-028b-922ec01a9196@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 03, 2022 at 04:00:36PM -0700, Andy Lutomirski wrote:
> On 10/3/22 15:28, Kees Cook wrote:
> > On Thu, Sep 29, 2022 at 03:29:26PM -0700, Rick Edgecombe wrote:
> > > For the current shadow stack implementation, shadow stacks contents easily
> > > be arbitrarily provisioned with data.
> > 
> > I can't parse this sentence.
> > 
> > > This property helps apps protect
> > > themselves better, but also restricts any potential apps that may want to
> > > do exotic things at the expense of a little security.
> > 
> > Is anything using this right now? Wouldn't thing be safer without WRSS?
> > (Why can't we skip this patch?)
> > 
> 
> So that people don't write programs that need either (shstk off) or (shstk
> on and WRSS on) and crash or otherwise fail on kernels that support shstk
> but don't support WRSS, perhaps?

Right, yes. I meant more "what programs currently need WRSS to operate
under shstk? (And what is it that they are doing that needs it?)"

All is see currently is compiler self-tests and emulators using it?
https://codesearch.debian.net/search?q=%5Cb%28wrss%7CWRSS%29%5Cb&literal=0&perpkg=1

-- 
Kees Cook
