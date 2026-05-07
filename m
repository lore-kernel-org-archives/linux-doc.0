Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C02DB7AE
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186077; cv=none; b=m5MUxNtR10r9TubIooWNiMi9rZpPCk05vrX2x0Iqq6IERh6SCe+XB3mP3vTf7fqHNdz7AatjZQPGrIj15VO1+OGKbPpnI9ozF3x93T6R1hVC47mNw7T5UvUzRnDKygpxA/7HbC4Au9Ha3uMdC1kr/hFfk0R4MOEShFgi1YQwrZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186077; c=relaxed/simple;
	bh=EmaFnaJMd6RXOTK/VecAQDt9Nc0voXI5PxK5gicU1M0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NmCbJ0BRCzI+os1UYSqIeqAq+e2s115V3v2p3J0a0Tvo0VO+XkIepx2d0KYNTDjHYdkeS/dVHEnNy//cgxLJTaLyZddDkhj2y47W4299+Ix4KPw6zVUZyEWgOM7JufH/Qh/jVLM6HpiFhNw+aNGYDLjdlpJHOzuQcQdpbSPKL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mYOcSjkL; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mYOcSjkL"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-364c0e269e5so1502991a91.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778186075; x=1778790875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMq4ZGb8sxP9J+x/Ocr+9N7VOn891ReIc+MoQxb2Bzc=;
        b=mYOcSjkLW5HZdVrE8m4EWoPTcq/zRfLcPTyLhphl8kDetBZeAvG8WrK4VVHmoTEkdb
         cIBr/aoUceNqUa3/NYprLp+gC4hrwdvSKET4Y7fIY8ap0oROhMe/3Oxy0dmMWOQK/tmF
         B9X7vzPnJmFSlNHSIKfq89IKS07vADUY7zvruCFbNTHo2gQWvGZ8dqSFkpSu531JUT6o
         +B5PyHaI2YGu6vDeRuYW6bIn6cZ/w+KIh3LMp3lhfGf7zVHZmp9M1ZyvVGfVLrNGe943
         og7zOhdsgUeZJIp8W69fR3mUsoVyalXMAw6zLGRAx1LPS1XQQMelc0qthmSUkrPEzvUM
         /m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186075; x=1778790875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMq4ZGb8sxP9J+x/Ocr+9N7VOn891ReIc+MoQxb2Bzc=;
        b=AmotIgWWN6kxWFz9ZO0UR3ykRcEuYxyGD/Cr1YIcoHD81nAEM/W/85npRrOSZgDjUT
         KdbUknUJq9BFhn5nsnRQ2f0v1bkft9vplZs9rM3RnmhssAypD2Hl3jpzwcwkl/k/+Ceg
         RfCArWVOke/Rjano7T/tgLqrhR0z3bGs4nq0dDOW0J+1rTSEahdEmNqtV7FHDam8Dauj
         McxMvKGdbpgjugPRcXsh75FJl0ux84Vxd/ExMf4Jy4xOGMiiUmnV+EJZUhdFfyVVJ4rk
         iD65dP3wlLYg/FJXLU/HBwVsH3zdwqn5sx10+ih8Ve+M83J7Q0Z0vupQaJqELUPKJBWv
         gE6w==
X-Forwarded-Encrypted: i=1; AFNElJ8LM+mp+EYxmwPlEtRbQstjZsRK137bq0tuAK3ghJRvyp3cCTkp2C6GHPAh19ZFuiWfSNisEAUVu8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9AH72Zzaa/KfDzfij934gLaAbiPke2sZw8bfdqqrzqnDZkjU
	zQWgGC7/+EqKe3/Z7+hK90ZxgbNYMOA49+6z4psXHL4qLK19SM/jh0KlSHi8lY1bg5O7GwoGPIc
	k7CoYl0IH0ezkpPWfEvvQOSco4w==
X-Received: from pgbcs6.prod.google.com ([2002:a05:6a02:4186:b0:c7e:68a1:910c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1584:b0:39c:c07:1450 with SMTP id adf61e73a8af0-3aa5a9da657mr10646690637.42.1778186074357;
 Thu, 07 May 2026 13:34:34 -0700 (PDT)
Date: Thu,  7 May 2026 13:34:21 -0700
In-Reply-To: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <cover.1778185936.git.ackerleytng@google.com>
Subject: [POC PATCH 0/5] guest_memfd in-place conversion selftests for SNP
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, liam@infradead.org, 
	linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, michael.roth@amd.com, 
	mingo@redhat.com, nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

With these POC patches, I was able to test the set memory
attributes/conversion ioctls with SNP.

After allowing src_addr to be NULL, SNP_LAUNCH_UPDATE can accept NULL
for source address and the SNP VM runs fine. :)

Ackerley Tng (5):
  KVM: selftests: Initialize guest_memfd with INIT_SHARED
  KVM: selftests: Use guest_memfd memory contents in-place for SNP
    launch update
  KVM: selftests: Make guest_code_xsave more friendly
  KVM: selftests: Allow specifying CoCo-privateness while mapping a page
  KVM: selftests: Test conversions for SNP

 .../selftests/kvm/include/x86/processor.h     |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  13 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |   3 +-
 .../selftests/kvm/x86/sev_smoke_test.c        | 222 +++++++++++++++++-
 5 files changed, 234 insertions(+), 18 deletions(-)

--
2.54.0.563.g4f69b47b94-goog
