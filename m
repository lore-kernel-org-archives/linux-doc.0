Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684D221F26;
	Tue,  7 Jul 2026 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413359; cv=none; b=eR7G+JsfRQdrXztmzsCoHlZB9Qjlb7oQ+dLDWeCMm5xRmP+iXwq4+Fb0mZloKKxOAMnwrqiS8OfpMP4xserMGC8fiN3/CHvNAf5PCOHW1JTSFb0SlW+uwFelXJWZ2OBWTjqc33vYLiUmxtByYHbObnGZdXWdYxPBjo0tcHYlhLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413359; c=relaxed/simple;
	bh=u3RlVTowKqTUJwgRzp3SA9YrCrbi3lk5EF2OOQEph4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/+0XpgI6mXOPjWBWhBQd5hrN/51Flp2HI1g6B+c5MRo9dtef+jw/6vJA8Wk97HeegyPWqndT1YRh4ht4/9QtUQfk+f4khLylNLIaCjVwuSrpQVlvh5RDt/Dh2zWKGv7FagrTzS5Cy6GzJgnMSPjNUuPNKlqvKwxnQolhT+bMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RQ6Y0C2W; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RQ6Y0C2W"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDBCF2379;
	Tue,  7 Jul 2026 01:35:48 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E5E3F85F;
	Tue,  7 Jul 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783413353; bh=u3RlVTowKqTUJwgRzp3SA9YrCrbi3lk5EF2OOQEph4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQ6Y0C2Wptt8NGN3y917WJAMNoPF9+mkViw0HKaM+pw37cU5w3GN2wq/zSyBfkaPQ
	 douyxLGmNgkVyeJzYO7uti42uJmucdVttqpysAYMQ9G+LnV4dh7WrDzO9Bbla8RDM6
	 pN19sG4XRgGtc5XGE2xYWPrh/LDVrceOe3vBzEcs=
Message-ID: <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
Date: Tue, 7 Jul 2026 09:35:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
 <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 7/6/26 22:33, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/6/26 9:06 AM, Ben Horgan wrote:
>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>> MPAM uses a binary fixed point fraction format for MBA rather than a
>> decimal percentage, this introduces rounding errors.
>>
>> Without this additional rounding, if the user reads the value in an MB
>> schema and then writes it back to the schema, the value in hardware won't
>> change. However, with this additional rounding, this guarantee is broken
>> for systems with mbw_wd < 7.
>>
>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>> to specify the conversion resctrl does to the user-provided bandwidth
>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>> conversion.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>
> 
> Unfortunately the "---" separator is missing here.

Another silly mistake.. sorry about that. I've corrected locally and
will send a respin in a day or two.

Thanks,

Ben

> 
>> Changes since v3:
>> Parameter order switch (Reinette)
>> Add Reinette's R-b
>> ---
> Reinette

