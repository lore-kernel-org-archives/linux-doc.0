Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71C206F3D
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339670; cv=none; b=uPxXazLDuly1fstJrbOqic5mUOIb8naK5jF4k0bpKhHLgSr5256dUJ2NiMSdkeVEclMh3xXfswS9SVSSkRw8xZmBkJNsQkcHWwwQ+5j09JQtMuUqg3DPh6JKfcXEGLIETLmfr33hR74mmZ3jSeV+gVc+KWZo3TCNhg647kcxRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339670; c=relaxed/simple;
	bh=Jp+x9mfldwtvN108bvLRJrP/iKtS1pLZnKipgWETFWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TrVnW/PluWXk8NnmSfADB2433iJ6jpaOyA7AycyWD48utcDI2gZ6D7v3x7wFOJw39KAVO3HGGlzbCwHtczJq9zSQ3qMRvvfRlZkJzwqknKx3s08In5LFETm1V01cwefehTBGSTP6YrATL5SHh7Nt4XEFQvs0A2xCxpX+deY7R0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2dTWpJhX; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2dTWpJhX"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-5152909933bso41980e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339667; x=1733944467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X68RCfWU06ROg+bUYFUfNwQoohzZnJeYoYKE3JS2eGc=;
        b=2dTWpJhX5bZqbwMyiwT+liLjIJKxdgOnn/NKaVeJqbXjcKm5y9MazPJrgsKNnyxbJE
         Gp3Yd51izXIbhyiLjP3aoWsNcOkG1tRrFoh5xTVXMyy9HpY4JuHgnBSmMGGDMXd9OhL9
         Vj4N8/9d8tFTm4ysRSDVwTA8pCrFO4y8LaxmXU3fbsrxiuViEINkp/HXC7o04+KCHY4b
         YFru9Znvx2EouvIuU34OfycNOAiLRn/rCDgrEBliIu8caqk7mcHoAL8LyRmx1dSkVPTE
         xN9JFaIGrwC2TLUGhMyGWp7QOYi5cFk46CpFyd1L8HUUbLlpE+YWha/1i2fcVYCpFrYy
         FPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339667; x=1733944467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X68RCfWU06ROg+bUYFUfNwQoohzZnJeYoYKE3JS2eGc=;
        b=A8KkQZYADRmsRoJNj/tcpxrtftcRklf3zxy6I9dGN4oAd++dlFjqOZeeDz2QOdMtQv
         xG7Ag5pDGNbFhJniD63XYZJarJnJxjjXdc5jZiJKOTT8cgBxfl6LtclhCuwnklmqLz/V
         k0eUDmSPa3lEEqu6cvnGfF49wfEqjvqpeLwAo8cBVxKspQbcgC+3IVeoI6HrcfF6IDsp
         L3JUu1+5b5eLmrQBdQyiamSLPqln0C7yym2rWhb7cq0g4TMEX+is0xHwUmzEpLNK2aCt
         +Kkk+v1U3gpi8NCXN184jOSw6phwXw3UVtZyLfYqWQdNHMPxDrKCtP/7aAnJ0zMPYIm7
         RGFg==
X-Forwarded-Encrypted: i=1; AJvYcCXqlNmbCU0uMWPClj1zJBAAGRGWURqpaeulfUEWdgQ4TqUgHwTcHfDQXD9uB+ZiKnJPefIi8kH/IrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhveW2/Nf/RNoVOC7fQLmTE4Xomgj7P9T+ZAlbLko+hISClT9W
	CvJxabtCbsrDa+fU6QThcToCCxzid87sQ3AIr0xXSb3g5+Qk9rbhCDsLmPb0oymxwZDs+DUD5Wi
	wgNT/nZo9DAwDtKFN1g==
X-Google-Smtp-Source: AGHT+IGSL6/LfQGJ9Uj3DkWwK1IsrYPhpONzXFegfmhrDCtj+kw22erCa4lpakX9RjG5PxsHges9rOrFeGcBxOQ3
X-Received: from vkbr6.prod.google.com ([2002:a05:6122:6606:b0:515:3ac1:ec42])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:a25:b0:515:5008:118d with SMTP id 71dfb90a1353d-515bf2a393bmr10094302e0c.2.1733339666972;
 Wed, 04 Dec 2024 11:14:26 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:47 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-13-jthoughton@google.com>
Subject: [PATCH v1 12/13] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Make sure KVM_MEM_USERFAULT can be toggled on and off for
KVM_MEM_GUEST_MEMFD memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index d233cdfb0241..57b7032d7cc3 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -556,6 +556,35 @@ static void test_add_overlapping_private_memory_regions(void)
 	close(memfd);
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
@@ -582,6 +611,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_private_memory_region_userfault();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.47.0.338.g60cca15819-goog

