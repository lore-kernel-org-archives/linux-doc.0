Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4E3C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 02:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242110AbiC3CuM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 22:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238525AbiC3CuK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 22:50:10 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5B4E10
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 19:48:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id b19so27277207wrh.11
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 19:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EsX1yG2UY6dKQjdKv6REamOui6sEFEfZYszWn7TYwFQ=;
        b=AeOcNN3TyAZRveUSpBoasKR41s2C51M7345EFMNl2cOgld40Kbjpp0y9767/7ryykU
         UiI/f6e5L84/1Yc4BGm9y3RjPs480QrdIPdMdn1YAZ9Su/mAIvRjaGhWH2PUC9hsJH7X
         Lu6OGequi3R4kpWmn9HtowHTzbUE9dpKnnyHCeXqPfgYzulVgybneHscpZU+xnh19Q6d
         rVFV9WB9B4m/7hnOYczjD8x0x0JPg5F83UJNR28qdLBCFhzQDvrTNXU+dkDIIuJayEer
         lh4Ls31qHB5Y3F/WF2vpNxefEQz1lsaKypoCl/584X2DxzwObkXtXPy9Z0pW4MUEHYH2
         A5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EsX1yG2UY6dKQjdKv6REamOui6sEFEfZYszWn7TYwFQ=;
        b=STNZ/NI/b1FMGbJqmimDeP8DUJaVaj3ZubiqrkiBCBiFAUooq49qV1mVI7JVVN4TlJ
         A7xXDff9e/saUXS3i0zUM4RKfezqqENkYybEoli0+iXqBHOWYBHaRPWe1KsW+jbhw3CT
         TWeh+aOkrI8rANHO+Vb1SIY3wTUHJpXRkgPXGKokyK16L7evEb09W9y0vtnMBkYc7/fF
         RjOIPrV1ff3hJpzIZenoskHTWDdd8+kx5H6xLp/CREASkOTKYWsajHvhBOFW71EURTVF
         hx7cb98rUe9qa0p8mvixrqBYVRB/7etOaVnth19flMOZvIVXeuSrFuPeBwyx5I/P+Mq/
         LCpg==
X-Gm-Message-State: AOAM530kPSdHGyGOaZdt3VJ7/yi1849iVhgBj6cSjRHIR/VFXPvM+Yy5
        z++nhNJ+NVPeaMFSoySZMQ7ew4CemPw8OEuPYYqV/pL/N4ztzg==
X-Google-Smtp-Source: ABdhPJyFsvJGvTTAK3+q9dyt4LqD1Wr9tAnEeGd6ZSRdSLYdDJeRdtffEwK9SI/OU0xdqE15FFti1TL4Zr9nxp+kExk=
X-Received: by 2002:a5d:4537:0:b0:204:b35:fa8 with SMTP id j23-20020a5d4537000000b002040b350fa8mr36802985wra.430.1648608504388;
 Tue, 29 Mar 2022 19:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648593132.git.marcelo.schmitt1@gmail.com> <11f4750c6d4c175994dfd36d1ff385f68f61bd02.1648593132.git.marcelo.schmitt1@gmail.com>
In-Reply-To: <11f4750c6d4c175994dfd36d1ff385f68f61bd02.1648593132.git.marcelo.schmitt1@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Wed, 30 Mar 2022 10:48:13 +0800
Message-ID: <CABVgOSkb5CpnXDF_m7iy=A7RmN+KmY0T38TeZ4hKbmkdQgt6Yw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Documentation: dev-tools: Enhance static analysis
 section with discussion
To:     Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-sparse@vger.kernel.org, cocci@inria.fr,
        smatch@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 30, 2022 at 7:23 AM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Enhance the static analysis tools section with a discussion on when to
> use each of them.
>
> This was mainly taken from Dan Carpenter and Julia Lawall's comments on
> the previous documentation patch for static analysis tools.
>
> Lore: https://lore.kernel.org/linux-doc/20220329090911.GX3293@kadam/T/#mb97770c8e938095aadc3ee08f4ac7fe32ae386e6
>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Julia Lawall <julia.lawall@inria.fr>
> ---

Thanks: this sort of "when to use which tool" information is really
what the testing guide page needs.

I'm not familiar enough with these tools that I can really review the
details properly, but nothing stands out as obviously wrong to me.
I've made a few comments below regardless, but feel free to ignore
them if they're not quite right.

Acked-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  Documentation/dev-tools/testing-overview.rst | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentation/dev-tools/testing-overview.rst
> index b5e02dd3fd94..91e479045d3a 100644
> --- a/Documentation/dev-tools/testing-overview.rst
> +++ b/Documentation/dev-tools/testing-overview.rst
> @@ -146,3 +146,36 @@ Documentation/dev-tools/coccinelle.rst documentation page for details.
>
>  Beware, though, that static analysis tools suffer from **false positives**.
>  Errors and warns need to be evaluated carefully before attempting to fix them.
> +
> +When to use Sparse and Smatch
> +-----------------------------
> +
> +Sparse is useful for type checking, detecting places that use ``__user``
> +pointers improperly, or finding endianness bugs. Sparse runs much faster than
> +Smatch.

Given that the __user pointer and endianness stuff is found as a
result of Sparse's type checking support, would rewording this as
"Sparse does type checking, such as [detecting places...]" or similar
be more clear?

> +
> +Smatch does flow analysis and, if allowed to build the function database, it
> +also does cross function analysis. Smatch tries to answer questions like where
> +is this buffer allocated? How big is it? Can this index be controlled by the
> +user? Is this variable larger than that variable?
> +
> +It's generally easier to write checks in Smatch than it is to write checks in
> +Sparse. Nevertheless, there are some overlaps between Sparse and Smatch checks
> +because there is no reason for re-implementing Sparse's check in Smatch.

This last sentence isn't totally clear to me. Should this "because" be "so"?

> +
> +Strong points of Smatch and Coccinelle
> +--------------------------------------
> +
> +Coccinelle is probably the easiest for writing checks. It works before the
> +pre-compiler so it's easier to check for bugs in macros using Coccinelle.
> +Coccinelle also writes patches fixes for you which no other tool does.
> +
> +With Coccinelle you can do a mass conversion from

(Maybe start this with "For example," just to make it clear that this
paragraph is mostly following on from how useful it is that Coccinelle
produces fixes, not just warnings.)

> +``kmalloc(x * size, GFP_KERNEL)`` to ``kmalloc_array(x, size, GFP_KERNEL)``, and
> +that's really useful. If you just created a Smatch warning and try to push the
> +work of converting on to the maintainers they would be annoyed. You'd have to
> +argue about each warning if can really overflow or not.
> +
> +Coccinelle does no analysis of variable values, which is the strong point of
> +Smatch. On the other hand, Coccinelle allows you to do simple things in a simple
> +way.
> --
> 2.35.1
>
