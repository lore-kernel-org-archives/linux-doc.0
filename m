Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731EC20013C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455799; cv=none; b=Ds3XrTvNz/99Qh0bFfNT4Ad0GF0titWHKMIFTmZjNBtr7BqDd84SI7dTAaR15qWX7arTooxJ5oPCpib42ZNVW35zn2SlqiEuh2BQ/HD753o0tqzRJ+yn54PZV7mBbk0BiFPkHZYMZrYUb2sYRgqJmv2FYYi2QwK7tu2YZO3WLRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455799; c=relaxed/simple;
	bh=YkgfGnO9YuSs6jW3cToj++wCeLfYHp3+3X5IEmvRJsw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BV2bN0ZeNk4dRUnaqYwr4AwHZOEsh6J6DmBvGEY7rAUdHZRNcnFvitNh690whjit43+NILonYIrXIGv6ouFozfZeVuGkQ6yxoly5JNEozs9nU9R9yKNYCq6mY41RLBY2ynRkYW17Boz2LLnY0XNNB/Vp9wxd1a8KPxRSnyqPJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kigySOQf; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kigySOQf"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-85c5f455e41so345914241.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455795; x=1737060595; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zwxnelFEQr4C3vtPtPgRGtQjenWxHSmpAHQLFMvsChA=;
        b=kigySOQf9F7mPOeTIucYwMozlQPEGSPtfiqy0+MOz/fWj/rZwCIM9TLx2tk58EkMhW
         9qfGYebfxLrmbxV+gwz7MPYAVSb9DBSIY6ItjF/Da5E82AzwXw+D5GLgosfNvnr6+cLl
         aBz0LO/hSQdjJYHpPW1u9ekA79iGsd97u7FgtNk0Uj8Gapb2Opt+/WoS9baOcsG0L3b4
         9e8mU1pMhl/NVk2yR4ab2RiAxJY2pR/D0nFZb3Le6IUkcbfsVyzX+PwH4Bfj+3itJZON
         Q0/9AZq60fondEhYMK4Hku9OdP7K7TTAVFJO3TVdMwibwdXYSO2udpgu2+yNk+lXK5oX
         cjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455795; x=1737060595;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwxnelFEQr4C3vtPtPgRGtQjenWxHSmpAHQLFMvsChA=;
        b=AKxN3LyCyqSscrZDjpuTb9udkKqITukJOy+C434w0GiebFQLTDApKMlQlQmtIoZZQC
         gBEM9++ADDKMghNP+Di8J1I58EI0q9r8vN3vnr4rPaHwLta8oQbxdgU3Eda7DdlGJK1f
         1KsOyr8VV7I/QTyW32KRNnEWJyw4o5yEsUAMva9Z+vvjUkkdIWxlbFbC6EAg4gFZGNiT
         O9oQ2JhVDZ6LooEwcfIgXWPWl1ebI5xermoWDPlpcjnFMap6osYCH5JFFtSzbWzL2xA9
         VGtRu1MruM1Ha5hWbUSKTvWp6ALSgdnppvA5qqAVKLmzJeTvVbj28k5wtL2rgUsdoLlI
         EpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5K9aKU1tWpgtczxtB+dP6DA/zMedRWs1hdthtLjsCl+iCnye/shi9VvR2WkC+UQpYFCQ7fv4ZWlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXR+nqwMAwTQXSFP/O1umFCDFqfiKxNTjAVissKzPXWxStqPr
	sV1OUEtptGQa17Pxoo3iBh83F7x2kDUuQji/n4NawzHJXdZD1Gd5R0CL55wCEkzJ0rduYaBdA4S
	zkza2rAx7sKwmg09LkA==
X-Google-Smtp-Source: AGHT+IEQb1u/rfnn1fSyPTU2pPIfyZ5lKsGhAlzX80eQpvo3eWAajg+PF8bqh67MyuBcqLLCXncCH9d2iaL7ubsN
X-Received: from vsbbq8.prod.google.com ([2002:a05:6102:5348:b0:4af:b35d:162c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2b92:b0:4af:f892:e9f0 with SMTP id ada2fe7eead31-4b3d0f2d8f1mr8447963137.14.1736455795460;
 Thu, 09 Jan 2025 12:49:55 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:16 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-1-jthoughton@google.com>
Subject: [PATCH v2 00/13] KVM: Introduce KVM Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a v2 of KVM Userfault, mostly unchanged from v1[5]. Changelog here:

v1->v2:
- For arm64, no longer zap stage 2 when disabling KVM_MEM_USERFAULT
  (thanks Oliver).
- Fix the userfault_bitmap validation and casts (thanks kernel test
  robot).
- Fix _Atomic cast for the userfault bitmap in the selftest (thanks
  kernel test robot).
- Pick up Reviewed-by on doc changes (thanks Bagas).

And here is a trimmed down cover letter from v1, slightly modified
given the small arm64 change:

Please see the RFC[1] for the problem description. In summary,
guest_memfd VMs have no mechanism for doing post-copy live migration.
KVM Userfault provides such a mechanism.

There is a second problem that KVM Userfault solves: userfaultfd-based
post-copy doesn't scale very well. KVM Userfault when used with
userfaultfd can scale much better in the common case that most post-copy
demand fetches are a result of vCPU access violations. This is a
continuation of the solution Anish was working on[3]. This aspect of
KVM Userfault is important for userfaultfd-based live migration when
scaling up to hundreds of vCPUs with ~30us network latency for a
PAGE_SIZE demand-fetch.

The implementation in this series is version than the RFC[1]. It adds...
 1. a new memslot flag is added: KVM_MEM_USERFAULT,
 2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
 3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
 4. a new KVM capability KVM_CAP_USERFAULT.

KVM Userfault does not attempt to catch KVM's own accesses to guest
memory. That is left up to userfaultfd.

When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
are zapped, and new faults will check `userfault_bitmap` to see if the
fault should exit to userspace.

When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
permitted.

When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
consistent with dirty log disabling. So on x86, huge mappings will be
reconstructed, but on arm64, they won't be.

KVM Userfault is not compatible with async page faults. Nikita has
proposed a new implementation of async page faults that is more
userspace-driven that *is* compatible with KVM Userfault[4].

See v1 for more performance details[5]. They are unchanged in this v2.

This series is based on the latest kvm/next.

[1]: https://lore.kernel.org/kvm/20240710234222.2333120-1-jthoughton@google.com/
[2]: https://lpc.events/event/18/contributions/1757/
[3]: https://lore.kernel.org/all/20240215235405.368539-1-amoorthy@google.com/
[4]: https://lore.kernel.org/kvm/20241118123948.4796-1-kalyazin@amazon.com/#t
[5]: https://lore.kernel.org/kvm/20241204191349.1730936-1-jthoughton@google.com/

James Houghton (13):
  KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
  KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
  KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
  KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
  KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
  KVM: arm64: Add support for KVM_MEM_USERFAULT
  KVM: selftests: Fix vm_mem_region_set_flags docstring
  KVM: selftests: Fix prefault_mem logic
  KVM: selftests: Add va_start/end into uffd_desc
  KVM: selftests: Add KVM Userfault mode to demand_paging_test
  KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
  KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
  KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
    details

 Documentation/virt/kvm/api.rst                |  33 +++-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  26 +++-
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  27 +++-
 arch/x86/kvm/mmu/mmu_internal.h               |  20 ++-
 arch/x86/kvm/x86.c                            |  36 +++--
 include/linux/kvm_host.h                      |  19 ++-
 include/uapi/linux/kvm.h                      |   6 +-
 .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 .../selftests/kvm/include/userfaultfd_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
 .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
 .../selftests/kvm/set_memory_region_test.c    |  33 ++++
 virt/kvm/Kconfig                              |   3 +
 virt/kvm/kvm_main.c                           |  54 ++++++-
 17 files changed, 419 insertions(+), 36 deletions(-)


base-commit: 10b2c8a67c4b8ec15f9d07d177f63b563418e948
-- 
2.47.1.613.gc27f4b7a9f-goog

