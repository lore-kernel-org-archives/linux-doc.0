Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE37C4741F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F3592076A
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JndInnWp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgI3VDi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3VDi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 17:03:38 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678C4C061755
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 14:03:38 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id s19so2341860ybc.5
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oUkGb/zQmshcq7ZJh1yZhPj0UxQQipG2VPSR+vnHzZc=;
        b=JndInnWpkr8t80BkW9gUPR9Jj89HXBjgg6DcE1sZPj7XOSNJ5s5tff7Ry/sjmYmMJb
         umOTX6VEtwF2OvQffs6BnbSEc97uYOmFLJ5RHYviQW8b8mJaV0rpsQ1dTlVpAc82DoiP
         3zHdSydTIDs/78LZbdlxdannnUbNgYE8Y7YwAV+myQ9Bxq8u6YHuqN0OMiObGbHmFB71
         Hy57ohCEPGgL/K9FwoPoY2Y6cZvOh8B8yKTCdeXkF2vidYxOJkE4+eQ8gRfbrCFe2wHa
         I/H2m0cQjtf5ta8LMWyplZhVu4AO6RjZT5nxR9DlcNUK9kH1uOmacDXGbFZO6PrTYMQM
         jr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUkGb/zQmshcq7ZJh1yZhPj0UxQQipG2VPSR+vnHzZc=;
        b=QHW0T5gg0qJL8TYhq57FhSpk9+WPolhjrJDj1Ngq97EtDEVdT9686y4+Y9SsjvTEkm
         UiMoBenjXVE+NhuWtunSsrjEwSkqeUBys5HRhCybvhkdybbx9i2M7SxJ1e+ZN+Y5hrud
         dm2oquqzi7pA5xgDMlV5PdySsNECT6t2tgqxc6taJYLpUO5DuI3WMbEOxSPF7q/+eJo2
         JPdqVCaeW1gz6apb+ai+2cJDXF1e3v7ZT1zS97xpLsVG5ozMeXtDrRaYkeYzX3MzT05v
         oWBa6vMwOUBIGS3vdyZS13xIPW2yHI5NxoFoNvcdKceCOocWE3fDDi2EP8sj7XJr5aPG
         yaSQ==
X-Gm-Message-State: AOAM531q5D29M8lLhG6txNl2TOH2l7pwQ32YaXAZ5HzbeLpv40dwbviu
        SPU8M0L8UmNytdIcMF2A9Zi1xDBKG66yVI+djh/8oMkhvUcUeQ==
X-Google-Smtp-Source: ABdhPJz0yWYBj9ZwI5k3Sl23q2cg00dXG/tN18YAf3DLVxIjbeBmZvdeQGM085E16Y3uD3JrFBkUx6Q4iupSR/bb3c4=
X-Received: by 2002:a25:dbd3:: with SMTP id g202mr5479143ybf.310.1601499817454;
 Wed, 30 Sep 2020 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601467849.git.mchehab+huawei@kernel.org> <432ab85d294936e5e9f39524efc7a3a55cd3df2e.1601467849.git.mchehab+huawei@kernel.org>
In-Reply-To: <432ab85d294936e5e9f39524efc7a3a55cd3df2e.1601467849.git.mchehab+huawei@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 30 Sep 2020 14:03:01 -0700
Message-ID: <CAGETcx9mcv3pN6FEt75Jswfyz5EZMNJvBpWmDunejcPFNut1AA@mail.gmail.com>
Subject: Re: [PATCH v4 31/52] docs: device_link.rst: remove duplicated
 kernel-doc include
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 6:25 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The infrastructure.rst file already includes the external
> symbols from drivers/base/core.c.
>
> Duplicating 3 functions there causes namespace collisions:
>
>         Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
>         Declaration is 'device_link_state'.
>         Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
>         Declaration is 'device_link_add'.
>         Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
>         Declaration is 'device_link_del'.
>         Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
>         Declaration is 'device_link_remove'.
>
> So, drop the reference, adding just a mention to the functions
> associated with device_link.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/device_link.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/device_link.rst b/Documentation/driver-api/device_link.rst
> index 76950d061632..ee913ae16371 100644
> --- a/Documentation/driver-api/device_link.rst
> +++ b/Documentation/driver-api/device_link.rst
> @@ -317,5 +317,4 @@ State machine
>  API
>  ===
>
> -.. kernel-doc:: drivers/base/core.c
> -   :functions: device_link_add device_link_del device_link_remove
> +See device_link_add(), device_link_del() and device_link_remove().

I just "copy paste" rst formatting because I've never bothered to
understand it. If these changes fix warnings, I'm okay with them. They
seem pretty harmless.

-Saravana
