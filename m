Received: from mail-vs1-f74.google.com (mail-vs1-f74.google.com [209.85.217.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40214206F1E
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339669; cv=none; b=RIO0jAFC2zHaJr5TrNdacfrrANbXqQtt6gPqu7ngXYNijC1RPK2NxfcpVP8mmCP2D398RsBuM1zO3mSO2IoFs432pz7T3RVvejUN9bzrf7mJ6hQ2kv8yMszW9Awt6BlrYlOAVMnrp7FOWcgHxqMaOuVWfRA1dvFEcfHpADpb3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339669; c=relaxed/simple;
	bh=DB3D34LMo76wSyQOQTjLpchEbwFt3tbBmtNUE1453so=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cI9ZUD2ZHusiuEVrPzOMhmnXPUSZi1aLgSXrGrC0DxaIMYVjIx0oY5VzqCbdkcUpR4KhneuDwbbhRGA+MWbGZZEhDynlTbvKE4utFCF23dioU66psUQcOLUFGPrZmMszsEjnkiTLBSAPMVS4OJIBYSy3LiXFj2aP7EDb5apsxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijNsiXfs; arc=none smtp.client-ip=209.85.217.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijNsiXfs"
Received: by mail-vs1-f74.google.com with SMTP id ada2fe7eead31-4afa80fda63so10658137.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339666; x=1733944466; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5zlVcABwgcAqDrk/hYCqATZ71WnZcE4eWZqt1Al9mM=;
        b=ijNsiXfsLfCRNzBTKUenbeOgOV2tUuKXfdYd1oOBhqHioD0Qnawgu04ON6s4hsMikI
         T1sRcnx8zWtIS/tWSRdENTKv6znXli6x5xjq0w9r6EfUdkXppkPTcWv+2+MDAjOddhv2
         +kNCLzT0JVklDYJ8WDM8Me75cm0q3FNxkntVQ2HHuMkIjjZmUCpWxuyS3XCyq2xCRoef
         i15paCYU1Rc3AeZiOGDHDel0+3WhfxFT55NFpymO6wEtDYKN/pjfppVvw7Jme8PgWz6X
         BOEv+KWCre4XIIBInE2e/KWSADD4pnOsnv+1/qFP7tPenYZjLcPoPzM5yHVYx2tjTih/
         SiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339666; x=1733944466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5zlVcABwgcAqDrk/hYCqATZ71WnZcE4eWZqt1Al9mM=;
        b=F+IOeEvlXMFwQ7S/VC1QHEvP1K++XGgHfLKB/hXwTtbFBLx5BMmJp7K+2uDOyUQBZm
         qqJQRXS/KSVhJqrMsxpMnj0K3bBO/nPGtGP6kxq55SN1URqmljSjJxcwadrqQ/SujnJ8
         0hUn3uxYWV/hbmRDRvbghfOT9uFCq2RErzK9B3UJu7sDNvjETyXKYAK+whu4ubMlobJd
         QnOu8htVAZawuzGaj+la0qFrOwZGgh/X3Goz+aDZ+Nz8SzR0s6jjE722QKHNm+ahoXft
         ic7EL0iGJVdB8HqCVCVOfWQzKXReue7k6f+SDRJ3KYFJtz2xK7KZa1FDlbfhSPlENI5l
         8sGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdIg8w2Z11bqicG0gEhh3Sk7/CJd5JvbHK0XLhTApmm8K4r7YkCGSRfkalXK6VvZRU1qLoS3qnCs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YytqoFuKkRdOJkP4Mc9eAwcM2kkX3J/kU0Lb8Q0SmLgUDKnOjUJ
	Yz3jNw7t3jpnszui+IgLLgx73KwIxwJl9V/9YN5xfxcVZYrNhEgiTR2e0hAcr5U922ig7Fo5QKW
	nB4a27w1uD+0MKOqqGQ==
X-Google-Smtp-Source: AGHT+IF2FEM1OG8guhI8P1BVhXWIFhfslfAcmBKz5oOAxjNRJSTj9A5XfYD8J6BgPkOCk8O5eB0FX2IaOdHwSH+I
X-Received: from vsvj20.prod.google.com ([2002:a05:6102:3e14:b0:4af:5a9b:90bd])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3ed0:b0:4a3:ab95:9637 with SMTP id ada2fe7eead31-4af97243dc7mr11657456137.12.1733339666111;
 Wed, 04 Dec 2024 11:14:26 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:46 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-12-jthoughton@google.com>
Subject: [PATCH v1 11/13] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
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

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index a8267628e9ed..d233cdfb0241 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -364,6 +364,9 @@ static void test_invalid_memory_region_flags(void)
 	if (kvm_check_cap(KVM_CAP_MEMORY_ATTRIBUTES) & KVM_MEMORY_ATTRIBUTE_PRIVATE)
 		supported_flags |= KVM_MEM_GUEST_MEMFD;
 
+	if (kvm_check_cap(KVM_CAP_USERFAULT))
+		supported_flags |= KVM_MEM_USERFAULT;
+
 	for (i = 0; i < 32; i++) {
 		if ((supported_flags & BIT(i)) && !(v2_only_flags & BIT(i)))
 			continue;
-- 
2.47.0.338.g60cca15819-goog

