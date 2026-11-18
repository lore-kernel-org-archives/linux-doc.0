Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002312;
	b=vjTKI+tM2hxhDMJJ/TdVyV0VdotVSjjF04QDVbSVzQgA1nnB7EA7+p+q4ae6JeSnyAMv
	 6EB2XV2moob07M0buGoYS3TKW8XyJ0ni9lBTooDfFZwuiuVa+b1LmXKsVbXrmwrsmqy1/
	 02oFzMOpp1SLuhVRGmU81OLLPv1I5mlHEOqxAV7PaAghs/N9jaKVL1qBdHOKXuQIRW2SN
	 YXB6QQvDDERz5mSYl3z+2yFXjSl96ESOyonczq5CELkZm4ZjYO4Cl8JdvoOXmfL0wb1sk
	 ewNwyJBqF22eh9JabtblciQOdP2/0gGmKAI9AXSxo7Gg7jyJnzhw6op1lGiOIh32Nlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002312;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iegO1ScyIKepMRPTphuPeK+/U3J87IRzMupap8884ho=;
	b=cctXv1M8Oxm3Gh4jxb1ZiTIr3YDi25qmrGpu2xhbNOoWwjEAa0WYL21CCKWhhAE+/LDI
	 VG3c+DDgIQGWFeCmFE7QaLpPzH4v29YG2Pr5za1vWYC8a5bNWWBrNW/S3cqfgcSxGY+Ig
	 PZufd3vmhA5UXQ1BeSzLyQd6wqo94emHBi24A2KFRuS4KovvYIwLshc3cNT+eB1n9+1iS
	 LRzHHHsm7Ba4u1QTl/XLaUKbouf/+DVqbv+y3qPEQtHnaQBViXY1DWURc58w/EQMzdESS
	 c+uxgwqX10e46qVtLpWcOmniMk0HsewkADoR8kyfrlnfwRS1cSje3pZAZbDhETDI76w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="i2nS57/d";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC33C606A325;
	Wed, 18 Nov 2026 11:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC33C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i2nS57/d
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 272651596;
	Wed, 18 Nov 2026 03:45:08 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A31BB3F673;
	Wed, 18 Nov 2026 03:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795002311; bh=QYPIUljbflagwWrhzGCV/oc6H81q55CY6izIufpXiVM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=i2nS57/dL9GMlRGCHC6TBkRTbIIdQ3MplrBjbsU1lgUz1fGW0MnPx0bDQ83/ZE5d4
	 7EchqPau7wzXTD+7/TxKWhiaDbeG9kC5Sa7hDRLoaI41PxBDEvPPm/wILSnovrRuNx
	 fz2vGyzyzAKXEl28kZBqheMU6eh2gSsLzUdhSaiM=
Message-ID: <7c0c29c6-55c9-412a-9620-e44d39a5a806@arm.com>
Date: Wed, 18 Nov 2026 11:45:06 +0000
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
Subject: Re: [PATCH v5 RESEND 5/7] fs/resctrl: Release the limbo RMIDs when
 the CDP state changes
To: Jinjie Ruan <ruanjinjie@huawei.com>,
 Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-6-ruanjinjie@huawei.com>
 <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
 <7aa50421-6e92-4ea6-be39-88045e682a9f@arm.com>
 <449bb402-9620-493d-9e2b-85d093ad1401@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <449bb402-9620-493d-9e2b-85d093ad1401@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 18/11/2026 11:20, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/13 5:18, Ben Horgan 写道:
>> Hi Reinette, Jinjie,
>>
>> On 11/11/2026 18:33, Reinette Chatre wrote:
>>> Hi Jinjie,
>>>
>>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>>
>>>> still carry those RMIDs are accounted to the next user of each RMID.
>>>>
>>>> The CDP state that matters is the one that changes the PARTIDs used by
>>>> the monitors, which is not necessarily the CDP state of the L3
>>>> resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
>>>> enabled on any resource, so enabling CDP on L2 alone also changes the
>>>> PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
>>>> the architecture report this. Only MPAM can be affected, so the RMIDs
>>>> are only released where the RMID depends on the CLOSID. On x86 the
>>>> RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
>>>> returns false.
>>>
>>> nack. The helper name and value returned on x86 is the first hint that this
>>> is not right. For x86 the value is not a statement about x86: CDP exists on
>>> x86 and can be enabled, so a function called resctrl_arch_mon_cdp_enabled()
>>> returning false reads as wrong until the comment above it explains that what
>>> is really being reported is whether CDP changes the IDs the monitors use.
>>
>> The invariant that the limbo handler is currently relying on is that the
>> mapping of rmid index to the underlying hardware monitor index is fixed.
>> For MPAM, if cdp is enabled at all then the mapping is changed and so
>> the invariant does not hold between mounts. MPAM's emulation of CDP is
>> why it breaks the invariant. resctrl shouldn't need to care about this
>> MPAM specific reason and should only care whether or not the invariant
>> is upheld or not. In the future, MPAM may use more than the two existing
>> indexing schemes. For instance, if we wanted to have one memory
>> bandwidth monitor per monitor group, without assignment, then we would
>> need to limit the number of monitor groups.
>>
>>>
>>> Every architecture now needs to match this. This looks more like forcing
>>> every architecture to indicate whether it has the same quirk as MPAM.
>>>
>>> If there is no way to handle this in MPAM driver then handling this should at
>>> least be contained between resctrl filesystem and MPAM driver. This should not
>>> be forced on all architectures.
>>
>> I don't see a way for the MPAM to keep the same RMID for when it is
>> emulating CDP and when it's not.
>>
>>>
>>> I trust the MPAM folks to say whether it can or cannot be done in MPAM driver.
>>> If this is not possible in MPAM driver then it looks like this needs to go back
>>> to include the L2 CDP check as was done in previous version. With this check 
>>> gated by IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) it does hint "MPAM"
>>> but would also need a comment to explain why that is done.
>>>
>>
>> Would something like an rmid indexing generation count be any better or
>> is that just overthinking it?
>>
>> int resctrl_arch_rmid_indexing_generation(void);
>>
>> If the indexing never changes the arch could always return 1 and if it
>> does change the architecture can bump the number on every change. It
>> would still never change when resctrl is mounted.
> 
> As Renette suggeted, maybe we could include the L2 CDP check as was done
> in previous version to make the fix simple?

If the check stays cdp specific then I'd consider iterating through all the resources to make it
clear that the check is whether cdp is enabled on any resource or not at all. It seems likely that
at some point an L4 resource will be added. The extra cache level would be useful for arm64 systems
with an L3 cache in the DSU and also a system level cache in the MCN.

Thanks,

Ben

> 
>>
>> Thanks,
>>
>> Ben
> 

