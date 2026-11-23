Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428481;
	b=W/kTUlGLMtV8vTbzRHq/XANZJI3JacyfpdKjCHTnBtwzxxokmyUYtQezRPGIVsH709Sl
	 GIo+qNpDIv60bQDwTAo6lH9FPD5fmtNNlcuKTLdrZzAK7tkplw9B5UmKlwO2ALabtwu+Q
	 OBso2bXtCOTuh3Lt7zijHpvT1J0Mrw31Wgppr6fEdpGYXrNSS7BBIyIq9RG6TrjXRQcMd
	 tP3zz+zV5aY6VI065KEAYkdwWVR++zSl2PwQMPVOz5tfQDOXsaPkhVmIkyHXRhCFYAKzZ
	 Vj0GDkidr0IzqI1uJTVJGp6iRu3Fm7TNN26/5J0l1jEA1G1fpWsZC0+FbmiUxui1K1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428481;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=67tZReiAmccfro7V78InGAMSxE7OljbX/UBov1pMLUQ=;
	b=GvlmlVKFYe6gMba3arWS65O98Ls7U2BB3OsJD5c8uw426Vq2VeSAgnc2iq6Dh/RAOjOA
	 tJDNEPRgoI45HWZi4+gn9Tkg1FOFNdvIVZkclbwSFwW9O46rwd7grxt3JRT//ISZFQZlo
	 1YgjGxa+pXHykaqlQU5juipWjl8NMqLtj4JVtGvLzZrrGzeSAXIc5A55NdwTK9GXQfy7N
	 cfhMEibkipFkOww2qXfq9YXxj5IVcSjbDMGI+LT7WyNUw11KIXb703ffapf/H9CEuIIfu
	 XKU68cp404lyJ50u70RYowRHYojj9k2gal6HIoG5qsKu/esM9WAjMpN0bopycfNFp5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JRaIzEyL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5BB606A32E;
	Mon, 23 Nov 2026 10:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5BB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JRaIzEyL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 487AE143D;
	Mon, 23 Nov 2026 02:07:57 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.19.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651503F632;
	Mon, 23 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795428480; bh=QVXBlIefBZPointXxaRzc2jD52YkQS1Z6DNTJkOu+io=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JRaIzEyLQfF2kOuqCNZ3ljg3eAMMFUtXDMSaNFDatW+zqJ45uXCkodYqO02yDmJR/
	 DhMOxeqFehW5Nn7Jxc/A+2Lt+WqM+jfrB+1JX5E9ziZD6oPmNlx6xaENHCLufTb/HY
	 uTwxa3mz1c0HsFCWrbIwhn+uwWdu+6t6irDhLYNI=
Message-ID: <03bd150c-f44a-4ae6-b544-3f819e4bb7f2@arm.com>
Date: Mon, 23 Nov 2026 10:07:47 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 5/6] fs/resctrl: Release the limbo RMIDs when the CDP
 state changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, bp@alien8.de, tan.shaopeng@fujitsu.com,
 gshan@redhat.com, jic23@kernel.org, fenghuay@nvidia.com,
 zengheng4@huawei.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-6-ruanjinjie@huawei.com>
 <6dd79d09-576b-4086-ba5c-7f8663292a6e@arm.com>
 <390433eb-30d8-442a-8d7e-30f15bbe8f9d@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <390433eb-30d8-442a-8d7e-30f15bbe8f9d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 23/11/2026 01:53, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/20 0:49, Ben Horgan 写道:
>> Hi Jinjie,
> 
> Hi Ben,
> 
>>
>> On 19/11/2026 09:48, Jinjie Ruan wrote:
>>> On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
>>> that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
>>> PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
>>> a mount that changes the CDP state is read through the PARTIDs of the
>>> new state, which are not the PARTIDs its cache lines are tagged with.
>>>
>>> With 5 PARTIDs:
>>>
>>>   mount                  CDP off, CLOSID c -> PARTID c
>>>   mkdir g1..g4           CLOSIDs 1..4
>>>   umount                 RMIDs enter limbo with CLOSIDs 1..4
>>>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>>>   limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>>>                          MSC error interrupt, mpam_disable()
>>>
>>> The other direction is worse because nothing reports it. If resctrl is
>>> mounted with CDP and mounted again without it, CLOSID c is read as
>>> PARTID c, which is in range, so the limbo handler silently tests the
>>> occupancy of the PARTID of a different CLOSID and frees or keeps the
>>> RMIDs based on it.
>>>
>>> Where the RMID depends on the CLOSID, as on MPAM, release the RMIDs in
>>> limbo without reading them when a mount changes the CDP state, instead
>>> of restarting the limbo handler. Cache lines that still carry those
>>> RMIDs are accounted to the next user of each RMID. Where the RMID does
>>> not depend on the CLOSID, as on x86, the CDP state does not change how
>>> an RMID is read and the limbo handler is restarted as before.
>>>
>>> Compare the CDP state of every resource, not just the L3: on MPAM, CDP
>>> enabled on any resource gives every CLOSID two PARTIDs in all MSCs, so
>>> mounting with -o cdpl2 alone also changes how the L3 monitors read a
>>> CLOSID, and cache levels beyond the L3 would too.
>>>
>>> Reproduced on QEMU with the sequence above:
>>>
>>>   mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>>>   mpam:mpam_disable: MPAM disabled due to hardware error interrupt
>>>
>>> With the change the sequence completes without an error.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>> v6:
>>> - Drop resctrl_arch_mon_cdp_enabled() and compare the CDP state of
>>>   every resouce's cdp state, with a comment on why they are
>>>   checked (Reinette, Ben).
>>> - Restrict the release to the systems where the RMID depends on the
>>>   CLOSID, in the changelog and the comments, and keep the hardware IDs
>>>   out of the file system comments (Reinette).
>>> - Reword the limbo_cdp_enabled comment (Reinette).
>>> - Drop the stable version range, the Fixes tag already gives it.
>>> v5:
>>> - Split the change of the limbo handler lifetime into the previous
>>>   patch. The limbo handler now stops while resctrl is unmounted on every
>>>   architecture, and only the release of the RMIDs depends on
>>>   CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
>>> - Drop the cqm_work_cpu changes. resctrl_limbo_resume() cancels the
>>>   worker before it queues it again or releases the RMIDs.
>>> - Move the rdt_disable_ctx() reordering to a separate patch.
>>> - Add resctrl_arch_mon_cdp_enabled() instead of comparing the CDP state
>>>   of L2 in the file system.
>>> - Rename limbo_cdp to limbo_cdp_enabled and document that it is only set
>>>   with CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
>>> - Check QOS_L3_OCCUP_EVENT_ID first and drop the rmid_busy_llc check.
>>> - Use lockdep_assert_cpus_held() at the start of resctrl_limbo_resume().
>>> - Describe the reverse sequence, from CDP on to CDP off.
>>> - Link to v4: https://lore.kernel.org/all/20261105070934.2258613-4-ruanjinjie@huawei.com/
>>> v4:
>>> - Use resctrl_mounted instead of a separate limbo_paused flag.
>>> - Record the CDP state once when resctrl is mounted.
>>> - Add resctrl_limbo_resume(), called once resctrl_mounted is set.
>>> - Previous Link: https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/
>>> ---
>>>  fs/resctrl/monitor.c | 35 +++++++++++++++++++++++++++++++++--
>>>  1 file changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>> index ede1708b920e..2c8c60138768 100644
>>> --- a/fs/resctrl/monitor.c
>>> +++ b/fs/resctrl/monitor.c
>>> @@ -70,6 +70,13 @@ static u32 *closid_num_dirty_rmid;
>>>   */
>>>  static unsigned int rmid_limbo_count;
>>>  
>>> +/*
>>> + * @limbo_cdp_enabled - True if the RMIDs in limbo were placed there while CDP
>>> + *     was enabled. Only used when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is
>>> + *     defined.
>>> + */
>>> +static bool limbo_cdp_enabled;
>>> +
>>>  /*
>>>   * @rmid_entry - The entry in the limbo and free lists.
>>>   */
>>> @@ -1044,12 +1051,15 @@ int setup_rmid_lru_list(void)
>>>   * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
>>>   *
>>>   * The limbo handler stops while resctrl is unmounted. Restart it on every
>>> - * domain that still has RMIDs in limbo.
>>> + * domain that still has RMIDs in limbo. Where the RMID depends on the CLOSID
>>> + * and the mount changed the RMID index a CLOSID is monitored with, the RMIDs
>>> + * in limbo can no longer be read: release them instead.
>>>   */
>>>  void cqm_resume_limbo_handler(void)
>>>  {
>>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>  	struct rdt_l3_mon_domain *d;
>>> +	bool release = false;
>>>  
>>>  	lockdep_assert_cpus_held();
>>>  	lockdep_assert_held(&rdtgroup_mutex);
>>> @@ -1057,6 +1067,24 @@ void cqm_resume_limbo_handler(void)
>>>  	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>>>  		return;
>>>  
>>> +	/*
>>> +	 * Where the RMID depends on the CLOSID, the RMIDs in limbo can only
>>> +	 * be read with the CDP state they were freed under. Check every
>>> +	 * resource because CDP enabled on any resource changes how every
>>> +	 * CLOSID is monitored, so CDP on another resource alone also changes
>>> +	 * how the L3 monitors are read.
>>> +	 */
>>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
>>> +		struct rdt_resource *res;
>>> +		bool cdp_enabled = false;
>>> +
>>> +		for_each_rdt_resource(res)
>>> +			cdp_enabled |= resctrl_arch_get_cdp_enabled(res->rid);
>>> +
>>> +		release = cdp_enabled != limbo_cdp_enabled;
>>> +		limbo_cdp_enabled = cdp_enabled;
>>> +	}
>>> +
>>>  	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>>>  				lockdep_is_cpus_held()) {
>>>  		if (!has_busy_rmid(d))
>>> @@ -1067,7 +1095,10 @@ void cqm_resume_limbo_handler(void)
>>>  		 * it is queued again on a CPU picked now.
>>>  		 */
>>>  		cancel_delayed_work(&d->cqm_limbo);
>>> -		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>>> +		if (release)
>>> +			release_limbo_rmids(d);
>>
>> Rather than release all the rmids don't we want to check them all to see which are busy?
> 
> We can not read them here using resctrl_arch_rmid_read(). On MPAM, the
> RMID occupancy is read through the PARTID of its CLOSID, and the CDP
> state maps one to the other.
> 
> After the mount operation flips the CDP, this mapping disappears, so the

Yes, the old indexing becomes invalid. The user visible effects of limbo
handler running between mounts should be maintained. As such, if the
limbo handler can't just be simply resumed I would expect that the array
of dirty rmid was recreated. If we put all the rmid (except for the
default rmid) in the dirty rmid array then the limbo handler will take
care of releasing those that are free. How does this sound to you?

Thanks,

Ben

> read operation either accesses a PARTID greater than PARTID_MAX (i.e.,
> the case of MMSMONCFG_ID_RANGE/mpam_disable()), or silently samples the
> counter of another CLOSID.
> 
> Best regards,
> Jinjie
> 
>>
>> Thanks,
>>
>> Ben
>>
>>> +		else
>>> +			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>>>  	}
>>>  }
>>>  
>>
> 

