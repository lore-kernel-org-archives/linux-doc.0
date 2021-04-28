Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E701CC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B45E861440
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240259AbhD1Ox1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 10:53:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240273AbhD1OxZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C128E6144B
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621560;
        bh=v9MXjcMFDkwGRxGtKjG0QxDDhk6y4//cm0KjKwV14/0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nKHe+Rwl/HYPNNTg6n9BxLvfNLWwSMxIawjXuiSOxUjrkfoJt3fbK22gn0aX96Lef
         Sb5yJo17A7LDF7TTdlmT3Otfd2jJuA83IU+3N8P2bYC3YmjMjiO95v5g1f3pkwmgV/
         +NVXQ2+bvqBD11gHni68vb6iGuYHVnrL+YnbTtlSlwN/W8WDMioWqdPZZGVQqGEhiM
         tqaeORnZ5Jjg6T+YzMKsNk5FnuZnwIEOA+okcdMxZkX8zjW9uPY1B5hCR5bgm7m85d
         dxBAWP8LxSpmJJ73T0L2uRh06vuIa0c2KFD5MNp8BnFDJq3PsWk/Gx6t50z9vDXaH5
         l2SC4GNFIY8nQ==
Received: by mail-ed1-f47.google.com with SMTP id h8so34471061edb.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 07:52:40 -0700 (PDT)
X-Gm-Message-State: AOAM532ZrHR7sWbmq4wBCKNHvcgOsgBdmx22ppsJ/lugLDeLVIGDJUqe
        tNqfLnctEeStDxxD0QSPcWMuDczrrkQNakMNFKIL1A==
X-Google-Smtp-Source: ABdhPJz+QIzKaPnT4DT6hm809Ge+488Ygp48T6Uu+3gaGnaUVYy9et+z5f3TMrjkz6M7tyk1lUqB4cQlJnvVlzDNxh4=
X-Received: by 2002:a05:6402:cbb:: with SMTP id cn27mr12113500edb.222.1619621551563;
 Wed, 28 Apr 2021 07:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210427204720.25007-1-yu-cheng.yu@intel.com> <0e03c50ea05440209d620971b9db4f29@AcuMS.aculab.com>
In-Reply-To: <0e03c50ea05440209d620971b9db4f29@AcuMS.aculab.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Wed, 28 Apr 2021 07:52:19 -0700
X-Gmail-Original-Message-ID: <CALCETrUpZfznXzN3Ld33DMvQcHD2ACnhYf9KdP+5-xXuX_pVpA@mail.gmail.com>
Message-ID: <CALCETrUpZfznXzN3Ld33DMvQcHD2ACnhYf9KdP+5-xXuX_pVpA@mail.gmail.com>
Subject: Re: [PATCH v26 0/9] Control-flow Enforcement: Indirect Branch Tracking
To:     David Laight <David.Laight@aculab.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
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
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 28, 2021 at 7:48 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Yu-cheng Yu
> > Sent: 27 April 2021 21:47
> >
> > Control-flow Enforcement (CET) is a new Intel processor feature that blocks
> > return/jump-oriented programming attacks.  Details are in "Intel 64 and
> > IA-32 Architectures Software Developer's Manual" [1].
> ...
>
> Does this feature require that 'binary blobs' for out of tree drivers
> be compiled by a version of gcc that adds the ENDBRA instructions?
>
> If enabled for userspace, what happens if an old .so is dynamically
> loaded?
> Or do all userspace programs and libraries have to have been compiled
> with the ENDBRA instructions?

If you believe that the userspace tooling for the legacy IBT table
actually works, then it should just work.  Yu-cheng, etc: how well
tested is it?

--Andy
