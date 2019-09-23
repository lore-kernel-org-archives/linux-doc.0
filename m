Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F9BE7D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 06:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393326AbfIWG7s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 02:59:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55342 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393062AbfIWG7s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 02:59:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 063BC10DCC92;
        Mon, 23 Sep 2019 06:59:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9E489600C4;
        Mon, 23 Sep 2019 06:59:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id CA64217535; Mon, 23 Sep 2019 08:59:46 +0200 (CEST)
Date:   Mon, 23 Sep 2019 08:59:46 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation/gpu: Fix no structured comments
 warning for drm_gem_ttm_helper.h
Message-ID: <20190923065946.rlchr5hubkogutw4@sirius.home.kraxel.org>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190920193558.89815-2-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920193558.89815-2-sean@poorly.run>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Mon, 23 Sep 2019 06:59:48 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:35:52PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Fixes
> include/drm/drm_gem_ttm_helper.h:1: warning: no structured comments found

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

