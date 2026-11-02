Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633822;
	b=udDM+FwrQbKkzn1T8PtGoAWUn+E7iintbzkJ5EIWVjCyifE4l+t34wFI/Js5TkOnYY/+
	 5Tb/f4JeZr/JmLmr3b2PaHAzW3evSa2YzuNMoIa9e0HLeZSgfX7YMpj06i6MgC7TbbWwM
	 l8rWMGkoqg1F2GIuFGv2hCybK20AX5eFxzO9yHC8zEyLRhLA5JgjOhrIp0rwyGsQEWAfe
	 qb/OKzQAeWrgVQF0i2/zQt1LU28S4JAUp0dGjHZmdwcqDk3uV/7R73j2ZomYgmkf2V7Ds
	 W59o4c0+qT0pgL7lqx8Y8+UXussP66TegoyU+9ptGzx8+tE2cUzl44VFVz/4rEwziuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tWmkkGF65geeupdTZHwmY4vWlAPAJsehULkoIO9Oe60=;
	b=PNhwUbxLqCiIf9S0FQuLeNhQERh/x/gxL14YIWlytp2bGmznNH8t5kesTwVMRU8xf3CG
	 HFSPhEjUY+jdNk5n6ZqEJ8DJNoiGOu9C6n1/uF26HPAZSVWeHdQqjCOQ1t86RT8gybg42
	 M8MTjPcoE5WNhqCO50iKsXVc9rXzdBLhWOFDWDjg4vMRarIaDMrOQYzOI/Zu15TTlHNdT
	 +/QRZdyWzfGlcNWKSbzCdlBhqEZFSjmk5MTUVOEKZOABgxRsKZ+JmLXSuApoHzI3TxtrV
	 bPsAkimyuR7JsBCf3VNIFmw38PCQA0Ay8QhAV8dsBLnAV6EstxjUx1q9+pHPAPBQe0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pgQrCcVC;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F160A6D16
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3F160A6D16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pgQrCcVC
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb1f470a57so20749045ad.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633821; x=1794238621; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWmkkGF65geeupdTZHwmY4vWlAPAJsehULkoIO9Oe60=;
        b=pgQrCcVCuqIfGu07R63VSKMWlEDxs9GdNX2EsULxQcOE0BZzWKZ6GmK5PHNEm0idjx
         2M+oEC12+fRpDn6dRUmPLDEokXLgugMYKTkzHecrwfzNDt78N6oOGHfyGb4cbni5TyCA
         CKpWq9Z6+Yg7kbMc/i4VSaZUB6MBphHA5N3rMG5LNCSBIFSprnPUfDhWO3bANlSrnZvB
         2vzSYlHHzio93GLMzvhk6lTmOP6nAEpTgVSelWNCiw9u+Mv4ai/7dXFu8/G/vJUTY+9R
         LOmW/D6pr0l9LPEot1J2U4tT+Q4UhWkx38EPrhDKsKdzOyianbJUFXKi95rlcLvci+Vh
         3Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633821; x=1794238621;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWmkkGF65geeupdTZHwmY4vWlAPAJsehULkoIO9Oe60=;
        b=iEls40wqEkva3lRI+JG8MAdl5kdIUvxkGrFXECgRApbChR1AUgM6KfpWrvjSquRZn4
         tdRvevoZTFQ/mCKsdCCszfth4E5Dyl5Rt0m6ljhxjmz0I/WKJnn1Atq5JBhfPuAtjdZd
         KjCUl52WmevNgtrTvrS8PNHf4PXDDOl//y2cUJxb9WqUp1xTfFKRdxSb8/UZO/ejNJVB
         8canChef09bRHI+7z5sbwoCvGKiJcQeplhyHaNqVbF4xuxd7gVxpOfvo3TwwsskkN+ht
         Cm5b40n/HbAcAPjJe3t7IQ5uPZ3kU4KceHHK5JdCf0bCLKsSctqAuKpdEsr8UbT+tM8M
         Jh5g==
X-Forwarded-Encrypted: i=1; AKwUvBwHLZYku/LAwatH4vK2LPhjrlv+yTXs9zHE5i3qFkU5w5Q/SpCEVAVMLLsR+Lc2dXVHj6UOsOsej64=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zao7DvfeufLcxHld2bJQPblhURsX7aBMBKHVNxO9ZzEeCzmN4
	OyC+6iAEiSgb1x8dBBIT9tv0OcPtSQbmDwzFQTxW8/uQgksZqO0pElOGG2AkfjlLJGl1kpIO86s
	rBjn2jEZ1mQ==
X-Received: from plblf11.prod.google.com ([2002:a17:902:fb4b:b0:2ea:7f9c:2ce])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:390c:b0:2ea:778e:8652
 with SMTP id d9443c01a7336-2eb36496179mr99072185ad.14.1793633820958; Mon, 02
 Nov 2026 07:37:00 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:30 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-2-vipinsh@google.com>
Subject: [PATCH v6 01/27] vfio/pci: Factor out the reset logic in VFIO PCI
 device close path
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

vfio_pci_core_disable() is a very long function doing multiple things
like exiting runtime power management, setting device to D0 power,
clearing bus master, clearing irqs, freeing eventfds, releasing device
regions, unmapping PCI bars, and performing device/bus resets.

The upcoming VFIO Liveupdate feature will also need to utilize same
reset logic.

Extract device reset code to a new helper function,
vfio_pci_core_try_reset(), and update vfio_pci_core_disable() to use
this new function.

No functional change intended.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 100 ++++++++++++++++---------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 6757054e9d87..7b003c3e5a3a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -680,9 +680,60 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_enable);
 
-void vfio_pci_core_disable(struct vfio_pci_core_device *vdev)
+static void vfio_pci_core_try_reset(struct vfio_pci_core_device *vdev)
 {
+	struct pci_dev *pdev = vdev->pdev;
 	struct pci_dev *bridge;
+
+	vdev->needs_reset = true;
+
+	/*
+	 * If we have saved state, restore it.  If we can reset the device,
+	 * even better.  Resetting with current state seems better than
+	 * nothing, but saving and restoring current state without reset
+	 * is just busy work.
+	 */
+	if (pci_load_and_free_saved_state(pdev, &vdev->pci_saved_state)) {
+		pci_info(pdev, "%s: Couldn't reload saved state\n", __func__);
+
+		if (!vdev->reset_works)
+			return;
+
+		pci_save_state(pdev);
+	}
+
+	/*
+	 * Disable INTx and MSI, presumably to avoid spurious interrupts
+	 * during reset.  Stolen from pci_reset_function()
+	 */
+	pci_write_config_word(pdev, PCI_COMMAND, PCI_COMMAND_INTX_DISABLE);
+
+	/*
+	 * Try to get the locks ourselves to prevent a deadlock. The
+	 * success of this is dependent on being able to lock the device,
+	 * which is not always possible.
+	 * We can not use the "try" reset interface here, which will
+	 * overwrite the previously restored configuration information.
+	 */
+	if (vdev->reset_works) {
+		bridge = pci_upstream_bridge(pdev);
+		if (bridge && !pci_dev_trylock(bridge))
+			goto out_restore_state;
+		if (pci_dev_trylock(pdev)) {
+			if (!__pci_reset_function_locked(pdev))
+				vdev->needs_reset = false;
+			pci_dev_unlock(pdev);
+		}
+		if (bridge)
+			pci_dev_unlock(bridge);
+	}
+
+out_restore_state:
+	pci_restore_state(pdev);
+}
+
+void vfio_pci_core_disable(struct vfio_pci_core_device *vdev)
+{
 	struct pci_dev *pdev = vdev->pdev;
 	struct vfio_pci_dummy_resource *dummy_res, *tmp;
 	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
@@ -757,54 +808,9 @@ void vfio_pci_core_disable(struct vfio_pci_core_device *vdev)
 		kfree(dummy_res);
 	}
 
-	vdev->needs_reset = true;
-
 	vfio_pci_zdev_close_device(vdev);
 
-	/*
-	 * If we have saved state, restore it.  If we can reset the device,
-	 * even better.  Resetting with current state seems better than
-	 * nothing, but saving and restoring current state without reset
-	 * is just busy work.
-	 */
-	if (pci_load_and_free_saved_state(pdev, &vdev->pci_saved_state)) {
-		pci_info(pdev, "%s: Couldn't reload saved state\n", __func__);
-
-		if (!vdev->reset_works)
-			goto out;
-
-		pci_save_state(pdev);
-	}
-
-	/*
-	 * Disable INTx and MSI, presumably to avoid spurious interrupts
-	 * during reset.  Stolen from pci_reset_function()
-	 */
-	pci_write_config_word(pdev, PCI_COMMAND, PCI_COMMAND_INTX_DISABLE);
-
-	/*
-	 * Try to get the locks ourselves to prevent a deadlock. The
-	 * success of this is dependent on being able to lock the device,
-	 * which is not always possible.
-	 * We can not use the "try" reset interface here, which will
-	 * overwrite the previously restored configuration information.
-	 */
-	if (vdev->reset_works) {
-		bridge = pci_upstream_bridge(pdev);
-		if (bridge && !pci_dev_trylock(bridge))
-			goto out_restore_state;
-		if (pci_dev_trylock(pdev)) {
-			if (!__pci_reset_function_locked(pdev))
-				vdev->needs_reset = false;
-			pci_dev_unlock(pdev);
-		}
-		if (bridge)
-			pci_dev_unlock(bridge);
-	}
-
-out_restore_state:
-	pci_restore_state(pdev);
-out:
+	vfio_pci_core_try_reset(vdev);
 	pci_disable_device(pdev);
 
 	vfio_pci_dev_set_try_reset(vdev->vdev.dev_set);
-- 
2.56.0.317.g454f8302e1-goog

