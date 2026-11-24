Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506711;
	b=XJxhRXWEKodLjF4YarAv1VcieOPGA5/6kQTAY8ewCqe6ZIB1bsG7Ovydt9d4H9xBSDu/
	 OiI5eAH1bxkaj138c5QKRHrCgMJR2itO8AZprezysbRkfx5WdHpaGrRMnTkmMQpQmhskV
	 Cr936nOH1ALFTknw5ra79kNDa31UZkJfwFa9CSuDrh1sFAyWUPNjULRsSB2WQjRBSnIuY
	 pTlSWdlUj4eFonRSLH6dRQk3ICxAngwZYMQv0LDRYZYY07KNZBhEmiFHlX9rvd3Qq2tTF
	 2+UoBJjOeMawMJdx0hpMxYhENttqfPCO+hHig2pAeD6qL28NNfzyVNoNVB72X5yBqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
	b=kCLR3gvuxnO6jsk6aEm/YZOrPC2XNsA8ngai2nEzMUKSx1HoLaZi9eI5cDas2QWr1hRF
	 JE3BKlY06LDGi+NfuCH1Oy4GYzoAsCI6eq1SqYBKnh3lOzXLsgZDxm552uGoHnjzzfpX2
	 khDJ4ZqjjxZ6LwIevxNt6DbtbLCwO3cyy1tFWmZKrDuGDuxOD0ZnT0SLk/MhffC6Cc85n
	 Lb6uMNsOApPDwZgUI+LEtn4rqLVyOjHkfvL5r+S3LWKAh7ML6uAA41/opzqbZk62Z0MMy
	 +T/iuUzA5nNc4+u6hSj8I6htL9ZKzAdGWPsmyyioZrttTufuoaacxkNExjXogfKS2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmokvp4g;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2F606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E2F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmokvp4g
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386b3524415so273451eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506710; x=1796111510; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
        b=hmokvp4g/seCN/ZTeRc0pKsFFQtsv5zJtV/w9ZxOFB9pfkpATJ5wbU0nsTIRWVpB+J
         TDhMDpDc6zCH/4SqOBim3lf7ruuIUL+eoKUlUyQcbRKLVFZUofni6mDkvQUdSE/ztMJX
         soYL6IeLAhUuI9K8tbrfKpZHAC1Eb0b82YS7ZfbvulH715wLFPGLZjWX5Br3K7L+LCPR
         PR068rT5HYS0bkSCsoYbyRrcIPfqGwqZWllK8PSBGbEoyj2IT4sh5Wll7nbhzBsiMFHS
         w9nEhdctyXGou2ODWauyzVwE991o7NqeHTihePfoHZl4fjDtkHFuGv7dsxbqzMIyE8Pd
         ijzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506710; x=1796111510;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
        b=kPUdfZuFeuWLNSN73QWp6wKOrawf8/lpEZFnhw/c/c0s4c74Uwwe7AlGAT1vcmEk6k
         LDojhoMytwIPgNnvmwGINNfBbvF+1Ht6vbuMosVhV7Uo+Lhh0crsC+Ky7I6RYFnII6k0
         BUz4JBEqenCJLhMBmcWOZB1Ftm/xOgvr9iDMcPCB0/kgcj+FJY0xABY3yhPxOZFQYBDb
         3BYPPBwwX6wJxr4pYh/Ve3T/OrDZRwHoEMJ19a9PR2d2H5wxP4GwUhCG6nGoHj5/iOBk
         zdRKQOpfgc1n+Rrsz9/jGfRHqHR4MoWpFDCks1E/TlKryoKu2baDaAkY5IeWK3H8R36h
         t4Jg==
X-Forwarded-Encrypted: i=1; AL+hErHtyOENlvrsKJxxbhsGDuMNHOkvLtLLCy16VWtxSKoJRgfD+Us1A2z5u6hqIQA9hD6I4oEjM2OimpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RwymHX6n65wEpg4G5iwF0BdEHmRlyucoe6Zj0MF4jhffn2oHK
	nwonm5FNcNYmRoQALRPhmZy5umviqTYs8Sy+ndSuzH5nRfmgwd8Z5VP5
X-Gm-Gg: AZFdTZcIJH3IcsDNZvSLzlSuTVBjMC9pF8VTLPE09Wch0isfUvY8JT4QFjitvVTvpsj
	fwXbBO3XZd+QL51sZumgLA+/dLXSCd2CAG9Rw7D7fUSH+LhNhCDcVWYLPO2zrVikTBUqvRuEPWF
	/gU1WWUtXPMCShaveSbhGqk7FOOKViVbRG9U85pmkj7W+Dc4JcnrgdtFlN3mW1Ds0sxgOifvg5H
	Rw0gtIycwr8i7AEf7b9fJ5Zqz8D0GKU1wGbTAmN2YY44eWscq9WW6TgJWspNM3eKquITVCJGumJ
	9l1/draOH6YswxvmUgrA64NAko0L4XYKENpND/tGbSkSytm68GmDWCC7kC2JX6MHKepmbG9gJN6
	KWDE3a4ItqnC734t/jCEXYTMyi74J3P2bYss51r+9yDrsIo2sPkSWSlErfSJcYsngEqjiQ+sH2U
	A49iE+m9CqgpZAFvRfNKoLYX7bknysT/VaU8FaIYbJ3h8Dnlk2uo4lWV2ALV/BH3QH3GeiLwzvp
	wL7nIoCI8nVidOrcUrYWi/e+q1uBosSZI5j60XBU9iudX0dTB4LDXRb7FinKA17ynUFBFHq6jjv
	++RPbmhk9Sp+MkniTxpOvTUZRhZb2ijyLCNot3QlxrVMciP9Fgoo97/F3ftK9lZiVts=
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr18869883eec.1.1795506709267;
        Mon, 23 Nov 2026 23:51:49 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm53099098eec.5.2026.11.23.23.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:51:48 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 24 Nov 2026 15:51:27 +0800
Subject: [PATCH] mm/memcontrol: expose anon and file reclaim statistics in
 memory.stat
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP5BBWsC/yXMQQrCMBBG4auUWTvQhFDQq4iLdPqnjtgomShC6
 d1Ndfkt3lvJUBRGp26lgreaPnKDO3Qk15hnsE7N5Hs/OOcDL1hk5gK5R81sNVZ2CGHy/ZiOSai
 Fz4Kkn9/0fPnbXuMNUvcTbdsXrmg443YAAAA=
X-Change-ID: 20261124-memcg-reclain-stat-1e44d20bf9fc
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

The aggregate reclaim counters in memory.stat do not show how reclaim
is split between the anonymous and file LRUs of a cgroup.

Expose the existing per-memcg scan and steal counters by LRU type so
userspace can measure reclaim balance and efficiency when evaluating
reclaim policy. Report the same counters per node in memory.numa_stat.
Both files report the counters in base pages.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++--
 mm/memcontrol.c                         |  8 ++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 9e3c67b02ae2..eeeaf635754c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1726,6 +1726,22 @@ The following nested keys are defined.
 	  pgsteal_proactive (npn)
 		Amount of reclaimed pages proactively
 
+	  pgscan_anon
+		Number of base pages scanned for reclaim from the anonymous
+		LRU. With the multi-gen LRU, counts pages isolated for reclaim.
+
+	  pgscan_file
+		Number of base pages scanned for reclaim from the file LRU.
+		With the multi-gen LRU, counts pages isolated for reclaim.
+
+	  pgsteal_anon
+		Number of base pages reclaimed from the anonymous LRU,
+		including pages demoted to another node.
+
+	  pgsteal_file
+		Number of base pages reclaimed from the file LRU,
+		including pages demoted to another node.
+
 	  pgfault (npn)
 		Total number of page faults incurred
 
@@ -1829,11 +1845,11 @@ The following nested keys are defined.
 	application performance by combining this information with the
 	application's CPU allocation.
 
-	All memory amounts are in bytes.
+	All memory amounts are in bytes. Reclaim counters are in base pages.
 
 	The output format of memory.numa_stat is::
 
-	  type N0=<bytes in node 0> N1=<bytes in node 1> ...
+	  type N0=<value for node 0> N1=<value for node 1> ...
 
 	The entries are ordered to be human readable, and new entries
 	can show up in the middle. Don't rely on items remaining in a
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1ebc9330aeae..ac12ff69a633 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1647,10 +1647,14 @@ static const struct memory_stat memory_stats[] = {
 	{ "pgsteal_direct",		PGSTEAL_DIRECT		},
 	{ "pgsteal_khugepaged",		PGSTEAL_KHUGEPAGED	},
 	{ "pgsteal_proactive",		PGSTEAL_PROACTIVE	},
+	{ "pgsteal_anon",		PGSTEAL_ANON		},
+	{ "pgsteal_file",		PGSTEAL_FILE		},
 	{ "pgscan_kswapd",		PGSCAN_KSWAPD		},
 	{ "pgscan_direct",		PGSCAN_DIRECT		},
 	{ "pgscan_khugepaged",		PGSCAN_KHUGEPAGED	},
 	{ "pgscan_proactive",		PGSCAN_PROACTIVE	},
+	{ "pgscan_anon",		PGSCAN_ANON		},
+	{ "pgscan_file",		PGSCAN_FILE		},
 	{ "pgrefill",			PGREFILL		},
 #ifdef CONFIG_NUMA_BALANCING
 	{ "pgpromote_success",		PGPROMOTE_SUCCESS	},
@@ -1699,10 +1703,14 @@ static int memcg_page_state_output_unit(int item)
 	case PGSTEAL_DIRECT:
 	case PGSTEAL_KHUGEPAGED:
 	case PGSTEAL_PROACTIVE:
+	case PGSTEAL_ANON:
+	case PGSTEAL_FILE:
 	case PGSCAN_KSWAPD:
 	case PGSCAN_DIRECT:
 	case PGSCAN_KHUGEPAGED:
 	case PGSCAN_PROACTIVE:
+	case PGSCAN_ANON:
+	case PGSCAN_FILE:
 	case PGREFILL:
 #ifdef CONFIG_NUMA_BALANCING
 	case PGPROMOTE_SUCCESS:

---
base-commit: b024a51b0184b1efb6f55b11aaf7b15a490a6307

--  
Best regards,
Xueyuan

