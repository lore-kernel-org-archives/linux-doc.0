Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1E6C4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 02:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFEF722C9E
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 02:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLGCdd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Dec 2020 21:33:33 -0500
Received: from smtprelay0240.hostedemail.com ([216.40.44.240]:42220 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727040AbgLGCdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Dec 2020 21:33:33 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 3BDF818224D60;
        Mon,  7 Dec 2020 02:32:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: color32_1710dac273da
X-Filterd-Recvd-Size: 2830
Received: from XPS-9350.home (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Mon,  7 Dec 2020 02:32:48 +0000 (UTC)
Message-ID: <d33f6b90d50feb6c05bd45ffdedf3fb6d5ceb5ee.camel@perches.com>
Subject: Re: [PATCH 16/22] xlink-ipc: Add xlink ipc driver
From:   Joe Perches <joe@perches.com>
To:     mgross@linux.intel.com, markgross@kernel.org, arnd@arndb.de,
        bp@suse.de, damien.lemoal@wdc.com, dragan.cvetic@xilinx.com,
        gregkh@linuxfoundation.org, corbet@lwn.net,
        leonard.crestez@nxp.com, palmerdabbelt@google.com,
        paul.walmsley@sifive.com, peng.fan@nxp.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Seamus Kelly <seamus.kelly@intel.com>,
        linux-doc@vger.kernel.org,
        Ryan Carnaghi <ryan.r.carnaghi@intel.com>
Date:   Sun, 06 Dec 2020 18:32:47 -0800
In-Reply-To: <20201201223511.65542-17-mgross@linux.intel.com>
References: <20201201223511.65542-1-mgross@linux.intel.com>
         <20201201223511.65542-17-mgross@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-12-01 at 14:35 -0800, mgross@linux.intel.com wrote:
> From: Seamus Kelly <seamus.kelly@intel.com>
> 
> Add xLink driver, which interfaces the xLink Core driver with the Keem
> Bay VPU IPC driver, thus enabling xLink to control and communicate with
> the VPU IP present on the Intel Keem Bay SoC.

Trivial style comments:

> diff --git a/drivers/misc/xlink-ipc/xlink-ipc.c b/drivers/misc/xlink-ipc/xlink-ipc.c

[]

> +/*
> + * xlink_reserved_memory_init() - Initialize reserved memory for the device.
> + *
> + * @xlink_dev:	[in] The xlink ipc device the reserved memory is allocated to.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int xlink_reserved_memory_init(struct xlink_ipc_dev *xlink_dev)
> +{
> +	struct device *dev = &xlink_dev->pdev->dev;
> +
> +	xlink_dev->local_xlink_mem.dev = init_xlink_reserved_mem_dev(dev,
> +								     "xlink_local_reserved",
> +								     LOCAL_XLINK_IPC_BUFFER_IDX);
> +	if (!xlink_dev->local_xlink_mem.dev)
> +		return -ENOMEM;

This sort of code, with a repeated struct dereference, generally reads
better using a temporary and is also less prone to typo use.

	struct device *dev = &xlink_dev->pdev->dev;
	struct xlink_buf_mem *lxm = &xlink_dev->local_xlink_mem;

	lxm->dev = init_xlink_reserved_mem_dev(dev, "xlink_local_reserved",
					       LOCAL_XLINK_IPC_BUFFER_IDX);
	if (!lxm->dev)
		return -ENOMEM;

> +	xlink_dev->local_xlink_mem.size = get_xlink_reserved_mem_size(dev,
> +								      LOCAL_XLINK_IPC_BUFFER_IDX);

	lxm->size = get_xlink_reserved_mem_size(dev, LOCAL_XLINK_IPC_BUFFER_IDX);

etc...



