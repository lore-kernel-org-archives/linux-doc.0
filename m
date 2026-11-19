Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090550;
	b=2smZxZfZ7XzGlRW0L1MAoHhznHxwklkeVAAFcQPHX0NYcWhFrHEcFPyhzy8XzFuyAcby
	 sPd3SzWZ11cBzhDk+LKCsA7u5gRH4CmKvxd0rSCHZ0pp82fJpiEAN+CcuYQSgftzP9TQA
	 gQMjlV1K2MBa97st+ogifZ3+Hu3ar/xWXg74ViGiTii97hgDycXkrqeFpUdbUBLc6gliN
	 jmcuaYQLJW7iV5FkLsbq1auIXcUjAoAaBQlPXq+ex+6YyXON/2Seqf8rLnivgAmqjnE7w
	 dnVq271662lA3Q6htSQYKhZYSWscNJ8ebkkY/4b+WcEG5XCQv1oSZ/LUFWBd8aAc53Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090550;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=w70H96WrO1yR+nAxaCKm3ou+g1x+zh1XqNqjbx+5alg=;
	b=2CSI0YmD1X/nyM315I2zsLUYToqM9hVvvUjg3YG4lgCsT7aQ9ZvPdXqAVehUlwtuTusC
	 HlF0Rx7Di1w9Xo07lPBavw6oz/mgEwwBUKrjoKNJSuTEuazacjxeoVV215/Qv9UehpaQx
	 wswWGmgqQ1vwomcRPNrx2oTHwHwrbmPWoL4GbNEnZtsHP6oOxXPnjpZxEiafLSDWYGWjf
	 CUI00NfIONKaAVRMQuKjEMM/JPpxR0knATGYWn3WIe2HAydEOzTwmV0jOmzNlBVSH5laE
	 WrFQ12FyvXzj1M+2//CWrp8p95XCOTmfoEp47w6pZtOGuGo0GjBlGqI+70sN9Gp7Gow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yzVHQoYs;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D412B606A320;
	Thu, 19 Nov 2026 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D412B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yzVHQoYs
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=w70H96WrO1yR+nAxaCKm3ou+g1x+zh1XqNqjbx+5alg=;
	b=yzVHQoYspkJYkNwkjIdfajx3tHurs74HCp6zUegNJIWxzO2HrZ3CuOihwQgc1id51UyQYDrP3
	5Ig5SLcgrHhqFrdHAw1gTPLrC9NUhqGN0NbmTc1CIbO6kt7a0KvonsI2AfdU0sPTmNmHkhsPL6i
	DKXeaknbOevfAxiLq2HfhrU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jVcpz2CNmzpStr;
	Thu, 19 Nov 2026 20:14:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 350D140579;
	Thu, 19 Nov 2026 20:15:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 20:15:41 +0800
Message-ID: <382b27cd-2667-44d0-a5c6-006655015f69@huawei.com>
Date: Thu, 19 Nov 2026 20:15:40 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] fs/resctrl: Clear the CDP state after the cleanup
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <bp@alien8.de>, <tan.shaopeng@fujitsu.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-4-ruanjinjie@huawei.com>
 <6b0ccb0d-487a-4985-ac7b-81808848fd0b@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6b0ccb0d-487a-4985-ac7b-81808848fd0b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/19 19:21, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 19/11/2026 09:48, Jinjie Ruan wrote:
>> To support CDP, resctrl halves the number of CLOSIDs available to
>> resource groups and gives each remaining CLOSID two hardware
>> configurations instead of one, distinguished by index: 2 * CLOSID for
>> data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
>> configuration, at index CLOSID. Every architecture computes these
>> indices the same way.
>>
>> Unmounting clears the CDP state before it undoes what the groups were
>> given, so the cleanup computes index CLOSID where the group was set up
>> with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
>> left in place and index CLOSID is cleared instead, which with CDP
>> enabled is a configuration of a different CLOSID. The architecture may
>> keep this state for as long as the resource exists.
>>
>> Only MPAM can reach this today. Of everything the cleanup has to undo,
>> MPAM addresses only the MBM counter assignment by the translated CLOSID,
>> and it only began doing so when it implemented assignable counters. 
> 
> This is clearly not ideal but even in MPAM we get away without any usable visible effect. Or am I
> missing something? We are left with some assigned counters from the MPAM driver point of view but
> the resctrl is in charge of the assignments and MPAM doesn't check if a counter is already assigned
> when resctrl asks for a new assignment. The change looks good to me.

I agree with your analysis, and I have also confirmed it:

- __config_cntr() only performs an overwrite write and does not modify
the allocation of assigned_counters[].

 if (assign)
     mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
 else
     mon->mbwu_idx_to_mon[mbwu_idx] = -1;

- When umount, the resctrl cntr_cfg[] is destroyed along with the
domain, and cross-mounting does not exist.

- When the mbm_cntr_get() is used to read, cntr_cfg[] of the resctrl is
checked first. If no record is found, the value is directly set to
Unassigned, so the stale mbwu_idx_to_mon will not be read between
unmounted and the next time it is mounted.

- Each time a new allocation is performed, the same
mbwu_idx_to_mon[mbwu_idx] is overwritten.

so there is no observable error. It is a silent error.

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
> 
> x86
>> addresses its counters by RMID alone.
>>
>> Clear the CDP state after the cleanup, so that the cleanup runs with the
>> CDP state the groups were set up under.
>>
>> Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>> v6:
>> - Describe the CDP indices as resctrl filesystem behavior that applies
>>   to every architecture, and the flow instead of the code (Reinette).
>> - Drop the stable version range, the Fixes tag already gives it.
>> ---
>>  fs/resctrl/rdtgroup.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 5d0351453c2f..3312637fb514 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
>>  	cpus_read_lock();
>>  	mutex_lock(&rdtgroup_mutex);
>>  
>> -	rdt_disable_ctx();
>> -
>>  	/* Put everything back to default values. */
>>  	for_each_alloc_capable_rdt_resource(r)
>>  		resctrl_arch_reset_all_ctrls(r);
>>  
>>  	resctrl_fs_teardown();
>> +
>> +	/*
>> +	 * Clear the CDP state after the cleanup. The CDP state decides
>> +	 * which hardware configuration a CLOSID refers to, so the teardown
>> +	 * must run with the state the configuration was created under.
>> +	 */
>> +	rdt_disable_ctx();
>> +
>>  	if (resctrl_arch_alloc_capable())
>>  		resctrl_arch_disable_alloc();
>>  	if (resctrl_arch_mon_capable())
> 

