Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119EE205E33
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455806; cv=none; b=luO+pwa8a7z1qCmhmTqJQueyXoSqtgujqOTCXvJ/NCzkFOk8TYYmP6v9UMKzm31mc7wA0qxNCqovk/DFu9argwpJkS5IZMIUN3Cp2OORTU0QmTmBRvNMuCNEotFFyYFBPNHKMTYLydoOZJlapJa64qbH/lv9d/xLeM3jofX9tCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455806; c=relaxed/simple;
	bh=7dvrWaFHLcfsBdDYCLYrpKWe49ir6woEr/o0fl0YETg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MU9A+3/TYgxYpJO9UYdHhRVv/a2aDkV+/pOW/RdlmeNRxBd/r1lSszkUG9PAXG73OEJI/oPMJPv+C0u0qdqx9s8G8Chort7SBJWk419rpRb+CC3wGtqnikYKb1jMk1rjIO2H/FIt5iuKcJ92Owbgv8TtIfErTW20qHYDT5O4B7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kEXtOHDm; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEXtOHDm"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-8610c442fe7so227873241.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455803; x=1737060603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvbYHGNl+8d7DJVwo06D1EaOJgLS4cwG8AKsUnFt2VU=;
        b=kEXtOHDmICt5Ci3ldzUPR86PKZFypjLeNcQvxoawZkQEOJzjDXXqoIzKubFJ4XrWfP
         RdrwGAd0B1BJQGo3oR3B5OTV7WdY0HycAVwZ7tnMDoROet00Z8SSJ1IsKobfb3o3Tz1H
         XztHi2WON8NkaJFcJHq42rfEhSF4hcLby+iygoMlUjOnCkjyP0xcbt4Oqrh4idY5FPJF
         SXVQj8rFn7i4DlzEzXpk5s6dqyAyoQN74e1TGvv1aURjChAhFFS/6d9CfpZ3Hh7IROvt
         vCmln3AxZy1o9IgoiR4x1RFd+cu8DiSdwRKvB3N/fnfjNKIgAIfz03X/qD3MDZABj8Y+
         6dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455803; x=1737060603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvbYHGNl+8d7DJVwo06D1EaOJgLS4cwG8AKsUnFt2VU=;
        b=V6pEweE96CqgWbmst8Nw1CsOV7XfeiuVn2Htu2cQMFHjH1z5Zowx3oKOEtDW3Mqw2X
         UZV0YEOvO4hvnCUqQl3qAg9P5U4X9lb84/3CJCcNYms+KJ2XJP2+THLWKv1zhHdBKHfq
         42m+GeKAxt7bYJsSHrdg9ZK2VoCNs7edVNajh7Zl/joudiPd2nbNDmHJQU6n8jAneyuC
         X+BpNYuSpM02DBBt9zxtWenNchfXi1eTVmi5RUdCkEv+b/aNAGHJWreWe6Fy3GwfbbnZ
         U9fEi0zpwPF+qS4soPjDIvTKHzJZEndClXQg24w+I74Tp8MMSPlffHd/tUWlG/ox7GoI
         NWag==
X-Forwarded-Encrypted: i=1; AJvYcCWkDhwQcm33GvLC30JHtK3GlemdrI+fGQKqs2eP/xV2UZlaVVyYHmr30eoF1XJQCtcs+Oxj/Rp05ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqi9RCfbQLYhuq/30fP+vXZYdB0SSPLZTUB6a5Cxonqm28swvM
	1O5toJr0n+mLPhDMc8hfKN5xMLyCMxy6bt1dN2hL9S/ev/9sNaveKNhHKhtwVhzZReEgnTWO4yx
	Rm6gqXTap7ZR3e+xTyQ==
X-Google-Smtp-Source: AGHT+IE5vJKdBIol6yLO/bCx7LzYtkzGMj0nrEKYhdyPGNNYWWWO3Zt70S5/gUk7SHW9elNAbwwPb9/d1PnA+b6V
X-Received: from vsvj21.prod.google.com ([2002:a05:6102:3e15:b0:4af:dea8:7367])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:41a7:b0:4b1:1a11:95f8 with SMTP id ada2fe7eead31-4b3d0da8f06mr8495356137.11.1736455802892;
 Thu, 09 Jan 2025 12:50:02 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:25 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-10-jthoughton@google.com>
Subject: [PATCH v2 09/13] KVM: selftests: Add va_start/end into uffd_desc
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This will be used for the self-test to look up which userfaultfd we
should be using when handling a KVM Userfault (in the event KVM
Userfault and userfaultfd are being used together).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/userfaultfd_util.h | 2 ++
 tools/testing/selftests/kvm/lib/userfaultfd_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/userfaultfd_util.h b/tools/testing/selftests/kvm/include/userfaultfd_util.h
index 60f7f9d435dc..b62fecdfe745 100644
--- a/tools/testing/selftests/kvm/include/userfaultfd_util.h
+++ b/tools/testing/selftests/kvm/include/userfaultfd_util.h
@@ -30,6 +30,8 @@ struct uffd_desc {
 	int *pipefds;
 	pthread_t *readers;
 	struct uffd_reader_args *reader_args;
+	void *va_start;
+	void *va_end;
 };
 
 struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 7c9de8414462..93004c85bcdc 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -152,6 +152,8 @@ struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
 		    expected_ioctls, "missing userfaultfd ioctls");
 
 	uffd_desc->uffd = uffd;
+	uffd_desc->va_start = hva;
+	uffd_desc->va_end = (char *)hva + len;
 	for (i = 0; i < uffd_desc->num_readers; ++i) {
 		int pipes[2];
 
-- 
2.47.1.613.gc27f4b7a9f-goog

