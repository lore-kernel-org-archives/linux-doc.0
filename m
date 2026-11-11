Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376808;
	b=qTLzWCZkLiwi0ZxK/R0bQiXEGtsJBsvsmw+Ry+6mMd/1nKs2bLTxV/OTwGgLsrKI+6pI
	 JcTcdjP+tCgejIoQ7X1vr1FrsKDcCuUcGC6HkrrHiHpjZ3CjB8fHaP4EAQEeYf1wy8LQ1
	 HFf7bvRPR1ib5KhVf147g97ab9/rzV8jvCvegafCZ3KbxkQFggDdCfLKh+Mzg7Vwph9vu
	 k3/V6VvBf0pHCMa/gGi1m54Ph7qXLPkjIIwDd8P4AAInit7/0DsBfgBNqyYz0813E6dUC
	 w5CkKs41Dqu8jsR3jnOtkwyOZpUHAIgq16AMQCrFP1nB7GGU/wk288mJV0DDYtbR98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376808;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=M7BMGXRbrng59A71K+mamsi43ullJvLvqNPOWu4+ieU=;
	b=P3Pw8vspg4VRD952JNcJMGyl4oWkb33LDtw5oKTBxBqfGaYDaAfGEjThTwPZjTpawBKH
	 Msz2KU2cQUlU8rOUvdrCiO/Vdk5yANhP+8/PYRVor2OhDqXf75x1VphDmc33HNuWKDePK
	 7J2vKv3N1ivQ46oKjlxrKaDVn9qZl7dsKGdtichiVmdLRa2Br98DemS83eeist53QjXAL
	 W7LXvrZP3z+WcGyp/0zNCOnOjg69DAVwj3ZT+9QcH9rOI4JLJgyrq4X02SPaZdtoY35HZ
	 lw5IK3Ci+uYF2bAouJpChcubkajetD/R5yhrGMx39vM4xcBfIGC+Ro1DTWZCEyJtg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KgLmSMU3;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B997606A327
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B997606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KgLmSMU3
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1310854a12.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376808; x=1794981608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M7BMGXRbrng59A71K+mamsi43ullJvLvqNPOWu4+ieU=;
        b=C95q1l3uAk+6Qc92o9bA73kX8mcW60kla3WsIicnO3g69BAU5r07UEfYHloTR4bDoU
         MDDAJy6/LD14c/aqWXyI69NXF9dXlLFtuHc7lVWPwcDnJNTLBQc0YsqYD2gE6MdLfvpR
         rvaU5Gahwyp7J9sTHpD1cAk7t51nOknZBaOQLVbTMHRjAY1AqHPMEQ/WPx2DCNTKSkem
         RddmNxnwdftEKIxtBcjCfNzAnQoWShdycIICZY6GoSKIIWqCl1VLQ/Ydk9YfAvrly85H
         HLnbMWyaKxf2s+6lwy5Tjg5iH0OuWcJ7Rqaxe2hH21qsyghP2cWKqDT0cWi3kzXPLzqQ
         JueA==
X-Forwarded-Encrypted: i=1; AL+hErGgHgq54CpmnNQzZqOk9tgi7uXS/ldGjwTR9ED4Jo9rC3cg0fV6cB4ldC3XR19mME0JLenm7e8qHWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OzL2vtoRDhoBRFazuLaxeX+nWM8f1oh3gyHqMeCndm9LMhYtX
	08wmX/juy7RFnJ8k87ERzQnZv81jBkTVuE8xXvjFO4opBoWRRr28F88q5xtfG0Ly/Glbr4srk2g
	mB2bcLNi4APdxLdA0Wk/B0lWToLr6SQRWjijT45cTIchjsxiOQ2D7jeW6hQM6TRANaSwaaMHky0
	Vq6zLPmtqNUOzyNeOy+HrsFwWaSt2orYrLdgpr8O9Bm3PMH6NoRSn7xK4Eu2VoDzQ1EzOwtWjx+
	oTT0ldVbxrz
X-Gm-Gg: AYBFou1Eajym1c+nYmdb7F80umG+Lv/sTh4NuoiLBPXN0J7Pum+VjoSc5mKAunS7sfd
	FCMviKL6jb80cLDT1+Dj13K0zb+GCZu2C3415O7IZlEgK4D7ueWo+/hb+m0ijokq4drYGpP6NRL
	3+awJg34NGdJKkiUkquEOecPHVZ81INp6AwdQo60XjYh1rMeymK4XiO6VmlxX+gB5wVrjL1Gduq
	fSP8lqDd7JbeH2MIYE49MZRotooAZTVMRPHxTB30liaVc6ckzESrxijiA47NDbKGrrJ5Nnd3/50
	cRIH8nOhvH4JP79xbTJnSdiXYrJGkMf/6uvKmart7JS1rwXDVMLzXtyHMnfsNnSp9eZRoXWHMaj
	7qwMBbWuBRgxEFf8WGnBgJF1pMnJDDpOdjM4HkvktED3Kn44WOUtnVzTlB33x5ZfRigIZiGUS6B
	L+/+o+eXLAd5Xl6MMIpt5DyvBvvxtUIsO0
X-Received: by 2002:a17:90b:534f:b0:3b0:da22:db4d with SMTP id 98e67ed59e1d1-3b182f1f5demr1548305a91.25.1794376807762;
        Tue, 10 Nov 2026 22:00:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181f9083bsm399556a91.1.2026.11.10.22.00.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so545377685a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376806; x=1794981606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7BMGXRbrng59A71K+mamsi43ullJvLvqNPOWu4+ieU=;
        b=KgLmSMU39jn2ZO/Iecl0H912lW7nAg+5ovWj+Fwg9uXEIM2MVHcN3t4RDQaylVBXpB
         blgT9YKLqbaIFOuRJsWYDFA0FaBsS/JsuzTTtWUCT+MR7IBb49P5qWnpwWujba/1cUSz
         Hjwx/Y8SD5HBstupks730+55UFfBXPDBN89Eo=
X-Forwarded-Encrypted: i=1; AL+hErGtw4wBO5SRDc04GUg1hiWsIdD3NVJFHTR1IxFskNkwN1jXKdnsMbdUyqHLlsW5knbmWMnQWGPE2RQ=@vger.kernel.org
X-Received: by 2002:a05:620a:2693:b0:93f:2635:b6f1 with SMTP id af79cd13be357-947afb8c005mr186505185a.8.1794376805744;
        Tue, 10 Nov 2026 22:00:05 -0800 (PST)
X-Received: by 2002:a05:620a:2693:b0:93f:2635:b6f1 with SMTP id af79cd13be357-947afb8c005mr186501185a.8.1794376805091;
        Tue, 10 Nov 2026 22:00:05 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:04 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 00/12] KVM: Improve VMware guest support
Date: Wed, 11 Nov 2026 00:59:49 -0500
Message-ID: <cover.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series lets userspace VMMs run unmodified VMware guests on KVM;
VMware Workstation uses it to run on top of KVM.  I'm sorry this
version took a lot longer than I'd have liked, but I think it addresses
all the comments and results in a very nice cleanup for KVM in general.

VMware guests talk to the hypervisor through the "backdoor", a set of
about one hundred commands implemented in VMware's userspace.  Guests
reach it through IN/OUT/INS/OUTS on two I/O ports, which VMware allows
from CPL3 regardless of I/O permissions, through RDPMC on three
pseudo-PMCs, and, on newer guests, through VMCALL/VMMCALL with VMware's
magic value in EAX.  KVM already emulates the I/O-port and pseudo-PMC
interfaces, but only behind a module parameter that applies to every VM
on the host.

Patch 1 makes the pseudo-PMCs honor enable_vmware_backdoor.
Patches 2-4 move VMware code to vmware.{c,h} and add CONFIG_KVM_VMWARE.
Patches 5-7 add a per-VM capability, hypercall exits and nested routing.
Patches 8-12 add CPL3 selftest helpers and tests.

Notes:
 - Paolo asked in v1 for someone with the spec to go through the
   commands; Doug did that in the v1 thread and none needs KVM
   (SGDT/SIDT/SLDT/STR are obsolete with UMIP, GET_VCPU_INFO flags are
   constants on KVM, GETTIME returns host time without the TSC,
   STEALCLOCK is ESX-only).
 - The I/O-port and pseudo-PMC interfaces share one flag, as two parts
   of the legacy backdoor.
 - VMware hypercalls are never claimed from L2, so a Hyper-V L2 TLB
   flush that KVM handles in L0 stays a Hyper-V hypercall.
 - SEV: KVM doesn't intercept #GP, so the flag can't bypass I/O
   permissions there.  Protected-state VMs can't enable hypercall exits,
   and KVM doesn't forward hypercalls from protected vCPUs of legacy
   SEV-ES VMs either.
 - tools/include/uapi is left to the perf sync, per its README.
 - Sean, Paolo: the new MAINTAINERS entry lists Doug and me; do you want
   to be listed as for Hyper-V and Xen?

The series is based on kvm-x86/next.

Testing:
 - every patch builds with GCC and Clang, CONFIG_KVM_VMWARE=y and =n
 - KVM selftests and KVM-unit-tests on Intel and AMD, with and without
   the series, enable_vmware_backdoor=0 and =1: no differences besides
   the new tests
 - a legacy KVM_SEV_ES_INIT guest on bare-metal AMD gets no
   KVM_EXIT_VMWARE
 - Windows 11 with VBS runs under VMware Workstation on the series

Changes since v2:
 - New patch 1: the pseudo-PMCs honor enable_vmware_backdoor
 - Split the first patch into code movement, helpers and Kconfig; all
   code in vmware.{c,h}; CONFIG_KVM_VMWARE depends on KVM_X86 (Sean)
 - kvm_is_vmware_*() predicates with the enabled check inside (Sean)
 - One KVM_CAP_X86_VMWARE with flags in the x86 UAPI header instead of
   three capabilities; flags are one-way and only accepted before vCPU
   creation (Xin, Sean); "_L0" dropped from the nested flag (Sean)
 - No stub for the hypercall handler, no #ifdef plus stub (Sean)
 - struct kvm_vmware_exit in the x86 UAPI header (Sean); the exit now
   carries only mode and CPL, registers go through KVM_SYNC_X86_REGS,
   and exception completion is validated
 - Only L1 hypercalls with VMware's magic are claimed
 - Nested SVM fixed: v2's nested_svm_exit_special() hook never fired
 - Selftests: KUT port (Sean), hypercall, Hyper-V coexistence and
   nested routing tests

v2: https://lore.kernel.org/all/20250422161304.579394-1-zack.rusin@broadcom.com
v1: https://lore.kernel.org/all/20241030033514.1728937-1-zack.rusin@broadcom.com

Zack Rusin (12):
  KVM: x86/pmu: Honor enable_vmware_backdoor for VMware pseudo-PMCs
  KVM: x86: Move VMware backdoor support to separate files
  KVM: x86: Encapsulate VMware backdoor checks
  KVM: x86: Add CONFIG_KVM_VMWARE
  KVM: x86: Add a unified VMware capability
  KVM: x86: Forward VMware hypercalls to userspace
  KVM: x86: Route nested VMware backdoors to KVM
  KVM: selftests: Add helpers to run x86 guest code in user mode
  KVM: selftests: Port VMware backdoor coverage
  KVM: selftests: Test VMware hypercall exits
  KVM: selftests: Test VMware hypercall exits with nested Hyper-V
    flushes
  KVM: selftests: Test nested VMware backdoor routing

 Documentation/virt/kvm/api.rst                | 119 +++++-
 MAINTAINERS                                   |  10 +
 arch/x86/include/asm/kvm_host.h               |  11 +
 arch/x86/include/uapi/asm/kvm.h               |  27 ++
 arch/x86/kvm/Kconfig                          |  12 +
 arch/x86/kvm/Makefile                         |   1 +
 arch/x86/kvm/emulate.c                        |   9 +-
 arch/x86/kvm/pmu.c                            |  41 +-
 arch/x86/kvm/pmu.h                            |   5 -
 arch/x86/kvm/svm/svm.c                        |  12 +-
 arch/x86/kvm/vmware.c                         | 201 +++++++++
 arch/x86/kvm/vmware.h                         | 102 +++++
 arch/x86/kvm/vmx/nested.c                     |   5 +
 arch/x86/kvm/vmx/vmx.c                        |   5 +-
 arch/x86/kvm/x86.c                            |  63 ++-
 arch/x86/kvm/x86.h                            |   2 -
 include/uapi/linux/kvm.h                      |   6 +
 tools/testing/selftests/kvm/Makefile.kvm      |   3 +
 .../selftests/kvm/include/x86/hyperv.h        |  21 +
 .../selftests/kvm/include/x86/processor.h     |   7 +
 .../testing/selftests/kvm/lib/x86/processor.c |  87 ++++
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  27 +-
 .../selftests/kvm/x86/hyperv_svm_test.c       |  21 +-
 .../selftests/kvm/x86/vmware_backdoor_test.c  | 272 ++++++++++++
 .../selftests/kvm/x86/vmware_hypercall_test.c | 388 ++++++++++++++++++
 .../kvm/x86/vmware_nested_backdoor_test.c     | 223 ++++++++++
 .../selftests/kvm/x86/xen_vmcall_test.c       |  12 +-
 27 files changed, 1587 insertions(+), 105 deletions(-)
 create mode 100644 arch/x86/kvm/vmware.c
 create mode 100644 arch/x86/kvm/vmware.h
 create mode 100644 tools/testing/selftests/kvm/x86/vmware_backdoor_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/vmware_hypercall_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/vmware_nested_backdoor_test.c


base-commit: c37cd5acfc3762e3fec1bf8418dc1471e3d6297d
-- 
2.53.0

