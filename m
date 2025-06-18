Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962A21D3EE
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220688; cv=none; b=r60DlorfDhIpwRjc6rw3ID1yWY/6HU33XPLgXdVrndVZVOr/qLvXC9/GBV3I7SOOFjz15T9KahEfy69mUaYkTllwB8PLvIp1WGsg2rk3ZABnpMAyr3MgU5Ps3uAE1hsQAISIFenYV0i2QGh0QdEkZ7vWCViiOHXzFUft83cYXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220688; c=relaxed/simple;
	bh=pBsXSmQz4NiPuEOYLkwfwEN5cJ0gqQwNFVp5scXJ8tE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c/+jXTZD2MrKRtXXstRyOlAGHrPex3lywX+tkToXeH3LvlV8ZGTJVr9DEpJS+yUixvd+W2Vhvwa+XA/XEXXLbD+1qJyeRXDdRZkUFOmTPI34TWy2qpVmgPW0FVdMY91fYkgRMDRoIbRhevCVloAK1VTwYuqr/dKqXvEVSmAIh30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqWonq7V; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqWonq7V"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748e6457567so283716b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 21:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220687; x=1750825487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=NqWonq7VmobhJY6B8Pahfi9r8ORcLnWhWSkGVdhdHb/NzeRnhzTL9TZAj3LBIEnGDO
         PyoIU5ZLbGzQyCoOeSUJqleOL5xMKr0/iKwJzqB+3lKorvTJFk2owbIQS7nPTn2ahsuu
         EENef+MVjqufiUzhAdhebe9p2S77nVA3ghYOsuEOqdum6GAcgRj1BVEKhQi9nL1Bu7Qv
         VEyxd9L8mBfhU4CGRAQietErjL+cws3rDceIVY2a6GOZ2tL+InTKSXzw4VHVo0wRSt2L
         YJ1JDMs0Z/PS+y1hgLNOVMRvK2YLJ5qbxqdAHVNW99FoQGZDxej+h644q5c/x+qTkzon
         B5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220687; x=1750825487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=p9CtoykWrxYj+jHMuweVQoDbLYZx0oHAewyZcwh7QNcaOQ6N3r2rCI7jV34KDIIuYo
         /olvxAPQ5rg8Z4TyWmyGXd3Wz9MvyDYDI8huQEEnbZ2HF5DBoc505WrdJqFwhnHY+IX/
         WDHepsFoj3LiMgXRrf8vrjOdDi8k4dbu5WWfUPeZqUKxr7u4MkQ0zVffUUOb5xntR6zy
         kSWbFdl23qRhfZ+3dAv1PZqWOTAscIfBtptBH5BpTqGmchmbXmIyu/Og2br1gE5v971i
         VH3SsjJ98zacrCMU4tlIM4MHQFOF/4sBTtHeoBX8xP14i6g8kuLY5A7A3MTXKDz9d2Fw
         mc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVuTun1ouHy1fJ23PFnb2fd5kpKcJG4Cg7EDidteg/1gDAnsl+pqzHAFLve7o0DB0oaqaiGFrFUQWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrt+t+Zp/PYAFW8QgEy9XKbG7ecnW3Qg5Ou6Pt4d1iZlg1G7E3
	KoJ4+5UoK8USzgKeBsVau42nV3p+C6z0XnCp+91paYe6hZ0Ja64zRikVtY+WlQ+DnsrAIiVy0pE
	66ynw743WZAjeJ1QVcLgtyA==
X-Google-Smtp-Source: AGHT+IEwWie/mYOzWzkPEMzzYrHW7iM/BMlWT3ZNJE+z50G+eg48u4nBoLAfK8Q5b1sDwPdBgQjlTM5R7I81KayS
X-Received: from pfbgt12.prod.google.com ([2002:a05:6a00:4e0c:b0:746:2524:8aab])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7492:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-22003686bacmr2081008637.6.1750220686708;
 Tue, 17 Jun 2025 21:24:46 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:22 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-14-jthoughton@google.com>
Subject: [PATCH v3 13/15] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Make sure KVM_MEM_USERFAULT can be toggled on and off for
KVM_MEM_GUEST_MEMFD memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index ba3fe8a53b33e..3f77abb257601 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -606,6 +606,35 @@ static void test_mmio_during_vectoring(void)
 
 	kvm_vm_free(vm);
 }
+
+static void test_private_memory_region_userfault(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+
+	pr_info("Testing toggling KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memory regions\n");
+
+	vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT,
+				   KVM_MEM_GUEST_MEMFD | KVM_MEM_USERFAULT,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
 #endif
 
 int main(int argc, char *argv[])
@@ -633,6 +662,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_private_memory_region_userfault();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.50.0.rc2.692.g299adb8693-goog

