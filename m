Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EC3B42F7
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679335; cv=none; b=TW1pT6D03mtHOvnobUjNPiDLEqJTEhCXHTvIRtwGjankNof+6Xx8BpCsB+BiRZlSxgsFCGjf4yvXvAr4M6ouhkNmwTWDyyrtpTU0Pw9GKxq5dkSDvAZpYQisxzcnnElyXSt5yXegwzi523f0PtVlOqFiD/9yIlBDRkX4MwJcsKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679335; c=relaxed/simple;
	bh=FvYCKboMn/a8PjDhtKBc5rG6rfizWgNOxQ8dn/oJFUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=osuhzXHbRil27RhnygK6JVMFpe14s5+uOAAFQhMtQoYp/E37Iy8m//W9IYnaFpCE+Y1dU70twDiaWxKFwa4Mf1a6R8XBGp99bnw/MyhgrK/GtZ63DlcoQHEbHCu45J2RjZ8dS9uIRtH6WpRuCuV0OAF9Uhymlm9ee22nK3pPmBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WtcL+pkA; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WtcL+pkA"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68cdfbad902so2527552a12.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 10:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780679332; x=1781284132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2ojTho6pPozBEn1mINsChz/MA151sbs8LFhRJ1lhS4=;
        b=WtcL+pkA7bTWvnnlmyItMGJ/nRl+SGf+d32JKn+R6dPaCxLSBQG0QXe9L1F/N19WSU
         g6q/01ztexSilaj/GgaOKYp1sXBDrF/N4FtVTLU26r98IocfLTWdKLixMv1YAAUWTTN1
         +klhe37GHHqicaoV4u1fSuyjDrjDF0gNTKZ0H9g4AnhKcZZmEZyGrgHSzkHJ0ZpAhVTs
         TvvbMTC+gYGk3I1Fa1jUco771d2IWB6zSfYOv4oFrPNm5aV+s2fE4SsgqkCyyun1T1sO
         +TQYq0GOpkgOf7gR+9Zycv6LXJTvovRCkJYnQdwutFtj0C8p3Y1n5FW76drt4wrw/3D2
         rjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780679332; x=1781284132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2ojTho6pPozBEn1mINsChz/MA151sbs8LFhRJ1lhS4=;
        b=kAzJJyS2IGr4ChceH8VHsXFvnzyuCFkGur+o9UM1l7uBKhcLawOV22mkOMUU0AD42L
         NUleQ5GKMv/eXnWQM4WpLzk0zABjASiRRnF8j+x1eJ+aYDmNF0IziZgmuI3k/Oyx75ng
         0OwHri0jq9IeZ0ECk9joFavXgKNUk3iKDjGQx45AuYcWzkhTAWBz1vxTHVbH6pFHYP1T
         g5SUsCoyyGbEQ0iipCKRkloCPa+SGePXRMG8u6263fmmvdqnHUlPW4vYr/Z/ftlP0YDh
         hFJ+nw9w+R5mD5WMxF9NcCPCKXMiraH8EbFyG9W7uv+Ltw6eb78VPTXb2fzg1lOr9uEq
         su5A==
X-Forwarded-Encrypted: i=1; AFNElJ/B+ZhnLsZyGNp9ZyZyyXnuaLDL+KBe7RMtedK20/AHfdLJp7SKa1tY5pDh3XF5CPYTahoQkRgguW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmFwvY3bU/RxVY7XyCHSTJvraqMZjWy1ae1zLO73tE0OOBqQU/
	w9LCY9r9njDqtL5g3GV9fn7Q5b0vkhoFsiU/GOTfry0jc2l2fnvQcBHyGBDziLca5RtQzgcHI3e
	JD1vcFj/KBdF6gD/8sw==
X-Received: from edra26.prod.google.com ([2002:aa7:d91a:0:b0:678:e4b0:ff8d])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:11d2:b0:691:5124:45de with SMTP id 4fb4d7f45d1cf-69151244880mr66851a12.16.1780679331513;
 Fri, 05 Jun 2026 10:08:51 -0700 (PDT)
Date: Fri,  5 Jun 2026 17:08:34 +0000
In-Reply-To: <cover.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <4af286e970b7a44b539f78d746e92b91571c18fa.1780676742.git.tarunsahu@google.com>
Subject: [RFC PATCH v2 09/10] selftests: kvm: Split ____vm_create() to expose
 init helpers
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	Tarun Sahu <tarunsahu@google.com>, fvdl@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, 
	aneesh.kumar@kernel.org, skhawaja@google.com, vipinsh@google.com, 
	ackerleytng@google.com, Pratyush Yadav <pratyush@kernel.org>, david@redhat.com, 
	dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Refactor `____vm_create()` in the KVM selftest library to extract its
initialization steps into separate, reusable internal helpers.

Introduce `vm_init_fields()` and `vm_init_memory_properties()`. This
allows advanced test setups to perform targeted VM fields or memory
property initializations independently, which is required by upcoming
test cases that restore preserved VMs. No functional changes are
introduced for the existing tests.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 26 +++++++++++++------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 2ecaaa0e9965..d10cd25d0658 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -471,6 +471,8 @@ const char *vm_guest_mode_string(u32 i);
 
 void kvm_vm_free(struct kvm_vm *vmp);
 void kvm_vm_restart(struct kvm_vm *vmp);
+void vm_init_fields(struct kvm_vm *vm, struct vm_shape shape);
+void vm_init_memory_properties(struct kvm_vm *vm);
 void kvm_vm_release(struct kvm_vm *vmp);
 void kvm_vm_elf_load(struct kvm_vm *vm, const char *filename);
 int kvm_memfd_alloc(size_t size, bool hugepages);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e08967ef7b7b..d3e6508e9863 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -276,13 +276,8 @@ __weak void vm_populate_gva_bitmap(struct kvm_vm *vm)
 		(1ULL << (vm->va_bits - 1)) >> vm->page_shift);
 }
 
-struct kvm_vm *____vm_create(struct vm_shape shape)
+void vm_init_fields(struct kvm_vm *vm, struct vm_shape shape)
 {
-	struct kvm_vm *vm;
-
-	vm = calloc(1, sizeof(*vm));
-	TEST_ASSERT(vm != NULL, "Insufficient Memory");
-
 	INIT_LIST_HEAD(&vm->vcpus);
 	vm->regions.gpa_tree = RB_ROOT;
 	vm->regions.hva_tree = RB_ROOT;
@@ -380,9 +375,10 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	if (vm->pa_bits != 40)
 		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
 #endif
+}
 
-	vm_open(vm);
-
+void vm_init_memory_properties(struct kvm_vm *vm)
+{
 	/* Limit to VA-bit canonical virtual addresses. */
 	vm->vpages_valid = sparsebit_alloc();
 	vm_populate_gva_bitmap(vm);
@@ -392,6 +388,20 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	/* Allocate and setup memory for guest. */
 	vm->vpages_mapped = sparsebit_alloc();
+}
+
+struct kvm_vm *____vm_create(struct vm_shape shape)
+{
+	struct kvm_vm *vm;
+
+	vm = calloc(1, sizeof(*vm));
+	TEST_ASSERT(vm != NULL, "Insufficient Memory");
+
+	vm_init_fields(vm, shape);
+
+	vm_open(vm);
+
+	vm_init_memory_properties(vm);
 
 	return vm;
 }
-- 
2.54.0.1032.g2f8565e1d1-goog

