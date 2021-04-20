Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D5CC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5632C61354
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDTJWo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 05:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22519 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231265AbhDTJWo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 05:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618910532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fM2Zxq/BIV5zt5mY21HecYUb6ZEHdd7//7NEB7VTkj0=;
        b=HjVRz24XbRgzOVO4dOxdfX2JZT8S7y/V1MTtPC9GCd3sP4RIALLU+agGSbnef1LM5/BKIf
        HDAYaCV471/Np4C0i7fuRD9fGksDSkDWgGaaWzd0MjoZRxbXMhLfsM9I4crrg01anPsz+Q
        9HPbc4108aRuCd8SFaS7xUnKCjy3uFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-pjywwDiHPSCeF_KBFKw-Sw-1; Tue, 20 Apr 2021 05:22:08 -0400
X-MC-Unique: pjywwDiHPSCeF_KBFKw-Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E42391020C27;
        Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com [10.36.112.178])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7751B5C23E;
        Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 82A7D1800382; Tue, 20 Apr 2021 11:22:04 +0200 (CEST)
Date:   Tue, 20 Apr 2021 11:22:04 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        bluescreen_avenger@verizon.net,
        Greg KH <gregkh@linuxfoundation.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > 
> > .... if support for 8-bit frame buffers would be added?
> 
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> shouldn't be a big thing, but the latter is only really supported by the
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw which
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best.

Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
(depending on display resolution).  We could pull off the same trick
here and convert to rgb332 (assuming we can program the palette with the
color cube needed for that).  Wouldn't look pretty, but would probably
work better than expecting userspace know what color palettes are in
2021 ...

take care,
  Gerd

