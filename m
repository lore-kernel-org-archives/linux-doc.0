Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B2DC43334
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 05:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236998AbiGZF1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 01:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbiGZF1d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 01:27:33 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86F327170
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 22:27:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id tk8so24165443ejc.7
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=1lqv5pxOonTNYCwK72aL+prgPMrbwRYc3I/dFCFgTYI=;
        b=mUdm7K/6pF3SsrJeOS6n/qjTr9aaiFG0qZUH8Cxcp1A1gp9B7s2L3yQWjkYwJDl6vM
         +/sLYOedziBEOQ3vGYofM9j1sQ0LoMqnHyJQwsDV1MWFXPq/PPcmA9XmRu2/qGWxWUCC
         SZ/HUukPWhveLbizRwK3Ii3poo/fG0DeYwTVOGnGd2dl4mxS867zIy1JfyZCgfnNy1ea
         NuZrDyB2MC/FVH80CAyv5L6jQeClYsX8DCizSMn2EJ36AgXWO9kodaCwADeOr2iF1bAR
         G/ZbtMQkAxI9vGlUYuq21YJxhGYrrZuxLYXMk/RqiK51/QOGcbTnEpSOUeOKdi+4Drw6
         VTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=1lqv5pxOonTNYCwK72aL+prgPMrbwRYc3I/dFCFgTYI=;
        b=NAfxfHeUQaGpG7LJuAtRZLI2hKHyGseq5RSblmWJow9XDz1j8kNYf3gZYsbf1PhOf+
         FBLWmyJf3GT66p/RleMwhAnlKdkjKpvr8/qiNyPflq+gyentPjxzrtHaBY3b1f7IBpjD
         uCu9PVx5PahRXpt9HXp4TP0Oqyt/LPy1HFET3CvgRAfE02RpOMOAFc7fZs/7/1seba3c
         JVjodJFKl/SPPR4qAMkyCq896hCmCkW4wmNfD15kLQJI8j/pUdkkhlsgxI6tUPSWJtgk
         jXWnBty0eY7V9S651pt2RQxOMdxiwMBZZNAX91Hh/qx4ZDIz8WzxzfK55AVuii37q9IY
         0wXg==
X-Gm-Message-State: AJIora/Olx8ng7k8vP8IjRqYpWhXjqcFeFC3UF1EMUXtjZTzA1RG2t5I
        vH34MXzjE2i4iEr5tHZZMtTS+L34Au0NUNJozKPa2A==
X-Google-Smtp-Source: AGRyM1tKheD0gYF1kFqg8ml2RAWRcyAfy5otPkV6uCVPltfbeDkQ4ypOV2oLIfzbcfjj3QWORE1oGqkyWIhhWBlX35Q=
X-Received: by 2002:a17:907:2c61:b0:72b:3a12:5121 with SMTP id
 ib1-20020a1709072c6100b0072b3a125121mr12659486ejc.52.1658813246120; Mon, 25
 Jul 2022 22:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220720185719.273630-1-mairacanal@riseup.net>
In-Reply-To: <20220720185719.273630-1-mairacanal@riseup.net>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 26 Jul 2022 01:27:14 -0400
Message-ID: <CAFd5g45ur97hajOqLctnRNQkaYfRXfacdUpRY9mw8X6ot8OPjA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] Documentation: KUnit: Fix example with
 compilation error
To:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Cc:     Jonathan Corbet <corbet@lwn.net>, davidgow@google.com,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 20, 2022 at 2:57 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> The Parameterized Testing example contains a compilation error, as the
> signature for the description helper function is void(*)(const struct
> sha1_test_case *, char *), and the struct is non-const. This is
> warned by Clang:
>
> error: initialization of =E2=80=98void (*)(struct sha1_test_case *, char =
*)=E2=80=99
> from incompatible pointer type =E2=80=98void (*)(const struct sha1_test_c=
ase *,
> char *)=E2=80=99 [-Werror=3Dincompatible-pointer-types]
> 33 | KUNIT_ARRAY_PARAM(sha1, cases, case_to_desc);
>    |                                ^~~~~~~~~~~~
> ../include/kunit/test.h:1339:70: note: in definition of macro
> =E2=80=98KUNIT_ARRAY_PARAM=E2=80=99
> 1339 |                         void
>    (*__get_desc)(typeof(__next), char *) =3D get_desc; \
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>

Thanks!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
