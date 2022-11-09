Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82ABC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 19:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbiKITAX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 14:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiKITAW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 14:00:22 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3CF193EA
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 11:00:21 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id x20so5688575ual.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Nov 2022 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eyqj5Jkn+QU8JX/eVyhIjwJDgl9qoKywJIr523tqZEs=;
        b=C9Sg8lsh7A6ZNuU/q1kVTTqvhpVxBuq+mN3Mft2ubXmV8MgR2MSQhx/wmxrd7RABs3
         SvB1Xr/knTjSP3/NXkfksMLwlhPZY7ZTOOwIFff0v6FvTZkuF5NbUDncnFPhd0nojqbw
         sz8X8JyLhXfMkw06jmAcvUD/q2Z+NKVrj1DLnS92ZmBLcWBdLnsHbMmtyz1EzOuOKW5a
         vcABfRjwe4XK4+ymIR+OMSe7cBeAHhtqqEUCARFfpeTXnfmUJPvClr/uSAJogOwT/GxE
         SQx1hAXpptlG5k/3IQ7Zwtr71NFtXy52Nx2FS6KzK4TplHHQDxZJWTs9SwXs2eVjBhAu
         Rysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyqj5Jkn+QU8JX/eVyhIjwJDgl9qoKywJIr523tqZEs=;
        b=tkH3m7QXsCaAFc+6FGxOVrVLRPffCCu2FGBQr8Wnm2/beNr7+ukCrMk5x+qYHmmuJ6
         poprEl0YsCVcNHs8K3Syg7jNBolQeYoCq9vT93v+wcHAW9yFigsfeVnai/aqvqZ1xeQn
         5oeUYWqBgjMAW9vn69hque4lOn17JwXQP4KeuZXxhreLmu+wjzNE3DLZ++gx1BaE6ZIs
         XAGd0evJeuqR2qFSxoeJ3+vXy4JRflnUDiT7i/onG9UVOBliInPBcv8OrYugJPf6VvgZ
         S7G3PMO+POeaUW/136EKA5QMC9C1NCnNCGt3Lx0DIVgEnCskpVyl4kbOGZxB5sdTf/Kx
         Liqg==
X-Gm-Message-State: ACrzQf1p+hGmgyCP1TDp3YDrVSrzEl6ueM5LGthXtXlp4qwAtcn785Ns
        fwKtvmL38nR2xFLPmsyIkbrlORqoT/QdT01CFROZc+A9Klc=
X-Google-Smtp-Source: AMsMyM7MjH/bA/pYzIWosrLpJ/lOGMfJkcByi7Uy8E50nTyuN1/KwRYB9mO/vC3YZaT8uUFYyYP0Fr0V6huUR0aStr8=
X-Received: by 2002:ab0:390f:0:b0:3af:3c62:bea2 with SMTP id
 b15-20020ab0390f000000b003af3c62bea2mr20272777uaw.21.1668020420509; Wed, 09
 Nov 2022 11:00:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:7701:0:b0:406:459d:3900 with HTTP; Wed, 9 Nov 2022
 11:00:19 -0800 (PST)
In-Reply-To: <20221012203938.909734-1-martin.fernandez@eclypsium.com>
References: <20221012203938.909734-1-martin.fernandez@eclypsium.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 9 Nov 2022 16:00:19 -0300
Message-ID: <CAKgze5ZBq+NJY2byQt_Wi9sr0K7Ouzgzy6pt0SWgCcB50FnWSw@mail.gmail.com>
Subject: Re: [PATCH v4] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        rdunlap@infradead.org, bagasdotme@gmail.com, akiyks@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/12/22, Martin Fernandez <martin.fernandez@eclypsium.com> wrote:
> Add a description, an example and a couple of options when it is safe
> to ignore it.
>
> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst
> b/Documentation/dev-tools/checkpatch.rst
> index c3389c6f3838..678c1956468b 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -854,6 +854,32 @@ Macros, Attributes and Symbols
>                ...
>        }
>
> +  **MACRO_ARG_REUSE**
> +    Using the same argument multiple times in the macro definition
> +    may lead to unwanted side effects.
> +
> +    For example, given a min() macro defined like::
> +
> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
> +
> +    If you call it with ``min(foo(x), 0)``, it would expand to::
> +
> +      foo(x) < 0 ? foo(x) : 0
> +
> +    If foo has side effects or it's an expensive calculation the
> +    results might not be what the user intended.
> +
> +    When it's safe to ignore:
> +
> +    - If the macro arguments of all uses of this macro are free of
> +      unintended side effects. Passing a constant value is usually
> +      fine, as the compiler will use constant propagation and further
> +      optimizations to produce acceptable code.
> +
> +    - If you defined local variables that will hold the value of each
> +      argument in the macro's definition. See the min() macro in
> +      include/linux/minmax.h for example.
> +
>    **MISPLACED_INIT**
>      It is possible to use section markers on variables in a way
>      which gcc doesn't understand (or at least not the way the
> --
> 2.30.2
>
>

Sending it again since I've got no response
