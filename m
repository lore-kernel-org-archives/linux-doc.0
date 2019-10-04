Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 054A77D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 22:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbfJDWVE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 18:21:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42946 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbfJDWVE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Oct 2019 18:21:04 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so5500202lfg.9
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2019 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9NX5JuTWafrd7iXTgyMS4RoKwJ5yHBPv8xmUFX4nrZA=;
        b=MQiziV51a+gwItEpIvETwGGmI9QP0PC5GgUZXP/g56eByqgN3NZLQopBV1GRv2Bf3O
         U8sZhi4oYdp9BmSQN3toekTctMA9R3y6hXVohUHuYjstpKA3eqv2ulSEbAjwGoBXbtR5
         4XwdUzQsr1XOvxUr51XcmtfeSl1GGHz2QPOWcPL/A+lgIx8EgRx83tJqeUc319yBJiFr
         tiOH+0i9jZMuoIFCNAKKcgrhpB52LNBLj/x9F/yYhwEasRC0f94CKAWg/yS/0qOYsW+B
         UzCRpmdTQ1XF5zhwp6wMByySoDX1m3Jz2OI7Zz+uP8mDLmKkQklsdlVlvHM6UIhDP7Ah
         waKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9NX5JuTWafrd7iXTgyMS4RoKwJ5yHBPv8xmUFX4nrZA=;
        b=MBkoJRxNATLPpd/qYMSga1ME1Qe0iAgWLr5uwebVEl9yLNeAwJLEv7Oa7/5qxb+OdB
         YOPfnIm8qcMQByJfco2vLTZ7gHc2HWRMVHTfl5IDx08OiJZFdp0y8tFkZ7iPYN/aLsUu
         f6YgZ5DI4ptj8Y1IOxAtiudlHpfIJ8c2M8dFI9Eq1WqSAelYi1exaI0gZ5U4LHMunKgK
         +rjqBxCDIDNtm+3SC5yQvwU5mc2I64sQsO4E7QeTciQiqLJAjHUkvHmVM1caVi9WOqBZ
         peHInN6kesso5fHOvxSiHX6hT0aE6bOKuzpR1yaylqtcYFcxEuQeqeaTe7I65r49prwB
         UrNA==
X-Gm-Message-State: APjAAAVPyVQjVrp/oDW8knVE+zlE6T6Mmw8mb994IJ02cVHDIYfK8YkC
        V6C2LGiRLPsA0ClkYxfq/kgmWXTIZWuZzKx3A4A8sg==
X-Google-Smtp-Source: APXvYqxO/Wj6yEjUFPz44eOAVE0OIWbXwEw1qgTNOC8kPeD8B+ai3ePplrGXWyqLgU0QgY9MZ/8+S34Igmsja/QXRvg=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr10232582lfa.141.1570227662211;
 Fri, 04 Oct 2019 15:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net> <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
 <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com> <20191003151555.64qabct3jmd74ypi@gilmour>
In-Reply-To: <20191003151555.64qabct3jmd74ypi@gilmour>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:20:50 +0200
Message-ID: <CACRpkdaOxKPd2CrB4F7QQasov85C83f3NEqS8TvrzKXiC8-+uQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To:     Maxime Ripard <mripard@kernel.org>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 3, 2019 at 5:15 PM Maxime Ripard <mripard@kernel.org> wrote:

> > > > Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE=
")
> > > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > >
> > > Both patches applied!
> >
> > ...but I can't push the changes:
> >
> > $ dim push-branch drm-misc-next
> > dim: 9fa1f9734e40 ("Revert "drm/sun4i: dsi: Change the start delay
> > calculation""): committer Signed-off-by missing.
> > dim: ERROR: issues in commits detected, aborting
> >
> > Not even my commit, apart from that it looks like it does have
> > the committer Signed-off-by. I'm confused and don't know what
> > to do... anyone has some hints?
>
> Yeah, it's pretty weird, I just pushed without any trouble.
>
> Did you rebase or something?

Nope... even tried to reset hard to origin :/

I guess just try again...

Yours,
Linus Walleij
