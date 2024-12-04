Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BC1C3BFF
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339659; cv=none; b=Z6jDCsJ7IzQeN19PJYqax0ghgu2X3N79K70HmzzsRn0sarugN1DY1ub4Y912wabk054AxGMjxipek/93NTl17Rh7ARI7x74kJ+7IjTBvg89poMQlK58VcmpOQpMvDByQK7gyZ3Objn6gq+K2Gc99uV8cE7ibLRvE0nDkoRq851A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339659; c=relaxed/simple;
	bh=Pe5YIDGyVsJn3IDNSsuwg/PtWitlNtJM3kxtfZFGD8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NoYZPdSmmWEPE2cCOhs961hVeHS3mlNVDcwnkKN8F+MYfaeEKZE9Ca9+Ae4j7CUvZu7xmIQKn3Ap9VYFTGRk38I4Y2fN5r352N1TQQNJUwyzP039f3+RmtDwfqJeT7NA+H9M5YLnsoiWoGzrnV/248O/NkfFzzFz1KIDTEykHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZbQ8zsy; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZbQ8zsy"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-5f1f7c9ad4cso128585eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339657; x=1733944457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifppD8XOVrlj0Y18bnChdCi7ngFpMAIfTyMrOgFm5Gc=;
        b=LZbQ8zsySnHzNTQwM+VYSwJ6n8soxGXUC9vCnCQUk5lKbQNVoE3sTTxnOM2THOP1VL
         O0WHxpLOsLUFz8VujjNK9tNV13Z/b+2mW9BOkt19LNy/bJaylC9on3CsLy568FKjERQL
         XnwZocCV9Ry4o2oc2obKLOVMp0nlxZT7gPB0oKHMZGhafgBMmVt7Zlp8sQGNGPNd7gmv
         ACjVkigeuxs1deI3ZX2UN7C6xIN+tv9saq8ykSBZCzsb3qh7lm3hwr1yppmUU+dEVKbm
         aLbxh1kDQ72CNQPEQRyEJQtZfbPvqZAr51sidUOZ9MZ8mErDeiz8/kceHYkwvMF6u2BN
         kgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339657; x=1733944457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifppD8XOVrlj0Y18bnChdCi7ngFpMAIfTyMrOgFm5Gc=;
        b=vGbS+NquZHHR7zfNXLKbD1xSP04T0i3lXY7V9DAz68LINiHylgF+ls1+30CrqVYr4W
         Wupqc/S6kRUM9HjwDrAxG9NNKcpNNGTBMUjiBOevArfALB7wSx41gPgoF1vzQdie/fV1
         OUfbIil3IGxWr8tNgmd5i4Muv9fmtijH689hdBOWoAheB0P6vfDMdhtCUKgVzGEnz4P5
         lT5OwI5xAv0qaCjbO7u4S2BbxRijB9GDFcKJ2LNY8/arUXfbGB3AX5jo7qlZ3/2snpbp
         uqxXus6Dk/NaeCRevDDlgeQJnnb9Lbtp12ANZqkByRXXixvFIACtRyB6TJTzNlcNXjY0
         OVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI4YFEcK82UGBRYWTET12BHbrBTgZEXF2QguljxzGmM9ay3w57guiYL8yC4okK5M/bbN04GJ5dHw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wPLIHynsjWKuHkWNegAEDiJVWvzW9H2OvHht6hkhUroLEMnQ
	Hi8UAh4jIvlSM46tbg4BIkhi8g8IlmECxUGjHgDGZma3nnfk/Mu/t8MYd1srdlJ9pUyf6vq2iHw
	kmmObv+jKdEmQjiP9aw==
X-Google-Smtp-Source: AGHT+IGqVM1yUneXF0DiEvK0H0RPVa3NLvh9Vv5/V4X8bp9PJGOl+SW8n3O2HwvzvAHA/QzfxuBonL+2sIMiSocO
X-Received: from uaf26.prod.google.com ([2002:a05:6130:6d1a:b0:850:15b2:33d7])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6359:230b:b0:1c3:94:8ffa with SMTP id e5c5f4694b2df-1caeabc2133mr709229655d.22.1733339656984;
 Wed, 04 Dec 2024 11:14:16 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:37 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-3-jthoughton@google.com>
Subject: [PATCH v1 02/13] KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
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

This flag is used for vCPU memory faults caused by KVM Userfault; i.e.,
the bit in `userfault_bitmap` corresponding to the faulting gfn was set.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 94be7e8b46a4..641a2e580441 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -444,6 +444,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.47.0.338.g60cca15819-goog

