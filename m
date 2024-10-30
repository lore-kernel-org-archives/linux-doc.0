Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D61E907B
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287708; cv=none; b=A4OlavKc3uwN0bx7kQls9K3tgRUsJlD70DuJOlE3VFmbPVhaX+SSknhZLGp+LOKFFjhoDGUnpgf25dOxGOLRXnEpfnf8c37PkjN6/9pkoS1FaO97ACgsUdy0l54amTmqiVgHbO2HR2d99pdjm7cbOwOvZr2cZegh3wiPiLTc6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287708; c=relaxed/simple;
	bh=J3pG/0Gfw8HnALwZ/Br+hrSE4pEfpHhtl4LqImtqkrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NatBwP6ERvRp/+YEccvgjHDh43LrqiSpMyq5Qrpkbmwhl/ljFEFC48qTuipKWB1jz52b3UecLoA25Ts6RGESLNp4JojRiktBnOz1dDunYIM4kuLl2pLHiRQ1QkVNf6DngWejZ2b4NMRSwLs84l6aRbDpQDb3iKlT/2Yr2ywSzT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=imt8VwIY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="imt8VwIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLUy2S875DNBeHIOQOxEOE4p7AHnezc+a90RKtjms08=;
	b=imt8VwIYA0S4dCI5EIS1HyW+l/LpbBzM6TfLkaP/AyqMsxHBT1LKBTWFdcjLglif/XP0J6
	nrFFEag25BZMH32Gnvo+aea1z/dPKPeLAHDWS61TD8FoBAa8TpsV3Eq53kCg+xqkjRfR9P
	pXOGsCSCOsz59I5K+50y3H+H92tXor8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-rHQUpgIfMt6fZi2ulRddfA-1; Wed, 30 Oct 2024 07:28:23 -0400
X-MC-Unique: rHQUpgIfMt6fZi2ulRddfA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1e429a8fso135464366b.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287703; x=1730892503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLUy2S875DNBeHIOQOxEOE4p7AHnezc+a90RKtjms08=;
        b=qOeUiiHO8Mshr/xkqlH9PDqyYs76ggvRehN7InSnMtxlXk+SSlCH30sGfHriWDfZWT
         GRdCuHI5Cb2Ome+b5Y+3BaLsxRDFtA6OanpBivMUUbu6L4ff5ZMsvgdoBCt47ENqmhKc
         OnAjH5YZ8T2NG+pMaVWUuuhBMoKrlJf20w8D3Au78Uch68uCrsGzjXlcFJBfKCbMrftG
         7jNaP9XNOWIG4XwpepEejgyLQRGe7b/2XjuwR2BKEcoLYK4wkvdz4IX/OS7kwGW+ae+F
         DO4Pd6u6Ypfhwr0SB6JkMZQjZPCS1WD0tJS6A39KxpO6ta4Ey7PR3zdWgeQubZFVxmJq
         1RNw==
X-Gm-Message-State: AOJu0YyVI61PWtJwNEQG5UkQejIdzfS7JYi4J/VfXorsb0VMbyp3aALj
	CKsQWk63+x3p93xXLAs/nGB37/R1vKXc1Cky2q8+OCoyI6p9E4zLZv6ltBB1OLwA8twl40M5vx0
	MF7h5a31fM4nFZ+BN3hpCn6wMNu9aOo8FMkLRbbInJELJdfMmbliwZExNHA==
X-Received: by 2002:a17:907:3a95:b0:a9e:3af1:eb1b with SMTP id a640c23a62f3a-a9e3af1ebbcmr190403166b.38.1730287702738;
        Wed, 30 Oct 2024 04:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFToQp/dfLAgkkWdoKZY9+BkNjMsRPPHY3dBsz+y7GusLq7PV1rFcL96Aa7HB79+WgO83hbWg==
X-Received: by 2002:a17:907:3a95:b0:a9e:3af1:eb1b with SMTP id a640c23a62f3a-a9e3af1ebbcmr190399766b.38.1730287702314;
        Wed, 30 Oct 2024 04:28:22 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:21 -0700 (PDT)
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
Subject: [PATCH v6 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:38 +0100
Message-ID: <20241030112743.104395-6-pstanner@redhat.com>
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
Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 drivers/hwtracing/intel_th/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 0d7b9839e5b6..e9d8d28e055f 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -23,7 +23,6 @@ enum {
 	TH_PCI_RTIT_BAR		= 4,
 };
 
-#define BAR_MASK (BIT(TH_PCI_CONFIG_BAR) | BIT(TH_PCI_STH_SW_BAR))
 
 #define PCI_REG_NPKDSC	0x80
 #define NPKDSC_TSACT	BIT(5)
@@ -83,10 +82,16 @@ static int intel_th_pci_probe(struct pci_dev *pdev,
 	if (err)
 		return err;
 
-	err = pcim_iomap_regions_request_all(pdev, BAR_MASK, DRIVER_NAME);
+	err = pcim_request_all_regions(pdev, DRIVER_NAME);
 	if (err)
 		return err;
 
+	if (!pcim_iomap(pdev, TH_PCI_CONFIG_BAR, 0))
+		return -ENOMEM;
+
+	if (!pcim_iomap(pdev, TH_PCI_STH_SW_BAR, 0))
+		return -ENOMEM;
+
 	if (pdev->resource[TH_PCI_RTIT_BAR].start) {
 		resource[TH_MMIO_RTIT] = pdev->resource[TH_PCI_RTIT_BAR];
 		r++;
-- 
2.47.0

