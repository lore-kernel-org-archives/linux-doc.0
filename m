Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC9246BC0;
	Wed, 20 May 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282353; cv=pass; b=OaQRYZ0k0agwD7/aP2K91Lu8wSmocoHDmckQQL/q7/UBlr2GFbiFdtvF+o3qqvMT0hWNQQivZlnhKLUa10feu5jpcY0lIKDvV5fCWLgApsHh9caFi0USl2V0n1S3oIDSuBhQSF+2yc7cWxWDl1TyILA9PPp59KqL89Kv1pMryJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282353; c=relaxed/simple;
	bh=4ZJUUFTusQwCkc4vQzNULFomBO0PaE2rEF2idtusgIk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d3Efh2R+G8cCm+wY3uc+2fa3mEPHX/GEGe5KLLqIxSvY9fbsdgqb/k+W+PZk3YuA6osWJtRnLZhL4SPVsIg7O7hhEyr9DwGopvb6O75uowdSc2HPxKZFFq5/J2vGqhfsRl5sHwuSRZE7iguhNqbbavmZFIFvfYXbAL+9mUXCKXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=kvvcfRON; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kvvcfRON"
ARC-Seal: i=1; a=rsa-sha256; t=1779282330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mEFU9MTKkNY27JHAoO8ryQydruPu/BCUPLQWwIJP2dkxH1SSm+pSltrsyBwl3cPlzsfvvDx0uErVlAg+7M529Lqlw4nHFe4NaikztcN+q2X5k6yH2KNNLCNRlTHptx+vh1k3CwZSoQC8J/yUaNKSgpL0YR/djGJNdHxrFZrGg98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779282330; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u20ZVoKdpbCjyKL7bq7h0GFa0Bhq3tEyLxCBQAy1rGE=; 
	b=YEYnIhD+3TVVCY1DiQMBIw31y8FTAcV8zm36Q+9R7QsYlsGeavI2LX0d7sBoomYzWHWGHkTyQBEF/1VDa4P9IV9fK0vMRaITYJGhEPIc8KFjNaG3AwkZm0GtGnqIZPbUms4Tvv38u3P7HFkCrv+JkyfqDpUnrieokD1Kyd9LLqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779282330;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=u20ZVoKdpbCjyKL7bq7h0GFa0Bhq3tEyLxCBQAy1rGE=;
	b=kvvcfRON8qeDHH/rme6bUJr8mC7+Scb4yxFVY/PAtFEjw4vuH7/uh3F+rFr2aapT
	Wy5M65QqWj43xhhcWENlyfTvIPpH/OFDx9uA71r0dUYQIckMjuxgtRcluh5rtf0TCzR
	tCHgI7V52wgqsZAgcPeos/yQWw5xohRcPjUYWUok=
Received: by mx.zohomail.com with SMTPS id 1779282328033635.7819132771737;
	Wed, 20 May 2026 06:05:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 0/3] Let userspace know about swapped out panthor GEM
 objects
Date: Wed, 20 May 2026 15:04:47 +0200
Message-Id: <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTW6DMBAF4KsgrzuV/3BKVr1H1cXYDMUV4MR2U
 KKIu9eQLiK1C5ZPmvneu7NE0VNix+rOIs0++TCVoF8q5nqcvgh8WzKTXBquJYcTTrkPEWyASG5
 AP0KwBZnR+sHnGzQHbg6Na2qlHCvMKVLnr1vFx+cjp4v9JpdX9/ci0vlSuvPjjFlMBC6Mo8/Hq
 o0jjD45mOiaYR0CvAah2ar1PuUQb9v+WWzP+6fOAjigbgUqQ/Smu3cXhgFtiPha2reCWT6jYgc
 qC+oaoWqitrPmX1Q9o2oHqgpqOHZKCqPx79JlWX4AptGmp8wBAAA=
X-Change-ID: 20260420-panthor-bo-reclaim-observability-970679c9533c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Panthor has recently gained a GEM shrinker. It allows evicting memory
that backs unused GEM objects to swap.

In this series, both fdinfo and Panthor's gems debugfs are extended so
that information on evicted pages can be gathered by users through these
two methods.

---
Changes in v4:
- Change "evicted" memory type documentation to no longer explicitly
  mention swap
- Link to v3: https://patch.msgid.link/20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com

Changes in v3:
- Add documentation for new "evicted" memory type in fdinfo
- Link to v2: https://patch.msgid.link/20260421-panthor-bo-reclaim-observability-v2-0-c9135eedfb6f@collabora.com

Changes in v2:
- Change reclaimed_count to saturate at INT_MAX
- Add "evictions" column to panthor gems debugfs which prints
  reclaimed_count
- Add a patch to reduce the padding of one panthor gems debugfs column a
  bit
- Link to v1: https://patch.msgid.link/20260420-panthor-bo-reclaim-observability-v1-0-a4d1a36ee84f@collabora.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
Cc: linux-doc@vger.kernel.org
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

---
Nicolas Frattaroli (3):
      drm/fdinfo: Add "evicted" memory accounting
      drm/panthor: Implement evicted status for GEM objects
      drm/panthor: Reduce padding in gems debugfs for refcount

 Documentation/gpu/drm-usage-stats.rst |  6 ++++++
 drivers/gpu/drm/drm_file.c            |  8 ++++++++
 drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++----
 drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
 include/drm/drm_file.h                |  2 ++
 include/drm/drm_gem.h                 |  2 ++
 6 files changed, 42 insertions(+), 4 deletions(-)
---
base-commit: 69c95e4c529297c25503e60acba757fba24fdc95
change-id: 20260420-panthor-bo-reclaim-observability-970679c9533c

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

