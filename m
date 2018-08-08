Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 84EF67E3D1
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 09:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbeHHLco (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 07:32:44 -0400
Received: from 8bytes.org ([81.169.241.247]:60904 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727174AbeHHLco (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Aug 2018 07:32:44 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 7DD682EA; Wed,  8 Aug 2018 11:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=8bytes.org; s=mail-1;
        t=1533719635; bh=7ZFcRR7M/mZfzjWZIjVz2jVZ4Dq5tB4gZ5scTn5OMTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrLQOm+Emje7OPRGWYoa/jpYQpeVIoBnp/5IenG0tijkT6OnD5BtGA1FHi4XcSlLT
         wqnDQuGR4WDjty70l7VG7HxWM3lrX2aF8yiq1Dys6YGuPGq08TYzh7cUtfw5QfPboe
         5rBkCxengu856MfA6w3DQXrb7LcbcOwfYtWOpIUrc11VzhWF65go1D/u9g9/0suxiJ
         H/Z27AiRp1eiqLy6ZPHkZVU0PA5tw7exNQOQSt+a0grRlImM2A0fmrqfkBXMXOY0KA
         fybGlfU3nA78knd+VyElfM6ct/LrZMWmIXfNIbh+EPisO+BU9q6pxK7cVJ3rSzb1Oo
         83T4ciRLUS26w==
Date:   Wed, 8 Aug 2018 11:13:54 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Kenneth Lee <nek.in.cn@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kenneth Lee <liguozhu@hisilicon.com>,
        Hao Fang <fanghao11@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Zaibo Xu <xuzaibo@huawei.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, iommu@lists.linux-foundation.org,
        kvm@vger.kernel.org, linux-accelerators@lists.ozlabs.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Sanjay Kumar <sanjay.k.kumar@intel.com>, linuxarm@huawei.com
Subject: Re: [RFC PATCH 2/7] iommu: Add share domain interface in iommu for
 spimdev
Message-ID: <20180808091354.ppqgineql3pufwwr@8bytes.org>
References: <20180801102221.5308-1-nek.in.cn@gmail.com>
 <20180801102221.5308-3-nek.in.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180801102221.5308-3-nek.in.cn@gmail.com>
User-Agent: NeoMutt/20170421 (1.8.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 01, 2018 at 06:22:16PM +0800, Kenneth Lee wrote:
> From: Kenneth Lee <liguozhu@hisilicon.com>
> 
> This patch add sharing interface for a iommu_group. The new interface:
> 
> 	iommu_group_share_domain()
> 	iommu_group_unshare_domain()
> 
> can be used by some virtual iommu_group (such as iommu_group for spimdev)
> to share their parent's iommu_group.
> 
> When the domain of the group is shared, it cannot be changed before
> unshared.  In the future, notification can be added if update is required.

From the description or the patch I don't really get why this is needed.
Please update the description and make a case for this API addition.


	Joerg
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
