Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27F16CD13
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654976; cv=none; b=iaoh8dbkZowqC5wvZDbucJn3GyYqfCnt5VFj5S0RW0nTOfb9vZSsq1CCT3YLx6hsTGNK2+BPTgXkUUxZOZBl+4S09Xw1XG713zlYTmsbMth5k1bwGjylsS08OVxapzdjouOnpO1Q2YaXzbzHNU8+GBBWmhzNyQP1sdIDHLqnC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654976; c=relaxed/simple;
	bh=8593VQW+qY6IG/jYYpHCncdh+HTnZZx/ZSFesd4ewL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cJ1QfJ5QVvqtBZT6FJgj/WV+UmHq53XvN+zNoIOsBXB4NYMNpgPXIwt+hLIhUtBekgYCgI9CcmMG1n19vV7wRKl3qINBiSIcZe4OGde33wy4cfaaRIgstcYDLmtP0kEvFXqrM1aKSxpgtSXYhc629nREwmOQnShm7HFN4od64/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xxpa8ncT; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xxpa8ncT"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-81032cef053so88815241.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654974; x=1721259774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KrWHeRDFVlfzCLm2guf0VTYM9h/W1rUjUnfwvHRBaDY=;
        b=Xxpa8ncTdgyuNQ996Gw0ta5/yYEut2AJIhDg3+yQwm/UPIA274rODqe0+bAvn++daV
         z7pi3hj55R3y+anqcc1egnqgM1VMRqWyqqUXTzM8b04EKorwb2qPzLgmC2S0VOer6rEM
         uvewnx3ThRcFoOhqtBy9P74tgDmnyIlu+hRI9NiGwBP3hx2dD1l2Kf4MkfoiA9nkMdmy
         b2EUeR3mUD+MdNVZ5jpEZ4S4W/XYdjha7U1FQuxb1YxTdERolyRmzr5+yCz8Y+9tXEO+
         jYEPOhQ6Xq/JHeaih7VRmfmZJsmkJdH122A6LrAUVw5ULn81szmZKaXUkiwNmeAhOaJH
         r09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654974; x=1721259774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrWHeRDFVlfzCLm2guf0VTYM9h/W1rUjUnfwvHRBaDY=;
        b=VL99YCZy/+abwmeIl0du4gO3BkMkH4z8+BirsZKWV5ndUsm12BLHmhgJ3fjQKgG+yX
         tMYywf+n4Eisz5I933KFXVvU3JBI9qWF+EF+NDpOknossc/I8xFL4zQOI0SbV3gWsAVA
         WefjQx+s9LLAzyO6S8UX58CGa3o3TfR5VG8bCloAppQoY4RQHEbjEgtlgg764Z6aCfr+
         O4FDlaarqQAJJFBQQzDeFlQ/Z/GYIaOGrTzOtkVDxygS67vF3uK5cxh1OG9oNY0ZtkuR
         Grb/WPmHhggNnA1Py1uXuxA+zTQ+LTPwqQsFEgn5GXz5jTYwBVIRcOSDvndAQkEAOFh3
         UuYg==
X-Forwarded-Encrypted: i=1; AJvYcCWSNh+4fuz4urlV768OAiUmwzaThzJKON9/NYJbijrDsf+jTMqHbayrsZWmr9KBC7s2+mEQqP1biJMOQlG+3ZpmXWk5CNMeDY1P
X-Gm-Message-State: AOJu0YxzxDeZJJsbNXLknDQPz89jEgY/AfDp1unB7PWmbyS+nzbR1O3w
	4ZOzjPDQQK2VConII6PgsH5N+h65yHi5/NyrMSM0zBbQy/HE4VYHnscvNY9sI08CLDUXdX7q4iU
	X8aJutiu2CCxe9zU49g==
X-Google-Smtp-Source: AGHT+IEk1FL65vqiK6UE5KirHXI/3mEOw3BUqoQ0HFsCZaEXrmaSc1CqWM95u18pik8VbBJeKyVeyhW9FRI1OD+8
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6102:5490:b0:48d:89b6:85d2 with
 SMTP id ada2fe7eead31-49031dbea2dmr435474137.0.1720654973979; Wed, 10 Jul
 2024 16:42:53 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:20 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-17-jthoughton@google.com>
Subject: [RFC PATCH 16/18] KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
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

Advertise support for KVM_CAP_USERFAULT when CONFIG_KVM_USERFAULT is
enabled.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d2ca16ddcaa1..90ce6b8ff0ab 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4916,6 +4916,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_KVM_USERFAULT
+	case KVM_CAP_USERFAULT:
+		return 1;
 #endif
 	default:
 		break;
-- 
2.45.2.993.g49e7a77208-goog

