Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75486EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jul 2023 08:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjGQIb4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jul 2023 04:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjGQIbz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 04:31:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C4DD8;
        Mon, 17 Jul 2023 01:31:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A27DE60EFB;
        Mon, 17 Jul 2023 08:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F85C433C7;
        Mon, 17 Jul 2023 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689582714;
        bh=Ed4Qa3jBWUrLcAVqoRASDBEf+9RhyoK1rB7ysC+vTls=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=A9nHFACJWNQ0sXmzT/XwBzVXV6dzdAP4JZwR1V/T1CT2N3Ng4THFmYDZbmKsp4iNA
         CsizUytpsjcUfg2RdQp4/ZFYphw8wlZB2f9wid/E6uSaJfJ+gnIc1gFG7QwN+UYrR5
         N3Tnx91uvC8TGXC2kvw/VeGUaCZ7pH5X/yyqziZvl5c5/PEMwPke0u/d4h7eHAq3/I
         Y1t0NAS0Et59T7ESzEOx3bkfGnE6rOktwCrj+QMHwTlvlpnJJZV/hM+sBuGmG0vkuV
         DxaPG5Z5FXphEHOS2nmGK01PsYqYqRCE2xSDN4smYjlooGiycuXhYVJBUShRtaf3bN
         XbCVZVonS021g==
Message-ID: <018cf2e0625710135918392df7479026.mripard@kernel.org>
Date:   Mon, 17 Jul 2023 08:31:51 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 16/17] drm/imagination: Add driver documentation
In-Reply-To: <20230714143015.112562-1-sarah.walker@imgtec.com>
References: <20230714143015.112562-1-sarah.walker@imgtec.com>
Cc:     afd@ti.com, airlied@gmail.com, boris.brezillon@collabora.com,
        christian.koenig@amd.com, corbet@lwn.net, dakr@redhat.com,
        daniel@ffwll.ch, donald.robson@imgtec.com,
        dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
        frank.binns@imgtec.com, hns@goldelico.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        luben.tuikov@amd.com, maarten.lankhorst@linux.intel.com,
        matthew.brost@intel.com, mripard@kernel.org, tzimmermann@suse.de
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 14 Jul 2023 15:30:15 +0100, Sarah Walker wrote:
> Add documentation for the UAPI and for the virtual memory design.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
