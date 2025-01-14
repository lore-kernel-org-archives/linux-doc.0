Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A231FBC86;
	Tue, 14 Jan 2025 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876116; cv=pass; b=HezbtgnpV9WSoP0GD8MNIqpgbLTk3l4Ja8lRFMs7C0NHUwFm4j+GMjyfGl+NFOMRlWa2td4V4x9jdVwGdP617BkNtrGh49KCFh0PHTvi6WX1DaBI11AKK55jzAzQulGjm2CH3v0FTL16rVeGf/BHVahdO29MNTG6HbfPy/Kisz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876116; c=relaxed/simple;
	bh=+ytlbxanqKXQoq654hT86yilOdoDjjJKwJIt1kbMwPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEOO3bhH61CBQE0h2wYHXXdWamfgE+N247zsizoPZWZss082GohNml/4bDmdFyLfzsUC5yGC8lf3NaRXjX9RIcFzYb7MmTlBGzXLKTEQaZbrCqADzblQ9VM6jQEr/2D1xO59YXotjKpfhzXQebO2A1FZmpdORhGLKZy+x71q6/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=W2rJtHEp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="W2rJtHEp"
ARC-Seal: i=1; a=rsa-sha256; t=1736876089; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OO53ulLxfAOZ5fh1H2Yd5wkJWYtQV1SEMiPLJNWBTb1ElhRsmTtepZRI6h9Rkbn+I4tLMb53vSiPXgU4AZA3DDhAOaAbSMuk0FVfDVgSHAfuyO/E0k0XWXbeCpaWf+kUueA8rsMOTslGls4u8mP5O98A5ejkLT2IpiwPy6lfn0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736876089; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=; 
	b=ha2kO22xPJkMUEC93UCg4w69d1nZO7FkX56m5dROB8qNqepNd1jJUytARrbVxVk8hoBkv1oo3LGYzIY56VDHR64AMd7thsITe2IorJfzGTsSmzjKtkvOlm1urZqxSCDoZR25G1iXRIaV1uEuPHBGOWVvFY4bo68ACtGnhSvdpb8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876089;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=;
	b=W2rJtHEpLUSTLklsNmXnkmH9jLOA5opKKrqfJ7DTgzgCF4lxmbAA5l740JKNWqKA
	4IYRcrVd4I+81qMoLEeZuqHCRX0v4BWgEi1VSGruaZ0XWf6WO+sfYAY5xZ5RQcEAgdF
	8RaDNaxyUT3FTGz38GuHPiaLK/Eyn7qruLNf2360=
Received: by mx.zohomail.com with SMTPS id 1736876087545581.0339826536529;
	Tue, 14 Jan 2025 09:34:47 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v8 4/4] Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
Date: Tue, 14 Jan 2025 17:34:03 +0000
Message-ID: <20250114173406.3060248-5-adrian.larumbe@collabora.com>
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

