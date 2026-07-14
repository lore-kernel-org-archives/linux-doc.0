Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDA494A17
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042135; cv=none; b=OIGv0uxESaNibJKxDnjYq7cg60Rcwfqqkd22XOGU05OicNSbuCd0hZ8K84F0NJVG+jHOCrr5ddnowc1WxMqE82phnhxQjQRT9JPdRgKyHCYsE0j2C6nXKw540SLz8JLbzlWnV0T/ZJ3urw1oSO5Bdo1tuPWmGm+65pha5tBW/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042135; c=relaxed/simple;
	bh=iM8RSTeJkKuQ7uZ+HeWVjXp4kjNux7fkyVX+jcY2FXU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FRlI5/ML8KQlWXMJlQluUw8re6FEVTnQGtljhIo3R4wSpAiVwHE3fQgyKwAlGjXylKJDtHSTgLqP5iKE1DszJp34kuhHFhfI0jSqmfUQgfE7yCnQOnxrqiyKVuVDLNGvaGjSnWqOw/MwbaeCAPAV7b8YuUNXlxQjqIQL0N+2L7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jtu2/c6o; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jtu2/c6o"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8488ac68185so6844309b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042130; x=1784646930; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tk/1w3UkNj58XSSYbOe8ncPxmDwQIUvhVdPzzBUFHPI=;
        b=Jtu2/c6oFwtUtbK2rAjE6drE9/ydkTrGzccUaezbebLupdGEwpOs2wjVUbYqszn8Gr
         zYdPxLoTrxZcJDAUNEzLmkyFag0at+pT5cDIz8DcmWX22hMz2p65hUzVPXljUM2gYx8S
         S9yHKbBAqsFKLHYlOBgLRsKQhJuHdhgCrsItJFefrCHUbVeicFG4TkmnXTXRUa04XV+t
         V/69Sz4gMxkziZgA4f0Vu+qZm8utK59arESUve6r5pZREnV58LZogOg/DwOvXKkuz/1i
         Eqw0uaipSDn5y1btBKPTVus77JYyeoboxrvTMz+sy3zZdQuK7snfT1qFJerB9/9JPnO4
         dRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042130; x=1784646930;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tk/1w3UkNj58XSSYbOe8ncPxmDwQIUvhVdPzzBUFHPI=;
        b=S3sGCzqDxBe9MuhE7p5cyiL6kNPxK8f/MMvU1VAhSs0d+UIoSSAb/AQxPQKpAZgRtw
         9fX649CrVYAetF0UGEbNojVSk4Ukr88bd38isWcFrGenIuS7OLGs9BufyHcIjN6wX5Kc
         NHXyhQGz8/fNo/gZd3S6IlC4A5jtv+RNYtG12BqG0a3w35rsDDGipZkZTrTDNX6mGtMI
         TO4dXHspWB9Fsd1b1NFCyXzaR6Vgs1zXDlYcGtYKsRfbxjwZVPizBAn2zePWNinYYLDo
         9sQfhVPDjoPXaMF3hKLBgsGlOgPYMvW1Fndy8JrOVEG0mPLcStbdgU51p3T2u08YE8F/
         q5UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFWExuGi2lYvwVAoYpjtXlJqojnt9cuYPXokV8aAwjwLhPcku/VcyyDPdsN5xeJ6bnMjgWtQb/bPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/i6eWZ7+fg8l5idwi0p7yqRyKkl8nLZteJW7BFw9vkVX+QKy
	66VjPH0R3V+2Vji/moMe9RPqAKPa2/qklpUfjvnfEh/PWQJOMfKHZk+TDEk3rQbxb8tnjAI7oTl
	N7HRuNZuS5Q==
X-Received: from pfet14.prod.google.com ([2002:aa7:938e:0:b0:84a:1163:2ad0])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c88:b0:847:83bd:6676
 with SMTP id d2e1a72fcca58-8488963aa37mr12799379b3a.17.1784042129679; Tue, 14
 Jul 2026 08:15:29 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:15:04 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-20-vipinsh@google.com>
Subject: [PATCH v5 19/20] vfio: selftests: Verify that opening VFIO device
 fails during Live Update
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

From: David Matlack <dmatlack@google.com>

Verify that opening a VFIO device through its cdev file and via
VFIO_GROUP_GET_DEVICE_FD both fail with -EBUSY if the device was
preserved across a Live Update. When a device file is preserved across a
Live Update, the file must be retrieved from /dev/liveupdate, not from
VFIO directly.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/vfio_pci_liveupdate_kexec_test.c     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
index 15b3e3af91d1..ec3fe8f19502 100644
--- a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
@@ -36,6 +36,42 @@ static void before_kexec(int luo_fd)
 	daemonize_and_wait();
 }
 
+static void check_open_vfio_device_fails(void)
+{
+	const char *cdev_path = vfio_pci_get_cdev_path(device_bdf);
+	struct vfio_pci_device *device;
+	struct iommu *iommu;
+	int ret, i;
+
+	printf("Checking open(%s) fails\n", cdev_path);
+	ret = open(cdev_path, O_RDWR);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+	free((void *)cdev_path);
+
+	for (i = 0; i < nr_iommu_modes; i++) {
+		if (!iommu_modes[i].container_path)
+			continue;
+
+		iommu = iommu_init(iommu_modes[i].name);
+
+		device = vfio_pci_device_alloc(device_bdf, iommu);
+		vfio_pci_group_setup(device, device_bdf);
+		vfio_container_set_iommu(device);
+
+		printf("Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, \"%s\") fails (%s)\n",
+		       device_bdf, iommu_modes[i].name);
+
+		ret = ioctl(device->group_fd, VFIO_GROUP_GET_DEVICE_FD, device->bdf);
+		VFIO_ASSERT_EQ(ret, -1);
+		VFIO_ASSERT_EQ(errno, EBUSY);
+
+		close(device->group_fd);
+		free(device);
+		iommu_cleanup(iommu);
+	}
+}
+
 static void after_kexec(int luo_fd, int state_session_fd)
 {
 	struct vfio_pci_device *device;
@@ -44,6 +80,8 @@ static void after_kexec(int luo_fd, int state_session_fd)
 	int device_fd;
 	int stage;
 
+	check_open_vfio_device_fails();
+
 	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
 	VFIO_ASSERT_EQ(stage, 2);
 
-- 
2.55.0.795.g602f6c329a-goog

