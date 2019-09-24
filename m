Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 585167D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 07:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409186AbfIXHSM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 03:18:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59302 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391594AbfIXHSL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Sep 2019 03:18:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8CE42368E2;
        Tue, 24 Sep 2019 07:18:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B3B9E5FCB8;
        Tue, 24 Sep 2019 07:18:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 87F7516E05; Tue, 24 Sep 2019 09:18:09 +0200 (CEST)
Date:   Tue, 24 Sep 2019 09:18:09 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        yc_chen@aspeedtech.com, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/12] drm/vram: Support top-down placement flag
Message-ID: <20190924071809.ediliko4wt2ngqgf@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 24 Sep 2019 07:18:11 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> + * object to be pinned at the high end of the memory region. Set this
> + * flag to avoid memory fragmentation.

That is confusing, sounds like the flag should be set on all objects
which is not correct.  The description from the cover letter is better.

Otherwise the patch is fine, so with that fixed:
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

