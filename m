Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230805;
	b=bXX278eWP8CO+TVxeQv2fxHlGyG34e0yKNplJxeO5VrwhRWFa3mEfSzozuwr1wPvyVnm
	 Z0E0+som3C9Sn9zy7goacWFRDHEfeGQEV/Qlxp9eY2TCYOzhJzGCrggGdq5UKplmHN/D6
	 c2o/hVVfzWaxmJLku6UojsyMZTieJEQR3XtX54CY+1jwwRdgJZcc9JcZifs+xYrKyOLKS
	 04lSRXutdRbWTZz3jnfOgE5EFJECzVvuzeS5GRwd5iXHF+tEM+Sh5ntwRZZQvVXt8WAR2
	 IvvZHQ4PrzpUNQlpiJcHFLnUDV2im0NEGmtcuIN3taRu2rvTgOaSlRQiUlBp1llMvEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
	b=fQNcepGcw8m5HFKiu8vSi+wllRvAY9fJ4vsewgKwneVMgJKFUWZIq5sWQbv8LhTHntTM
	 cXVyTwzB/fGjMNEi+k0i5zAVSge2VjgUKMAws/GLlsYKyH6XeTth1zTlBZDpqiPxfAbsr
	 zWg9kvxa5smzOoJ03RSiM54exqKpMlgYpZCBi06PZAPBnrCPcBGUtlNjQR3yFlPDkKvwa
	 r0E8GqaNO80q1Rg08vORs+8rtoR3sjmHy0P8SMK2kuV41Y8QuhYbY8/m3BOJURQAXRicj
	 EvBbXiXvQK8IlDVRcY0M/8aD8MEDHObJyLsAyxnDwU6OwB1bsc6oGC1xK94GfHyqwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQoj7NmX;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F659606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F659606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQoj7NmX
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b271e573adso289810b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230805; x=1794835605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=IQoj7NmXTZ+PlHV42kJdLzgYj7aWszNCpuFVutnju9Pptd9nMwXi/+sNM/fQ6kuaMu
         LeiRDUn8kLwEJ1PzbGr6d2MGUmGoGDWB9y1WdYy/VJonUHVI9l/K1OzJSJ4Ftd8Z7XZZ
         8IkFjuBbeioJYU+IVBMEWRIVGR9tQ3L2DKvKmt4CFzByIaQuvDo6o0Bjh8tuP3SI/QIc
         8ew3Y8oxg4FkW+/zBuEjPpmAKmBpGn7qzIYebco5b4qR9KCgN12b1BbT5lLmFDwxZeWb
         L6SGe1tibHbn/43wi+bfRdCk4TyCQ5zcOLvgw0R+GgnssfTXfIPR1JIFPsFZQ2yztEZB
         F3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230805; x=1794835605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=2DsykQH5Wc5Eh6VK5OWyUFlHOO2AWRUR9aQRPiySG29HtTmLn6PrJF8T8wuAisQ0pl
         QJuJnuhWbq0DI5aDx1W5JauBB5miTVJ3gjIGU5GhHk9+E/s4Y6dE2o22SQCKsx2wfNKu
         ELyNXhtEOPdgjOtv3tODjGnaB54aYtoRGJc4IC1b/Z8lf6G87Hw14LcMRF3NC4i8cd7h
         dlQh/1J0yMwFTiOcEPR9NgdxbD0Ss1ZpouLDrXertvD5rOPuWpi7zXGkd6kmRib06CTK
         dcS1Shv4wyXXUWpuMzTe+pexwspZVRWZnFsSL3i8AvsT+1Uq/fnqS0an08rEi7x2YchN
         idAA==
X-Forwarded-Encrypted: i=1; AL+hErHyVX1l+J0N11eyLQYbbTHX21tq48HPje0LfzeqJTuLzja8D4Sq4XKvgbepqcws6gqS8frclH3te9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eW8WxwFic+PTKtM3MlaoQwEeewxDtr7C2ICAFFaZhsuoqVrnR
	t25IWGp6KXbLfK3V7J3Q5L6dbJegutCW7816KtlW6z0aNDcjXULQmpFw2zWdHg==
X-Gm-Gg: AYBFou1uoGfpdgGlbR2N4mt729ncB7Z3/lICBvSqBdRbEnF7vdPmZU0OtnFuA4smytW
	tgLGtJ47cVLdOe4ix36Ige7IbkcCY/4AEOHw6tS0L8cbx2vNLPcl+tODzR8CZMCReTr+18oQtvf
	fAvfSFpOJr9HZHg2qCA0vMyiCXjcSOoOkZ5IERFPNJdkHRuYnr5guYqRwp7JIkQwdpSTI8bXToV
	iYq/dRPU4xlte0rj9R11XxntZ/OVjwxn19M3r0ae5HSDEk2D0UlY35w3t8VgNBaD9r9vKwlbz//
	mjy+onAoOvkd0Ph+tcsoji/HYHrMckRc32ZlTavm3yBqk2qohVjOD5rNql59MT7VGePFDpqLZqP
	BbNiw97wpneBmsCphfs0RHUHQk3IV0mr2baoy7bJp/EGP4wQS/RV9MGdYVYQsy2B8dLQwl2YHtk
	QbxmPwqeWHqGXeDpfXf9OVUqAageaKUWSTQFTGISsMokpETGEYtII5zpEzrPNLzjQEemRC8cAHk
	EaW05yWaZP2+fBRh8ybW4magsXGJt9qItLI2u5FTEquCKl2Qmvo7ydBuHzX+T5bu5NwDlYj+tIC
	aNVmmJlIl2EyJMnx5o3D4xTb674FxZMD/9h5dUYR4d8tHUHv2WLnbZ7fyk3Km5rlAssoOtx0wOJ
	EirK+xn9+
X-Received: by 2002:a05:6a21:8217:b0:3e1:c716:3a00 with SMTP id adf61e73a8af0-3eed3013545mr4660990637.53.1794230804815;
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 2/6] fs/resctrl: Do not update bandwidth from a failed counter read
Date: Mon,  9 Nov 2026 21:26:17 +0800
Message-ID: <20261109132621.3862497-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

mbm_update_one_event() reads a monitoring group's counter once per
second and updates the bandwidth used by the MBA software controller
through mbm_bw_count().

When the read fails, rmid_read::err is set and the accumulated counter
value stays zero, but mbm_bw_count() runs anyway. Subtracting the
previous sample from zero wraps to a huge value, which becomes the
group's bandwidth; the controller then moves the control the wrong
way. The failure is reachable with assignable counters, where a group
has no counter for the event once the shared pool is exhausted.

Update the bandwidth only when the read succeeded. A failed read keeps
the previous bandwidth; the counter keeps accumulating, so the next
successful sample spans the failed interval and is larger. The
controller steps down once and recovers on the next round.

Fixes: 2c272fadb58b ("x86/resctrl: Compute memory bandwidth for all supported events")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # v6.14+
---
 fs/resctrl/monitor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index dbc6770508e6..2319e8e619bd 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -788,10 +788,11 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	__mon_event_count(rdtgrp, &rr);
 
 	/*
-	 * If the software controller is enabled, compute the
-	 * bandwidth for this event id.
+	 * If the software controller is enabled, compute the bandwidth for
+	 * this event id. Do not update it when the counter could not be read:
+	 * that would store a bogus zero sample as the previous bandwidth.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && !rr.err)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
-- 
2.43.0

