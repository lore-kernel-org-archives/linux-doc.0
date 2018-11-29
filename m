Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 47A1F7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 16:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbeK3DSJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:18:09 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:33877 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbeK3DSJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 22:18:09 -0500
Received: by mail-vk1-f194.google.com with SMTP id y14so558489vkd.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 08:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T9C44Gii4+0hhIki3+1gEBYYlyWTILoYiV7dWWzeLVU=;
        b=e/9lvyldT6HLhhOKc0ghG5yTxAGzFylk8vi6CnkpvL6VEkCSKIcjMsmcUBQVAhSiBv
         FuCK3cWdFLvRZxAj63yrVKKk7uVwDAapgZn+8qRTyeyftZ5u36AjdTdaDoyragrkb/if
         GQdr2UoIlGhUP5rIwuVJhbh73LGqZ4S7uqWiYkhl6n9Lnz4Bp1YjUvTulzqdm4J216Nn
         9EM6IV54D2vzUfSGMhUMUVNcPJLQHNmCLrlgro6m1koW7f+J8U0ByOf5C3nvV0lQWbr3
         oAqfkknUwpcdRP4N73o7mr8IjsaxXz45PJnIAa2YSnqeswhrms+HxiLdM0f3uAieBJ8f
         Cq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T9C44Gii4+0hhIki3+1gEBYYlyWTILoYiV7dWWzeLVU=;
        b=MSz5PaE3IGizY4q6iI3UQl+pI6T5kzrsFqn0UoO7bloXKRVkjbCOuOEr/ut2NWFhCH
         x1d2DDq78Gfj8k5o8afrJnbgjkwMUWxtm9Fobb4gs8IKyHoZV62LRbwtgRvzuhf1XYSR
         EAqJQWtushqwvPn3eo8Ea3DsPetCyPcldC71J9z3CkJFerytujkrSx2YTBWWKl8GUONd
         rtZRTn7fx1ALOcTe2NblCt9/FcHr/j/BE+zAOo9Oi6Cuuvn1shFeLAxNCFE8ZgFgyNV+
         xI9wD2+kDMl8EyhbhiPp4Yf2L3TDmpgheVA+tZlsozcyqEpkB/RaPbpySpGRw9Li/5s/
         /1HA==
X-Gm-Message-State: AA+aEWZwnZroHdeIOxtZf+ewFBL8UBV3hzTbbIBNx5ZwqDXeuqtsGX5X
        KQxwfCmEnsjgirgPUz4e4RKOObPOn2efJ426zEX8WA==
X-Google-Smtp-Source: AFSGD/ULr58Pd3norv3Lh8ByUrF8XU6nb5PFvwmZJQ6ZzrcMDFV9S1uru786MI36889lmCIUsHzhej3T6BUCXT5+l3s=
X-Received: by 2002:a1f:9c81:: with SMTP id f123mr828298vke.85.1543507936126;
 Thu, 29 Nov 2018 08:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20181129155522.33749-1-sean@poorly.run> <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
In-Reply-To: <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
From:   Sean Paul <sean@poorly.run>
Date:   Thu, 29 Nov 2018 11:11:40 -0500
Message-ID: <CAMavQKLVipXjNEycU9SXNEM3imdHco2nMh0sLxVdnO9zqHdd9Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: drm: Remove dangling pointer from drm-mm.rst
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        Alex Deucher <Alexander.Deucher@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Airlie <airlied@linux.ie>, Huang Rui <Ray.Huang@amd.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 29, 2018 at 10:58 AM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 29.11.18 um 16:55 schrieb Sean Paul:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Fixes htmldocs build error:
> > Error: Cannot open file ../drivers/gpu/drm/drm_global.c
> >
> > Fixes: 2bb42410b1bd ("drm: Remove drm_global.{c,h} v2")
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Junwei Zhang <Jerry.Zhang@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>

Thanks for the review. Perhaps the best course of action for this
patch is to have Dave pick it directly and then we can backmerge it
into amdgpu/drm-misc-next from there? I could also spin a topic branch
that we could all merge.

Thoughts?

Sean

> > ---
> >   Documentation/gpu/drm-mm.rst | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rs=
t
> > index d0f3c6b032009..54a696d961a7c 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -79,9 +79,6 @@ count for the TTM, which will call your initializatio=
n function.
> >
> >   See the radeon_ttm.c file for an example of usage.
> >
> > -.. kernel-doc:: drivers/gpu/drm/drm_global.c
> > -   :export:
> > -
> >
> >   The Graphics Execution Manager (GEM)
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
