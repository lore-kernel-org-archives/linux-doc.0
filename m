Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D4C322B8F;
	Tue,  7 Jul 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413245; cv=none; b=cUkqNqFZ4P1UbsAC243xW8AyCbbachStM/J37+0gImgI+FoYp20Fi3WgZOWhOrwxVz22Gkmk3IgArHRkFO5KBk3/UA5hd1mcXp/UsOwS0azNNmVnZVE/XNqUZu49IcVTfnv0Fv7Xw+z44oKkHp18FpHTi67EFetV/tP7Ul/k5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413245; c=relaxed/simple;
	bh=LhHiLpPGD0VGhAPhlgwMkZeOIR/H2PToTxiyxxNPCAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvKltjEZJ6BHhjc580at1NKdFP7mo7UNjTN1sp9r7Bxvh8CK5wzGjY7PdOx5VYanlLmVkhIJQCiaa5f3/M7yI+PBvZ0/uFU7Ngba8hKo9MEsExUdsRhtPwEL7HdxMDdX+p3yxr8XLOrUeL9rg4vJVkZOY+GKpcC7pvXPOnfGQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EY/3vUZy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EY/3vUZy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 734CC1BCA;
	Tue,  7 Jul 2026 01:33:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01C83F85F;
	Tue,  7 Jul 2026 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783413242; bh=LhHiLpPGD0VGhAPhlgwMkZeOIR/H2PToTxiyxxNPCAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EY/3vUZyyA8poxneYJmQU4rSm7GIPeOvAStPuqoJoSmiKS2H2rfVeEVzTXkvbA75z
	 a0QbgxFmvk6flT57KE6oqQ5LOgW8EFah3i97Q7+kQyzRWrEyOCgIAg+JLjqKeVNCWU
	 FQr2SV6zNS1tpQmBUtFdngtOKMyQry0Aiy3RIy5A=
Message-ID: <c3550c4a-a962-4dab-aa19-9f62e7aaf9d8@arm.com>
Date: Tue, 7 Jul 2026 09:33:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-2-ben.horgan@arm.com>
 <643be9eb-06ea-4811-a879-ca014d09742e@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <643be9eb-06ea-4811-a879-ca014d09742e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 7/6/26 22:33, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/6/26 9:06 AM, Ben Horgan wrote:
>> On MPAM systems the rounding behaviour of the MBA control would be improved
>> if the rounding in the fs/resctrl code is removed but this is not the
>> case for x86. To allow any rounding or conversion of the bandwidth value
>> provided by the user to be specified by the arch code a new arch hook is
>> required.
>>
>> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
>> This is currently unused in resctrl but when plumbed in it will replace the
>> call to roundup() in bw_validate().
>>
>> Signed-off-by: Dave Martin <dave.martin@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> This chain does not look right. The first SOB is expected to be from the
> author but the patch does not have Dave as author. 

Ah.. I've changed the author of this and the last patch to be Dave as he
wrote the code.

Thanks,

Ben

> 
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>> ---
> 
> Reinette
> 

