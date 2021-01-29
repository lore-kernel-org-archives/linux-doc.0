Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF6C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 21:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38C6064E0C
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 21:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhA2VtF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 16:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbhA2VtC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jan 2021 16:49:02 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED346C06174A
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 13:48:21 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id p15so6474476pjv.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDCl0b2Dk+cS7GVWEWeoYxC8mwKbqEi6yIqTF9Oo/qE=;
        b=eGTW4MG8Pl3TK+TMkm4WglBjmPDuVT8H+GAviEyFrguRE6MRa/GZZU7J398/6ZxFe0
         xKPb6fAPxgSfXD/5KNroU2ifvPgvO1IC8xBnFPZzEvffhM+8Q1IErfcPS36GrEAidfn7
         mZUNfyj0ahxaGDAbfudWd+sU+mGeZMHZfwwVpRbB+qDyxpH5crTLeJwY1PlaMWn6JFMS
         NZ0bST5Evxu51geiAxpQM2AAPsjDwei/x21em74ddRcVbmAwrCX90CFifsFs6qZ1MfxK
         MGUg4o5cVCabYzEtUhZy2YrZ/jRtkSNA0vITi/lAdQbWRMyGdCsUvL40t9Y8gL8BLvub
         ckIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDCl0b2Dk+cS7GVWEWeoYxC8mwKbqEi6yIqTF9Oo/qE=;
        b=c4L3Z8zdQUtV95+g7o56Xa7exjQ1aZi/HBzkcSzFIiA8+qpcJ6wsI6bjvoScFUXKll
         TJM2zllk8kE1nKV4i6kc9FZnRzMwn2B3rsT3ivonM2b8Rsnu1ZwiSCrpmKh0dDow7V6N
         0oW5Hpaablh57m7TFi4lkiK/952PSoI4DOMb4ZMNaKBDl5BfwWBTjvy4LMbnGOIqCnS7
         DPPhTRSh0/ZOHyPHAV6XAkjIx7QhQtO50PxG0N4c3N6kARwjdwcqxINbGMIzKoQ4bOWQ
         leildOLuuzJ+FWVYboqNbw4yeplm9alH/E2HJrKGmUHorPNdepT3V0MJbbcc0yA3hTio
         mfOA==
X-Gm-Message-State: AOAM531G2WeuW6MkJAUIfSlKzS3dNlHX3kDzW2lFnO23kRxttR61LUxf
        GK6AyG3IhhzRbAHWFRFmzpAezweN+CqCfEv+yLItfA==
X-Google-Smtp-Source: ABdhPJyaUQFnwwGfCgFgWXfe9NvNBiQYNFxLJPMiY6STretlJGU4TmCaVSMStJjR790JfgkGm8fCqn5KCHfOCa2LqxE=
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr6338917pjn.25.1611956901187;
 Fri, 29 Jan 2021 13:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com> <CA+icZUVbdbkboYNztXNtRDR+LH8yQbhZJ+Nw-h91TQRr=Z08Gw@mail.gmail.com>
In-Reply-To: <CA+icZUVbdbkboYNztXNtRDR+LH8yQbhZJ+Nw-h91TQRr=Z08Gw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 29 Jan 2021 13:48:10 -0800
Message-ID: <CAKwvOdmyerPPJo=m+13jtWR_kPwrmOeb89jh=qgGzEaPhKDOLA@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 28, 2021 at 11:43 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Some comments:
>
> [ hash mismatches ]
>
> Observed identical warnings when doing a rebuild with GAS or Clang-IAS.
>
> [ Importance of LLVM_IAS=1 working ]
>
> Clang-LTO and Clang-CFI depend both on LLVM_IAS=1 (see for example
> "kbuild: add support for Clang LTO").
> Sooner or later we will deal with this issue (hope it is not a local problem).

If you're switching back and forth between GAS and IAS, then I would
expect a hash error if you're trying to reuse profiling data from one
with the other.  The profiling data is not portable when switching
toolchains between when the profile was collected, and when it was
used.
-- 
Thanks,
~Nick Desaulniers
