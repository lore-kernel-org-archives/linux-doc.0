Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CFA43847C
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510554; cv=none; b=nDuxt0/bmcnVOh1vn4kSQqWm0TE7vbKGU1Ich3XT8/px2YWCrifo4UaTsLyBDMyiH7EWYCMyt+Lk0TaCkEgP/VUtvZtb1uJAse9nzEQMzFvVR615uZiePqA7gjm8Jh2kvdshNvH4dqRJu82Tot8Tblwkx+J6rYWO32PFH4+wC44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510554; c=relaxed/simple;
	bh=ZLXgSTC1xaiI6a9LalfXnkq5VEO4QKxt9vodQK1/FG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7LN2ieIUugfuc9l6ntRN4Rv1/KzzJ5T0SRa9fd0jzI5ymcolyna2cZQodMmu6/h+FKLb6Fc35ZPZUF3qtr9pv0i5ctG4cGRwtnYKUvFwKuXRInYpHlHh8YlB6LS/Kq+xTGggl6ZKnLXhVX7JRXVlGufbV/MeDYMvy2Q/MES/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ADxyP+uK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ADxyP+uK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1391128f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510533; x=1786115333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0P+R2A756VjaLeieE8ZcHad5KvFTCwR/lqQP3cLlzg=;
        b=ADxyP+uKVM4UdQ0S9OvFXMFPQKYdm3vPRZNrHYH2IyvV0i2kbFLO7f3tKUMyN5ROYf
         qkguDENLrOoS1mtW6GaIWlwDcsf5HEJWyjAXjkhNGSNQw4+wSfUJypnBLWZ6qr9PrqCr
         Gye+TUTZwZrrH4gaolSkEmK7Vn0+3hxZFq6yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510533; x=1786115333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0P+R2A756VjaLeieE8ZcHad5KvFTCwR/lqQP3cLlzg=;
        b=D+nm1vghyyIkKTLUzf/X+VBEITATN4MGVH+FbByAGIJrZgYa3QM3RCxJjRcWTDapG0
         bRTSmBFxGmKgJli4/d6KyWLhasBKVbP5mUrQXPKK/x/nyHMjajrso4C0wxsgikva2sSZ
         edZRkHbQbiXvR/y8tn9qfeChlHH8xhFieb5tDiEd9NGdRqx/gTQviT43oenTMXzz17ss
         fGLMZQNbhPn2aRIp7FVcdNVa50z/CLTrLfjBpMrM/C31sq1fF3wxDJ0sZYiqij08xj7J
         Nn5uc/ByxUMVnVBJrDoKVxzRhyBmN6ms/MSn+5me6QgKzeEKTBPtlUK8Ax+0weTHMsra
         1Oag==
X-Forwarded-Encrypted: i=1; AHgh+RrkKvurjaOp+ZwEIuY07IYpf+EFsq6sXp5FSFQXLZq5xujRLFF6f5SeZ7sKa9ZQOVeb8LnuWcN9xc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywysf5nUauzgi+PiK69y8xIeFpw/aL80OyETFEBl0Bh4H8y90iF
	F15PRMqYZKuqB2bKUEWFFRj9gS/hL8qTZcJpXycEPR1MS/0BMIuXdj9Q+VGdpC5tDKYl6QV55Q8
	xxCRYYg==
X-Gm-Gg: AR+sD100S7FZ4tuiPA7096m6Iwmfie0cdGLnFs41fn/wmhEXUuEqEmhxXkZbkl+x7u+
	M4wIe4QTGiYk1/owJbfeZzmFDTADnsXaVQHpcp9SoOHP6hPWKvBa5cBNRr2gP6UxTNiD54/SBZO
	M9u7kd/Vx8dkdTzW/GmMWJuHpNGArt31OPYoe5jKgAt4nzWOAnJzAc9WerXT6DeoTQtSEBsi34G
	Y7VrIeA6188UQTigcQgf2+qKYtVsb3jSRQzOp6QRevQUSXZ4W5JtUxiV0i6CynCXnv86OgStOB6
	vK05rosH3O4NuyAsexPd9ExsnnjBkAD636Tp64O+JSDN1AESH461AcaB6kn+CXg1VoBn2xPDdLw
	WmqzeRnKTJJCRFcWlCXi9h/h21JFEX0myxM3nAHmCvWoPqDF76uvEfbv7IAZ6BtoScUk7Uaaos7
	2qIajVBzfFIVDWqbtN7F0M0aki94VX/R18mxmN6t4UfKiYXvE2Re9T9KzHzUkrLk4keI5eLYL1b
	E9U8BmoGTsm+dikpvxuiv822foaaFpsR+Gp4UjMpJLaIyeygIEBgfp3XVypteS7XjY=
X-Received: by 2002:a05:6000:1787:b0:47f:673c:42cc with SMTP id ffacd0b85a97d-47fd72c3732mr37783f8f.27.1785510532009;
        Fri, 31 Jul 2026 08:08:52 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:51 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mathias Krause <minipli@grsecurity.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH v2 0/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
Date: Fri, 31 Jul 2026 15:08:41 +0000
Message-ID: <20260731150846.1728164-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.

Fix the sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID
and the selftests for them (added in series [1]) to fail when
bsp_vcpu_id is incorrectly set to max_vcpu_ids, not to a value below
max_vcpu_ids.

Also clarify that in the documentation of KVM_CAP_MAX_VCPU_ID, in an
attempt to make this a bit less confusing.

v1 -> v2:
Split selftest fix into two patches, to avoid interim breakage of tests.

[1] https://lore.kernel.org/all/20240614202859.3597745-1-minipli@grsecurity.net/

Dmytro Maluka (4):
  KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
  KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
  KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound
    tests
  Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive

 Documentation/virt/kvm/api.rst                  | 13 ++++++++-----
 arch/x86/kvm/x86.c                              |  6 +++---
 .../selftests/kvm/x86/max_vcpuid_cap_test.c     | 17 ++++++++++-------
 .../testing/selftests/kvm/x86/set_boot_cpu_id.c |  4 ++--
 4 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.55.0.508.g3f0d502094-goog

