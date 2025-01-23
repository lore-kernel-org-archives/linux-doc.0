Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044921D47AE;
	Thu, 23 Jan 2025 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672882; cv=pass; b=JLyj4eWqxmxJlhKa60nQpqVPJXakhgGTdV5angLfAUh1Faa9NsS8LlnNZnc10RDNs0kDaDruCuX1bx+aUZoyeJKNSwFBOrfSSRxjzysSGD6q0L3VPcDxqTa1+4/V5GR7XonunLmqwXXJAYav5XJBOzWQGtpq8kezNhG6ziyo0e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672882; c=relaxed/simple;
	bh=Yy9M+ZRa4k5li+1MHclf9l98angTplnxLRipnAzZqPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjPu0WCtFFPD8myOQV3r28b4HGDzaINddkS0kB7u8MNpPrqQ5cbA79ozvlXEOTOHtERyCRPOmU+ord2Mo+zYvZDw0gyyhQghNhnlvgFHW9Vvd/IH+PSgVKtwFQn28LCKPqIoIdFm+Vw1uxkJW/SPEEi9kxzprVtPL7BOHnWxHlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=a2TBWf4I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="a2TBWf4I"
ARC-Seal: i=1; a=rsa-sha256; t=1737672853; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gi13GXaRLRU9maRWP86+GFXOTgMCviEs00iZbWy3TCqNSAK8sriqMlWCuCya1eI/4l0puh2A3EAzf1Ke+VZWHhbsRffM8qxVx0fEjQRVQyDdA48BNhEOKUr+3SEyewVp9zmG9lizLTEpy0IcNHa8zuRJraHR0/p9h5mNW1E1/aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737672853; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SD1qJSXUTw4kumBr+488Guiyeg2rLONe4Exc4Pgmzw8=; 
	b=YaaKbKigMC4fNgWniugVlzLkoB/ebOAYIQTFawhjO9LiRWCYcWikvAvqDQKo6n3w3YU29SAkrpp8QNOwYk6AFRuCbT6r2g0bHoURsu3ev6E5twpwbMksZvxPqYjAr6UETsvOXUEyzmT9LmZBBL7dO7dmHop2LdNlAZk/x6Wb7vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672853;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SD1qJSXUTw4kumBr+488Guiyeg2rLONe4Exc4Pgmzw8=;
	b=a2TBWf4Igvgr6FUPCtcoJsnj0DpccKq3sJgIjUN7sr9IO5xDn4t0JBYz8mOUy8Rp
	WAlrJgFEZZ/5ncsIoYB2t4mLAFjS4k403zgUG+IbXB0RElZ16XHtb26UlvR0zPR2uOy
	Hr8aUgqe5OVT/hR9tSIktgzKjfe8d1DIi1Kshv9M=
Received: by mx.zohomail.com with SMTPS id 1737672848684325.30265129996076;
	Thu, 23 Jan 2025 14:54:08 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v9 5/5] drm/panthor: Fix race condition when gathering fdinfo group samples
Date: Thu, 23 Jan 2025 22:53:02 +0000
Message-ID: <20250123225325.3271764-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
protect access to groups with an xarray lock, which could lead to
use-after-free errors.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e6c08a694e41..1d283b4bab86 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 	if (IS_ERR_OR_NULL(gpool))
 		return;
 
+	xa_lock(&gpool->xa);
 	xa_for_each(&gpool->xa, i, group) {
 		mutex_lock(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
@@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 		group->fdinfo.data.time = 0;
 		mutex_unlock(&group->fdinfo.lock);
 	}
+	xa_unlock(&gpool->xa);
 }
 
 static void group_sync_upd_work(struct work_struct *work)
-- 
2.47.1

