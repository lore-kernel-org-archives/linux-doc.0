Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387292;
	b=Hp1Wtne8jZpeNueIhTUASQxWkwMgNc3zg3H/K8g6C+tLB8dzAQIvSCVOH6KD5vjSspjl
	 WXZ1HquMvvdJJWCgtM42pTShREKg9s60npdITqKd1clELgesxgHNiuXFWERtWjEz0YRMj
	 84WWwz8swsNhT+9luirSbiv57heQ+eiyjlkRZ4qW5s6553on6Ipf5anTwKl6ByZcphf9m
	 VfI6SMP22l/B8Q+GyyshlLDcQaZOPb3T/ZEtLhCE9uD88mi9DzR/EphLED8qooyAKF3DV
	 +otGb9t8bPSYHSw7UmbjwB+SnHSB09B7S6fnBA7knCXIepuhsPyQ8DSz08v5tZz5aCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LLwOkpWku+LuRzU0j1n/3ISg+beECDACZb9CL8tnJJE=;
	b=GZAUpJmfVuAeXOT6uhPnykfqyJzMTT8PISDqyih1SJ1JLKR4uzGq7q9jN5Nel85lMrxv
	 +SVUNQAagcvLqQEm4N4UpAKFN94m7WmChQY6jEXms1kLJIroTKVrqJJF4OqiFVaZfrLK3
	 KJygQcPs7au3gu/73Okcn5kndM9/HJaX5bmzfXEF0kB6zXs4rR7lQF0WKhDQpgNycQskd
	 BNcfV39/O6+ISNiitd657JBGuo4MFSvdsqhtiVk28csBsKv3UhKXxlUFpaOE1teabxbAZ
	 y2zM4gx7RarGjrDOMz/4tBRP/olfBVRkZiGyTu0I+fioFbv5LuQJgB+ycg1PkEND/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZcpTYDg1;
	arc=none smtp.remote-ip=95.215.58.239
Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B213606A32D
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B213606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZcpTYDg1
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VWN8eFztGEEX6q/yBgqDy1q04Jl/aSZsCUJ97YS64+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387289; v=1; x=1794992089;
 b=ZcpTYDg1JpJLHVnoN7sNv58aKANM3gl9EuBQcP83fO1iL6EPYTSLjm1mp5jHvoWSp1sWh03s
 VRPUp3PNZ91AqkJrRTEaYO7ABev4cldTqBzl/kFKN9d+Ex2kP0ZYYFkg0PEJec2oB7N44plnrH5
 zd27Wb+X/ehAFPekq8xGjOBg=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e744c096daf5982;
	Wed, 11 Nov 2026 08:54:49 +0000
X-Mizu-Trace-ID: 3e744c096daf5982
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/7] Documentation: KVM: Fix lock names and a lock type in locking.rst
Date: Wed, 11 Nov 2026 08:54:43 +0000
Message-ID: <20261111085448.1130701-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111085448.1130701-1-fuad.tabba@linux.dev>
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
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

The x86 lock ordering refers to kvm->arch.mmu_lock instead of
kvm->mmu_lock. The entry for wakeup_vcpus_on_cpu_lock gives its type
as spinlock_t instead of raw_spinlock_t, and its comment uses the list
and lock names from before commit 12a8eee5686ef ("KVM: Move x86 VMX's
posted interrupt list_head to vcpu_vmx").

Fix all three.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/locking.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 662231e958a07..df0db74630976 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -54,9 +54,9 @@ On x86:
 
 - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock and kvm->arch.xen.xen_lock
 
-- kvm->arch.mmu_lock is an rwlock; critical sections for
+- kvm->mmu_lock is an rwlock; critical sections for
   kvm->arch.tdp_mmu_pages_lock and kvm->arch.mmu_unsync_pages_lock must
-  also take kvm->arch.mmu_lock
+  also take kvm->mmu_lock
 
 Everything else is a leaf: no other lock is taken inside the critical
 sections.
@@ -297,13 +297,13 @@ time it will be set using the Dirty tracking mechanism described above.
 
 ``wakeup_vcpus_on_cpu_lock``
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-:Type:		spinlock_t
+:Type:		raw_spinlock_t
 :Arch:		x86
 :Protects:	wakeup_vcpus_on_cpu
 :Comment:	This is a per-CPU lock and it is used for VT-d posted-interrupts.
 		When VT-d posted-interrupts are supported and the VM has assigned
-		devices, we put the blocked vCPU on the list blocked_vcpu_on_cpu
-		protected by blocked_vcpu_on_cpu_lock. When VT-d hardware issues
+		devices, we put the blocked vCPU on the list wakeup_vcpus_on_cpu
+		protected by wakeup_vcpus_on_cpu_lock. When VT-d hardware issues
 		wakeup notification event since external interrupts from the
 		assigned devices happens, we will find the vCPU on the list to
 		wakeup.
-- 
2.47.3

