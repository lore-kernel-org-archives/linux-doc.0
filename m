Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B483C38A2D
	for <linux-doc@archiver.kernel.org>; Wed, 26 Oct 2022 16:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbiJZQLN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Oct 2022 12:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbiJZQLM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Oct 2022 12:11:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8B98E731;
        Wed, 26 Oct 2022 09:11:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72647B82364;
        Wed, 26 Oct 2022 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6622BC433C1;
        Wed, 26 Oct 2022 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666800669;
        bh=EteKDBbBU8yCTQnVOowyAMycNVt8iAJFS9s3TQ4DikU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b5Vb/6CI4xcyaCkeg8+c6b1e01mRYeutOYX4d5Rm5mLRl3eHXMtTiiCaVinddKE4/
         0sFswnWx8lT7UmjaJJLqK517Kueh/jMj2Mp2x0YvC46kT2o/R9uKRN70y2wSSiWGyq
         Wb4l0S10S9TwFofqNKznK/H7p9Zpy1JeUv7LLuYeDEVnQQmBCUK4keDmbRpLYWK2zE
         RKloIQSQiyDic2jsdg0rsbnOUzFMk/j6w++yzJ4xBfj28Lvjd+VHbHdJLyK5ipNt+Q
         F/nA5h4WU0+R3llf0GqxQ1BLSNd//AAxzirvVdIkUT7sUH2PqOpFbCf2rD3Dt8WRhj
         qclX3pWUSs24g==
Date:   Wed, 26 Oct 2022 09:11:07 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, andrew@lunn.ch, saeedm@nvidia.com,
        corbet@lwn.net, michael.chan@broadcom.com,
        huangguangbin2@huawei.com, chenhao288@hisilicon.com,
        moshet@nvidia.com, linux@rempel-privat.de,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] ethtool: linkstate: add a statistic for PHY
 down events
Message-ID: <20221026091107.0f938d29@kernel.org>
In-Reply-To: <20221026074032.GF8675@pengutronix.de>
References: <20221026020948.1913777-1-kuba@kernel.org>
        <20221026074032.GF8675@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 26 Oct 2022 09:40:32 +0200 Oleksij Rempel wrote:
> s/LinkDownEvents/link_down_events.

Fair point, my brain got wedged on the IEEE stats naming.
