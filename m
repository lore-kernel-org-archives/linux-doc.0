Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72C153808
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796615; cv=none; b=obtUbGIf2mg0bNCbRxAnNfKkjc1waORa7O6ei54M9Le1l825hWALsn7ojhWkmeiJDecmM+AxjEB/u8FZmePcj1iaWgLd5bMqTNfkAAjTZPlTbfbiSsfnxlBboEPS9/gQz9Q15GpAi1byYcqkI6jDyHqsXCPE0oznIIUjXnCbZjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796615; c=relaxed/simple;
	bh=YADw69teg6OUTw/9kGSAzVxq8RbBIlzKklSmAwNjgek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgQ+BOcZ2o98uXtW4Nc3joIjmg6yy226/fgrd3KNIC2y67c+4K4AWvP+CAgFluRCFo3O7YvvXqiJpfZadeMvWypGIvNdUcH1T4I4z0/qF8Z+NXcIvxys2XGS+2uiO1kbQnrRSqm2dal2HRJe1+hce86ra+qnfqGBSEqUT8bvpQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEkIqy0N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEkIqy0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723796612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wR7g/AUrRep93UkGki3e8tPEClSI97kh3uS4quT0v8M=;
	b=XEkIqy0N7XaBFiOzgYWs9ZaW9Som+U05MIdoJyKbFi1VGpd0E12l2YcmajAzXmvDeI7d4q
	QkLqzHf/F9DuT2w5k8E3oSo1AiVh3hTUBJp0/Yv1JCVInB9DeRrnAeio3lCYzpG3L7SzwD
	WJDPZC7kI+lTURV32h7CL5l8mrD7R0s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-527eBVoUMYKTjSkHNy6hJA-1; Fri, 16 Aug 2024 04:23:31 -0400
X-MC-Unique: 527eBVoUMYKTjSkHNy6hJA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-532ffe0530fso251179e87.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 01:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796610; x=1724401410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wR7g/AUrRep93UkGki3e8tPEClSI97kh3uS4quT0v8M=;
        b=BNvxe8IzBNe+QLhmOHY3OphySeeZ1xOGpQBMnqqTT7RFZgpYvHulkjBT0kqyROtWcf
         M/ol/BpkEr4U/rdR6yoZL2EQOjlpo6yXM6FG9nd9VZjQzB1VBzY0RUrjZJ7ltmI+oqlL
         uycWNVwZJGN6e2AMpr/mOgHVyNAjKvgXe+4zGZNjWZi0p9VTrMEgLMSpLxHFHz9eXSLi
         zS9jF50q3B1guqcRndV3wq+Yr70dmDNdMEp0uEIOtfnN/0SX3Io3E9kX9E9A+ZSmNioH
         2A35IjQy4BT1Rb77cLThUAAXWw67sCLHTSWR3p1YlRYWfspb5TEjiAh14332QACNv4SV
         I8yA==
X-Forwarded-Encrypted: i=1; AJvYcCUxt10WijY/U2DSC+t6ojh/FYzsrnWD8rhJZhAAdEicj68+eYQ6gZT8mRQh5lD80w/KDExEsRFOUVbtgEtMiFolReuT3QrjxhqD
X-Gm-Message-State: AOJu0Yz2hzToIqWlHoFOjGta3H2pahBAS14Bu6QHJI9DKJgZlAZv+s5Z
	Roct1EinA5dTujk/UD/9DyUgbXwoxIrHS5bf0EVM97nDUEF1n1g73WunltyOpAN0c9tvqa+/eAB
	/o5X3O791caKrWd8jh/ev7DsPzmJttZ/dntUNgYaK5Ooe/jbdwyqtJjC6Kg==
X-Received: by 2002:a05:651c:210e:b0:2f3:b38c:a142 with SMTP id 38308e7fff4ca-2f3be6074c1mr8717851fa.6.1723796609785;
        Fri, 16 Aug 2024 01:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGedci6wEskLStoN5T+/a5fQ7mQwe3Hdz3eZpzwNe45i6iFhaTa+e9V9NXIeJ1Uhhe0A/2fIA==
X-Received: by 2002:a05:651c:210e:b0:2f3:b38c:a142 with SMTP id 38308e7fff4ca-2f3be6074c1mr8717741fa.6.1723796609341;
        Fri, 16 Aug 2024 01:23:29 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded367ebsm71461355e9.25.2024.08.16.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:23:29 -0700 (PDT)
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
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 08/10] serial: rp2: Replace deprecated PCI functions
Date: Fri, 16 Aug 2024 10:23:00 +0200
Message-ID: <20240816082304.14115-9-pstanner@redhat.com>
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
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/rp2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/rp2.c b/drivers/tty/serial/rp2.c
index 4132fcff7d4e..b6b30bb956fa 100644
--- a/drivers/tty/serial/rp2.c
+++ b/drivers/tty/serial/rp2.c
@@ -698,7 +698,6 @@ static int rp2_probe(struct pci_dev *pdev,
 	const struct firmware *fw;
 	struct rp2_card *card;
 	struct rp2_uart_port *ports;
-	void __iomem * const *bars;
 	int rc;
 
 	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
@@ -711,13 +710,16 @@ static int rp2_probe(struct pci_dev *pdev,
 	if (rc)
 		return rc;
 
-	rc = pcim_iomap_regions_request_all(pdev, 0x03, DRV_NAME);
+	rc = pcim_request_all_regions(pdev, DRV_NAME);
 	if (rc)
 		return rc;
 
-	bars = pcim_iomap_table(pdev);
-	card->bar0 = bars[0];
-	card->bar1 = bars[1];
+	card->bar0 = pcim_iomap(pdev, 0, 0);
+	if (!card->bar0)
+		return -ENOMEM;
+	card->bar1 = pcim_iomap(pdev, 1, 0);
+	if (!card->bar1)
+		return -ENOMEM;
 	card->pdev = pdev;
 
 	rp2_decode_cap(id, &card->n_ports, &card->smpte);
-- 
2.46.0

