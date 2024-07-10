Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C473E16D32D
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654978; cv=none; b=TkvAMoUfQyV/WUzKKfWkFt+6MrBPt+kSvP/5YT4buqHis5e1jwtn8VWoy49UgQ5dzgsqUodbS96mHmWjPshX0LNvHKL6d3vQ1iuLLRUaGP+poBbXRmViK0sBYHr8ZlzxpP17LjdBHu0Qp3e3HlvXvzd8ktGBRVTcFmiPfXs7WQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654978; c=relaxed/simple;
	bh=iHtMvGL4vF0q+lVnlkIHLSBIYFMj+gNaWi3Gs2hOk8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mT+66wdrohkG1sLYjXiM5YNenJPeyAihKxmmPAvs6ymxaq5FShb4fZZixS2VfnaNwzgTIas4GDbt8DMDJyBOnTKSD05ab2mUGgoJVFEPRVGrGTxO5U0iwjj6OQaXHMolBf999Z1uVGsHOUSgIa+amVaYE9X84qYtnkkIm+96TZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SiNK7uLO; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SiNK7uLO"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e03a59172dbso416107276.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654975; x=1721259775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2NbmmZjpjJMl8d0fx4CDZHX67FcpWijiAzz4EJchKg=;
        b=SiNK7uLOX8sumtAb7yl27cqs0OHIVqIv1p2Id4nqTJufixjPgISkGXCE4yOeXipwJU
         RsM0jTf1Turqukq2i1ej5FjE6ot7dx4aEql2yJdiHShzNbmcO9kwlCTpD/AmRj4FX2u9
         hpsdi86UjiwTTU0lNHJwfqcoDCCr34iupDpGkn7BV+0lG1Wm5ii5YYe2fJ8rzDT1yZgu
         /P0TEKgctg0YDDqIP1C79/0pUKC6FJCr7c0ei/mvVnLXo5xj2XlJ/fWjbkvRjGsTkPEe
         G+Mu6jI3/SUEf0uBAxKpDF2GvWHTv5ARSJhPOPNSL7qoBBjafrDgQTsUm6yYizG6z3h1
         VTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654975; x=1721259775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2NbmmZjpjJMl8d0fx4CDZHX67FcpWijiAzz4EJchKg=;
        b=EgnSvmZBKI1k/V9xRi3lMMNeHV7Z+13tMT2zBcbWilpnEJZ6hUOwqg1jKSfpxJ2ZGC
         NnKcap5b6RcCjsmPFZU9C3sKtcGHnY6fkxpJb5Tzf4O69b9nBGV4C0tGcK7GZ9Cqtzpz
         5Tql6VTzcW+RDtxpnqrHYj3pB3BrgkWghrxciTkaU9e79D1WlUHdO7ZPtqJUaOQAPVMa
         ZOg4/22ElKBSodL0Z1GQTU5u03oDkRKjsJI/6kWqeTjRrO9YlVIuaA1Qz+un+kAPAY6e
         uSLER6M/+tZD0bvvNuYNQNHpGwfYBSV2VIs/x1Qa+MN0VyFZprCPO5xzWDnR9CPGpw27
         7bhg==
X-Forwarded-Encrypted: i=1; AJvYcCUhd8Rrio8q0CydWHJAPKrnhEsp4kXMaVfQY0hJA1loS3BC5u+xk3rD6Dpr8JNa7b/NjXH9/2rM5F2ldwRRUWcCHqBk5tyhSq1T
X-Gm-Message-State: AOJu0YzG4ViSYioy8g+m7mszcCe5zThrxKQaCYsPp+V5JhzhFdIDDdlY
	VJ5fVBmwctn5248X7T5kOvf7KBwuSjYN0xV8tWsorI7pi6y88DRU/eLysH17XT9AZ1Y4SKMa88p
	rBYqV+x1F5QkewhnrEw==
X-Google-Smtp-Source: AGHT+IHxJ11Jc4Pg7WkmO3SlYHVbY6IW+Wqfxro8+OBFjX0tT/erDtqX8VfrApEznbWBw0W1kCfLjttZO6MW2F1P
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:2604:b0:dfa:8ed1:8f1b with
 SMTP id 3f1490d57ef6-e041b039d25mr256249276.1.1720654975664; Wed, 10 Jul 2024
 16:42:55 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:22 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-19-jthoughton@google.com>
Subject: [RFC PATCH 18/18] KVM: selftests: Remove restriction in vm_set_memory_attributes
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Peter Xu <peterx@redhat.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Allow the test to run with a new attribute (USERFAULT). The flows could
very well need changing, but we can at least demonstrate functionality
without further changes.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 63c2aaae51f3..12876268780c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -384,13 +384,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
 		.flags = 0,
 	};
 
-	/*
-	 * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
-	 * need significant enhancements to support multiple attributes.
-	 */
-	TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
-		    "Update me to support multiple attributes!");
-
 	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
 }
 
-- 
2.45.2.993.g49e7a77208-goog

