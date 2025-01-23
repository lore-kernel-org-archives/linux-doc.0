Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA421D4612;
	Thu, 23 Jan 2025 22:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672866; cv=pass; b=Q0vUiEFTi/fR04N6EEVqh7YjqBz0vVUXwPbsoa4kxuCJhg9zR7d2U4bouMS+eMOAW1ODyJzCYMllIp+NHD+hK69R306+AK+cXh/vrV7sF7a6OmIeXhkDp8G50zISwYEErJ4A5wzr//njEeVuDZ9tBynA01ozJEVbh6cbgrtgpgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672866; c=relaxed/simple;
	bh=jrNlNCNHf1yP+tuV6rZSTCmEmYs5GkrtVc44fbJPApM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YWmVlUeQvcGrGlJMhZRgW8/o0lHtZ5vQ19hf54BlvEsNaQaI+0pW3z+uOd5m964b9MyNljmXZ7qG8Ta9NenNB4PnQJa93dMcJV0H6Zytecg8KzZ1dgI6iKU9HBmx7UhCqxQGZ5/9kuFgRvoQVzhkL3pxBMV3k9CbpFeuPi9g+AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=bH7KcuMk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bH7KcuMk"
ARC-Seal: i=1; a=rsa-sha256; t=1737672836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mok435x0/bUrcJkNUc6ferk6pHOVxPx112XT1tnHl6SuqBl9lIik6/U3+RyCCymtp0HHyr9fJX/Nv5/zNfAyXrUFSzIFsDuCvKLTytb36CocqnvjJCyDqcCIKM//WCG+CL+CM/JDuuaIfXCxxlZAr+6QpVWM2ddq7Sl3MD1xzhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737672836; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/+Wx9HugEM3I27ttx6oMb0CTHpO3RziETvHDF5Mr8n8=; 
	b=l+TgtUIAvcKctgHWveOg544jGYWgHzBL+YgIcYny31hD9uNbSCvgRfQassZN3TgF6u6/IRKhMOWj8JSk8XY6GMI9J+0tnEMF3cCFRxvq6WanvpveSrTb2MbCwbRJncl/iNQDxCRLylPjkp77ktzdd/pG6Em1FR7t7XIdcxJMmgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672836;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/+Wx9HugEM3I27ttx6oMb0CTHpO3RziETvHDF5Mr8n8=;
	b=bH7KcuMkFq3KLSJiCUAB+SYjWyi8d7QkVviMJMK+OO/euwPbOVdKHo7/SvROQoOh
	nBlmLNrbauNl9/uz11HPS/CMLrLUZgz5rweOrfKqDOft6Gof403DQX8vBbP3xVGhGEI
	v+LMsNLUn7B30I5WxjePZuieaSdqboLTlRV0fG7M=
Received: by mx.zohomail.com with SMTPS id 1737672825138648.4539861650047;
	Thu, 23 Jan 2025 14:53:45 -0800 (PST)
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
Subject: [PATCH v9 0/5] drm/panthor: Display size of internal kernel BOs through fdinfo
Date: Thu, 23 Jan 2025 22:52:57 +0000
Message-ID: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series enables display of the size of driver-owned shmem BO's that aren't
exposed to userspace through a DRM handle. Also fixes a use-after-free bug in the
existing fdinfo implementation for Panthor.

Discussion of previous revision can be found here [1].

Changelog:
v9:
 - Added proper locking around group pool xarray to prevent UAF errors.
 - Added proper locking around vms pool xarray loop for the same reason
 - Added new patch that fixes UAF error because no locking when accessing 
   fdinfo group stats.
 - Some minor cosmetic and naming changes.
v8:
 - Made print_size public and added prefix argument for drm_print_memory_stats
 - Updated documentation commit to reflect new name tags
 - Some minor polishing
v7:
 - Added new commit: mentions the formation rules for driver-specific fdinfo keys
 - Added new commit: adds a helper that lets driver print memory size key:value
   pairs with their driver name as a prefix.
 - Modified later commits to make use of the previous ones.
 - Deleted mentions of now unnecessary memory keys in the old revision.
v6:
 - Replace up_write witnh up_read, which was left out in the previous version
 - Fixed some minor comment and documentation issues reported by the kernel test robot
v5:
 - Replaced down_write semaphore with the read flavour
 - Fixed typo and added explicit description for drm-shared-internal in
 the fdinfo documentation file for Panthor.
v4:
 - Remove unrelated formating fix
 - Moved calculating overall size of a group's kernel BO's into
 its own static helper.
 - Renamed group kernel BO's size aggregation function to better
 reflect its actual responsibility.

[1] https://lore.kernel.org/dri-devel/20250114173406.3060248-1-adrian.larumbe@collabora.com/

Adrián Larumbe (5):
  Documentation/gpu: Clarify format of driver-specific fidnfo keys
  drm/file: Add fdinfo helper for printing regions with prefix
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
  drm/panthor: Fix race condition when gathering fdinfo group samples

 Documentation/gpu/drm-usage-stats.rst   |  5 ++-
 Documentation/gpu/panthor.rst           | 10 +++++
 drivers/gpu/drm/drm_file.c              | 27 ++++++++----
 drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 36 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 58 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  3 ++
 include/drm/drm_file.h                  |  5 +++
 11 files changed, 179 insertions(+), 10 deletions(-)


base-commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2
-- 
2.47.1

