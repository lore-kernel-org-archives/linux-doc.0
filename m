Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78ADD7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 16:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbeK3D2S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:28:18 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:44724 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbeK3D2S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 22:28:18 -0500
Received: by mail-vk1-f193.google.com with SMTP id h128so556764vkg.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H5iZCb/jQuRxfC7XtcqJX5GlNhGwGUuM4Ahq2RpJ4Pw=;
        b=aq/5lykwEnY7sG1Yfo9J5DKtzzDDSf6YVMz/6GPYhWoxGq6OJ/rEWT/FN7GJ0ORGHV
         MSZ1v3JYmWCDFKmvNGAbrVYcUhf5RNd4NBzPSn6S3o75kyq66p9AN7neiU1OvP4kA5nU
         RvJS0U031pSjEubOc9BsFwQWgfBU9qszezbNQxg0csoOr/z8x+XN0bcBzJ/zJsIaWj4W
         BON/ovrXpPurICHHB0cPh0MspZU8qtRlVXzLyay6DvbjzvKag6U12pIMLUgBHLKKNdkn
         5+wpMscwjIEsan6/87rlMYCFZSxkiDlwkKujL0CmffrsB4k4wFPb+e1jgUT25ApWXLr/
         VX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H5iZCb/jQuRxfC7XtcqJX5GlNhGwGUuM4Ahq2RpJ4Pw=;
        b=BethCed9p7RD9gOVF3p5e0cF9u4hjwqL1arPY4WlQYrrxFHvxegYDpRGR/wEh90upl
         F0ulaSUDlf8AN2Z6F/hI5cnSbx9vSmFM/CcDsN1zRdpKnsw7/PKKJIBDVJ9tpYU1ftLb
         0BQGTMQl5erln5dhggPXCyMd9OjZa4YC7N/1M9gRh28nqGuatoCvxs1G4TA4XrlLotXJ
         VYVLO9eS+4tlvFvDn/66Auk7CF1u1euQ3TvT4Z2lXauOI2eJEgOaljJaD3N9jODUZw73
         onFR9McLaHJVMZY9KeTGm6483Ffgi/iTLtlPnMEXYH2tOhL+8QrEdZttMzinnWVXpEnT
         BTkg==
X-Gm-Message-State: AA+aEWYZmfq1+huenx1lq8o6k9ETqIdpVESJ8yCf6tZHLJN6ogsB3Mb6
        7Qm4YU0fEzvW1caXLZ6QOMyCbie28UzvTs1Eq3lksg==
X-Google-Smtp-Source: AFSGD/Ud/B6KPE80kccxAhIHycC3z3f1FPI7eD3qlT/opE1ZRkqRY++ZU+j4K1S0HUtgszZV6SeMOa0k306ZBR5rzzg=
X-Received: by 2002:a1f:6306:: with SMTP id x6mr882045vkb.26.1543508543257;
 Thu, 29 Nov 2018 08:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20181129155522.33749-1-sean@poorly.run> <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
 <CAMavQKLVipXjNEycU9SXNEM3imdHco2nMh0sLxVdnO9zqHdd9Q@mail.gmail.com> <5876d520-021d-47ad-b9d1-0938d154ca18@gmail.com>
In-Reply-To: <5876d520-021d-47ad-b9d1-0938d154ca18@gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Thu, 29 Nov 2018 11:21:47 -0500
Message-ID: <CAMavQKLJ-ZD51oYzEzwFMHrRnM0hsLAaAayijphfat9w73rbJQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: drm: Remove dangling pointer from drm-mm.rst
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alex Deucher <Alexander.Deucher@amd.com>,
        Huang Rui <Ray.Huang@amd.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Junwei Zhang <Jerry.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 29, 2018 at 11:14 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 29.11.18 um 17:11 schrieb Sean Paul:
> > On Thu, Nov 29, 2018 at 10:58 AM Koenig, Christian
> > <Christian.Koenig@amd.com> wrote:
> >> Am 29.11.18 um 16:55 schrieb Sean Paul:
> >>> From: Sean Paul <seanpaul@chromium.org>
> >>>
> >>> Fixes htmldocs build error:
> >>> Error: Cannot open file ../drivers/gpu/drm/drm_global.c
> >>>
> >>> Fixes: 2bb42410b1bd ("drm: Remove drm_global.{c,h} v2")
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Junwei Zhang <Jerry.Zhang@amd.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> >>> Cc: Sean Paul <sean@poorly.run>
> >>> Cc: David Airlie <airlied@linux.ie>
> >>> Cc: Christian Koenig <christian.koenig@amd.com>
> >>> Cc: Huang Rui <ray.huang@amd.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>
> > Thanks for the review. Perhaps the best course of action for this
> > patch is to have Dave pick it directly and then we can backmerge it
> > into amdgpu/drm-misc-next from there? I could also spin a topic branch
> > that we could all merge.
> >
> > Thoughts?
>
> My preference is that I pick it up and push it to Dave through Alex
> fixes push.
>
> But just because the patch which broke this came the same way as well.
>

Yeah, unfortunately it's proliferated, and I'd rather not add hops to
getting drm-misc-next fixed. Let's just do a topic branch and set a PR
to Dave from that. We can both merge the topic branch asap and let
Dave pick it up at his leisure.

Sean

> Either way works for me,
> Christian.
>
> >
> > Sean
> >
> >>> ---
> >>>    Documentation/gpu/drm-mm.rst | 3 ---
> >>>    1 file changed, 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.=
rst
> >>> index d0f3c6b032009..54a696d961a7c 100644
> >>> --- a/Documentation/gpu/drm-mm.rst
> >>> +++ b/Documentation/gpu/drm-mm.rst
> >>> @@ -79,9 +79,6 @@ count for the TTM, which will call your initializat=
ion function.
> >>>
> >>>    See the radeon_ttm.c file for an example of usage.
> >>>
> >>> -.. kernel-doc:: drivers/gpu/drm/drm_global.c
> >>> -   :export:
> >>> -
> >>>
> >>>    The Graphics Execution Manager (GEM)
> >>>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
