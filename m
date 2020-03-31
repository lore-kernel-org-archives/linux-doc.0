Return-Path: <SRS0=SHIp=5Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E798C43331
	for <linux-doc@archiver.kernel.org>; Tue, 31 Mar 2020 08:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3FB7207FF
	for <linux-doc@archiver.kernel.org>; Tue, 31 Mar 2020 08:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+XlZsk4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCaIsF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Mar 2020 04:48:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53336 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726299AbgCaIsF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Mar 2020 04:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585644484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EC8zHtKDtyBPst8HYZ27qXF6v5Iv4jCK2Iefv3U/6d8=;
        b=d+XlZsk4RjadKPIXMjUBGQfBGacEYga5PIOuUUtShUxBCSNbyehJW0eTI8NSLO6rpHhcT4
        aBaJ5H4bR5vD11fn3yAH7q6Z1/c4MkQBjTEO1OpyySY0DexXF41t2Ig1e66vlQbGVGN8ri
        9NuxLaaUWTDbINc2ysbyC6SJBE8HfOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-W_t-e5gIP9yPWh_Y0aK7Ag-1; Tue, 31 Mar 2020 04:48:00 -0400
X-MC-Unique: W_t-e5gIP9yPWh_Y0aK7Ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA8951926DA5;
        Tue, 31 Mar 2020 08:47:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com [10.36.112.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F76B96F85;
        Tue, 31 Mar 2020 08:47:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id A60AC17535; Tue, 31 Mar 2020 10:47:57 +0200 (CEST)
Date:   Tue, 31 Mar 2020 10:47:57 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, sam@ravnborg.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vram-helpers: Merge code into a single file
Message-ID: <20200331084757.fqqhurw3d3c4i7id@sirius.home.kraxel.org>
References: <20200331081238.24749-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331081238.24749-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 31, 2020 at 10:12:38AM +0200, Thomas Zimmermann wrote:
> Most of the documentation was in an otherwise empty file, which was
> probably just left from a previous clean-up effort. So move code and
> documentation into a single file.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

