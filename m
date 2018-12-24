Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 700627D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Dec 2018 13:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbeLXNF5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Dec 2018 08:05:57 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37563 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbeLXNF4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Dec 2018 08:05:56 -0500
Received: by mail-io1-f66.google.com with SMTP id r7so60181iog.4
        for <linux-doc@vger.kernel.org>; Mon, 24 Dec 2018 05:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Evtv4ZMrKUGNYr5mH12Qdgpuk2IZMGjcAGvmB2rgD6I=;
        b=UcD+KnCBHb22mZwjis1mIkWskfR/nJiO+IL249svlAhBDPsHgxHu1EVUSjL7VpT3UK
         uupOcGxdBBUWmdHj8xgmS8XxU0csC6ue4nZWiHUOS3mwlHrKxez3p0vFeQ8F4ty8pUZu
         +TzxNIYblLN8YPVF9x+LcGF5WR6B7cE5XDfFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Evtv4ZMrKUGNYr5mH12Qdgpuk2IZMGjcAGvmB2rgD6I=;
        b=HIinqiDAXp/g6fiX1OrHEJj7qp1t8C3WbTp00JV2hwWguNxaBEzJdnXwUy3XTGR4n5
         Fm21T5dzqZkvPCqnL/xhL1cNjAtcmQV/ddiHE4hqM0nQ6NQvjyT8flY5Bw+LJsuGWC+n
         x9bE4ssLoc39c1rH5gMMucuVvEvR2/pwcLSk9MZYcnqVN7FfVPMsa2IL9GbplldnhMAc
         pE1GLRA7EffKpopGyqyAFA87E3rNCnaYHXKxCjGWgsgDUn5B8iYpd+VwDOxoySartQYM
         Dq1CqogIAMh2ePireMv58FtEmb3O7INe0DpM8nZaUYPGq+1JhMPmnY9JyfNwsj/+b/tO
         EiCQ==
X-Gm-Message-State: AJcUukdjDTv2Xopbih5QFyyBWL6PO22pRvlNKn9gXD7p1eE6pvkGMqg8
        +ts+FAYyE0rcfx6eDRYSS1Qp04XNN+YXNSS2je2N3Q==
X-Google-Smtp-Source: ALg8bN4B10zdZoY6cp/DTMyLikgd9KMOnkEUgRTuHRfwiQ1rMJhGyEuVjnqgdi3nE55JVPLjULF1blWmBv7oTxpU2Xg=
X-Received: by 2002:a5d:959a:: with SMTP id a26mr8861273ioo.278.1545656755596;
 Mon, 24 Dec 2018 05:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20181221095757.15510-1-james.qian.wang@arm.com>
 <20181221095757.15510-10-james.qian.wang@arm.com> <20181224123314.GK22341@e110455-lin.cambridge.arm.com>
In-Reply-To: <20181224123314.GK22341@e110455-lin.cambridge.arm.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 24 Dec 2018 14:05:43 +0100
Message-ID: <CAKMK7uGt63=_KuECQc2ivuSZb8gMD1=6n0=Q2bcvzCEPo84uFw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add maintainer for arm komeda driver
To:     Liviu Dudau <Liviu.Dudau@arm.com>
Cc:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
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

On Mon, Dec 24, 2018 at 1:33 PM Liviu Dudau <Liviu.Dudau@arm.com> wrote:
>
> On Fri, Dec 21, 2018 at 10:01:06AM +0000, james qian wang (Arm Technology=
 China) wrote:
> > v2: Adjusted the position of KOMEDA by alphabetical order
> >
> > Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Best regards,
> Liviu
>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 254b7b267731..e48c2e5fd29f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1124,6 +1124,15 @@ S:     Supported
> >  F:   drivers/gpu/drm/arm/hdlcd_*
> >  F:   Documentation/devicetree/bindings/display/arm,hdlcd.txt
> >
> > +ARM KOMEDA DRM-KMS DRIVER
> > +M:   James (Qian) Wang <james.qian.wang@arm.com>
> > +M:   Mali DP Maintainers <malidp@foss.arm.com>
> > +S:   Supported
> > +F:   drivers/gpu/drm/arm/display/include/
> > +F:   drivers/gpu/drm/arm/display/komeda/
> > +F:   Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> > +F:   Documentation/gpu/komeda-kms.rst

Mentioning the git tree would be good. And I guess you'll do some kind
of group maintainership? Probably still good if you send out a
dedicated/topic pull request for this new driver, but from then on
it's all in the same git repo.
-Daniel

> > +
> >  ARM MALI-DP DRM DRIVER
> >  M:   Liviu Dudau <liviu.dudau@arm.com>
> >  M:   Brian Starkey <brian.starkey@arm.com>
> > --
> > 2.17.1
> >
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
