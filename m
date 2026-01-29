Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569335C184
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769720697; cv=none; b=sJRQZoYybGGkIrcVw52OxCJN8PGf2DlyhNICNK+sOIihwB9SLC0SxnsIsLTl4RDh8BYLmiHOqBilVC86tilxVROxX5oP5XWHEB9lvIpKCcUKnabGzYf/oxboDSdY5XVG9BVZYqem/2q9vukEeGR64N9TsKuua6KhmBHNhyHD2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769720697; c=relaxed/simple;
	bh=V3jcetw4D8mN0UQEcroE5IaVeGXsJTloPdOskFdLl70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBGyi6gXGK64JLTwD8audd8xtzy9yogL5VFrkg7VIsGMLzloORLsWAzoDUDQH0f0aw+aRyMg92vvOFaqL58mqTkC2vXPMnk3ntr5S8wvHMKrbfkEjLAGOj5LyTj1y4+I8gAeeFWI5CW9+5+ZJrHtE6JlXDvraZFyAdunBPEoLAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qC+QQ2Bf; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qC+QQ2Bf"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c5349ba802so140085985a.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1769720691; x=1770325491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFORCx/4rWXlwM5MWzZ4y2ZhtVTmicaaxzmL4W2ym48=;
        b=qC+QQ2BfI5LPjX/qao3rzwQhsN2mA3Hl5tspU/p8ra1TKa08jShwmEd13jhZBGrJLT
         dC9WoER48g/QzZ3u68huExwm8c/iX4Qq/q9AuqFSw0t+22UY+4bKmw/8vYVjL59dU0hq
         sgMPKidtkVAzGkUvSQOMERNFdcHFdtglcIPWxebfBSvbHamvffoUJdJmm0CBarsOPh7u
         VzuZwq5W502DJxVv33LFq2/tGFxwwI2FAe3JRIMwS5D1i9qk1vLoTdTJjOFaAbl1NFEx
         z+a2EBi/qNQ1pO14qLwlKxAL9x+zGT7QEPcCUe3V3NxbVbx2OlchfR695JYBppJUGp0Z
         vMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769720691; x=1770325491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFORCx/4rWXlwM5MWzZ4y2ZhtVTmicaaxzmL4W2ym48=;
        b=PYSV3tXtCMRFIozfQPuCUaKycpt3rnNrhtyvxYzOv7b1sgi1Mzd6KTiHbElQJmExJ9
         cytBcaRj5ETH3EG2gFtYma6ysOyPCaSeZChTNoulUskDFNTDRLMEGhkwLkP+IxNrcB4w
         Bl5IeBGgLHZfQNCIRRioWEWF8wcKEzSChXE7At6i+m9sgoK3s3bqebAXnFVs0ZgHCq4z
         T8YhgJLDuFApV3GfybudgWk6DB4W9pxjee84cpfC1WnZQqpKEur+6ToaQDArY2bJDCYq
         MHb++ez2+d0HmXG8ZWjWyYRgfplINGqZp2TuW/8pxuPxAbyNTYFBonbjZnI/9JF1q/Yb
         bMag==
X-Forwarded-Encrypted: i=1; AJvYcCVByK5Lu1aqPifcDvi1NLaSZ2fJj3lw4TmEJy6koVNUn0Pym7MTyY2eg+if9fAV+FcX16Tydp0f3+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JgSbC6m22t4sqRJoL+vSYy3jGNMm5koLX7B7NvWIqqnxyiTx
	T+Tmyu9HG4r6Tio/d3FuorrRUL+TV3yzxOff0U9o7M7IqkmNWow6La8NpiZm1w17no0=
X-Gm-Gg: AZuq6aJDFNwPTIN3LT7VRseCU6z4qxaFe6mxsuQZ1ybr2htMtSbyyQb/A9cxJxlDFWq
	s3HnPjitAyfkYZtKqOoHMVu9bHvFFuHl9f4ugWDz6yVCBCkCa1xQ0t8pyFLFi9Ong6vCATkiFRH
	vXg16rJfoAMptwIksMp1UsmeUk5e2WLGtiwD0PMNBY3AYqVNZ6HLV82jcJcdQh5LfN0IWdgW20d
	npCc132qv0lnEYp5QrtlXxdUTcsh0T1m1gJIQ047dmSESjbRK3Q9ileVr/ziSO7ACI1fkXtQHMK
	ALPTZA6kbzipBko6go/xqiGeus6qcbpmlpSbp9QTa7AWvxjwoOSE6mrknz5tOloVzESWH+8wJVY
	9TCGI/SZCQWhT23JAwv8gso153C+7UTnVbP8Bg9LFc0ZD+R0wP2iGFePnwoAPAVbMrow3WN3Vme
	vl3HdDLqEtaUiYt1pDmitjxwz+BDQ/xSZSGIqDxzEgB3MoV6aYt9vnLeIn8967q5AVRzVCRF8iQ
	RA=
X-Received: by 2002:a05:620a:298d:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8c9eb3119c3mr144724885a.64.1769720690713;
        Thu, 29 Jan 2026 13:04:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c71b859eaesm282041685a.46.2026.01.29.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:04:50 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	willy@infradead.org,
	jack@suse.cz,
	terry.bowman@amd.com,
	john@jagalactic.com,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCH 1/9] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Thu, 29 Jan 2026 16:04:34 -0500
Message-ID: <20260129210442.3951412-2-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129210442.3951412-1-gourry@gourry.net>
References: <20260129210442.3951412-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify online_memory_block() to accept the online type through its arg
parameter rather than calling mhp_get_default_online_type() internally.
This prepares for allowing callers to specify explicit online types.

Update the caller in add_memory_resource() to pass the default online
type via a local variable.

No functional change.

Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index bc805029da51..87796b617d9e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1337,7 +1337,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	int *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1578,8 +1580,12 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+	if (mhp_get_default_online_type() != MMOP_OFFLINE) {
+		int online_type = mhp_get_default_online_type();
+
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
+	}
 
 	return ret;
 error:
-- 
2.52.0

