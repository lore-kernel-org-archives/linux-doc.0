Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB9BC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 09:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344601AbiF1JtY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 05:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344581AbiF1Js7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 05:48:59 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799682BB3D
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 02:48:47 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id d5so21295751yba.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
        b=I7H7zqGdOfwwpsDfe9uF8VojqU+qtuDQRgt7FtGBoFlVFCSJN9YFG+1NWGSiIuox8S
         W+KTN+aOhO/ktobsqKb4feN5yBBDNx0wm/w13zu9GE1MpTeJ9BkKCl/bKqoxTj+butyG
         02/IG1kxsMpY40YD0RA6epXortCUPMP7sMFf2G2KAsGaM15F0G20pAiOcgk96rxpR8ke
         4UAfgPRBQGXYCKfOAsUeqXv2EnFCWpyg0H2uCQj9u81Sa+kwI5qveTjwZLSeOF0LEPCz
         orDz4fOkku7jaCsorv9stb6v1uGkuYXGTaB+8k6Pjso/QtNIucekoLsh+TNJkKdQ3yXO
         +FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
        b=4ybTxltr+GfmbJV7lGBENPNHi4wYKijSNUcj+xMyLjmt/Ov1IoYFWAY2cEGZcKaBio
         C4l0l6zS6THUZu9sGt/zj1CKZoOVwsZG3w/FnnnHa0DgiZbu3AGaGda/SZhqgC5htxAL
         EbmaqtqXpc8otYt8QnCL/pCUMATQSB5hwP9TtSUlv73t5wjXOoA+NHXmuHzMIbYrIXdA
         AFFu2iYdy50zC344HB7hYCgsGOJysh3v7Ad53j5XCmt3PTkYaQLIrAFGHBCoosIZaKG6
         xBepeL0tKdWFnYuKvt0wfMCQxL0tg9XIsu5+ExckC0wYW1TO994A3AWfa7pN5f3SDmCC
         GKBA==
X-Gm-Message-State: AJIora9KKGzjbjhL++eQkwL2gLTWfqlgDrdUgDJnaT8GSetDyavSWDvd
        4GzioWjo6vZ7cWyhkZfNS1zUp6J3VEFlyaswG3WTSCPb5REZ+g==
X-Google-Smtp-Source: AGRyM1vPz47fcquk2IzBhzy+bTY7luIs+lRfkEnNwxblxcyPcZABp99gUxefsLLFGaLceF6zmZkkxVh4KZO10IEsTiQ=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr8598779ybh.533.1656409726603; Tue, 28
 Jun 2022 02:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org> <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
In-Reply-To: <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
From:   Marco Elver <elver@google.com>
Date:   Tue, 28 Jun 2022 11:48:10 +0200
Message-ID: <CANpmjNPbHYKJqFB-qNjPWsLQyk3fWrqfU3qob_E-8KMLrzpCQQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] kfence: fix a kernel-doc parameter
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 28 Jun 2022 at 11:46, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> The kernel-doc markup is missing the slab pointer description:
>
>         include/linux/kfence.h:221: warning: Function parameter or member 'slab' not described in '__kfence_obj_info'
>
> Document it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

Thank you.

> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  include/linux/kfence.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 726857a4b680..9c242f4e9fab 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -210,6 +210,7 @@ struct kmem_obj_info;
>   * __kfence_obj_info() - fill kmem_obj_info struct
>   * @kpp: kmem_obj_info to be filled
>   * @object: the object
> + * @slab: pointer to slab
>   *
>   * Return:
>   * * false - not a KFENCE object
> --
> 2.36.1
>
