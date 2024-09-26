Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A131A4E85
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314534; cv=none; b=kuvV7yJnAkbZkUVN/IqSXkP8rV8sMSVQ/oZKkD1WIPiVjpL/zrLyagF/fYSMe0/dCWK+6nurz2SbaEvXM2OUzAGsz1tywPdC4wETx62YD7WeS8oSs9RljwRD4JiKy5/wBynhbXuMbbKJkPGkxctDVe0qRBhN2icFAxOW/EEDqdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314534; c=relaxed/simple;
	bh=qtVup+apKklmYfzUxasBpTxc2jJ2e+fh2noX2r78kUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M39IJ8QA6iEJOL868x57OcbosZdpUrvjy7kR1lWvEVBSoXDf4fRnOg66PU6Ap+DkDkIsNqZkV97jAA2MDZoTGOq+bzSYMA3fUAI5D8etqL7dHDfgatEejCaIvJzVErFnOrF5bGgVH/rdV/nPMoydEzYuNqid9eiObrNbgOusFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sCHiSt3L; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sCHiSt3L"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1ce98dcafaso944002276.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314532; x=1727919332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5MO1wGLHyIriiPw0D1mbZgOsdCV5vF/ShV42LiObvw=;
        b=sCHiSt3LZN2UzQCJPFbc7CeOoNT+9acvoIqDw7mwDfu7OGO0WKk3NCdHCEuXz+KoYN
         V+nkjWkTD4HW3juqt4poaMt95uIF3zBj5nptG5raVrWhZoXgp3H/ZINIYqteoi6m5I3L
         3MpOdZgsmLfc2wqs0eB/lD26MkTWfvYpJR/15BAr7K4f3Ui3B+aEcaIsRZoOC465h+7z
         gQqvEAtggvZoBU4+KNOuwwu7ZKMnXgzSLAVP+G7l5M08N7XQkakFf1FAAsVXUrchVQ0s
         Mq+f8WTXO1tLaPtgRLq/uch08v/5AhOGq2nhhlRtlhXYNQKNbt0cUuZehdKFkARAf5Np
         g43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314532; x=1727919332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5MO1wGLHyIriiPw0D1mbZgOsdCV5vF/ShV42LiObvw=;
        b=sh70fJllHh5HhHFPvtq4VbOh8zeK5RRGBzfiYTrN77idO66yV3ySaNZXE3wx3JAbUv
         +2LFdgf2SHUWn2X9uC9MOhU9ELkFn1/9LPo91r626SkEyeu4mBceZDl5J8Y3GNtidS6l
         ylQCZQi7NjAaAJL7jPfgCheRT4VSJWrYZNheRO7NIbGZNzvw8QTJeDWX/t9U9LzIVdS/
         P3YKZyc4jqcHY1UpS0KzS33nufNIwpUwB1Iyar5aeDhwMeitBCWvp3w1eAk7RlwLql83
         1rTAEvE7RjyasbqEFxXY/X3QDkxNI+jwahXyoU2G0ueIPUfYcs3y4kze4mukYbsoe+cM
         GFcA==
X-Forwarded-Encrypted: i=1; AJvYcCX/LQQ/KibMJehItYGbv4GH2RORe9O3u5/3RDY4QCohZnnbW9R25aDciAPi3BFuif17oQVQtOt7n18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdJGbz6qM6YoiOB74dGjXdn73lI/o92zZ5lhyXT9DQ/U2//5h
	21Z68+HznM6Db0wmNGwxMlsOJcPCA9N5jtU89JCRVTV/VG7siti9UTa5VprD1OpMDL7PTuzWjnS
	dz/FpSsj7psxBY9MntQ==
X-Google-Smtp-Source: AGHT+IHu6+UOTvIBD0ygLiAF0PUJIN5o89y1zOQ3DCuJr2JFhL/uFLj8FE3ghAKMMweGgziAQ1oo3bEK7MWZtMkm
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:a25:bb48:0:b0:e03:53a4:1a7 with SMTP id
 3f1490d57ef6-e24da1a380bmr81561276.10.1727314532143; Wed, 25 Sep 2024
 18:35:32 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:35:02 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-15-jthoughton@google.com>
Subject: [PATCH v7 14/18] KVM: Pass fast_only to kvm_{test_,}age_gfn
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Provide the basics for architectures to implement a fast-only version of
kvm_{test_,}age_gfn.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 98a987e88578..55861db556e2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -258,6 +258,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 union kvm_mmu_notifier_arg {
 	unsigned long attributes;
+	bool fast_only;
 };
 
 struct kvm_gfn_range {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ec07caaed6b6..8630dfc82d61 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -867,6 +867,7 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 		.may_block	= false,
 		.lockless	=
 			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
+		.arg.fast_only		= fast_only,
 	};
 
 	trace_kvm_age_hva(start, end, fast_only);
@@ -902,6 +903,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 		.may_block	= false,
 		.lockless	=
 			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
+		.arg.fast_only		= fast_only,
 	};
 
 	trace_kvm_test_age_hva(address, fast_only);
-- 
2.46.0.792.g87dc391469-goog

