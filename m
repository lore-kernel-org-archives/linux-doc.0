Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8424C63793
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 15:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96E206127C
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 15:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhGVPM7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 11:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbhGVPM6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 11:12:58 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D3C061575
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 08:53:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g22so9316076lfu.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nvKgUGZ8dHrrAxHxECsxj0Peq9yhI13yLrZ6U9CDzxM=;
        b=mfTs1uaODa84ajfFeGO0GG3su6ncfRFI6rBY9Dfw8KpTiiyLwyOtZwgf0g0LqFXDyF
         uFNkvYunmR9XP0r4kc68ixD03EzGuyMIym6YTC3G6kzpQ7dvUCybcP6tNT9J8PVJeTEj
         kUDnp1rizP5BYx1LSCR0+9KBbPiPwVZWKU3B7A+Ar8MfuL/282OgcYxUodvqjJOCg2Zn
         BPONIu9xiDESpJn+ZQOvhLXSmeG6oMG8PUKeWn0li29qHw19h6tpJ2U9dm8TcT5Jc8qO
         Mg33sVGTVAxIcAMDYY1yo52GgbCM+lM+hQ64VakwXwFc/4f9OmBONXifKNgw2SRg6IPZ
         v//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nvKgUGZ8dHrrAxHxECsxj0Peq9yhI13yLrZ6U9CDzxM=;
        b=tCBaJDfOcTcy/hFhh1SA5OhywhrVlTG8whFlVJaAxQmoNdDDGSUK6b0Xcwh1yegj/Z
         5jsY3xg7TN+slLBKOWt+AWNXxTr8YrcSS0dIMZ/OAayad6I6wpcHCWTSdlBkeH4PIc6B
         7PRu03vV5RKsTyj0FKOcg+uiLt7E56wP/x59TBxgQjbvllecYBokEwCjEdxiNICq7wjP
         mTdTvlCqw9aieduMS77GzdDsB6LkAAUssVnxDinuI0qCztzsI6x5grnKlBP8wd8qeOD5
         4aJhOy6AiW4z9+qinGNC7hcbUQaKfMm0J+ewGUSSOfex6z7ERgKh42KOkdryd0XWOUMC
         WA/g==
X-Gm-Message-State: AOAM533VavOl94JMib89K7i3vLahbl/zv5LYV05tG6YTKGy8DCydi+rl
        YSYw0wAi5eNb95w+7yIh1MOEYINsW7cC3RT3p7ysrQ==
X-Google-Smtp-Source: ABdhPJwztP/nDRiAi2XVO/E1s71u12JwkcrY3UN9gVaD/anjEd2qYahP/ngehakTIXd4486Xt1LefOqDufmt3pJPjG8=
X-Received: by 2002:a05:6512:3b9a:: with SMTP id g26mr119654lfv.646.1626969209115;
 Thu, 22 Jul 2021 08:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210722100356.635078-1-ciorneiioana@gmail.com> <20210722100356.635078-4-ciorneiioana@gmail.com>
In-Reply-To: <20210722100356.635078-4-ciorneiioana@gmail.com>
From:   Jing Zhang <jingzhangos@google.com>
Date:   Thu, 22 Jul 2021 08:53:17 -0700
Message-ID: <CAAdAUtjRpWj2fSRjiuOoqEswm=yk0dx+K8rVv2CeqOMEkyBTwg@mail.gmail.com>
Subject: Re: [PATCH 3/4] docs: kvm: properly format code blocks and lists
To:     Ioana Ciornei <ciorneiioana@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 3:03 AM Ioana Ciornei <ciorneiioana@gmail.com> wrote:
>
> From: Ioana Ciornei <ioana.ciornei@nxp.com>
>
> Add a '::' so that a code block is interpreted properly and also add a
> blank line before the start of a list.
>
> Fixes: fdc09ddd4064 ("KVM: stats: Add documentation for binary statistics interface")
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  Documentation/virt/kvm/api.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 535ac0efd1b0..c8225466f379 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5201,6 +5201,7 @@ trailing ``'\0'``, is indicated by the ``name_size`` field in the header.
>  The descriptors block is only needed to be read once for the lifetime of the
>  file descriptor contains a sequence of ``struct kvm_stats_desc``, each followed
>  by a string of size ``name_size``.
> +::
>
>         #define KVM_STATS_TYPE_SHIFT            0
>         #define KVM_STATS_TYPE_MASK             (0xF << KVM_STATS_TYPE_SHIFT)
> @@ -5234,6 +5235,7 @@ by this descriptor. Its endianness is CPU native.
>  The following flags are supported:
>
>  Bits 0-3 of ``flags`` encode the type:
> +
>    * ``KVM_STATS_TYPE_CUMULATIVE``
>      The statistics data is cumulative. The value of data can only be increased.
>      Most of the counters used in KVM are of this type.
> @@ -5252,6 +5254,7 @@ Bits 0-3 of ``flags`` encode the type:
>      The corresponding ``size`` field for this type is always 1.
>
>  Bits 4-7 of ``flags`` encode the unit:
> +
>    * ``KVM_STATS_UNIT_NONE``
>      There is no unit for the value of statistics data. This usually means that
>      the value is a simple counter of an event.
> @@ -5266,6 +5269,7 @@ Bits 4-7 of ``flags`` encode the unit:
>
>  Bits 8-11 of ``flags``, together with ``exponent``, encode the scale of the
>  unit:
> +
>    * ``KVM_STATS_BASE_POW10``
>      The scale is based on power of 10. It is used for measurement of time and
>      CPU clock cycles.  For example, an exponent of -9 can be used with
> --
> 2.31.1
>
Reviewed-by: Jing Zhang <jingzhangos@google.com>

Thanks,
Jing
