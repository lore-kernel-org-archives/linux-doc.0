Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D72441B8
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081122; cv=none; b=umKymaSWWbpapleOK3LbR79OgIqZMVXt2fGGOSA3HRznq7lyU7UG0Ll3OBIAOkrHAMYAwYWUSMRx4sho7MgwoUCNFTXw7SwClwNEiLp9KHdLZ7WHiArtkEZiGQ7U2VkrjbTzy0VYbxdCNW4bfD0mNFPiFIJGZrLNBZ1ZzH8FLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081122; c=relaxed/simple;
	bh=szIpM7Vsfb5qyc6hHLdhE51XAMuGzRTXsooWoQu2NUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUmlzmCM8XNM2idn7nYIdKYGeZHML4ZgOxV8WSbhPFGHBUuJtjdtzKMTnAbJ26OiIvmBckF8xBpg+R9BKtbo8JeWSWfzYfkltBWmooPwRmzX01WtJiIMAbaq9oI2zE1sguYOg7fu+J3H8qDVP8F/hWgUjb74EPouPLABFYi87L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgdFX7Kq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgdFX7Kq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so46827405e9.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 06:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764081119; x=1764685919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZ4ODszvfszsaMwq6cWxl41Hem6czzJu/Sexl3aAaTM=;
        b=BgdFX7KqreVB11+90f+Y+0fadN9t/Y1Vc14a+Uop/gQ3M7FeynBeFRMv3xLcFMcxtj
         p0xhGj1GVYCST+gHhArBHgesGTSSYEpQ0ioMU/4Z0ZYMEN6i1y2GMOBCCYil8x+11H+G
         yisv8uIJx3o4I61GDTY19iiDXAHc9e/YTM/0qOXnMav+379NhIeHO1hnK4MKyFdV8ILY
         hQIbrD4qZk6uDOMa7nTxttMN5ANXTao8ROszwRSZtmRwuB/pLiXsfQCPNZPD1pO8aUx6
         htvZ2NyEZxEcu72/mYyirIz5D6ot9Yizq2GTdTWKhzPITdhm0jl1SsaIdAFFPTvYMNs/
         ahPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081119; x=1764685919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ4ODszvfszsaMwq6cWxl41Hem6czzJu/Sexl3aAaTM=;
        b=IgQrzTBGV52Jy+uSxrN0dvC09HmtrumP2vIiaO5kuL0TOUhAEseJS8GCJAz8ta9ZqL
         pOaGdLWQRfmuNi64kMUsqd2XtCNuja9PMWGQ8xReBmbF//Y0gkx7skeSe9rFJjCDyJN5
         mV4xNnMLY7Nvq27H/Fif0o87tC7ECEf5Cao7d3R025WU+8Y1ulQljC8Noj/gWgmzIP2i
         ZhSH8PtXXOM2342kRwuHUQ4VLYqqXqF4YmipwwTiXHpOrRL9rQuK52pP59smQIQuiSvd
         k2cdltvf/GbWz5EvK5a3yqxUhcC7qKFJXUCkEwb9l5TCxScDTr4v2Balo5UAwHXCVMXi
         dhdg==
X-Forwarded-Encrypted: i=1; AJvYcCVXTVvJCViyJoAkUbSdEdjZlSNcO6opKRFG2smATFRFUjg6pgim956ILT8xAN3n38h6kaWkFe2FjZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTzWt3lmQpt+DvqgfoMVSdqJNSoQB/eILsw9A58Q2xfxEk4Y8
	BTG3QBIis3LYBnS0Ske1pVKacKAxZKx7kx5j9CR+P/Z1xiUEjMArAYWR
X-Gm-Gg: ASbGncvTB6MmcEpSzRR4h6wwqz3tKc7N4ym280bGkD4jvF9ZC8lIuxCGOOts1NViqB6
	lvuve/fc8EnFmKlQKfNpc2RMJIVC9wvKCahgvLTpHAOCxlInc6ePlZiNfrXv0fNf+tiyPPw1uNn
	ncsSRlWB4LdqN5GCsKKN5XrfYH7JYhYS9awOUu/ZVWhBrD7zTQSN+9vT8oWUwh9CIfIpxgz4utz
	+PZOJ8019pdzwvi5qxWrUoxdHxZHt2TfxpOw8mNSHyNWaNUuDJq59DJXg2nQsww5d/6HY7TXOSU
	xD6i/svWdI8Avzc0IJOly+8VgsLMe6uNuABHASp0amRKjip3SJ9JZpnGeVdgQMi+ByUCloDW0AJ
	8gzxsfPa5L6OoXrd8m7N69W6M+oYBe7WLDh/wEUW/XwaEbmLXWWXxM+OlETo/3811Lrf9EAdC9m
	E2BH4x3bMoG8gQ1HRenAE3izxGE07rypC44dBVZVsB6E3iQMnzvtHRVMBhHawYbec=
X-Google-Smtp-Source: AGHT+IET/PZINZcMffFdmxJigMRJhlhA6uIQoTot58T3/URSr348bM3kiSSBFmcvLwKBiV4zYcA0QA==
X-Received: by 2002:a5d:5d08:0:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42e0f1d5993mr3302081f8f.2.1764081118878;
        Tue, 25 Nov 2025 06:31:58 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1126:4:ce0:a4eb:eabc:d420? ([2620:10d:c092:500::5:f0ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm33683057f8f.9.2025.11.25.06.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 06:31:58 -0800 (PST)
Message-ID: <80622f99-0ef4-491b-87f6-c9790dfecef6@gmail.com>
Date: Tue, 25 Nov 2025 14:31:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/17] x86/e820: temporarily enable KHO scratch for
 memory below 1M
Content-Language: en-GB
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
 benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
 corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
 dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com,
 jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com,
 pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org,
 robh@kernel.org, rostedt@goodmis.org, saravanak@google.com,
 skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org,
 Breno Leitao <leitao@debian.org>, thevlad@meta.com
References: <20250509074635.3187114-1-changyuanl@google.com>
 <20250509074635.3187114-13-changyuanl@google.com>
 <a0f875f1-45ad-4dfc-b5c8-ecb51b242523@gmail.com>
 <mafs01plmxngp.fsf@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <mafs01plmxngp.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/11/2025 13:15, Pratyush Yadav wrote:
> On Mon, Nov 24 2025, Usama Arif wrote:
> 
>> On 09/05/2025 08:46, Changyuan Lyu wrote:
>>> From: Alexander Graf <graf@amazon.com>
>>>
>>> KHO kernels are special and use only scratch memory for memblock
>>> allocations, but memory below 1M is ignored by kernel after early boot
>>> and cannot be naturally marked as scratch.
>>>
>>> To allow allocation of the real-mode trampoline and a few (if any) other
>>> very early allocations from below 1M forcibly mark the memory below 1M
>>> as scratch.
>>>
>>> After real mode trampoline is allocated, clear that scratch marking.
>>>
>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Co-developed-by: Changyuan Lyu <changyuanl@google.com>
>>> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>> ---
>>>  arch/x86/kernel/e820.c   | 18 ++++++++++++++++++
>>>  arch/x86/realmode/init.c |  2 ++
>>>  2 files changed, 20 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
>>> index 9920122018a0b..c3acbd26408ba 100644
>>> --- a/arch/x86/kernel/e820.c
>>> +++ b/arch/x86/kernel/e820.c
>>> @@ -1299,6 +1299,24 @@ void __init e820__memblock_setup(void)
>>>  		memblock_add(entry->addr, entry->size);
>>>  	}
>>>  
>>> +	/*
>>> +	 * At this point memblock is only allowed to allocate from memory
>>> +	 * below 1M (aka ISA_END_ADDRESS) up until direct map is completely set
>>> +	 * up in init_mem_mapping().
>>> +	 *
>>> +	 * KHO kernels are special and use only scratch memory for memblock
>>> +	 * allocations, but memory below 1M is ignored by kernel after early
>>> +	 * boot and cannot be naturally marked as scratch.
>>> +	 *
>>> +	 * To allow allocation of the real-mode trampoline and a few (if any)
>>> +	 * other very early allocations from below 1M forcibly mark the memory
>>> +	 * below 1M as scratch.
>>> +	 *
>>> +	 * After real mode trampoline is allocated, we clear that scratch
>>> +	 * marking.
>>> +	 */
>>> +	memblock_mark_kho_scratch(0, SZ_1M);
>>> +
>>>  	/*
>>>  	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
>>>  	 * to even less without it.
>>> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
>>> index f9bc444a3064d..9b9f4534086d2 100644
>>> --- a/arch/x86/realmode/init.c
>>> +++ b/arch/x86/realmode/init.c
>>> @@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
>>>  	 * setup_arch().
>>>  	 */
>>>  	memblock_reserve(0, SZ_1M);
>>> +
>>> +	memblock_clear_kho_scratch(0, SZ_1M);
>>>  }
>>>  
>>>  static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
>>
>> Hello!
>>
>> I am working with Breno who reported that we are seeing the below warning at boot
>> when rolling out 6.16 in Meta fleet. It is difficult to reproduce on a single host
>> manually but we are seeing this several times a day inside the fleet.
>>
>>  20:16:33  ------------[ cut here ]------------
>>  20:16:33  WARNING: CPU: 0 PID: 0 at mm/memblock.c:668 memblock_add_range+0x316/0x330
>>  20:16:33  Modules linked in:
>>  20:16:33  CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G S                  6.16.1-0_fbk0_0_gc0739ee5037a #1 NONE 
>>  20:16:33  Tainted: [S]=CPU_OUT_OF_SPEC
>>  20:16:33  RIP: 0010:memblock_add_range+0x316/0x330
>>  20:16:33  Code: ff ff ff 89 5c 24 08 41 ff c5 44 89 6c 24 10 48 63 74 24 08 48 63 54 24 10 e8 26 0c 00 00 e9 41 ff ff ff 0f 0b e9 af fd ff ff <0f> 0b e9 b7 fd ff ff 0f 0b 0f 0b cc cc cc cc cc cc cc cc cc cc cc
>>  20:16:33  RSP: 0000:ffffffff83403dd8 EFLAGS: 00010083 ORIG_RAX: 0000000000000000
>>  20:16:33  RAX: ffffffff8476ff90 RBX: 0000000000001c00 RCX: 0000000000000002
>>  20:16:33  RDX: 00000000ffffffff RSI: 0000000000000000 RDI: ffffffff83bad4d8
>>  20:16:33  RBP: 000000000009f000 R08: 0000000000000020 R09: 8000000000097101
>>  20:16:33  R10: ffffffffff2004b0 R11: 203a6d6f646e6172 R12: 000000000009ec00
>>  20:16:33  R13: 0000000000000002 R14: 0000000000100000 R15: 000000000009d000
>>  20:16:33  FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>  20:16:33  CR2: ffff888065413ff8 CR3: 00000000663b7000 CR4: 00000000000000b0
>>  20:16:33  Call Trace:
>>  20:16:33   <TASK>
>>  20:16:33   ? __memblock_reserve+0x75/0x80
>>  20:16:33   ? setup_arch+0x30f/0xb10
>>  20:16:33   ? start_kernel+0x58/0x960
>>  20:16:33   ? x86_64_start_reservations+0x20/0x20
>>  20:16:33   ? x86_64_start_kernel+0x13d/0x140
>>  20:16:33   ? common_startup_64+0x13e/0x140
>>  20:16:33   </TASK>
>>  20:16:33  ---[ end trace 0000000000000000 ]--- 
>>
>>
>> Rolling out with memblock=debug is not really an option in a large scale fleet due to the
>> time added to boot. But I did try on one of the hosts (without reproducing the issue) and I see:
>>
>> [    0.000616]  memory.cnt  = 0x6
>> [    0.000617]  memory[0x0]	[0x0000000000001000-0x000000000009bfff], 0x000000000009b000 bytes flags: 0x40
>> [    0.000620]  memory[0x1]	[0x000000000009f000-0x000000000009ffff], 0x0000000000001000 bytes flags: 0x40
>> [    0.000621]  memory[0x2]	[0x0000000000100000-0x000000005ed09fff], 0x000000005ec0a000 bytes flags: 0x0
>> ...
>>
>> The 0x40 (MEMBLOCK_KHO_SCRATCH) is coming from memblock_mark_kho_scratch in e820__memblock_setup. I believe this
>> should be under ifdef like the diff at the end? (Happy to send this as a patch for review if it makes sense).
>> We have KEXEC_HANDOVER disabled in our defconfig, therefore MEMBLOCK_KHO_SCRATCH shouldnt be selected and
>> we shouldnt have any MEMBLOCK_KHO_SCRATCH type regions in our memblock reservations.
>>
>> The other thing I did was insert a while(1) just before the warning and inspected the registers in qemu.
>> R14 held the base register, and R15 held the size at that point.
>> In the warning R14 is 0x100000 meaning that someone is reserving a region with a different flag to MEMBLOCK_NONE
>> at the boundary of MEMBLOCK_KHO_SCRATCH.
> 
> I don't get this... The WARN_ON() is only triggered when the regions
> overlap. Here, there should be no overlap, since the scratch region
> should end at 0x100000 (SZ_1M) and the new region starts at 0x100000
> (SZ_1M).
> 

Yes, this is likely a separate problem. I just discovered flags = 0x40 while trying to
debug it with KEXEC_HANDOVER disabled.

> Anyway, you do indeed point at a bug. memblock_mark_kho_scratch() should
> only be called on a KHO boot, not unconditionally. So even with
> CONFIG_MEMBLOCK_KHO_SCRATCH enabled, this should only be called on a KHO
> boot, not every time.
> 
> I think the below diff should fix the warning for you by making sure the
> scratch areas are not present on non-KHO boot. I still don't know why
> you hit the warning in the first place though. If you'd be willing to
> dig deeper into that, it would be great.
> 
> Can you give the below a try and if it fixes the problem for you I can
> send it on the list.

Is there a reason for compiling this code with is_kho_boot, when we have disabled
KEXEC_HANDOVER and dont want this in? i.e. why not just ifdef it with MEMBLOCK_KHO_SCRATCH
when that defconfig is designed for it?

> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index c3acbd26408ba..0a34dc011bf91 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -16,6 +16,7 @@
>  #include <linux/firmware-map.h>
>  #include <linux/sort.h>
>  #include <linux/memory_hotplug.h>
> +#include <linux/kexec_handover.h>
>  
>  #include <asm/e820/api.h>
>  #include <asm/setup.h>
> @@ -1315,7 +1316,8 @@ void __init e820__memblock_setup(void)
>  	 * After real mode trampoline is allocated, we clear that scratch
>  	 * marking.
>  	 */
> -	memblock_mark_kho_scratch(0, SZ_1M);
> +	if (is_kho_boot())
> +		memblock_mark_kho_scratch(0, SZ_1M);
>  
>  	/*
>  	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
> index 88be32026768c..4e9b4dff17216 100644
> --- a/arch/x86/realmode/init.c
> +++ b/arch/x86/realmode/init.c
> @@ -4,6 +4,7 @@
>  #include <linux/memblock.h>
>  #include <linux/cc_platform.h>
>  #include <linux/pgtable.h>
> +#include <linux/kexec_handover.h>
>  
>  #include <asm/set_memory.h>
>  #include <asm/realmode.h>
> @@ -67,7 +68,8 @@ void __init reserve_real_mode(void)
>  	 */
>  	memblock_reserve(0, SZ_1M);
>  
> -	memblock_clear_kho_scratch(0, SZ_1M);
> +	if (is_kho_boot())
> +		memblock_clear_kho_scratch(0, SZ_1M);
>  }
>  
>  static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
> 
> 

