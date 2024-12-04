Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9ED202C41
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339665; cv=none; b=RRL4iNLGwZJol2syhKgaYcdTd9i/osEmqwrKQWd7zdaCojhzwbWTpLSHrSLV2TAQyEIzWH++MEPFRD0xNU+4oWogzGFIIGRuQpxrBMHK+fZ1uXFr63UKhDxRkglG7tIKqUPmCwxIz+PJ4QheWrX7Ba/L6HWYYRAVbQVrAtT3gL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339665; c=relaxed/simple;
	bh=g0rkDGLpu4v+ug31ibm4fJibfbopHH42jmhVi9EOmqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RK6U51zbqjNB0qkTovE6tNJwG3tdBzlA4Wy7Y+k/ZPP9Ly1WAIIn8Kd4q6AI1U3IL/dS9eH7RMl5Ne/T6w2o1Muap9AiNBHAzOHX9MVT+dUplnR5vDQcOgwhNgH6ZPXPcha1q7VFn5uTq0oKNLKMEWyO2Vyq3KPaLWulUpzKtfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Va4w2hA+; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Va4w2hA+"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-5f1ee87f67aso136717eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339663; x=1733944463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFzCtU30qR2oi/Is6fdl592GY3fZRLXfeluJtZi8G84=;
        b=Va4w2hA+uWJh+kB1R8xnR1i0iaMi6BjrdFaDRcbvZyPJGCmNwdYyf7bTwTHdYq0cFi
         j35iNpYKEftFzvCpL8twNGARFLc8Sm/SZ5SiFJoH6207g4BvSdcGqhpxvk6J/qWfTScn
         B5TSb/vi3sPD7axxPeHmH2DCtDXQ33kr0XyJOWnnYn0oN2WNt9PlxBDmH0ofuEVWEL5o
         a2Ji22A9CzQjX3ajlFgf37s0zqJCQo6nQdapFEFMYwdtJNUzkNH3waahXw5H6OPOK//q
         Z80MAY/imeKmrkb7frsWZtW1b4cXuC1/J6AAyOtkaHjBS1nfdVeIW1IWQKcfLrxvIPnp
         AviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339663; x=1733944463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFzCtU30qR2oi/Is6fdl592GY3fZRLXfeluJtZi8G84=;
        b=Bqn75vGeOaLkf7rUYWjizZmUzm7kLeyEVgEzKSRIrDKjDPwH5nW3XLfvw1nq7CFpMf
         COukmuXfbwoD2mlgnxCNN5M2VLP9bQ+eWAF7+QDuot1sl2UceaaOM5LffQWo8GKThbrG
         lhlWPQqeSvQeFjT2sFF9Olc6Z3j4qVX37TzM4dSJvP7Zc8eXQa4geyoUP8rurajn1Sua
         1471AwOwFXYtDXCfahGSjHdupx+htHnrq3E+gXUPCUGQI/elzbgfRyI+FgtG4Gv0bUMo
         3UyvO/VM8Ire91MwNCnQYQW0m2Tp1krxj/tZA0QyA2JXpvTDwtO0ehnSMxkqyVMB/GvR
         3xZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi8Rp38v0oc2YBbUJn0dzQII6K7t/SwbQ/xWPuBuU78V54SGNH+aVDJTfpcpoJ1JytjVyiK/Z40Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/He6VxpLf+0vviiOtOn+x81pSLtlGi/tQKxf95aMfhKiNi3L
	MpVepkZiratjm6k1OGxFRjQGyY4056IB6Q5PoU7VXWDp37tqmZtcfMy4hlszG7VGlOm+dkHJnCE
	thrWG7i/DF58mCevYyg==
X-Google-Smtp-Source: AGHT+IE0Bvu2wb5sZ62wPHnkPebE9DLvFVJFuHpqNaMFqI9+9IIU97LvrniH728q/X5uxBPvfLsjs32/EpieLb++
X-Received: from uad11.prod.google.com ([2002:a05:6130:800b:b0:855:e8c8:6d6c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6218:2812:b0:1bc:45bc:81f0 with SMTP id e5c5f4694b2df-1caeaab608amr694161055d.11.1733339663073;
 Wed, 04 Dec 2024 11:14:23 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:43 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-9-jthoughton@google.com>
Subject: [PATCH v1 08/13] KVM: selftests: Fix prefault_mem logic
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

The previous logic didn't handle the case where memory was partitioned
AND we were using a single userfaultfd. It would only prefault the first
vCPU's memory and not the rest.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 0202b78f8680..315f5c9037b4 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -172,11 +172,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	memset(guest_data_prototype, 0xAB, demand_paging_size);
 
 	if (p->uffd_mode == UFFDIO_REGISTER_MODE_MINOR) {
-		num_uffds = p->single_uffd ? 1 : nr_vcpus;
-		for (i = 0; i < num_uffds; i++) {
+		for (i = 0; i < nr_vcpus; i++) {
 			vcpu_args = &memstress_args.vcpu_args[i];
 			prefault_mem(addr_gpa2alias(vm, vcpu_args->gpa),
 				     vcpu_args->pages * memstress_args.guest_page_size);
+			if (!p->partition_vcpu_memory_access)
+				/* We prefaulted everything */
+				break;
 		}
 	}
 
-- 
2.47.0.338.g60cca15819-goog

