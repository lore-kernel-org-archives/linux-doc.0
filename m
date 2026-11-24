Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519196;
	b=0AZAQtNAHs4DMDCEjNZYRkO1cvErrlsfWoprkEZXyKQCIxW+HRaM6dqGIeuKP9w7dV0i
	 nBszuajwN2Xb+LMx7QCilSQHPomo81nEPRGPZn0y3+PjP4KWESeTElpWQ8lM1H0ty9qcp
	 Jt/eVSl6MzZ29Q9Rjq08uArt5ixb1vaouokDhwduk+0N749fAXwMIBLaOfk9zJZgVmTci
	 Qw04G4hT/2sdQ5F5WW+IReff492GjG9tVRrLHOx/Vq2G4Ad9joaKkXUapXYvLiZLjGbul
	 G5EZMVAs3HA0EHKhDuqnQlWfMFMWKJDKQg3YvuWgvh/SoFABQt05SEn4mGkgn+dUdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519196;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RHww58L6rt3u4SPdVeeTOs1lSGoLjvc9RTNcF4tg334=;
	b=iVLmwQhvduHs5ilVasWTH7BXTk1aP9aaSlEIt7vWr+obFpukFjHxhCdWFv+8CJ0xWiYo
	 ioAP+0fuUiqjYk5JVWhJff761TbIsYgBGl0dNRfClo+/5YxpKo2WCBd4uSZNPK2jE3TV9
	 CT6V0evG2OayNlWoGeRl8jf55JC/KRaYHj1TjIuJL+08+n2yy+eE2FsFe6jFAYx/zDQX0
	 CvuDWaFfuZXZWmtpdOxvMCKoAXm3VBpwyLBkmw3b4JLpbnKs6Q+D+kexu/psrAegsJyUO
	 H3TZu0fBfCICgmZzAtxDBu/mNric4xCVqPVGq6SFcsIBKtPCG6F8g8rhpnmE+qkQ0ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CAmSoyn6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC30606A321;
	Tue, 24 Nov 2026 11:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CAmSoyn6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7FB339;
	Tue, 24 Nov 2026 03:19:51 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F051A3F86F;
	Tue, 24 Nov 2026 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519194; bh=HHH4tUb3mjaWhl7bqXTmi6Gdr+JOz30M77C6UvlW+9E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CAmSoyn69UFsxm5mReroXL8Ug7UJsi7XwWfyZ51BXWZ/RLB0rb9rO6DjTcUCX0K1x
	 OC8iAorqBgmxjAmuNF3PAnR0n34r5sJ9nPH3s+bYP7+dV51X9z1DA0GPYw+D6ByMT3
	 KI8k/fz18F02QZ6kEJEPCBc/Gtn7QhgxtUIBSfpk=
Message-ID: <6fee2695-3edc-4beb-8877-76c7e1b056af@arm.com>
Date: Tue, 24 Nov 2026 11:19:49 +0000
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
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Reinette Chatre <reinette.chatre@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
 <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
 <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
 <0e51dda0-8be0-439c-91f0-ce292fb0c13b@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <0e51dda0-8be0-439c-91f0-ce292fb0c13b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Reinette,

On 23/11/2026 17:51, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/12/26 9:16 AM, Ben Horgan wrote:
>> On 12/11/2026 01:42, Jinjie Ruan wrote:
>>> 在 2026/11/12 2:34, Reinette Chatre 写道:
>>>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>>>> Moving a MON group into the mon_groups directory of another CTRL_MON
>>>>> group changes the CLOSID of the group while its RMID stays the same.
>>>>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>>>>> MPAM, the move changes the RMID index of the group and is rejected with
>>>>> -EOPNOTSUPP.
>>>>>
>>>>> Userspace cannot tell whether the move is supported without trying it.
>>>>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>>>>> moved to another CTRL_MON group and 0 when the move is rejected, and
>>>>> refer to it where resctrl.rst describes the move.
>>>>>
>>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>
>>>> Do you find that this binary "supported/unsupported" accurately captures
>>>
>>> I think this behavior is deterministic on MPAMv1, so that's enough for mpam.
>>>
>>>> everything that MPAM may ever want to do in this area? Could it be that, for
>>>
>>> That would be what the new version of MPAM does (such as v2 mentioned
>>> below), the behavior of the mapmv1 version is already determined..
>>>
>>>> example, one day MPAM may be asked to support the move of a monitor group to
>>>> support scenarios where the reset of monitor counts is acceptable to the customer
>>>> and availability of PMG will be managed as part of the scenario needing support?
>>
>> For such a destructive move I would have thought it would be better to
>> forbid the move and just rely on the user deleting the existing monitor
>> group and creating a new one at the new location. If we consider only
>> llc_occupancy on MPAM, which isn't affected by any requirement to be
>> free running as effectively the hardware re-measures the cache occupancy
>> on each read, then allowing monitor groups to be moved still gives a
>> misleading impression to the users. The actual cache occupancy of the
>> tasks in the moved monitor group stays the same but only the cache lines
>> allocated after the move with the new (PARTID, PMG) association are
>> accounted for in llc_occupancy. The tasks still get cache hits for the
>> lines allocated previous to the monitor group move.
>>
>> Having said that, one problem with relying on deleting and creating a
>> new monitor group is that you have to keep track of the associated tasks
>> which isn't necessarily straight forward, e.g. when a child task is
>> started after deleting the monitor group.
>>
>> Any relaxation of expectations of what happens when a monitor group is
>> moved would need explicit buy-in from the user as otherwise they could
>> rightly expect the established resctrl behaviour.
> 
> Exactly. Hence the idea of this potentially needing support via a resctrl
> interface. This is hypothetical. I am not advocating for adding this
> support but instead advocating that this feature keeps extensibility in mind.

Ack

> 
> All the caveats you list are valid. Even so, consider, for example, your
> point about the impact on LLC occupancy: When I look at a feature like PLZA
> that supports a customer request [1] that only seems to consider memory bandwidth
> it does not seem as though LLC occupancy is always of concern since PLZA
> assigns a global CLOSID for _all_ kernel mode work, including cache allocation.

I feel I'm missing the significance of what you are saying here but I do agree that LLC occupancy
may not be particularly important to some users.

> >>
>> I haven't understood the reason why groups that monitor cpus can't be
>> moved. Is this impossible to implement even on an x86 system? Why can't
>> the cpus move move between control groups in the way that tasks do?
> 
> resctrl has a contract that MON groups may only include CPUs that belong to
> its parent CTRL_MON group. Simply moving the MON group with its CPU will thus
> break that contract, unless its CPUs are moved with it to the new control group.
> The implementation of the feature stopped short of making such a significant change
> for which I do not think there was a use case at the time.

As hypothetically support for moving MON groups that monitor CPUs could be added I think we also
need to take this into account when designing for extensibility. The two current behaviours for MON
group moving across control groups are, not allowed and allowed only if no CPUs are being monitored.
Perhaps, info/moveable_mon_group could show "no" when when moving is not allowed and "tasks" or
"tasks_only" if it is allowed. The "tasks"/"tasks_only" does seem but a bit awkward but I can't
think of anything better at the moment. Using a word means that if we want to support destructive
moves later on then we could later use "destructive" for that.

Thanks,

Ben

> 
> Reinette
> 
> [1] https://lore.kernel.org/lkml/3c3029e61d4602476b7836d82614ba4ec71b3a99.1769029977.git.babu.moger@amd.com/

