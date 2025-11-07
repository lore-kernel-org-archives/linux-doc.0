Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9473358B9
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762537029; cv=none; b=Ywjmr9EbsSkxg/nRiBMXkmb0HkCVno17Jlxqy4RD3G5ovKj0MmjtSAnsvvi4YJrscL2oOohe+m6kBarcsBDDiOK/yRVq7qcLgidVZ/Eh4K+U2TGGzZECvQopers3VlPrRjXwgQK/SIcUfdIigsTF//JVthz0/g58l/H01X6c18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762537029; c=relaxed/simple;
	bh=Lx3bFQ3NiP4uoTXJligat5YBVbYSgoMH3tTDsWSPIac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N9AshZzofWIP6JzP5ZNSOlnHLDSrE8L1SMAXGAaTsfoG/mhbt90twe5Wyb3U7kEFdbMKzt1fGot1X/JF3OY84VzVug7+NFs5ilSg9PUN9iHDc5SyyqIPc6UUSqvnuKRmdbu3xMx466RFvkX77B1Qgf4OEowAMAVoQe1dL5EGQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P9bvmQ2D; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P9bvmQ2D"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c93a28ebso777620f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762537024; x=1763141824; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhz7gcsikgOjW44ogPO6UQeW+YT4AB9gKFb1aT581fI=;
        b=P9bvmQ2DdHFQGaXVosN7z50YtAoWXDvGhEpUoslH5au84lQCn831C9zDK4pfZKbDS4
         XVHZcr4LQFqwmjTiQebheCRYPJ/XNRSIyzVb0LW1UQ9Zb4daMn7jcek37pgTfFzjtUFx
         91Cuw9RtJciYAE8f+jJCkXAuvQM2HF3Si2l5/Ti3qyCVH0wCy/fe8rP1KKB959OLoGv8
         iw7yDlULYlQCgqh5ykcX39r5wAW1LTc1HIcjKxvJoWUDoA1wOYemWtFE9t7RoQM5aHH7
         uxP64yDOeG6X8b0dp6ZMIYhNwlsGNQoR7H20a10RKp0lhDIfXucjxiJ0pWVhUirM2jaa
         WbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762537024; x=1763141824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhz7gcsikgOjW44ogPO6UQeW+YT4AB9gKFb1aT581fI=;
        b=deJEIaWOvikQm+TGD5dJNcc9sOQhD47VfzKHchx331Pi4M6aPptH7UKd9mJFr/G2H4
         QQxkyt23Z6noM997H5ZaMKbuIzIfe9mpozQ6lsDhDTdDM/d1k4wC5QFrcNkwama1/AQM
         1bLXOC92uEdFpTkWF/WTuM4KrfOaIzinh5QP7gQvI+h8o7+CgR3tK8qqc7H4V5FT5pac
         s77FGfzdEf3eavggDL2DzUzKsIDwaCnOUKNZ7YTDZcp1kJyZYSkNFDN9yIbQ6/v4Q+nV
         lCzr3m+ufS899Q474uXEtdgUe+aPWpPYwRHrmQ8LAKerFgaNuKyNMdbU6ooCvIqm94p9
         wgEA==
X-Forwarded-Encrypted: i=1; AJvYcCWok19Pgrqe4hn3CZ8V9x6cAuouBS8aYE3LSHLgC254CXExVyZXOk4eysu+ur0DM+pqtHOZjXqD+0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+zAQdLiBnM+acxwWPpc2q1kUzIvJUtER+s+O+UAgLP2c0DRZ
	HTh4jsAMTdVOmIdBPJP2d3MtOC12HHig3vL3A3UN04RhIeGeEqsUR+Qyn3OAXq33g3WiDESMa9O
	Eq0SbiiEPhcfq4g==
X-Google-Smtp-Source: AGHT+IFJF2Ksc6u55CE+GD/K60cqff3jO8p1vj7rkxXgTU2hADlFy8fEI1U56A7kvOlzF5vcUeX5HHSZeZ5zgA==
X-Received: from wrbfq11.prod.google.com ([2002:a05:6000:2a0b:b0:429:ccad:3298])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178b:b0:429:d725:4114 with SMTP id ffacd0b85a97d-42ae5ac5374mr3668462f8f.39.1762537024246;
 Fri, 07 Nov 2025 09:37:04 -0800 (PST)
Date: Fri, 07 Nov 2025 17:37:03 +0000
In-Reply-To: <DE2L1SAOC55E.E4JY62WJQ2A8@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250924151101.2225820-1-patrick.roy@campus.lmu.de> <DE2L1SAOC55E.E4JY62WJQ2A8@google.com>
X-Mailer: aerc 0.21.0
Message-ID: <DE2N8AOQ1A0Y.1PVEXY6ULPCFV@google.com>
Subject: Re: [PATCH v7 00/12] Direct Map Removal Support for guest_memfd
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Patrick Roy <patrick.roy@campus.lmu.de>
Cc: Patrick Roy <roypat@amazon.co.uk>, <pbonzini@redhat.com>, <corbet@lwn.net>, 
	<maz@kernel.org>, <oliver.upton@linux.dev>, <joey.gouly@arm.com>, 
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <catalin.marinas@arm.com>, 
	<will@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>, 
	<luto@kernel.org>, <peterz@infradead.org>, <willy@infradead.org>, 
	<akpm@linux-foundation.org>, <david@redhat.com>, <lorenzo.stoakes@oracle.com>, 
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>, 
	<surenb@google.com>, <mhocko@suse.com>, <song@kernel.org>, <jolsa@kernel.org>, 
	<ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>, 
	<martin.lau@linux.dev>, <eddyz87@gmail.com>, <yonghong.song@linux.dev>, 
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>, 
	<haoluo@google.com>, <jgg@ziepe.ca>, <jhubbard@nvidia.com>, 
	<peterx@redhat.com>, <jannh@google.com>, <pfalcato@suse.de>, 
	<shuah@kernel.org>, <seanjc@google.com>, <kvm@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>, 
	<linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>, <bpf@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, <xmarcalx@amazon.co.uk>, 
	<kalyazin@amazon.co.uk>, <jackabt@amazon.co.uk>, <derekmn@amazon.co.uk>, 
	<tabba@google.com>, <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri Nov 7, 2025 at 3:54 PM UTC, Brendan Jackman wrote:
> On Wed Sep 24, 2025 at 3:10 PM UTC, Patrick Roy wrote:
>> From: Patrick Roy <roypat@amazon.co.uk>
>>
>> [ based on kvm/next ]
>>
>> Unmapping virtual machine guest memory from the host kernel's direct map is a
>> successful mitigation against Spectre-style transient execution issues: If the
>> kernel page tables do not contain entries pointing to guest memory, then any
>> attempted speculative read through the direct map will necessarily be blocked
>> by the MMU before any observable microarchitectural side-effects happen. This
>> means that Spectre-gadgets and similar cannot be used to target virtual machine
>> memory. Roughly 60% of speculative execution issues fall into this category [1,
>> Table 1].
>>
>> This patch series extends guest_memfd with the ability to remove its memory
>> from the host kernel's direct map, to be able to attain the above protection
>> for KVM guests running inside guest_memfd.
>>
>> Additionally, a Firecracker branch with support for these VMs can be found on
>> GitHub [2].
>>
>> For more details, please refer to the v5 cover letter [v5]. No
>> substantial changes in design have taken place since.
>>
>> === Changes Since v6 ===
>>
>> - Drop patch for passing struct address_space to ->free_folio(), due to
>>   possible races with freeing of the address_space. (Hugh)
>> - Stop using PG_uptodate / gmem preparedness tracking to keep track of
>>   direct map state.  Instead, use the lowest bit of folio->private. (Mike, David)
>> - Do direct map removal when establishing mapping of gmem folio instead
>>   of at allocation time, due to impossibility of handling direct map
>>   removal errors in kvm_gmem_populate(). (Patrick)
>> - Do TLB flushes after direct map removal, and provide a module
>>   parameter to opt out from them, and a new patch to export
>>   flush_tlb_kernel_range() to KVM. (Will)
>>
>> [1]: https://download.vusec.net/papers/quarantine_raid23.pdf
>> [2]: https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
>
> I just got around to trying this out, I checked out this patchset using
> its base-commit and grabbed the Firecracker branch. Things seem OK until
> I set the secrets_free flag in the Firecracker config which IIUC makes
> it set GUEST_MEMFD_FLAG_NO_DIRECT_MAP.
>
> If I set it, I find the guest doesn't show anything on the console.
> Running it in a VM and attaching GDB suggests that it's entering the
> guest repeatedly, it doesn't seem like the vCPU thread is stuck or
> anything. I'm a bit clueless about how to debug that (so far, whenever
> I've broken KVM, things always exploded very dramatically).

I discovered that Firecracker has a GDB stub, so I can just attach to
that and see what the guest is up to.

The issue that the pvclock_vcpu_time_info in kvmclock is all zero:

(gdb) backtrace
#0  pvclock_tsc_khz (src=0xffffffff83a03000 <hv_clock_boot>) at ../arch/x86/kernel/pvclock.c:28
#1  0xffffffff8109d137 in kvm_get_tsc_khz () at ../arch/x86/include/asm/kvmclock.h:11
#2  0xffffffff835c1842 in kvm_get_preset_lpj () at ../arch/x86/kernel/kvmclock.c:128
#3  kvmclock_init () at ../arch/x86/kernel/kvmclock.c:332
#4  0xffffffff835c1487 in kvm_init_platform () at ../arch/x86/kernel/kvm.c:982
#5  0xffffffff835a83df in setup_arch (cmdline_p=cmdline_p@entry=0xffffffff82e03f00) at ../arch/x86/kernel/setup.c:916
#6  0xffffffff83595a22 in start_kernel () at ../init/main.c:925
#7  0xffffffff835a7354 in x86_64_start_reservations (
    real_mode_data=real_mode_data@entry=0x36326c0 <error: Cannot access memory at address 0x36326c0>) at ../arch/x86/kernel/head64.c:507
#8  0xffffffff835a7466 in x86_64_start_kernel (real_mode_data=0x36326c0 <error: Cannot access memory at address 0x36326c0>)
    at ../arch/x86/kernel/head64.c:488
#9  0xffffffff8103e7fd in secondary_startup_64 () at ../arch/x86/kernel/head_64.S:413
#10 0x0000000000000000 in ?? ()
(gdb) p *src
$3 = {version = 0, pad0 = 0, tsc_timestamp = 0, system_time = 0, tsc_to_system_mul = 0, tsc_shift = 0 '\000', flags = 0 '\000', 
  pad = "\000"}

This causes a divide by zero in kvm_get_tsc_khz().

Probably the only reason I didn't see any console output is that I
forgot to set earlyprintk, oops...

