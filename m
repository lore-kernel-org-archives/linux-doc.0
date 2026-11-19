Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058874;
	b=KlsZNrc9V7E4YNUjd0hcGsvu6YyEvqcaueiJ2EcZfL9OO1csGfqgAR/hjNaSUVUImdg8
	 VhE7ecak/C370p0QbOO9egqocFmU3WjWkTCE9kCEovWm2O8oD6iCqu9nfx2dp5APL7+j+
	 8RhqAxE0EGjPyx9+G47AAAg6IEViYDvh+SUu6TuQ/3oq+0IhB9bZAHWepO9w/s/fRYzjy
	 IBhJwx5nhdkzD3LK2izp1P5TPrK/0uBU3dvAl7cbFqtYwvYR+BQpvr25Z/gSzaANUK08B
	 FbpzwushvMG1QQsyc2o7OgptCZ2Xzo9pImGfuShrLk9/3qg0VTF0+G+lBdBzNt7E4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058874;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zs8lGMNgF6WPKWDopP1bfUZUbhZl8Eh+8/rpdnMShD0=;
	b=nYgJjOxmAcNcFhugz37LyK8LsKyUE0mMURar9zttsJdnwDz/AEZuaTwgaYyXDwuCLbIf
	 VHobDIpxnjUIQOURuTPba2pW3ItS++IWjmY7zZZUaj4K30xHFxFJ3+NPWEqp78fluasYj
	 vAKg3+dl0Kzc4YKzYCrpYvFURv8LRXXUZSVUql14KpYM7dDiUJts4OKmCsa0teiU/sccv
	 UG5GcQQ1ndcs3U1CK5keNBiucwyAAXPAUfmZOcUKRbnlKBVLrfw9/tpDR6UlDX1CxkGS3
	 G8jk05XUXALV/LR/beSfB5VoYpGFm+lNsj0h1xuGydT2iO2uO6LNncPG1i5IzOJ9kkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GuFFIi86;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E4606A31C;
	Thu, 19 Nov 2026 03:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A1E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GuFFIi86
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zs8lGMNgF6WPKWDopP1bfUZUbhZl8Eh+8/rpdnMShD0=;
	b=GuFFIi86+7YjNnFihRarfOEbsDyMMaO/D7Gsz7cyz9xHY9AXmxjKz5f8yhQqtCkGgy2DB7zso
	sUNcurX0EN0sq1XcC4WuPKbZpOs00rdoytilzFL1ch/sDpzjUwDLI8gVPalptODq8i54tFHd12M
	Z/qzdNU0ycWXunkMulGiD9o=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jVP6S5xP9z1cySs;
	Thu, 19 Nov 2026 11:27:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 29CCC4056C;
	Thu, 19 Nov 2026 11:27:49 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 11:27:47 +0800
Message-ID: <00b6fe99-066c-480d-9c81-b1b244a8a310@huawei.com>
Date: Thu, 19 Nov 2026 11:27:47 +0800
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
To: Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
	<reinette.chatre@intel.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<will@kernel.org>, <gshan@redhat.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-6-ruanjinjie@huawei.com>
 <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
 <7aa50421-6e92-4ea6-be39-88045e682a9f@arm.com>
 <449bb402-9620-493d-9e2b-85d093ad1401@huawei.com>
 <7c0c29c6-55c9-412a-9620-e44d39a5a806@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7c0c29c6-55c9-412a-9620-e44d39a5a806@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/18 19:45, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 18/11/2026 11:20, Jinjie Ruan wrote:
>>
>>
>> 在 2026/11/13 5:18, Ben Horgan 写道:
>>> Hi Reinette, Jinjie,
>>>
>>> On 11/11/2026 18:33, Reinette Chatre wrote:
>>>> Hi Jinjie,
>>>>
>>>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>>>
>>>>> still carry those RMIDs are accounted to the next user of each RMID.
>>>>>
>>>>> The CDP state that matters is the one that changes the PARTIDs used by
>>>>> the monitors, which is not necessarily the CDP state of the L3
>>>>> resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
>>>>> enabled on any resource, so enabling CDP on L2 alone also changes the
>>>>> PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
>>>>> the architecture report this. Only MPAM can be affected, so the RMIDs
>>>>> are only released where the RMID depends on the CLOSID. On x86 the
>>>>> RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
>>>>> returns false.
>>>>
>>>> nack. The helper name and value returned on x86 is the first hint that this
>>>> is not right. For x86 the value is not a statement about x86: CDP exists on
>>>> x86 and can be enabled, so a function called resctrl_arch_mon_cdp_enabled()
>>>> returning false reads as wrong until the comment above it explains that what
>>>> is really being reported is whether CDP changes the IDs the monitors use.
>>>
>>> The invariant that the limbo handler is currently relying on is that the
>>> mapping of rmid index to the underlying hardware monitor index is fixed.
>>> For MPAM, if cdp is enabled at all then the mapping is changed and so
>>> the invariant does not hold between mounts. MPAM's emulation of CDP is
>>> why it breaks the invariant. resctrl shouldn't need to care about this
>>> MPAM specific reason and should only care whether or not the invariant
>>> is upheld or not. In the future, MPAM may use more than the two existing
>>> indexing schemes. For instance, if we wanted to have one memory
>>> bandwidth monitor per monitor group, without assignment, then we would
>>> need to limit the number of monitor groups.
>>>
>>>>
>>>> Every architecture now needs to match this. This looks more like forcing
>>>> every architecture to indicate whether it has the same quirk as MPAM.
>>>>
>>>> If there is no way to handle this in MPAM driver then handling this should at
>>>> least be contained between resctrl filesystem and MPAM driver. This should not
>>>> be forced on all architectures.
>>>
>>> I don't see a way for the MPAM to keep the same RMID for when it is
>>> emulating CDP and when it's not.
>>>
>>>>
>>>> I trust the MPAM folks to say whether it can or cannot be done in MPAM driver.
>>>> If this is not possible in MPAM driver then it looks like this needs to go back
>>>> to include the L2 CDP check as was done in previous version. With this check 
>>>> gated by IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) it does hint "MPAM"
>>>> but would also need a comment to explain why that is done.
>>>>
>>>
>>> Would something like an rmid indexing generation count be any better or
>>> is that just overthinking it?
>>>
>>> int resctrl_arch_rmid_indexing_generation(void);
>>>
>>> If the indexing never changes the arch could always return 1 and if it
>>> does change the architecture can bump the number on every change. It
>>> would still never change when resctrl is mounted.
>>
>> As Renette suggeted, maybe we could include the L2 CDP check as was done
>> in previous version to make the fix simple?
> 
> If the check stays cdp specific then I'd consider iterating through all the resources to make it
> clear that the check is whether cdp is enabled on any resource or not at all. It seems likely that

OK, will fix this way, and drop the last patch, thank you!

> at some point an L4 resource will be added. The extra cache level would be useful for arm64 systems
> with an L3 cache in the DSU and also a system level cache in the MCN.
> 
> Thanks,
> 
> Ben
> 
>>
>>>
>>> Thanks,
>>>
>>> Ben
>>
> 

