Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E52331215
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325232; cv=none; b=YiqS88zFJetvTuLVBVVj6ufu/CHSSN6YeOXn/3OLDtZdL2rPB1NV8sn69AUwqxuuQPia6WJLw8pQxA4dnCSHeBFMHUvVSRD23qsYh0zxrw0u1Y6+9cY64IBUnWH80EB+CF46y1IJGj6t7V+BRacQEcK80THKxQj9+I5/ZAeln2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325232; c=relaxed/simple;
	bh=rV6qi9tLa8BSeGhd9naq45rlh6qRoKLszIak7MQlwuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPP/pcmFDmJK7GnBHaytbyOYx8FgF0ElJKVHMkfUfQ1AjlquZOkpeAuurD5e3pjyM3EHELpYK1nj5PlVdN1rJv6+ezhHDOzXKaWhreHp7hIzoT2tczKD+IqFTodKrBa5DFv9X0Ust58juXQ1X5f57i1EcsFL3Rb90ot8P4TBP0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrHs0+GG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1+/Puk3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrHs0+GG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1+/Puk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
	b=KrHs0+GGOd+vGTQCZp4h36tHklekRsWBJ0dpmIzI3EN8pUqAuinneoeT4TzJ7TLN6WXkeC
	Ji7E1HfII7RpIjYxrPLmFXkQqHMF+CFPYVsEy53GchuoZVlhYUardt6EjvYO2VI52PJgnS
	5jasQfySb3KT9WHRQ63wLE6zXNqTctY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-nlpjIFNTNCOYBsBtLxZfLA-1; Thu, 05 Feb 2026 16:00:27 -0500
X-MC-Unique: nlpjIFNTNCOYBsBtLxZfLA-1
X-Mimecast-MFC-AGG-ID: nlpjIFNTNCOYBsBtLxZfLA_1770325227
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946198b977so34946396d6.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325227; x=1770930027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
        b=Q1+/Puk3Ayaukb9ysoHOlUijNkgCT4G8toyDGPykOxGg/QYNnX3ZnfghuUWVvVMxhL
         bLcfmPz0+1I286c5RosY+shBg8PShUpr+9LqdFJ1b9HSfXMp17WWR9xUc5GfkX+HGWMj
         GW5yL1ox3HLlvg1TW/4QP0KWE8hrMT4NaUe3VkBcHETJREOjAhC79PqnB4djzZHMBkc1
         wAS3DO/wbA6u+GEyYXMhJlxoKJM3FY84DMFKkxeyLhMEdihilitFfiIxK/xiqGjWYr5M
         EXC88R6JpgsCilbLa7MfgGFIZx/7+zljMyoBIIssS5Juuss+eZBTwqkMFO3Ii9LfhFgT
         /XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325227; x=1770930027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
        b=sQ6XdO3j2QR2oZCuNzsO340sC+nqqjeirCaViHL8Rkr9LPlWvVbRYtmTK0U8MmjL8/
         RdEpdjd4CBxtrV3jZvfe0yY10YpnUB+mRYpkeXs2IGqwIdrIR6CdQBC7Z45nMTf4FbhA
         NXzRSipekV6dP1mumF9TNRy67hmpu9f57qlrYqQidfZJmG+cxGtkMuehMDKAqg7BJEV6
         5LBQ0KJ4g3ipVcDOADdezKX7pSdW1iT/RUkQPAafPeoCljbZPvr0rJRc1ZSJgzMrxlI8
         SzDbeQvENBt62UK4qd1YJBlWkBgoarTqvVZMGhGzLpCzHQsHPpxy5CLGdPjoTXn+BL9i
         6iZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeZj+u81ASBA3C56QkCOOjL2IdaPRN5k31JzTNOFtmIjjMnhcwjiiqvd6XgjLM1WlqBwbYwdGXNe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSa978RZZ3LIanXah2qqc9KGE3H29biX0Krg/EFgpeIiubfIP
	FOay/FExMM0Tv63ywwccIT5W+NGBou2fx2LHX/6LI215mGxI+d9AbaspwKXc5PQWOWfTjIAKYFZ
	EBms05u8ZcTU2TIzq2hGS/Aworkl0kuXVQd9oqxlneyWTLL2W+xN03cmW04x7BA==
X-Gm-Gg: AZuq6aI2H4m956lFhbb1qyIYnUxreLPZ44ukvIVhtUMLmiTE0D4zaUhwKraTAsCWq+I
	v1fF0PmQYYlLfNkC9L5DeOSv8B6eqkepp1Ku1nq7bMJSkUWyXukegK49OATlJD8CMA/2cWw0XN1
	bztg4S7OSy8pDJiifxPhjk3ifflCRYHf60QMK4Rw7mLsxXy8M7lI+9CvW+lDDfdnh5dFnOS1oJL
	fhDTbDUQ4u3legnl4m0nTmpGmiSqGmrU36p9DJdQQwd7l4tBcq+rx3cm1tPhGPr7b4lGeg38w4f
	5q9wTNrLaOltqs/7wSNbIiEl4FBZzPTcbPXGhzXvb9agX6dxw1Xh/c+Z7oRW5dtRoTsaMt9bt/u
	jck0TH7Ad1M8UbQo=
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8953cc8c1c3mr6670746d6.44.1770325225657;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8953cc8c1c3mr6669906d6.44.1770325225055;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:49 -0500
Subject: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.52.0

