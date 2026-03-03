Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398F3CF66D
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572541; cv=none; b=vDvFffrnAWgPA52ceitcNYk18StrdvvqCfstZyKdX2CVKtwm+q27rXZ7MqpvCmUnJ4OwzKZDc1OP1XlwQAIlR//DHiAA0z2iQUBCYQzHvKU19MEnxNrMfcNaHwDg8KTHpBdstkdUGSqfRC7ZD8L7MTpc2s80E2XMyfuTimKhOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572541; c=relaxed/simple;
	bh=WKMW8HVlmZaoyJE5jsAXtcRs0N48w7Ua2f/NenCBzOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrTgDn39891Kd0r1NkJSSvunCCPzkpR3K7DhqYcUi1u6yk1YxLRLpqb+Mi80nVeXhWTqnuOCjLgR3PtwZ5OQkLwGGhOcpv3cPAerYSXQNRPOma5h/SWJHyqIECyq8Lt5V0g40330zbNBDnfLKFLOKRa62sGlrHIuTNBin6Cxvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCESQA4c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXsthQwA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCESQA4c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXsthQwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
	b=OCESQA4clh8Axb1EjczquFMRnGOxVQ0eJn0FXweTVNSIxFkuzc2tNJ9bFvcsjNAOLNxk9z
	Tzwha96xnUDt8Puun9MztQK61kbNN+O9W/1yep/mDbg01mbH1wtQMk3u13R44FXdv7jg+o
	TRHQ8bldEBnrh6Kg+VGFCL1XExIfl38=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-TPIT4XcgNbOC8LIsOGmQ3w-1; Tue, 03 Mar 2026 16:15:37 -0500
X-MC-Unique: TPIT4XcgNbOC8LIsOGmQ3w-1
X-Mimecast-MFC-AGG-ID: TPIT4XcgNbOC8LIsOGmQ3w_1772572537
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b4bdde91so469737391cf.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772572536; x=1773177336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
        b=LXsthQwAvI+GKiRoth6wdOJ4d7t29LFNUXcVJ7W4ht7TxVbYapOiZeMa03RzTM+PD9
         Gp9Tl3ywuJnCudUgdsoXbCtDX69Otr7tPpVE/kWlvKblfsKuQfxSv/EBRgUbAbrrALDG
         Z/djSv+b/2AZo4oK8tNCMVv3mi5v0Gveo3xEz//MQwR4+9T/blKHIoSy2n/oT21ooltw
         RFmsGWmfjaHkxtDVWgNSBoKEeOUmNEIhs3DZtjNyvHy3JBDLV0+LnyxoZFMuWN5EHG9K
         BRsNOAyVtb4MXTkr5Pg8hZZ4KnOKzO8HHIwLTuRUnNdk2ms3l8CovFKVrIQJF2/Bi4TK
         nfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572536; x=1773177336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
        b=LFKSxxMa0tnKKnQWiud6F7zqCi7MgToNiK5f2dzELqC6BLqUK3JNo4sClBDT2qL3J0
         zlZ4xjS/TujftSbKU2S+jKl7KvuKCMwetcQPpgP9HNG/Cp6ipLvwxZA0m6Miz1xUvmom
         rP0euDdrtfHC9FoR2M+aaKmkjD/cWfckddx5eQd9sxm1lutEdTy/wsu13j5YjRiyRzIc
         TtBdeuOfLCn0FjzCS4pB1y5Uti4UvjrL/U87PyOctdzt8BQJgLHOx0b6TC881ox1soSB
         2xOuYOvSdBvr2biY+k7gbp9QmTNasCMiMdaLVH64hKuDFBD9qxjf8jD0f5V6KZV/VVX6
         LCXg==
X-Forwarded-Encrypted: i=1; AJvYcCUN94y6DLYbeb8oYbfcJhCfmj5g5g9fUqwXUhBEqXtbw1O6cehZfyWIdQiwVZyjmOnNFaJWffjuJrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr+Pc5h1vRagKw5psdFpIW2GGh8HA/ibPOtu87VKis0SbO1LFI
	aJBK652HlhhEKK2YKIlyrRuWuoNf+KcuI7bkYyT65/da1a3FL+at36Mb31lNEd0fKWyy6VA4eEX
	T6xtc3L/2EHHid66Zj961PrU+25fGglGfPPYFiQNmUv+oc3h1913FZFy+PVOIPg==
X-Gm-Gg: ATEYQzwFbOVy90d9zQdSWnUk6ayvjXpojln42XiBtibhb8lX50K+fvxNKcT0Cdgc4Sr
	Wow2y+Dosxvk9B4VOy6pTpFIjPrkyW9HhpxlIFXsKagedll/eafFGHc3JJv+lVWczsvvkUn+gtd
	DGOrXsYs5AIu2OwtZNrxx5in6vfyuQ1RYDdB5+0yWwiZFMIXHvca1VKIgeJ7Fbyf9Vfz/ME0SDY
	JpokVANGBKL/60mi+glwoiEVXWS+DD/s/0PbK+I/garrnlGBznu4Oecae0U+icTMTVbtvSNIkYH
	56H/5EjBYeqOz3Wkw7JVyeBWcpHXkS+n47D8xF13SaCCYE+5JUhW9Yg/qrLs0p+0rYztQ2LUMfd
	lGzqv/lVQ0OWFFNHzo2BtI7acfg==
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id d75a77b69052e-5075287910dmr225478191cf.10.1772572536442;
        Tue, 03 Mar 2026 13:15:36 -0800 (PST)
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id d75a77b69052e-5075287910dmr225477351cf.10.1772572535732;
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:22 -0500
Subject: [PATCH v3 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rust-pci-sriov-v3-2-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
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
index e25205c6d8f00cec579016acade28e743812c924..2410e6f3efe100a635eebfdb21f28f62a3759890 100644
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
2.53.0

