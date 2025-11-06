Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54C13D521
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 00:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762390367; cv=none; b=py8qs9zPr94imkEg7bYEqDQS2vME3zfwZUAVfBzfFknaZf6YwSSp7IWrDricUZbE4rvofQr/2hh2O/MHHRigHHmCKQrj+GoGDgKGZc9ofxdvZPSPlDc5ssG4I6b1uVTbQRI6tOC3O6lKrs3NcLRblUgwwVehv8alrG4TrE26Ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762390367; c=relaxed/simple;
	bh=6OeZWmkLzPTDm0Nogt0/O0+112Y2Ks/sc1xjGQfLCtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ci/RaNaWhRIv7U4URWphRq1Xx9bsvzm06XoHuWLLR6B4Pe3ctlv2BmbBy5awCUcnKix3OO7yCZOUvkVzm2OKHETKEaGvr9cYJCJK7pXug9s2oMRsGSxbXGR4Zc4gusUaUJJ9OycHm58BxHwkuK70AZcsPid9X966cXoLQwI7NSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqXEMfoT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqXEMfoT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641018845beso545519a12.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 16:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762390364; x=1762995164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TC3jknw27uusNIMn2p5lG+ecGQ+4uLN2sc869EijWA=;
        b=HqXEMfoT7kF4TVXlp/Hsu51zwuwloi1mrZ+acodJKsyfWxhVDiTNNGGkZGXD+azsWg
         1OXxGLS/V4jlR9QK1TcyrUtlLt3F+ny3ZFHXlzs3/3qgHEuDHKw8ev+TssypIsJHpGBi
         tPGTQrFhLbpguVjZbhe8+g2B7tKMaW/Sxq0EFqBT0iIziJyDcUkTLcek4l9s+cPr7MGB
         bCA+fX2NhSzxbEicep4qIZkQe3UKOG8pemknu59RxCFrxn7B3QOn6Fw+hRBCk2cS9b7U
         VYpeoB85qzQxecmEyaiT8VYcSw/7FQZDgrQec0k7OvBIUyUo8lUdhU0TbV87UEQR1Lx0
         BIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762390364; x=1762995164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TC3jknw27uusNIMn2p5lG+ecGQ+4uLN2sc869EijWA=;
        b=FNgirecX/UgLi8UEMdwd3O/MM7ITdokUauknJzCzS42W6N8UkxjPNpPPS5+yRi/Lcr
         mmvLNKO6EPI9tnP8bh7o69/88HQh/v0lK16bh2fHmt7/6bRtLoSg4qX7hkeZZHGd3azT
         IWEi0eEj8MFnHwTYIqeBqrOkiKLUR59TYquFpWubFBUzwhKc+cezm7cmwcVvNFZMwQS4
         XoIkgAj4BKPJvgyHtZVjXcVmh2EIwcbl0KakYu9NcJUtf+Zcyxi83Jc32wTKaEXd/bid
         JaN3chnSxweVCp3aVNrVMzxVUru24Ny4PaK9RaJautQGfETA31YGEhIXzRiC1i4OtMul
         KVhA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxlG2ltTAJeGvAMScuM+DR7OHg8yO+AodpTNOfLNef3oRGaczxKve0s2OV+bIsQQyLVTDQ2kgykU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEtSHZ399HNOz/VeHUJDUidmrzZ4x4Hl8RjDjImhYQTLz6SZs
	rKjhHEtN/iJL5dikZArNZSewWWULt2ozLpxudiwHf4Xd+9P9U2Hwl6PW
X-Gm-Gg: ASbGnctY1pN1lBsINPcvntCSiCpgk5pYB3WZuiVawJfCIE2DpvjvptQzsCXc8RDrsb5
	jYVCSm1AznP0tNA7r8GUyDs8zP67LCoAg3IoTmc6TVzdJpXT0tnw5c4BUC9ZnFogYgtpvw5CoUx
	VwHzdUiOkTvXAVHDFPbKj6lyoTbq+VOm1BenDrNcaa6+tl71FNudW9YONibS0GSGXm+87Bumn2S
	cBeiI5JcBaKMCdP2aOfg7U6Obi3TOdits7ofbPx2dn3V3pvnUuPf9v4ZuavqQ7+kX08cIh1tR3c
	GRRCUY17aap/l8iOFn6uOBDGBgCzzafW6prYxJRRBoAu5gxtlzEBvtAKrUzQSgx/J2Akm0mZYCn
	hYwr/8xnCqJGw4tca7gGUtCzbLpQCT0jBY/z4UBh2fsoqN5b8jS0BPaOG0kNAW4ASXYopxD8R/i
	e8ChfRFDXulTk5xfnzpiSyGw==
X-Google-Smtp-Source: AGHT+IGyPw3/1ye6s+MutCB7GxPiniSAjUqQCYxPkECNVoFIt+LeekKL8kDCX7wiOXbyde9uL5l1lQ==
X-Received: by 2002:a05:6402:2417:b0:640:af04:d718 with SMTP id 4fb4d7f45d1cf-64105a5c7c8mr4938545a12.30.1762390363532;
        Wed, 05 Nov 2025 16:52:43 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f862697sm476807a12.25.2025.11.05.16.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 16:52:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D7F1D420A685; Thu, 06 Nov 2025 07:52:32 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/ttm: Fix @alloc_flags description
Date: Thu,  6 Nov 2025 07:52:17 +0700
Message-ID: <20251106005217.14026-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=bagasdotme@gmail.com; h=from:subject; bh=6OeZWmkLzPTDm0Nogt0/O0+112Y2Ks/sc1xjGQfLCtE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncH/IOLdgTFFyjsmVl+3nljed/3uFbIm99O3GxYOe+J Yz/uRW9O0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRDj2Gf1qX/599FxLc3dGx 1uPH2qyjp6/3i5n+9A76y6zTvG+h0xKgCg67uoPm/TbK4WuldbNmSKTIGj6bW7dO4s5PFstb12V 4AA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/gpu/drm-mm:40: include/drm/ttm/ttm_device.h:225: ERROR: Unknown target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:43: drivers/gpu/drm/ttm/ttm_device.c:202: ERROR: Unknown target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:73: include/drm/ttm/ttm_pool.h:68: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
Documentation/gpu/drm-mm:76: drivers/gpu/drm/ttm/ttm_pool.c:1070: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]

Fix these by adding missing wildcard on TTM_ALLOCATION_* and
TTM_ALLOCATION_POOL_* in @alloc_flags description.

Fixes: 0af5b6a8f8dd ("drm/ttm: Replace multiple booleans with flags in pool init")
Fixes: 77e19f8d3297 ("drm/ttm: Replace multiple booleans with flags in device init")
Fixes: 402b3a865090 ("drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251105161838.55b962a3@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 drivers/gpu/drm/ttm/ttm_pool.c   | 2 +-
 include/drm/ttm/ttm_device.h     | 2 +-
 include/drm/ttm/ttm_pool.h       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5c10e5fbf43b7f..9a51afaf0749e2 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -199,7 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * @dev: The core kernel device pointer for DMA mappings and allocations.
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
- * @alloc_flags: TTM_ALLOCATION_ flags.
+ * @alloc_flags: TTM_ALLOCATION_* flags.
  *
  * Initializes a struct ttm_device:
  * Returns:
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 97e9ce505cf68d..18b6db015619c0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1067,7 +1067,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
  * @nid: NUMA node to use for allocations
- * @alloc_flags: TTM_ALLOCATION_POOL_ flags
+ * @alloc_flags: TTM_ALLOCATION_POOL_* flags
  *
  * Initialize the pool and its pool types.
  */
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index d016360e5cebbc..5618aef462f21b 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -221,7 +221,7 @@ struct ttm_device {
 	struct list_head device_list;
 
 	/**
-	 * @alloc_flags: TTM_ALLOCATION_ flags.
+	 * @alloc_flags: TTM_ALLOCATION_* flags.
 	 */
 	unsigned int alloc_flags;
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 67c72de913bb9d..233581670e7825 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -64,7 +64,7 @@ struct ttm_pool_type {
  *
  * @dev: the device we allocate pages for
  * @nid: which numa node to use
- * @alloc_flags: TTM_ALLOCATION_POOL_ flags
+ * @alloc_flags: TTM_ALLOCATION_POOL_* flags
  * @caching: pools for each caching/order
  */
 struct ttm_pool {

base-commit: c553832116b8d0039b13ae84d1ed06e7ee4f1fdf
-- 
An old man doll... just what I always wanted! - Clara

