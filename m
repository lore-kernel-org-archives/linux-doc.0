Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3A1CCB3A
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703595; cv=none; b=BAWMXNqrpTkhvWtBUc9OMMpnjfgB35J+rJrBgLjXcZpBfMZ8IN9I8NPbmFRBEvcvNcaI2179NvP+DKA2w0eRZFTth3Zt+Qh3gkP3MAJzXQVeH2PZfoic40si1PnqyYihpy3u66WRkgoWu1z0JHM1VS/C6HXG/aAq0QIGyrhFqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703595; c=relaxed/simple;
	bh=XMx0iVOdnev2yY5IXdQu8voPni8J7VGilJV3stcjywM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DiawiE01yMe5Y5LCK2w147abFWWFdvBAArF9nmmYeffcfZSWEsD29kGcReD8b5b/j1JChJZEyFdggWnegneQlFkh3TTkg1C86I58SYTdmiGLu6T/zP1eolNZ2s9LDYVCCq1r3Mg2vAVU6e7Zr1UBl7RfOYm4Ri28w//ethvBmHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K34B8m8s; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K34B8m8s"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e24a31ad88aso40378276.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729703592; x=1730308392; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=;
        b=K34B8m8s9AIcMVPLdniUuTotXk5+Tj2CiiUeaIj/C8jscB+lJz2N6j9yirWIONhKVQ
         +4vpwK5o6Y6dDoVg/8rouyK3TRIBGzSuuAv34ThBB1Y3KcEcr3ZeBsKWo4wgVo+xvuOd
         jmaA/LQeEPdfxdfU7Ucttpf4RpJ0VtoEtRaQoCAosc9vi5sMal7tY9EG9yACUfqjKdVY
         QceyOkdmOfrGkKwiSwST2KTVeZTdHu0jjzAtzlO00RS+9lT4+gLDu5IbfZ3U/3FICD4l
         V95MfRoZYkVrO7cXtJf13ScDHDk/K8x43fMg602DVm1UpF6h1pLtEbVIUAyPORnzoUhN
         jmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703592; x=1730308392;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=;
        b=GntJ4APUWKUMQHzgujyYv3YXzCQ7IQ5PIY9fMhoCS3D5K2yeVn8RmRW3xRulZ47vpJ
         0+HKWO0SkK84mdBuVYl6b0E+lSZbR/EjXgWnzYwnIxoFV2KWl1zZLSyPl4/LrnIh8WEh
         wNuvA7XjvwEk+XLqeOiSAMef9uGb1ldUhC/xP+08CsfQKIlLQ+KG2V5iW/NglqvKRig3
         N90gvtKqJF9eGXS639wY+RA+YOgFWfx0OuN5+YHK/hLQ53dIWsubUwPe3Wv04To0ZwI8
         alTt5nuNeK1fYoMpKS0Sp+tTb6R1MBbyx02Kg4loX7/yjNliDLU+fUQ0vMFEmyG+Y3TS
         kupw==
X-Forwarded-Encrypted: i=1; AJvYcCWXVjLqPMlMUgeBy/wjmyxNOo34sXMsRO9NdJmVlZcZDmY3y6FJhN3Jy7PN4CS0YSL7okGXPdY6YD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrehMgTHnG4XYgPFV4ks3A/nM3BaYT5m4CzF61IskEWXF5pqRq
	Atwe9yKTKOGpy0RoUUsl2rKkU9Dx6D16QLuX0QhmtcIIAvqWR/jo6jXHYFB2irAQfFKCa1AGP1S
	QcWnk5IbK7g==
X-Google-Smtp-Source: AGHT+IFzj+UPbqIngfYZg8jfoSUOtJUbhZmymzy/LpsBgzX9feIS82Pp9ab/ElSPVxx+P987jYpoPGCk3MktKg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5b:b90:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e2e3a6dd19amr1836276.10.1729703592399; Wed, 23 Oct 2024 10:13:12
 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:12:43 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023171244.4031151-1-smostafa@google.com>
Subject: [PATCH] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bb48ae24ae69..59a0dd7e2de6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2723,8 +2723,12 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
+			protected: hVHE-based mode with support for guests whose
 				   state is kept private from the host.
+				   In case hVHE is not supported in hardware, it will
+				   boot with protected nVHE.
+				   nVHE protected mode can still be forced on VHE systems
+				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
 
 			nested: VHE-based mode with support for nested
 				virtualization. Requires at least ARMv8.3
-- 
2.47.0.105.g07ac214952-goog

