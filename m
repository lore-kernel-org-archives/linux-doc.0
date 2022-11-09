Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBAC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 17:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiKIRC3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 12:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiKIRBZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 12:01:25 -0500
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C462791C;
        Wed,  9 Nov 2022 09:00:01 -0800 (PST)
Received: from frapeml500006.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N6rgx1tkYz67LGD;
        Thu, 10 Nov 2022 00:55:41 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 17:59:59 +0100
Received: from localhost (10.45.145.27) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 16:59:55 +0000
Date:   Wed, 9 Nov 2022 16:59:52 +0000
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Yicong Yang <yangyicong@huawei.com>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>, <liuqi6124@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        John Garry <john.garry@huawei.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
        <f.fangjian@huawei.com>, <prime.zeng@huawei.com>
Subject: Re: [PATCH 1/3] drivers/perf: hisi: Fix some event id for
 hisi-pcie-pmu
Message-ID: <20221109165952.000053f3@Huawei.com>
In-Reply-To: <20221025113242.58271-2-yangyicong@huawei.com>
References: <20221025113242.58271-1-yangyicong@huawei.com>
        <20221025113242.58271-2-yangyicong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.145.27]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Oct 2022 19:32:40 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Some event id of hisi-pcie-pmu is incorrect, fix them.
> 
> Fixes: 8404b0fbc7fb ("drivers/perf: hisi: Add driver for HiSilicon PCIe PMU")
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
FWIW given these are magic value updates.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> ---
>  drivers/perf/hisilicon/hisi_pcie_pmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> index 21771708597d..071e63d9a9ac 100644
> --- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
> @@ -693,10 +693,10 @@ static struct attribute *hisi_pcie_pmu_events_attr[] = {
>  	HISI_PCIE_PMU_EVENT_ATTR(rx_mrd_cnt, 0x10210),
>  	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_latency, 0x0011),
>  	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_cnt, 0x10011),
> -	HISI_PCIE_PMU_EVENT_ATTR(rx_mrd_flux, 0x1005),
> -	HISI_PCIE_PMU_EVENT_ATTR(rx_mrd_time, 0x11005),
> -	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_flux, 0x2004),
> -	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_time, 0x12004),
> +	HISI_PCIE_PMU_EVENT_ATTR(rx_mrd_flux, 0x0804),
> +	HISI_PCIE_PMU_EVENT_ATTR(rx_mrd_time, 0x10804),
> +	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_flux, 0x0405),
> +	HISI_PCIE_PMU_EVENT_ATTR(tx_mrd_time, 0x10405),
>  	NULL
>  };
>  

