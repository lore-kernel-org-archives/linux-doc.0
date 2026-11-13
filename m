Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559039;
	b=ujvWehGnT0JhfsKoqPj14CwyRbd1qICo2QCb6EDXerQYxFr5hqtbQOr9+X4H7RS1Xkzq
	 A9Sl7HkKK9Flsq8KkE4gZWHKin5Lo671EJ0dOBNe6DQAfYFzkiN7gWyz9zIsSpT6ZA3LG
	 5EsHqBelMxOkHHgwnKEo9Q3ywXioe/Z9LFFz+D5Xf3K1VlIdCC6WuHgkO9HO5hd3lgsoZ
	 C4jyvG7I+jxsmgvRr7m5ldz2vae7blkyivdDu/CZTeOc3qInZR41R2CVs0+8sxIIOC3B7
	 X6bFOgUT7aDiAhPDM5wCtXTnBn0zpD3GjhzlD+3loJvcQ/RuIcwFt/LiKBhba6stc1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
	b=QyyqoeDCsmfwptpmpCVtiaco3XqPswDF4kSFUuInrrGDhjSnZHYDzaLtYMb00aJwCxZa
	 4IBRrP7irx0cgd4aDKoZxFh/9Jg6wsfu8XXC6KcDZL+swcOmM8kE1oUjBicSHE9E/cUXx
	 L8j/btf3LvqLIqbU7ifawJtr5uMJ/azGYOizLnX65EqPUFTgk0kJg/zVHvTmDIziEP59a
	 KtuZANSq06XGFm+jVzFJOzDTqcOYeFO7nf9irWbS5O+NBqxeTGZF68t4RBzCDdsmdcC+j
	 qIJ9m4YX67uF60f9lbXrYIcuIduxIEWTw8vff0dWlKvCROBny9ABtLUXHShD5z5DOrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F0606A32D
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9F0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2ed0cabf65fso3069395ad.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559038; x=1795163838; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=FUGKdwwy5qp1Qi31MPeEdEjYr98cr/fMoFORoQlH2iwqJ/AXUngqtv1zqJrP4cUvEv
         x/nII5hqIUrGDUUv2cVC5QDADZ6XKn4Aial/KEbbH8VcA9bY9EV8JU6hFge+fBUIsOhE
         BrLuIwU6hb8JiJGDb1/dLkGy5AvjdX2mufF6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559038; x=1795163838;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=F6TtEQkivc4GAs/hSNfNZowDNpHzwexNq/MARdN4N0Vb9036TOZ53YXwqdLTlHQjPn
         iIiwRfA7vl69JioiK51m5FN6La1Y5LfBbcROtRRkSYIDcQMGQW8DQ6ofKyFpB1ntLz40
         Rk8Idkvqe8/o4Ww0g6f8xX6OCT2yLUEcPbGXhVP3OEIzoGtPOAf2sRnFRoD+GaRQtj1+
         QlmBXMM4MISyoKOxKgWkiJ/5b94UZdI4lzP/gZxG1TyZzwwUxJ/S4lAmeKgS9Csxbw5C
         aAWLt6knMRY0Yflitt0pbhYGrG0nTw9lNcJ1UQoDl80ddf7CGfCjzndYZsJXreQrsJqC
         YoGg==
X-Forwarded-Encrypted: i=1; AL+hErEaci3P2lVeiH6gIZLP7WSrz+ExiV1zJEf30Hj5e2lLb4D0yxslildarGTRaTvM0uGw2n84ZjMtR5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+qtxbBy21+3O4FJhP2ngwm8kEAnU+AUylxVKSbS+imcUL2XVw
	qizX2+torJMQrurL2DqCFe4fajMEH2ObTK781CPSctFNGQ4ik8RtxrZbWqa87cYvNU8=
X-Gm-Gg: AYBFou1JUUkIXJHigsLcgMfAHrml1k8nME2rjAoQ7k19IeTPiOkXwEvvfkQEbWRVDUE
	9jeToLmdxY9fsm5M4Y1NIkIGCgE8a4UoyQHUozxTL2XELAHWEw3NV1cUvnvgrNg5JAqLo57MsLU
	yd/adVbZbbEfKveytCa/61mazuAVR/xoz0Yxn7sLXVvaQ/l2KeK4ff/3a5PEwYfSGIFi9nIXHe9
	AytkhmhFpwlgVjQB5xtJvA5sSXrbsk+dfkcvBLLqfTXhu0RDXOHBaQP9esk6uhqj96D+fP2ekmy
	XYx9Djjf+klrYDebU4ntcNoID8/pcNRFUpOcQykQeaq+4T4E7GHikwo4vfjPWBAlnACT23zPcTb
	KRBQCwfsuRq5rGlct8Kqc4gK5YFzsfg9KblRTUvSoWT34+EacaPf+JbmuySftWzXGzjO1dI2XqE
	BGJiZW4VuU3XJMydyc1VFWhc2EnhMBIQgXsSwiD2+C99m/D9YyI2nyTj3w98oIE4Po6KGplOqUo
	khpRKeXLJt/K0Sn6TA48rm7Yzs0VttyXTCuPOA19yf7EVriIuTJocR9K9/z/5RdEqvt81i4qUwT
	L82/8v55scoIqf6Lrs3Kcmq6PDfR84foJW0SjZo5kRZFYLwJh27nUnzAWyRSymLGlSF+uFDYW57
	IDL+zmHJHN+yjxENPVD3aV/uEmlL71MnBGU8f3sH7Y8m7ClpOsbPsOEUkChNZCyBLDmbD+00k0Q
	HVy+qY8OjyHv2DeMHJvRS+L2nHvwbjFdQ1lM4/jkpTEK/bXrE6fJ7NPRxQxl4=
X-Received: by 2002:a17:903:120d:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2ee0dd14181mr18456195ad.41.1794559038435;
        Fri, 13 Nov 2026 00:37:18 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm6731535ad.54.2026.11.13.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:17 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:14 -0800
Message-ID: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/3] Make the scheduler stack end check selectable at boot
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

v2:

- Check scs_is_enabled() inside task_scs_end_corrupted() rather than in
  schedule_debug() (Peter)
- Return 1 when sched_stack_end_check= can't be parsed (Randy)
- Say in the changelog why the other task_stack_end_corrupted() callers
  are left alone (Peter)
- Rebase onto tip/sched/core

v1: https://lore.kernel.org/r/cover.1793082868.git.chris@chrisdown.name

Chris Down (3):
  scs: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 include/linux/scs.h                           | 19 ++++++-----
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 5 files changed, 68 insertions(+), 14 deletions(-)


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.56.1

