Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 074317DD2A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Dec 2018 11:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbeL1L4m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Dec 2018 06:56:42 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40556 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeL1L4l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Dec 2018 06:56:41 -0500
Received: by mail-io1-f67.google.com with SMTP id a2so4216141iok.7
        for <linux-doc@vger.kernel.org>; Fri, 28 Dec 2018 03:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rX921hZEd7dAiYwFA4LBdTDnsTkinpQHYAy3hog7+ao=;
        b=RP42pOo1z1H3JD2ms+a7Xd7adEtbCpDrvnsfXHPTeoClqEDUVkAr1hBwOcl/Jm4nZ+
         i4rayWwP3nQb5FPTtZjcIUDo27aV2U7naEWbXmEpqWWqfoYVWbv0U1800+5eT8a3sIb5
         w6u8LcYldTSYyU9+eiS/nbAzi09D6tf0oQTL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rX921hZEd7dAiYwFA4LBdTDnsTkinpQHYAy3hog7+ao=;
        b=MkezW4ZVOHCFab7vW0gOhw7mbtQNWT/MAi20kTdHcI1Rw4dq3dnn+TN4P9qEE7x1WC
         ouIsh9G4Vv8F3hTH2OLi3TZUW0IyLx75oPXH0cWIfeRIzsh1dlkNUOqadB6eWiTP0YQ4
         +LAgrzBTc8hThbbXXoGelmOFDpknV9qj7is2KVwJMKgNHNr+8aUfD75lcT+TVaz9KKSm
         JmYRD8tRGP9rijEA2AjAr5qZOglHxlnYZxdnRYHLXX78M7Xt9BBX4oEpcGOfIXfu9hPP
         gyRO9hqbJQlrGoS7pac3jTeID4P8iAoHZuyb/Y3IdDZ6ToizefBhUrm+3W01pLgXyLr4
         Tciw==
X-Gm-Message-State: AJcUukfRr3qRRzlzCRRNqe18C61A4yVEm/DkxN1kRNbQVJR8jcGBKsKe
        esyuncokLggr6Yub+lvHNHwTgILT2P26H62AfxoipA==
X-Google-Smtp-Source: ALg8bN5XhwpGJJJHfTRrtQKyIZ9rtsF7ngsmTSoTVlfiOzVGOpET5cZoKkk3OZsPKmXsELRqDqi4aduFwEDF+eyw9pY=
X-Received: by 2002:a5d:959a:: with SMTP id a26mr18874487ioo.278.1545998200301;
 Fri, 28 Dec 2018 03:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20181221095757.15510-1-james.qian.wang@arm.com>
 <20181221095757.15510-10-james.qian.wang@arm.com> <20181224123314.GK22341@e110455-lin.cambridge.arm.com>
 <CAKMK7uGt63=_KuECQc2ivuSZb8gMD1=6n0=Q2bcvzCEPo84uFw@mail.gmail.com> <20181228111534.GA19025@james-ThinkStation-P300>
In-Reply-To: <20181228111534.GA19025@james-ThinkStation-P300>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 28 Dec 2018 12:56:27 +0100
Message-ID: <CAKMK7uFaGnjznux9E9gzmppW-+Pbx6UoFHEYjtWvBJWh3ro-nA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add maintainer for arm komeda driver
To:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Cc:     Liviu Dudau <Liviu.Dudau@arm.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
        "Jin Gao (Arm Technology China)" <Jin.Gao@arm.com>,
        "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
        nd <nd@arm.com>, "malidp@foss.arm.com" <malidp@foss.arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 28, 2018 at 12:15 PM james qian wang (Arm Technology
China) <james.qian.wang@arm.com> wrote:
>
> On Mon, Dec 24, 2018 at 02:05:43PM +0100, Daniel Vetter wrote:
> > On Mon, Dec 24, 2018 at 1:33 PM Liviu Dudau <Liviu.Dudau@arm.com> wrote=
:
> > >
> > > On Fri, Dec 21, 2018 at 10:01:06AM +0000, james qian wang (Arm Techno=
logy China) wrote:
> > > > v2: Adjusted the position of KOMEDA by alphabetical order
> > > >
> > > > Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
> > >
> > > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> > >
> > > Best regards,
> > > Liviu
> > >
> > > > ---
> > > >  MAINTAINERS | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 254b7b267731..e48c2e5fd29f 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1124,6 +1124,15 @@ S:     Supported
> > > >  F:   drivers/gpu/drm/arm/hdlcd_*
> > > >  F:   Documentation/devicetree/bindings/display/arm,hdlcd.txt
> > > >
> > > > +ARM KOMEDA DRM-KMS DRIVER
> > > > +M:   James (Qian) Wang <james.qian.wang@arm.com>
> > > > +M:   Mali DP Maintainers <malidp@foss.arm.com>
> > > > +S:   Supported
> > > > +F:   drivers/gpu/drm/arm/display/include/
> > > > +F:   drivers/gpu/drm/arm/display/komeda/
> > > > +F:   Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> > > > +F:   Documentation/gpu/komeda-kms.rst
> >
> > Mentioning the git tree would be good. And I guess you'll do some kind
> > of group maintainership? Probably still good if you send out a
> > dedicated/topic pull request for this new driver, but from then on
> > it's all in the same git repo.
> > -Daniel
>
> Hi Daniel:
>
> The komeda driver will use an Arm-hosted tree:
>
> git git://linux-arm.org/linux-ld.git for-upstream/mali-dp
>
> Same as other arm display drivers. And Liviu Dudau will help to send the =
pull
> request to merge this topic into drm-next.
>
> And we are planning to adopt a group maintainership and migrate towards d=
rm-misc-next,
> but we just need to have enough people and enough experience with working=
 with upstream
> before we jump all in.

arm drivers are probably a bit too big for drm-misc, but you could use
the same tooling to maintain a drm-arm tree. I guess that's the idea?
-Daniel

> Last a T: entry will be added in the next version.
>
> T:      git git://linux-arm.org/linux-ld.git for-upstream/mali-dp
>
> James
>
> > > > +
> > > >  ARM MALI-DP DRM DRIVER
> > > >  M:   Liviu Dudau <liviu.dudau@arm.com>
> > > >  M:   Brian Starkey <brian.starkey@arm.com>
> > > > --
> > > > 2.17.1
> > > >
> > >
> > > --
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > | I would like to |
> > > | fix the world,  |
> > > | but they're not |
> > > | giving me the   |
> > >  \ source code!  /
> > >   ---------------
> > >     =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
