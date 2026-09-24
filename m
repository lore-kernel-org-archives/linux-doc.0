Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16234A3F32
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271008; cv=none; b=EB+k3aPUhXIFZohnhPFXGbnaVgl0f5+yDIMUmmkup/N7pQifdiBucVbqwdPu44ICmo73jZzJQqAhy9VwUchgF9UVnIM5MJkvGRlwz3p3BGCoVfwYEa9QwZ30n8yVOJS2vlYwp9LGcN5Me2ZHVYA0CIV8Ei3c4DnbStELRxWweM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271008; c=relaxed/simple;
	bh=wEtQJcZvj82M47L7Tjmw+DpGbgxUqRqdySWeYlB244k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IuUTMaTPa/bAEiEkctPLq4zsLTXxcIZQ2t1gNNgBi/YrLZZkEeTojP8TgByyMSR60jXLA1Bmg4/rLsHECw5Tx4EPfynIGHQdlG8zh/Ac0ZAXVcx2XbInA4WBTHcVEHDht+HaR3GlUZqm7MHUbG5yLIQS3eEEDR10guKaZeRCPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=laTpR+FP; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="laTpR+FP"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b38ea4c6acso127473b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271002; x=1790875802; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDXNTscT9mKzWNXLRmPqiMgiEZh+nFQVdJuFACvc/Zg=;
        b=laTpR+FP/qggqxsaOud590eqYLGib7PBc6zUz21Cf5qzHmbrt3+QjVhHxWR5DHY0GM
         O0SEsfKpPVfx+ZSJKKEhIcFws3pCqJ3BOl4SzTywEkb2Fq4wKvvS2kyi2JDUihTWznyM
         gJHUYej13ux/1T3hj+jfEFQVEqpeY7g4rJN9UgcH29t0mAJHYM8uKf3K1Ff94wKK53uN
         4PUQ+pC34AU1xp8892UdrYF2DJjMz9gKA5+P5YSbHpit6BrA9AmYWL1RqxJrqUY532ZI
         ZWmzKaFT99R7y4NsyCmHSqJUTXN0Lj8jBSBbTmhhf+JnGEfc8tWHdOWjXkbIqy0n/7pT
         aWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271002; x=1790875802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDXNTscT9mKzWNXLRmPqiMgiEZh+nFQVdJuFACvc/Zg=;
        b=S2GSsZ/ZHChri0+mGzlxe85WfiM9IJjPbCnjZ6EYkpF8AQeIbwxXJI6rwp1mri08JP
         0D2tc8qqqU3XFZJZVgAcH+QOo72quUsyk4rAXe3gV9CkR779qBTfEYeNBzlaMC2n6k/t
         30tqp82TcUd4HYMG/2of/jGX7cEjVKHL3dXW5UELEZfUN0YqM+AjmZG+24SzoeYauPdn
         OzOSrYuJRadwIdkzlc/KgUFcISa4OhHG98R5kET45a02s9t9+WaHS8qRosQRvt2WOWks
         KFwzTxwr0Vln9/YI+gFwiCBGIwsHn+axs0nYp9c2GgRlBQm/qTL1oVqSb93JrOeBkSk8
         9gRw==
X-Forwarded-Encrypted: i=1; AKwUvBw5/zbcs0JX42rHzGpNu2FfBZF9ZFGtl25NAonjd+77G4wJVGaUsh1v1/JJlKtyL8bgP/nkClmAv2s=@vger.kernel.org
X-Gm-Message-State: AFuF++mDeJhz819bN09OCe70y6W2zYBp+cF+bSx+NCWhRk5bLErJyngi
	o/W1cQxbKie3BPDQVDwz3cvy3NG/ZZTiSSV22EpT2+1WTngcAaOB3JCvOXiUoI+efOAlZ535DCF
	8Sn7C2yQwY1fSWZ0hRkhrRaHIvg==
X-Received: from jablt1.prod.google.com ([2002:a05:6638:ac01:b0:5f1:a6b8:62bf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:11ce:b0:4b9:a88b:888b with SMTP id 5614622812f47-4d72c739696mr3040492b6e.33.1790271001357;
 Thu, 24 Sep 2026 10:30:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:27 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-22-coltonlewis@google.com>
Subject: [PATCH v9 21/22] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Add lib/find_bit.c to the KVM selftests build using the same wrapper
pattern as lib/rbtree.c so selftests that depend on find_bit helpers
link cleanly when built standalone.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 96bab7002d39e..cfd1a4fe09ec4 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/io.c
 LIBKVM += lib/kvm_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..5534248c663f7
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../../../lib/find_bit.c"
-- 
2.56.0.rc1.310.g51773c2048-goog

