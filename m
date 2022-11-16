Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1E7C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 14:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbiKPOlg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 09:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbiKPOlR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 09:41:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3983E0A0;
        Wed, 16 Nov 2022 06:41:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A99561D94;
        Wed, 16 Nov 2022 14:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9EAC433C1;
        Wed, 16 Nov 2022 14:41:12 +0000 (UTC)
Date:   Wed, 16 Nov 2022 14:41:07 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        will@kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Morse <james.morse@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 2/2] arm64: errata: Workaround possible Cortex-A715
 [ESR|FAR]_ELx corruption
Message-ID: <Y3T2g5yvOSfkAHmm@arm.com>
References: <20221116140915.356601-1-anshuman.khandual@arm.com>
 <20221116140915.356601-3-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116140915.356601-3-anshuman.khandual@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 16, 2022 at 07:39:15PM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index d20f5da2d76f..6a4a1ab8eb23 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -49,6 +49,15 @@ extern pte_t huge_ptep_get(pte_t *ptep);
>  
>  void __init arm64_hugetlb_cma_reserve(void);
>  
> +#define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
> +extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
> +					 unsigned long addr, pte_t *ptep);
> +
> +#define huge_ptep_modify_prot_commit huge_ptep_modify_prot_commit
> +extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
> +					 unsigned long addr, pte_t *ptep,
> +					 pte_t old_pte, pte_t new_pte);

I wonder whether we should have kept this as static inline in the header
file. But we can move them later if anyone complains of a performance
regression.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
