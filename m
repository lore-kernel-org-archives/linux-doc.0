Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0456A1D5CDE;
	Thu, 23 Jan 2025 22:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672894; cv=pass; b=jLAoDX7iWAJPZ9nDje0rhiE2ch5owhyii5b020kOGCmqQkUQtIOZrDMsZXKIHyeDSnNy01yjI0eua0QvSrT6tlLCnlgNH0n37iF0rkYYJfr9gHuOC01mES8V+1WYTS6HZzYtiWIv7cKdE1rfnoqCMrjp4TVvg8W1wPjjCQSi9c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672894; c=relaxed/simple;
	bh=+ytlbxanqKXQoq654hT86yilOdoDjjJKwJIt1kbMwPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsXsRfcWZ5HipA/+aRHxEYkFokyzWwS/PRj/KFlOCYn0Nl725cyGPzB6q8lCyndVabyqpjLp37gjydaFqjecNBlIhnTl/anN/46ni/qPzppMhjkSJ0CQE6NI6asebF0Z9aUlsh/97WyoaQl/6tHZ8PYpjnhCgMA0LFxueQjdf1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=OnUKJ5gO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="OnUKJ5gO"
ARC-Seal: i=1; a=rsa-sha256; t=1737672866; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EgxBKy6VlMxQpqkbL/NBkwhaa210n/xjKDIFHCqyIAJYmnaKajJPai9bfwEntxQE67NW3oVWqfjozTvFB3qkJmxPciK156XzJFyO7oUvb8eBCBpFhXjXf912d0ke1pl3XOlbRDtsRg7oCb16sndNepj1xCV7MUY0rK9CmnLqsS4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737672866; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=; 
	b=hZzPYEMRYTe9HBPQN9+bMdLi9mxjT7VXmnrhvJ3OGRL0FlVUb0hZ9wYmmOckgxAt5T/qtA1MhmtEyzfdh2tzZRc8vLb19sjwECMz7JdMdssYL/oazO38Ro1SPOqTSEmDES0zh4QW0BkmrkdfYBAQ2gqX+4P0rqlzu3Ar7vv1RZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672866;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=;
	b=OnUKJ5gO41GZOsaD0yPVzClsk6KH1jDftfbUwtFX1AdjyNXMPa0Dmzu8LBEsptWd
	BImKk3VevVhx+m4iVstP4jqOOVodgY79Kp0yn8oTeeC3ItQK7kO98l/TmNOtgXyJm4k
	CwNKs9I/P3Y3Rl0kFV82lD5R4vg38yn6r6r2biIU=
Received: by mx.zohomail.com with SMTPS id 1737672844149522.6050164964226;
	Thu, 23 Jan 2025 14:54:04 -0800 (PST)
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
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v9 4/5] Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
Date: Thu, 23 Jan 2025 22:53:01 +0000
Message-ID: <20250123225325.3271764-5-adrian.larumbe@collabora.com>
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

A previous commit enabled display of driver-internal kernel BO sizes
through the device file's fdinfo interface.

Expand the description of the relevant driver-specific key:value pairs
with the definitions of the new panthor-*-memory ones.

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/panthor.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 3f8979fa2b86..7a841741278f 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -26,6 +26,8 @@ the currently possible format options:
      drm-cycles-panthor:     94439687187
      drm-maxfreq-panthor:    1000000000 Hz
      drm-curfreq-panthor:    1000000000 Hz
+     panthor-resident-memory:        10396 KiB
+     panthor-active-memory:  10396 KiB
      drm-total-memory:       16480 KiB
      drm-shared-memory:      0
      drm-active-memory:      16200 KiB
@@ -44,3 +46,11 @@ driver by writing into the appropriate sysfs node::
 
 Where `N` is a bit mask where cycle and timestamp sampling are respectively
 enabled by the first and second bits.
+
+Possible `panthor-*-memory` keys are: `active` and `resident`.
+These values convey the sizes of the internal driver-owned shmem BO's that
+aren't exposed to user-space through a DRM handle, like queue ring buffers,
+sync object arrays and heap chunks. Because they are all allocated and pinned
+at creation time, only `panthor-resident-memory` is necessary to tell us their
+size. `panthor-active-memory` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
-- 
2.47.1

