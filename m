Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF138EB64D0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 17:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239934AbjFMR7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjFMR7H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 13:59:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB9313E
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:59:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977c72b116fso873970866b.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686679145; x=1689271145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8Y88yptodPeuMRnHzLyyoqql+qi0tUT2B3rKlKiInQ=;
        b=gpM7UDwwphh0cAiNxNFv4fvkQUOtmjf7tTpV6J7fjFzurNF2GG/MrNkNjKKCQLkALr
         5qd0vbYU3KKbUu19B8+6rgP0XS1Aiw0NSwtMKsSlF8gz+fdNdDBnn70n0xd+ptiFXkuS
         JjnJRn488G/CVFRGptERY04jtvWA5cyiHad80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686679145; x=1689271145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8Y88yptodPeuMRnHzLyyoqql+qi0tUT2B3rKlKiInQ=;
        b=PpcZuiCd51BiyafaCSDOiHEG5+rCW6h7+yAPGWzuq4TWAYLFto7/3v5eJNj67+Gl+T
         QdxGVFaMXu4nAg+1viTa4iv3yhrlXKLUar2zsephZAaFuoT4nWU1ylYUl1A+ZbgDxBST
         emtPEnos79PjdYI/kSApRdLMhMICpkBnSjgS7PWeUGzKf7RKHb8t1lUw3/quC9uYcQBw
         3eKaxQ8EoQ/pk/HVfuUZGGlhgwCG76dffzFHepTr9LGJWeFYJBodbfkS4DAYDwf29jls
         8QmB7d2oL+qx33JNezR9jSPFLZWhcTNrudZJZ1NYqVSEHwXiOhJ2XYND1YWiYhOSkmX+
         RmHg==
X-Gm-Message-State: AC+VfDxemZJCSiop0wyUyS+1NN/cXIFp+/6kHqfDuXyJVZZH/LVWBhxg
        9mqGhwhR3Le5XJh89GO6U7WEZG16GxoDely0cCF2Dmk4
X-Google-Smtp-Source: ACHHUZ7KMqMJhl6hNdvcd1YzCGgdP2PWsy8ZfOmro9eBL6On2rHfE9zT+wZcyNGC+ygkyCQNSr9esw==
X-Received: by 2002:a17:907:26cb:b0:978:ab6b:afea with SMTP id bp11-20020a17090726cb00b00978ab6bafeamr13118684ejc.72.1686679144713;
        Tue, 13 Jun 2023 10:59:04 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id gu4-20020a170906f28400b0096fbc516a93sm6920884ejb.211.2023.06.13.10.59.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 10:59:04 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30c2bd52f82so5770259f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:59:03 -0700 (PDT)
X-Received: by 2002:adf:e546:0:b0:306:41d3:fcb9 with SMTP id
 z6-20020adfe546000000b0030641d3fcb9mr8013110wrm.27.1686679143465; Tue, 13 Jun
 2023 10:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com> <20230613001108.3040476-11-rick.p.edgecombe@intel.com>
In-Reply-To: <20230613001108.3040476-11-rick.p.edgecombe@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 13 Jun 2023 10:58:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgUz9BzHd7Ne1_bUa+4rWoTZanqkQvm4iJt=D7QpE3djw@mail.gmail.com>
Message-ID: <CAHk-=wgUz9BzHd7Ne1_bUa+4rWoTZanqkQvm4iJt=D7QpE3djw@mail.gmail.com>
Subject: Re: [PATCH v9 10/42] x86/mm: Introduce _PAGE_SAVED_DIRTY
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        david@redhat.com, debug@rivosinc.com, szabolcs.nagy@arm.com,
        broonie@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Small nit.

On Mon, Jun 12, 2023 at 5:14=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> +static inline unsigned long mksaveddirty_shift(unsigned long v)
> +{
> +       unsigned long cond =3D !(v & (1 << _PAGE_BIT_RW));
> +
> +       v |=3D ((v >> _PAGE_BIT_DIRTY) & cond) << _PAGE_BIT_SAVED_DIRTY;
> +       v &=3D ~(cond << _PAGE_BIT_DIRTY);

I assume you checked that the compiler does the right thing here?

Because the above is kind of an odd way to do things, I feel.

You use boolean operators and then work with an "unsigned long" and
then shift things by hand. So you're kind of mixing two different
mental models.

To me, it would be more natural to do that 'cond' calculation as

        unsigned long cond =3D (~v >> _PAGE_BIT_RW) & 1;

and keep everything in the "bitops" domain.

I suspect - and hope - that the compiler is smart enough to turn that
boolean test into just the shift, but if that's the intent, why not
just write it with that in mind and not have that "both ways" model?

> +static inline unsigned long clear_saveddirty_shift(unsigned long v)
> +{
> +       unsigned long cond =3D !!(v & (1 << _PAGE_BIT_RW));

Same comment here.

             Linus
