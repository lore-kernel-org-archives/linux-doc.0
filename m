Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041D14F9EE
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796614; cv=none; b=AeIeBg4d4SXWQwzT3YR2Bb/HsMtGDnUeOA2jb1o/+0ZJPOgy30WrOZitGzbRhRSrAbkbhLa8OziWnQ7vwXB5wR+5AYcEb12IIGtAerbdyQPUqtJKrGvjftO42Xeq+scWedeESDb5GUXynxOGAWQumZHtKP71mrFwKbiff6RH2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796614; c=relaxed/simple;
	bh=eSFUZ1JCsMVzaieqrfZ6sP42002jGDiUhoG3EeqHIyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDq5MwUNFEg6MS2rPkL5y9jjHioBpIx2rwKPAIRrlmV6M+JXyvuba0FdzE2R99VdkH5WF3BDMi6mYD7le9I5pK6f6X7H55jZYg7d0+iI/xY3r/2srifR/PrbvjNaHh87mDFLHEs8S6+zyYN84rZtwjofr6rcKrftXlqZJImiq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKKlxLAW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKKlxLAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723796612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/TWDUwF4muPiT/wIrowwWqBmpjVYWuLvHzzBlgJVA8=;
	b=hKKlxLAWolGbJk77wtbp3hNf7V9DRNlfYF1IbXGlGFLJUcTWnazxV4TW4H0mEL1GEXbg+h
	ELgN27Kh1FNS/Wmh2ACWkXm7G8tbkvCLAF+ZagHK9r4wKxFnMnNIlqbYWYe+m6nRdKWr4h
	2FGHrptt2kULfbTJZX2xiKAkungNziM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-H860hFviM9ybCXxBdwFAhw-1; Fri, 16 Aug 2024 04:23:29 -0400
X-MC-Unique: H860hFviM9ybCXxBdwFAhw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42808f5d32aso2935025e9.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 01:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796608; x=1724401408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/TWDUwF4muPiT/wIrowwWqBmpjVYWuLvHzzBlgJVA8=;
        b=Ny6J7w9oLE4b3GhkyDMWGjKDjgvjt9pgzNd3kZvJjq5239k3PNJjqjjELzGxJJnGCX
         OZTKJxM5L5Q+tpPW8YlArkv3mFH+R3AHbDY8wk+69bVSnDyiiMDaeoinrlzOlrSxFLXM
         1sFAe+8/33Sjx3csaLCZiaH30HRuAZUuTHdtnengA1HWbeaEASOdYaMlQKaayWX6iK3E
         8D2Ya7n2LkrDxyyy/qIBHRFb30y2yGHe5t/qDRcW6vxb6Ljo9rXggBNA2Ncg1hnfMziq
         Qzmmz0zTxihoeNZKcb7LGd5Tsb2YURS8lJmj7U2G3WtnT5/BrENL6gXq/7p4uevITXiT
         2vtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUizajHGbS7YuJv/B3JOktDFisZFEq8r8YF2HHwy/bdniF/PUekJiM8MrYttB7KCFlBAt5gI5TltgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQG1a+XrSy9YdGAp+lGDhx2kbJFYTBociFc8NGSWeov4ZDFs6
	V2UmPstmhDEJWQQe9gNTpJPi9nqiWZyXzYXWMbjq8JGJ05/xUX1z+VcF+boFgtnZ8KcY2PcpBD5
	ntNSph0h1Ee1VN2ChdoTCaepDOI5dhLzU6ohEjReUr1KCokJOFI91/zBPLg==
X-Received: by 2002:a05:600c:3c89:b0:427:9f71:16bb with SMTP id 5b1f17b1804b1-429ed81ef7dmr7718515e9.6.1723796608217;
        Fri, 16 Aug 2024 01:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIAo2an9uYuqB4ahCNPXZI8UwawbGrjuMMGbskgXu9LAjCjingMPPNd3Qcq6DzQwqmUyfoww==
X-Received: by 2002:a05:600c:3c89:b0:427:9f71:16bb with SMTP id 5b1f17b1804b1-429ed81ef7dmr7718215e9.6.1723796607736;
        Fri, 16 Aug 2024 01:23:27 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded367ebsm71461355e9.25.2024.08.16.01.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:23:27 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jie Wang <jie.wang@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v3 07/10] ntb: idt: Replace deprecated PCI functions
Date: Fri, 16 Aug 2024 10:22:59 +0200
Message-ID: <20240816082304.14115-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816082304.14115-1-pstanner@redhat.com>
References: <20240816082304.14115-1-pstanner@redhat.com>
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
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 48dfb1a69a77..f1b57d51a814 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2671,15 +2671,20 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	 */
 	pci_set_master(pdev);
 
-	/* Request all BARs resources and map BAR0 only */
-	ret = pcim_iomap_regions_request_all(pdev, 1, NTB_NAME);
+	/* Request all BARs resources */
+	ret = pcim_request_all_regions(pdev, NTB_NAME);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to request resources\n");
 		goto err_clear_master;
 	}
 
-	/* Retrieve virtual address of BAR0 - PCI configuration space */
-	ndev->cfgspc = pcim_iomap_table(pdev)[0];
+	/* ioremap BAR0 - PCI configuration space */
+	ndev->cfgspc = pcim_iomap(pdev, 0, 0);
+	if (!ndev->cfgspc) {
+		dev_err(&pdev->dev, "Failed to ioremap BAR 0\n");
+		ret = -ENOMEM;
+		goto err_clear_master;
+	}
 
 	/* Put the IDT driver data pointer to the PCI-device private pointer */
 	pci_set_drvdata(pdev, ndev);
-- 
2.46.0

