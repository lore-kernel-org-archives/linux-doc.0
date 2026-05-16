Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD89A257844
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970895; cv=none; b=dR4h4G1Mhqo04tTAaAksGNqyrKwGBOpKVgUe7ht6Qr1kvmxmQXIq4W36GJ1OOpyCGTC/DHq95S97tHDWjKXbkHKC/kcHoEiPukPKm7nEioEhG5optdsc4qQvRqdwPAYuldHn/tlq8SlsoOZoWnT7axVzdyAQKQ9pQH69LAaand0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970895; c=relaxed/simple;
	bh=aXlE73q//GcSzON4znqAYSwtwAnA9DqVmhttVnIMS18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0j0w3lJs1Ji4sRV9pGgukwwI/w1NA4y+ZaeRFkHvD75Hzd+dO/BE2ax6WtPDhMGPv/zz3SkUUiD9/aWjn8f31WzwJWOzCzce0wCgXB1XJUdeR8yeNqkUaLOXjSVLl28pcEANR/s8I/6oGvjx/T6Wp5ajtB7LfKRUr7xXl22G0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyaZAbcX; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyaZAbcX"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-7c307937816so5013157b3.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970893; x=1779575693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y0N12DjU34jWmR+sp/CB6uBhGDGyyP5fTNvBo/oDgw=;
        b=hyaZAbcXyN5PCgrfxIWsa70WuwnLfz7yu/8lo4k30h45qzh3m/tbt95Igo2m+CoXKl
         U3kLaZ22P8juGLxXxzu4GsfUQVBfq7RjR9PTWUJvS03F+raTIxaSeakPOMAaYZCFNwGL
         bgRbZIzeGE3EIY5C0AzeItekrXvFR0EekTEvud8wrIRwGGD1z5icOzgSIX1XmIfAFBZ6
         yvnnnMIoRHU3eqKQ2ZWFIbbioppc/HVd64IxurgQQuErRFX/t33pIcVy8yDlGwPZFnHZ
         Y0tt8eVp4sa7rsnOT5I7j1pEf/WxonWbrqtUsYXxTEaYMmQ+lc81gK54VLFn0vhUzAuk
         w2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970893; x=1779575693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Y0N12DjU34jWmR+sp/CB6uBhGDGyyP5fTNvBo/oDgw=;
        b=PgWejoHK2zSo7t60yM6yC8OkW9dtEIWJfd/K6z0ImMw2ea06IIKLJ2QKPnNnr/JMrd
         58jmsBuRaSax4KLYdgWm/ZyzU7ELveVIuwFNgjacPTBMmmNvFNAJB8frf9t9MSBxoap+
         dpzM9JgXS5jeGV88xKdmv5GNSblpFR7Czd3Tcff5tmVi//QHOXUVSEHX2m2eDuHKYS0H
         ptPZ66xE+cqaWRnDrsLb4D5c2I5qwAtRFAUTNHTprnjrO4jyYfyGdQKBmSg/EzPFxdhr
         ggPuVIrSVPziUjNlk2Ue4r19AHNsoHlM8+WBm+TOuM7O4USzBJvxmKDDlpCe4vrX8yjR
         JQFg==
X-Forwarded-Encrypted: i=1; AFNElJ+IZBdUU1uKQnEnFA1HkYnZ02RmN7ETGAW62z4G6A1QfTRgDU/65/JTQ2FFxkNr/4XXlIcRXDkTRew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zsfaz7AiZeOtLvdPhWuBhF28ltkzxDPYMRXDqa45ymbwXo+L
	eTeGiJghQDMR0JBh+ufzM1CV2IHZ3Vbgr8J2IQpEmcJic6dDlSNIX9w=
X-Gm-Gg: Acq92OElarreryo71ABU5xCQOr0EIhqW91P3cwcuM+kYiZgeoaUaSp2x5JhEmWQ33Xc
	SpEoeIOU+L2aVLKiAhjic+MUBfftgmLYi9Ae30r50V4qs9Wn14YfAEUEqAC3eBtLnka7aRID6o9
	syqyEL5hmTPaKR5NbvOVtL8VjvgR9LoDyYkQQ44uGgT0mzzhPTda64zcXd2MGXH/n97QB1IUP1G
	FA1bia2RHxNDJwQlGgic1o30aS/9GljlG3sj6yWAWHEgldvIKdAungKytWvbdK3fu8tkTIcIPTX
	9xbJf8GOmWn76poBD/Srt34O0AZnJYD2DvBfUHNdbQrMzoTNlrRCq1N5NMRGz91oa6dXPW3SXjU
	LaExtrCqDLvHSFzxX0IG7Lx833FQX+udu1wuqk1rfUV05zRQmWO14fQ5nkUyKsfCQrghyIte6Vt
	LV+JdMXR0eXXxplfroKdDRiqrWUfsjCLdeQu5/oFOzrNKkXkOfTFU57SiHASqzRP2tos1PMon2o
	w==
X-Received: by 2002:a05:690c:3482:b0:7b2:6b19:df2b with SMTP id 00721157ae682-7c95af50b29mr102598357b3.17.1778970892689;
        Sat, 16 May 2026 15:34:52 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c9b64sm819827b3.1.2026.05.16.15.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:34:52 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	bharata@amd.com
Subject: [RFC PATCH 5/7] mm/damon: add sysfs binding and dispatch hookup for paddr_ibs operations
Date: Sat, 16 May 2026 15:34:30 -0700
Message-ID: <20260516223439.4033-6-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516223439.4033-1-ravis.opensrc@gmail.com>
References: <20260516223439.4033-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend damon_ops_id enum to include DAMON_OPS_PADDR_IBS and add the
corresponding 'paddr_ibs' name to the sysfs ops_names array so users
can select AMD IBS-based PA-mode monitoring via
/sys/kernel/mm/damon/admin/kdamonds/<N>/contexts/<N>/operations.

Route ops that report accesses through the hardware-sampling ring
(currently only DAMON_OPS_PADDR_IBS) through the existing
kdamond_check_reported_accesses() drain path used for page-fault
reports.  A small helper damon_ops_is_hw_hotness() centralises the
classification so any future paddr-family backend that also reports
through the ring just adds a case here.

This routing is bound to ops.id rather than to a separate per-context
flag.  A flag in damon_sample_control would have to be set by the ops
.init callback after damon_select_ops() and would then need to be
preserved by damon_commit_sample_control() across sysfs commits;
deriving from ops.id avoids both pitfalls.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h |  2 ++
 mm/damon/core.c       | 13 ++++++++++++-
 mm/damon/sysfs.c      | 12 +++++++++---
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 35cc3d42fcba8..16da528845d03 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -669,12 +669,14 @@ struct damos {
  * @DAMON_OPS_FVADDR:	Monitoring operations for only fixed ranges of virtual
  *			address spaces
  * @DAMON_OPS_PADDR:	Monitoring operations for the physical address space
+ * @DAMON_OPS_PADDR_IBS:	AMD IBS-based PA-mode monitoring
  * @NR_DAMON_OPS:	Number of monitoring operations implementations
  */
 enum damon_ops_id {
 	DAMON_OPS_VADDR,
 	DAMON_OPS_FVADDR,
 	DAMON_OPS_PADDR,
+	DAMON_OPS_PADDR_IBS,
 	NR_DAMON_OPS,
 };
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 03f9c671e8bc9..2aa031cbc70b7 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -73,6 +73,16 @@ static bool __damon_is_registered_ops(enum damon_ops_id id)
 	return true;
 }
 
+/*
+ * Returns true if the given ops id reports access samples through the
+ * hardware-sampling ring-buffer drain path (rather than its own
+ * .check_accesses callback).
+ */
+static bool damon_ops_is_hw_hotness(enum damon_ops_id id)
+{
+	return id == DAMON_OPS_PADDR_IBS;
+}
+
 /**
  * damon_is_registered_ops() - Check if a given damon_operations is registered.
  * @id:	Id of the damon_operations to check if registered.
@@ -4048,7 +4058,8 @@ static int kdamond_fn(void *data)
 		ctx->passed_sample_intervals++;
 
 		/* todo: make these non-exclusive */
-		if (ctx->sample_control.primitives_enabled.page_fault)
+		if (ctx->sample_control.primitives_enabled.page_fault ||
+		    damon_ops_is_hw_hotness(ctx->ops.id))
 			max_nr_accesses = kdamond_check_reported_accesses(ctx);
 		else if (ctx->ops.check_accesses)
 			max_nr_accesses = ctx->ops.check_accesses(ctx);
diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index fc7256e522a69..261ccf0c61846 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1388,6 +1388,10 @@ static const struct damon_sysfs_ops_name damon_sysfs_ops_names[] = {
 		.ops_id = DAMON_OPS_PADDR,
 		.name = "paddr",
 	},
+	{
+		.ops_id = DAMON_OPS_PADDR_IBS,
+		.name = "paddr_ibs",
+	},
 };
 
 struct damon_sysfs_context {
@@ -2023,7 +2027,8 @@ static int damon_sysfs_add_targets(struct damon_ctx *ctx,
 	int i, err;
 
 	/* Multiple physical address space monitoring targets makes no sense */
-	if (ctx->ops.id == DAMON_OPS_PADDR && sysfs_targets->nr > 1)
+	if ((ctx->ops.id == DAMON_OPS_PADDR ||
+	     ctx->ops.id == DAMON_OPS_PADDR_IBS) && sysfs_targets->nr > 1)
 		return -EINVAL;
 
 	for (i = 0; i < sysfs_targets->nr; i++) {
@@ -2072,8 +2077,9 @@ static int damon_sysfs_apply_inputs(struct damon_ctx *ctx,
 	if (err)
 		return err;
 	ctx->addr_unit = sys_ctx->addr_unit;
-	/* addr_unit is respected by only DAMON_OPS_PADDR */
-	if (sys_ctx->ops_id == DAMON_OPS_PADDR)
+	/* addr_unit is respected by only paddr-family ops */
+	if (sys_ctx->ops_id == DAMON_OPS_PADDR ||
+	    sys_ctx->ops_id == DAMON_OPS_PADDR_IBS)
 		ctx->min_region_sz = max(
 				DAMON_MIN_REGION_SZ / sys_ctx->addr_unit, 1);
 	ctx->pause = sys_ctx->pause;
-- 
2.43.0

