Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B121B654E
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224794; cv=none; b=k8MJP4692LdBeA9RjJqXTemy4Xug74Hd08otsm4r/gR9zhi/SADBszx7YQ/mNJ1BSiRK61rdeybLXdpd8HdL1Ajwt/VmDQJoLWdKfUOehybodGFYaSV7CuRhymEQadUPs2o0Ka29bMX5NWsDlShOdAUPXRuqK+mCjGANaaERMRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224794; c=relaxed/simple;
	bh=xzKTSbBUCxwnUpKs8six5ekb8eTkm5n7sI9qBsfTSxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNwovPj4rmdBmWn8UydHBRkRP6NLUHSqyzb0vwOV3KQNWsPfTQ7E1DRFZpk2I+2lIHSWZ5N/4z0Vmec6X3soZV67ggMj8uR9fhc8oHkGecS86nPhCXPHZ9WM9+Kah86qmVTsO0tnSNrTOK5X4heKhRbmZiLKZlydtkrloZ5WNKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=imAvc603; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="imAvc603"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stErXlsn4bG59ZiuP1S49NzWKfcbkIn79Ht3IKYskFI=;
	b=imAvc6039HHRTlBiXxdeLT5yacl5XBOz960QSGpoKCWdEK4EostirkMhRfQflqtt+SXZON
	dXa+YqvxITZfzclzQ6X207Q/9gZyL9xn6l62AhEjGLdu0n1gynCldk+5Q8hqrHwnM6q5ZX
	6lBGvKbgydYSj8jrAAbmP8O03PDZgyY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-FeVjuMuiM7aNiKCQZ9a6dw-1; Wed, 21 Aug 2024 03:19:48 -0400
X-MC-Unique: FeVjuMuiM7aNiKCQZ9a6dw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a66b52c944so134588285a.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 00:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224788; x=1724829588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stErXlsn4bG59ZiuP1S49NzWKfcbkIn79Ht3IKYskFI=;
        b=rkYjyMPujYV8+8Hkd1g90cnyZM16OYTz9Nh58/g7/gNvs/DQwCvI/Q4cm1JWpRShGW
         pQ/DSZ0967RT0qYn+75bixYTaNyPmnH1pqTohmk3bIvyTSsmP5FAaAr5ueS6fEzFexFJ
         kMn9NjSRALM22GoCgc5kMkEEkQ6eHMSiC5pU21UkUXhWiz0xQfiMH2SM6VDNHl4J8hvO
         kfo7Cw6kRTngzEEgM91an66F9tmrYsxqoMTbg3albFgZpo39CFH/8DetmS8uEDRt6dQ3
         Lp+0IC738Eyx7dhUQvRmtodChiF1ykdrOgnRpAGz/RWPf+TNl0i1Xq+cokfsO2zBGJE6
         O6gw==
X-Gm-Message-State: AOJu0YwMSWz7qh6QRM3K/TSKGdu/gmbxcVOvVMgb62wzhBn0bo+X+kmx
	fOPAJa1LY4nQnYO2VS7QTI06qDYyxZACn8p1DS3SokesKz6VnkdoB+i5chXJ10od0OpuLYmt5Qq
	7Nk9+bTTclu5b/xAD0jEIx3VVHtGyu9SDt5q3WtCqTorzNIYe+zta//1nPw==
X-Received: by 2002:a05:620a:17a1:b0:7a1:ccfb:faf with SMTP id af79cd13be357-7a674048908mr211361585a.38.1724224788361;
        Wed, 21 Aug 2024 00:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUvUNVPoVPY0IqYI+9FyKN/j3iG1JNGhE8e2W6Pqxb+HWSkXXSyWApzCMJK3GHPcsNkvlKfQ==
X-Received: by 2002:a05:620a:17a1:b0:7a1:ccfb:faf with SMTP id af79cd13be357-7a674048908mr211356885a.38.1724224787793;
        Wed, 21 Aug 2024 00:19:47 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:19:46 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Jens Axboe <axboe@kernel.dk>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Philipp Stanner <pstanner@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v2 9/9] PCI: Remove pcim_iounmap_regions()
Date: Wed, 21 Aug 2024 09:18:42 +0200
Message-ID: <20240821071842.8591-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821071842.8591-2-pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of pcim_iounmap_regions() have been removed by now.

Remove pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pci/devres.c                          | 21 -------------------
 include/linux/pci.h                           |  1 -
 3 files changed, 23 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..525f08694984 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -397,7 +397,6 @@ PCI
   pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
   pcim_iomap_table()		: array of mapped addresses indexed by BAR
   pcim_iounmap()		: do iounmap() on a single BAR
-  pcim_iounmap_regions()	: do iounmap() and release_region() on multiple BARs
   pcim_pin_device()		: keep PCI device enabled after release
   pcim_set_mwi()		: enable Memory-Write-Invalidate PCI transaction
 
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 4dbba385e6b4..022c0bb243ad 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -1013,27 +1013,6 @@ int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 }
 EXPORT_SYMBOL(pcim_iomap_regions_request_all);
 
-/**
- * pcim_iounmap_regions - Unmap and release PCI BARs
- * @pdev: PCI device to map IO resources for
- * @mask: Mask of BARs to unmap and release
- *
- * Unmap and release regions specified by @mask.
- */
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
-{
-	int i;
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (!mask_contains_bar(mask, i))
-			continue;
-
-		pcim_iounmap_region(pdev, i);
-		pcim_remove_bar_from_legacy_table(pdev, i);
-	}
-}
-EXPORT_SYMBOL(pcim_iounmap_regions);
-
 /**
  * pcim_iomap_range - Create a ranged __iomap mapping within a PCI BAR
  * @pdev: PCI device to map IO resources for
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9625d8a7b655..6c60f063c672 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2301,7 +2301,6 @@ void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
 				unsigned long offset, unsigned long len);
 
-- 
2.46.0

