Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A3A193084
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723197280; cv=none; b=PxD9k6c1ZiDnAkVjAGlrTkN67n+AnzNBjG9nU6UzNgFwzDdAAIUAI83pVfftIO9+4ukrUgCjkzghOUN0baZBeJpI+4lNe0SH4TSiex5Yl7GqOcvkiBZ6h6DcPGwz33aET1r4wJ1HXgTgoRUsMHtfprpsHvWxVHa3Pis8VRMeMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723197280; c=relaxed/simple;
	bh=xJ86mrvynAe99UrnLkIu1EHSKyB0aE6RkOOA/aLdCYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNz6sMr1fT3T4IK/9hnWDEye1bOMw4v90vMUH1BU4pBd/n6CVxfVyttAFRj0Eh6EFIDVEg97bXmC8e2MUwAjPfy6yzDMPP3LxxtH+DNWT228T6Cln+0Kre0vrWROnx7mA0L/cMmf2wRWV6wBJy4fghGOMsTdKcL/j9fOwptj66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7RiH4yX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7RiH4yX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723197278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zpcp771OskatVYXZisRNAltmkrv7cYnDZw6pclj2zoU=;
	b=Q7RiH4yX5wr+hGyL5yGP85D1BgH6iwhWrTZx3sslv8t7SDL/vDYG6GEtAo5+nwTTGKpcUE
	WTR+SHexJZN+8Sd9JPkpbUX9VD7/mw5sS5OHhqlKvYOvUr9r5am97vkhbjqeVmEn0y8Nb8
	oFg36b3vhTFSux2jgYe656MuQLTteu4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-wQ-3daChNgCUhE53UaWhIQ-1; Fri, 09 Aug 2024 05:54:36 -0400
X-MC-Unique: wQ-3daChNgCUhE53UaWhIQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428e4f08510so3700715e9.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 02:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723197275; x=1723802075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zpcp771OskatVYXZisRNAltmkrv7cYnDZw6pclj2zoU=;
        b=Yqk35gO7TSrAOu7PuG7qPxnni8hbKSq4XgYo/WaJUc9g/RYtcGDR2F1gEgENxtzOeo
         TmIUSUZyivxmoLHwaUFUNawVoYuAvbUfpbLefyj3qckRwx0MfCF47+63mmpWNGE8+FEt
         bxX80koWBU6jidVqI+jUsvfXEnlqh7DoaGjT952840txtPFcdxgkuwnHn6eWUROt8327
         GzfPeZs+f2DV4AlkkQOeJqfUnv3NohMn+OFTN+zlWPYBwbaJatdFW9TE5pOY6W2o/yMq
         ejzhG81rwhd1NhxNn8RC9XL3iXsDxPrH4deSpgndEb+xJbEvLNTqGqgR3wVBgw0A+8zb
         2x4A==
X-Gm-Message-State: AOJu0Ywgeg2wHJ96/jTqaN1CukyJg/JrJw9U0L+ojr+m9FpkWCWlBSWn
	maoCxffuMhxFnjOqxsa00hToaxIMgz4XomAuN9pJ5s0c1Sa2kRVMBoCkTfJEoTiryOKF6Ts0Zcj
	r37LO/QMmWj6NG/vT93sqkQDuamydu7TmA5FGOpbpQpeOFuA1iUHlijzT1g==
X-Received: by 2002:a05:6000:154b:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-36d5f3c5967mr579284f8f.1.1723197275286;
        Fri, 09 Aug 2024 02:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbGj5OVH3QAXRiEyZbBBhYCOVFAe/3JWA153ZxR0FYY6oLccO7DnrbGzPCX+nTOqZMIKtNGw==
X-Received: by 2002:a05:6000:154b:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-36d5f3c5967mr579264f8f.1.1723197274756;
        Fri, 09 Aug 2024 02:54:34 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d272290e6sm4708543f8f.99.2024.08.09.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:54:34 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH RESEND] Documentation: devres: fix error about PCI devres
Date: Fri,  9 Aug 2024 11:52:48 +0200
Message-ID: <20240809095248.14220-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation states that pcim_enable_device() will make "all PCI
ops" managed. This is totally false, only a small subset of PCI
functions become managed that way. Implicating otherwise has caused at
least one bug so far, namely in commit 8558de401b5f ("drm/vboxvideo: use
managed pci functions").

Change the function summary so the functions dangerous behavior becomes
obvious.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
+CC PCI and Bjorn.

Bjorn, btw. neither PCI nor you are printed by getmaintainers for the
touched document. Possibly one might want to think about fixing that
somehow.
But I don't think it's a huge deal.
---
 Documentation/driver-api/driver-model/devres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..5f2ee8d717b1 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -391,7 +391,7 @@ PCI
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
 
-  pcim_enable_device()		: after success, all PCI ops become managed
+  pcim_enable_device()		: after success, some PCI ops become managed
   pcim_iomap()			: do iomap() on a single BAR
   pcim_iomap_regions()		: do request_region() and iomap() on multiple BARs
   pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
-- 
2.45.2

