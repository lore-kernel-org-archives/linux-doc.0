Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B6047D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 11:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfDLLQx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 07:16:53 -0400
Received: from 8bytes.org ([81.169.241.247]:34386 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726682AbfDLLQx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:16:53 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 5249D21D; Fri, 12 Apr 2019 13:16:51 +0200 (CEST)
Date:   Fri, 12 Apr 2019 13:16:50 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        John Garry <john.garry@huawei.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        Sebastian Ott <sebott@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        David Woodhouse <dwmw2@infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        x86 <x86@kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v5 1/6] iommu: add generic boot option iommu.dma_mode
Message-ID: <20190412111649.GK4518@8bytes.org>
References: <20190409125308.18304-1-thunder.leizhen@huawei.com>
 <20190409125308.18304-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409125308.18304-2-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 09, 2019 at 08:53:03PM +0800, Zhen Lei wrote:
> +static int __init iommu_dma_mode_setup(char *str)
> +{
> +	if (!str)
> +		goto fail;
> +
> +	if (!strncmp(str, "passthrough", 11))
> +		iommu_default_dma_mode = IOMMU_DMA_MODE_PASSTHROUGH;
> +	else if (!strncmp(str, "lazy", 4))
> +		iommu_default_dma_mode = IOMMU_DMA_MODE_LAZY;
> +	else if (!strncmp(str, "strict", 6))
> +		iommu_default_dma_mode = IOMMU_DMA_MODE_STRICT;
> +	else
> +		goto fail;
> +
> +	pr_info("Force dma mode to be %d\n", iommu_default_dma_mode);

Printing a number is not very desriptive or helpful to the user. Please
print the name of the mode instead.


Regards,

	Joerg
