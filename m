Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CF12E9729;
	Mon, 13 Jul 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945464; cv=none; b=fn10HrrMyxEVmepbWwSDtGB6H3yGL79WfQ6OyA8QjAVC+j+qKmbcFpg0e3TMJcE5NbG6SUG0e05SOwivtEvp+KJ2Snz8n5tw1TefzZTOPOJC+V5gMSkRkaf3zgmTGQE9L0+jIbnVrwx/n+rRjQ2gEBI6s/S8H6bwrGBfSGt86EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945464; c=relaxed/simple;
	bh=A3aSYk1GwIYJT5qS8P1DZ9j0iHScTjVPwhuOEejpz+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHfAt1Be0fxuFjZQZcMGYvBIOlQrEyfq3Bd1roC2V81mqaDmkQEpBLXaNKruh/EGA9oJrhHHGxvLXItILM3RpNA7E4kak8gKCoX3EV19QbCsvzBURSk1CyObGQLzXfcY4WfZShWULNfVKvs5V1JXgbWyXy3HZGhANL2ubb0sfY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MQ8rvkaq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MQ8rvkaq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A627B1576;
	Mon, 13 Jul 2026 05:24:17 -0700 (PDT)
Received: from [10.174.43.56] (unknown [10.174.43.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2300B3FB90;
	Mon, 13 Jul 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783945461; bh=A3aSYk1GwIYJT5qS8P1DZ9j0iHScTjVPwhuOEejpz+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQ8rvkaqEWuMeBqeVJTiCZSf3Yg5kR4Du674BMXwqU/SmmIvpTy6hdRPArJirH+si
	 5FXSS0tXg05VjXKF1OhvBuIG3j+Q1PSda5Tu7/Vu12HxmnQD53U3+lxV3W3HLhOlKs
	 d6qLKmdIomLQCq6eyW0hH4g9ejvv3i+90soPKFK0=
Message-ID: <22ba1b98-ddc8-4fff-a372-6e4aa2b59c7c@arm.com>
Date: Mon, 13 Jul 2026 17:54:16 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/26 3:27 PM, Sudeep Holla wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>> Overriding the idle mechanism might be useful for debugging and performance
>> testing. Add a cmdline parameter for it, similar to the existing idle=
>> parameter already present for the x86 and ppc architectures.
>>
>> It is also useful on platforms where the WFI instruction misbehaves,
>> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
>> be treated as an erratum and patched using the alternatives framework.
>> However, in the Apple Silicon case we need more flexibility because it is
>> difficult to detect whether the erratum applies. For example, Linux VMs
>> inside macOS have the same MIDR and may even seem like they're running
>> in EL2 in the case of NV, but should continue using WFI (it's trapped and
>> handled correctly by the hypervisor there). Thus, we prefer to
>> let the m1n1 bootloader add the idle=nop parameter[1].
>>
>> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes in v2:
>> - Applied suggestions by Anshuman Khandual (Thanks!)
>> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
>>  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
>>  arch/arm64/kernel/idle.h                        | 13 +++++++++++
>>  arch/arm64/lib/delay.c                          |  5 ++++-
>>  4 files changed, 68 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index b2d7d3540ded..d7f5471edf8f 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -2239,6 +2239,29 @@ Kernel parameters
>>  
>>  			idle=nomwait: Disable mwait for CPU C-states
>>  
>> +			[ARM64,EARLY]
>> +			Format: idle=wfi, idle=yield, idle=nop
>> +
>> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
>> +			instruction in the idle loop. This is the default and
>> +			allows the CPU to enter a low-power state until an
>> +			interrupt arrives.
> 
> Just curious as when and why one would need to use idle=wfi if that is the
> default behaviour. I am missing the need to have it.

I guess once there is a list to chose options from
in the command line, should not the default option 
be listed there as well ?

