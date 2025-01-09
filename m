Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54742063F1
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455807; cv=none; b=Pe9w3A4D7ChddtkDtYxxAa7jfgtK8vxPp1Lctd07JQVFQGbbK1qLqvTiveagcI1PxjS4WJ8gRX3xqOXNjWYQ2p1Q5j7uMQuWy3/u1peDvQkij3pm7UN60GXOumyHeKjc+ZcSpWG8LijvWacGz9buRrqN1Fbqa4t4n6Um9HLAKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455807; c=relaxed/simple;
	bh=0eyMEtCsJeYENXDg27iZXcBn86i7IQLtffZKe3KbKs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J2BFpKtMGz7ONVK1U3lR35HBG0b9IfWKozQIp66K98ceBsUdTDkK7u4iceSjqpM6Ecay6cF0rbzk1aDgpSweoM7IOU7GNF5EmVBWH7gI1DuM3BEm7N8wtWZLQlVB/2CqER7uhLIYVj7pTwXvx0/DrhUKzRSyDMlRbuJOO6SSybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnGb2amd; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnGb2amd"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-85b89d07a8bso174712241.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455804; x=1737060604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4uSddURoLEbUkGuIhSA7RvXzffvl1Ath1WbpEvQHEc=;
        b=lnGb2amdeluEUvZZa4tCCapSYrU6KfvKXqKec37vD1kloezlACy77FPdOyOSvkOxdL
         veSdrNAq/+EM+UTg8KzEzaf5in0+l+yHrfmPU0gwcX0UpwS3oJ/C334ZF3pGaKitBKTp
         J6n/+gCSEcWaDAKbEsKF/EJMKOYfZ1DMT6RW2WY2njJHZiJZ6rBdZk35tcc47FV1j86B
         yDC+7jVhyjF9/yHpzR4zr3X/1fS9s9y+BPqef+i8zf5UP4WkIvrpNDu6jADWrYLOXB+g
         N0KyitO+Utw/RVEbGGnA+4oeDymKX1hwi/JJ/8KwB5nMzMoQqb/N1CMdS4F4LSecJLkk
         1SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455804; x=1737060604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4uSddURoLEbUkGuIhSA7RvXzffvl1Ath1WbpEvQHEc=;
        b=rpdpJ5C9FxQeO1WS099IZVjLp6R04T6JBfwRQNBA/HTUMp/brBT08V2zeVfhD2FGo7
         r2npGYy+5ZikL90/vQkB5Y7iLTCmKHpIyTa04yGEd1WZmfWKoatcus8g7+0H6W1dlxZC
         C1MwWvag9CvXPSoF23MOHv70EruLxajWPsfX/XyXSVLBcP8bLFwdECiQSYujk9W72tkD
         WlXt+8uUFbO0Npbfo2kwH+Zp0Rq9X33Sej2AgcaFH0BlTeHJNRGFaCPzmkHSV4faaTJP
         JJkJtG+kCMJmDZ2NCA0VHOKD044tUdHJix6ipyNl+WCkPU3iN/pq37UqSvAKJ1N2CAHD
         8Oug==
X-Forwarded-Encrypted: i=1; AJvYcCWMUyLy/zYXs8k6RKDkzEWswwrYWNV42hYcXRe+K5QNsS69Al4EaF4ftLUjiqWxDiBgRdU2spxpmlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqGpci5JkFJyqLJLXxRlsgUZk0Pl6UL83rL0Wy1a63XtS5Nyj
	rAKmSRAotxUc6U3u0LhNesWslaZfZMBVPmPs2Wa7UgMGhk7XbtUdA2CNmgvUHiNKAforUHGqpXp
	AZ1fMyav4cTTIjBcWbQ==
X-Google-Smtp-Source: AGHT+IHUcz3SJhDUBT3AFAphG25I/PCLrMSFE5oskoAYquhM4FPeQ8hRbnzHYl6jdbwhQgIl3dB0klJ9OTTcUSfO
X-Received: from vsbic11.prod.google.com ([2002:a05:6102:4b8b:b0:4af:dad1:fc51])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3e20:b0:4af:e5fd:77fc with SMTP id ada2fe7eead31-4b3d0d75fcfmr8791219137.3.1736455804705;
 Thu, 09 Jan 2025 12:50:04 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:27 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-12-jthoughton@google.com>
Subject: [PATCH v2 11/13] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
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

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 86ee3385e860..adce75720cc1 100644
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
2.47.1.613.gc27f4b7a9f-goog

