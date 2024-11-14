Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9C1EEE6
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 01:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731549522; cv=none; b=lf273TlPOSb79gVIadNhI0Sxf0t+jwL6D50PL/Yib3BvBI6LE9cPqiNTz80VrB4dhFu27A6yOd9IL/lCkag1UOtdskghLe5E5RBJ0tP+9nv4j+Iz3BBbxKYBd3K4KrZd8yS3Z+nl4wzyqw2TabS72pqHxQ5kS6o9qpB0eYK0SZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731549522; c=relaxed/simple;
	bh=1AvkqFM/K4lgZXSMBhoMhPPTrckNEKyki5MsdsXXumI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fiRRsD9btIPJq9Vjc0mGYmxzF13pGur8LosdSJQ3/yb1WZmeyCG42Erw112vZgEDZ8PDzIrCcAP6lGUK05f3BsFw88RGq3um1lK1vZ2M9VIIor17IUGWkRvtjt+ujDMBq/PmbyRzMbNhaatzgXi36HE0c3WRlpdFhENj1pX7oAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xpjvg2yyLz21kq5;
	Thu, 14 Nov 2024 09:57:19 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A8941A016C;
	Thu, 14 Nov 2024 09:58:34 +0800 (CST)
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 09:58:33 +0800
Message-ID: <12cb538a-1006-2ab6-7ef3-867d6779bf82@hisilicon.com>
Date: Thu, 14 Nov 2024 09:58:33 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <wangwudi@hisilicon.com>,
	<prime.zeng@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
References: <20241113062759.1042187-1-wangzhou1@hisilicon.com>
 <86h68bz56e.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <86h68bz56e.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)

On 2024/11/13 20:31, Marc Zyngier wrote:
> On Wed, 13 Nov 2024 06:27:59 +0000,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> during unmapping operation, which will cause some vSGIs lost.
>>
>> To fix the issue, invalidate related vPE cache through GICR_INVALLR
>> after VMOVP.
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>> ---
>>  Documentation/arch/arm64/silicon-errata.rst |  2 +
>>  arch/arm64/Kconfig                          | 11 ++++
>>  drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++++++----
>>  3 files changed, 58 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 65bfab1b1861..77db10e944f0 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -258,6 +258,8 @@ stable kernels.
>>  | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
>>  |                | ,11} SMMU PMCG  |                 |                             |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>  +----------------+-----------------+-----------------+-----------------------------+
>>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 70d7f4f20225..0ea9c599681d 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1232,6 +1232,17 @@ config HISILICON_ERRATUM_161600802
>>  
>>  	  If unsure, say Y.
>>  
>> +config HISILICON_ERRATUM_162100801
>> +	bool "Hip09 162100801 erratum support"
>> +	default y
>> +	help
>> +	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> +	  during unmapping operation, which will cause some vSGIs lost.
>> +	  To fix the issue, invalidate related vPE cache through GICR_INVALLR
>> +	  after VMOVP.
>> +
>> +	  If unsure, say Y.
>> +
>>  config QCOM_FALKOR_ERRATUM_1003
>>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>>  	default y
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 52f625e07658..2cd1826b4bbd 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -44,6 +44,7 @@
>>  #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
>>  #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
>>  #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
>> +#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
>>  
>>  #define RD_LOCAL_LPI_ENABLED                    BIT(0)
>>  #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
>> @@ -61,6 +62,7 @@ static u32 lpi_id_bits;
>>  #define LPI_PENDBASE_SZ		ALIGN(BIT(LPI_NRBITS) / 8, SZ_64K)
>>  
>>  static u8 __ro_after_init lpi_prop_prio;
>> +static struct its_node *find_4_1_its(void);
>>  
>>  /*
>>   * Collection structure - just an ID, and a redistributor address to
>> @@ -3797,6 +3799,22 @@ static void its_vpe_db_proxy_move(struct its_vpe *vpe, int from, int to)
>>  	raw_spin_unlock_irqrestore(&vpe_proxy.lock, flags);
>>  }
>>  
>> +static void its_vpe_4_1_invall_locked(int cpu, struct its_vpe *vpe)
>> +{
>> +	void __iomem *rdbase;
>> +	u64 val;
>> +
>> +	val  = GICR_INVALLR_V;
>> +	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
>> +
>> +	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
>> +	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
>> +	gic_write_lpir(val, rdbase + GICR_INVALLR);
>> +
>> +	wait_for_syncr(rdbase);
>> +	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
>> +}
>> +
>>  static int its_vpe_set_affinity(struct irq_data *d,
>>  				const struct cpumask *mask_val,
>>  				bool force)
>> @@ -3866,6 +3884,16 @@ static int its_vpe_set_affinity(struct irq_data *d,
>>  	vpe->col_idx = cpu;
>>  
>>  	its_send_vmovp(vpe);
>> +
>> +	/*
>> +	 * Version of ITS is same in one system. As there is no cache in ITS,
>> +	 * and only cache in related GICR should be clean, directly use
>> +	 * GICR_INVALLR to clean cache, which will get a better performance
>> +	 * here.
>> +	 */
> 
> I don't think this comment brings much. Maybe better to just drop it.

OK, I will drop it in next version.

> 
>> +	if (find_4_1_its()->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801)
>> +		its_vpe_4_1_invall_locked(cpu, vpe);
>> +
> 
> Hold on, this is buggy. On a v4.0 implementation, this is obviously
> going to explode. You need to check the return value of find_4_1_its()
> for NULL.

Yes, I will fix this in next version.

Thanks,
Zhou

> 
> Thanks,
> 
> 	M.
> 
