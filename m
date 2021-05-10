Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5C1C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 23:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F73361585
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 23:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhEJXgs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 19:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhEJXgs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 19:36:48 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5218C061574
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 16:35:42 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l2so18257308wrm.9
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 16:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MTIwXTzHXOJftQAkS6hRZav8xAp3ouEqr22Jgozijd0=;
        b=TG39l+dEQiUoQPzYJeEbgV1oq274A7ys6iCq25lMs6umAtJiwMXdIUCb3a9pFigWkT
         lUbzUtAE07b5+qPoATG6vD8cuGPmux79786vGrdNuva3MOvWLavS3Ngg/CUYc8yPjV2q
         e5J8zTZKsNnLC/R04L4lQYBX4OX37YHZbdCCrkudbdItddObysK1syPZdVwD2RIes+b0
         73+ChbfGreK5J1oOWYayZIPYddRLeljbUOBxkDlAvRj37VtFU3+cmhZSipuLyZuil2ZN
         78wq01yjVa6JXgqGlI99DyXcVkkxFjTc2cD38v5ExFiaxmJo/J2L/2HYKVGcARAmnTez
         no5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MTIwXTzHXOJftQAkS6hRZav8xAp3ouEqr22Jgozijd0=;
        b=A2alj4O2VLIOY+K+FDZXK1Q1HRVjKh7/IU4QIoSFdoDncWu+Pa5BgaWbP1ZTJLbRfA
         idxPaTC4swlStMw8t00ixIgxerrmylnryY1bro9zEPDmA94wiamVZxT+Px5VpQjDBMNs
         ToZXkyHohHsn3xcos8NwrMUCD6ByDOWbWViJZQuz+DfOgWXETDaptfoFCcfo4U4bYpsI
         VJtltujswo0x7chAO3mXonHkB7tQyoYgI4vmvYvKlnYc7pmxZ3R20blHqMKt+ESkI37n
         NezvM3ttiLEMNec69FyUVNr6H3jnwWOpexk0VHuskzVkrLiA9t8APz3vrrWknr2vgKLw
         s9Xw==
X-Gm-Message-State: AOAM530WGDlPS+LqXi3CRcywpWSj2zPnCV7H6DGEC/c213YRzDV1RaZb
        jCA7UpDe4J7ilDqgwcOfcwu0fClzZPEqPLnDCdeUUg==
X-Google-Smtp-Source: ABdhPJxaB4u4pQznfxVYx52VusHoUNm3f5d37JNmD2jZj3+96D3sPJ6/NzLK3HXNFWhlb9L6aj8Ba24l8xt4zem0GXI=
X-Received: by 2002:adf:fc42:: with SMTP id e2mr34565804wrs.302.1620689741391;
 Mon, 10 May 2021 16:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620641727.git.mchehab+huawei@kernel.org> <1591224255d095d14ff3bc2bf4e7796dcc55c77d.1620641727.git.mchehab+huawei@kernel.org>
In-Reply-To: <1591224255d095d14ff3bc2bf4e7796dcc55c77d.1620641727.git.mchehab+huawei@kernel.org>
From:   David Gow <davidgow@google.com>
Date:   Tue, 11 May 2021 07:35:29 +0800
Message-ID: <CABVgOSn67XkxasNeMvcs-ciL8F8zmMEVoZMNqf8xRdUg1heX_g@mail.gmail.com>
Subject: Re: [PATCH 39/53] docs: dev-tools: testing-overview.rst: avoid using
 UTF-8 chars
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        Marco Elver <elver@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 6:27 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
>
>         - U+2014 ('=E2=80=94'): EM DASH
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Oh dear, I do have a habit of overusing em-dashes. I've no problem in
theory with exchanging them for an ASCII approximation.
I suppose there's a reason it's the one dash to rule them all: :-)
https://twitter.com/FakeUnicode/status/727888721312260096/photo/1

>  Documentation/dev-tools/testing-overview.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentation=
/dev-tools/testing-overview.rst
> index b5b46709969c..8adffc26a2ec 100644
> --- a/Documentation/dev-tools/testing-overview.rst
> +++ b/Documentation/dev-tools/testing-overview.rst
> @@ -18,8 +18,8 @@ frameworks. These both provide infrastructure to help m=
ake running tests and
>  groups of tests easier, as well as providing helpers to aid in writing n=
ew
>  tests.
>
> -If you're looking to verify the behaviour of the Kernel =E2=80=94 partic=
ularly specific
> -parts of the kernel =E2=80=94 then you'll want to use KUnit or kselftest=
.
> +If you're looking to verify the behaviour of the Kernel - particularly s=
pecific
> +parts of the kernel - then you'll want to use KUnit or kselftest.

As Marco pointed out, having multiple HYPHEN-MINUS symbols in a row is
probably a better replacement, as it does distinguish the em-dash from
smaller dashes better.
However, I need three for sphinx to output an em-dash here (2 hyphens
only gives me an en-dash).

So, if we want to get rid of the UTF-8 em-dash, my preferences would
be (in descending order):
1. Three hyphens: '---' (sphinx generates an em-dash)
2. Two hyphens: '--' (worst case, an en-dash surrounded by spaces --
as sphinx generates for me -- is still readable, and it's still
readable as an em-dash in plain text)
3. One hyphen as in this patch (which I don't like as much, but will
no doubt learn to live with)

But it looks like you've got several similar comments on other patches
in this series, so I'm happy for you to use whatever ends up being
agreed upon generally.

Cheers,
-- David
