Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D29158D60
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844951; cv=none; b=koKK0F77FkiV1FP7MeK17NaXbLBAkEcyiVJ/JVlgi0g3y846rsdZTA68KJcMOjJhsk5g+C1SiWlQrOvR223qTA/Xqg0UWG36HdKZwebGgql3j+HFGOshAAxh0QwH8oR2BXXQ9pQ59CGvfxbQwlJ/rcp1N74nuNQdr8CBlV6fD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844951; c=relaxed/simple;
	bh=Yo+Ns2b3URhNU5TB+CvEDymuFVQ4WXMZyjfGA5NqkhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlcECek2jtsSDPfmr1NkxzLz37YVstOt3usfGJw2Iu310c/Q44LxFnhid49B4Ugszy9IBjdXfJ0pd1qsxwTUmZtQA5Da12Bf9t3hafuwOXBDYheNps75xyfvwh3S8u2SIh0j2JWl+p9cnXjEp3AJrbRqnzGGMbHdNloqgBq0Xcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ij16e8T4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ij16e8T4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722844949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1zjbMHqB0PmusT+nYJ2VtJ9oVjApsikg9aShs5wyaI=;
	b=Ij16e8T4epVhlioTGkB5nb7PgFD3F5pxY2X9pKPiYHnsRiOdUv9vEgkv72vxWP1HYmaALF
	BIXEy/19iO2uNOvLE8glS2xX0Oem2GMRrNdwB9LwO/cIz5G4VzEBCWRN08IECf8iPeB0iw
	VmbRu6GhqrKWg3T/MYJYR0nu8H5qOL8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-hTbq0So_NGu2tx2J0beMHQ-1; Mon, 05 Aug 2024 04:02:16 -0400
X-MC-Unique: hTbq0So_NGu2tx2J0beMHQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7aa36a777eso95721966b.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 01:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844935; x=1723449735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1zjbMHqB0PmusT+nYJ2VtJ9oVjApsikg9aShs5wyaI=;
        b=Ms2dUWGz41MT4GHFJjsBOg4+vpfmyvC51FmStqa1xhz4bk3XBzfBjHPpQnJ9bVcAkR
         bldnfbJ5NUq5FPyzzIPOn29kRJkmthyEGatPBCrV2J3q2zDxRMYO+qJzLlzuCAp4u0me
         eq7fN8Tmgcoj1ylTm9rqXASE3RKQy2JllG97UyMUEAaniKTLrz6vrYGThJZ/Yiz3W8Ko
         ZIvVMOVy1ODWqBRPmBO8krtsrt4lszjZuEPtLVm0fk1jvoh5JFvKiVfGdotRxhu4ee9Q
         VX9C8dKBiAZL/sRx4FOtuVYMGBwzy9QBNG1pDfLcb7dpQYos8hXoJZp3MKOXadg8KoEW
         NOvA==
X-Gm-Message-State: AOJu0YxaaSMTqqGuiyyKKs732jpzL/8nh9RUc6qwywZpkAtBmGP0VSKJ
	bCIdzZY4bg90ryc2hK029YhcCs52ld6Ry1RhkvwrWdAycYgyLl581uUvIlVw2CXYVQZeRMsE6T+
	wkh0lnLoVVRkly6uWVJWtFpdgk+jn6TMEI0da/yAxyfxo1lSCKQeIXVuIbw==
X-Received: by 2002:a17:906:f583:b0:a7a:81bb:ceeb with SMTP id a640c23a62f3a-a7dc4ae7defmr473039466b.0.1722844935519;
        Mon, 05 Aug 2024 01:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKuHik2ajcs17LmubcaIaCUkrAqH7M1NRkgMmBZVBefF6pfGv29aIhP8ECYMtriJwflIFmgg==
X-Received: by 2002:a17:906:f583:b0:a7a:81bb:ceeb with SMTP id a640c23a62f3a-a7dc4ae7defmr473031766b.0.1722844934632;
        Mon, 05 Aug 2024 01:02:14 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82df07e000a5f4891a3b0b190.dip.versatel-1u1.de. [2001:16b8:2df0:7e00:a5f:4891:a3b0:b190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de8d0868bsm277958966b.143.2024.08.05.01.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:02:14 -0700 (PDT)
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
	Serge Semin <fancer.lancer@gmail.com>,
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
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
Subject: [PATCH v2 06/10] wifi: iwlwifi: replace deprecated PCI functions
Date: Mon,  5 Aug 2024 10:01:33 +0200
Message-ID: <20240805080150.9739-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805080150.9739-2-pstanner@redhat.com>
References: <20240805080150.9739-2-pstanner@redhat.com>
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
pcim_request_all_regions()

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index 719ddc4b72c5..6b282276e7b5 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -3534,7 +3534,6 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 	struct iwl_trans_pcie *trans_pcie, **priv;
 	struct iwl_trans *trans;
 	int ret, addr_size;
-	void __iomem * const *table;
 	u32 bar0;
 
 	/* reassign our BAR 0 if invalid due to possible runtime PM races */
@@ -3657,22 +3656,15 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 		}
 	}
 
-	ret = pcim_iomap_regions_request_all(pdev, BIT(0), DRV_NAME);
+	ret = pcim_request_all_regions(pdev, DRV_NAME);
 	if (ret) {
-		dev_err(&pdev->dev, "pcim_iomap_regions_request_all failed\n");
+		dev_err(&pdev->dev, "pcim_request_all_regions failed\n");
 		goto out_no_pci;
 	}
 
-	table = pcim_iomap_table(pdev);
-	if (!table) {
-		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
-		ret = -ENOMEM;
-		goto out_no_pci;
-	}
-
-	trans_pcie->hw_base = table[0];
+	trans_pcie->hw_base = pcim_iomap(pdev, 0, 0);
 	if (!trans_pcie->hw_base) {
-		dev_err(&pdev->dev, "couldn't find IO mem in first BAR\n");
+		dev_err(&pdev->dev, "pcim_iomap failed\n");
 		ret = -ENODEV;
 		goto out_no_pci;
 	}
-- 
2.45.2

