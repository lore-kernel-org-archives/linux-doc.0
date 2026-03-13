Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33737F753
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382422; cv=none; b=ihnu0W0cOiJzaF0tdJQ4JySjBDFFucopHBr3UCTND7u67QEv3XzYlI9KHRt+Z8ttieSJhtoEXnc63FbcWm9r9U1088N7DfuXW6tt9u8bC3xeAG03jnAwxqgXWIcCPW4+4iSfwM4GUEjUBrfA2FK7ILqbWrVP7E7iqLHz8wyEjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382422; c=relaxed/simple;
	bh=0AvRrh6vEolvov+ilblsavP802x/MyKKPaG/juCrxSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gg2nwQjBbhuEsgd/xh7yPJDSzGSTLZuExrxNlDIrLfqU9NP7Ba1hDw5F30cKimsiZWxO0qG0jb72tm72ttpCmJGBJ+8liRByBQXZrhTFld4eDhxtAONQB+BJ8svrJlGvlSTNazNsGeDunR5/FnCAUXqZ+iZD8wTu66srfWDZbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DNPFQBSU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DNPFQBSU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-359fe456655so1336793a91.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773382418; x=1773987218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u0n8Uv+LnWZDbbOj01OuzxvOS5iNrHuDnl1B5SLsuNA=;
        b=DNPFQBSUKua+clQmEpJTxqiinIRejFGXtl6V5yAp8IMzdWz2YlvQ6p5m702EMvJVrS
         wtDu6pSBuh/S1o5kReYX/zunY2KCr0jZ9u0HiyO27ICt3zBsCpT+73c92Euk45thmbp0
         1EAjmpURY9SZubN/Z1LoBBFep3NJUqIqdTWbGZnCLw+zE/y3oU6yv1LaE1eOZXNz1i82
         1rT6KFZSTP4uFV3NStr4f6PvqTHLYonoIy0SQymlDGt/VOHY2G/t26HQtthrOXfDhGj5
         IeyK9u6ASGapABH0xNr4Buts11wfh4d50i0UIX11htfjegnqP7kJX1OPIZuKFxYdWidq
         R59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382418; x=1773987218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0n8Uv+LnWZDbbOj01OuzxvOS5iNrHuDnl1B5SLsuNA=;
        b=So8bqBIXBm3E4fuHQHprwBHQRM5vuiwIwRr1fFm9IFR8VhIlgG+TMKeM2fBd4TI1Og
         Zn/d0DBgOoHYZH+oSpXPF7OIwfAu9wwvBlKFcYeXZMWdUDKLcuHlzUzt5arrisoC5XLq
         RPnNPfeOwWQhpk7fD0ZdS1yuo/074F9RyWyn9I9mYTGXJlHLdV3A6Qse/S+mu7b3ZmRj
         VDR72mth1Yxq4u7f3mUXBdYPg0yPoaEqoSjGLwp10YXLmp7LP8ktLuUkG4cfhk6QSwUf
         NLe+X0kXtJJr8BoYhjoVbGp10JJ8BDCn+8SIjqE4YyGC10yKhvtjvzO0ozt7u+JVRP1C
         LXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOPK3c+aep27cGxdwEHGUJaDkA3WTqrqz9j7ltqPOJtuJcCI0giSWNb9MZq8oDYtwnF/M8l1jsD4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDDIUZ0OKDX4eAxOVqEvGRLttv456iKWe4jZDBW5jQiVc3zKW
	kJ6vWfJwkoos7aS1YUupU7EArPSSrwh3XgJG9Qz0SPVYUWlfV3oYZh6LmuA2sG1pfg8vB2pDudI
	Uq01VB4hMc8a3YwpvnGbm8HL1bw==
X-Received: from pjbie24.prod.google.com ([2002:a17:90b:4018:b0:359:8bb2:c98d])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c11:b0:359:f7d2:a1fe with SMTP id 98e67ed59e1d1-35a21f5decemr1878689a91.9.1773382417898;
 Thu, 12 Mar 2026 23:13:37 -0700 (PDT)
Date: Fri, 13 Mar 2026 06:13:09 +0000
In-Reply-To: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382364; l=3935;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=0AvRrh6vEolvov+ilblsavP802x/MyKKPaG/juCrxSw=; b=Oqn+kMoXiALCHT/I5zr1jx+6Bu2QtC9I0x7Z++M22HSCzj46+HAGaUfwfPI/FhcRcgAfSNWe7
 2uRQSqdZQ+CD23+sfbfxrWQjqpgESh1jN4DKp9Zljz94lOs6+wmOSf6
X-Mailer: b4 0.14.3
Message-ID: <20260313-gmem-inplace-conversion-v3-30-5fc12a70ec89@google.com>
Subject: [PATCH RFC v3 30/43] KVM: selftests: Provide function to look up
 guest_memfd details from gpa
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

Introduce a new helper, kvm_gpa_to_guest_memfd(), to find the
guest_memfd-related details of a memory region that contains a given guest
physical address (GPA).

The function returns the file descriptor for the memfd, the offset into
the file that corresponds to the GPA, and the number of bytes remaining
in the region from that GPA.

kvm_gpa_to_guest_memfd() was factored out from vm_guest_mem_fallocate();
refactor vm_guest_mem_fallocate() to use the new helper.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  3 +++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 34 ++++++++++++++++----------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 1c0f41bf847d0..f05f5ebf0c569 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -427,6 +427,9 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
 	vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
 }
 
+int kvm_gpa_to_guest_memfd(struct kvm_vm *vm, vm_paddr_t gpa, off_t *fd_offset,
+			   uint64_t *nr_bytes);
+
 /*
  * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows need
  * significant enhancements to support multiple attributes.
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 404efb5318f09..6deb6b333a066 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1291,27 +1291,19 @@ void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t size,
 			    bool punch_hole)
 {
 	const int mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
-	struct userspace_mem_region *region;
 	uint64_t end = base + size;
 	uint64_t gpa, len;
 	off_t fd_offset;
-	int ret;
+	int fd, ret;
 
 	for (gpa = base; gpa < end; gpa += len) {
-		uint64_t offset;
+		fd = kvm_gpa_to_guest_memfd(vm, gpa, &fd_offset, &len);
+		len = min(end - gpa, len);
 
-		region = userspace_mem_region_find(vm, gpa, gpa);
-		TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
-			    "Private memory region not found for GPA 0x%lx", gpa);
-
-		offset = gpa - region->region.guest_phys_addr;
-		fd_offset = region->region.guest_memfd_offset + offset;
-		len = min_t(uint64_t, end - gpa, region->region.memory_size - offset);
-
-		ret = fallocate(region->region.guest_memfd, mode, fd_offset, len);
+		ret = fallocate(fd, mode, fd_offset, len);
 		TEST_ASSERT(!ret, "fallocate() failed to %s at %lx (len = %lu), fd = %d, mode = %x, offset = %lx",
 			    punch_hole ? "punch hole" : "allocate", gpa, len,
-			    region->region.guest_memfd, mode, fd_offset);
+			    fd, mode, fd_offset);
 	}
 }
 
@@ -1717,6 +1709,22 @@ void *addr_gpa2alias(struct kvm_vm *vm, vm_paddr_t gpa)
 	return (void *) ((uintptr_t) region->host_alias + offset);
 }
 
+int kvm_gpa_to_guest_memfd(struct kvm_vm *vm, vm_paddr_t gpa, off_t *fd_offset,
+			   uint64_t *nr_bytes)
+{
+	struct userspace_mem_region *region;
+	vm_paddr_t gpa_offset;
+
+	region = userspace_mem_region_find(vm, gpa, gpa);
+	TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
+		    "guest_memfd memory region not found for GPA 0x%lx", gpa);
+
+	gpa_offset = gpa - region->region.guest_phys_addr;
+	*fd_offset = region->region.guest_memfd_offset + gpa_offset;
+	*nr_bytes = region->region.memory_size - gpa_offset;
+	return region->region.guest_memfd;
+}
+
 /* Create an interrupt controller chip for the specified VM. */
 void vm_create_irqchip(struct kvm_vm *vm)
 {

-- 
2.53.0.851.ga537e3e6e9-goog

