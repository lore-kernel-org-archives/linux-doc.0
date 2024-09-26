Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770517DFE2
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314523; cv=none; b=EcS19x2davVM/cIcZ1oFsYEspR3W3ZqabKAdjsDHXHmEzIOWWH2l7kxqyP0VucWQ86DOjSffbhciTYPZQgvfZOypJ5VSapVu6TuepHF2G7paGFYZC5Zp9l1qLYYNmfT4x7PUy9i7GdpDRW8UgFd6j2dXIYfsUlj3ITfDblYiSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314523; c=relaxed/simple;
	bh=MSP16v22spRDZgdygkuPyo99YM6MsaYwZUFeeUwYgi0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=alGgkjuovq/EZhG+RqwtQ6MlKxbD/qUtemZmcZuEejdYcO13I2+plJ9LW38zMejBMoE30wMUgfuhgUAXe15+JAmNOLvzZiyPo2f0OLjYNgPDBTdOXGDLqqQm5fCxIhneFEipX6KPZEMD6ohkr8KOoeV19XrKWuZJXvfbAa4O2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdNQFy2N; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdNQFy2N"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-690404fd230so9149287b3.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314521; x=1727919321; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAogBQT7i8/Ut4GrJolXC+/DUS73zZR+MbirDcTLTRg=;
        b=jdNQFy2NwTQ/OEl/hYfrxySWsR8l5S0fLcHy36u1gHEPeSSqeOIURi7gCyXgLwvZpc
         AQO1EgdhVH3Wyclw+tAf6dHCbiRyIfIkv8PSQUMww8F7cTGmOPQrYag7f3ktOutu/fG9
         Ka5UoTl5Ll9GXwft750H3YchpS0SzknkFW/yX71291unvDA/ifaiGSfi03T7dFhYlg7l
         6ydSFpeOKNqgE6lsec/GLG7e9oKL2XPyGQ+vPRpZErDtqYk6GWnjSAEUVgoCnnejuHm6
         D3Y9FWxHPs9CFnd7czVolKBHWenxIu/YR/fBx+Nn8dSyp8HrqhX34PgGc8fcyvzLphHZ
         L/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314521; x=1727919321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAogBQT7i8/Ut4GrJolXC+/DUS73zZR+MbirDcTLTRg=;
        b=ElaG/PpDIWXqBFyRNhDgwANvCKv/+HFfx0WG3qQ/4KgRjygdribI6Lw/h8kgP1GLQz
         fLaBkmh9nvE/hu64p9UhsXV+pUUnFiT+CigvGagSGgXtQvvJp1cQWhywCzcZTnk3cVEa
         +YQlDH0aDdab/1139CVnCOKJHedavXffKiYLsj9+LwbgZg/eYOyQE8JL8YM3H+YLPhqG
         qhdrUuAWZA8/AN1IwWGxh+w++t7m4G1QnXojMr0MK/OklJqsHKruje137aAXVQPYllo6
         0oXcWygRYhJAZ514WHgM3JMhxENPgIoPAUC8G7SLXmrC1hm6/c/qUW6m1l/L89xU84FH
         5Qug==
X-Forwarded-Encrypted: i=1; AJvYcCVfAWW4b1bH3sVz1pekzLVwQzWwaag+Slky5+FGbF5+vlrmjrJ7v2bavnY3LSq35j7k+R3u1Bw6WUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0913nGTILGhJ7T2zXUASxQRnNPbbj00uUcUEyfIgFjpM9a640
	rx3uCaS+Q6FXVYbg9bidH40JYovwaIIy95D4Goduqf8mz5l8ZtzdLo/lA9pDrQkOlIBnMKHt04q
	ZTxAYVFqadHHehv2DnA==
X-Google-Smtp-Source: AGHT+IFQs3DNBWoE9LT9ciS2x6yC/841ISG2URP+wJo+4FsamoM+oSoqTqpMkGycanRDnHNwxgVEwB1O11ztgMfN
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:1782:b0:e11:7a38:8883 with
 SMTP id 3f1490d57ef6-e24d9613a90mr3400276.7.1727314520739; Wed, 25 Sep 2024
 18:35:20 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:34:53 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-6-jthoughton@google.com>
Subject: [PATCH v7 05/18] KVM: x86/mmu: Rearrange kvm_{test_,}age_gfn
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Reorder the TDP MMU check to be first for both kvm_test_age_gfn and
kvm_age_gfn. For kvm_test_age_gfn, this allows us to completely avoid
needing to grab the MMU lock when the TDP MMU reports that the page is
young. Do the same for kvm_age_gfn merely for consistency.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 355a66c26517..03df592284ac 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1649,15 +1649,15 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
+	if (tdp_mmu_enabled)
+		young = kvm_tdp_mmu_age_gfn_range(kvm, range);
+
 	if (kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		young = kvm_rmap_age_gfn_range(kvm, range, false);
+		young |= kvm_rmap_age_gfn_range(kvm, range, false);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
-
 	return young;
 }
 
@@ -1665,15 +1665,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	if (kvm_memslots_have_rmaps(kvm)) {
+	if (tdp_mmu_enabled)
+		young = kvm_tdp_mmu_test_age_gfn(kvm, range);
+
+	if (!young && kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		young = kvm_rmap_age_gfn_range(kvm, range, true);
+		young |= kvm_rmap_age_gfn_range(kvm, range, true);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
-
 	return young;
 }
 
-- 
2.46.0.792.g87dc391469-goog

