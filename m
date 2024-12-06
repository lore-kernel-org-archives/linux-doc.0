Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4E1F9EC6
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 22:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525223; cv=none; b=KgTj6cuu0ssnmEzVCBigb22q153h9pCeJ6JKITTHt2x3PnSGPUF9GljIwdenSp6g4tHRWXTBVAOd9cBszrnEb+BrtjtfWNSjlBRzxuNKgWCDaFQfzZ2tiwbyZXQHg82aKr/BuD787iTNks0TxnSy4Q5iCkrhGpewouFlifY8v+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525223; c=relaxed/simple;
	bh=iITAE1Ks58yzjB7pv45kbC7F7m3AmF+RtaX7q902Uf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kd5Dtia2g7hIn+5sz1tjX3SC+Wz7l22Q0mBaxFSfYJjfv9nwk0+bURXQD4R9PBWY56weuEYpD3IryytNBxlvW6lrxMtGXoEghPr53qTx+YVr1wT41KhmwXnQCvc1wxf70tJ5ZX9wIY0ZiwdYXXQraa+yMHFOFRz3tGSERps05Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UeZWq2x8; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UeZWq2x8"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-515e32f8accso562255e0c.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733525219; x=1734130019; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=UeZWq2x8T1e3RuJxryf1R9hW2RwLmEkMrt3ufE+U20FGxTLb8Ugy4tn9n4jVUpbpQ5
         5PeMMpUTNjgPZx4RIqy7Hw6qiw0R2b3pctMJiogjpYF+D+o5kaysTfRx5aBoagIDo7b+
         qVXEB7Q6xcBigTmB5vq8dtVX+seSb3ZIIr47FPPyNUu4NJr4vjyZRyCveEC4pX+VNTYz
         DyeO/O3yVBq7QGzeMUMBf6K7UYvYhf6s8EKqSvohOWYVNFDhUcB0XHN+6BcIg4kjN2F4
         anEWfTIlDraCHiRaJ3q20SWA9KkfjktCuHhgUeUmOt4RvYXNNomgk3CofeJOc0A5DWsK
         iw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733525219; x=1734130019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=GRlUISXlCHgFqyW/jiq4RdA86QAYues6XRh72oHDTA4ba/clxDS3lgUwt+7dAubtkC
         69MWELWR4pJhft4fAicP2XZK7/rLYY1A+CqLcA+Cyy8HZlnWCuIoB7EonzDEfwlvbWeX
         ejFqo6o6PMMySd8PlV0/E/0NYRBVPdCzf5gnTVYt2ybLrwHaJfQZDadfSt3puH0NkEt/
         EZlYDbb4wJfmczQ2h3vencca4Rq6epFoT9Mqi8NmTW+oG4tsCfJu/FpWdfSVmC1YODuJ
         PrxIdcxeplybYsKVxLpGDXHK3TJGDSYy78FhIj2bYrt9LxFVCbQ50ts6s8TlrEL1D13J
         AdTg==
X-Forwarded-Encrypted: i=1; AJvYcCUOePphcjhFZnW2TUfNVmL9FFwfb+U+dzcARn2xHYdCjxFvXI4jHZlTeZaxc0P0ioO3Vcr69T51C/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwfPPQ+WaieLZBL6W241cqdDNNinC9JDSxm9fqtG+tKKfHA5x
	C9RFAc69c3Gfu6wLNCpEU1+MPpWIs/O+t/dmd+4l4zfhi7ra+XkpaNfuMnxfHpPkCtSj5o+UBgw
	RMYTk7OMUNOSi2e5hiA==
X-Google-Smtp-Source: AGHT+IFWYRH0ZDfG1SCEobsGl/BiWTfQRI31egCmHBP1UIFLmQh8g16wMoeT9PBzM1Kkhhw9DuLZq6uIHa5tY1W0
X-Received: from vkbes1.prod.google.com ([2002:a05:6122:1b81:b0:50d:806e:dfd0])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:1da1:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-515fcae70a3mr5700023e0c.9.1733525219486;
 Fri, 06 Dec 2024 14:46:59 -0800 (PST)
Date: Fri,  6 Dec 2024 22:46:58 +0000
In-Reply-To: <202412052133.pTg3UAQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202412052133.pTg3UAQm-lkp@intel.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206224658.2833655-1-jthoughton@google.com>
Subject: Re: [PATCH v1 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org, 
	oe-kbuild-all@lists.linux.dev, oliver.upton@linux.dev, pbonzini@redhat.com, 
	peterx@redhat.com, pgonda@google.com, seanjc@google.com, wei.w.wang@intel.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

>    arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_set_memory_region':
> >> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2049:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     2049 |                 new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
>          |                                         ^

I realize that, not only have I done this cast slightly wrong, I'm
missing a few checks on userfault_bitmap that I should have. Applying
this diff, or at least something like it, to fix it:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b552cdef2850..30f09141df64 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1977,6 +1977,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok((void __user *)(unsigned long)mem->userfault_bitmap,
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2053,7 +2059,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			goto out;
 	}
 	if (mem->flags & KVM_MEM_USERFAULT)
-		new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
+		new->userfault_bitmap =
+		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
