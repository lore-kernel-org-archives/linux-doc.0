Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503536;
	b=nrc+wwzQtAsKO3rMw28nkFwbO2HS0qEi1agoxdTEePmerrD719s5UIg1kAB7E93lYIuX
	 FW3ogVFhsdZoA2ubo6O63G9xX1vqS9zbOahJOnfl1YSUGoy9Gmpx/iBEL8e0ygI3P32PQ
	 FFQfLAI15P8JSiDPyRUs50+JjwD+yE+/0naymWmUww6YV75y1Fi56bINq4PuKYnLaj2kp
	 vpVd/KQDIvagOTM7AhwXzKqXaQ2YbjWHGAZt6nGegSLMkRLMYuSUt6dtVgGykGqvJ/8qp
	 fT0ldxQWR1e3Ihhu3CLXr3ia51yBXY88FxOj8z6mOjxZaXuKOS4duppy1MnBFK6z4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
	b=0XTBa2X82XTigHEXqWRsbwKQjOmcDSdmXloDCGeJ8IM/LZEKCB9ZzAknwshwMZKg2j0d
	 FGOv2cCdtCfwIOtp0P4oLDWmRBiEtyLk7l41z4eqOvpgjQNKTsSgVAzjzfjsUP5llIpOf
	 dOw/kZ5bONZKYLckrxZXvcffLMJFZ1CYtO9g1hwmKJU/QC5Nw6X7Zc8wFfVoM8zvL95rc
	 wfc5sYc9uBNa3DpYFqHCt7pqhGRdy5xyAWVSBerZHEhJyE6d/M+NVr6P9ctqEOCDbAj8i
	 bsqJRQg3v2lQFmltNqJsR78ngQG38BMbMYPTznwRWynTS7V0ht+ozHASawpM3+Y91pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="JmT/knbt";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A3606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 17:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=JmT/knbt
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2940a91.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503535; x=1795108335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
        b=JmT/knbtVs4zufKToj3YLkgoL/gYsPFCn3ruKI8fQWhDWXIXrQBmQTaMTChxTTd42d
         I/a8W8XbUCZ7HvXUMMNPb24Kbk6qqkOcwBD7tibW2JSd+rSks5ah91GF7KN6hMUAeRUj
         HyNE7nCfDMO3346vsyPi5MPGY8npeFmrJutts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503535; x=1795108335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQNtd1ogtUf073Hn9VbhfcKkxE1DWp6VlKt/Boo33zg=;
        b=CCjCyZtgBm2ozQUOTsLKM8u7eYGX+UqhEW/lTAvRW2XihO5DSV8FE7VMRI5UVpMCCn
         5vvRaEtB8/nck0dQiuOWl0R1N8H7k8s2Ny6/zo6jDkPfxw9Xbb+PJt9xDLB1zEF+tXWK
         v6AzgKlVGM3AcWGpPzIf4P+Z8MfsZFGCjJZsq5hxpFGRA5M3EOMLtb3Rt7hqiPaKlh0u
         zbkjc3eA1uTKyGhBGVMykJ97qVYsvcKiX/iAk9hJqTTt81VR5dSDcjp9iaFEbK4aCxYQ
         BZm08CTdSwXpyZ8D+rlXdiBhjnzEXzcZK6CUp7TpJ1RN2PFEyuLZWnDcUu0BY79dPpCD
         OBRA==
X-Forwarded-Encrypted: i=1; AL+hErGWfCCmxjO/gm4VGBTAoS6yIoF9oSLUXbTGNLwhu1mj6ywSL5GbLoyseCXp1y8NeJNvjtBPjYypzEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z98lzIm9nSFz5QfPtr7CmDga/0wXZNthn7Xdvw1S2T3SQXWjJMB
	LN9u/hXGzjW6gIYn1+rBxOtYQalGWkfIBHFSOQwU3dhUWmJGcBoHmAXCngOfIToTrTM=
X-Gm-Gg: AYBFou0Ky/ibRY+g1MIlDHdLIvjAfM63Y5F5dzzxfiN2jEvsZBYUHMg3zOE1myDrw3r
	olZqke7VXnm5GAuN2GSWvDl566VVzmjIaQG46uWhgSZO5vWl0/EcLZTibjHsNhOONiwYGUK9LQ0
	hteEZ5qgK3jtCvu2kLycVTMc09FRX0YxPK9/onur9tCwTGsOppCHo9YuiHh4ZlYwpgdEM19PrZE
	Ci21JQgZB3K0jEy6D0xPNhx+kOvHNxzzCRHdSOOgVQwQmwIAJnzq6lmYw+nHLNXZz+qXiH7sPm5
	LFewdhDg0USEPAXtheofroLthnHyZ3TVVLkEd9e/x2KBrMOMY/wugjP4Ul1f8qpbNGYbVjdo3Ey
	nZZeXNHrssg7Px7hBqL21OXM7ThdjnuPyn84FicqnAH57E5wnqwrVTLnQbGHB1LwcR8rpXku+uT
	TyjN78BXWDFuZJHIy8BN+Vxry6cqST0kpcPFQgcZVaJ9bEZ0KO6BlCviwOX0WVakRIGd54ICwvm
	tjyWxr8GIk+GEaO9XsUSOCGM3Cq2vE44tMrG4Fp/gzxbxW0MzJk9eVreoBsuBOoL4jDK07SSgz5
	dM+lkBNUr70+/COJB+dc9mQVfCFcl2fn8QhDlaq2nWUaKpxQi6nCBEpN4JYhIkWRl/RXVloWvW7
	JpPagQ06hHnWT
X-Received: by 2002:a17:90b:1c01:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b182f8c3e4mr5361131a91.66.1794503535321;
        Thu, 12 Nov 2026 09:12:15 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:14 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 0/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 13 Nov 2026 02:11:42 +0900
Message-ID: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report how much of the NPU each client uses through fdinfo. Patch 1
exports the runtime the scheduler already accounts per entity, and patch
2 uses it for rocket's drm-engine-npu key.

v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
    instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
    are not carried as the accounting changed. Based on drm-misc-next.
v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
    documentation (Tomeu Vizoso).
v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
v2: Size the per-core counters by rdev->max_cores.

Link to v4: https://lore.kernel.org/all/20261103155338.1949294-1-sidong.yang@furiosa.ai/
Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

Sidong Yang (2):
  drm/sched: Add drm_sched_entity_get_runtime()
  accel/rocket: Report NPU usage through fdinfo

 Documentation/accel/rocket/index.rst     | 28 ++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst    |  1 +
 drivers/accel/rocket/rocket_drv.c        | 21 +++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c | 25 +++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 5 files changed, 75 insertions(+), 1 deletion(-)


base-commit: 7678b7f2d38b5575981b1a7c09139a4660b66826
-- 
2.53.0

