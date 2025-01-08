Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F561AA1EE;
	Wed,  8 Jan 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370224; cv=pass; b=g7HAEY1pKfIBe0rI173MZSoCnXNOV9W/cvlrBUQXh9pl5HzBBnxfqo6l9Wq+I1m+BcZigDhSonpf2fgzAb62XpfTm172A6RfkgfVPX0dqT+BCfOlvMLJDFpcujJOmYgSAAZbIMTKW4a/IoZKhyjUFcuarHBE6CA8mtJkFsFnBnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370224; c=relaxed/simple;
	bh=kwYXGj8le+8tNnmlVme6L6fNDDP2AXNqmwPWAPDxOzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=USTgrqViDkF7a6TbHY64fniuwx4yhy2nf4IIITXVnl8dpaNeM/3SvKsSMsRw1c35d8r/jrsWXSmBiYpwUM+S/RZ6M43jNsi9bavqONRCxBR/P3KflIE5nnls1dSuujlvBeLoSY1drPhWT3EBpLFdPCKpMlqQXEnMOjM59U/AXy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=H1jrQ0a4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="H1jrQ0a4"
ARC-Seal: i=1; a=rsa-sha256; t=1736370205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P500xAtFDJTFkCrB5mo2ryAiZnppqagMcb0ioQUTAHvD5IPsUe8Yd1k9HK8MnmhrLdCOptzHzkehp2H2x/7TyxdrtYMOiWsy75E4edT/WN5SfcqCbgBhxs3xEGuxqWMsXBH3KxkoYr6l54q5/23GTEdVL6UdhQf6nf2NYHfKY8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736370205; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+oi/e++O3oDN3hqdCQOV8nfEvp8meaqDp8hcbFazB84=; 
	b=B8nHwbRfmcPtTls7EJjS5McqSpbHtPBlcNQLN0JAd9UiEWgbICwKCwGKPDumoGb2Is4NVzmYFSaOKn2Q6bJioxAfshuBjv8F/44KF/liRhZfBc0juuQMDxY/44fO0I7r3NYs/ToHpK4A5vYSb7TBqIGtXjClprYOgj5i6EsGqXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370205;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+oi/e++O3oDN3hqdCQOV8nfEvp8meaqDp8hcbFazB84=;
	b=H1jrQ0a4u4GXLCnW9iq2dtJc6djs6uBtwr5GrqhyZ859BHSiO4OAiEbbAazc2Jnj
	0Fsg94MOR4HXcqp6L9PTvYg2152g0H6zVLW4gtbV1q8Rzm2WVCsiw6N2hCeOeRdtD/g
	ab63xuUf7BTBq7/yBonL+D46IASflmqROualGVtk=
Received: by mx.zohomail.com with SMTPS id 1736370204107328.78405409028403;
	Wed, 8 Jan 2025 13:03:24 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] drm/panthor: Display size of internal kernel BOs through fdinfo
Date: Wed,  8 Jan 2025 21:02:37 +0000
Message-ID: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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
exposed to userspace through a DRM handle.

Discussion of previous revision can be found here [1].

Changelog:
v7:
 - Added new commit: mentions the formation rules for driver-specific fdinfo keys
 - Added new commit: adds a helper that lets driver print memory size key:value
   pairs with their driver name as a prefix.
 - Modified later commits to make use of the previous ones.
 - Deleted mentions of now unnecessary memory keys in the old revision.
v6:
 - Replace up_write with up_read, which was left out in the previous version
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

[1] https://lore.kernel.org/dri-devel/20250102203817.956790-1-adrian.larumbe@collabora.com/

Adrián Larumbe (4):
  Documentation/gpu: Clarify format of driver-specific fidnfo keys
  drm/file: Add driver-specific memory region key printing helper
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of drm-*-internal memory tags

 Documentation/gpu/drm-usage-stats.rst   |  5 ++-
 Documentation/gpu/panthor.rst           | 10 +++++
 drivers/gpu/drm/drm_file.c              | 60 +++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_drv.c   | 13 ++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 34 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 51 ++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  2 +
 include/drm/drm_file.h                  |  2 +
 11 files changed, 198 insertions(+), 10 deletions(-)


base-commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2
-- 
2.47.1

