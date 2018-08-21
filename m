Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C7C77D2EE
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 23:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbeHVDEN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 23:04:13 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:44251 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbeHVDEN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 23:04:13 -0400
Received: by mail-pl0-f68.google.com with SMTP id ba4-v6so43555plb.11
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 16:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4ZqmY0V2BkFNNsCmwSimoVUnrZFDxF3zAg3MqxxYA0=;
        b=bBjRgRc9VSOJk0ZBv6dSJ2Sfqm1NuYiIwdCRkBtd+coog8iivSz/ZEbXJksVFXw+48
         8HhKI0uLLM92xeqZoWpf1ZJv1K8dc3IQ1fb7kaXIfk8KENrUSaNJe0dhtccqXRSBLzMu
         Qd8QqExgLeHKYtWKWfUV6xmwWSr8scvbW2mhozQcYHO/tgpV+NhMmC3Yi0szhH4bsoIi
         eHrxyv/+0tIY7GUdK+xePtPg81NOR4bhwT9utjry99pTCB9UYgRW4M7iuCgWraOfbrJ5
         wVHjSOoJWHtCIU99gfAS5/Tpbqt721u6mLM7Bkd8QleXc4BgJIo4RUGB8n/W70dMoKeh
         Pd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4ZqmY0V2BkFNNsCmwSimoVUnrZFDxF3zAg3MqxxYA0=;
        b=GU6B1Ibu5C6c9SaVvu0BNoYZngL8mSYZIzfN/KbDjHbUXvXMDLbF6XU82hn+nD4dpT
         Te5mZBf2uxMEgSrs9F00yTLtGJYhWop4Mh2FQTxnFYiyLJB8qBl0lWrKQBstXdPKXE/w
         /z04jvEH+nim0mKTxDEfNMthWK0nj9rAiYza6Y6lDs5oyNG1n71o1hHZtNv3wPdHlss3
         zz4dFvSQQCGMOrffyMkCZV/33JXBS7aIZDDyFaYeU2Mc9HvlIefieeI4VjdtklGcRqdi
         ShrAAiF3Wv8xEvaGPKN9oySB0DhXkCO7aOf5dvf0PWBmqg9pPbvtO3jkyNc4nzQJFuIA
         juUg==
X-Gm-Message-State: AOUpUlFKU6yGHX2uSp8r2IXqZVQlUONd0H0pyq0RczWJBFj5WJcbFGfK
        70c/EMUfccx6B76rvWOEFujdGYAgFoex8I3V6jPt2g==
X-Google-Smtp-Source: AA+uWPxgk/HfdbuOfSinP/WGuAOOP1gwjbuFoRpJ9LbqQ33vJG2zn/8GYdYEQjKTTDfX8Rn8zeImLho2ls/ORvOMPrA=
X-Received: by 2002:a17:902:b7c3:: with SMTP id v3-v6mr15959110plz.238.1534894917715;
 Tue, 21 Aug 2018 16:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <da5620dc7a2b9d33f2a0dd7f4dc3afdab5a66f26.1534795606.git.joe@perches.com>
 <CAK7LNAStcQoi8oodq98dSGp+Jmgb1F0mowMephUY=OD2o4=2Mg@mail.gmail.com> <CA+55aFxU+cCxLsrTjKdni_xrJ=TvcYbHh0pv7Bk8ns4Gtq8rBA@mail.gmail.com>
In-Reply-To: <CA+55aFxU+cCxLsrTjKdni_xrJ=TvcYbHh0pv7Bk8ns4Gtq8rBA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 21 Aug 2018 16:41:46 -0700
Message-ID: <CAKwvOdk3Ydp1KtJui3BH=M+wS-m0TywMNzn1BkifumTQWBLS3A@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum required gcc version to 4.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>, joe@perches.com,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        dave.hansen@intel.com, efault@gmx.de,
        Guenter Roeck <linux@roeck-us.net>,
        Rik van Riel <riel@surriel.com>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 21, 2018 at 12:40 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Aug 20, 2018 at 11:56 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > This broke Clang build.
>
> As mentioned elsewhere, I think the clang build was broken before anyway?
>
> > I sent a patch.
> >
> > https://lore.kernel.org/patchwork/patch/976025/
>
> Yeah, I'd rather just have the clang case have its own file, instead
> of be back in the situation where clang depends on gcc and then has a
> different versioning model so we need to have insane clang version
> tests in the gcc file.
>
>                 Linus

WIP patch at: https://github.com/ClangBuiltLinux/linux/commit/1f89ae7622c26b8131f42f3a362d6ef41b88a595
Would be happy to get early feedback.  Does anyone know who I should
talk to about testing w/ ICC?

-- 
Thanks,
~Nick Desaulniers
