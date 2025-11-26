Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54725CC6C
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764141956; cv=none; b=cd6tDuTyJSeCffOX/onRDNpH1ZXF8DMvGEUBoHlwWaDi22hF+swf+INdeXPTqfHtTjacxRoTiBPy4WO5dIqcgEWMtuqNBBJpRvmXeujhLjdn1DHEScEwodaG1LUozqHghpPNh+p+sh7/SmalzlLzK6oADOi/8jtQ3gYb+nIf3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764141956; c=relaxed/simple;
	bh=4L/5eL1/ItWCHjyzj3oXYZutZjve9LapJn5GO6pMj+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjtaIG0h8TLHYA0JJHMaCXGS1N9FrljxoA8faZaB5xOpF4o51pxXoQtWP3+w75rp/YX9x1J5utDPG/wnmtzbmm+HvbYtwgQsUrcDq8yddxhDmlEPIHRLhj/+VRJkxHPgAbY+InFKqM/3SAFWiaw8HBafXxvvt4gh6m3oW8u2fDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiaWVi9M; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiaWVi9M"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7277324204so1081073766b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 23:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764141953; x=1764746753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv7ZH0U5VwCrSx4pIQP2NujklUNE6c7fxiogNvnqOWg=;
        b=AiaWVi9MJwUDl0wPYZeXkn4oBQ8BJVKeRanu4DpRo1NgYw4EEgKCRohsyuAxnDvnIh
         BIEhTfT1uQqvK6Oxt+iSE0h6D2riY/4SwT/0zjG43o3+QRwDJ2k+xc0P7cp/6BkrmlUZ
         IOCyiadV/oA4LVB/25ZoEErUYqJUhHjZxVPh7dZ0DyMDrUotXDNqM4S4U6nXUl2Qi7RB
         /Yeh+ljTpG91vHXjIqAFXgUWARprMSxWzMPkeqtn52QEQWok5fec61TFj21hGBJnTheK
         NLp8wn49uJNyq4gpS7AvIEldl70xXM2vxH0A/ofiwFQ8cK3rIBEMO3byBGjFvpc4uTG4
         MkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764141953; x=1764746753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv7ZH0U5VwCrSx4pIQP2NujklUNE6c7fxiogNvnqOWg=;
        b=f3hcYOtMrOUf6zREqCcAli8bmw4Qjq41S10MyC8LdGnor5EWlTcK+EctJTBh857YRf
         J+GsPLu1CYbPRTJ8JJG/ICPf6SUfGz5iWvSyZUp9lW9oDcMkwb3MRnazqhoKZxRKPwyY
         G/b1WY9pLkEb/JXRAeguN1OYfuWY3O7bFOIzKwIAnXsjLhgMVaA3rWIlDkKDAVwjNAl6
         QbLPI7PQTTYKCpbkIECYnSLZPVFOOH/L1SO7ep0d6RxTWDlvyezHEOb8tbulD1gnhvdR
         LKEiU9uBYei1uyLL/v11iIjPDp/QlhzJlZSxkAdBCelo47PfOLDKJt4r43holT/jRU6F
         ujbg==
X-Forwarded-Encrypted: i=1; AJvYcCXX5XT5WwNibRxMFCOVTEuKmFiJus6Kf08FyrnETeo22n9deRCF9DgM9YW1DPDT/1fWQ+y5iGiUnKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZOxCoBH8NqhMaWMrdpLeVmt5NGq4fMqbzu/gVGVObmQGFTs4
	+tHOKiCRo8nfiXpdhct+oRVx2vQyBN5Q/ZGRRJvpf4/Q/aEITZm2k/24
X-Gm-Gg: ASbGncvjzG0oWBR5DwWw06UaDTVjMZNPr+P+TfkOnEasQPNfIakH1nUkatryAhU3ma8
	gNs8OIBbeiSSWbS27PISjRKTA6k+HQoQ17EUaTJdq7e/keQZ1vVztObeVS3nti6oLngy7+kHoKt
	jSzibR7fIzaxjMs96QnpMAwSc9J6K9/S17NmScwgmzQ0C2p5tGoGnOMkipp2m+KUV0ZXwFRxiYh
	ca0mRfkNfodn8KLIc5wgJ4P9u1oG8rUReQ/vO8vy1jjpCluFRSkpuGKgpZ0zb9dfJJb7a/Z5uol
	/qZdk29lxZRuXwjgv9Kan64dd4gRIHQRu3r8eypPoeq6BKHAF5dBU/tV3vR9/Te0oARYZ13pCSR
	eQhWhzvzJ3of49upoKQuXYckb7CpM4xgaqWuK3bvBc8RTHvuUerrUalmshk4lss3AoLrWp5yKuE
	gmFV/ZY1oR2RAhgMWpqHRYLx97IcKA5TREyGhHz9VP7ZPSAkukBNKKIK9ub+/gHTjNnuiYWOZFS
	2MRju5aSs/3
X-Google-Smtp-Source: AGHT+IHX0rqNNyRTR0dneFys5BvltD8NgTOoyYKLcnywZAT/mxA+kXa1PwfcBV0janZViN7HMFRH3g==
X-Received: by 2002:a17:907:7fa2:b0:b70:7cd8:9098 with SMTP id a640c23a62f3a-b76c5592b7amr549919866b.61.1764141952922;
        Tue, 25 Nov 2025 23:25:52 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d55d7fsm1796765066b.21.2025.11.25.23.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 23:25:51 -0800 (PST)
Message-ID: <d38aeb5d-5a46-4e8d-b3c1-f2b4cdb15b04@gmail.com>
Date: Wed, 26 Nov 2025 07:25:48 +0000
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
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
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
 <mafs01plmxngp.fsf@kernel.org> <aSW0MF9BXjLnY2Fr@kernel.org>
 <ba690e06-c2a1-4d2e-9428-9ca2ea9f2b86@gmail.com>
 <aSaazgjKX8PfFDXf@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <aSaazgjKX8PfFDXf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/11/2025 06:14, Mike Rapoport wrote:
> On Tue, Nov 25, 2025 at 06:47:15PM +0000, Usama Arif wrote:
>>
>>
>> On 25/11/2025 13:50, Mike Rapoport wrote:
>>> Hi,
>>>
>>> On Tue, Nov 25, 2025 at 02:15:34PM +0100, Pratyush Yadav wrote:
>>>> On Mon, Nov 24 2025, Usama Arif wrote:
>>>
>>>>>> --- a/arch/x86/realmode/init.c
>>>>>> +++ b/arch/x86/realmode/init.c
>>>>>> @@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
>>>>>>  	 * setup_arch().
>>>>>>  	 */
>>>>>>  	memblock_reserve(0, SZ_1M);
>>>>>> +
>>>>>> +	memblock_clear_kho_scratch(0, SZ_1M);
>>>>>>  }
>>>>>>  
>>>>>>  static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
>>>>>
>>>>> Hello!
>>>>>
>>>>> I am working with Breno who reported that we are seeing the below warning at boot
>>>>> when rolling out 6.16 in Meta fleet. It is difficult to reproduce on a single host
>>>>> manually but we are seeing this several times a day inside the fleet.
>>>>>
>>>>>  20:16:33  ------------[ cut here ]------------
>>>>>  20:16:33  WARNING: CPU: 0 PID: 0 at mm/memblock.c:668 memblock_add_range+0x316/0x330
>>>>>  20:16:33  Modules linked in:
>>>>>  20:16:33  CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G S                  6.16.1-0_fbk0_0_gc0739ee5037a #1 NONE 
>>>>>  20:16:33  Tainted: [S]=CPU_OUT_OF_SPEC
>>>>>  20:16:33  RIP: 0010:memblock_add_range+0x316/0x330
>>>>>  20:16:33  Code: ff ff ff 89 5c 24 08 41 ff c5 44 89 6c 24 10 48 63 74 24 08 48 63 54 24 10 e8 26 0c 00 00 e9 41 ff ff ff 0f 0b e9 af fd ff ff <0f> 0b e9 b7 fd ff ff 0f 0b 0f 0b cc cc cc cc cc cc cc cc cc cc cc
>>>>>  20:16:33  RSP: 0000:ffffffff83403dd8 EFLAGS: 00010083 ORIG_RAX: 0000000000000000
>>>>>  20:16:33  RAX: ffffffff8476ff90 RBX: 0000000000001c00 RCX: 0000000000000002
>>>>>  20:16:33  RDX: 00000000ffffffff RSI: 0000000000000000 RDI: ffffffff83bad4d8
>>>>>  20:16:33  RBP: 000000000009f000 R08: 0000000000000020 R09: 8000000000097101
>>>>>  20:16:33  R10: ffffffffff2004b0 R11: 203a6d6f646e6172 R12: 000000000009ec00
>>>>>  20:16:33  R13: 0000000000000002 R14: 0000000000100000 R15: 000000000009d000
>>>>>  20:16:33  FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>>>>  20:16:33  CR2: ffff888065413ff8 CR3: 00000000663b7000 CR4: 00000000000000b0
>>>>>  20:16:33  Call Trace:
>>>>>  20:16:33   <TASK>
>>>>>  20:16:33   ? __memblock_reserve+0x75/0x80
>>>
>>> Do you have faddr2line for this?
>>>>>>  20:16:33   ? setup_arch+0x30f/0xb10
>>>
>>> And this?
>>>
>>
>>
>> Thanks for this! I think it helped narrow down the problem.
>>
>> The stack is:
>>
>> 20:16:33 ? __memblock_reserve (mm/memblock.c:936) 
>> 20:16:33 ? setup_arch (arch/x86/kernel/setup.c:413 arch/x86/kernel/setup.c:499 arch/x86/kernel/setup.c:956) 
>> 20:16:33 ? start_kernel (init/main.c:922) 
>> 20:16:33 ? x86_64_start_reservations (arch/x86/kernel/ebda.c:57) 
>> 20:16:33 ? x86_64_start_kernel (arch/x86/kernel/head64.c:231) 
>> 20:16:33 ? common_startup_64 (arch/x86/kernel/head_64.S:419) 
>>
>> This is 6.16 kernel.
>>
>> 20:16:33 ? __memblock_reserve (mm/memblock.c:936) 
>> Thats memblock_add_range call in memblock_reserve
>>
>> 20:16:33 ? setup_arch (arch/x86/kernel/setup.c:413 arch/x86/kernel/setup.c:499 arch/x86/kernel/setup.c:956) 
>> That is parse_setup_data -> add_early_ima_buffer -> add_early_ima_buffer -> memblock_reserve_kern
>>
>>
>> I put a simple print like below:
>>
>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 680d1b6dfea41..cc97ffc0083c7 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -409,6 +409,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
>>         }
>>  
>>         if (data->size) {
>> +               pr_err("PPP %s %s %d data->addr %llx, data->size %llx \n", __FILE__, __func__, __LINE__, data->addr, data->size);
>>                 memblock_reserve_kern(data->addr, data->size);
>>                 ima_kexec_buffer_phys = data->addr;
>>                 ima_kexec_buffer_size = data->size;
>>
>>
>> and I see (without replicating the warning):
>>
>> [    0.000000] PPP arch/x86/kernel/setup.c add_early_ima_buffer 412 data->addr 9e000, data->size 1000                                                                                          
>> ....
> 
> So it looks like in cases when the warning reproduces there's something
> that reserves memory overlapping with IMA buffer before
> add_early_ima_buffer().
> 
>>
>> [    0.000348] MEMBLOCK configuration:
>> [    0.000348]  memory size = 0x0000003fea329ff0 reserved size = 0x00000000050c969b
>> [    0.000350]  memory.cnt  = 0x5
>> [    0.000351]  memory[0x0]     [0x0000000000001000-0x000000000009ffff], 0x000000000009f000 bytes flags: 0x40
>> [    0.000353]  memory[0x1]     [0x0000000000100000-0x0000000067c65fff], 0x0000000067b66000 bytes flags: 0x0
>> [    0.000355]  memory[0x2]     [0x000000006d8db000-0x000000006fffffff], 0x0000000002725000 bytes flags: 0x0
>> [    0.000356]  memory[0x3]     [0x0000000100000000-0x000000407fff8fff], 0x0000003f7fff9000 bytes flags: 0x0
>> [    0.000358]  memory[0x4]     [0x000000407fffa000-0x000000407fffffff], 0x0000000000006000 bytes flags: 0x0
>> [    0.000359]  reserved.cnt  = 0x7
>>
>>
>> So MEMBLOCK_RSRV_KERN and MEMBLOCK_KHO_SCRATCH seem to overlap..
> 
> It does not matter, they are set on different arrays. RSRV_KERN is set on
> regions in memblock.reserved and KHO_SCRATCH is set on regions in
> memblock.memory.
> 
> So dumping memblock.memory is completely irrelevant, you need to check
> memblock.reserved for potential conflicts.
>  
>>>>>  20:16:33   ? start_kernel+0x58/0x960
>>>>>  20:16:33   ? x86_64_start_reservations+0x20/0x20
>>>>>  20:16:33   ? x86_64_start_kernel+0x13d/0x140
>>>>>  20:16:33   ? common_startup_64+0x13e/0x140
>>>>>  20:16:33   </TASK>
>>>>>  20:16:33  ---[ end trace 0000000000000000 ]--- 
>>>>>
>>>>>
>>>>> Rolling out with memblock=debug is not really an option in a large scale fleet due to the
>>>>> time added to boot. But I did try on one of the hosts (without reproducing the issue) and I see:
>>>
>>> Is it a problem to roll out a kernel that has additional debug printouts as
>>> Breno suggested earlier? I.e.
>>>
>>> 	if (flags != MEMBLOCK_NONE && flags != rgn->flags) {
>>> 		pr_warn("memblock: Flag mismatch at region [%pa-%pa]\n",
>>> 			&rgn->base, &rend);
>>> 		pr_warn("  Existing region flags: %#x\n", rgn->flags);
>>> 		pr_warn("  New range flags: %#x\n", flags);
>>> 		pr_warn("  New range: [%pa-%pa]\n", &base, &end);
>>> 		WARN_ON_ONCE(1);
>>> 	}
>>>
>>
>> I can add this, but the only thing is that it might be several weeks between me putting this in the
>> kernel and that kernel being deployed to enough machines that it starts to show up. I think the IMA coinciding
>> with memblock_mark_kho_scratch in e820__memblock_setup could be the reason for the warning. It might be better to
>> fix that case and deploy it to see if the warnings still show up?
>> I can add these prints as well incase it doesnt fix the problem.
>  
> I really don't think that effectively disabling memblock_mark_kho_scratch()
> when KHO is disabled will solve the problem because as I said the flags it
> sets are on different structure than the flags set by
> memblock_reserve_kern().
> 
>>> If you have the logs from failing boots up to the point where SLUB reports
>>> about it's initialization, e.g. 
>>>
>>> [    0.134377] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
>>>
>>> something there may hint about what's the issue. 
>>
>> So the boot doesnt fail, its just giving warnings in the fleet.
>> I have added the dmesg to the end of the mail.
>  
> Thanks, unfortunately nothing jumped at me there.
> 
>> Does something like this look good? I can try deploying this (although it will take sometime to find out).
>> We can get it upstream as well as that makes backports easier.
>>
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 154f1d73b61f2..257c6f0eee03d 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1119,8 +1119,13 @@ int __init_memblock memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t
>>   */
>>  __init int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  {
>> -       return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> -                                   MEMBLOCK_KHO_SCRATCH);
>> +#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
>> +       if (is_kho_boot())
> 
> Please use 
> 
> 	if (IS_ENABLED(CONFIG_MEMBLOCK_KHO_SCRATCH)
> 
> instead of indef.
> 
> If you send a formal patch with it, I'll take it.
> I'd suggest still deploying additional debug printouts internally.


Thanks! I will add the additional debug prints and [1] in the next release.
It will be sometime before it makes it into production, so I will try to debug
this more using the information you provided above.

[1] https://lore.kernel.org/all/20251126072051.546700-1-usamaarif642@gmail.com/

> 
>> +               return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> +                                           MEMBLOCK_KHO_SCRATCH);
>> +#else
>> +       return 0;
>> +#endif
>>  }
>>  
>>  /**
>> @@ -1133,8 +1138,13 @@ __init int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size)
>>   */
>>  __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  {
>> -       return memblock_setclr_flag(&memblock.memory, base, size, 0,
>> -                                   MEMBLOCK_KHO_SCRATCH);
>> +#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
>> +       if (is_kho_boot())
>> +               return memblock_setclr_flag(&memblock.memory, base, size, 0,
>> +                                           MEMBLOCK_KHO_SCRATCH);
>> +#else
> 
> If nothing sets the flag _clear is anyway nop, but let's update it as well
> for symmetry.
> 

