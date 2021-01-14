Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7441DC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 14:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E1A023A56
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 14:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbhANOOM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 09:14:12 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:10275 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbhANOOM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 09:14:12 -0500
Date:   Thu, 14 Jan 2021 14:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1610633608;
        bh=1xVDP+DpaqaHjOhRD3Fsqb5+o8cs19izEhMuZCBEwqo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=U2Hms97g1LH6vW09r/VQijPieVbd5M9KZwfFYnqZFw/WNKkybteyo212qly59QGy0
         LSTanfzOSaut0zhy+9zyobjVH3TMApTgiDPYLRvVxKsvMl11EYZ3L32WPZmNp1NW4R
         V3LVXh8W8ggu+nkW2g3ArIDh1UfjiisPsMf+bNXFhmgaOL72zTI3RVeSyGC3so683M
         ic9bJj5ZZAlyotwvabcw0tx7AUVOZIas3d+CqwWozevv5SsR+VKJUMSPRTa0VE6TDl
         83mfmm+irCRNF/pJUrFEAYtS9q2j3YP1SyubM6A2hFlaxL7vDwVysoOpObQNfEDw0b
         FF4/qFMEONT5g==
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 15/16] drm: drm_crc: fix a kernel-doc markup
Message-ID: <GS4SAPqf7Gl2MJ4pYYlRq38wmiYovdE5GErbY3GKxpiySr5i_FKHGWBMnA7MIDR64-bKHEJPfo7aqbzaDz4DCeoyCW97VVEOUAWGoK1pUHE=@emersion.fr>
In-Reply-To: <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
References: <cover.1610610937.git.mchehab+huawei@kernel.org> <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org> <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thursday, January 14th, 2021 at 9:06 AM, Simon Ser <contact@emersion.fr>=
 wrote:

> On Thursday, January 14th, 2021 at 9:04 AM, Mauro Carvalho Chehab <mcheha=
b+huawei@kernel.org> wrote:
>
> > A function has a different name between their prototype
> > and its kernel-doc markup:
> >
> > =09../include/drm/drm_crtc.h:1257: warning: expecting prototype for drm=
_crtc_alloc_with_planes(). Prototype was for drmm_crtc_alloc_with_planes() =
instead
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> Acked-by: Simon Ser <contact@emersion.fr>

Pushed to drm-misc-next, thanks for the fix!
