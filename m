Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA81E8849
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287706; cv=none; b=hQvS77k4uR3Ff8Gocbzg93O6yNM+kq6FfMpibU4+4doT82l1M3NQkvM2ElmLyouNqCxKWfu69DhZSu3GZAkjvWcqDyQoAoXtFqU26M3eNBQ1SU7ttzx1Bf6uUonjSrd53REih1dpHwiRHKVLlGQ/sAJBo6YcxCEjlwwgiDgAGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287706; c=relaxed/simple;
	bh=YCSleCRL8+zgmB0F5bhpOuGHDhDr1YVS5o/lIBwlqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHaezfC5dsm/K0mKg4wx9hz62HmDW8nq68BmCq6/KftjMfczQGrCAEU3xkbn76igxP9UqZtW5Ni86WIChMjjpDKrLFY89AzWJmqT0jYHCEut5QoP0G0WREemh4hiCp/4CTW7qXLPNOt95f7MViPnAG1ncws8Ir4Osr9kkixG5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bkdv99AX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bkdv99AX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8Pv00ipT6Qdh9I20/5aALEzhWkgYoXaIfeUPDxIxig=;
	b=bkdv99AX1zJN/9YnJV91+4S2oU+e9CGW3G6xJbsdPeCSba7Nu29ZA0OeRr20HlmCOc342E
	uM4cNk3itITz/lp22P+HrdPrsHB0vRff2iDVHQpDXE/IgqPw/3jMafZzylZ4OKgDL8pkBJ
	2mN6jFpHe8MPsfa9XWo+tU4nLqmDcSU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-XCoDR3EwN5G7YONDiPGlRw-1; Wed, 30 Oct 2024 07:28:20 -0400
X-MC-Unique: XCoDR3EwN5G7YONDiPGlRw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539e0fa6f3dso4940459e87.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287699; x=1730892499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8Pv00ipT6Qdh9I20/5aALEzhWkgYoXaIfeUPDxIxig=;
        b=qOQrGVudZ0exQwMFc+MIyR+OYbYw9RGAeOvNE0SLRLwjXpgmdD3z2AyXF6kD2tN8UJ
         RVZou1wTihNOA57HnLWDNo0JFlV2HKMnuchHK00mPgjd6bHH5JQxIQMhLnrmMQmDLiNW
         x+cEDUI8NKF02y2vmf6JhBdoxrZ1ptzEivDRkO2KYRIMgsH9670frHIsue9OZ/zYtdpP
         V/0WhAZlZMKC7gKMoMCODLn+8v0mLWqMqWozAu/xt0TcexZvH/cfr4hRgL3qDDSdUN2n
         s5n8J3vMFBKanug0rV3hwyWI/CHUopz1i6bY9tdb9qqQkUYQDhy8qeBS9ZZp9EcLD9r+
         x2ZQ==
X-Gm-Message-State: AOJu0Yyf07Lyro25mgSpR9t3FiwYdcBPxUyKI4TIJhFpB6u/Wc1m5FvD
	XEbHHqqZI+n0QjPTdakby3Kj1ThHFyCd0gsPEZ9E6C36Xr8lARpTBmfFCQM4zM5DrL9PlMtxXBM
	HkwvWIBNR6DcR2cYcGUu+mBb461CYheUWEmuWzxpuUNiABu5YBUulVA/+yw==
X-Received: by 2002:a05:6512:3d06:b0:52c:deb9:904b with SMTP id 2adb3069b0e04-53b3491e062mr12333057e87.38.1730287698740;
        Wed, 30 Oct 2024 04:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBPHC+7mDGBZejhuxNPIAbldUy5rOv5CXnQgrngWn35PZTJpvTSwKiUrRZBkTh6tcloHeZoA==
X-Received: by 2002:a05:6512:3d06:b0:52c:deb9:904b with SMTP id 2adb3069b0e04-53b3491e062mr12333000e87.38.1730287698209;
        Wed, 30 Oct 2024 04:28:18 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:17 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Michal Witwicki <michal.witwicki@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v6 03/10] crypto: qat - replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:36 +0100
Message-ID: <20241030112743.104395-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030112743.104395-1-pstanner@redhat.com>
References: <20241030112743.104395-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions_request_all() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
---
 drivers/crypto/intel/qat/qat_420xx/adf_drv.c | 11 ++++++++---
 drivers/crypto/intel/qat/qat_4xxx/adf_drv.c  | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_420xx/adf_drv.c b/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
index f49818a13013..788a11cdb34b 100644
--- a/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
@@ -129,16 +129,21 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* Find and map all the device's BARS */
 	bar_mask = pci_select_bars(pdev, IORESOURCE_MEM) & ADF_GEN4_BAR_MASK;
 
-	ret = pcim_iomap_regions_request_all(pdev, bar_mask, pci_name(pdev));
+	ret = pcim_request_all_regions(pdev, pci_name(pdev));
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to map pci regions.\n");
+		dev_err(&pdev->dev, "Failed to request PCI regions.\n");
 		goto out_err;
 	}
 
 	i = 0;
 	for_each_set_bit(bar_nr, &bar_mask, PCI_STD_NUM_BARS) {
 		bar = &accel_pci_dev->pci_bars[i++];
-		bar->virt_addr = pcim_iomap_table(pdev)[bar_nr];
+		bar->virt_addr = pcim_iomap(pdev, bar_nr, 0);
+		if (!bar->virt_addr) {
+			dev_err(&pdev->dev, "Failed to ioremap PCI region.\n");
+			ret = -ENOMEM;
+			goto out_err;
+		}
 	}
 
 	pci_set_master(pdev);
diff --git a/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c b/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
index 659905e45950..115eabfd1f6b 100644
--- a/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
@@ -131,16 +131,21 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* Find and map all the device's BARS */
 	bar_mask = pci_select_bars(pdev, IORESOURCE_MEM) & ADF_GEN4_BAR_MASK;
 
-	ret = pcim_iomap_regions_request_all(pdev, bar_mask, pci_name(pdev));
+	ret = pcim_request_all_regions(pdev, pci_name(pdev));
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to map pci regions.\n");
+		dev_err(&pdev->dev, "Failed to request PCI regions.\n");
 		goto out_err;
 	}
 
 	i = 0;
 	for_each_set_bit(bar_nr, &bar_mask, PCI_STD_NUM_BARS) {
 		bar = &accel_pci_dev->pci_bars[i++];
-		bar->virt_addr = pcim_iomap_table(pdev)[bar_nr];
+		bar->virt_addr = pcim_iomap(pdev, bar_nr, 0);
+		if (!bar->virt_addr) {
+			dev_err(&pdev->dev, "Failed to ioremap PCI region.\n");
+			ret = -ENOMEM;
+			goto out_err;
+		}
 	}
 
 	pci_set_master(pdev);
-- 
2.47.0

