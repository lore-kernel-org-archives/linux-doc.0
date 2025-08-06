Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA165233701
	for <linux-doc@vger.kernel.org>; Wed,  6 Aug 2025 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754517107; cv=none; b=CtqLkNN3RKfzIMv6Rx8Bbv5OWxTtO+G6wRkQ9k3yNWPsv+3SsHxQN39TVdn+QlIqpDD9lUKBGEeq1plMFGGtremSFeI2QcbtH3wFGeHOcHXpqLV8D6mZgcRju2hXISiiyiAaiNObS3b011wQm3L3M+lNTKkmIHKN/xNIhgXeOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754517107; c=relaxed/simple;
	bh=ioGhk3xk84BoXwkcOPC/uTsbu3UVQYxlGhQBp62yXPQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eGqE8CbQa6yi7wGQa7WtaekVHji4KV8MQzZ2Fzhs+/fRa3VmSzwdj6QgFkGaTp7j5qjazryROcujcbRPYcztKK9awfVnsKEQ5LKZRM/YYMLXHJkVGplPwuomYN8lCVYemRWSVk9G8D5Sg1ZjrwGBVcTZyJ4U7EDvrozMBlxq6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXFodiD2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXFodiD2"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23fe984fe57so3962655ad.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754517104; x=1755121904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4YJ+3jCatffCVLDpGjGjNQPin+iS8DfOQi6G+axJLM=;
        b=ZXFodiD28PmINu/pwign8ms5UTAjEXQ5/vegigDrLBdxKyDY2H1mybK4rcFtxIvTnw
         NdNLomjlM9LY1/NtckvlO2KX5/xPS6MJdO31Fg+Ffj6JuteG2UQStNUD632Rs82zB1zx
         tI96+w514z5xxuz6ytthpC4qdWybH+P3ksXWWGeV0Few+T6otbWENWQtp9ty/EjljKlW
         /Fl+o/SwgSLXSJtvW5He/4pdvfzKydsZ3x9rpGjj1cgHHKW1JCoheM3tuXPDwKoAmVju
         4xsQgWlkkOT7XEXpl7+tRTBPTYhoxZFtUgbh5MaQt0WyDImLwJLZF8oMzhuShYQicDTM
         DjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754517104; x=1755121904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4YJ+3jCatffCVLDpGjGjNQPin+iS8DfOQi6G+axJLM=;
        b=OOafFJZrqd9PjP5JIhUXLX4tzTS3RwPWqpG/blGya37fT0eBgCTaunH1OsG7sYfhZs
         u2JpeH1cTWGCE0JgZV6U9jHg09Yvr29C9dzEPmjtBFw2ZTgKd/XjkPDYiG4sN1je/hae
         SXRVCELlCc9iHsNhTW6t0EK+dzupkgJi/9yEysfNss+8hOFAqYFTIXihbA0mBxnn6w44
         IwS7Uem6aBjSlWxBF99mQB8t4YosYfNnUugWqgEDEQhsL0cassQoGFM1eVmqq4+S0NXz
         TmD8apz2gcsd9zy2ALL61tc0UDbwvQktduH3tMoRfeKRpgV1RW/iObrEOO2x/3GWeGwa
         b+dw==
X-Forwarded-Encrypted: i=1; AJvYcCUEbvG/cx1aX2PP5gIZOQvUN6NhBeX7KMrPARONjewd56KDWIqm22k1wBzOv9QNgwva+jqscjFlTrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NHo1tpKTfMaFbSrumLH90fhuH7UtV2zz6/5iWY5odYF/nTIP
	wruZkw2RQbLVchkfGc/EjjqKLhBvyodB1q2LKN0bKssGKcPLJrv3gE96OcabrhQWSlyFRk5pkXy
	fM6e/JoMt89+4o72CDP3e0Q==
X-Google-Smtp-Source: AGHT+IEFHzjbTvF06Bn7ryEnz1G4fFcb0+2rb8vE4CxPsmdqrExCBZEQOrWh+mH7nhcPPrOgHcK/Y1pm7L5bNJ1t
X-Received: from pjbmf11.prod.google.com ([2002:a17:90b:184b:b0:312:1900:72e2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b08:b0:240:80f:228e with SMTP id d9443c01a7336-242a0bc8d31mr52399045ad.52.1754517104106;
 Wed, 06 Aug 2025 14:51:44 -0700 (PDT)
Date: Wed,  6 Aug 2025 21:51:32 +0000
In-Reply-To: <20250806215133.43475-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250806215133.43475-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250806215133.43475-3-jthoughton@google.com>
Subject: [PATCH 2/2] Documentation: fault-injection: Add entries for KVM fault
 injection points
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, David Matlack <dmatlack@google.com>, 
	James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

KVM now supports three fault injection points:
1. fail_kvm_mmu_invalidate_retry, for all architectures.
2. fail_tdp_mmu_cmpxchg, for x86 only.
3. fail_tdp_mmu_resched, for x86 only.

Provide basic documentation for them.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/fault-injection/fault-injection.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index c2d3996b5b407..da75c921d6c4d 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -87,6 +87,18 @@ Available fault injection capabilities
   inject init_hctx() errors by setting config items under
   /sys/kernel/config/nullb/<disk>/init_hctx_fault_inject.
 
+- fail_kvm_mmu_invalidate_retry
+
+  For KVM, injects fake MMU invalidations.
+
+- fail_tdp_mmu_cmpxchg
+
+  For KVM/x86, injects cmpxchg failures for TDP MMU SPTE updates.
+
+- fail_tdp_mmu_resched
+
+  For KVM/x86, injects fake MMU lock contention for TDP MMU SPTE iteration.
+
 Configure fault-injection capabilities behavior
 -----------------------------------------------
 
-- 
2.50.1.703.g449372360f-goog

