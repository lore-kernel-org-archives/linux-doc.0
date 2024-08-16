Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E722155C94
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796620; cv=none; b=OzXVKCgJVBmrC+qqLaUnQQrOnxLq7HROcoqSO5jXTvYYzItZ2XtJ6PjuG2E7Pr6z1YKawxzyJjNYAC5uOD/eqHZICjCvFjFS15NltvWmj/GtwJs2faJ0LU+oSe9nQ2s9NRnS+kHbaQ9z+KPp0y3NStHzWhZgyLJCULZ6I/CeLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796620; c=relaxed/simple;
	bh=WeLrRQQZMB+M17UvRJFKdDj0pyrJSBe8hp5JfipVdgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYhwNgMW+Usf2XdZvFNA8iKJguOKU6E/wN3ukHeft7gSDa73Li50eYNMWSr/vl9AQZ4ob6S4x3QV6iRArXLcNhuATdfM3FZhxEwY5xTvEvJUZkwl0TBEJrkj8oHwWg0PIJxAIUB2t0U65yryIawQEqIPewi2KBcuux+MJGp6lEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=febFUmn5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="febFUmn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723796616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9KK4cPQPxfE3+CuptPMI06hfd7cwzBu3NuXzthoA3A=;
	b=febFUmn5hCMRA4gCqJPwpHPceTH62vcQgrHIe3LAZV2ovx2XvzdM8U9DPbz4UBxIz6tYcX
	sfyxVzMiB0xMcDFDoPGXHYJAC83FA77Vr0OYVV8CbCnHM7Yb304zRFmnNsbC4G9Yky6v3E
	0rYRU/Nfd35LhF63qVsMXhFZ28z+Mnw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Jkhi1f42Or-k7iMgzwWU5Q-1; Fri, 16 Aug 2024 04:23:34 -0400
X-MC-Unique: Jkhi1f42Or-k7iMgzwWU5Q-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42818ae1a68so2831565e9.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 01:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796613; x=1724401413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9KK4cPQPxfE3+CuptPMI06hfd7cwzBu3NuXzthoA3A=;
        b=QfU6QYnpTrHlHwZHOAnTefrGrxZ964/2WwBvFdU/O1Ue7GQce7asGj+pLn93QuClqw
         p3WM//846/xy8dyEwcFymX2AHB8BJxpbIblnV0xIzIKrRnSFMEOthTOLfnGmILQJhYcd
         M/iS+1SWkL2bUlhFa5FQwvypJuKUuK7BKIQCQqcv3K2PJksyZ4gCh3quEN2PC5onLYiY
         RmJ31bh1tQ1O/nO19AlUoXHv8XBRujbnrn7H4C+qSR64cgrNJRe8fdg0fMRBuFdBysq4
         6/4N+VvmNFNHR5aTBmCLPunRLT5e0Hy/JdAoGjddzsKITPfKkJFV6c5Rof8GD46pH2v9
         Y4iw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3L2sEIc+sdQfvDTsU7gLwW8j347bfTwMliYbfyedgM2lmkH5j/48nacoSx8ewoWjZ7HLUeWbMjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5rM/dm6ujuUUWyRGYknBcmpm+HnxwrFPucX+X0oYOUr5/slp
	SnIDdPki9m7t0HGWWSPvtBY0wghkmbr/Bk3eEhYiBRxqZq8nknsZsnQGnaTRpVNu89wedmPkvb/
	2h4vTqtU6t6O32YHgTTbPLeZr8AWbC32Swr9bc8qMd9SxsCEpXJ3z7hBmqg==
X-Received: by 2002:a05:600c:3b0f:b0:426:6cd1:d104 with SMTP id 5b1f17b1804b1-429ed7f72ccmr7955955e9.4.1723796612929;
        Fri, 16 Aug 2024 01:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs1K45T6n4GqAA7kRJ9Z9vLdlCmjYbo94PMhiOgANbOu7cQ9323rvUxQ+wVpplvzg2GKSCyg==
X-Received: by 2002:a05:600c:3b0f:b0:426:6cd1:d104 with SMTP id 5b1f17b1804b1-429ed7f72ccmr7955535e9.4.1723796612453;
        Fri, 16 Aug 2024 01:23:32 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded367ebsm71461355e9.25.2024.08.16.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:23:32 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v3 10/10] PCI: Remove pcim_iomap_regions_request_all()
Date: Fri, 16 Aug 2024 10:23:02 +0200
Message-ID: <20240816082304.14115-11-pstanner@redhat.com>
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

pcim_iomap_regions_request_all() had been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()").

All users of this function have been ported to other interfaces by now.

Remove pcim_iomap_regions_request_all().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pci/devres.c                          | 56 -------------------
 include/linux/pci.h                           |  2 -
 3 files changed, 59 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..895eef433e07 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -394,7 +394,6 @@ PCI
   pcim_enable_device()		: after success, all PCI ops become managed
   pcim_iomap()			: do iomap() on a single BAR
   pcim_iomap_regions()		: do request_region() and iomap() on multiple BARs
-  pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
   pcim_iomap_table()		: array of mapped addresses indexed by BAR
   pcim_iounmap()		: do iounmap() on a single BAR
   pcim_iounmap_regions()	: do iounmap() and release_region() on multiple BARs
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 0ec2b23e6cac..eef3ffbd5b74 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -952,62 +952,6 @@ int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 }
 EXPORT_SYMBOL(pcim_request_all_regions);
 
-/**
- * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
- *			(DEPRECATED)
- * @pdev: PCI device to map IO resources for
- * @mask: Mask of BARs to iomap
- * @name: Name associated with the requests
- *
- * Returns: 0 on success, negative error code on failure.
- *
- * Request all PCI BARs and iomap regions specified by @mask.
- *
- * To release these resources manually, call pcim_release_region() for the
- * regions and pcim_iounmap() for the mappings.
- *
- * This function is DEPRECATED. Don't use it in new code. Instead, use one
- * of the pcim_* region request functions in combination with a pcim_*
- * mapping function.
- */
-int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
-				   const char *name)
-{
-	int bar;
-	int ret;
-	void __iomem **legacy_iomap_table;
-
-	ret = pcim_request_all_regions(pdev, name);
-	if (ret != 0)
-		return ret;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!mask_contains_bar(mask, bar))
-			continue;
-		if (!pcim_iomap(pdev, bar, 0))
-			goto err;
-	}
-
-	return 0;
-
-err:
-	/*
-	 * If bar is larger than 0, then pcim_iomap() above has most likely
-	 * failed because of -EINVAL. If it is equal 0, most likely the table
-	 * couldn't be created, indicating -ENOMEM.
-	 */
-	ret = bar > 0 ? -EINVAL : -ENOMEM;
-	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
-
-	while (--bar >= 0)
-		pcim_iounmap(pdev, legacy_iomap_table[bar]);
-
-	pcim_release_all_regions(pdev);
-
-	return ret;
-}
-EXPORT_SYMBOL(pcim_iomap_regions_request_all);
-
 /**
  * pcim_iounmap_regions - Unmap and release PCI BARs
  * @pdev: PCI device to map IO resources for
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5b5856ba63e1..8fe5d03cdac4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2294,8 +2294,6 @@ void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
-int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
-				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
 				unsigned long offset, unsigned long len);
-- 
2.46.0

