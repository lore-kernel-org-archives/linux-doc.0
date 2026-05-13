Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA1226ED40
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688638; cv=none; b=f5LbPYVzNmxW5/fVImERm6em6v8rG0zzDcAewHcewb6gw0MCvI+9GiBqL/EWur+Z4MkC/7S+WTIxv25BtNFNuDke4RE0ERA0yy/OYw/sI9G+azZkhhOY0/hhZF/+p1c8giVTHkBH+W5ew9JikRDmfl7hBIECo+2LSQA7cabJ9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688638; c=relaxed/simple;
	bh=xUFNckisZTKglNhJBqKKNuO742ekTOASKm0SwN4Guw0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SjozJHJfnH2immV48MlEZghS4dpO8S60qApXGcWbH5UwxBrgSKevlUNSkwB65DFG/Cg0bcU5WEvhEr+GuIrHSKxc97pZZ+ojFA9ET/5Lr4o2rIsjwS4nbinM24SDL58YW5/DTaMOTy6XES6uoDfgpouPXdHj28PWhf295TlOiE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VDf30eJx; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VDf30eJx"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-69996a2944dso14225874eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778688634; x=1779293434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=syDSn8FwCn4myKFJCIXbZFQJnGch0dw2zPcy4g4QTeo=;
        b=VDf30eJxEzF7qyEGHsq1JG/8fqUtOltYtgDz/Ufxtc0MGvdmH4n7DjjWn2LgRx5184
         KxxR39SKNgB5O6h1NAgU/bG/Fih9W5D6wJw5zqk+jZ9B/IygHob9XXMwFSsk2/Ocqyu0
         vWk9zd37jlxlMGsl11gwwnoAhlOMX2ywDU9v0LaK4F4pgVbDb2vExgs7FnRft5AVM0d0
         PFMXS+2rqvo2lUMYx4ix1dQRMTLb9HvVk9lut1u/K/y/Cv+3/2RzoWn8lilScDmJ6Z05
         gIAVgZRr8wrpz6Vws90AKe01aKpwRplOrF3ARlBOJfLIkJJKXp9jqz4fUqepBA1K9hWq
         e9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688634; x=1779293434;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syDSn8FwCn4myKFJCIXbZFQJnGch0dw2zPcy4g4QTeo=;
        b=Ri8oB1JfJh+6aVlNeiuT9T8fTbfrCgfwSYT7P1N7xOe9vZzxOoE0VVTAgxn6AX7j8I
         91DwvCRGm9rorHurdpA48zBDE+0ic1vCANEDulpuldGp6A//kj6uY93J2kEdMimLNQQO
         MKo3qtymbK3TXtkpyuq1v4KByJ8lZZvToqv4+x3Iu+4T3fWxlqUQL0SRmBlqlwFvjKG3
         QinsxH6JLH3HvQofBSvA2dHw1OMpD9g2TBKSkQ33cJb6gSphe1Xv2VIVelUb2+wsRS0V
         7Yjd25RuE0+PpfT8QapTcZMiO7XpJDEO2HLkPiXxOANLWnrhStmr3Ir3bH+6kNJTwSI8
         XGDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FqDnhIiSgkgum/MCeSDCEFWvaTQ3r7qUEx2uXA5EpTDrEOMLx7Hf1dqOwHOceH5UA6QX74kjREpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYXLGtGH574ZmF4e/wN5GbH8NkVWHIKORSre3OiS93r3uPO9lz
	8Lh2GuerhLvrvzuLE+d6mdT/DMJq4WpdDtoE9wuEzPoTx9/q0UoQwmLE2j1S8qZD60jjl8C9i7t
	psGTz0zPbj8rfs5sP1LgWuURhmQ==
X-Received: from iovs8.prod.google.com ([2002:a05:6602:2bc8:b0:96e:18c2:898c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1a0c:b0:696:64ab:cd9d with SMTP id 006d021491bc7-69b7a9d330cmr1858550eaf.12.1778688634368;
 Wed, 13 May 2026 09:10:34 -0700 (PDT)
Date: Wed, 13 May 2026 16:10:33 +0000
In-Reply-To: <18d747ea-660a-4ae6-b8b8-365d745352ce@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:57:13 +0100)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnt8q9ncmti.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 00/20] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes


Hi James. Thanks for reviewing.

James Clark <james.clark@linaro.org> writes:

> On 04/05/2026 10:17 pm, Colton Lewis wrote:
>> This series creates a new PMU scheme on ARM, a partitioned PMU that
>> allows reserving a subset of counters for more direct guest access,
>> significantly reducing overhead. More details, including performance
>> benchmarks, can be read in the v1 cover letter linked below.

>> An overview of what this series accomplishes was presented at KVM
>> Forum 2025. Slides [1] and video [2] are linked below.

>> After a few false starts, meeting with Will Deacon and Mark Rutland to
>> discuss implementation ideas, and a few more false starts, I finally
>> have an implementation of dynamic counter reservation that works
>> without disrupting host perf too much. Now the host only loses access
>> to the guest counters when a vCPU resides on the CPU.

>> The key was creating perf_pmu_resched_update, which behaves exactly
>> like perf_pmu_resched except it takes a callback to call in between
>> when the perf events are scheduled out and when they are scheduled
>> back in. That allows us to update the PMU's available counters when we
>> know they are not currently in use without needing to expose private
>> perf core functions and triple check they are not being called in a
>> way that violates existing assumptions.

>> Because this introduces a possibility of perf reschedule during vCPU
>> load, I've optimized to only do that operation if there are host
>> events occupying the intended guest counters at the time of the load.

>> The kernel command line parameter for the driver still exists, but now
>> only defines an upper limit of counters the guest might use rather
>> than taking those counters from the host permanently.

>> v7:

>> * Implement dynamic counter reservation as described above. One side
>>     effect is the PMUv3 driver now needs much fewer changes to enforce
>>     the boundary.

>> * Move register accesses out of fast path for non-FGT hardware. The
>>     performance impact was negligible and this moves bloat out of the
>>     fast path and allows a more reliable design with more code sharing.

>> * Make PMCCNTR a special case in the context swap again because trying
>>     to access it with PMXEVCNTR is undefined.

>> * Fix a bug where kvm_pmu_guest_counter_mask was using & instead of |.

>> * Re-expose the dedicated instruction counter to the host since it was
>>     decided the guest will not own it.

>> * Change the global armv8pmu_reserved_host_counters to
>>     armv8pmu_is_partitoned because it was only used in boolean checks.

>> * Fix typo in vcpu attribute commit so the spelling of the flag in the
>>     commit message matches the code.

>> * Rebase to v7.0-rc7

>> v6:
>> https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/

>> v5:
>> https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/

>> v4:
>> https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/

>> v3:
>> https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/

>> v2:
>> https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

>> v1:
>> https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

>> [1]  
>> https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
>> [2]  
>> https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9

>> Colton Lewis (19):
>>     arm64: cpufeature: Add cpucap for HPMN0
>>     KVM: arm64: Reorganize PMU functions
>>     perf: arm_pmuv3: Generalize counter bitmasks
>>     perf: arm_pmuv3: Check cntr_mask before using pmccntr
>>     perf: arm_pmuv3: Add method to partition the PMU
>>     KVM: arm64: Set up FGT for Partitioned PMU
>>     KVM: arm64: Add Partitioned PMU register trap handlers
>>     KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
>>     KVM: arm64: Context swap Partitioned PMU guest registers
>>     KVM: arm64: Enforce PMU event filter at vcpu_load()
>>     perf: Add perf_pmu_resched_update()
>>     KVM: arm64: Apply dynamic guest counter reservations
>>     KVM: arm64: Implement lazy PMU context swaps
>>     perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
>>     KVM: arm64: Detect overflows for the Partitioned PMU
>>     KVM: arm64: Add vCPU device attr to partition the PMU
>>     KVM: selftests: Add find_bit to KVM library
>>     KVM: arm64: selftests: Add test case for Partitioned PMU
>>     KVM: arm64: selftests: Relax testing for exceptions when partitioned

>> Marc Zyngier (1):
>>     KVM: arm64: Reorganize PMU includes

>>    arch/arm/include/asm/arm_pmuv3.h              |  18 +
>>    arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
>>    arch/arm64/include/asm/kvm_host.h             |  17 +-
>>    arch/arm64/include/asm/kvm_types.h            |   6 +-
>>    arch/arm64/include/uapi/asm/kvm.h             |   2 +
>>    arch/arm64/kernel/cpufeature.c                |   8 +
>>    arch/arm64/kvm/Makefile                       |   2 +-
>>    arch/arm64/kvm/arm.c                          |   2 +
>>    arch/arm64/kvm/config.c                       |  41 +-
>>    arch/arm64/kvm/debug.c                        |  31 +-
>>    arch/arm64/kvm/pmu-direct.c                   | 494 ++++++++++++
>>    arch/arm64/kvm/pmu-emul.c                     | 674 +----------------
>>    arch/arm64/kvm/pmu.c                          | 701 ++++++++++++++++++
>>    arch/arm64/kvm/sys_regs.c                     | 250 ++++++-
>>    arch/arm64/tools/cpucaps                      |   1 +
>>    arch/arm64/tools/sysreg                       |   6 +-
>>    drivers/perf/arm_pmuv3.c                      | 111 ++-
>>    include/kvm/arm_pmu.h                         | 110 +++
>>    include/linux/perf/arm_pmu.h                  |   3 +
>>    include/linux/perf/arm_pmuv3.h                |  14 +-
>>    include/linux/perf_event.h                    |   3 +
>>    kernel/events/core.c                          |  28 +-
>>    tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>    .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
>>    tools/testing/selftests/kvm/lib/find_bit.c    |   1 +
>>    25 files changed, 1861 insertions(+), 787 deletions(-)
>>    create mode 100644 arch/arm64/kvm/pmu-direct.c
>>    create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c


>> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
>> --
>> 2.54.0.545.g6539524ca2-goog

> I tested it a bit and ran the kselftests and it all seems to be working

Great to hear you didn't find any obvious problems with your testing!

> ok. Some of the critical sashiko comments look like they are worth
> looking into though:
> https://sashiko.dev/#/patchset/20260504211813.1804997-1-coltonlewis%40google.com
> For example writing to PMCR_EL0.P from EL2 resets the host's counters,
> even if it's KVM doing it after trapping a write from the guest.

I will comb through this and the other sashiko comments and fix.
