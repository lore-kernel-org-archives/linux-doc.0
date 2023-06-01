Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CF5C77B7E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 14:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjFAOyP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 10:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbjFAOyO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 10:54:14 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA078123;
        Thu,  1 Jun 2023 07:54:09 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59AB1063;
        Thu,  1 Jun 2023 07:54:54 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87A763F663;
        Thu,  1 Jun 2023 07:54:07 -0700 (PDT)
Message-ID: <e2f2c524-c7c5-7a55-aee5-699b069a445a@arm.com>
Date:   Thu, 1 Jun 2023 15:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/5] perf: arm_cspmu: Support shared interrupts
Content-Language: en-GB
To:     Ilkka Koskinen <ilkka@os.amperecomputing.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Besar Wicaksono <bwicaksono@nvidia.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230601030144.3458136-1-ilkka@os.amperecomputing.com>
 <20230601030144.3458136-3-ilkka@os.amperecomputing.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230601030144.3458136-3-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023-06-01 04:01, Ilkka Koskinen wrote:
> Some of the PMUs may share the interrupt. Support them by
> setting IRQF_SHARED

This has the usual problem of allowing any PMU instance to move the IRQ 
affinity to a different CPU without also migrating all the other PMU 
contexts, and thus breaking perf core's assumptions of mutual exclusion.

Thanks,
Robin.

> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   drivers/perf/arm_cspmu/arm_cspmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 88547a2b73e6..cc5204d1b5fb 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1067,8 +1067,8 @@ static int arm_cspmu_request_irq(struct arm_cspmu *cspmu)
>   		return irq;
>   
>   	ret = devm_request_irq(dev, irq, arm_cspmu_handle_irq,
> -			       IRQF_NOBALANCING | IRQF_NO_THREAD, dev_name(dev),
> -			       cspmu);
> +			       IRQF_NOBALANCING | IRQF_NO_THREAD | IRQF_SHARED,
> +			       dev_name(dev), cspmu);
>   	if (ret) {
>   		dev_err(dev, "Could not request IRQ %d\n", irq);
>   		return ret;
