Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAE9C83F3E
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 19:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242150AbjIETRK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242195AbjIETRJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 15:17:09 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6091B6
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 12:16:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500760b296aso225258e87.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Sep 2023 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693941354; x=1694546154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsWRVBFEL3St6TG3Dmm9kVxN1Ow0LMYu4TSTEd74xWc=;
        b=IO9Q2ewZ1xt/BTnwyavEoLvmjlUq6z1lRdxDEdhtxR+IUgaZFhahJ7rjZ4Mk3GxE2V
         sHB6yLG4NXgtaLjXsflrsFsUWmAPZ0x8oi4a3rAMgSInx3tsZAsqiPXLBOQW4npkG5V5
         AmCGF7qAXJ1ckGjEy3ka5U9adKZ1wjETI9aO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941354; x=1694546154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsWRVBFEL3St6TG3Dmm9kVxN1Ow0LMYu4TSTEd74xWc=;
        b=kIU6f2XRfrUA8oK5nK1bvtPREA5/8oQ6lXqYJOuayjwb/BjDU2wL3IPSPA3KLeh+gS
         rgjQNop2cY5M2PFXKT0yI1QUivO3MI6SfQkFmsPs9Yaa7shQetkQWHhF63nB4q9Bjh+c
         45nA45ehiCMbcF9aZoYuVBbwrfiVVo6B5y3lmhf6ceSG1VWc7L2eTe5b2jzFXnKvI+7j
         uPqaXh35l0QCWBSMAIcKZdmAFB2yNUNG64xV9X85W2GkiwQq8cEwz7JwCrd0AUV21+sY
         AMRGKcnUYs0otEA8K/YvDj4LXt8uubYVJXITv1dWszy2n9aoDuK0DYYAMoZEdZqoc9ax
         JH6g==
X-Gm-Message-State: AOJu0YwrToF638vDRIKGvbRe0aiQRAbedUIt60qZSEKRgzGF5h3rOkoc
        xfdfZUT7He3rYUXLGSezOUuQwlrZ0zUzgZxgssH34i82
X-Google-Smtp-Source: AGHT+IFSXOvj4V+S5xmYds9//GYibIzWJ1yzcAcaxUUD/bLtsDptEsdkEhvPQ5Q79kooR8m4PWakLw==
X-Received: by 2002:a05:6512:3d10:b0:501:ba04:f352 with SMTP id d16-20020a0565123d1000b00501ba04f352mr315319lfv.1.1693941353830;
        Tue, 05 Sep 2023 12:15:53 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id u22-20020ac243d6000000b005008757cd6csm2495507lfl.241.2023.09.05.12.15.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 12:15:53 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5009dd43130so852e87.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Sep 2023 12:15:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd1:b0:3fe:ef25:8b86 with SMTP id
 o17-20020a05600c4fd100b003feef258b86mr26556wmq.4.1693941331939; Tue, 05 Sep
 2023 12:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org> <CACRpkdaF4GqHtdJeBed0JGVXNkpA9dvbPgGMK=Qy0_RZyvOtNQ@mail.gmail.com>
In-Reply-To: <CACRpkdaF4GqHtdJeBed0JGVXNkpA9dvbPgGMK=Qy0_RZyvOtNQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Sep 2023 12:15:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa-hX_p0dF+Q@mail.gmail.com>
Message-ID: <CAD=FV=UFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa-hX_p0dF+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] drm/panel: Remove most store/double-check of
 prepared/enabled state
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ondrej Jirman <megi@xff.cz>, Ondrej Jirman <megous@megous.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, Aug 10, 2023 at 1:23=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Aug 4, 2023 at 11:07=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
>
> > As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> > prepared/enabled in drm_panel"), we want to remove needless code from
> > panel drivers that was storing and double-checking the
> > prepared/enabled state. Even if someone was relying on the
> > double-check before, that double-check is now in the core and not
> > needed in individual drivers.
> >
> > This series attempts to do just that. While the original grep, AKA:
> >   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> > ...still produces a few hits after my series, they are _mostly_ all
> > gone. The ones that are left are less trivial to fix.
> >
> > One of the main reasons that many panels probably needed to store and
> > double-check their prepared/enabled appears to have been to handle
> > shutdown and/or remove. Panels drivers often wanted to force the power
> > off for panels in these cases and this was a good reason for the
> > double-check. As part of this series a new helper is added that uses
> > the state tracking that the drm_panel core is doing so each individual
> > panel driver doesn't need to do it.
> >
> > This series changes a lot of drivers and obviously the author can't
> > test on all of them. The changes here are also not completely trivial
> > in all cases. Please double-check your drivers carefully to make sure
> > something wasn't missed. After looking at over 40 drivers I'll admit
> > that my eyes glazed over a little.
> >
> > I've attempted to organize these patches like to group together panels
> > that needed similar handling. Panels that had code that didn't seem to
> > match anyone else got their own patch. I made judgement calls on what
> > I considered "similar".
> >
> > As noted in individual patches, there are some cases here where I
> > expect behavior to change a little bit. I'm hoping these changes are
> > for the better and don't cause any problems. Fingers crossed.
> >
> > I have at least confirmed that "allmodconfig" for arm64 doesn't fall
> > on its face with this series. I haven't done a ton of other testing.
>
> The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please send out a non-RFC version, this is clearly the right thing to
> do.

As per the long discussion in response to patch #4, I think there are
still open questions about the later patches in this series. However,
I could land patches #1 - #3 if there are no concerns. Would anyone
object if I just landed them straight from this series with Linus's
review, or would I need to repost just patches #1 - #3 without the
"RFC" tag?

Thanks!

-Doug
