Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAC3845B2
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310336; cv=none; b=OyCf8oc3pjukhHUPwRwB3++iu0juADpphsYRUV5KEhX7zfCupAy28uin/WNBjpTnbv2bXBQvusorpH1ZDJDTEn0VBAP+zmxRpUwcUHPsMuokZO5tbY7KCxJBRQR5flSP+Netj0gOcTWbvT805gdKTvlrN3iloWEJxKdX6r4DGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310336; c=relaxed/simple;
	bh=PBlaixBFERkwnraELbaSfRJMLkjw7p/DT3tIx1ijTEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hCcp2BtxSb3zoYR+sfZbXdfdkz71wfwu9ezRJ9xnGEAinFL5KOQZ9cdv64lT50skHKvd5xlnR3Tmxsa2Xum9HvQ2YuidANT0wrZ+wNJ/znugylvO0z4dHD3jgVBqGaN/KOYegHZvZwpHToIQot5arVQo18lFhOvZVuJ5JbKrIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZiF04+ZA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZiF04+ZA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso24244147a91.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774310333; x=1774915133; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxGJfmbE6y6D4fg7v0R8cmHFXmMbzFJlr4dbGGaFVKE=;
        b=ZiF04+ZAJ6wsl9QhyvqABMNwvUHXKldkY0AemS7SUo0vutKxPbtIUY2QXwEeryz+Gb
         v4JRthi91fBxgKcIPG3HRL7Mp42u5/rDOJkAmuQLgM9/kFUXhouDzfi8oMZ/CjeDI8fv
         qdIomlJSLGZhGlJ7UE701ik8TSSxShE9DBnXlmp2ZA8SjEom5ceT6TT6vJ4rhlf0h5uQ
         iaPn9tj+1O7/yNQpLIr/TE42kIhmbdqSonxutB7hX31VoDnWRfThCHcCGgFi/lty1t7h
         A68TLaKqPEC1Jb2qCYhjMWdo79+Jir99UucMpIHBvpJaAGo/HUWzl7mUL8cUGIjiKaA1
         /oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310333; x=1774915133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxGJfmbE6y6D4fg7v0R8cmHFXmMbzFJlr4dbGGaFVKE=;
        b=TQ1iCCXQq3Il/Nf5KlZ3mCgYE+pacp4oO/NnC8hmdGa9iQV2HBlCD2L2KP7QwEvKMp
         OscITsAdBCMIoyLrgmL2kC6nsAJS/I4QPPYiTHsvmlM5uk0UKvjfGmh3ITK5LFa4b6LO
         D8jLwogw/0TCys4ml+TXolxnbZR1kpN2aZhTB+fQcRyv9iM4nD491otCcak1ZWHWVTUh
         wwdrDMo48Si/kPfGSkxZH4xp0q8UwE+KJ7i2WYW2czrhZsRKYqNmYvrR5cNBbagiNNba
         hHM9pq3IdAQ87EIdytD8OOzeNzDs/QcT0zY0ARG1LwN9r/MPDmD6wsyCT3VJ4njwpasW
         rMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyAtkvaWxxsJeZgB2B9EGvBH3uarIQbpdbOWJPOLudHYyut4ioHvBTpLTlNa5z7wur/kv3aXuELZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2x4YqzfHyG2YsuD2V8sWf17fW0hpNUs6tGZsL1ahNR7zTeKek
	oU2bHLUXHDNkpyX+Y53P0/IZ6DNG/fu+7vAulmQH56EA7VqCyXQZ+CBJn4/Tao2YNivEgcrmhCG
	G1T4O82KrTF6EmA==
X-Received: from pjbca11.prod.google.com ([2002:a17:90a:f30b:b0:359:84f3:a9d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:384b:b0:35b:9ae3:9080 with SMTP id 98e67ed59e1d1-35bd2c62dc6mr13468908a91.14.1774310333147;
 Mon, 23 Mar 2026 16:58:53 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:58:01 +0000
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323235817.1960573-10-dmatlack@google.com>
Subject: [PATCH v3 09/24] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Li RongQing <lirongqing@baidu.com>, Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Notify the PCI subsystem about devices vfio-pci is preserving across
Live Update by registering the vfio-pci liveupdate file handler with the
PCI subsystem's FLB handler.

Notably this will ensure that devices preserved through vfio-pci will
have their PCI bus numbers preserved across Live Update, allowing VFIO
to use BDF as a key to identify the device across the Live Update and
(in the future) allow the device to continue DMA operations across
the Live Update.

This also enables VFIO to detect that a device was preserved before
userspace first retrieves the file from it, which will be used in
subsequent commits.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_liveupdate.c | 44 +++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
index 4b83a02401aa..b960ec3ffbf2 100644
--- a/drivers/vfio/pci/vfio_pci_liveupdate.c
+++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
@@ -67,6 +67,9 @@
  *    interrupts on the device will cause the ``reboot(LINUX_REBOOT_CMD_KEXEC)``
  *    syscall (to initiate the kexec) to fail.
  *
+ * In addition, the device must meet all of the restrictions imposed by the
+ * core PCI layer documented at :doc:`/PCI/liveupdate`.
+ *
  * Preservation Behavior
  * =====================
  *
@@ -136,23 +139,37 @@ static int vfio_pci_liveupdate_preserve(struct liveupdate_file_op_args *args)
 	struct vfio_pci_core_device_ser *ser;
 	struct vfio_pci_core_device *vdev;
 	struct pci_dev *pdev;
+	int ret;
 
 	vdev = container_of(device, struct vfio_pci_core_device, vdev);
 	pdev = vdev->pdev;
 
+	ret = pci_liveupdate_preserve(pdev);
+	if (ret)
+		return ret;
+
 	ser = kho_alloc_preserve(sizeof(*ser));
-	if (IS_ERR(ser))
-		return PTR_ERR(ser);
+	if (IS_ERR(ser)) {
+		ret = PTR_ERR(ser);
+		goto err_unpreserve;
+	}
 
 	ser->bdf = pci_dev_id(pdev);
 	ser->domain = pci_domain_nr(pdev->bus);
 
 	args->serialized_data = virt_to_phys(ser);
 	return 0;
+
+err_unpreserve:
+	pci_liveupdate_unpreserve(pdev);
+	return ret;
 }
 
 static void vfio_pci_liveupdate_unpreserve(struct liveupdate_file_op_args *args)
 {
+	struct vfio_device *device = vfio_device_from_file(args->file);
+
+	pci_liveupdate_unpreserve(to_pci_dev(device->dev));
 	kho_unpreserve_free(phys_to_virt(args->serialized_data));
 }
 
@@ -213,6 +230,10 @@ static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
 	if (!device)
 		return -ENODEV;
 
+	ret = pci_liveupdate_retrieve(to_pci_dev(device->dev));
+	if (ret)
+		goto out;
+
 	file = vfio_device_liveupdate_cdev_open(device);
 	if (IS_ERR(file)) {
 		ret = PTR_ERR(file);
@@ -233,6 +254,9 @@ static bool vfio_pci_liveupdate_can_finish(struct liveupdate_file_op_args *args)
 
 static void vfio_pci_liveupdate_finish(struct liveupdate_file_op_args *args)
 {
+	struct vfio_device *device = vfio_device_from_file(args->file);
+
+	pci_liveupdate_finish(to_pci_dev(device->dev));
 	kho_restore_free(phys_to_virt(args->serialized_data));
 }
 
@@ -257,13 +281,23 @@ int __init vfio_pci_liveupdate_init(void)
 	int ret;
 
 	ret = liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
-	if (ret && ret != -EOPNOTSUPP)
-		return ret;
+	if (ret)
+		goto err_return;
+
+	ret = pci_liveupdate_register_flb(&vfio_pci_liveupdate_fh);
+	if (ret)
+		goto err_unregister;
 
 	return 0;
+
+err_unregister:
+	liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
+err_return:
+	return (ret == -EOPNOTSUPP) ? 0 : ret;
 }
 
 void vfio_pci_liveupdate_cleanup(void)
 {
-       liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
+	pci_liveupdate_unregister_flb(&vfio_pci_liveupdate_fh);
+	liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
 }
-- 
2.53.0.983.g0bb29b3bc5-goog

