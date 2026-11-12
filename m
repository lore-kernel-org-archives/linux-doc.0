Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524349;
	b=wEpD9HRzNjjNNddfh2kdmIeMwP+oEFM/heSMlBfVLejnI22NL9KbB2OUIklwVQSTKIgV
	 7WugFQWStQuGsTh06NjsdAr/iNOCdJxndP7pLEZdvY410fbIXI+4Yos2FuXTxLBwkKlux
	 6nu1r5IwAHDrmx08tdRpblsQF9HPHx4llLH/hgdngve+cELzR3h0Y3W+dHqO6SHruFoLx
	 F19p5lvtM8yYVoef0hQOPnPlvp5TZwbBg7URrw5wIGESsBWav9vlh7BEPW/I1Yy8A90o5
	 X3UDIPcfuRCAyEeBHqMGHhhYdcXu965ogfu3nMpbK23UqoJXw7Wn4NbF2rexE2x9neg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524349;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
	b=HcT9oglZjREbdWpntIxyBL2d1jb7Ry49SAQD97yGMiKI3628pzXsTbxlVJqTm21csSvc
	 5uROusHQzjADronG0ViTw9p8xD9hOnPa5o5Zt6dL0w+H+KxqUMQg6G5QSZBXH80xKUma8
	 jZHS4VHEu3Bcu+ZLLsEbTgoeiEuIjyaC8Xno2PnIQfYFdxnDdId8aZLKitfx/8XY1YNdt
	 7sXQYybDeNw76KH+7UOiW2WHazBEFcrm6ngnR6fFk/U0KFuNsZrhkXdPzZZsn1912xV/u
	 uApfbJFaRUMj6hy+bQRWf/7J4ScYXKbjndSSkzo0/c7HQ1upWvhh59SSB7ywAcxCMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10FC606A881
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 22:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10FC606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4a15c84c5so4037537b3.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 14:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524348; x=1795129148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
        b=m3p51yPT8zPgwLBEwrNEFsZJE4+Dbk4b9Xdbpn4sGMLy9TmxBV2I5cYCDF6IPZHBxT
         sJB+IUfbS5Dejpbb88Y5Ps/8NeQMW0rb1ZxqIG6UUtnhPkiinShqOxxp5cF5y6yGtn+Y
         kZdVx9bEVm7rRegyyCGXF0swbQ13CiGOXclSr1RILYGJ0y6swbV1Ugi4Bb041PSf16+P
         AmwNoak9P8ET1P0ELKsJ/RpQ896AW0jhVoGK6VNwoiV40WpUKFGQ9V6QZBz5Pcwf0d7m
         p+fUmBntSJqidwWfO++v0SJ78F8h6jDhWFmq/3//b5uMGgqarTYfPjncqNWEeE+674QS
         OvtA==
X-Forwarded-Encrypted: i=1; AL+hErGA3ItYK6EqLDaB2osnm5BhI36CaJa56ZtJHTm8wBbtk9o9asf7aZ85JpXZIA0CeKDf6d81pDPMDGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Onp1Oh7kHz4qdDgLzlOR4V2mhAv5XJ6WS2OjMk8lhHUdeBY4q
	TNnvztkm7pXkI8OLg8eh/aTzPF0Oooaagjsivvy3s2Yf2TKCTLgRbP7M
X-Gm-Gg: AYBFou3zSyJGi54nmDVrx7R7DflgFhyn+EsnKqSs38LY/Khv9SJ3UIFBZpaUeu7iXOl
	IJq8dBWSAu9FuQSUolXbHCuS0S/N3w0jZsESxesKqSS4EEXt9yyByYCRL43eg1yKwgO6s8La5iR
	lQspcoztOPIGXi/t8PoW2FkqalPoLf/4vvUrc8buL7OC/UyNIv0Nd8ZaozhCdbX5QM3ONV/BUFr
	CjyFEdUNZpc99eVPq3dQ5dOwIFcbT+oG4Hi/cNk5tyqaiqi1nVtVZRgqj7skRwb4LHs4tpoa2Mh
	JdkTVPyzki3Us8mVltmIVTEXZzYMwIWJn4z0W68Rzg35VcLPZPNmswZlF0MWoHjPzbxEoa8DCqP
	rKuC1wuuiaAosYiQq+tVTbPwaZnePfok7vc90RhhudszEUi6xMFbW5oeEPZ8Bh8GYIsZJibXw1H
	5QW4Ql6bsWkqy5lcVbE4UMUycj8x8IN7tgMIuqm335QhdwoJDx7/goJGEuSQv6lT/2XFdmtZb9n
	2qRNPKDQBjQVxycxdzJmwPR5nB64+lcEeZ4zE2LsALrCg9q1Qwx1jutZ9RE/E50+nlG5GG4AhLq
	/u5zL3GaOlCZJLH/5hRZShBCqaO6QAXzDkUptUUIIwkKAJ6CEp6LCYyJ2qzFJryYuW8hCPvz/k+
	14aS2sGmX6x3X3ph5HAeTuQrTayFcE8/79jv2qXrcFHgSwmNWJRGFtR2ryC3q1hf8FdhxmCdEiT
	+zj4OPnlkgUrr1w/dloUrIP5ep
X-Received: by 2002:a05:690c:c189:b0:8b3:5f41:3c3c with SMTP id 00721157ae682-8b4aa233286mr6243907b3.17.1794524348062;
        Thu, 12 Nov 2026 14:59:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:07 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 17:58:51 -0500
Subject: [PATCH RFC 01/13] drm/gem-shmem: Map pages for the DMA device
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-powervr-sgx-v1-1-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
To: dri-devel@lists.freedesktop.org, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
 Gabriel Gama <operatingsystemsdepression@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

A DRM device whose DMA goes through another device sets it with
drm_dev_set_dma_dev(). The DMA helper allocates and maps for that
device, and PRIME imports attach with it, but the shmem helper still
maps and unmaps its pages for drm_device.dev, and
drm_gem_shmem_prime_import_no_map() still attaches with it. On such a
device that is a struct device without DMA ops or a DMA mask.

Map and unmap shmem pages, and attach in
drm_gem_shmem_prime_import_no_map(), for drm_dev_dma_dev(), as the DMA
helper and drm_prime do. Nothing changes for drivers that don't set a
DMA device. Of those that do and use the shmem helpers (gud, udl,
gm12u320, appletbdrm), none maps an object's pages through
drm_gem_shmem_get_pages_sgt() or imports with
drm_gem_shmem_prime_import_no_map().

The first user is powervr_sgx, later in this series: behind gma500 its
DRM device is an auxiliary device, and its DMA goes through the GPU's
PCI function.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a3..4bce0a716 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -175,7 +175,7 @@ void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(shmem->base.dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -535,7 +535,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -854,7 +854,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev), sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
 		goto err_free_sgt;
 
@@ -964,7 +964,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 		return obj;
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, drm_dev_dma_dev(dev));
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 

-- 
2.50.1

