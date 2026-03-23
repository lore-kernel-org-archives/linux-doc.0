Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9A3112BC
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307384; cv=none; b=PYE09GVA1kbCpeF2YU28abIb/LyvIeRa6CIopli+FPfddTMldAZ36JlWyi3ZNOu2lTCX8pNjNmSHzKBOl24H4HV4PvsBw1WIdHXjW3GtYziHVW7JihqPu2ubGZ9CNr3RR2tBah3ZiZtuOXsQ7RQl66T3+VTGIB//dRcOJsDOi5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307384; c=relaxed/simple;
	bh=pxCj5rWOs3ny5fvc3f5B24+pA8ipUdFoWgqFJzlnhwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sgy5IX5/yFiYLlFMOSyN2ogh4T3t2uhruNuTzEvl5Z5MTVPAJygvHtCKxnXfbhgTvAZ5sTZitoETOtuOKBbjdVrNsfkNFGA6Y4+82AqzSdunYipPISJUxND80qGiHQkdUQ8P4JmpafVwBRm7l0QvGB4Ay+IAxJpH6F8nrgonqCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V80Jyiz9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUUJDsXT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V80Jyiz9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OUUJDsXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774307380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=;
	b=V80Jyiz9lH/+oK89Ye7m3Hkk6dmj9GnvVZqJi6YjeX0nbcGWi4W5ksqlO4aFzZmTiYVUA+
	fEIVbEiDvaqvxoLFiFCINPUza7JS9bdLKeE0342f4amKGbAkV1oE5e8rSBpkycfm+QKJeT
	AghTWWzC84U7Fgz/lDcb9cjv/zVn42k=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-DRORRO1uP0CD8G7c1JUkIg-1; Mon, 23 Mar 2026 19:09:39 -0400
X-MC-Unique: DRORRO1uP0CD8G7c1JUkIg-1
X-Mimecast-MFC-AGG-ID: DRORRO1uP0CD8G7c1JUkIg_1774307378
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a11aeee8cso1769590b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774307378; x=1774912178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=;
        b=OUUJDsXTk38+ZYsnb7dUn+g9qRzkOqElV0EbntQPda/qFPYpZxSp28V3oXBQJgw/HK
         lfljmmBAVBzx000kljX9SfrHM0Uhjbl8e4cr5C6dP1A1r6J0GPwcciQuOfXyI+xG0EXV
         WNMd4fCM0OElilW7G7Nzergjew2mvu9k8jcwvnIErxpuPN2yLmrM7Y34uk2gWHuPRYLC
         2NLxrikDXsNap1Vdsr1XtHBqK4U4KqdKlXrSLb4e0fJR9jkoGpMq5rQPVcEwP/mMRAI1
         Qgbtt973yqt/ogWYMShYssIRNvDV9FYYqFPhMHIKRdv4+eB1GnlIWj2hiW2JwXaqHKcC
         mvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307378; x=1774912178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=;
        b=BR2lQ+86Z5+6Gl9MdZiXuyp6uK+vZ70Ui5mYSgTlbonqph+KcOje/Ig2XQ1i1C3leV
         orEnX/W3OREAkR3wYYEFNOe2wmz2GZSHfxBvm4aE2YaHrSwvd2Qcf42StEIqscqturvt
         9B48Hz3nkaYrQYKMG/yWkaP2NDAv0J2RQ1vSrygQ6HcKyNzfAHu4dwwfsWjcs0ZpI493
         LhHxA1O15AGV30nHLOsmKBuyQD/P0vPou2ywpJqeBBfIk1T9GFBgE9bK1Ncu5+XYF045
         DcUs/Kw3DZARp/6bmhzhEXCpg+FdS6CXGZAo0iae5qWQ3J/WTFOBeXsIDN1WSzPwf24Q
         mPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpC4lHPj27smRE57e4Jf1fQ6JmUmklv+sRl19GKZcsTaanKIJVrYMV5lhDDf0AKr0Cwn+2Z2MLvRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnafAzNr5+vWxcGiCORlx+mICe05GskuWKYXSVw3ImccdjG2zS
	KY2pa5vyhHn8Nt3JfkPePEDp/fDR2mdNWMB5PmksNUTCndNGJBOx7T62pcVuXbH8yWynfDXJ17V
	DOxZihyqxoz7Dan5M7vFJ2IcpxZal5z+ewaSqgadCC0Etfbu0rUMoIfYYXUauhw==
X-Gm-Gg: ATEYQzzv31gsN+6MOeaqbzyqpa3wDlN0cyVNXWHFxABQafBTMJ26gO8EVi4mfIH9b3B
	IJtpMwyFPTvYZZYMjWmsWxRHX63hbS0seoOBbr9Rw0cMlFolh0DEPMfGy2MNOin9BqjYP4hK294
	jWAkml/qwk7d0tsn+HRh2hczkyymmWktLODLi/e0FD5CP2an5S0oOlwvKqyad0fOtYihL1V+HMK
	sbw2dis2blM5F+cukLeOOMBr0egh3ThzPeXToJDXHaXVbGooNSJJtHOFWC417ANjQoQpHnghCCj
	0l/f9tGyu9hcAS+VmNgX0zeGjckiJSL15vzDmfgsLZ6iVeXewJxiHccsDm/JAeuUxrKulMa421L
	iumeXbYqaBWiOGfIRODznod8BqKhgUWmbUdJ87BTCs29MLjSMZZ6Mv+4S96oULT52
X-Received: by 2002:a05:6a00:f88:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-82a8c39ec60mr11026950b3a.59.1774307378129;
        Mon, 23 Mar 2026 16:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:f88:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-82a8c39ec60mr11026933b3a.59.1774307377640;
        Mon, 23 Mar 2026 16:09:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409b455sm10539686b3a.28.2026.03.23.16.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:09:37 -0700 (PDT)
Message-ID: <3ae3356d-a901-4b71-90df-557d468e4785@redhat.com>
Date: Tue, 24 Mar 2026 09:09:20 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/40] arm_mpam: resctrl: Add support for 'MB' resource
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
 <20260313144617.3420416-26-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-26-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ben,

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl supports 'MB', as a percentage throttling of traffic from the
> L3. This is the control that mba_sc uses, so ideally the class chosen
> should be as close as possible to the counters used for mbm_total. If there
> is a single L3, it's the last cache, and the topology of the memory matches
> then the traffic at the memory controller will be equivalent to that at
> egress of the L3. If these conditions are met allow the memory class to
> back MB.
> 
> MB's percentage control should be backed either with the fixed point
> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
> bitmaps is not used as its tricky to pick which bits to use to avoid
> contention, and may be possible to expose this as something other than a
> percentage in the future.
> 
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Code flow change
> Commit message 'or'
> 
> Changes since v3:
> initialise tmp_cpumask
> update commit message
> check the traffic matches l3
> update comment on candidate_class update, only mbm_total
> drop tags due to rework
> 
> Changes since v4:
> Move __free declarations to point of first use
> New line for a '{'
> set r->alloc_capable last (Reinette)
> 
> Changes since v5:
> Mention L3 needs to be the last cache in commit message
> Consider memory side caches and numa nodes
> ---
>   drivers/resctrl/mpam_resctrl.c | 287 ++++++++++++++++++++++++++++++++-
>   1 file changed, 286 insertions(+), 1 deletion(-)
> 

One comment below and it deserves to be addressed if we have another respin:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 93c8a9608ed4..cad65cf7d12d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -267,6 +267,33 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
>   	return class->props.cpbm_wd <= 32;
>   }
>   
> +static bool mba_class_use_mbw_max(struct mpam_props *cprops)
> +{
> +	return (mpam_has_feature(mpam_feat_mbw_max, cprops) &&
> +		cprops->bwa_wd);
> +}
> +
> +static bool class_has_usable_mba(struct mpam_props *cprops)
> +{
> +	return mba_class_use_mbw_max(cprops);
> +}
> +
> +/*
> + * Calculate the worst-case percentage change from each implemented step
> + * in the control.
> + */
> +static u32 get_mba_granularity(struct mpam_props *cprops)
> +{
> +	if (!mba_class_use_mbw_max(cprops))
> +		return 0;
> +
> +	/*
> +	 * bwa_wd is the number of bits implemented in the 0.xxx
> +	 * fixed point fraction. 1 bit is 50%, 2 is 25% etc.
> +	 */
> +	return DIV_ROUND_UP(MAX_MBA_BW, 1 << cprops->bwa_wd);
> +}
> +
>   /*
>    * Each fixed-point hardware value architecturally represents a range
>    * of values: the full range 0% - 100% is split contiguously into
> @@ -317,6 +344,166 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
>   	return val;
>   }
>   
> +static u32 get_mba_min(struct mpam_props *cprops)
> +{
> +	if (!mba_class_use_mbw_max(cprops)) {
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +
> +	return mbw_max_to_percent(0, cprops);
> +}
> +
> +/* Find the L3 cache that has affinity with this CPU */
> +static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
> +{
> +	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	lockdep_assert_cpus_held();
> +
> +	return mpam_get_cpumask_from_cache_id(cache_id, 3, tmp_cpumask);
> +}
> +
> +/*
> + * topology_matches_l3() - Is the provided class the same shape as L3
> + * @victim:		The class we'd like to pretend is L3.
> + *
> + * resctrl expects all the world's a Xeon, and all counters are on the
> + * L3. We allow some mapping counters on other classes. This requires
> + * that the CPU->domain mapping is the same kind of shape.
> + *
> + * Using cacheinfo directly would make this work even if resctrl can't
> + * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
> + * Using the L3 resctrl domain list also depends on CPUs being online.
> + * Using the mpam_class we picked for L3 so we can use its domain list
> + * assumes that there are MPAM controls on the L3.
> + * Instead, this path eventually uses the mpam_get_cpumask_from_cache_id()
> + * helper which can tell us about offline CPUs ... but getting the cache_id
> + * to start with relies on at least one CPU per L3 cache being online at
> + * boot.
> + *
> + * Walk the victim component list and compare the affinity mask with the
> + * corresponding L3. The topology matches if each victim:component's affinity
> + * mask is the same as the CPU's corresponding L3's. These lists/masks are
> + * computed from firmware tables so don't change at runtime.
> + */
> +static bool topology_matches_l3(struct mpam_class *victim)
> +{
> +	int cpu, err;
> +	struct mpam_component *victim_iter;
> +
> +	lockdep_assert_cpus_held();
> +
> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
> +		return false;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(victim_iter, &victim->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (cpumask_empty(&victim_iter->affinity)) {
> +			pr_debug("class %u has CPU-less component %u - can't match L3!\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
> +		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +			return false;
> +
> +		cpumask_clear(tmp_cpumask);
> +		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +		if (err) {
> +			pr_debug("Failed to find L3's equivalent component to class %u component %u\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		/* Any differing bits in the affinity mask? */
> +		if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
> +			pr_debug("class %u component %u has Mismatched CPU mask with L3 equivalent\n"
> +				 "L3:%*pbl != victim:%*pbl\n",
> +				 victim->level, victim_iter->comp_id,
> +				 cpumask_pr_args(tmp_cpumask),
> +				 cpumask_pr_args(&victim_iter->affinity));
> +
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Test if the traffic for a class matches that at egress from the L3. For
> + * MSC at memory controllers this is only possible if there is a single L3
> + * as otherwise the counters at the memory can include bandwidth from the
> + * non-local L3.
> + */
> +static bool traffic_matches_l3(struct mpam_class *class)
> +{
> +	int err, cpu;
> +
> +	lockdep_assert_cpus_held();
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level == 3)
> +		return true;
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
> +		pr_debug("class %u is a different cache from L3\n", class->level);
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n", class->level);
> +		return false;
> +	}
> +

We bail if the calss isn't MPAM_CLASS_MEMORY here ...

> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL)) {
> +		pr_debug("cpumask allocation failed\n");
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n",
> +			 class->level);
> +		return false;
> +	}
> +

Duplicated check here as the previous one. So this check can be dropped.

> +	cpu = cpumask_any_and(&class->affinity, cpu_online_mask);
> +	err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +	if (err) {
> +		pr_debug("Failed to find L3 downstream to cpu %d\n", cpu);
> +		return false;
> +	}
> +
> +	if (!cpumask_equal(tmp_cpumask, cpu_possible_mask)) {
> +		pr_debug("There is more than one L3\n");
> +		return false;
> +	}
> +
> +	/* Be strict; the traffic might stop in the intermediate cache. */
> +	if (get_cpu_cacheinfo_id(cpu, 4) != -1) {
> +		pr_debug("L3 isn't the last level of cache\n");
> +		return false;
> +	}
> +
> +	if (num_possible_nodes() > 1) {
> +		pr_debug("There is more than one numa node\n");
> +		return false;
> +	}
> +
> +#ifdef CONFIG_HMEM_REPORTING
> +	if (node_devices[cpu_to_node(cpu)]->cache_dev) {
> +		pr_debug("There is a memory side cache\n");
> +		return false;
> +	}
> +#endif
> +
> +	return true;
> +}
> +
>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>   static void mpam_resctrl_pick_caches(void)
>   {
> @@ -358,9 +545,68 @@ static void mpam_resctrl_pick_caches(void)
>   	}
>   }
>   
> +static void mpam_resctrl_pick_mba(void)
> +{
> +	struct mpam_class *class, *candidate_class = NULL;
> +	struct mpam_resctrl_res *res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		struct mpam_props *cprops = &class->props;
> +
> +		if (class->level != 3 && class->type == MPAM_CLASS_CACHE) {
> +			pr_debug("class %u is a cache but not the L3\n", class->level);
> +			continue;
> +		}
> +
> +		if (!class_has_usable_mba(cprops)) {
> +			pr_debug("class %u has no bandwidth control\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
> +			pr_debug("class %u has missing CPUs\n", class->level);
> +			continue;
> +		}
> +
> +		if (!topology_matches_l3(class)) {
> +			pr_debug("class %u topology doesn't match L3\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		if (!traffic_matches_l3(class)) {
> +			pr_debug("class %u traffic doesn't match L3 egress\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		/*
> +		 * Pick a resource to be MBA that as close as possible to
> +		 * the L3. mbm_total counts the bandwidth leaving the L3
> +		 * cache and MBA should correspond as closely as possible
> +		 * for proper operation of mba_sc.
> +		 */
> +		if (!candidate_class || class->level < candidate_class->level)
> +			candidate_class = class;
> +	}
> +
> +	if (candidate_class) {
> +		pr_debug("selected class %u to back MBA\n",
> +			 candidate_class->level);
> +		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +		res->class = candidate_class;
> +	}
> +}
> +
>   static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   {
>   	struct mpam_class *class = res->class;
> +	struct mpam_props *cprops = &class->props;
>   	struct rdt_resource *r = &res->resctrl_res;
>   
>   	switch (r->rid) {
> @@ -392,6 +638,19 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>   		r->alloc_capable = true;
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
> +		r->ctrl_scope = RESCTRL_L3_CACHE;
> +
> +		r->membw.delay_linear = true;
> +		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
> +		r->membw.min_bw = get_mba_min(cprops);
> +		r->membw.max_bw = MAX_MBA_BW;
> +		r->membw.bw_gran = get_mba_granularity(cprops);
> +
> +		r->name = "MB";
> +		r->alloc_capable = true;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -406,7 +665,17 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>   	if (class->type == MPAM_CLASS_CACHE)
>   		return comp->comp_id;
>   
> -	/* TODO: repaint domain ids to match the L3 domain ids */
> +	if (topology_matches_l3(class)) {
> +		/* Use the corresponding L3 component ID as the domain ID */
> +		int id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +		/* Implies topology_matches_l3() made a mistake */
> +		if (WARN_ON_ONCE(id == -1))
> +			return comp->comp_id;
> +
> +		return id;
> +	}
> +
>   	/* Otherwise, expose the ID used by the firmware table code. */
>   	return comp->comp_id;
>   }
> @@ -446,6 +715,12 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	case RDT_RESOURCE_L3:
>   		configured_by = mpam_feat_cpor_part;
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
> +			configured_by = mpam_feat_mbw_max;
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		return resctrl_get_default_ctrl(r);
>   	}
> @@ -457,6 +732,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	switch (configured_by) {
>   	case mpam_feat_cpor_part:
>   		return cfg->cpbm;
> +	case mpam_feat_mbw_max:
> +		return mbw_max_to_percent(cfg->mbw_max, cprops);
>   	default:
>   		return resctrl_get_default_ctrl(r);
>   	}
> @@ -504,6 +781,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   		cfg.cpbm = cfg_val;
>   		mpam_set_feature(mpam_feat_cpor_part, &cfg);
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
> +			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
> +			mpam_set_feature(mpam_feat_mbw_max, &cfg);
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -775,6 +1059,7 @@ int mpam_resctrl_setup(void)
>   
>   	/* Find some classes to use for controls */
>   	mpam_resctrl_pick_caches();
> +	mpam_resctrl_pick_mba();
>   
>   	/* Initialise the resctrl structures from the classes */
>   	for_each_mpam_resctrl_control(res, rid) {

Thanks,
Gavin

