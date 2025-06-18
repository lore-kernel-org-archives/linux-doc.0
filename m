Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982F21CC7F
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220689; cv=none; b=CeaXZqyQDmOMcbfR96l95fTMsAQ6jKzpV9+DyAhFAAYbNqGXC+g1NHrHq789JtZyaYFZBXn4qt21rTchOxOjzfBEj6yvgBVgHEz2pumMmNHdbgBRIBATUmZ+Q8uSPwubiEDZjlDFUgDOzK5rfxm14zH1LyuEGw0vbn5aAd38wpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220689; c=relaxed/simple;
	bh=jSiCen/C1Tdc2UB541LJK2epQTbdnnCbieLg8I8XSIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SWhYpWH2UOIH7GgssH/6wrqTWVunhrc1mIoV4aEfMV0FzBvkSPZyEhcQOSuBmgy+hxaIGcgFwZh1hCrBZ6UJN9CbTsU9gFrw2kOhYHf/9DnzO675BG0DuYUqiD2ejNMkpeVuKyG6wPwdv2rm4FXydZmWyCo2y71iGVfKyFTMjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wzund+6I; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wzund+6I"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748b4034b42so4332960b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220685; x=1750825485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=Wzund+6Icwa5O3/0juL0BZb2/v/gcv/vvLwv+IGtYkiBSz3VkaqxW91RgcihHfLgKP
         hMogqClv5btqfQiCSNhaC3siOaNNFbaMRlZ4z7NStt5WHlQDdMgW3DhAjjpJQBXuImEI
         zo2gmp8JwJY24+5oxAzWNMEwLAhtQB18by9XZeKq3YDNQJjJWNl5nnZcOmdYaTdfG39s
         Uo5vO0r+HvPJYQAewKf1hjSETfHBeC4Z1TLEyEXaoq3Hxe2r0Tn4qZTYPemi8zfYWrNT
         k0FtyB7fRys1xt2gAxiKDF3ciYUQwr7XEbNdFigzuMO3UnL04G2SzoyD9F1pOehoLucD
         64Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220685; x=1750825485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=LRUIPVgM3arqtVBpyu2zvm7gkIN0Twyj5Pmm18qncrJgdeuOHLAd0IjC48Hocky2Gr
         bP/UptYf0zAyNZYv808tBQBT/J1FJO6C8LQwQd5sbARusEUFiwMIdOFF2f0hoX6fjjjL
         RLCEmGbu7qQfnKzIZgBN8H1Mmqo49bWZSuckA4QJnmKnetXXGln9bL2O8mrfwqq/tKdv
         B7bZqR2Nt+sGM0dGAOrpjrl53T04Gkwq/6WC426ypjS54PGUZ/Ukpi9aNCOq9Tt9VJ9a
         qtXbAqLKHv+90Y/M62yEEATD1Z5641YDOD8TmvV8jlts4jb6NGzLk83LERx8xsjpi1RE
         2AQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeOOODVL6jBPq0VYdW5643Aa9zz9xaDiBIsG7xz7WkK82IGUq1aK6ZyV+QU7BgCCQWo8KcAp+S9hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAnibw0e2dQlP0Gc5up/O18dGVEF5jk2xZrm0Nd15mnz7SxTWA
	YQHT0BIGAg03/dCEpFvkypekvvGNtuDzKFZecCbN3mzo2YZ/wCFC+kKFxOSlPuaBa/lef9OTxvf
	6Ty5hSER9DhSr73zEml5zuQ==
X-Google-Smtp-Source: AGHT+IEYBcC2cDsFrgiMsyVhS97ys7BmjM02OsUOLrECd3uh2HcwoI2YZYxPTZFJmgzjhVgSJXNOQSUyK0OIbxzF
X-Received: from pfus9.prod.google.com ([2002:a05:6a00:8c9:b0:747:a4c0:983d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr27193918637.40.1750220685258;
 Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:21 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-13-jthoughton@google.com>
Subject: [PATCH v3 12/15] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index ce3ac0fd6dfb4..ba3fe8a53b33e 100644
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
2.50.0.rc2.692.g299adb8693-goog

