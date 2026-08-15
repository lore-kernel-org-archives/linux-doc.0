Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C535A925
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785949; cv=none; b=Isg2eC2fBEqPxvx/hDY2f7ZQ4Y/zCS++ydt0lO+d9QA8JOxpXevcIG37eJcXt+2J2AhvlYG8M8ihNY7KuqJcmpqL9D/Y/PCk0dR4lvmpRtWOLBENhlFA48uOrOYrqDUzBQc1pAa54MpHiydFAI+rzPg9mI/bO96P88cmz/Myi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785949; c=relaxed/simple;
	bh=ca1jM0fOCLIP9WuBP03SPXW8RpJRHt73yJX9//rI98M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MSc80k43vEpm2FulCOHE3WCB97i5N+w/PtyAArjJVXC36voCkfhEhOXN69VUMX3VWovVbT4fKP8/L9Zwa5zsBeFqQjiYzU40SaM6yDSY9EAWml4ZVPpr0OaTMkpx44SweMl1IXhcp3uZSIer+H/7SUpJ+3EYxAWwGrpGK87QcwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4mR3ySA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4mR3ySA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fecbb7000so949911f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786785945; x=1787390745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hk8cmy7ROF0KR33i9zqmPXL+Xk26nOxz+b7oFhOL0UE=;
        b=N4mR3ySAqDNC1eti+WwmUO+UEyq7GOOKlIaoCfl8PFplEw2Sc970GRaMAjz5boYlfe
         h3WTtpJmADHqZtZ25wBnsShQpbfJHQRS5XFwsxuoChF5XekSm0uRwc8H2nHokYVFwd9x
         DuZV6R8S0ZGoNiu6lL+N2TlgxTofx63KfnrDrjqcsAw2Y1ZVmzeNg7DpeeRVS7FxbRvw
         Ry2N05t1HTnyrq+nhJflM8WjhUHfrcaIAHC864U0208CfqqP8ZtWI9R8UFCPN9VAWX2b
         V962CBHjnIcWSEZnb9nv2WThmuF4Cgqj20xlnjbeVWMH4WSpFGRDWIqb3WEm5MdKsZKm
         C8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786785945; x=1787390745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hk8cmy7ROF0KR33i9zqmPXL+Xk26nOxz+b7oFhOL0UE=;
        b=iZB51fusToVItv5jBcD5gWboXswbMx/bbIZiZBDAbTpc/nHOLEI/JPSFA5Oozrr86q
         crmf2TnUrVZckg/o0zoXQqyHfYJLrl5g0Ud3a3seJg6STnoXQ+Q8D45j0qj8lnPlsCmp
         CwMQrUiCiIVjIlhWvMPf+3Md0k1AyJTDGNzC7TQljIcVSAAWLdwwue0MLAD7OahiNkJd
         8TYHvFG8SGbedV+g4bMGQe3sfj04AGej36TSDDDCWrKobDW1mmb/z9tvvS/07mg1n3DY
         Doai0qObhtSunmZIpwtogSAHhDNp2LTz5MFv3tC2rEmSFK6l/GUv/KNqDxI2Uz2oeUIa
         Chfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpyh2w0O9DEmokq3+3TVDKAV38fNiU+WNuTvlPJZfR2e0cGrZzvbtMzSHvwQ8SA/4s5qFSbud+s5J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0EXUNu/LLCr6Q2tC1oakHSI7BObPm23RehAzpjo0zYoPTFK0
	HjQdOYGE8Wr6S7lrNj+ctkFhm2SRSWThPRMno3QgPY3fMIF6ob0wj1Pz
X-Gm-Gg: AR+sD119YG24C1iGfHmCFWvXqHsGx8UbOzvNj3SQKclYnoDz7+oxQc/8I953RgTWMyq
	QGfzFVbPjqLy97sgrePpdhxGrMXxJopRflmGm4ZsBhJxEwxiLfleZh8hSkNlX5KGVnjM724Xh1N
	XitqGuns9ewa3xzGZodq0fRGtQ2gmnAM/8+MZF1BSjK/X129TOkgPqplFDcYGWqwjih30r2q/md
	AUFu45x+lGKdJVGPHApudDbqV5vemyxkh+5i0tYdIzg9D3sJ6Q+8P0pdqvlfjvq7nbG2ZBbHWuv
	6tq85E0FWSBMYeOsP5qSgdYpZxyTnB8YO9YqULtrulQkl4rR3puufYgSAsIZ7H83y8UKQYjoIdD
	Hq/mZ+MlvrmqUExrPp3n6/0L0wXC6XB75MpQx3Gtd/Z5gyjCzwT+aKXwtHn6/XzAlifLbNydGdi
	NJm0MniLwtxBneYaG0V8AadQwazJ4zxbv2jMf/wNIVt56zoHtuxhYfrwm2ztWlt8CBH268sp0UF
	QIokH5k6czysW7j+nGnw0jujfba845bpLCjaipcvZ3vOhbkMO1jwUSQpylNXGSCqm7PzuKnv+AI
	5nU2PS3RLAFgeW7VLiOAsu6OXFR3KfaW9/KLfDsTHPliEbn6OcRiyEi2B1F7s1X7cDwkVoySUA=
	=
X-Received: by 2002:a05:600c:3b1d:b0:499:87b6:f3c0 with SMTP id 5b1f17b1804b1-4998807e4c9mr158343345e9.14.1786785945038;
        Sat, 15 Aug 2026 02:25:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aecb-d601-fc34-eb31-14a1-3704.310.pool.telefonica.de. [2a02:3100:aecb:d601:fc34:eb31:14a1:3704])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998ca63e5csm29202615e9.2.2026.08.15.02.25.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 02:25:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] Documentation: KVM: Fix the GICv5 KVM_IRQ_LINE PPI range
Date: Sat, 15 Aug 2026 11:25:37 +0200
Message-Id: <20260815092537.31737-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM rejects GICv5 PPI irq_id values above 63, while the documented
range extends to 127. KVM also rejects PPIs not present in the
KVM_DEV_ARM_VGIC_USERSPACE_PPIS mask. That mask is populated by
KVM_DEV_ARM_VGIC_CTRL_INIT; reading it beforehand currently succeeds
but returns all zeroes.

Correct the range, document the mask restriction, and require the mask
to be queried after VGIC initialization.

Fixes: b88d05a893cb ("KVM: arm64: gic-v5: Support GICv5 interrupts with KVM_IRQ_LINE")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/kvm/api.rst                  | 4 +++-
 Documentation/virt/kvm/devices/arm-vgic-v5.rst | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e3003a241d5b0..6d8fd74174492 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -912,7 +912,9 @@ The irq_type field has the following values:
 	       in-kernel GICv5: SPI, irq_id between 0 and 65535 (incl.)
 - KVM_ARM_IRQ_TYPE_PPI:
 	       in-kernel GICv2/GICv3: PPI, irq_id between 16 and 31 (incl.)
-	       in-kernel GICv5: PPI, irq_id between 0 and 127 (incl.)
+	       in-kernel GICv5: PPI, irq_id between 0 and 63 (incl.), and
+	       only if present in the mask returned by the
+	       KVM_DEV_ARM_VGIC_USERSPACE_PPIS attribute
 
 (The irq_id field thus corresponds nicely to the IRQ ID in the ARM GIC specs)
 
diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
index d328cf1e22c1f..e24aed0c4afcd 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v5.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
@@ -35,6 +35,9 @@ Groups:
       populated with the userspace PPI mask. The lower __u64 contains the mask
       for the lower 64 PPIS, with the remaining 64 being in the second __u64.
 
+      Userspace must query this attribute after initializing the VGIC with
+      KVM_DEV_ARM_VGIC_CTRL_INIT.
+
       This is a read-only attribute, and cannot be set. Attempts to set it are
       rejected.
 
-- 
2.53.0
