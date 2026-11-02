Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633849;
	b=IJEGPiiTD/Qk+oCI1CMBKQzcoMkg5mUHjVe8REIaCCSm3DtMFYjJQBvZj7OpflldgZ+g
	 2d3Ju5jRztvHTx6vtGXHtrFtja8G8HdT8/7S++RFQhgegUvqgw5H0qvi4AYCBbSZPIyuo
	 yYf2jg4Ht+cBYBkWMcAyarrZh0XJ0Q8PZ/NhUPXPbnA5BuDHhv+DeN/RFLZ4Fw2zDoB+z
	 vNIIawo0GvUwftBW2JKht1yUxqlOelPMbJdS9EpsAFRohtbIydkBA73XBQ2ez1bBqHo96
	 APRqM6vyxUfzshDgjpKM7kDiHeYOH8brex345KhuVnGpksFQXo4q5imAaiGKYoMnY+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
	b=ymR4YRUPLg3Y0Zhaovqfxs5f6aFhYywPQ+9JoMz3tvNBHsle9gTGvSec6Ld8aA+V30rp
	 X23Qug5B6dEmknIXK8v3gd/5o4rDNdAP0m1mvKRwHTdvG2CTlQKavQKX/Mim0feCOGhK1
	 k8yFNQpn855LkDNcJFeYDBMcHg/pvOwHLBCsN17lR/ijtkegkF4GB8HdTsd/qizRECbVy
	 nAj32awsKvusu5v5xYk4FhS5ctIMnfRSX9jxgpihCeMgk0VKZCtlVOegAnVsGVAxhfIXo
	 ehlNFpWW+5CwlodipG4rM0vKmsGrxXvNOIxZE8PGACyPJ7pkWuHpzG5h8lY2S7Bvo4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cstrl3iW;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652060EDEE5
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9652060EDEE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cstrl3iW
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8dd9b9743so38799725ad.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633848; x=1794238648; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
        b=Cstrl3iWWFZdS21NZSsMRYbcjKaJCNQ9Bw+g9pMxmKPNXMuq2Ol1mIw2imet6uJE0e
         VdeX7qfx+uTEVhfeOQHX8HR8Q9e9wiZ+hvHm43bbSCyuZwsOkY06pUn7CAedbUpJ9IwP
         qwtiD8BpmDJZTt6Vs04H+nmxUOpSCLpwnwAyjHzBc6u0laSyzlqeFQF2XUrqvkA8rCiM
         SnLNl+iWs5wsI/WMMsCwImXIOxl+vjI0byUWvi7QjCagfxD0CgFsEgEPObRnbOSCF0fE
         GLGUM6AVJRDgYQXMpNf0LxWmoja+uSt15UQq7Km6SdHpUryn7gWzLv9iPpcXMdoqNnKC
         ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633848; x=1794238648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
        b=m862sJc3cVtzTKg5Sot9c3VlaEfdjsoZqNyF6x5p7JZ/yPgNMhoa1GSxPly2DR+Hbo
         iZGXloQhMYV4XuiRI3HhuE12rV8bG5GVjRy6uHkSLb7Mo07uL9U7iVC4BOg+6C05qvsW
         5C+bHIuPBgJ5+d7SnG4tQbcrLPE4M+ojcERGxsq5jtSqCE0jT7iyoGIF/WJKzpAxyDXx
         B1W5ihth+paXrzm2eZeKZIFbDEKbM0SY+yCF6F78GAn11ZG391DKjyBrqsTzzp8g5IIx
         PMvtos/BC8lYESho6P8bRB1aUQ9IrYBB6kbhCow5c269GNQmRxKqeFTN4voVxfzCtois
         24IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcAQTAeL/pNxgfaZ4LJl3VV7OCi86rfg26HjAuLEXph1tCoYg0pESz+36py+gpFJTi3nNvlunxBtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5s8nw2hJJHA67pu3sGnnPoKcT/03AejzWeyO21ptXv90EZQw
	EBUt9WppDvjZ7cZVnT9qbTol29QAXC3pvZcoWVTnmFvY+5TxLgl7r6kNcFRZiu8Rk08Ld6JrPNJ
	XaxWiK7ynZw==
X-Received: from plbkl7.prod.google.com ([2002:a17:903:747:b0:2e9:dea5:138])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db01:b0:2d9:599e:df95
 with SMTP id d9443c01a7336-2eb3640503dmr101937705ad.3.1793633847651; Mon, 02
 Nov 2026 07:37:27 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:55 -0800
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
Message-ID: <20261102153656.1431701-27-vipinsh@google.com>
Subject: [PATCH v6 26/27] vfio: selftests: Verify that opening VFIO device
 fails during Live Update
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

Verify that opening a VFIO device through its cdev file and via
VFIO_GROUP_GET_DEVICE_FD both fail with -EBUSY if the device was
preserved across a Live Update. When a device file is preserved across a
Live Update, the file must be retrieved from /dev/liveupdate, not from
VFIO directly.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/vfio_pci_liveupdate_kexec_test.c     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
index 4919175c1173..9610fe593cf6 100644
--- a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <fcntl.h>
+#include <limits.h>
+#include <sys/ioctl.h>
+#include <linux/vfio.h>
 #include <libliveupdate.h>
 #include <libvfio.h>
 
@@ -56,6 +59,39 @@ static void before_kexec(int luo_fd)
 	daemonize_and_wait();
 }
 
+static void check_open_vfio_device_fails(void)
+{
+	const char *cdev_path = __vfio_pci_get_cdev_path(device_bdf, true);
+	char group_path[PATH_MAX];
+	int group_fd;
+	int group;
+	int ret;
+
+	VFIO_ASSERT_NOT_NULL(cdev_path);
+
+	ret = open(cdev_path, O_RDWR);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+	free((void *)cdev_path);
+
+	if (__sysfs_iommu_group_get(device_bdf, &group))
+		return;
+
+	snprintf_assert(group_path, sizeof(group_path), "/dev/vfio/noiommu-%d",
+			group);
+	group_fd = open(group_path, O_RDWR);
+	if (group_fd < 0) {
+		VFIO_ASSERT_EQ(errno, ENOENT);
+		return;
+	}
+
+	ret = ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, device_bdf);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+
+	VFIO_ASSERT_EQ(close(group_fd), 0);
+}
+
 static void after_kexec(int luo_fd, int state_session_fd)
 {
 	struct vfio_pci_device *device;
@@ -64,6 +100,8 @@ static void after_kexec(int luo_fd, int state_session_fd)
 	int device_fd;
 	int stage;
 
+	check_open_vfio_device_fails();
+
 	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
 	VFIO_ASSERT_EQ(stage, 2);
 
-- 
2.56.0.317.g454f8302e1-goog

