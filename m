Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBAF1A316E;
	Tue, 25 Nov 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081581; cv=none; b=scYgdhR/oLUH74Dcz9LHN4IHc0S3hS2GaVYdacfNxXP0rSbLx68jjc1zkEdBzed8cJCkEM4N3hq9vkB5kAC/LdYPbW0r1SVhHbKOrRhKQiuhdSPOCzf4r6HcqTwXaTw2xev005wcALMDLySVj2au7667iQ82Nh0SLtcjf8/js24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081581; c=relaxed/simple;
	bh=2Fuz15zAfjHTIJTPmsenTu/BskjaYoQHHrL2SmjKXYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LQZdmjvVSMdpqFVbRzPhszSnQR5e6vJjLh1QdI5x/Zt+JvOjIuN/281nJ5hdeigZcQsfB3eD2leMZ5m/HkHx8sVxcB8PYSvJ4Qvp3XcoSm0RvtPk3kt6B5JLLhY7aasxF2Mb/Sty/Ay1dZeI9H485lyS+hnTDA729lNANxB2ZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5mHmPkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5mHmPkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DF4C4CEF1;
	Tue, 25 Nov 2025 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764081581;
	bh=2Fuz15zAfjHTIJTPmsenTu/BskjaYoQHHrL2SmjKXYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C5mHmPkCKwmvDCHb2AGO/uD6yDIX5wflqjENKOE0u96jTEyroax2/mk6t8VdkkLCL
	 ztU1VizvfxGA+SU5X0ikxVqwRZPC5qw+XUqLp9H1ONehVhi7iD0te/PsPxhYPWmugM
	 B/MBZ9DIXqxy29UEqh1Fi6c/DOWAbkdvvy7GCBXr0flTNCArmLbIWYkWJjyZKnH0HK
	 DYCMiQpV65gWf5Fk1c0Y0YKHA6S0KfLgn2Hs7kZbhd5tX+Ab11mSnzhrtsi7u2Mymc
	 bYTrdQv23UZOHtZEXgr95ilKdM0UIzCA4yJY+h2bTydeagOq0myhwMrw9zqgY74uNA
	 2rVIRQxkN2O6A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Changyuan Lyu
 <changyuanl@google.com>,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  Mike Rapoport <rppt@kernel.org>,
  anthony.yznaga@oracle.com,  arnd@arndb.de,  ashish.kalra@amd.com,
  benh@kernel.crashing.org,  bp@alien8.de,  catalin.marinas@arm.com,
  corbet@lwn.net,  dave.hansen@linux.intel.com,
  devicetree@vger.kernel.org,  dwmw2@infradead.org,  ebiederm@xmission.com,
  graf@amazon.com,  hpa@zytor.com,  jgowans@amazon.com,
  kexec@lists.infradead.org,  krzk@kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  luto@kernel.org,  mark.rutland@arm.com,
  mingo@redhat.com,  pasha.tatashin@soleen.com,  pbonzini@redhat.com,
  peterz@infradead.org,  robh@kernel.org,  rostedt@goodmis.org,
  saravanak@google.com,  skinsburskii@linux.microsoft.com,
  tglx@linutronix.de,  thomas.lendacky@amd.com,  will@kernel.org,
  x86@kernel.org,  Breno Leitao <leitao@debian.org>,  thevlad@meta.com
Subject: Re: [PATCH v8 12/17] x86/e820: temporarily enable KHO scratch for
 memory below 1M
In-Reply-To: <80622f99-0ef4-491b-87f6-c9790dfecef6@gmail.com> (Usama Arif's
	message of "Tue, 25 Nov 2025 14:31:54 +0000")
References: <20250509074635.3187114-1-changyuanl@google.com>
	<20250509074635.3187114-13-changyuanl@google.com>
	<a0f875f1-45ad-4dfc-b5c8-ecb51b242523@gmail.com>
	<mafs01plmxngp.fsf@kernel.org>
	<80622f99-0ef4-491b-87f6-c9790dfecef6@gmail.com>
Date: Tue, 25 Nov 2025 15:39:34 +0100
Message-ID: <mafs0ikeyw509.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 25 2025, Usama Arif wrote:

> On 25/11/2025 13:15, Pratyush Yadav wrote:
>> On Mon, Nov 24 2025, Usama Arif wrote:
>> 
>>> On 09/05/2025 08:46, Changyuan Lyu wrote:
>>>> From: Alexander Graf <graf@amazon.com>
>>>>
>>>> KHO kernels are special and use only scratch memory for memblock
>>>> allocations, but memory below 1M is ignored by kernel after early boot
>>>> and cannot be naturally marked as scratch.
>>>>
>>>> To allow allocation of the real-mode trampoline and a few (if any) other
>>>> very early allocations from below 1M forcibly mark the memory below 1M
>>>> as scratch.
>>>>
>>>> After real mode trampoline is allocated, clear that scratch marking.
>>>>
>>>> Signed-off-by: Alexander Graf <graf@amazon.com>
[...]
>> Anyway, you do indeed point at a bug. memblock_mark_kho_scratch() should
>> only be called on a KHO boot, not unconditionally. So even with
>> CONFIG_MEMBLOCK_KHO_SCRATCH enabled, this should only be called on a KHO
>> boot, not every time.
>> 
>> I think the below diff should fix the warning for you by making sure the
>> scratch areas are not present on non-KHO boot. I still don't know why
>> you hit the warning in the first place though. If you'd be willing to
>> dig deeper into that, it would be great.
>> 
>> Can you give the below a try and if it fixes the problem for you I can
>> send it on the list.
>
> Is there a reason for compiling this code with is_kho_boot, when we have disabled
> KEXEC_HANDOVER and dont want this in? i.e. why not just ifdef it with MEMBLOCK_KHO_SCRATCH
> when that defconfig is designed for it?

is_kho_boot() will always be false when CONFIG_KEXEC_HANDOVER is not
enabled. So the compiler should optimize this out.

Only using the ifdef is not enough. Just because the config is enabled
doesn't mean every boot will be a KHO boot. You can do regular reboots
or even regular kexec, without ever having KHO involved. We only want to
call this for a KHO boot. So a runtime check is needed anyway.

>
>> 
>> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
>> index c3acbd26408ba..0a34dc011bf91 100644
>> --- a/arch/x86/kernel/e820.c
>> +++ b/arch/x86/kernel/e820.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/firmware-map.h>
>>  #include <linux/sort.h>
>>  #include <linux/memory_hotplug.h>
>> +#include <linux/kexec_handover.h>
>>  
>>  #include <asm/e820/api.h>
>>  #include <asm/setup.h>
>> @@ -1315,7 +1316,8 @@ void __init e820__memblock_setup(void)
>>  	 * After real mode trampoline is allocated, we clear that scratch
>>  	 * marking.
>>  	 */
>> -	memblock_mark_kho_scratch(0, SZ_1M);
>> +	if (is_kho_boot())
>> +		memblock_mark_kho_scratch(0, SZ_1M);
>>  
>>  	/*
>>  	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
>> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
>> index 88be32026768c..4e9b4dff17216 100644
>> --- a/arch/x86/realmode/init.c
>> +++ b/arch/x86/realmode/init.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/memblock.h>
>>  #include <linux/cc_platform.h>
>>  #include <linux/pgtable.h>
>> +#include <linux/kexec_handover.h>
>>  
>>  #include <asm/set_memory.h>
>>  #include <asm/realmode.h>
>> @@ -67,7 +68,8 @@ void __init reserve_real_mode(void)
>>  	 */
>>  	memblock_reserve(0, SZ_1M);
>>  
>> -	memblock_clear_kho_scratch(0, SZ_1M);
>> +	if (is_kho_boot())
>> +		memblock_clear_kho_scratch(0, SZ_1M);
>>  }
>>  
>>  static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
>> 
>> 
>

-- 
Regards,
Pratyush Yadav
