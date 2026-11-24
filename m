Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520648;
	b=etnOXV4FRcmCfVKfrpxaXHsuAJbr7Lekv/FCS/gZPNRXjG4dV2HeEDWGnmJq5FQoQatE
	 fwuovw2m9H+bGCZa1hZE3WEmFirJZ0ynkVfDvlbUsH7fFjj5Pqr7Yvl/VWOtOk1cBWJUS
	 QIafktgatvJsUad5pFeJ4kKjK5hYLRQ8z3+8egSXvv390FkOB1EpdhGpPl4ht2uiiLlYs
	 uMuVAo0II6FXaXwM8E+fje+5I0LbFA4S0R2PZdMvDHb6WSpSvRlvp4q3jmB2N8lZBNG6Y
	 GArSWbJJ141o5osWxt1qCvKA5awyFqKnQGfaJaQvrhpbN9I4KVtndB5vLYAh4nw1pFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520648;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ji2VLaS8JrXvWDzuTDl7OqX2b0eX02T1MrHfqF7t+BM=;
	b=FP/4yIKLJ9pSs8z+sM79xUFri/xsQgJGYIbXERYt3EhYShjuodGbYMQSwNFlN/+sp2wi
	 rm5jaY2yQRB0Ij4mpZNcALBQZVGS8XkNU2Jx+dfTK2/7kWxeMwT6e8BvEBuKRShAVDJ1l
	 ZgGRKC1huAGkfk/pmM7fF+0OuVrfPGqnLtL/n92GHr6OXgYyceE1pEjsaQveZT9PdWq16
	 uUi7UPWGfZ88X+2k2fRhqvZz5cHG/VqJxD9ZYIt/o9+eyQTN14dtGwyBimuP/olKVbyLX
	 31WHt9PkquAYHeyiA7n23DWKMKvw363HmFSA7Zvz8hrPdZWkiub2jrzNAyjyXSIVKZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vYu9P6Yh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33D7606A31E;
	Tue, 24 Nov 2026 11:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vYu9P6Yh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1577339;
	Tue, 24 Nov 2026 03:44:03 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11E13F86F;
	Tue, 24 Nov 2026 03:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795520646; bh=kLST5Raz2y3p+T1wViYiMm3EjjWntGVOgzxZ0ZkDjHs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=vYu9P6YhAjjoYr/hTwSTR/LIhWweLpp9HQEP2iWhlEaZAw0vMnI8dLTTuiyxRlbLL
	 jYmTMOFDlFj0dEIgofQYRVGSOTq8s6GLPihqGCHlHQ2by/OWK4MDXUwUQLR4uvp2QM
	 PTx6uRtxQJl2preDj0zhtlZ1IonFUJEFnyF011Lg=
Message-ID: <ba518021-4098-48cb-b59f-a07cf7a418da@arm.com>
Date: Tue, 24 Nov 2026 11:44:02 +0000
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
Subject: Re: [RFC PATCH v2 5/9] fs/resctrl: Allow mba_MBps with assignable MBM
 counters
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, quic_jiles@quicinc.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
 <20261112131255.4043381-6-ruanjinjie@huawei.com>
 <1defc561-e7bc-4864-90ad-6aa3fb6be7da@arm.com>
 <e814cf3a-61ee-466e-ae2b-6abf8db16dc0@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <e814cf3a-61ee-466e-ae2b-6abf8db16dc0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 18/11/2026 03:52, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/17 19:37, Ben Horgan 写道:
>> Hi Jinjie,
> 
> Hi Ben,
> 
>>
>> On 12/11/2026 13:12, Jinjie Ruan wrote:
>>> The controller needs a counter for the event selected by mba_MBps_event
>>> in every monitoring group, so mba_MBps is refused when MBM counters are
>>> assignable. On MPAM a group's monitor is assigned from a fixed pool
>>> when the group is created, and users can otherwise only pick a
>>> percentage of a maximum that firmware does not report.
>>>
>>> Allow the controller when the architecture has a fixed assignment mode
>>> and assigns counters when a group is created. Keep mbm_assign_on_mkdir
>>> enabled while the controller is in use, restore its previous value
>>> when the controller is disabled, and refuse to unassign the
>>> controller's counter meanwhile.
>>
>> I'm afraid there has been some miscommunication here. What I was trying
>> to suggest is that MPAM could when using the software controller use the
>> default mbm_assign_mode as is used in intel systems. All the counters
>> are allocated up front and there is one of each supported type per
>> monitor group. Using mbm_assign_on_mkdir doesn't always give you
> 
> In this case, it is unnecessary to restrict that mbm_assign_on_mkdir
> cannot be disabled during the soft controller is enabled
> 
>> guaranteed assigned counters as you point out in your
>> patch "arm_mpam: resctrl: Use the domain's counter ID". I haven't
> 
> Yes, that patch is addressing the related issues.
> 
>> thought through all the abi consideration but it seems plausible, what
>> do you think?
> 
> I like the "default mbm_assign_mode" idea which I think achieved through
> the closid and rmid trimming discussed earlier, while
> mbm_assign_on_mkdir is only a best-effort.
> 
> I have a few questions as below:
> 
> 1、Should report MPAM as the default mode only during the mba_MBps
> mounting?

I'm not completely sure but it does seem that if we are going to the trouble of adding support for
'default' mode then we should make it more generally available.

> 
> In this way, when remount without "MBps", the default behavior can be
> restored instead of permanently trimming the number of control groups
> and monitoring groups based on the hardware's mbw counter count.
> 
> 2、 Should the resctrl files remains unchanged in the ABI?

Yes. We don't want to change the ABI.

> 
> mbm_assign_mode is displayed as [default], and the semantics of
> assignments/available is still "not enabled".
> 
> And update the document about the changes in the mode and
> num_closids/num_rmids caused by the MBps mount option.
> 
> Whether num_mbm_cntrs should still be displayed during the default period?

Any cntrs and assign are only part of the mbm_event mode rather than default mode.
> 
> Whether mpam allocates the monitor during group creation or lazily when
> the first read occurs?
> 
> Perhaps we only need to align with the default behavior of resctrl and
> x86 default mode?

We should match existing x86 resctrl where possible.

I'd like to understand how important it is to have the mba_MBps feature on MPAM platforms. Do you
have a real platform with sufficient memory bandwidth monitors for the default mode to be useful and
that users want the software controller on?

Thanks,

Ben

> 
> Best regards,
> Jinjie
> 
>>
>> Thanks,
>>
>> Ben
>>
>>>
>>> Only MPAM has this mode; other systems keep the previous behavior.
>>>
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  Documentation/filesystems/resctrl.rst |  7 +++++--
>>>  fs/resctrl/monitor.c                  | 25 ++++++++++++++++++++++
>>>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++------
>>>  3 files changed, 54 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index b52795e03303..d70aec6f7096 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
>>> @@ -471,7 +471,8 @@ with the following files:
>>>  	Determines if a counter will automatically be assigned to an RMID, MBM event
>>>  	pair when its associated monitor group is created via mkdir. Enabled by default
>>>  	on boot, also when switched from "default" mode to "mbm_event" counter assignment
>>> -	mode. Users can disable this capability by writing to the interface.
>>> +	mode. Users can disable this capability by writing to the interface. While the
>>> +	MBA software controller is enabled, auto assignment cannot be disabled.
>>>  
>>>  	"0":
>>>  		Auto assignment is disabled.
>>> @@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
>>>  	   mbm_total_bytes:0=e;1=e
>>>  	   mbm_local_bytes:0=e;1=e
>>>  
>>> -	Assignments can be modified by writing to the interface.
>>> +	Assignments can be modified by writing to the interface. While the
>>> +	MBA software controller is enabled, the counter of the event the
>>> +	controller uses cannot be unassigned.
>>>  
>>>  	Examples:
>>>  
>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>> index 8f3b8c3e3010..5a67c8089615 100644
>>> --- a/fs/resctrl/monitor.c
>>> +++ b/fs/resctrl/monitor.c
>>> @@ -1210,6 +1210,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
>>>  		goto out_unlock;
>>>  	}
>>>  
>>> +	if (!value && is_mba_sc(NULL)) {
>>> +		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
>>> +		ret = -EBUSY;
>>> +		goto out_unlock;
>>> +	}
>>> +
>>>  	r->mon.mbm_assign_on_mkdir = value;
>>>  
>>>  out_unlock:
>>> @@ -1776,6 +1782,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
>>>  	return NULL;
>>>  }
>>>  
>>> +/*
>>> + * Return the event the MBA software controller uses as its input for @rdtgrp.
>>> + * A monitor group has no event of its own: its bandwidth is summed into the
>>> + * parent control group, which is the group with the mba_MBps_event setting.
>>> + */
>>> +static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
>>> +{
>>> +	if (rdtgrp->type == RDTMON_GROUP)
>>> +		return rdtgrp->mon.parent->mba_mbps_event;
>>> +
>>> +	return rdtgrp->mba_mbps_event;
>>> +}
>>> +
>>>  static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
>>>  					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>>>  {
>>> @@ -1789,6 +1808,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
>>>  		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
>>>  		break;
>>>  	case '_':
>>> +		if (is_mba_sc(NULL) &&
>>> +		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
>>> +			rdt_last_cmd_puts("Counter is in use by the software controller\n");
>>> +			ret = -EBUSY;
>>> +			break;
>>> +		}
>>>  		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
>>>  		break;
>>>  	default:
>>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>>> index b32831871f70..518d89b0c67d 100644
>>> --- a/fs/resctrl/rdtgroup.c
>>> +++ b/fs/resctrl/rdtgroup.c
>>> @@ -2610,10 +2610,9 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
>>>   * The MBA software controller is supported only if MBM is supported and MBA is
>>>   * in linear scale, and the MBM monitor scope is the same as MBA control scope.
>>>   *
>>> - * The software controller cannot be supported when the MBM counters are
>>> - * assignable.  There is no guarantee that MBM counters are assigned to the
>>> - * event backing the software controller in all monitoring domains of all
>>> - * monitoring groups.
>>> + * The controller needs a counter for its event in every monitoring group.
>>> + * With assignable counters that requires a fixed assignment mode, with
>>> + * counters assigned automatically while the controller is in use.
>>>   */
>>>  static bool supports_mba_mbps(void)
>>>  {
>>> @@ -2623,9 +2622,13 @@ static bool supports_mba_mbps(void)
>>>  	return (resctrl_is_mbm_enabled() &&
>>>  		r->alloc_capable && is_mba_linear() &&
>>>  		r->ctrl_scope == rmbm->mon_scope &&
>>> -		!rmbm->mon.mbm_cntr_assignable);
>>> +		(!rmbm->mon.mbm_cntr_assignable ||
>>> +		 rmbm->mon.mbm_cntr_assign_fixed));
>>>  }
>>>  
>>> +/* mbm_assign_on_mkdir before the software controller forced it on. */
>>> +static bool mba_sc_saved_assign_on_mkdir;
>>> +
>>>  /*
>>>   * Enable or disable the MBA software controller
>>>   * which helps user specify bandwidth in MBps.
>>> @@ -2633,6 +2636,7 @@ static bool supports_mba_mbps(void)
>>>  static int set_mba_sc(bool mba_sc)
>>>  {
>>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
>>> +	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>  	u32 num_closid = resctrl_arch_get_num_closid(r);
>>>  	struct rdt_ctrl_domain *d;
>>>  	unsigned long fflags;
>>> @@ -2643,6 +2647,20 @@ static int set_mba_sc(bool mba_sc)
>>>  
>>>  	r->membw.mba_sc = mba_sc;
>>>  
>>> +	/*
>>> +	 * The controller needs its event counted in every monitoring group:
>>> +	 * force automatic assignment on, and restore the user's setting when
>>> +	 * the controller is disabled.
>>> +	 */
>>> +	if (rmbm->mon.mbm_cntr_assignable) {
>>> +		if (mba_sc) {
>>> +			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
>>> +			rmbm->mon.mbm_assign_on_mkdir = true;
>>> +		} else {
>>> +			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
>>> +		}
>>> +	}
>>> +
>>>  	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
>>>  
>>>  	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
>>> @@ -3352,7 +3370,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
>>>  		ctx->enable_cdpl2 = true;
>>>  		return 0;
>>>  	case Opt_mba_mbps:
>>> -		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
>>> +		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
>>>  		if (!supports_mba_mbps())
>>>  			return invalfc(fc, msg);
>>>  		ctx->enable_mba_mbps = true;
>>
> 

