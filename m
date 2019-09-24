Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E882A7DF2B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 07:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503986AbfIXHrO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 03:47:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50632 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504004AbfIXHrN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Sep 2019 03:47:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1D55B793E5;
        Tue, 24 Sep 2019 07:47:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0A717154;
        Tue, 24 Sep 2019 07:47:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 77ED316E05; Tue, 24 Sep 2019 09:47:11 +0200 (CEST)
Date:   Tue, 24 Sep 2019 09:47:11 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        yc_chen@aspeedtech.com, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 03/12] drm/ast: Move cursor update code to
 ast_show_cursor()
Message-ID: <20190924074711.dnvzweetlpalzjn2@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-4-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 24 Sep 2019 07:47:13 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> -static void ast_hide_cursor(struct drm_crtc *crtc)
> -{
> -	struct ast_private *ast = crtc->dev->dev_private;
> -	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
> -}

> +static void ast_hide_cursor(struct drm_crtc *crtc)
> +{
> +	struct ast_private *ast = crtc->dev->dev_private;
> +
> +	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
> +}

Please split this into two patches, one which only moves the functions
and one which does the code changes.  Then it is easier to see the
actual code changes for ast_{show,hide}_cursor in the diff output of the
second patch.

cheers,
  Gerd

