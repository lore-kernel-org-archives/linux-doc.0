Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3A5DF1D
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003105; cv=none; b=WfRAV2a7fFq2rxcsdwQOnZxnH92Dz52ag1HWlerXvEAovNkaCFaMSbAWgjXvFFC6Bw0k1KC86k/UWkowXbTscHb1V1NArQXSJ3D9VQvVG5aDJbaGOOBJ1IUCEi2KfXWEQkxk+EsyjWStHUQCNeOiZ/hvr0JJqDPRllSKv8vpOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003105; c=relaxed/simple;
	bh=02ujaudo3KSmsF5K5ztuR/Ql8u25boOsUld4kW2EV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiRV+fKDO2O8ZnPcIQOpQuRnakb8mcyggq79+7413nYT2r3NA3mIo3u6cu6NaBYSPFPiOGbUcqQhS9l9AzBDQFQxdVbOR4XQkbpn761bzJlvFmZVQzqio+jiuijUYOekrhBfjiEYla/2X68DdqAV5yYvPjpYz5l1OtVqRpWnAfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WaplHwgn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WaplHwgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706003102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXd3AZjPKhslGVevCwKeJnsSWxdJPCffQSFxc+gLUxI=;
	b=WaplHwgnrk0/h8BoMc8Acoka9nK8+q1eCOMVmjMqr7GA1ndM+FqGrESnc86g37PO+NkHPc
	5XFXLOWN45zy9dNtUXRdcxP6rlvZ0yXkEcaEJ8P1vekq4zbRd2fA9j4TdOwvLSXmF3VWbG
	8fQhcAw2i1bARDjx0sCP6nPAo/9qWJc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-Wp2CpIoUPJWrxlJztAG_IQ-1; Tue, 23 Jan 2024 04:45:01 -0500
X-MC-Unique: Wp2CpIoUPJWrxlJztAG_IQ-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-469be81ec74so294610137.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 01:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003101; x=1706607901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXd3AZjPKhslGVevCwKeJnsSWxdJPCffQSFxc+gLUxI=;
        b=FhHqnu+32xg1aXLa4h7Ujyrro+4OY3QFmGV1N2IcEcHxzKrR+4CL9ZYAAFtA0D2iWY
         zRNQqedWFuVZr+rpbSNNTF9LUfFDtNSzeWrLY0qa6zQpB7Y411ecuJWr08WXu+KsXedJ
         o2asco7/s5FxpeGgovxkNavPzGoDOTiXOLsXQl9FsF8TX1utJ4q3k+YUtD3VyOOpIeVG
         RyDske2X5FdTVALC3fhB6oVVwlK4nOw8m9UTlNON5nuZnh1P6pVJ1Tx7ZjzZopUeF7zR
         YIwYOPqDn+L4aoBZV/jJDkHqQnkpSgy5I8Td9Or+iYlzfN7kCMfIVLKa6qQu98vgLxNw
         wuXw==
X-Gm-Message-State: AOJu0Yzzu0hSRSaKTfsJDthNv3GMgffvtIthH4gnxuwR5xumKoIjWwTu
	we52W6diuN1IS12iN8uzyvwG2vo+Srb65CsGric6cy85zhAdXYiOG3rJI5l+m9NIhjweBvDahjK
	4lpHZOM8Zfo2GWwTYAB7cyoFkr35bcvFO73Fetus1AKc8g05PtF76OjwJ6w==
X-Received: by 2002:a05:6122:1684:b0:4bd:4151:936f with SMTP id 4-20020a056122168400b004bd4151936fmr409249vkl.1.1706003100839;
        Tue, 23 Jan 2024 01:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRoL1ahcR75vBLXWQC/4Tfk26KCchDZ9UlSe50TIl+tMW6CAPN/T2lwZOJ68o/lL+18tX5pQ==
X-Received: by 2002:a05:6122:1684:b0:4bd:4151:936f with SMTP id 4-20020a056122168400b004bd4151936fmr409238vkl.1.1706003100567;
        Tue, 23 Jan 2024 01:45:00 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:45:00 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dakr@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 07/10] PCI: give pcim_set_mwi() its own devres callback
Date: Tue, 23 Jan 2024 10:43:04 +0100
Message-ID: <20240123094317.15958-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Managing pci_set_mwi() with devres can easily be done with its own
callback, without the necessity to store any state about it in a
device-related struct.

Remove the MWI state from struct pci_devres.
Give pcim_set_mwi() a separate devres-callback.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 29 ++++++++++++++++++-----------
 drivers/pci/pci.h    |  1 -
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 03336a2f00d6..d396d672a6f4 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -370,24 +370,34 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
 }
 EXPORT_SYMBOL(devm_pci_remap_cfg_resource);
 
+static void __pcim_clear_mwi(void *pdev_raw)
+{
+	struct pci_dev *pdev = pdev_raw;
+
+	pci_clear_mwi(pdev);
+}
+
 /**
  * pcim_set_mwi - a device-managed pci_set_mwi()
- * @dev: the PCI device for which MWI is enabled
+ * @pdev: the PCI device for which MWI is enabled
  *
  * Managed pci_set_mwi().
  *
  * RETURNS: An appropriate -ERRNO error value on error, or zero for success.
  */
-int pcim_set_mwi(struct pci_dev *dev)
+int pcim_set_mwi(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
+	int ret;
 
-	dr = find_pci_dr(dev);
-	if (!dr)
-		return -ENOMEM;
+	ret = devm_add_action(&pdev->dev, __pcim_clear_mwi, pdev);
+	if (ret != 0)
+		return ret;
+
+	ret = pci_set_mwi(pdev);
+	if (ret != 0)
+		devm_remove_action(&pdev->dev, __pcim_clear_mwi, pdev);
 
-	dr->mwi = 1;
-	return pci_set_mwi(dev);
+	return ret;
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
@@ -397,9 +407,6 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
 
-	if (this->mwi)
-		pci_clear_mwi(dev);
-
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3d9908a69ebf..667bfdd61d5e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -811,7 +811,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-	unsigned int mwi:1;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
-- 
2.43.0

