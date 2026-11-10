Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316904;
	b=keY/ike6T11gZe8s7MDwnWYrRhD7hkoUDuw7MGRmuiTTY5Rqxn8V6WvrXQ5NiGjxBO/q
	 GgkWxulTqJfrxkMRsL+e9N2j1oDBxFY31FpTHmFqwBjyWK7QadrCV9OTwY7/XDHb2dk+V
	 Sh6paHb1oT1kYY6XTIeGY+JIHnlyaq9TzYYw/Qzp3YrE1dl92fjPh8M4hQnXfylDHu+V7
	 VSfSPWDlDaj2WOLMIwrzJ0a49eHlmFvr92+pLpc2R0FoHzvKIACWLLe6uoS7hMiZKdOX/
	 1q5J6y8V1woBoXaR+TVXiVX26hQw0KTD5RMO2LcSd5fU1p77hOtsVQsaQLwGyAfwuJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
	b=osFI5m5BohaHJd1QMapQaATVRNsW3xrjKtqUVm7DtqmAW8568t+gCaCP/AE9OahFdVhS
	 UpG96htGnRKz0ZiBNIfWV96PR6g8hdrN5BFi2EJ5wp14ygRJniLRLc3nk4o+AOFPZBzl0
	 rBegoxzL0t/nZUXLysKiWiEYFn3jLnC7EKJzY3nA6n4MtK5cS+zFe/EM8vBD9hcMFtXE5
	 NmiMUgjly1KJEfLnQb5aXld/r3lI+RUVsky7LNXbQSxF+x9/z7zpLCfmN3hxTFdIXA+C6
	 RDmhB/4ataAr11AL9yNTvTBRo4orOAnh7uAngi7K6HC6fDScKTEX42rC+cFOoqnPVWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOgc8TTB;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89BC606A7F5
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 13:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89BC606A7F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOgc8TTB
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso12679625ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316903; x=1794921703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=TOgc8TTBbYwLKHXj2O3+O52J33Z9/3RAoFLECWtyIZGDeK+ms9i9bN08wh2Mb6r7Av
         zKrucXRLvvnqoiIJEJLkZF+Q4M953WTnNzGFqmu1dVO2pXPpRTXCAj861CsjGD0Aw1XD
         MDg70rgyikifjE0XAIC68l6oboLzUi3wckm45r9ZTfRj6xMyGI33umBmZhNlcZQvLImH
         ZpjJo9q3oU3u37Ss4Ge3mFxqunX1V6wso9BIMPfMRaYGwYafWd7SKfc1qj2bqL0UO2rq
         O/rby1hi9/0pK5hiOTY7+aVatLehKcQv7S84omhmrMdfU56/v71i0sMMave0jhM0v4t9
         Mzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316903; x=1794921703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=k9HPVnwgTTwWwx/zZo6OIEfVeNrW9kxfGOUUNDufyYvLcTNPKyPc3Lu0n9F98UkPhF
         IaYLyp+pAN2tRLVoXUEq3QQhhCbRorP+D+i23jnxV+7xZsw/0T7gow3mGVvRCiQidGEI
         oFl3qzfsNLaZ8+xU52gSsNuvcPFyvYDxajGfVdjTOa2mSQy3V1VA5U1HzrSTOpOOqNOC
         9VKQ/bNdvVmaDlYJLb95C0iQNAty7KNwRyyPePJaeiOFNesY6hUjXIYkJUaVbxdYSkYC
         eapQRb4HjF3wi2ocZjpjgWzWhinEVUxRX4rWmeb1UBest9LDRs/MpflIcu+btEV+U/Yf
         xKbA==
X-Forwarded-Encrypted: i=1; AL+hErHxmTYxyLyPF8mmWxiFTa0JvK4c7jEiTYv1xpB/EQU7JRsya4rLAu/Ic/nEkqIiFnp0DQ3JgwQK8WE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LMUEpte1xNliXVzQOz8X3IMcjuTDl410mItGMe5ZoLVgT56pD
	f9xuDaVPDRD6mkYRbchYvtGg43CuD4oYlRerLpJJD5kc4wpahnoIGOJ2
X-Gm-Gg: AYBFou2Hi+yrHjaWnl26bfTdCnUIN66r5wsIl1WnhP2BKyNOteHxVEpaAcGJVKB0Saq
	hblwnAYjuwQth9k+Lx7+jrTXw7D2r/fsiEBsYD/cVpV+lFskAe9mqDj40T/dlkWGN8ELuf1D3P0
	T1or4v18WnRNMQJsuoQvdcQae3/5tbPykvFqi2Xqqe/F9z98XzSmkq5Uzxp/jdTNjmh6GiUZQoC
	xJ1hohe/7s0jxU8DT6s9TF9+ErPeOIxA5meSY4Fxkeh5wL9U2eUsVv0qurDuZcde8aKJt6P9t38
	/xl8uHugNWKQajcQwaSkfwcFfRVnQrQcba8EdZpMn+caXiMC7PO1KMPk6eMQ5hLl5DQQvsTd8WA
	YRL2XadPQJ5Sicak3GSepTuAA97YSGASyctLu4LKrzsW88+dKxN8FdPlWtbwDPKNeFV1QvBHkmE
	bSaMHe+53Guy4VyTpqXzkENe+344nmq0SsW6+AM9Lj/eN5HT12zUzjKN153fhC8fyK3OSM9eSAu
	C9Vu7nHVbNj+oB3bpq4OwKFwDyI8ys5cNy3d0Kde4gQmiSBhIZXmq0dcPQKzeaX5Noz4/zyiR+L
	UO4q0OSjjXXE5SxMWJWyhYXlAkNY2B046Mt2BO1JB/VykKlcSyy0FKVAiPDk9A4=
X-Received: by 2002:a17:902:f70f:b0:2ed:21fb:e75f with SMTP id d9443c01a7336-2edb91acef3mr23181235ad.48.1794316902956;
        Tue, 10 Nov 2026 05:21:42 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:41 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 3/7] fs/resctrl: Clear the CDP state after the cleanup
Date: Tue, 10 Nov 2026 21:20:50 +0800
Message-ID: <20261110132054.3702-4-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

On MPAM a CLOSID is translated into the PARTIDs that the hardware
configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
the teardown translates the CLOSIDs differently from when the groups
were set up.

For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
counters of each group through resctrl_arch_config_cntr(). On MPAM that
helper maps a counter to a monitor with the index
resctrl_get_config_index() returns for the CDP state. A counter assigned
while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
With CDP cleared, MPAM removes the mapping of PARTID c and resets the
monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
left behind. The helper had an empty body on MPAM until the ABMC support
implemented it, which is when the teardown started to program the
mapping with the cleared state.

Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
with the CDP state the configuration was created under.

x86 is not affected as its RMIDs and counters do not depend on the
CLOSID.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.3+
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.43.0

