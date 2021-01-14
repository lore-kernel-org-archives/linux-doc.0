Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75C2C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D650233FD
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbhANII1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 03:08:27 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:53612 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbhANII1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 03:08:27 -0500
Date:   Thu, 14 Jan 2021 08:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1610611621;
        bh=oZoLOvB8GFNjTNukq9k4F1x8Zrh7VuJWPVVKWBKbx6E=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QntvKbV1vbBi+N/094QDG70LEkXfRBGSma8e3IoD4jHW+TxXVRJbXS9E1IGSKVB4d
         r1x0dNCfc3xC0p7aPRVYcrCXoU/zHBPHs6VcIudLRyY/D8YlQtBOAIlUwlLWFsLTy6
         mmrHtEA0JagQIO6GtkHlDdNY/uA5IsOJr5urCGRkg+G8K4w/hmRuPgq8lufieWChJD
         5TcCRFeHcuvG+KLwDvBouFhhnl7ADS8pN4F/SPg4uoyG/3rE7WKxn3YWUzTM7WuiUy
         5RjlIBQoAGXy+1qVUL3Mhm74oiIaUtj7oCiQnrh+BFVUKoZzfMmZCwRP8ixSh6c4yY
         2Kh9d84w2LHiw==
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 15/16] drm: drm_crc: fix a kernel-doc markup
Message-ID: <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
In-Reply-To: <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org> <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thursday, January 14th, 2021 at 9:04 AM, Mauro Carvalho Chehab <mchehab+=
huawei@kernel.org> wrote:

> A function has a different name between their prototype
> and its kernel-doc markup:
>
> =09../include/drm/drm_crtc.h:1257: warning: expecting prototype for drm_c=
rtc_alloc_with_planes(). Prototype was for drmm_crtc_alloc_with_planes() in=
stead
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Simon Ser <contact@emersion.fr>
