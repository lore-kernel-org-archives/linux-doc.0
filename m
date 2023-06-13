Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91D2EB64D0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 17:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjFMRp2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjFMRp1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 13:45:27 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FB5E52
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:45:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977d6aa3758so1026790566b.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686678324; x=1689270324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcOW2YayMm3xjw1cJ1qlGpr/UGWPmxOrQJ2QJLZKMzE=;
        b=IbrU1sl+IAX6RcjIZUpPSF4MTopmWlsMRP1IPJ8Fpbd4xG7EIVOFBD+96DqHPEIWys
         +7UtwXLi2G6w/q4oTi+mmPUTXp0bsmeSW2uzuXN4RdExoBGKVw0heP9/4TbvrzhgN58/
         7BnsjCiJEajfkazWUXH5FvSPxvleKeLdxS1yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678324; x=1689270324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcOW2YayMm3xjw1cJ1qlGpr/UGWPmxOrQJ2QJLZKMzE=;
        b=AdIUVG8J//G1BXRypI8kBLGukf+CHuR7DspFaDHhfJhslE/6TrGXVy3y1VUqygdBaV
         vl8izBNDd4F7JYlUO75lXRb5A29qPVly0uk6H2O7K4xi7avfh9NRxs4AwFbfv8871kD/
         svMZEChbw4M8OiS2DdIg9OV39C28VH9b/mOk/cgR8VhLiCqUd6SdFG16UF2PCZF+vtWE
         GBVrwhwAk5tUKDEuFtmgJg9NMK2OeHIUJZFv56d+NcSUkaP+Nc/N7XSkKCjn5ULTHhN2
         5gDGL9IWYSTexG3k2k3wRsYHmbv9Gzc/eYUV+4B5ebRlKGJQNHzAHESefIsEOxsoyVyJ
         KOQw==
X-Gm-Message-State: AC+VfDxQHCV+Z6PrlKJie76+MV/PK0KByXZViHDTVjTnrfxAKEJCY/XL
        a5eoKBCX+HlNJUmqOSzykNib92hgg6I9Y6o7nY7woidP
X-Google-Smtp-Source: ACHHUZ7dkzTCUyCiVw1FqVH6sdOYpGgOXTc3EYdfbeyNgN1tUZZFkjD7lCYTTjBMa2wfVTdvCv/iRw==
X-Received: by 2002:a17:906:c156:b0:978:a186:464f with SMTP id dp22-20020a170906c15600b00978a186464fmr15576667ejc.39.1686678324066;
        Tue, 13 Jun 2023 10:45:24 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906139500b009745482c5b7sm6910156ejc.94.2023.06.13.10.45.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 10:45:23 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-977d55ac17bso1025655966b.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 10:45:22 -0700 (PDT)
X-Received: by 2002:a05:6512:548:b0:4ef:ec6a:198c with SMTP id
 h8-20020a056512054800b004efec6a198cmr6103911lfl.26.1686678301549; Tue, 13 Jun
 2023 10:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <CAHk-=wh0UNRn96k3XLh2AYOo0iz1k_Qk-rQXv8kYjXkKBzUMWA@mail.gmail.com> <c239d2c4f7e369690866db455813cac359731e1d.camel@intel.com>
In-Reply-To: <c239d2c4f7e369690866db455813cac359731e1d.camel@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 13 Jun 2023 10:44:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSWhVV+qr_tV0xg8c0WRn_H9wtFZkUVCpv-VzsddAS-Q@mail.gmail.com>
Message-ID: <CAHk-=wjSWhVV+qr_tV0xg8c0WRn_H9wtFZkUVCpv-VzsddAS-Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/42] Shadow stacks for userspace
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>, "bp@alien8.de" <bp@alien8.de>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "debug@rivosinc.com" <debug@rivosinc.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 12, 2023 at 8:12=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> Sure. I probably should have included that upfront. Here is a github
> repo:
> https://github.com/rpedgeco/linux/tree/user_shstk_v9
>
> I went ahead and included the tags[0] from last time in case that's
> useful, but unfortunately the github web interface is not very
> conducive to viewing the tag-based segmentation of the series. If
> having it in a korg repo would be useful, please let me know.

Oh, kernel.org vs github doesn't matter. I'm not actually merging this
yet, I'm just doing a fetch to then easily be able to look at it
locally in different formats.

I tend to like seeing small things in my MUA just because then I don't
switch back-and-forth between reading email and some gitk workflow,
and it is easy to just scan through the series and reply all inthe
MUA.

But when it's some bigger piece, just doing a "git fetch" and then
being able to dissect it locally is really convenient.

Having worked with patches for three decades, I can read diffs in my
sleep - but it's still quite useful to say "give me the patches just
for *this* file" to just see how some specific area changed without
having to look at the other parts.

Or for example, that whole pte_mkwrite -> pte_mkwrite_novma patch is
much denser and more legible with color-coding and the --word-diff.

Anyway, I'm scanning through it right now. No comments yet, I only
just got started.

              Linus
