Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633842;
	b=snzkAZR3ZOLv9z1IciCufDlo1BXLufsqIjD7/V+HIO5uSA4OIV2UXb+lRY7HaBtdBteH
	 dOaFKa0WeTXceNDf/yo2LZ7fd9XOU38NOpBLul6KWsT5P2K7yqwz8gPi+u63Ycoc0b4Lq
	 YwiX7TdgBfhxB+1j42D3nuy0TQnUYaRElVNm244qWnw2K3nEuBpsZmqtxX6cUG8qgKDma
	 omoqJOQDUKf+Zlk4DWsC72b4Pvct3+1jic/yHZSfZrZyp5Ca9AZ/35C7HdLS3f9DuQD9b
	 t1gfUb1nyAgrf6E/t6wEAOMDIGoR5uTI495y+NWGIB55PouYr2N8zIs6h21mkQtS1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
	b=DyXWNr3HOUCdMtacLkxXXq7Gzq24ll9BgixieRjjMJxllkQC79jW1r3n3rjD5YssyvHl
	 jnoLMH8BHd9Dbjcif6xVhSUZ7WFDQPGw2s6UoCE4qPGZ7wsoegrQIwZk3LK1VWSYhawNn
	 185dyLz3C1TL2BXUvjNkFPh8/yppyCpgWUde4/oEDMw2R43eqSE6fvYjTHG9oVDVI5uCT
	 0PfG/ZE+uyhWQnGj2/7a9+OkdE6kgw1LZ6WE17TWG+bCO6FtD23HHYxa4qI2ugkeNtlL0
	 hFtjxGytLEnvsbVnBE9nggdfYpg1rgJ78cbTZrPXz7A3Iz8++5fXYEcn1TxElXPNJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh1oMFk;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D960EB617
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9D960EB617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh1oMFk
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso3787963a91.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633841; x=1794238641; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
        b=SYh1oMFkhceG3pV1vARm5UfRZJq/jUcCzAISHYUSPXhNGXhCb5BtUK7Rnu5bZ07z0A
         NINrqT14ux5wmPIAGNZ2ebwGFVxRBp/gBvFHWdSA0dO/eppTb9OxbXw5O9JBI7B2t8A5
         O10mjjrBBNOAeDLfjFxdN1ccMIW1uPoqqMN9/wxsUhbjJelZL3r6ubNoqS4MKHE7ngil
         JxmTdd9pDgUSx6b+CgNuX11RmF7nayjrBBIOArHf4D922eH1g47CkGhnr9W75v/6qZiV
         Ynx9s5Dr1qI+56RbDLqIwO0M4SN0RCTJqhDSg2uPZawsZx3Gaes369FwVLwuXtY4PoFn
         CHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633841; x=1794238641;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
        b=PnLykc/QIKNEiQK8L0CjyZge7foPQT6lGQW4dsZfFHr6e8re91xcRSmsC6QaSMTDzz
         DP6O1Hv/ebwV3hKOvw3YVf6meI3yGeWEhxfaofBIIc5bO58OooOMP4TAzDtMwO8FIJ87
         tKnM3BHY9X1FWl4ogNN/tqBCnX6leO6JiR7w60QttckFMErA0XVpsUzQcYQxkpBcV/Wd
         CT7A5JgzFWy5Zi1jt3HW0bmPSO0Az8yHRn83EXwnWbZF8vbPMqiEc48Gjp3wQ/aQ9utO
         Hxvnau2cWxVifXaGHdxCehsHWSqwSqUduj4/pOUIpuqxoYu7e8w2h1+e3Wa8hVTexNLK
         Z1rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDChxaEKuSL3x8PJp0kM3EI7aCBdWV79AWyMoDWhGPg9yRZmtwwtz/sl/KQ3UHs5ZG/xPljG9ve7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L4zKr1JKTvjO37XbwO9tlmqcIKHGuuyZ9ewip2HPiLYB6Nj63
	rFWBF1kM1XnQKzPeOqgUU/uqfWFKpWAiojZ/A28XWJlWAG9R65ZZb4CO/cgXXBuRZRVmfdeBBKy
	nWv4ahj4hkw==
X-Received: from pjqc8.prod.google.com ([2002:a17:90a:a608:b0:3ae:5572:c4d3])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e88:b0:3ac:85be:cd52
 with SMTP id 98e67ed59e1d1-3ae89867829mr8253650a91.59.1793633841328; Mon, 02
 Nov 2026 07:37:21 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:49 -0800
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
Message-ID: <20261102153656.1431701-21-vipinsh@google.com>
Subject: [PATCH v6 20/27] vfio: selftests: Add iommufd noiommu mode
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

Add an opt-in iommufd_noiommu mode (MODE_IOMMUFD_NOIOMMU) for devices
bound to vfio-pci in noiommu mode. When a device is in noiommu mode, its
VFIO character device is named /dev/vfio/devices/noiommu-vfioX (opening
it requires CAP_SYS_RAWIO), and binding and attaching to an iommufd IOAS
use a software page table.

Add __vfio_pci_get_cdev_path(bdf, noiommu) to look up either the regular
or the noiommu cdev path and return NULL when none is present, and make
vfio_pci_cdev_open() select the cdev based on mode->noiommu.

Because a device in noiommu mode DMAs directly to physical addresses,
tests that program arbitrary or unmapped IOVAs would corrupt memory.
Keep MODE_IOMMUFD_NOIOMMU out of FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES()
so that only noiommu-aware tests opt into it.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          | 17 ++++++++++
 .../lib/include/libvfio/vfio_pci_device.h     |  7 +++++
 tools/testing/selftests/vfio/lib/iommu.c      |  9 +++++-
 .../selftests/vfio/lib/vfio_pci_device.c      | 31 +++++++++++++------
 4 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..e652b8caf5bb 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -13,6 +13,12 @@ struct iommu_mode {
 	const char *name;
 	const char *container_path;
 	unsigned long iommu_type;
+	/*
+	 * For devices bound to vfio-pci in noiommu mode, i.e. not behind an
+	 * IOMMU. Such devices DMA to the addresses programmed into them as
+	 * physical addresses.
+	 */
+	bool noiommu;
 };
 
 extern const char *default_iommu_mode;
@@ -67,6 +73,17 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges);
 #define MODE_IOMMUFD_COMPAT_TYPE1V2 "iommufd_compat_type1v2"
 #define MODE_IOMMUFD "iommufd"
 
+/*
+ * iommufd with a device bound to vfio-pci in noiommu mode
+ * (vfio.enable_unsafe_noiommu_mode=1 and CONFIG_IOMMUFD_NOIOMMU), whose cdev
+ * is /dev/vfio/devices/noiommu-vfioX. Opening it requires CAP_SYS_RAWIO.
+ *
+ * Not part of FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(): tests must opt in, since
+ * the device DMAs to IOVAs as physical addresses, and tests that DMA to
+ * arbitrary or unmapped IOVAs would corrupt memory.
+ */
+#define MODE_IOMMUFD_NOIOMMU "iommufd_noiommu"
+
 /*
  * Generator for VFIO selftests fixture variants that replicate across all
  * possible IOMMU modes. Tests must define FIXTURE_VARIANT_ADD_IOMMU_MODE()
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 9a62bfb6b440..bfadeb362723 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -154,6 +154,13 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
 }
 
+/*
+ * Return the path of the VFIO cdev of @bdf, or NULL if there is none. The cdev
+ * of a device bound to vfio-pci in noiommu mode is named noiommu-vfioX rather
+ * than vfioX, and @noiommu selects which of the two to look for. Free with
+ * free().
+ */
+const char *__vfio_pci_get_cdev_path(const char *bdf, bool noiommu);
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index b6f3c5c84e01..0df49646d016 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -22,7 +22,10 @@
 
 const char *default_iommu_mode = MODE_IOMMUFD;
 
-/* Reminder: Keep in sync with FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(). */
+/*
+ * Reminder: Keep in sync with FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(), which
+ * deliberately leaves out the noiommu modes.
+ */
 static const struct iommu_mode iommu_modes[] = {
 	{
 		.name = MODE_VFIO_TYPE1_IOMMU,
@@ -47,6 +50,10 @@ static const struct iommu_mode iommu_modes[] = {
 	{
 		.name = MODE_IOMMUFD,
 	},
+	{
+		.name = MODE_IOMMUFD_NOIOMMU,
+		.noiommu = true,
+	},
 };
 
 static const struct iommu_mode *lookup_iommu_mode(const char *iommu_mode)
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index af789c859586..b0deef2b0e3f 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -380,35 +380,42 @@ static void vfio_pci_device_setup(struct vfio_pci_device *device)
 		device->msi_eventfds[i] = -1;
 }
 
-const char *vfio_pci_get_cdev_path(const char *bdf)
+const char *__vfio_pci_get_cdev_path(const char *bdf, bool noiommu)
 {
+	const char *prefix = noiommu ? "noiommu-vfio" : "vfio";
 	char dir_path[PATH_MAX];
 	struct dirent *entry;
-	char *cdev_path;
+	char *cdev_path = NULL;
 	DIR *dir;
 
-	cdev_path = calloc_assert(PATH_MAX, 1);
-
 	snprintf_assert(dir_path, sizeof(dir_path), "/sys/bus/pci/devices/%s/vfio-dev/", bdf);
 
 	dir = opendir(dir_path);
-	VFIO_ASSERT_NOT_NULL(dir, "Failed to open directory %s\n", dir_path);
+	if (!dir)
+		return NULL;
 
 	while ((entry = readdir(dir)) != NULL) {
-		/* Find the file that starts with "vfio" */
-		if (strncmp("vfio", entry->d_name, 4))
+		if (strncmp(prefix, entry->d_name, strlen(prefix)))
 			continue;
 
+		cdev_path = calloc_assert(PATH_MAX, 1);
 		snprintf_assert(cdev_path, PATH_MAX, "/dev/vfio/devices/%s", entry->d_name);
 		break;
 	}
 
-	VFIO_ASSERT_NE(cdev_path[0], 0, "Failed to find vfio cdev file.\n");
 	VFIO_ASSERT_EQ(closedir(dir), 0);
 
 	return cdev_path;
 }
 
+const char *vfio_pci_get_cdev_path(const char *bdf)
+{
+	const char *cdev_path = __vfio_pci_get_cdev_path(bdf, false);
+
+	VFIO_ASSERT_NOT_NULL(cdev_path, "Failed to find vfio cdev file for %s\n", bdf);
+	return cdev_path;
+}
+
 int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 {
 	struct vfio_device_bind_iommufd args = {
@@ -449,10 +456,14 @@ static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
 
 void vfio_pci_cdev_open(struct vfio_pci_device *device, const char *bdf)
 {
-	const char *cdev_path = vfio_pci_get_cdev_path(bdf);
+	bool noiommu = device->iommu->mode->noiommu;
+	const char *cdev_path = __vfio_pci_get_cdev_path(bdf, noiommu);
+
+	VFIO_ASSERT_NOT_NULL(cdev_path, "Failed to find %svfio cdev file for %s\n",
+			     noiommu ? "noiommu-" : "", bdf);
 
 	device->fd = open(cdev_path, O_RDWR);
-	VFIO_ASSERT_GE(device->fd, 0);
+	VFIO_ASSERT_GE(device->fd, 0, "open(%s) failed\n", cdev_path);
 	free((void *)cdev_path);
 }
 
-- 
2.56.0.317.g454f8302e1-goog

