Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD74EEB64D8
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 18:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjFMSH7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjFMSH7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 14:07:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4EF19B1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:07:57 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9768fd99c0cso1413472966b.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686679676; x=1689271676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU2BO0gcHFt44DuEFTAO2c7xYdpyPStn/nzoWP1HBD4=;
        b=Xm8eAdwixZd4Vk4/SwCfSsMeCI74QgQJPCc24CAWcqzWoKfSgSv4wMg88ufu8kqBvg
         FttkbeUoE2H+RH1Kuz180tFCAuNZ5y25xDUJiAcbeRNTwfL61D98lW4EBDv80sRGn3LS
         nPoC+88oz/A6xSkuAwOJnDkXzyToyqYsKnTcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686679676; x=1689271676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU2BO0gcHFt44DuEFTAO2c7xYdpyPStn/nzoWP1HBD4=;
        b=OWd4H6qVWX5CORV1PWm395R0fn2JjAfytcGHsIoL8GmtJjw1qcGGOAQ6okI9DL8OwP
         dw9nX5cSCE9yU3kTtydEIdgKWF60u4mVQBNn4lqNsuRCPi4AssthJ5fpSto8N7QysHrN
         8uxMWPZZRdxL8r3140ypKzpK91QpRwVitoL6QURNNeekPAdsygLFUU/o1OzaJpNGtvsy
         25POHX+usGRXQXy1IdoiAnvy2EeTPxUj7PSOCiUg5LPvtYZ14dJchOAaSLouKP1iMfvk
         K6usWBN3sCKsnKXkOR5ElKsgSQ2frrFkHzOibDhIyTLLxtIinCeZ4sFFpJtb3taAGUTw
         DUUw==
X-Gm-Message-State: AC+VfDx4m9TyxhKLKIIR9PztquykTAQfIIZVmIYIGHTYQx682y5ccjE0
        f0hZbECCrL2m7jIr3pzAjursQf/4hd5LA0xPvRhaQ+/A
X-Google-Smtp-Source: ACHHUZ4W7qqS8NFN/0BY8tbuzokT2yuU7R2xsM0ZgA7As5CuzBhkIDA89L0V66k2YxvEfaXt/JetYQ==
X-Received: by 2002:a17:907:9812:b0:96f:94f1:b0a5 with SMTP id ji18-20020a170907981200b0096f94f1b0a5mr13967806ejc.8.1686679676115;
        Tue, 13 Jun 2023 11:07:56 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906258300b00977d194bf42sm6922040ejb.161.2023.06.13.11.07.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:07:55 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5169f920a9dso11910528a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:07:55 -0700 (PDT)
X-Received: by 2002:a17:907:7d92:b0:969:9c0c:4c97 with SMTP id
 oz18-20020a1709077d9200b009699c0c4c97mr13719822ejc.1.1686679279617; Tue, 13
 Jun 2023 11:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com> <20230613001108.3040476-12-rick.p.edgecombe@intel.com>
In-Reply-To: <20230613001108.3040476-12-rick.p.edgecombe@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 13 Jun 2023 11:01:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-PfXhVb7Atk+G8SNjFSvqDWu37KPFR-ssuM-j_o93Kg@mail.gmail.com>
Message-ID: <CAHk-=wh-PfXhVb7Atk+G8SNjFSvqDWu37KPFR-ssuM-j_o93Kg@mail.gmail.com>
Subject: Re: [PATCH v9 11/42] x86/mm: Update ptep/pmdp_set_wrprotect() for _PAGE_SAVED_DIRTY
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

On Mon, Jun 12, 2023 at 5:14=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1189,7 +1189,17 @@ static inline pte_t ptep_get_and_clear_full(struct=
 mm_struct *mm,
>  static inline void ptep_set_wrprotect(struct mm_struct *mm,
>                                       unsigned long addr, pte_t *ptep)
>  {
> -       clear_bit(_PAGE_BIT_RW, (unsigned long *)&ptep->pte);
> +       /*
> +        * Avoid accidentally creating shadow stack PTEs
> +        * (Write=3D0,Dirty=3D1).  Use cmpxchg() to prevent races with
> +        * the hardware setting Dirty=3D1.
> +        */
> +       pte_t old_pte, new_pte;
> +
> +       old_pte =3D READ_ONCE(*ptep);
> +       do {
> +               new_pte =3D pte_wrprotect(old_pte);
> +       } while (!try_cmpxchg((long *)&ptep->pte, (long *)&old_pte, *(lon=
g *)&new_pte));
>  }

Thanks. Much nicer with this all being done just one way and no need
for ifdeffery on config options and runtime static branches.

                  Linus
