Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E99C001B2
	for <linux-doc@archiver.kernel.org>; Wed, 14 Dec 2022 17:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236910AbiLNRlc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Dec 2022 12:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237544AbiLNRl3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Dec 2022 12:41:29 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D16928E29
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 09:41:27 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id o127so604596yba.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 09:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0pzIXqtCSP5BhXl91JWX0th+uLCttVTq944NZd+G/g=;
        b=Rr3Dv2MEorup2HoTxjUzemEffSaYNNtOiQTCDx8Udx9Ue7bImsJ/xybk4UJ2fYiP4P
         olyWKTMrerRfQNLeveBB/PF8pi6etoJBB09AlnU13OytKhb4n7DVcJQ9rarDUgqYl2tb
         qb22xgbngSqLsgHHJlrfl6u6n5wnhOoub+XOLBOqpW4cnxdbgpl8OxhBg0L1l++qJJFM
         xqjf1V8otf3al1CALBKGbEUx769u13OKaEaS3T0ysLCZvLN3I0mHCr29CSh4eEFxAVJ4
         VlgtyIy73mP5R2CbWQ/yTiNN9DrlzHDl6K0NCYwK1D+hwEBr056dLQP2ITnYi/bskEKy
         8Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0pzIXqtCSP5BhXl91JWX0th+uLCttVTq944NZd+G/g=;
        b=yFpJPUCmSWkNqKoaPFND79MVBKbfqsoD26A6TvA+GExQ63guXo5N6KEzxK5A+Tkgro
         h6ztkZRnAn8y5fGVSpGZ7fsuuxohFn2zVzyfj7IyLtTDZ536hf37llbqsalq5kAssHQr
         jMuEbNu31T8/TPjdi7ZIY3euSTbnWZTx6OLBEs0mpvjNk9/dHriU1CNp3SKTA4Hv9JUR
         8kSUy+YxYFPHB+53HVmamA6nYeVpf0TElXL8qxy/GfbFr7BcMpEESeQo5cMlyr+zVFT7
         3jOk01QhSYkbuhpiUQwVU5Y8BTrHNADAMECvkLAE1RKpDXsXDy/Q3AWz3f+hWIC4jUI5
         b/Gw==
X-Gm-Message-State: ANoB5pkTc8Xd0o8M3R5V5Yiy5PUXv4d/+TmM+v3pwfUKNoMymwRHfU1S
        NxqzwxtZKRDrH1HZulPDMJVpa6xlskwKHQPpwmCbzg==
X-Google-Smtp-Source: AA0mqf69oXdmKWJAfPefpo7KpkzHuaJWGX2rYmP2D46nMlMw3xkxWCB7JT6qaFTmfgiph12mt/cL6YMSSUv3fJatgCk=
X-Received: by 2002:a25:5091:0:b0:703:8471:c745 with SMTP id
 e139-20020a255091000000b007038471c745mr13651067ybb.358.1671039686305; Wed, 14
 Dec 2022 09:41:26 -0800 (PST)
MIME-Version: 1.0
References: <Y5fdgI4uTpXZQ9yn@mail.google.com> <Y5jf59VCL/HAt60q@mail.google.com>
In-Reply-To: <Y5jf59VCL/HAt60q@mail.google.com>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Wed, 14 Dec 2022 09:40:50 -0800
Message-ID: <CAHVum0eNp5Dup_KyrS2N0zu5TfrtcCxphRnLuBFZa5PxahVg7A@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/tags.sh: choose which directories to exclude
 from being indexed
To:     Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 13, 2022 at 12:26 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> It's common for drivers that share same physical components to also
> duplicate source code (or at least portions of it). A good example is
> both drivers/gpu/drm/amdgpu/* and drivers/gpu/drm/radeon/* have a header
> file called atombios.h.
>
> While their contents aren't the same, a lot of their structs have
> the exact same names which makes navigating through the code base a bit
> messy as cscope will show up 'references' across drivers which aren't
> exactly correct.
>
> Add IGNORE_DIRS variable, which specifies which directories
> to be ignored from indexing.
>
> Example:
>         make ARCH=x86 IGNORE_DIRS="drivers/gpu/drm/radeon tools" cscope
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Changelog:
>
> - v3: change commit message wording and rst syntax (Req Bagas Sanjaya)
>       change makefile variable scope to global, use blank space
>       separator and change variable name to IGNORE_DIRS.
>       (Req: Vipin Sharma)
> - v2: change approach to include everything unless specified by the
>   IGNOREDIRS variable: (Req: Vipin Sharma)
> - v1: https://lore.kernel.org/lkml/Y5OKDvbGk4Kro6MK@mail.google.com/
> ---
>  Documentation/kbuild/kbuild.rst | 7 +++++++
>  scripts/tags.sh                 | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 08f575e6236c..5202186728b4 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -278,6 +278,13 @@ To get all available archs you can also specify all. E.g.::
>
>      $ make ALLSOURCE_ARCHS=all tags
>
> +IGNORE_DIRS
> +-----------
> +For tags/TAGS/cscope targets, you can choose which directories won't
> +be included in the databases, separated by blank space. E.g.::
> +
> +    $ make IGNORE_DIRS="drivers/gpu/drm/radeon tools" cscope
> +
>  KBUILD_BUILD_TIMESTAMP
>  ----------------------
>  Setting this to a date string overrides the timestamp used in the
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index e137cf15aae9..1ad45f17179a 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -17,6 +17,13 @@ ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
>  # tags and cscope files should also ignore MODVERSION *.mod.c files
>  ignore="$ignore ( -name *.mod.c ) -prune -o"
>
> +# ignore arbitrary directories
> +if [ -n "${IGNORE_DIRS}" ]; then
> +       for i in ${IGNORE_DIRS}; do
> +               ignore="${ignore} ( -path $i ) -prune -o"
> +       done
> +fi
> +
>  # Use make KBUILD_ABS_SRCTREE=1 {tags|cscope}
>  # to force full paths for a non-O= build
>  if [ "${srctree}" = "." -o -z "${srctree}" ]; then
> --
> 2.38.1
>

Thanks for the patch.

Reviewed-by: Vipin Sharma <vipinsh@google.com>
