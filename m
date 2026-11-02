Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633841;
	b=XnlDSb1j0xfkVJE7m+YZaMVheaXHLuCiEKlQFRUc6b8a5fSBFMaIev1biUmlrEA/S/gx
	 WuXo3mNzqyIfSt32McuXG4Ry5t306Y6qkd2HrQk+EpDchflNwDhiNWMNuBYvWfZotCbEf
	 v2u0BOx9oM0ZFyzBBF5oAgSX84IuMxvaagZDrY0uKmhIklQAArfkkhMMFZrzVykYnuTNi
	 qoT+Aasw5VSA8ZhXkQRtMeM8qlGTMvGiH/keozrdKBmHMwgYBdhrQwH4M/7HL1OyzyKmu
	 P1tj1tAYlVNkVdg+xkhosOcQJutxYo2w6Cd1gqg06ksIePVxtL1aoKl9quXGdK9y4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
	b=YLQXZmh0zjAwrJf4fNjCT+hxM0+OLoa9nK3LvcYO/pIr0FSh8PpIcFA3QwN3+kvdKP2C
	 S0WjB7NktPttHNut+461OWvLES5PrHHHktsHYEIyq7SvHqd/G9SSpC/ARAh0mls8bBn7K
	 XZYuoF1JgJpsiI9dLy0IuaUU7gCGhNXzl4AsbfR9o9nzbAJUCv6uC3J5STcdUYdu7N4vd
	 TwSGc8NrOxcXwZ4bq7ROIgOJepPZZHymi2gmFj+5yyffU2SKnx6ArWXMm0hLBLgZ/W4Hl
	 r88ILkjzqOrL+G/7X778meWXpbbGZKkmSUs6MOSsLcpxAzStp4QVpW61WEfAJdIiC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YuNUml4z;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E060EA5E1
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288E060EA5E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YuNUml4z
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2664686a91.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633839; x=1794238639; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=YuNUml4zH5ZHRF+F04Y7wZI2Du7rDKxyBW+kJiSWbxaOMaxfx2YJgwtnteKndFaeMU
         98s6w51k5AYecfjYWhc3MYYHhUtImK75pts8pb+0GFwvFi7w0vtp9tj1PZmkGZsV84gJ
         xPCJPb4d3wfZIT4to5hUUq9Ao2dMaNm77qyY/QVJWg7pFYQ7A/yDVdNKewYByOOnTmhL
         t6zR/lVN3HCZ8Incyv+jQRM9rZdS/VIMvk8nWsYXE51hvqRk+W0ZvCwFPcmUuoMMAiNd
         0YrrXkQ+z9u3VqHi+8vh4p49Wncxt6fL/niRcmmRcPZMou2OxoCHoSmc018ApFcTj0RM
         vI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633839; x=1794238639;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=U4o6pY8hrGfkihvtKP2bIvDya4t7aL8F/BG3mJQoYS+DKMgc2YQF5dm2963hM8BJKb
         bQGX7TlQtWecGqHX01arEToH6ugmrZcypHxRijxQK6y9QF0GzY/Pw1kSFjXskAPFse/g
         bnK/6JwpQ6Vd0H5QInYHXqr7R5SOmXp9VsYtLitAHiq5c6/Dil9kJSjG9If1gLEiH8YM
         gKv+zm/1pptYlech9TvWlFtwmtGKh7kh4RKaE8GogvJhSeBAq45DoLutv/mYrHhQOUZ6
         t4KHTi2LnCaluu/GP1ESsBcnLTssKuteXxxshO/ZvgNadT5KMlwmeeav/orhc89v+gkr
         ijGA==
X-Forwarded-Encrypted: i=1; AKwUvBznu1RQHl+lWUAE1YEz4ZJomlgMlRzLCptdlMTu/aVhGr/hnbSLmqGZU7up2r8SXRURHDMmO3c46aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/94MrhjQmUnS3eF1JPuRXmsIc2c3GDXClmXP/gjRxV9yL4tDwM
	vzKwWiFKh9nhWQ5StTbthL+iuoxd5vDh8fJdHFcwIYHBVek3US4CYscOMTqTxgh7iPyxefdrgm3
	pIqkjcRF/1Q==
X-Received: from pjat8.prod.google.com ([2002:a17:90a:d08:b0:3ac:3195:12b4])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5870:b0:3ad:6090:a189
 with SMTP id 98e67ed59e1d1-3ae8983e2f3mr7697277a91.45.1793633839167; Mon, 02
 Nov 2026 07:37:19 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:47 -0800
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
Message-ID: <20261102153656.1431701-19-vipinsh@google.com>
Subject: [PATCH v6 18/27] vfio: selftests: Initialize vfio_pci_device using a
 VFIO cdev FD
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

Use the given VFIO cdev FD to initialize vfio_pci_device in VFIO
selftests. Add the assertion to make sure that passed cdev FD is not
used with legacy VFIO APIs. If VFIO cdev FD is provided then do not open
the device instead use the FD for any interaction with the device.

This API will allow writing selftests where VFIO device FD is preserved
using liveupdate and retrieved later using liveupdate ioctl after kexec.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  3 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index e19bd94b8dd2..9a62bfb6b440 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -40,6 +40,9 @@ struct vfio_pci_device {
 
 struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_free(struct vfio_pci_device *device);
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd);
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);
 
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..af789c859586 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -457,9 +457,13 @@ void vfio_pci_cdev_open(struct vfio_pci_device *device, const char *bdf)
 }
 
 static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
-				   const char *bdf, const char *vf_token)
+				   const char *bdf, int device_fd,
+				   const char *vf_token)
 {
-	vfio_pci_cdev_open(device, bdf);
+	if (device_fd >= 0)
+		device->fd = device_fd;
+	else
+		vfio_pci_cdev_open(device, bdf);
 	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
 	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
 }
@@ -482,16 +486,20 @@ void vfio_pci_device_free(struct vfio_pci_device *device)
 	free(device);
 }
 
-struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd)
 {
 	struct vfio_pci_device *device;
 
 	device = vfio_pci_device_alloc(bdf, iommu);
 
-	if (iommu->mode->container_path)
+	if (iommu->mode->container_path) {
+		VFIO_ASSERT_EQ(device_fd, -1);
 		vfio_pci_container_setup(device, bdf, NULL);
-	else
-		vfio_pci_iommufd_setup(device, bdf, NULL);
+	} else {
+		vfio_pci_iommufd_setup(device, bdf, device_fd, NULL);
+	}
 
 	vfio_pci_device_setup(device);
 	vfio_pci_driver_probe(device);
@@ -499,6 +507,11 @@ struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iomm
 	return device;
 }
 
+struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+{
+	return __vfio_pci_device_init(bdf, iommu, /*device_fd=*/-1);
+}
+
 void vfio_pci_device_cleanup(struct vfio_pci_device *device)
 {
 	int i;
-- 
2.56.0.317.g454f8302e1-goog

