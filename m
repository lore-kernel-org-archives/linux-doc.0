Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0E15EFB7
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654969; cv=none; b=lnyA7Wg9BDb34WOBLT6FYQmIKD1zbSY0S7qZ2oGHWISKuGRH1rFh87YBHnavLtylpA1KQYRb8Il7DHISJMwNNyHUjZQfy1c+SVF8G/tBE/Xexe9hUuccZqviRiriQXSEVNljYe/0XIHLv3Zo6BXQY13FiLU5M8KAE2CZ9k/d6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654969; c=relaxed/simple;
	bh=0X56a4gN8b7VQgThnVkXYUH34LPfOMnmnpB6+EHKoT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cfPZve13huhLDTdotza5cuGYToLtwYj2qEVevEvOVKYzzof5Vw26nUEa5E4AN+uPKSKThEkeDQNhy36h8mQm++vvhY5DT4ihA+R2CxUuAelYZzb4sjI4JsRTjAaDmKCaKUR03M/5eiAFuDR6Lp+iRO+JVudCr5oUu0nsZ0D4X/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Z2/FJYK; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Z2/FJYK"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-8103e4731c5so84014241.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654965; x=1721259765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TURU+uj4JjtASnposo8ch9F78eTbKidxkEMdeXOCkww=;
        b=4Z2/FJYKjWb84XWgA4jz6adOCqXSO4ooYNzTgDHYNBGqj0E9z42IvXZnNdXQKNxBum
         jcKCUM3z8KOnd5wJ6ui3CbRqBDUsgUJxziiXiPB/zifpnk/VQjQhxMh/y+PuaVr/F/Us
         lRWbcVWEEFZ5dWzasCENbA/TX3DR5FBP0gU8C45OMuslryx/Y8c5cxxKYXgBPCKAo5ck
         m8L3XgxLOYRXHGtPZL4CiSQoC17DUn0V2xmj/OoEohSpqapaQxzmChQxiaRfXAlWxgyV
         GueGUp9AeTIfH0uBlAKKZtpU6yGEuBpMXuBSxBJoZwbJl4wnR7mfGa2Wa03Rh3CptsZJ
         I4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654965; x=1721259765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TURU+uj4JjtASnposo8ch9F78eTbKidxkEMdeXOCkww=;
        b=RWvMckSYJhYYx0sMTtIFuUWxdI6t4DqMk3ObbU8P8jtJ7RemRU0/HLowKT3pPWizVh
         F9czWX3klT/rxWJzi9erhLrQ33ds/ifBGIwTF3dSauj+KZjeoIE3N0C2MupR9efGVl8+
         CpznO+MjEJ9hj55sUNXoz74vNi4B+bKSaTLdhLywbllsYYgbUzI2hl3vYxyorsbkR5X7
         9s/ehh4zEUE6XT30ACy9l+q/VOZP72Ng3PTmfOAaq8x2mutySnzuHyJJj83z1SXFvc/J
         /lVbHmvOgLgj0rNIUEtQoAVsh06aLEAYr+K3scTD97fYis0FStfvqy9P0Uuw7MXFCfN7
         hXOg==
X-Forwarded-Encrypted: i=1; AJvYcCVOIWjjOOL5bACS5oNm7KG8AJDTHcDYFY9zdNGYe2soCcVtfprZzBFipPneRs70d9zVYvUBbpCcPSIIE3UIK7dvWulxtAp9Orc+
X-Gm-Message-State: AOJu0Yxdkh5iloNNmzeIXpuonLF3Zub7xv0mFdmIzFgFn30CaFeP0LSW
	xqNZDt87gd0NLuVkmH3QF3F4iAMxw6dk6Qnj1GSCVm6qiRuOp/CJx+J2v2+4Bi7gGSbmG7YxCIA
	OkYMlrYM36pVTHorbQA==
X-Google-Smtp-Source: AGHT+IHwjQCn8pz3/iqiomOrjrLQUXcW8j3Cmfdd9IBi0Npw4AjyC0JLSC59kn9LukO94PmnEj6ZVNwxW2iE6Npb
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6102:2929:b0:48f:137a:78b2 with
 SMTP id ada2fe7eead31-490321d3690mr113577137.5.1720654965123; Wed, 10 Jul
 2024 16:42:45 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:11 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-8-jthoughton@google.com>
Subject: [RFC PATCH 07/18] KVM: Provide attributes to kvm_arch_pre_set_memory_attributes
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

This is needed so that architectures can do the right thing (including
at least unmapping newly userfault-enabled gfns) when KVM Userfault is
enabled for a particular range.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 840e02c75fe3..77eb9f0de02d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2514,6 +2514,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	struct kvm_mmu_notifier_range pre_set_range = {
 		.start = start,
 		.end = end,
+		.arg.attributes = attributes,
 		.handler = kvm_pre_set_memory_attributes,
 		.on_lock = kvm_mmu_invalidate_begin,
 		.flush_on_ret = true,
-- 
2.45.2.993.g49e7a77208-goog

