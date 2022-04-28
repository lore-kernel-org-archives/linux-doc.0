Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0064AC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 28 Apr 2022 08:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343984AbiD1IUT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Apr 2022 04:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343983AbiD1IUS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Apr 2022 04:20:18 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35277CB29
        for <linux-doc@vger.kernel.org>; Thu, 28 Apr 2022 01:17:03 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 01A4C2FB; Thu, 28 Apr 2022 10:16:59 +0200 (CEST)
Date:   Thu, 28 Apr 2022 10:16:58 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Alex Deucher <alexander.deucher@amd.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com,
        tglx@linutronix.de, Suravee.Suthikulpanit@amd.com, will@kernel.org,
        iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        Vasant.Hegde@amd.com
Subject: Re: [PATCH] Documentation: x86: rework IOMMU documentation
Message-ID: <YmpNevdJFec0+9Mn@8bytes.org>
References: <20220422200607.627754-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422200607.627754-1-alexander.deucher@amd.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 22, 2022 at 04:06:07PM -0400, Alex Deucher wrote:
> Add preliminary documentation for AMD IOMMU and combine
> with the existing Intel IOMMU documentation and clean
> up and modernize some of the existing documentation to
> align with the current state of the kernel.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
> 
> V2: Incorporate feedback from Robin to clarify IOMMU vs DMA engine (e.g.,
>     a device) and document proper DMA API.  Also correct the fact that
>     the AMD IOMMU is not limited to managing PCI devices.
> v3: Fix spelling and rework text as suggested by Vasant
> v4: Combine Intel and AMD documents into a single document as suggested
>     by Dave Hansen
> v5: Clarify that keywords are related to ACPI, grammatical fixes
> v6: Make more stuff common based on feedback from Robin
> 
>  Documentation/x86/index.rst       |   2 +-
>  Documentation/x86/intel-iommu.rst | 115 ------------------------
>  Documentation/x86/iommu.rst       | 143 ++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/x86/intel-iommu.rst
>  create mode 100644 Documentation/x86/iommu.rst

Acked-by: Joerg Roedel <jroedel@suse.de>

Jonathan, will you merge that through the documentation tree?
