Return-Path: <SRS0=XGz1=45=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F69C10DCE
	for <linux-doc@archiver.kernel.org>; Thu, 12 Mar 2020 18:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DC402067C
	for <linux-doc@archiver.kernel.org>; Thu, 12 Mar 2020 18:40:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiiFQEu8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCLSkJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Mar 2020 14:40:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34036 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgCLSkI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Mar 2020 14:40:08 -0400
Received: by mail-io1-f68.google.com with SMTP id h131so6783932iof.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2020 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z4HDMdYPRXEXUw8YzZaH0lPM3kLQ+sEaQbLN+MWL2mQ=;
        b=aiiFQEu8IipvIlj2LuKwHIAy5l7E7beFfrjvlf0OYfdXt/7gmfqS4il4vYUF8U61k/
         LzIkMctoohIQr6yPcrqQ9DuTAbVGFRJezdcv8YJrZ0Mks6Mt90jQbGlwBDivqjBrM/P8
         kmjAT9zB7EfvKKekUvoaECFEsoGCJA/Iw/8+TvGuGUwjvNnQp6BaZkXxhk8Wq6Kcpn1J
         8Mtlyyd7i3AVU+G54FYDX2lpYWJK7aIp20aXUrovJMtO30o1CmB4h6CbMpGp28oSC3Zt
         M/Ybt4X/xeuWS+kQekyWWr2QEo9XObv9Po6p6br+hDOC3gdbRL6Is3SUs2JdCuCIWnNx
         oqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z4HDMdYPRXEXUw8YzZaH0lPM3kLQ+sEaQbLN+MWL2mQ=;
        b=ZmaAGWNJgFgWzkBGkhrXojjXS91+NM4kwbk9dYJdXQgb0NQTSMglWaDgl/G7Y1M73r
         IIY6p93nidbYtKM/DVfVkCYZll4Z5GRvtJClXF4d2KKytQAJjkCf7RWIVYWHy0rugrJ3
         6xYQL2tAejrZvMs/FiO9qgJpof7h37pUsV9sgGC6GdD9J0ySFO4+1h+gTWNxnLNE5a2N
         YGW+tDQq5dCEoI1FUp1966sz3yQuBENI1JAy2ivjTKTSZNEeVtmxtZpwffjQg8GJhtav
         gKm6ryGDD4pgpSGmlO0OxQkCO4wZmstaKwJzYeY2T0QvHS5QIzhgDQIYqUOBdwVphNI/
         CMSA==
X-Gm-Message-State: ANhLgQ2a9JeZc+EV/kDJhXZcZp+F/g7Uf1i3JAZfPMYc813BOC47t76E
        QyCDX3t8fSk0rnFpwFQR7l3S/ovN/RQrubNP6HvSRnVd
X-Google-Smtp-Source: ADFU+vu839A43CF5L97p8C231xviJ3mA4uZSevSjoq8CHoVDs7Si0nDd7UfLjJSNI3hj09DRmxtMo/WrtVIcBOqlXVw=
X-Received: by 2002:a6b:7c4b:: with SMTP id b11mr8915949ioq.118.1584038407782;
 Thu, 12 Mar 2020 11:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200303225552.142778-1-joakimlonnegren@gmail.om> <20200310113117.4fc9632e@lwn.net>
In-Reply-To: <20200310113117.4fc9632e@lwn.net>
From:   =?UTF-8?Q?Joakim_L=C3=B6nnegren?= <joakimlonnegren@gmail.com>
Date:   Thu, 12 Mar 2020 15:39:55 -0300
Message-ID: <CAN1Azk4Bmmba3Bu+SKcOUzE4WZsRXo4fcrR041asinRnWXUs3g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: driver-api/usb/writing_usb_driver.rst:
 Update documentation links
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 10 Mar 2020 14:31
Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue,  3 Mar 2020 19:55:52 -0300
> "Joakim L=C3=B6nnegren" <joakimlonnegren@gmail.com> wrote:
>
> > In writing_usb_driver.rst:
> > Remove link to https://www.qbik.ch/usb/devices/ since it seems to be in=
active since 2013
> > Update link to linux-usb mailing list archive
> >
> > Signed-off-by: Joakim L=C3=B6nnegren <joakimlonnegren@gmail.com>
> > ---
> >  Documentation/driver-api/usb/writing_usb_driver.rst | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Docu=
mentation/driver-api/usb/writing_usb_driver.rst
> > index 4fe1c06b6a13..5987762f5c3f 100644
> > --- a/Documentation/driver-api/usb/writing_usb_driver.rst
> > +++ b/Documentation/driver-api/usb/writing_usb_driver.rst
> > @@ -314,11 +314,8 @@ http://www.linux-usb.org/
> >  Linux Hotplug Project:
> >  http://linux-hotplug.sourceforge.net/
> >
> > -Linux USB Working Devices List:
> > -http://www.qbik.ch/usb/devices/
> > -
> > -linux-usb-devel Mailing List Archives:
> > -http://marc.theaimsgroup.com/?l=3Dlinux-usb-devel
> > +linux-usb Mailing List Archives:
> > +https://marc.info/?l=3Dlinux-usb
>
> I think this is a good idea, but can we put in a link to the
> lore.kernel.org archive for this list instead?
>
> Thanks,
>
> jon

Absolutely, I'll send a new version soon.

/Joakim
