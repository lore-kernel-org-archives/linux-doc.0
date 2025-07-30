Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301A221540
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 21:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753909884; cv=none; b=L7Uq7GNXZ5m02lF8Om6bauV6I+w4b0CoTHuATkG/+JXBNs2LUw++2p8q6k+tGySe3KQR4DD0IOyzWmJhNXPLYveDIVp2m7CJpCfAyS5yZhg1SpoTnThfrARVMC/JziZ3jCZVoKVZLQwvRNywqbMCOLA4AYWodz6QFyMgy6C5/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753909884; c=relaxed/simple;
	bh=cVmFzsj3OpZTUi6FUzCWejRWJRm0o5ncvOdXgEoC+OE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZxcBvfFKvcAcj9y4hCq08ObgjKPD8NKDbzjfVKEWH+IZ7SFKx+M+YVYsCjry4D4qpAmCnXHb4CK57yAMFVLXy7l+UPbGISHI6iWwLPTegPBc2cESbPvermFNJIOgK8Pq+GGoM2mIr0KzXIBrFD2VPjg+pP3RN4lO03BJC2s4iDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v2ehqj2B; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v2ehqj2B"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74ea7007866so212468b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753909882; x=1754514682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcr0HAZVJL/wPM68//kB0QFOkcy4cqNgVvPP1uhkVrY=;
        b=v2ehqj2B8kahSbPAjtrhq5Gx5GsOrGx4NGAKgBnFM3FtBEeVNMzmrReJ1SZiUBwo4b
         BjzMoWUFhUCet1vUOyls2ea5sfZP2KAjHxx9jsd6bdsEbFbtCxNTcvCoH72E47N6lO1s
         kpUyDc9TvCit4qnrUg7hY2ApCIoYSII+OJUx/W52Y3wlKKTAJGgLSH7ovOjNWcjKIjU7
         rrJrxI4BheB3UzExcRZlYFCrzrNHyYlsaKSMtK/mupgD7Txg27UTsd0wbb1yikRd0F1K
         lHTPkXuey0ZNeqFquA1YjUmyJTEQLiSfmR0gW0cvUUNWVHQdSmPAYymdZYWbxdk0MP8W
         E+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909882; x=1754514682;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zcr0HAZVJL/wPM68//kB0QFOkcy4cqNgVvPP1uhkVrY=;
        b=Uddf44jUNpQQja8/vJDqaincg3d9OLEyrk6FH0QJ0ozhBy51907tpZDqL4H52QJrf2
         hcskfAwodR4jockY09C+VOtm5ul7uCWSp39MpnjSCR9jZupS2oUiGg8VwN1cXQ3aFgKR
         2XJH0gj1JZ+2Ko1ZKfF6QnSCe+TdxZ8XegIFR3lktA+U6unu69bbg/8QyPPtfP4jAw5t
         7BiR83hV/NdXyWkW0Vh6uR6TDgbmwXw1N1vv9c66XhwWMRY7nU4R4v7AYIWTWJhRa7VR
         TGrFG0mqj0rOcailDes+rqMMivrK0uFV2PNyztXxzYAoZ8+D6VZd6Xko1jTrH3smkSqs
         7CZw==
X-Forwarded-Encrypted: i=1; AJvYcCUyDqq6t7v6+03EGs7/KxHFHZd47/ESPY7WuPsNbrACYFwE31b54IMf179/yjBt7dRfbR0XD9Yxq04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQl7Mz1QPx2ciRMkMNwEySpHEoa1SJcGMZomP4gxnNeixs/q26
	X79mTJm42VqJJyshLROVLmRKHqy8xS1F3MPaRKjGgTeD2+T4RmSHEZct1fDrxYo2SJ7aNoHs+Ip
	CVZOTdXyQkWVX3GKYosiqQg==
X-Google-Smtp-Source: AGHT+IH81SELHZh+GPX7YKucdrOrQjsD2qC5Y2tfTvaMHB5OVH1Y4cxqU+ojrj5t1POmR4E8onsMP+EV8Hr7rDZV
X-Received: from pgmb10.prod.google.com ([2002:a63:1b4a:0:b0:b3b:d2a0:df40])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:12d3:b0:234:216b:cf98 with SMTP id adf61e73a8af0-23dc0e8609fmr7392654637.35.1753909881916;
 Wed, 30 Jul 2025 14:11:21 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:11:18 +0000
In-Reply-To: <20250618042424.330664-6-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-6-jthoughton@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250730211120.4163536-1-jthoughton@google.com>
Subject: Re: [PATCH v3 05/15] KVM: x86: Add support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: jthoughton@google.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	kalyazin@amazon.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	pbonzini@redhat.com, peterx@redhat.com, pgonda@google.com, seanjc@google.com, 
	wei.w.wang@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:24=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> Only a few changes are needed to support KVM userfault exits on x86:
>
> 1. Adjust kvm_mmu_hugepage_adjust() to force pages to be mapped at 4K
> =C2=A0 =C2=A0while KVM_MEM_USERFAULT is enabled.
> 2. Return -EFAULT when kvm_do_userfault() when it reports that the page
> =C2=A0 =C2=A0is userfault. (Upon failure to read from the bitmap,
> =C2=A0 =C2=A0kvm_do_userfault() will return true without setting up a mem=
ory fault
> =C2=A0 =C2=A0exit, so we'll return a bare -EFAULT).
>
> For hugepage recovery, the behavior when disabling KVM_MEM_USERFAULT
> should match the behavior when disabling KVM_MEM_LOG_DIRTY_PAGES; make
> changes to kvm_mmu_slot_apply_flags() to recover hugepages when
> KVM_MEM_USERFAULT is disabled.
>
> Signed-off-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

This patch fails to remove the WARN in recover_huge_pages_range(). The
diff below will be applied to the next version of this patch, whenever it
comes.

This WARN can be hit by enabling KVM_MEM_LOG_DIRTY_PAGES and
KVM_MEM_USERFAULT, then disabling KVM_MEM_USERFAULT.

I've been having offline discussions with Sean about this series; I'm
waiting for him to rework the KVM_GENERIC_PAGE_FAULT bits. I'll dedicate
some more time to the QEMU side of things too.

Thanks.

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1f..2d83ddb233a9a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1779,7 +1779,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
 	u64 huge_spte;
 	int r;
=20
-	if (WARN_ON_ONCE(kvm_slot_dirty_track_enabled(slot)))
+	if (kvm_slot_dirty_track_enabled(slot))
 		return;
=20
 	rcu_read_lock();
