Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D8F47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Sep 2019 11:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbfIJLGF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Sep 2019 07:06:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40454 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbfIJLGF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Sep 2019 07:06:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 702113082B40;
        Tue, 10 Sep 2019 11:06:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C6081001938;
        Tue, 10 Sep 2019 11:06:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 56A9E31F14; Tue, 10 Sep 2019 13:06:03 +0200 (CEST)
Date:   Tue, 10 Sep 2019 13:06:03 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, corbet@lwn.net,
        z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 0/4] Merge VRAM MM and GEM VRAM source files
Message-ID: <20190910110603.upjt34ycylscjpnf@sirius.home.kraxel.org>
References: <20190909130453.6718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909130453.6718-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 10 Sep 2019 11:06:05 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 09, 2019 at 03:04:49PM +0200, Thomas Zimmermann wrote:
> VRAM MM and GEM VRAM are only used with each other. This patch set
> moves VRAM MM into GEM VRAM source files and cleans up the helper's
> public interface.
> 
> Thomas Zimmermann (4):
>   drm/vram: Move VRAM memory manager to GEM VRAM implementation
>   drm/vram: Have VRAM MM call GEM VRAM functions directly
>   drm/vram: Unexport internal functions of VRAM MM
>   drm/vram: Unconditonally set BO call-back functions

Looks all sane.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

