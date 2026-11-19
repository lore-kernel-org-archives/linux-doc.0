Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114368;
	b=xPULqHtEmAniITEge5nxkECI9Hxf6s+AShGhizyyFSiEKZFxQKBpVH0wnU5ryw2t3VFS
	 nAT0Bx/dxjN3S8EzVR1OP/4zmMG2Trx51LCBsU0ELeMwYXRTKzGCGhb3/dZF50erOa5GC
	 emZpkq/z9cHFQZKgY10SbGj0KTbcrSmLZBf3ozlh551Fk92xDWVwP8olQmtWpHpXQRDyl
	 FN51DySDmqH+f1F/NS1DZdMCotfEi+kdS4FExj2S6erSp6kwxWvSB8YAfeMesyLWgM3qX
	 q7kyqDuyajueLUGf5iaXTQxAqK0FDIUXYyWhz1yR3TLNo1I8q4MPbMjFtmKcCeigDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=;
	b=3jhNtsWMBCvmik/fFnummUttrzxX9+aliWC4niMzcaCYfPLFKkfAbA71JFf2BHs2Xjdd
	 DZctm/48/XrDkJRxJ66WNeQ4LXLqVn6SvwRbsZGxQmhx+ZCQNN78zI4UzejOIW7pOnn/f
	 1M5P/3aCXTQhciioILtFkDqnFT1n40eqVdktGkBEZCEIWT401hCi4rDmOmrw1pqYcWaKc
	 uWaNKkfs7yMViehzu58N/ebz4KaSNU3mFfT4Ff0fLIQPwMeI3+T8QJU82MD/IqFj9a92h
	 xHyHvWv5gY1BPiB+W6QQQ/JpVONcTEwFaFoRONHBHsG3hzIiN+GOGIj/9pvXuBoZ2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UHPM6fWq;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537316073155
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 18:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537316073155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UHPM6fWq
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso164061b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114367; x=1795719167; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=;
        b=UHPM6fWqWEt/09cNK5Rf944Y1/0k1sbjONubj/DTy8n5zCl4RCe77b6Ao6wTJnrULW
         sS3kJrUh6GsyG2hU+8XLb3/6pbOZMjhNlxgwA1qRktI4Ga8STJqLz0PkYhstY6oOO2R7
         C0rFdYizHzYSbMbzCpJP1nMiqDBP7XM+mrdo4NyrIhBOS7qnk/kBURSBJ+t0MOnFNoba
         tnR8KqKpDtKryw5w11iZ4DDk9s2b1Hur+fRm5RWc01lY9lZO6eT0szNdDOd2hYzCVrqx
         HqI9s9LkIQ2NTmhJObHT9FFQ2SEQROhwqQlU6A5LAy4M9kids2Wwq4iIYeHG3rtrCrRR
         nzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114367; x=1795719167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=;
        b=FwZuvq7YPXUVlS+nNnps41O65O9Y3xsMy3JmF+W/Hpi6pNpKWIbiwof0qTCY/1Albw
         3IapyDWdZVSIrewKdYr+OY2Bwbv4dvwaaggjXho6KnfJWsIKvu2xBn3rrJ79m1oi1bfj
         3SGYD1qN+MHwGmHYXWU1hZAWyYx7bHS7+Sm8xr2Am4bqxyL2qdNXeEujZCowDjYvxd/X
         FErgk89h8gP8D7QhnXhBDQ5cfLCs4gC1WtjhEXgvjukx6d5W3mChJiWb6oiAJAkSa+rQ
         EyavWM7czMSnqst9QziDvel4VQATB5oXhq8fuqOL9ljfZOB/FlCDjah4kQ3ZghtUquTE
         flwg==
X-Forwarded-Encrypted: i=1; AL+hErHL98dKcUhwOdCf5V5C+bZWaSHQT2lcK3joJSrvE1LJjgH0b+RKsFSpd7+QFFhoSeUaUmYoTdwfNkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/xqoUUVaEjoOy4y7WC5NOWLbDmLyyxzW+jANPnAGG2N2OwacR
	nZWX/v5DAvHHNWasSCu+10XJXnYEAB3dmrQBmWAbU42WpxmCo7htl7/okwz/t6YaOdEOpvMyQzG
	msAKokQKxbUDzwUeNKKboRnbrpg==
X-Received: from iloo7-n2.prod.google.com ([2002:a05:6e02:6107:20b0:54e:86af:fe5d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:191a:b0:4d5:291b:b850 with SMTP id 5614622812f47-57a0c4b956amr1020128b6e.54.1795114366859;
 Thu, 19 Nov 2026 10:52:46 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:14 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-33-coltonlewis@google.com>
Subject: [PATCH v10 32/33] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add lib/find_bit.c to the KVM selftests build using the same wrapper
pattern as lib/rbtree.c so selftests that depend on find_bit helpers
link cleanly when built standalone.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e90819..79b67a86208c3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/kvm_util.c
 LIBKVM += lib/lru_gen_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..5534248c663f7
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../../../lib/find_bit.c"
-- 
2.56.1.708.g77570a6a1d-goog

