Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA071D6DB9
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815656; cv=none; b=hPlrfs3aY+CMdUg1bz7NDrEBau+zomv8xcsu8jp1Xgs8qZGTWIj01dVoxn2NpS1+NwsBLorDa/WZcTx9OxakQkAEu8i2s530/epAa8S4/ihfDjuelF6zuMxxenrEqmP9v1ksud7GmWsexp9Eg7fNz1g1iObbo/oSEm/qs1XCZvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815656; c=relaxed/simple;
	bh=qjT6DAxnKhnQeqsznHSNrAal6hm2fq2/4eORRRpvL/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aGsG9jM+EnNBXnBBW2KPBy87t1N4r7qd4IHxWlUh+5q63immXnBSdKtcXpX9VmiFz10BjW0uolzTWnodeHdC6bhwOnqhpgSAUt0WN66RT3V8PbRufRd3xqSdZjBgHECOIJMCqqgtZokX1y2hTAuy0N8Ehz9nOKeCBY+UFe+e1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XjVTd719hz10PfW;
	Tue,  5 Nov 2024 22:05:09 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F3891800CF;
	Tue,  5 Nov 2024 22:07:29 +0800 (CST)
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 22:07:28 +0800
Message-ID: <79e81f5e-bd75-a07f-1c19-43518a218a77@hisilicon.com>
Date: Tue, 5 Nov 2024 22:07:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] irqchip/gicv3-its: Add workaround for hip09 ITS erratum
 162100801
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, Nianyao Tang <tangnianyao@huawei.com>,
	<wangwudi@hisilicon.com>
References: <20241104121143.2169264-1-wangzhou1@hisilicon.com>
 <87ed3qt7f1.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <87ed3qt7f1.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200012.china.huawei.com (7.221.188.145)

On 2024/11/5 16:24, Marc Zyngier wrote:
> On Mon, 04 Nov 2024 12:11:43 +0000,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
> 
> nit: enabling.

Will fix, thanks.

> 
>> during unmapping operation, which will cause some vSGIs interrupts lost.
>>
>> To fix the issue, it needs to send vinvall command after vmovp.
> 
> nit: commands need to be in capital letters (VINVALL, VMOVP). drop
> 'interrupts'.

Will fix, thanks.

> 
>>
>> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>> ---
>>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>  arch/arm64/Kconfig                          | 10 ++++++
>>  drivers/irqchip/irq-gic-v3-its.c            | 36 ++++++++++++++++-----
>>  3 files changed, 40 insertions(+), 8 deletions(-)
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
>> index fd9df6dcc593..27082e075d1a 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1232,6 +1232,16 @@ config HISILICON_ERRATUM_161600802
>>  
>>  	  If unsure, say Y.
>>  
>> +config HISILICON_ERRATUM_162100801
>> +	bool "Hip09 162100801 erratum support"
>> +	default y
>> +	help
>> +	  When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
>> +	  during unmapping operation, which will cause some vSGIs interrupts
>> +	  lost. So fix it by sending vinvall commands after vmovp.
> 
> Same remarks as above.

OK.

> 
> Now, the workaround seems odd. I understand from the description that
> VMAPP with V=0 results in leftover cached entries influencing the
> behaviour of a newly created VPE.
> 
VMAPP(V=0) only effects the cached entries of current VPE, the hardware problem
is that VMAPP(V=0) will fail to clean cached entries in other CPU dies.

> But if it is a VINVALL on each CPU that cures it, why don't we do that
> upfront, instead of on every single VMOVP?

As the reason above, even we add VINVALL before VMAPP(V=0), it can only clean
cached entries in current CPU die, there are still cached entries left in other
part of the system.

> 
> Or is the problem that VMAPP(V=0) can result in *existing* VPEs to
> observe an unrelated (or corrupted) state?
> 
>> +
>> +	  If unsure, say Y.
>> +
>>  config QCOM_FALKOR_ERRATUM_1003
>>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>>  	default y
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 52f625e07658..69b09072d24d 100644
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
>> @@ -1314,6 +1315,14 @@ static void its_send_vmapp(struct its_node *its,
>>  	its_send_single_vcommand(its, its_build_vmapp_cmd, &desc);
>>  }
>>  
>> +static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
>> +{
>> +	struct its_cmd_desc desc;
>> +
>> +	desc.its_vinvall_cmd.vpe = vpe;
>> +	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
>> +}
>> +
>>  static void its_send_vmovp(struct its_vpe *vpe)
>>  {
>>  	struct its_cmd_desc desc = {};
>> @@ -1351,17 +1360,12 @@ static void its_send_vmovp(struct its_vpe *vpe)
>>  
>>  		desc.its_vmovp_cmd.col = &its->collections[col_id];
>>  		its_send_single_vcommand(its, its_build_vmovp_cmd, &desc);
>> +		if (is_v4_1(its) && (its->flags &
>> +			    ITS_FLAGS_WORKAROUND_HISILICON_162100801))
>> +			its_send_vinvall(its, vpe);
>>  	}
>>  }
> 
> Please don't bury workarounds inside the command primitives (and VMOVP
> is complicated enough). There is a single place where we send VMOVP,
> and I'd rather you place the workaround there.

OK, will add VINVALL after its_send_vmovp.

> 
> But more importantly, this code isn't supposed to get executed with a
> GICv4.1 implementation, as the driver does not expect it to use an
> ITSList.
> 
> So what is your system implementing? Do you have such thing as GICv4.1
> with ITSList? If so, I'm pretty sure the driver is broken on with such
> mix...

I don't get the idea here, our system is as below, let's see if there is a
problem here. Our system is GICv4.1 with multiple ITSs, GITS_TYPER.vmovp is 0,
so VMOVP should be sent to each ITS.

In its_send_vmovp, its_list_map will not be 0. We are GICv4.1(GICR_TYPER.RVPEID is 1),
so require_its_list_vmovp will be true. It seems VMOVP can be called here.

Thanks,
Zhou

> 
> Thanks,
> 
> 	M.
> 
