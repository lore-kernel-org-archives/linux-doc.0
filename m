Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE356C43334
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 06:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiGMGCw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 02:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234203AbiGMGCv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 02:02:51 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B640E71BDE
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 23:02:50 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6D6BB68AFE; Wed, 13 Jul 2022 08:02:46 +0200 (CEST)
Date:   Wed, 13 Jul 2022 08:02:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tianyu Lan <ltykernel@gmail.com>
Cc:     kernel test robot <oliver.sang@intel.com>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Christoph Hellwig <hch@lst.de>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev, lkp@lists.01.org, lkp@intel.com
Subject: Re: [EXTERNAL] [swiotlb] 44d89f2248:
 Kernel_panic-not_syncing:swiotlb_init_remap:nslabs=#too_small
Message-ID: <20220713060246.GA13497@lst.de>
References: <Ys43FtIumAsHPn+y@xsang-OptiPlex-9020> <c8edfbd4-afad-c018-daf6-aa2ac1f7b2fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8edfbd4-afad-c018-daf6-aa2ac1f7b2fe@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 13, 2022 at 01:58:38PM +0800, Tianyu Lan wrote:
> Thanks for report. The issue is caused by auto merging between
> commit44d89f("swiotlb: split up the global swiotlb lock") and commit 
> 0bf28fc40(swiotlb: panic if nslabs is too small). nslab is checked before 
> initialization.
>
> Christoph, do you prefer to update patch "swiotlb: split up the global 
> swiotlb lock" or append a fix patch on current brand?

Please just send a patch againt the current tree.  I'll see if squashing
it in makes any sense.
