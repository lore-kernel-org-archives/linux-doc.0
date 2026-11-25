Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594807;
	b=GqfWS3MRh2mP+3ObTPM9TDsTLZ5cGz5y0fMw4CEcvs5UnfbD4m2R4ndVmURAlAKIe23D
	 5WntXCK2NTwZtMkHUD0X8RXk+wWWY2azcFaBajnA5gpF83i8sh/ncZX2R8hvBebHavGCs
	 0Gw0NT5n90s01cg+3X31R2jnSnsYOtt8LvCcLWLZ+Tlrw0SGeVwjDFM02ooHA6q3giSrz
	 iWhXKLEzf0+orHpQJOJhQMNr7BdJqd86XhYG3o6TlYDxmw9MmCo9Y44xAGq51d7XBlsYt
	 f7dwlgipPDkGo2cA7PHMCQoV5xm3lkEKjNlOLtrAa6VYK3Mp1tVcpjAQAT+s42Xofhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594807;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZGnQfFlvxPPEZ0MP7hE50eiuegTJEhafWunhgxWNytI=;
	b=OcP9vLogin7odX91HCBNmoPCMtZaarjlt48biDl3j6PPjbVJmnAuO2aSbtBeIq9nyzPx
	 UsYkNg6QVzl3dC8hDbw6aLyI2oMehYYOewYBFEczKctgqw5PqcEuwgInQFrI2z6lijjEX
	 dJoRUjXcOkLunj8z42ylLDd6/SRyvvG9XYwTg9Yx2VjMDtoJOZujn2Sg60PEsygxsTz1G
	 P99r/HVvFSM4enmnAR8Zn18A1ELRwFPwB54x7pIwlVynch5AU17883Xgvz8JcRsiSjAhc
	 nOmrzExQteMIEjIuALGODwwD3slIq3DmhGBgQHixxdwuwWBmsAprf+ofeOd8CParQ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Kth5NXw6;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F1606A31E;
	Wed, 25 Nov 2026 08:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE2F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Kth5NXw6
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZGnQfFlvxPPEZ0MP7hE50eiuegTJEhafWunhgxWNytI=;
	b=Kth5NXw6Om7wzvvgj3ZNXLYRW0wjwXjeU4BqIXYJ+rs/LEy3vKd1pdaP9OOxR9PmEZ/mJjaAM
	grW4Ll6HBwDHJBIsMk8xpxyaACoNJEUgGvbAP1FGJvULdapR8YX3M7Ta7679oVholbdtjWSvYGJ
	AlX3wBmVfJ8OsPIZFqFmrmc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jZCJp4XFXzLlXx;
	Wed, 25 Nov 2026 16:19:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CBA540586;
	Wed, 25 Nov 2026 16:20:02 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:20:01 +0800
Message-ID: <41c7ebe2-07e4-45c2-94e4-5ce65e550062@huawei.com>
Date: Wed, 25 Nov 2026 16:20:01 +0800
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
Subject: Re: [PATCH v6 5/6] fs/resctrl: Release the limbo RMIDs when the CDP
 state changes
To: Reinette Chatre <reinette.chatre@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-6-ruanjinjie@huawei.com>
 <6dd79d09-576b-4086-ba5c-7f8663292a6e@arm.com>
 <390433eb-30d8-442a-8d7e-30f15bbe8f9d@huawei.com>
 <03bd150c-f44a-4ae6-b544-3f819e4bb7f2@arm.com>
 <4712b9de-811f-44f8-8ee4-54cd0df8892c@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4712b9de-811f-44f8-8ee4-54cd0df8892c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Reinette and Ben,

在 2026/11/25 2:03, Reinette Chatre 写道:
> Hi Ben and Jinjie,
> 
> On 11/23/26 2:07 AM, Ben Horgan wrote:
>> On 23/11/2026 01:53, Jinjie Ruan wrote:
>>> 在 2026/11/20 0:49, Ben Horgan 写道:
>>>> On 19/11/2026 09:48, Jinjie Ruan wrote:
>>>>> On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
>>>>> that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
>>>>> PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
>>>>> a mount that changes the CDP state is read through the PARTIDs of the
>>>>> new state, which are not the PARTIDs its cache lines are tagged with.
>>>>>
>>>>> With 5 PARTIDs:
>>>>>
>>>>>   mount                  CDP off, CLOSID c -> PARTID c
>>>>>   mkdir g1..g4           CLOSIDs 1..4
>>>>>   umount                 RMIDs enter limbo with CLOSIDs 1..4
>>>>>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>>>>>   limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>>>>>                          MSC error interrupt, mpam_disable()
>>>>>
>>>>> The other direction is worse because nothing reports it. If resctrl is
>>>>> mounted with CDP and mounted again without it, CLOSID c is read as
>>>>> PARTID c, which is in range, so the limbo handler silently tests the
>>>>> occupancy of the PARTID of a different CLOSID and frees or keeps the
>>>>> RMIDs based on it.
>>>>>
>>>>> Where the RMID depends on the CLOSID, as on MPAM, release the RMIDs in
>>>>> limbo without reading them when a mount changes the CDP state, instead
>>>>> of restarting the limbo handler. Cache lines that still carry those
>>>>> RMIDs are accounted to the next user of each RMID. Where the RMID does
>>>>> not depend on the CLOSID, as on x86, the CDP state does not change how
>>>>> an RMID is read and the limbo handler is restarted as before.
>>>>>
>>>>> Compare the CDP state of every resource, not just the L3: on MPAM, CDP
>>>>> enabled on any resource gives every CLOSID two PARTIDs in all MSCs, so
>>>>> mounting with -o cdpl2 alone also changes how the L3 monitors read a
>>>>> CLOSID, and cache levels beyond the L3 would too.
>>>>>
>>>>> Reproduced on QEMU with the sequence above:
>>>>>
>>>>>   mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>>>>>   mpam:mpam_disable: MPAM disabled due to hardware error interrupt
>>>>>
>>>>> With the change the sequence completes without an error.
>>>>>
>>>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>> Cc: <stable@vger.kernel.org>
>>>>> ---
> 
> ...
> 
>>>>> ---
>>>>>  fs/resctrl/monitor.c | 35 +++++++++++++++++++++++++++++++++--
>>>>>  1 file changed, 33 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>>>> index ede1708b920e..2c8c60138768 100644
>>>>> --- a/fs/resctrl/monitor.c
>>>>> +++ b/fs/resctrl/monitor.c
>>>>> @@ -70,6 +70,13 @@ static u32 *closid_num_dirty_rmid;
>>>>>   */
>>>>>  static unsigned int rmid_limbo_count;
>>>>>  
>>>>> +/*
>>>>> + * @limbo_cdp_enabled - True if the RMIDs in limbo were placed there while CDP
>>>>> + *     was enabled. Only used when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is
>>>>> + *     defined.
>>>>> + */
>>>>> +static bool limbo_cdp_enabled;
>>>>> +
>>>>>  /*
>>>>>   * @rmid_entry - The entry in the limbo and free lists.
>>>>>   */
>>>>> @@ -1044,12 +1051,15 @@ int setup_rmid_lru_list(void)
>>>>>   * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
>>>>>   *
>>>>>   * The limbo handler stops while resctrl is unmounted. Restart it on every
>>>>> - * domain that still has RMIDs in limbo.
>>>>> + * domain that still has RMIDs in limbo. Where the RMID depends on the CLOSID
>>>>> + * and the mount changed the RMID index a CLOSID is monitored with, the RMIDs
>>>>> + * in limbo can no longer be read: release them instead.
>>>>>   */
>>>>>  void cqm_resume_limbo_handler(void)
>>>>>  {
>>>>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>>>  	struct rdt_l3_mon_domain *d;
>>>>> +	bool release = false;
>>>>>  
>>>>>  	lockdep_assert_cpus_held();
>>>>>  	lockdep_assert_held(&rdtgroup_mutex);
>>>>> @@ -1057,6 +1067,24 @@ void cqm_resume_limbo_handler(void)
>>>>>  	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>>>>>  		return;
>>>>>  
>>>>> +	/*
>>>>> +	 * Where the RMID depends on the CLOSID, the RMIDs in limbo can only
>>>>> +	 * be read with the CDP state they were freed under. Check every
>>>>> +	 * resource because CDP enabled on any resource changes how every
>>>>> +	 * CLOSID is monitored, so CDP on another resource alone also changes
>>>>> +	 * how the L3 monitors are read.
>>>>> +	 */
>>>>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
>>>>> +		struct rdt_resource *res;
>>>>> +		bool cdp_enabled = false;
>>>>> +
>>>>> +		for_each_rdt_resource(res)
>>>>> +			cdp_enabled |= resctrl_arch_get_cdp_enabled(res->rid);
>>>>> +
>>>>> +		release = cdp_enabled != limbo_cdp_enabled;
>>>>> +		limbo_cdp_enabled = cdp_enabled;
>>>>> +	}
>>>>> +
>>>>>  	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>>>>>  				lockdep_is_cpus_held()) {
>>>>>  		if (!has_busy_rmid(d))
>>>>> @@ -1067,7 +1095,10 @@ void cqm_resume_limbo_handler(void)
>>>>>  		 * it is queued again on a CPU picked now.
>>>>>  		 */
>>>>>  		cancel_delayed_work(&d->cqm_limbo);
>>>>> -		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>>>>> +		if (release)
>>>>> +			release_limbo_rmids(d);
>>>>
>>>> Rather than release all the rmids don't we want to check them all to see which are busy?
>>>
>>> We can not read them here using resctrl_arch_rmid_read(). On MPAM, the
>>> RMID occupancy is read through the PARTID of its CLOSID, and the CDP
>>> state maps one to the other.
>>>
>>> After the mount operation flips the CDP, this mapping disappears, so the
>>
>> Yes, the old indexing becomes invalid. The user visible effects of limbo
>> handler running between mounts should be maintained. As such, if the
>> limbo handler can't just be simply resumed I would expect that the array
>> of dirty rmid was recreated. If we put all the rmid (except for the
>> default rmid) in the dirty rmid array then the limbo handler will take

That make sense for me.

>> care of releasing those that are free. How does this sound to you?
>>
> Thank you very much Ben. I think this is a better solution that better matches
> what the limbo list aims to solve. It looks to me like the trigger for this
> rebuild of the list should be the CDP change by itself, not whether there is
> anything in limbo (so no has_busy_rmid(d) test).
> Ben already states this with "all the rmid" but I think it is worth highlighting
> that this also includes RMID considered free.

Thank you both. I'll do this in v7: when a mount changes the CDP state,
discard the previous dirty state and put every RMID except the default
one back in limbo, so the limbo handler checks each of them with the
PARTIDs it is now read with before it can be reused which includes the
RMIDs that were on the free list.

> Consider the scenario:
> - Under CDP the default group's CLOSID 0 selects PARTIDs 0 and 1, so its
>   code accesses tag cache lines with PARTID 1, PMG 0.
> - re-mounted without CDP, CLOSID 1 is PARTID 1, so a new group given CLOSID 1
>   and RMID 0 starts out counting the default group's leftover code lines.
>   That RMID was never in limbo.
> 
> Reinette

