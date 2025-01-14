Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625B1F9F41;
	Tue, 14 Jan 2025 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876111; cv=pass; b=LZW8gDa0hKni5kwXhmA/NHC6Xjpd+l6lrnzKvuU86XlywOlWPamd+E+1WBO3AfqQw4iGJ9sNxwjVh7RioFSFKVYsGlE7FDPgfTajeqrCEdsmDQdjv00Q1223Y7muphtr9CG640PKB+Tka6bUDftyjUNrcmtX5HKe8gIFcryLnR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876111; c=relaxed/simple;
	bh=7Iaw0Q3yfjikZsdb4D4NSwZv5asi4vxfkqwsPAx3gnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIazFtPVXSihNufCgJm8gXOzEuEjD4OBdQovxmDpTL4w4dyo6/64LMPhTdoDhzSINQaC97eMWsAJUKPAO0qnRjHg2PwU+AaJgut+0n6Xa6lhWK8mCLZHzPx9k5E8nsCQjL+3Z8rogGkKt5ETDznt2Cnl22/mu7+PIkbe2SFiy7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=kCV31s9V; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kCV31s9V"
ARC-Seal: i=1; a=rsa-sha256; t=1736876083; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hgY+zvwmFW6eDUT0hSXTJgLovxQllzVoGrxAcZ+wT/htqJhZxrqMPH/ssEnKB4rmfCExIuQaRP6SFzhmRXZ8RMoTZ9H4bSZQ3sMVaHNv2koxp141IeMZdpzZskgTZ/925YuqTyqpC/CrzPLKU5Z0D9Dj1Kc6j82uFjMGEeAWQ0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736876083; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5B2acTEKnWj2iTXPsUJ8KYfflSwtBpaFyWuQX+dPJzY=; 
	b=Cjmx043RYv1bH4iVXbnoPTcvUKdnEat6tbZcZXv7iHhW4NIJkPB7dZDUMOe3LeT9Jc3wipewPFMONR5gatoEy1udCUtZW8YzTca/R2bNn0dFCezgu8ITMIATpSBY4YT3kxGoqHSQ1SW9LaMfwhPlPYphYukDsrL68TaJlXBAqKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876083;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5B2acTEKnWj2iTXPsUJ8KYfflSwtBpaFyWuQX+dPJzY=;
	b=kCV31s9VTjZbfZaEc/mcdYnf4nNd+nj3vdq8NNuPhaQIzKWYnMD/oiiYNSd1UDGG
	TjDtsHsIJScmOsBIqGjm3bDdXpWAGs7RIVM/uNILJZNlNOBW1jFxCzoRkg18DWUcMFn
	SWkXycVJ0A9OawCWhdQkCYOpgYfuWg8TyUaF2ea8=
Received: by mx.zohomail.com with SMTPS id 1736876081679268.3184834354456;
	Tue, 14 Jan 2025 09:34:41 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/4] drm/file: Add fdinfo helper for printing regions with prefix
Date: Tue, 14 Jan 2025 17:34:01 +0000
Message-ID: <20250114173406.3060248-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is motivated by the desire of some drivers (eg. Panthor) to print the
size of internal memory regions with a prefix that reflects the driver
name, as suggested in the previous documentation commit.

That means adding a new argument to print_size and making it available for
DRM users.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/drm_file.c | 27 +++++++++++++++++++--------
 include/drm/drm_file.h     |  5 +++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index cb5f22f5bbb6..f584abcd13cb 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+
+void drm_fdinfo_print_size(struct drm_printer *p,
+			   const char *prefix,
+			   const char *stat,
+			   const char *region,
+			   u64 sz)
 {
 	const char *units[] = {"", " KiB", " MiB"};
 	unsigned u;
@@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char *stat,
 		sz = div_u64(sz, SZ_1K);
 	}
 
-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
+		   prefix, stat, region, sz, units[u]);
 }
+EXPORT_SYMBOL(drm_fdinfo_print_size);
 
 /**
  * drm_print_memory_stats - A helper to print memory stats
@@ -858,15 +864,20 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    enum drm_gem_object_status supported_status,
 			    const char *region)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+	const char *prefix = "drm";
+
+	drm_fdinfo_print_size(p, prefix, "total", region,
+			      stats->private + stats->shared);
+	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
+	drm_fdinfo_print_size(p, prefix, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		drm_fdinfo_print_size(p, prefix, "resident", region,
+				      stats->resident);
 
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		drm_fdinfo_print_size(p, prefix, "purgeable", region,
+				      stats->purgeable);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index f0ef32e9fa5e..001ae553e8c3 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -494,6 +494,11 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+void drm_fdinfo_print_size(struct drm_printer *p,
+				  const char *prefix,
+				  const char *stat,
+				  const char *region,
+				  u64 sz);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.47.1

