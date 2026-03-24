Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1BB178372
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325839; cv=none; b=U4JKFj7pjLvO6Bhk02Mp6dUx0pwRZlg9/0cQ7uX0ridOt5csknbwEG1UY7pGZx8YJ1AEWykYcSXBphxmb9LrjIDkeiqLqJpOaLMLK1TbGVf0X33ZaAiPjj6MaWqm8XYHcMdr/efh3GpmcZJMuiDvLIU1XvKLjmYZ1eZUPsYD6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325839; c=relaxed/simple;
	bh=Yzpa+sMTl++Z0Swu0jEbd6VbyKzLf18TZMMC6kHywt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmf4jrlHBi+BzeobyDfhBG4vLPvPh0kanr4iqAgMYo0vH+rK8AF35it524C9i7saUFNyqDv1Bals437wI3ita5PAsGAEoVR5cSOP9eblQEU4mR2HJrHLYc+HvbSya7A/FrvB5gy65+N1bFm00OQRi5OEMFAx2zYjJr4EueDWD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4K2ebkI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C440F0R3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4K2ebkI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C440F0R3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774325836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=;
	b=X4K2ebkIrnkXYXEgBpsZ50TNuHEb5sJMw/P+lmq3ihZtn9hQWglO/iEwAZEpuLMWOQZ6a2
	bAVhKs13LAex7RcRGVkpAT4mMlbyX8j2fa0pB/07beslg4moQ5wwr+c22Hqs48kPXHagKM
	AcyIwZYKREE4DqhApLBC6oRCr7tiQRA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-92nGf5nHMz6ga2Y9dE7ALw-1; Tue, 24 Mar 2026 00:17:14 -0400
X-MC-Unique: 92nGf5nHMz6ga2Y9dE7ALw-1
X-Mimecast-MFC-AGG-ID: 92nGf5nHMz6ga2Y9dE7ALw_1774325834
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe456655so4690852a91.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 21:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774325834; x=1774930634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=;
        b=C440F0R3CS+wLWJ9YS97DrCtfhlavnkcyy3vx0knKWjwsGuvNPAvnbkxaK09iNVPIr
         2p3PCk/t/c99wymSyVgPl2wGpk7yZXRN597Pm/lmOJrPMMzmadd7ahjrGcwk/A5OCNL0
         YPQ2pVPXEqzqdP49Cz0pCTM/+yzwTo4y+W0Qli6W37qlSolulihGixIJfTjsl4kmtiDM
         2UDLlTNpnXY6mqli49mXXjeZ48yqgrPwGhL5nOZrLekMSkSgLK6pEchnl/TzgNwNfJZF
         Ux9uCjJkNLCjFvToPndqwbh5avvLLVYy8jdgXMSklH2mN28W82udnpR31CtIqqyuoq8G
         PKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325834; x=1774930634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=;
        b=J/9U+VuQHxX8UzZp41IH0F3WQnvP640abnI/t/yxjlUBrUXrqTd1OmQdil3jX+kQMQ
         MfzlMjILMaa9T2fTA5y8LLc+NOopNXR8ufU9l8qfk4iNmdMOo1BbId/0MHMcxg0mJS26
         rIhYWr3dhNAD4VWZkz65iVTEzP+65bSQMU/BN0/qGLkL0WBnhBsvyZQCII+Gwcx41Xk0
         1Zc6Daj4XN4dHVg987ezqALnfkXXeuPnJLD2upvHuRIu+T3W/rfoAZ71zyU1YDJokbFk
         xsF4ZoQ/fVsVkmgknMsJE63z3Z1hkgvdRMYzv+E9E5IqAF3lKu9LM733vGnc0a2YGzLi
         kJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGFYE8S6oc/HxK6KCd0uaRB/Ips3YWruewdCN6Lei/rzJOcDEslMY1Kn/XKdMuk5Y02ak5MsG3U6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXSWVo2jtXtEkw1NvU4/N49//mUM98IJnqCGaq5AU9LYB0DXd
	g09r/oTUJFQvZ6iU3Rcc+nS/DDSLSuGOuUS75YV9yWPlaA25LZCCEKayiR5N9uZ9y/kqxm5VfFl
	AiTIgzrc550YsnrnQotEZvLYvduJygbZGcqCRosV4MZvqToAeZYwjSkJgQkbpCA==
X-Gm-Gg: ATEYQzyl7rlKVk+uAnDbPnzs1PcnARA8jiTRPhICc5HWEOV471oUNUY/mIPybeYxTwb
	J2vTTCrwY91TfP78pELVWJ4m1+6tMlqiNY8mz9OgubfFPuWkUkt0JVersE1IVifUqrqS9GzMnzp
	1T1mKW1KoyKM+Zz26Q8mtKRvFavoJrS+HqitLNxdAEFqm9J679bcY+auudkhBkwpp3HhgxWxg1J
	AHvPEws2oFqKv8pAqdg+T4KL8ZmBTDXP9v4Dx6dlD6W4gMSHyIUabLgwGCZvEQOeZQIcXFQ39DW
	v0kfSqokZvFNZDj5bSnFAs4rFB+0/tHPKHAXLvv7jSCqnOG8pvOLO3wQqypuKQDhq+gxfIkhMeo
	rKX3vVncw2KI5aAY9oHY+XeNgl2Pw0WKDonQS4bQYmuH6oIbqEUddSwfZKrQolKej
X-Received: by 2002:a17:90b:33cd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35bd2b9743dmr11784477a91.7.1774325833641;
        Mon, 23 Mar 2026 21:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:33cd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35bd2b9743dmr11784442a91.7.1774325833157;
        Mon, 23 Mar 2026 21:17:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03220321sm691413a91.17.2026.03.23.21.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:17:12 -0700 (PDT)
Message-ID: <7b73d10e-4bfd-434f-b05f-25c4859a7abd@redhat.com>
Date: Tue, 24 Mar 2026 14:16:58 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 36/40] arm_mpam: Add workaround for T241-MPAM-1
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-37-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-37-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ben,

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM bandwidth partitioning controls will not be correctly configured,
> and hardware will retain default configuration register values, meaning
> generally that bandwidth will remain unprovisioned.
> 
> To address the issue, follow the below steps after updating the MBW_MIN
> and/or MBW_MAX registers.
> 
>   - Perform 64b reads from all 12 bridge MPAM shadow registers at offsets
>     (0x360048 + slice*0x10000 + partid*8). These registers are read-only.
>   - Continue iterating until all 12 shadow register values match in a loop.
>     pr_warn_once if the values fail to match within the loop count 1000.
>   - Perform 64b writes with the value 0x0 to the two spare registers at
>     offsets 0x1b0000 and 0x1c0000.
> 
> In the hardware, writes to the MPAMCFG_MBW_MAX MPAMCFG_MBW_MIN registers
> are transformed into broadcast writes to the 12 shadow registers. The
> final two writes to the spare registers cause a final rank of downstream
> micro-architectural MPAM registers to be updated from the shadow copies.
> The intervening loop to read the 12 shadow registers helps avoid a race
> condition where writes to the spare registers occur before all shadow
> registers have been updated.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> 
> Changes from James:
>    Merged the min/max update into a single
>    mpam_quirk_post_config_change() helper. Stashed the t241_id in the msc
>    instead of carrying the physical address around. Test the msc quirk bit
>    instead of a static key.
> 
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> return err from init
> Be specific about the errata in the init name,
>    mpam_enable_quirk_nvidia_t241 -> mpam_enable_quirk_nvidia_t241_1
> 
> Changes since v3:
> parentheses
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 +
>   drivers/resctrl/mpam_devices.c              | 88 +++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h             |  9 +++
>   3 files changed, 99 insertions(+)
> 

One question below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 4c300caad901..a65620f98e3a 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -247,6 +247,8 @@ stable kernels.
>   +----------------+-----------------+-----------------+-----------------------------+
>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>   +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>   +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index e66631f3f732..b1753498f07f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -29,6 +29,16 @@
>   
>   #include "mpam_internal.h"
>   
> +/* Values for the T241 errata workaround */
> +#define T241_CHIPS_MAX			4
> +#define T241_CHIP_NSLICES		12
> +#define T241_SPARE_REG0_OFF		0x1b0000
> +#define T241_SPARE_REG1_OFF		0x1c0000
> +#define T241_CHIP_ID(phys)		FIELD_GET(GENMASK_ULL(44, 43), phys)
> +#define T241_SHADOW_REG_OFF(sidx, pid)	(0x360048 + (sidx) * 0x10000 + (pid) * 8)
> +#define SMCCC_SOC_ID_T241		0x036b0241
> +static void __iomem *t241_scratch_regs[T241_CHIPS_MAX];
> +
>   /*
>    * mpam_list_lock protects the SRCU lists when writing. Once the
>    * mpam_enabled key is enabled these lists are read-only,
> @@ -630,7 +640,45 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>   	return ERR_PTR(-ENOENT);
>   }
>   
> +static int mpam_enable_quirk_nvidia_t241_1(struct mpam_msc *msc,
> +					   const struct mpam_quirk *quirk)
> +{
> +	s32 soc_id = arm_smccc_get_soc_id_version();
> +	struct resource *r;
> +	phys_addr_t phys;
> +
> +	/*
> +	 * A mapping to a device other than the MSC is needed, check
> +	 * SOC_ID is  NVIDIA T241 chip (036b:0241)
> +	 */
> +	if (soc_id < 0 || soc_id != SMCCC_SOC_ID_T241)
> +		return -EINVAL;
> +
> +	r = platform_get_resource(msc->pdev, IORESOURCE_MEM, 0);
> +	if (!r)
> +		return -EINVAL;
> +
> +	/* Find the internal registers base addr from the CHIP ID */
> +	msc->t241_id = T241_CHIP_ID(r->start);
> +	phys = FIELD_PREP(GENMASK_ULL(45, 44), msc->t241_id) | 0x19000000ULL;
> +
> +	t241_scratch_regs[msc->t241_id] = ioremap(phys, SZ_8M);
> +	if (WARN_ON_ONCE(!t241_scratch_regs[msc->t241_id]))
> +		return -EINVAL;

Those IO regions aren't unmapped when the MSCs are removed. I guess it would be
something to be improved? :-)


> +
> +	pr_info_once("Enabled workaround for NVIDIA T241 erratum T241-MPAM-1\n");
> +
> +	return 0;
> +}
> +
>   static const struct mpam_quirk mpam_quirks[] = {
> +	{
> +	/* NVIDIA t241 erratum T241-MPAM-1 */
> +	.init       = mpam_enable_quirk_nvidia_t241_1,
> +	.iidr       = MPAM_IIDR_NVIDIA_T241,
> +	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
> +	.workaround = T241_SCRUB_SHADOW_REGS,

Perhaps we need a more leading space for every line in the above block.

> +	},
>   	{ NULL } /* Sentinel */
>   };
>   
> @@ -1378,6 +1426,44 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>   	__mpam_write_reg(msc, reg, bm);
>   }
>   
> +static void mpam_apply_t241_erratum(struct mpam_msc_ris *ris, u16 partid)
> +{
> +	int sidx, i, lcount = 1000;
> +	void __iomem *regs;
> +	u64 val0, val;
> +
> +	regs = t241_scratch_regs[ris->vmsc->msc->t241_id];
> +
> +	for (i = 0; i < lcount; i++) {
> +		/* Read the shadow register at index 0 */
> +		val0 = readq_relaxed(regs + T241_SHADOW_REG_OFF(0, partid));
> +
> +		/* Check if all the shadow registers have the same value */
> +		for (sidx = 1; sidx < T241_CHIP_NSLICES; sidx++) {
> +			val = readq_relaxed(regs +
> +					    T241_SHADOW_REG_OFF(sidx, partid));
> +			if (val != val0)
> +				break;
> +		}
> +		if (sidx == T241_CHIP_NSLICES)
> +			break;
> +	}
> +
> +	if (i == lcount)
> +		pr_warn_once("t241: inconsistent values in shadow regs");
> +
> +	/* Write a value zero to spare registers to take effect of MBW conf */
> +	writeq_relaxed(0, regs + T241_SPARE_REG0_OFF);
> +	writeq_relaxed(0, regs + T241_SPARE_REG1_OFF);
> +}
> +
> +static void mpam_quirk_post_config_change(struct mpam_msc_ris *ris, u16 partid,
> +					  struct mpam_config *cfg)
> +{
> +	if (mpam_has_quirk(T241_SCRUB_SHADOW_REGS, ris->vmsc->msc))
> +		mpam_apply_t241_erratum(ris, partid);
> +}
> +
>   /* Called via IPI. Call while holding an SRCU reference */
>   static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   				      struct mpam_config *cfg)
> @@ -1457,6 +1543,8 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   		mpam_write_partsel_reg(msc, PRI, pri_val);
>   	}
>   
> +	mpam_quirk_post_config_change(ris, partid, cfg);
> +
>   	mutex_unlock(&msc->part_sel_lock);
>   }
>   
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e28a168419d4..e38954a735d8 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -130,6 +130,9 @@ struct mpam_msc {
>   	void __iomem		*mapped_hwpage;
>   	size_t			mapped_hwpage_sz;
>   
> +	/* Values only used on some platforms for quirks */
> +	u32			t241_id;
> +
>   	struct mpam_garbage	garbage;
>   };
>   
> @@ -220,6 +223,7 @@ struct mpam_props {
>   
>   /* Workaround bits for msc->quirks */
>   enum mpam_device_quirks {
> +	T241_SCRUB_SHADOW_REGS,
>   	MPAM_QUIRK_LAST
>   };
>   
> @@ -240,6 +244,11 @@ struct mpam_quirk {
>   				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf)	 | \
>   				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff))
>   
> +#define MPAM_IIDR_NVIDIA_T241	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0x241) | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b))
> +
>   /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>   enum mon_filter_options {
>   	COUNT_BOTH	= 0,

Thanks,
Gavin

