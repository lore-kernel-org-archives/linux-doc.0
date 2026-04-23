Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF303C73D0;
	Thu, 23 Apr 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947694; cv=pass; b=u1y1Njgc8x7wNagb0n1GIQ1h6OQIeSszfKfQwJDtCy4JCZ2l8tLzOjsiYSKhvhFc48hvMVlUaLxKx2om6TnAiI8bLipe98gauXEf1A1dNeUe5dGukPETJqSiIpWDSMPF+m4lMOCFbhUYgX1v+SqgR80URpkA7SynPGm5di9q4Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947694; c=relaxed/simple;
	bh=MTL+QawC4jsC04LmSd30l7S8TjV/PgoCQyChN0MHn8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyF3WuiIoQkhuN3if+G1+MvJzRyaBKa/lhkR8cg0UXF4EY37Ybj5Kv6PSnma4s8flDDTsPnsjxMD8gYnRDYCdBBlNYq5app9k2Cs5eoNWEsMGNmW0PqFNzED1bcK7Jxhn5Wttzo+BHwUCvet/7kVRm+RCESbDv90ICw57RiSEVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=XiJzDFU2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XiJzDFU2"
ARC-Seal: i=1; a=rsa-sha256; t=1776947670; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SdR7wqWELDZ/XAjPdj+1SQYOhM6GdE7WoXfTzhIFSn7e7MPXH4XoYUDqg0HgBIGXC21qsI216ExXFSb4Xnqfmcu4e7b4YP0sJI64I/ktYnQWUxMUwU7j5Jhh5iaq+bA0c87UNuh0VXfW+o6h2MMYBtbhBLxmJiTEKQLPWUiFTk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776947670; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9ApbCGrw4JWVWeOXA1lI9/HhWh8d2pfHg6fH85Z5HVY=; 
	b=MW0I7gtkmLPTnH86o/YT6IQKSR9pTqxIEJ1MnPW39a8NB8K8bs6NhZPaYOhsE750xPsS3ks57TQWuiZe09uIBp7vjev1PMDIKhtsp6ifovbCIoAhQMTl+p2GyrQ590AvnN9yrbYJZQ54WERgEcvtK/givEJzJmW5qXThE59H02U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776947669;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9ApbCGrw4JWVWeOXA1lI9/HhWh8d2pfHg6fH85Z5HVY=;
	b=XiJzDFU2PnMn05AL71D4AyumVmZFR0ugRctbCGsLR0Yb+DYBQlWZxRqXMkyfmYHc
	7+bts9RvIwLhjsLnl2JXpCaMqUCRhhxUe0Tkx2EsnMubG+XdaRcA7gD4IP+zM6j2Oj7
	6NTEnEnTzyw5aDWUFQza/BZG+H8eMgR4HDf20dJU=
Received: by mx.zohomail.com with SMTPS id 1776947667572117.05305883514848;
	Thu, 23 Apr 2026 05:34:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 14:33:56 +0200
Subject: [PATCH v3 3/3] drm/panthor: Reduce padding in gems debugfs for
 refcount
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-panthor-bo-reclaim-observability-v3-3-60af32164a4f@collabora.com>
References: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
In-Reply-To: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

The "gems" debugfs file is getting a little too wide for comfort. While
a lot of this is unavoidable due to the theoretical upper limits of
numbers here (e.g. size needs to be 16 chars because 2**48-1 in decimal
is 15 digits, plus one space for separation), the refcount column has a
decent 5 characters to be saved, as it can only ever contain a 10-digit
decimal number.

Reduce the refcount column's width to 11, which fulfils this requirement
with an additional space for separation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index b6fe20b7e6d0..462a9d2ce319 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1644,7 +1644,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 
 	snprintf(creator_info, sizeof(creator_info),
 		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
-	seq_printf(m, "%-32s%-16d%-16d%-11d%-16zd%-16zd0x%-16lx",
+	seq_printf(m, "%-32s%-16d%-11d%-11d%-16zd%-16zd0x%-16lx",
 		   creator_info,
 		   bo->base.name,
 		   refcount,
@@ -1681,8 +1681,8 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 
 	panthor_gem_debugfs_print_flag_names(m);
 
-	seq_puts(m, "created-by                      global-name     refcount        evictions  size            resident-size   file-offset       state      usage       label\n");
-	seq_puts(m, "---------------------------------------------------------------------------------------------------------------------------------------------------------\n");
+	seq_puts(m, "created-by                      global-name     refcount   evictions  size            resident-size   file-offset       state      usage       label\n");
+	seq_puts(m, "----------------------------------------------------------------------------------------------------------------------------------------------------\n");
 
 	scoped_guard(mutex, &ptdev->gems.lock) {
 		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
@@ -1690,7 +1690,7 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 		}
 	}
 
-	seq_puts(m, "=========================================================================================================================================================\n");
+	seq_puts(m, "====================================================================================================================================================\n");
 	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
 		   totals.size, totals.resident, totals.reclaimable);
 }

-- 
2.53.0

