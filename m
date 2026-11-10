Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316886;
	b=Glzz3Y1gfpDuEkddOidXgMFHjsjICbPGUzPQpsAI/vJej5CQwlYcYFRPjRJkoxZviJBu
	 9PVET1oPEwU5/XL4z5sHWhwPumGUfMh+gdRKk1xbEHUQsTGGYoF+bKVwOjTYN4a8Jg+ou
	 MXM5OvupYzNorrLbZ4kQkj+YrUf/1v0yqHWGZG6nYkAtb4nh+rBVbf42Jh/SjqcegxKEw
	 6kB0d6WoNp8UZExU8X4/kQ3Xp3NUNr3QZ+wRCGGcNdiDFxNlXbeadYwfrSY0QSmsf8L16
	 dRRWTBWBnLCey0wnWI9YPGNAsAlB2Az8JtQTQUsR8cNFYgCrM97/xq/LHqe8UFp4wyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
	b=1G0fOukxETQ7obenUspP2HSHFeE44sXYYqI1WkcNbzFh4UCYbVVeibMtYGBXjvfxozC9
	 T3KkvzZuhmupUUal+Ev8nqGRYFqOCjkjhoIjbDom4SQWzJ+TZL3/P/lVNidtwskWhu4ZM
	 nvUD3PhrfN4F3/BCN80zJcD5DbSgBsAG/KLQ+CfizOt3k5IQszG8ptx7wZvc4zEew41yq
	 RD9MhHixHxlPc4JBDrbJB8IriYzjJgxFaLlcDWZvUzdePOAvG9DMhzugdCdoMNrG0sfAr
	 NVv529SF+z27ifkXus+pPlz5OzkkTZCXAZgQZkuknCQmyrd1u4ATTu2ZpbIQErsHlng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeYpwYYL;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505C606A7E5
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 13:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A505C606A7E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeYpwYYL
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e96502e447so16495815ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316885; x=1794921685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
        b=jeYpwYYLbvK1HPyHxcBX8OWsMd3edbuKi2dytd5QqO8RXPzhdcQzHD7rAWpzjhEX5+
         Ln+3X6ErsiEU3mf9Wp3yZqU0RcrKUK3sn4WBiFMU9wj5G6JEp2QYhj48hbNuYkc9Pfz2
         CjqGTc5bH0Yh653wfKWHyc0WVCZc0JyyOaBfV4Bppix8xKztgWb36o7MmKjyFfnapZZ0
         /aTKswkzFZkYbf4FR6FtcVboSuZW9F+R0N4+2vk+IJEhx7QEq02GJVdv2olA58qecNsT
         b3D8T5/k2gQDHMhV7iR/EL/+h/yclbRkhL1RQ/Rb/xMtdSm2AlC+sOXrTRwvbZINnhbb
         CmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316885; x=1794921685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxwBGzcXaXgnefRAG/4qRjMQWaL6ukmbK7qp5Voj4t0=;
        b=OPLR/LN8Y0nDx7dJRCaUZ9HUf0L7r7sPfwNd4PbhylFJoQYgcqgo1nekYS85p0pSg8
         HxMSGs4QYgJdj5b4udQmfUDqMajDumEMtIA7Tb0w04VmR6YoPrqA17X4GNeIlbNNBhfy
         JkD9K60ptUJdUwuaUw0BlQvcbFubqHIFSKQHFolTU3PlKKclOHaM7OPhuzjojPXqa0vi
         xpyFPqXqeCKGswxQW7pLMfCWGSBLmDVW0CpYx3qsd5xiGwnsuRLSPLmVK1fbZNzJFCa8
         UtDsRIXPsnd2qLlw5SdhwnQoEVE6COfIuZLaHOTiIaLl91X/OBfsADw4XY7SgrIK8dOv
         nLOw==
X-Forwarded-Encrypted: i=1; AL+hErFl7F5y1vu3jntvyro8hAtC/Wflaq8O2/OUSF20O9WhFmsWrpCiNf9hGAJddW71cpVLF4KQD448EH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q8s6baIUQkm5cdJPMwNDm7DZjc0kIesGKTlvu66+apCTp0MQf
	M/6mAIRlGxf0tRk11Kxgv6/bfuZ1EWP5CvNif9BLOku+scoi/EHwjQTw
X-Gm-Gg: AYBFou2IgYnwUu6rgdNN89llxe0K3owq+wEBQ5I/ak0y0PjJFQ5fNINttdQ1pH5cP+V
	cXUUh90lz5zvQLXZEVVjSa7poSR28WLcU/6xtcX2sOlpG2Q2O/rFrfg8R7vuHh4/naDAzfI3dZt
	iO9OO+ZvdKG7nJZS57WnxOzmpOccdSyiNlpFQJKEoWhOCamHYJdlR7Ag4EkiMr6lwV0v3V8Pf9P
	2bJOd4M6WBOvTEYuvqlBUa+5al+V902+tUuTC5+XhcgC/rsJZFtLorQX1CML92Vo23uCbTuUCQJ
	rZsJVsiDqUTHCXdi0PfrbZGezuCbaOOv/KJ0rf2+Eo/ebwoDPOM90x9/HVswX99dJk1p7d0+6ZM
	OZWa6o5hwPZgNo6aWSj1HOYqWufUCrBczjM4Vuz0hxE36B4aQroCQqOXZJJRMyGWm6FibACRDeT
	zCStdDUqMNyYLYYpeKZcFc+L+Cl/Mec6W6nBBHjL1amZjsIBte9R/jMo/TRs28XT5uu4JIKXc08
	f+UdPtN6CwMN3gDNYzZN4/9innjVEFi1Aqa5KYvGd7UQAePuctHHmnjB8RuA9ySyfEtaaKWpLst
	1yGFg5MTrYrqJ2s+MHiLY96zILSZcmzvtj6IKVqMmvfhevuw70XcpaRR3v6H4S8=
X-Received: by 2002:a17:903:943:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2edb92cf2b5mr25368335ad.42.1794316884965;
        Tue, 10 Nov 2026 05:21:24 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:24 -0800 (PST)
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
Subject: [PATCH v5 1/7] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Tue, 10 Nov 2026 21:20:48 +0800
Message-ID: <20261110132054.3702-2-ruanjinjie01@gmail.com>
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

An RMID that is freed is held in limbo until its cache occupancy drops
below the threshold, after which it returns to the free list. A request
that fails because of limbo is thus temporary and worth retrying, which
resctrl reports to userspace as -EBUSY. A request that fails because
every RMID is in use is permanent and reported as -ENOSPC.

Where an RMID is only meaningful together with a CLOSID, a request can
only be satisfied by an RMID belonging to the requested CLOSID, so the
distinction has to be drawn per CLOSID. Instead it is drawn system wide.
-ENOSPC is reported when the free list holds no RMID for the requested
CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
when the free list is empty and another CLOSID has an RMID in limbo,
even when the requested CLOSID has none. Userspace is thus told to give
up on a shortage that may clear on its own, and to retry one that cannot
clear until it removes a group itself.

Architectures where the RMID is independent of the CLOSID always match
the first entry on the free list, so neither case arises there and only
MPAM systems are affected.

Draw the distinction from the number of RMIDs the requested CLOSID has
in limbo where the RMID depends on the CLOSID, and from the system wide
count otherwise. Drop the separate test for an empty free list, which
the search handles on its own.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/monitor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..b8f4e1ff4083 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 	struct rmid_entry *itr;
 	u32 itr_idx, cmp_idx;
 
-	if (list_empty(&rmid_free_lru))
-		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
-
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
 		 * Get the index of this free RMID, and the index it would need
@@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
-	return ERR_PTR(-ENOSPC);
+	/*
+	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
+	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
+	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
+	 * delays the allocation.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
+						       ERR_PTR(-ENOSPC);
+
+	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 }
 
 /**
-- 
2.43.0

