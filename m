Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE9BC43464
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 11:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 028402311B
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 11:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpjzFHO4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIRLoW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 07:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIRLoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 07:44:22 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3725BC061756
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2020 04:44:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so3041892pjg.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2020 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qnYIT2Fro5rrEPZwxE6ivwPIktYrQuk+TOWeG9l01y0=;
        b=TpjzFHO4Q6iK+2S0yd/r45ft/QIGxmZn1TMUb4TH3D9l+vvJwo/IcvVAvPGzQKDI3q
         LaJDsKTCCvLDg4QDgB/amHYdB0swnnubRvYsXre1YIZ8FvlkJ4B6Z/dEY4AnPA4wrAN3
         JjjuB5xAbdntz0qjwDuuvFsCH5ZJM5o88GM3CPOichmwCOIlFg7BQfrIhMA/YX/QA3hd
         yh/tBbuAZR2MAZZ2sMGh7pTksFYUggquNudnb3wTqmRTjeaNxlk/6ILxCSsxW2sVx3HA
         Wyz1o3y1D6pvb4jDkDFq0oYnT1hsRwKVXFMnoJUGERBbe9Mun2WkU0uWg4bYZHWwP5Rk
         4brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qnYIT2Fro5rrEPZwxE6ivwPIktYrQuk+TOWeG9l01y0=;
        b=X3ji+rkfxTNY+Q07jUv+f8G92kR+lpsqi6Zu7VqrIc9OfkLUWJpl/Ts0ygK00Lb5S6
         2eqSk9zyAWq2a1+5WnoJ9KkQSzjj90z9bwvj1bl2ftZGMWEavIzMFJZKCf7cYN5qyLru
         5uy1NjCq+Wg/3qxgADd+GF9uz3BaVnXWcHhbnAhub1VeER55753Zdnq2A0Sp8t9evp7X
         GLl+oZcZWezWrzc696lzx2iPSM55UPbpj0qGvb/wjzvBYbLscl3oTwcT8qk4G4DWumMy
         kfqHcsxYJD4+YvTEtH7BRkvIMa7c8YhlTMQBib2MT+r5t8WFCbzAtWEOJF/ViolU2GjC
         dcPQ==
X-Gm-Message-State: AOAM53371zw/jtQcsgyG94/415cAlIDB6mIFifHiqTFl9dmUusBklkgo
        wZROKXoalogYWwOZ8d9SsDUb7QJEkFhV4YJbAtVN8Q==
X-Google-Smtp-Source: ABdhPJz0jo7HaXxwZF8WsvLi3jPEukK8M2gwgX2K292bWBOZWOpUAFd1MrQn+GrnUqx0G/Nt/9dglt6mHtQ30uo9yhM=
X-Received: by 2002:a17:90a:cc0e:: with SMTP id b14mr12117134pju.166.1600429461570;
 Fri, 18 Sep 2020 04:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600328701.git.mchehab+huawei@kernel.org> <53f6987c1a4b032ff636a95e3fce53ff8bfef630.1600328701.git.mchehab+huawei@kernel.org>
In-Reply-To: <53f6987c1a4b032ff636a95e3fce53ff8bfef630.1600328701.git.mchehab+huawei@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 18 Sep 2020 13:44:10 +0200
Message-ID: <CAAeHK+x-pDCWZX+vwiib6VH8mLJDD+Fbe6xeBA-_7OCcuLg_Ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: kasan.rst: add two missing blank lines
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 17, 2020 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> literal blocks should start and end with a blank line,
> as otherwise the parser complains and may do the wrong
> thing, as warned by Sphinx:
>
>         Documentation/dev-tools/kasan.rst:298: WARNING: Literal block ends without a blank line; unexpected unindent.
>         Documentation/dev-tools/kasan.rst:303: WARNING: Literal block ends without a blank line; unexpected unindent.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/dev-tools/kasan.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index c09c9ca2ff1c..2b68addaadcd 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -295,11 +295,13 @@ print the number of the test and the status of the test:
>  pass::
>
>          ok 28 - kmalloc_double_kzfree
> +
>  or, if kmalloc failed::
>
>          # kmalloc_large_oob_right: ASSERTION FAILED at lib/test_kasan.c:163
>          Expected ptr is not null, but is
>          not ok 4 - kmalloc_large_oob_right
> +
>  or, if a KASAN report was expected, but not found::
>
>          # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
