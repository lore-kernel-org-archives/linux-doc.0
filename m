Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173CDC433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBF4D613F3
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhDOG0H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 02:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229731AbhDOG0H (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 02:26:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C312C60231;
        Thu, 15 Apr 2021 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618467944;
        bh=u6Zbi9B9esvESnvVaCVhd8dbXhNBWXXPVerlvWC5DkM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=QZ1A/yEGGX2P2VrhXdEp5ToU/KBUIvJ/ERRoD282g3Bw+RaKxPQk+WoWtR285oxsA
         +arohWu9RUkY9VwFORFeiwieESuW+8DwEdIWY/a7BHRUfi+IU9JYghOi0fOTJ+X2Fe
         hCpufg6UyUF5YXpJo/j4psx9roec1Yd9a6AP6IX7ejWwhslLvmklylzZOHl8dFED//
         nCrj6XNpje5eczPAawNJgzxBh+Gff2HoS/2kQi8xQC6EMcTEKQgpmoKX3kCJ/emSZm
         1KWjAjkOIbs11uzTr+JclFbnnkG5K8drAWj2ZgQRsRoLtI1qb/SYhn+sBzIrUfjPxI
         iAuHsU3o3yl7w==
Message-ID: <723b2858c61898df02e57bb2aaa4c4b4b3c30c50.camel@kernel.org>
Subject: Re: [PATCH net-next 3/6] ethtool: add FEC statistics
From:   Saeed Mahameed <saeed@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, michael.chan@broadcom.com, leon@kernel.org,
        ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com,
        f.fainelli@gmail.com, andrew@lunn.ch, mkubecek@suse.cz,
        ariela@nvidia.com, corbet@lwn.net, linux-doc@vger.kernel.org
Date:   Wed, 14 Apr 2021 23:25:43 -0700
In-Reply-To: <20210414034454.1970967-4-kuba@kernel.org>
References: <20210414034454.1970967-1-kuba@kernel.org>
         <20210414034454.1970967-4-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2021-04-13 at 20:44 -0700, Jakub Kicinski wrote:
> ethtool_link_ksettings *);
> +       void    (*get_fec_stats)(struct net_device *dev,
> +                                struct ethtool_fec_stats
> *fec_stats);

why void ? some drivers need to access the FW and it could be an old
FW/device where the fec stats are not supported.
and sometimes e.g. in mlx5 case FW can fail for FW related businesses
:)..

