Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 22F877D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Sep 2019 05:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731416AbfISF6g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Sep 2019 01:58:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40966 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfISF6g (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Sep 2019 01:58:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 28BD33175288;
        Thu, 19 Sep 2019 05:58:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6870D5D9CC;
        Thu, 19 Sep 2019 05:58:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 11F5F17444; Thu, 19 Sep 2019 07:58:33 +0200 (CEST)
Date:   Thu, 19 Sep 2019 07:58:33 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        yc_chen@aspeedtech.com, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/11] drm/vram: Add struct drm_vram_buffer to VRAM
 helpers
Message-ID: <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>
References: <20190918142307.27127-1-tzimmermann@suse.de>
 <20190918142307.27127-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918142307.27127-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 05:58:36 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 18, 2019 at 04:22:57PM +0200, Thomas Zimmermann wrote:
> Drivers with dedicated video memory occasionally need to reserve a memory
> area for a specific purpose, such as cursor images or sprites. Using GEM
> VRAM buffer objects can be problematic. For small buffers, GEM VRAM buffer
> objects are inefficient as they are aligned to page boundaries.

I would still allocate gem objects for that.  Then use them as pool
instead of using them directly.

Not sure this is worth the trouble just for the cursors though as they
are big enough that page-sized allocations don't waste memory.

> And they cannot easily be placed at specific memory offsets. This can
> lead to memory fragmentation and is a problem for hardware with only a
> small amount of memory.

Note that there is a flag to change the allocation strategy
(TTM_PL_FLAG_TOPDOWN).  You could allocate the cursor objects
with the flag set.  Should be good enough to avoid fragmentation.

I have a patch doing exactly that for qxl, for the same reason:
https://git.kraxel.org/cgit/linux/commit/?id=e00e913a64c6fba9630b311f8bc71bd7c9842479
(no, that patch wasn't sent to the list yet).

We could do the same for vram and either let the driver explicitly ask
for top-down allocation, or use some threshold like the qxl patch.

So, I'm not convinced we actually need the drm_vram_buffer
infrastructure.

cheers,
  Gerd

