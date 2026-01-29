Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F8367F27
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721971; cv=none; b=BAphAE33rEw9i520TsvxcfSUcCTPjR4HAVdZ3C/rKClRLYVP+vaf6alXLxnTHbMxj6fVYhQa5PsQJfMwbKsiRU877AJFLMe70eaVagvmojJAyoJYVQdwbuhWgTo7HT5AhkyNd16y3aDC/28klAazFNzV8TVSR2qHWBCoJGxHjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721971; c=relaxed/simple;
	bh=PuQG/fB45n7aUAZcDzwF1eani2iX652Um8BM/GdHrKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aGnAXJR8UzGqjNxfO6XiUyav9JVuSA695+Bui6Mi6tZrA/GOlxXVNgfDVTo82UXR9uBRQRkL5WH/p7Pmv7r1zJlKRnjJz70+qaZ2nvM/7kignOEo9eG5g5gUAx6F1XSlJAft/ynClLNkj+omIMc/3ytNBWxW8P0CSn3w/Oo7sO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZ16ggfg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZ16ggfg"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a76b0673dcso12851555ad.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721968; x=1770326768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JG18MDRMH4VUqggxYa+ZNtdyrKhzyTrjCDPr+CW7RY4=;
        b=YZ16ggfgThMakvaPkiOwKSqLjIUwlXsrv8pgb1dsBaIOedEBTeBjltvRX1/yqNjM0u
         94PCo03HyzNhKd44zCNmWyv5jQY03/ruvL0b4U/Dtwxk1Ck33gdIIXralwPwZAJo5hyS
         cRrJASefFpbCGG+uKT5IV/83eBDcfT56ZHiUVVy+LtVlKZFDGlddxW4Fm3fiWWrxgiNX
         rX5AmbN6eFTWHFdUZ1OSXofIXK0ji9K/BMP3mBVKzBmXkagvO2k+0RcFFAsJGxUGF8Bg
         G9KMhERvbDQVz85QKtJPVkUZ6xnszjnKNcp6iwtdRk4Zh98Dy0WGLyciGtbUFu5GVYFM
         rpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721968; x=1770326768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JG18MDRMH4VUqggxYa+ZNtdyrKhzyTrjCDPr+CW7RY4=;
        b=rho201lyeoHrjmxcg+b9f+q2mf47SjizO4vHSovnf/CgQG6GKALX1lX+DY5t2XTuwD
         tRmbCD030DRDtfIM9lLcDEwMOO06vec+yEH0pHiQ2cBF1Lhur/WOvwF0zX689U2/EW20
         BzFZC96RjuNGD5GqXUNfKRkFcV4mcaocyAkkQcFQQ9GN1hfexMoM9XM1YoK8IvcCBzWm
         xv8/9gL3nnt6krdTl3+o4u/3LfjAa7lGfo9sS80ym/Leg4S7tPYKUqh868OHe8TRWIzt
         AHcRmkzzgsSa7NnxkR7uesObse2yJFrW3K141daWocUtz0RwXnI0E+en1k73NxXqkdfx
         1EcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/TbboDAOd9/D3JgVk/XCJbyJvFRd8kSMHSlS1RYjoTj3VUHzggpLz3Icf2lg1ZHPxVEwTGltBeLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQenzWM9LOsaKq7BCRiKZXNjL8skHV12Xv8yhZQcrX9EDttjLF
	4Un7ZPD5FI/eyInyiAPg3F67IRw9VQ9cqIvl2wDdriRShcwpNk5ZF0NzXj8oxk9/gQwe7CQjyMy
	BD8AxKxPI85/XSA==
X-Received: from pldv20.prod.google.com ([2002:a17:902:ca94:b0:29f:2b44:973b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1c1:b0:2a7:90a5:2c95 with SMTP id d9443c01a7336-2a8d819ac05mr6111855ad.51.1769721967422;
 Thu, 29 Jan 2026 13:26:07 -0800 (PST)
Date: Thu, 29 Jan 2026 21:25:05 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-19-dmatlack@google.com>
Subject: [PATCH v2 18/22] vfio: selftests: Add vfio_pci_liveupdate_kexec_test
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

From: Vipin Sharma <vipinsh@google.com>

Add a selftest to exercise preserving a vfio-pci device across a Live
Update. For now the test is extremely simple and just verifies that the
device file can be preserved and retrieved. In the future this test will
be extended to verify more parts about device preservation as they are
implemented.

This test is added to TEST_GEN_PROGS_EXTENDED since it must be run
manually along with a kexec.

To run this test manually:

 $ tools/testing/selftests/vfio/scripts/setup.sh 0000:00:04.0
 $ tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test --stage 1 0000:00:04.0

 $ kexec ...   # NOTE: Exact method will be distro-dependent

 $ tools/testing/selftests/vfio/scripts/setup.sh 0000:00:04.0
 $ tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test --stage 2 0000:00:04.0

The second call to setup.sh is necessary because preserved devices are
not bound to a driver after Live Update. Such devices must be manually
bound by userspace after Live Update via driver_override.

This test is considered passing if all commands exit with 0.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile         |  4 +
 .../vfio/vfio_pci_liveupdate_kexec_test.c     | 89 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 666310872217..55d685f6e540 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -6,6 +6,10 @@ TEST_GEN_PROGS += vfio_pci_device_init_perf_test
 TEST_GEN_PROGS += vfio_pci_driver_test
 TEST_GEN_PROGS += vfio_pci_liveupdate_uapi_test
 
+# This test must be run manually since it requires the user/automation to
+# perform a kexec during the test.
+TEST_GEN_PROGS_EXTENDED += vfio_pci_liveupdate_kexec_test
+
 TEST_FILES += scripts/cleanup.sh
 TEST_FILES += scripts/lib.sh
 TEST_FILES += scripts/run.sh
diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
new file mode 100644
index 000000000000..15b3e3af91d1
--- /dev/null
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <libliveupdate.h>
+#include <libvfio.h>
+
+static const char *device_bdf;
+
+static char state_session[LIVEUPDATE_SESSION_NAME_LENGTH];
+static char device_session[LIVEUPDATE_SESSION_NAME_LENGTH];
+
+enum {
+	STATE_TOKEN,
+	DEVICE_TOKEN,
+};
+
+static void before_kexec(int luo_fd)
+{
+	struct vfio_pci_device *device;
+	struct iommu *iommu;
+	int session_fd;
+	int ret;
+
+	iommu = iommu_init("iommufd");
+	device = vfio_pci_device_init(device_bdf, iommu);
+
+	create_state_file(luo_fd, state_session, STATE_TOKEN, /*next_stage=*/2);
+
+	session_fd = luo_create_session(luo_fd, device_session);
+	VFIO_ASSERT_GE(session_fd, 0);
+
+	printf("Preserving device in session\n");
+	ret = luo_session_preserve_fd(session_fd, device->fd, DEVICE_TOKEN);
+	VFIO_ASSERT_EQ(ret, 0);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+static void after_kexec(int luo_fd, int state_session_fd)
+{
+	struct vfio_pci_device *device;
+	struct iommu *iommu;
+	int session_fd;
+	int device_fd;
+	int stage;
+
+	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
+	VFIO_ASSERT_EQ(stage, 2);
+
+	session_fd = luo_retrieve_session(luo_fd, device_session);
+	VFIO_ASSERT_GE(session_fd, 0);
+
+	printf("Finishing the session before retrieving the device (should fail)\n");
+	VFIO_ASSERT_NE(luo_session_finish(session_fd), 0);
+
+	printf("Retrieving the device FD from LUO\n");
+	device_fd = luo_session_retrieve_fd(session_fd, DEVICE_TOKEN);
+	VFIO_ASSERT_GE(device_fd, 0);
+
+	printf("Finishing the session before binding to iommufd (should fail)\n");
+	VFIO_ASSERT_NE(luo_session_finish(session_fd), 0);
+
+	printf("Binding the device to an iommufd and setting it up\n");
+	iommu = iommu_init("iommufd");
+
+	/*
+	 * This will invoke various ioctls on device_fd such as
+	 * VFIO_DEVICE_GET_INFO. So this is a decent sanity test
+	 * that LUO actually handed us back a valid VFIO device
+	 * file and not something else.
+	 */
+	device = __vfio_pci_device_init(device_bdf, iommu, device_fd);
+
+	printf("Finishing the session\n");
+	VFIO_ASSERT_EQ(luo_session_finish(session_fd), 0);
+
+	vfio_pci_device_cleanup(device);
+	iommu_cleanup(iommu);
+}
+
+int main(int argc, char *argv[])
+{
+	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+
+	sprintf(device_session, "device-%s", device_bdf);
+	sprintf(state_session, "state-%s", device_bdf);
+
+	return luo_test(argc, argv, state_session, before_kexec, after_kexec);
+}
-- 
2.53.0.rc1.225.gd81095ad13-goog

