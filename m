Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9ACB27D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 04:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751818AbeE3Eb2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 00:31:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750770AbeE3Eb1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 May 2018 00:31:27 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F9CD20842;
        Wed, 30 May 2018 04:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527654686;
        bh=rveyNb4VYwg3ucLfQbKmFI0uJ5bHKt/1aqwwxEVUXTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZEgrk/pCwAXwABShQ4wKQqf5gRbJGmSaF/n7Q285uF2QwBro0fbveTnWIDt0NDtnU
         pJwAEYngm5zmuZZNukoXcBp/xutkLzG9FZd3rqF2FIGnLQGJJXM38Sk1MlJw16iuSl
         fGfMu7KGgtqSEqkKyDE56prh/zqSfQA5SVSGdXj4=
Date:   Wed, 30 May 2018 06:31:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sinan Kaya <okaya@codeaurora.org>
Cc:     linux-pci@vger.kernel.org, timur@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Rientjes <rientjes@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Dongdong Liu <liudongdong3@huawei.com>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: Add pci=safemode option
Message-ID: <20180530043103.GA19734@kroah.com>
References: <1527650389-31575-1-git-send-email-okaya@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527650389-31575-1-git-send-email-okaya@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 29, 2018 at 11:19:41PM -0400, Sinan Kaya wrote:
> Adding pci=safemode kernel command line parameter to turn off all PCI
> Express service driver as well as all optional PCIe features such as LTR,
> Extended tags, Relaxed Ordering etc.
> 
> Also setting MPS configuration to PCIE_BUS_SAFE so that MPS and MRRS can be
> reconfigured with by the kernel in case BIOS hands off a broken
> configuration.

Why not fix the BIOS?  That's what sane platforms do :)

> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 ++
>  drivers/pci/pci.c                               | 7 +++++++
>  drivers/pci/pci.h                               | 2 ++
>  drivers/pci/pcie/portdrv_core.c                 | 2 +-
>  drivers/pci/probe.c                             | 6 ++++++
>  5 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 641ec9c..247adbb 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3153,6 +3153,8 @@
>  		noari		do not use PCIe ARI.
>  		noats		[PCIE, Intel-IOMMU, AMD-IOMMU]
>  				do not use PCIe ATS (and IOMMU device IOTLB).
> +		safemode	turns of all optinal PCI features. Useful
> +				for bringup/troubleshooting.

s/optinal/optional/ ?

And you should explain what exactly in PCI is "optional".  Who defines
this and where is that list and what can go wrong if those options are
not enabled?

In looking at your patch, I can't determine that at all, so there's no
way that someone just looking at this sentence will be able to
understand.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
