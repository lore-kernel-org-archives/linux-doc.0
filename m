Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D72D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 14:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbfJCOjy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 10:39:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32953 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfJCOjx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 10:39:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so3084123ljd.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2019 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4BJLNO1nnen45Bue2c6+QWaeFM+NUXNmcN3wO45Wjs4=;
        b=hC0MBIOv99lcqwkgOhJzHbxuJlcR6UF11aD7HCAkB+aMXleaIUPfDtuEhjp6Ud7d+x
         gc6pmY7bL6tUuRbDywxqB2J1WoqqeFNyN3xiImutQAV/zgR4UA2rO340ledNR6F1IFs3
         mm2WmSNfSZovnGWCgHRa3qXWdVCpR3aLeiwiO6por1NWIvZAjlICR0XQpHQ5ALMdJ8VO
         P/IbGz/GiceRUiREKV8kuNinDvh37Z36Rqk4olPswDk8y8QYDiPbFXQfADJH3Lbk2e5e
         gBthUT6vqbA76lABDQcff4RdYexJ2iqxpFCN6h4oTv2KvxCaqZWOrO86moQQ+fO7uOG8
         vJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4BJLNO1nnen45Bue2c6+QWaeFM+NUXNmcN3wO45Wjs4=;
        b=IAszSUUn2tbDJbnWooKHoUqS8/FSMBgVCqyma3szNsiU3p//ARQOBIeY8ZO1hmWICx
         KdWL+uwWHVhEVwCIWCFwzcvZEjAezWpxe4In9+5qIoUCiQ+3ZQx2xXDEDiARhSbFmbf+
         rOvlGoKKyBew1B8xaKCtrYxmanPqbFSEo5HDzaea93m2aqDLNMjgdmVNu1DRDp3QncHZ
         Itu1m56eDib2Rl0xawqnhCnQnqb4I0b2lYSbIOGCYh0m0WEh3BCLhrQwJ0joBI6dzhmk
         S0U58Px93Tfd9GrpmbVJZ0Vs9Zolvy59BWhLh7ipdNxjbclpOGJT4sxi4bqEmd89QRJY
         3skg==
X-Gm-Message-State: APjAAAV9GSxFMq1Tt1h1hdWE58hk9BabyIRtk62BFYlDYOLOa5VSNf7h
        lAiLgzNQ/0GZUIaEg9w2JVIUQjtCrP/ceJ1IT3vXCQ==
X-Google-Smtp-Source: APXvYqyoTjg2yu9W/7cu3VsJfhVSAP4iuY3SW2NhSndP3RLZVIIhRQXVpWq1aumTQgFWXKRgi+Y6WuTDVZSWQEpGVBM=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr6532816lje.118.1570113590655;
 Thu, 03 Oct 2019 07:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net> <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
In-Reply-To: <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 16:39:39 +0200
Message-ID: <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 3, 2019 at 4:34 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
> On Wed, Oct 2, 2019 at 5:39 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>
> > The :doc: reference did not match the DOC comment's name.
> >
> > Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Both patches applied!

...but I can't push the changes:

$ dim push-branch drm-misc-next
dim: 9fa1f9734e40 ("Revert "drm/sun4i: dsi: Change the start delay
calculation""): committer Signed-off-by missing.
dim: ERROR: issues in commits detected, aborting

Not even my commit, apart from that it looks like it does have
the committer Signed-off-by. I'm confused and don't know what
to do... anyone has some hints?

Linus Walleij
