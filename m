Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8D5569F2B
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710925; cv=none; b=S5ebJ5MV6rk/ofneCenH1ancwpQQEZwEL18yYaDlQnWXpOquODm4ap3gVEQUsiYP08GNGVlxPncDTi5yLdHvsl4v/R8LXv23QYyIN3GjMMSnFiWNcMZYjWSLxPASWD8X5ohnY5mWdRjnlSjNIyexWiNOTeORqpGkFnnLMuEQd1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710925; c=relaxed/simple;
	bh=Oy9auHfJzqotrUIAm63gKWiD6Ll4oo+kYUMTprPhG0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sNBlGO3uJPxr4TnLw9jP30rZBImqkI4XE7mwNRcsZGGp6Rtfvd5giGk609NNANSLK0SYT8qLFl2QiqlfTpcRJVnHGIyq8CIJ7lX8yU56oQ45Ml2bQCdGUf2Mxz8XrhWT079X6qVeyuT6+oHgHluPFdbHnMsXuGSQuxFAT/xVmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net; spf=pass smtp.mailfrom=opnsrc.net; dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b=VobnRmIP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b="VobnRmIP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so28559515e9.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710921; x=1791315721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=VobnRmIPfD78FI9795jEQhaARTymK3RZA0dfNhD3OEFlcTFqRyQpJ2YlA3ovgEffYS
         yh6LxPmVs1SJzDt/8lADc1bi1bGz1sOZa5756OE4o/3Cq7jSbBz4PkzQLnMscLugdmyX
         +iWPKCYkow80R0HiSIONfXSZ884OipTg3A6DFHMziW/HzOxTsreawJ+X9gDOhURrC4Je
         jUDCbVmDHe1Stk5UR+wUpiu9j9Q3414/vUY7zSM9SC21LPYCCs8I4tbCwEG1AdrVz608
         V37T1LwPZKUAxBbhCgyrNTcA49OfaSO00oqwFdtSV6KvW3MrMonkNkaSuzkRMjvZS3MY
         xftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710921; x=1791315721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=F9L2fLX5ylVkwi7gyx7QBW7N+HzGfqB+D8q9UX/J1m4PgF+jG9r5F5lPm9MOhiF2gV
         I7PkK2odU0ODX5jJuO2DYYFBoK7KZP9iW3aK/5zKiVL6jN/o6KGlE0mvlJ348rgQsJxv
         YuIaQ7XKIPAmmhNu0iqlmjLeSmBd6ly4q1px4LhMLUnmF4q/RA2fIh+Utf5NnwPu4bPD
         GBcHVCEZrAi/toyqWr4qcL1crxI8Yq+6ShqqXgfgjCuO21SAFYBsipbvqItzFmGynjjr
         FQE0FYSHSv7pKw8qAXIggu0HXncWzs4M+nSPwWiRQkJhwWHlbQjwUZDNj04fQfBdpzeZ
         0QJw==
X-Forwarded-Encrypted: i=1; AKwUvByE70kv1Om7HS7Ekk0erRO2sGlm7NP+tboALkTrR4nob+Xawyfmxkh4gfTVQAk0ywXHL0fFVp6PCME=@vger.kernel.org
X-Gm-Message-State: AFuF++k2ne+2SkHugPn/so3zoTIRKYWCf5nuc4Ayiet33b8YAVeSFvS2
	jk+dQHYK0KsStR+8KVklYqIffUfWQ/AoI8JDJ0sk106lhBQBzZ8yggGrqi2IH2aQt/4=
X-Gm-Gg: AYBFou2zUTWJtf4V3/2NNRqYzzr6G7WW93TquydPx/3EQ863NazD/9jsIbCFCkbqt15
	IdLgMM9Tv/9wSOn6thSIdd674b2JMDiS6+JiUFMhMT0ZOU4CTrUHJ7dgvL7lCMkOKkFpmw9mjdU
	10QPsh9Moo5apI2Wplswy0S2ZaDTRKaGTsF7fwdrfWxuhYvMwbNc7a8EJxYi8LXchUeQ/N2i+pz
	2tkwvO/ZHLJJttgYQJhGW6RXKrB/HYAtcTyIoHsuNfHWi//IBMkySZDX1nUIc+lii63PwFN3xBP
	yvvRNM4AKmJo0nBIF5bPZ5sTxW30wThj+qGx+5xqTBpSptUhE2NP2x++ch2iCde2QKGothySvQE
	A8si2/vqnVhjvs9X4cemJRuhvYFtHVI2jYqLvGVs+mtdTXlfIc9GSoAYisC3m2SJHBOEOmgh5UY
	RyyqgPWu4kEJEt2dEAcDGKAw/9Q/1AXid56EU/QeF8H9fRsfT4DIVhz4qmcnvl9YeHXhB/JM1jZ
	O+5gs0sDij5jSu0kBxJxOqHZEd1jAIdWI+6zQiGPiPruazprIUswGUYCTL+MICXtILe4vw=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-4a01503dad9mr1948065e9.25.1790710921130;
        Tue, 29 Sep 2026 12:42:01 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:42:00 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
Date: Tue, 29 Sep 2026 19:41:29 +0000
Message-Id: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Salil Mehta <salil.mehta@opnsrc.net>

The CPU enabled mask describes whether a present CPU may currently be
brought online. cpuhp_smt_enable() is an online operation, but currently
walks all present CPUs and only filters CPUs that are already online or
belong to offline NUMA nodes.

This can make it attempt _cpu_up() for a present CPU which firmware has
not enabled and which has not yet been registered as a CPU device.

Use the enabled mask for the policy decision it was introduced to
represent. This keeps present-but-disabled CPUs out of the SMT bring-up
path while still allowing registered offline SMT threads to be brought
back online.

Present and enabled are separate generic CPU states, so callers which
intend to bring CPUs online should not assume that every present CPU is
enabled.

Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
---
 kernel/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..988b7a1e8298 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
 	cpu_maps_update_begin();
 	cpu_smt_control = CPU_SMT_ENABLED;
 	for_each_present_cpu(cpu) {
-		/* Skip online CPUs and CPUs on offline nodes */
-		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
+		/* Skip online/disabled CPUs and CPUs on offline nodes */
+		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
+		    !node_online(cpu_to_node(cpu)))
 			continue;
 		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
 			continue;
-- 
2.34.1
