Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C80188CB1
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086364; cv=none; b=UKJIq7w8HYYUv94MKX13VLHfCgqxDwBlHSNQfX2aentcTIh+5xOplC2ad2c3Dg68vefHctbRQidBhcvGlCxUCOGLKsZEEpS8iPgkCMFRkDed0VGcqChUqjTx3oOVbIHIA0SRAKjzO0yA0Lvr2rK+88Are2AAqQFpxzWrktAJoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086364; c=relaxed/simple;
	bh=Hf2mWMH7KZvv8gLE1T3MLfUSP0vtA13S6Exz9YAmEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjpXQwbOcretpNtawoxRGrmKwNGNsdnKB1DmMZooYwV2q5Ap2iFREdQPbET5m8pYEQePAPMS+lL5icoSaoBIwbWvZXRUxcCDJLbL1/4MIyg0YfQG2nukPHMw5pEEneWkmkNEtPHwv349lCHA3K8dofv751NNlSpRSiMPpZPi3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPBf1cLJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPBf1cLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724086362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1gq3j2cCLpN/PPS7zpa0q0nk2Py/Mwk9dwym7YeAH0=;
	b=hPBf1cLJ88JepCEu4rNFgnxo7QjC0NNrt6O9VfZgLPUhAKY6FEXy+ehPt1cbAikj21nJ6A
	k7RXLtmimkcLbfpjTjwlrEItby8+HCiAHaZXGvYzxJc9CegQKGnxg3yRmvg1uhDld5PpRh
	4fNqAA+ZzG4WnHtcw5AP1gAbDeQr/5g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-6-033lHxNHaTtwUH-ywf0A-1; Mon, 19 Aug 2024 12:52:41 -0400
X-MC-Unique: 6-033lHxNHaTtwUH-ywf0A-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1ed6349f6so6266985a.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 09:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086361; x=1724691161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1gq3j2cCLpN/PPS7zpa0q0nk2Py/Mwk9dwym7YeAH0=;
        b=v+CCvhwm+8xfuJuDdUv47gO+sAlj0dVvB5+pN6BhK5OjR5SKP4FWpw+0hW8niwHLQ6
         oEHeBr94baOmokVcg/OTzY8JRsnaEAb302Pl/FOmxuna8QfpYhKI1qdJNjiTGie31yiS
         ylIQiHhxjfqUdWm2z5AG+ug0f2VMoHpgD2bL3UCGZs6PijJSwixMnFLLFFLmIkykPdt6
         CPYGzsvRHVP7E/th11UYB73LBY+hP3oggooK+vi9Na9ifIbQVLnKyojUIqhjecjK06hS
         ge+IIaMHLG07lpK0k727Wg1+X7YMrwOoNWKiWHHApfnafdXn3Z5VN7hUo8no7HcmrRQL
         0yvA==
X-Gm-Message-State: AOJu0Yzu4CY0ujeoV4P1Nd6ap6PB4IXy2u3rbnlTufIgKOnJx8AE8lR+
	KTvWWQcVG2n7v1Epv8ZrkBnxwCG0ahoryzkg4AJRWM4rGekzdQlXgnQ+tzl5SZN1pwX6/rImLI1
	x6O/62TWGA+qigGtxtuttdC4XRsWSM4SPaGPTqbiNQ+ux6X7il5oYIY+Crw==
X-Received: by 2002:a05:620a:401:b0:7a5:8f8:8b06 with SMTP id af79cd13be357-7a508f891afmr698685285a.1.1724086360749;
        Mon, 19 Aug 2024 09:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGDQD7k05CAjlfTOWOVMO5sw6hxjyjU2n/8i8XcW8KeWV0cEA9UCT2L0/OAyhNTDQ76PX01Q==
X-Received: by 2002:a05:620a:401:b0:7a5:8f8:8b06 with SMTP id af79cd13be357-7a508f891afmr698682785a.1.1724086360215;
        Mon, 19 Aug 2024 09:52:40 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:52:40 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: onathan Corbet <corbet@lwn.net>,
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
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
Subject: [PATCH 2/9] PCI: Make pcim_iounmap_region() a public function
Date: Mon, 19 Aug 2024 18:51:42 +0200
Message-ID: <20240819165148.58201-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819165148.58201-2-pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function pcim_iounmap_regions() is problematic because it uses a
bitmask mechanism to release / iounmap multiple BARs at once. It, thus,
prevents getting rid of the problematic iomap table mechanism which was
deprecated in commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()").

Make pcim_iounmap_region() public as the successor of
pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 3 ++-
 include/linux/pci.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 608f13ef2a4b..30c813766e8b 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -771,7 +771,7 @@ EXPORT_SYMBOL(pcim_iomap_region);
  * Unmap a BAR and release its region manually. Only pass BARs that were
  * previously mapped by pcim_iomap_region().
  */
-static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
+void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 {
 	struct pcim_addr_devres res_searched;
 
@@ -782,6 +782,7 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 	devres_release(&pdev->dev, pcim_addr_resource_release,
 			pcim_addr_resources_match, &res_searched);
 }
+EXPORT_SYMBOL(pcim_iounmap_region);
 
 /**
  * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index dfa9af3a9c22..7de75900854a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2298,6 +2298,7 @@ int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				       const char *name);
+void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-- 
2.46.0

