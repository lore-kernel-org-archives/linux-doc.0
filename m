Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176627E7E9
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036681; cv=none; b=U+Ud0OI673FZG58MSIflv32/QrE5udHr20/Hflcp9LFlMLp6DN/7MjAtOcptFINd3WXHMgorT6WS8Nho13jEi60AjyV+mmDdhgfGJmwo69PXTfud7A6+g16xVKS1jcDi1BMAbwmoWQFKChmnyuyHCx+fFzXYXVvUdsf1si8/Qu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036681; c=relaxed/simple;
	bh=Pt1H2NqKNJM2Nyqg1OGfPH7Lob5zRf30NWeWOGzqUs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxyRcGL/8xhqZQUX4/Yj5WIm73d+AgvBhi7jhl5Ghg9jtyKgQGJYbncy362cKmipaTFCFz0Mj5VRGB7NvDxkXpwyhoFKh/Z5KJdv6hm+Mm481eA2y5LNC6CtlyKniuIVR+mb8K/68QaAW3F4tbN5bo/bBTqgRZ2LJh+0W0e0LQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fyjAs3Fy; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fyjAs3Fy"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f6970326so2622246d6.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036679; x=1746641479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw3X5p6Hy+2rJiulBTqaYUggRZ+nbTaNRc7v49X1EHE=;
        b=fyjAs3Fy/C69xZzZkYTkc4/8RP+rg+MZBnGNnJECaMd0aMb/6IfQG875CLrJM8NSv2
         nxNPoVIhnlyi5z9Z6aQi5ko9+ruaVuNvMGu2LtBQSe6ms/Ks/EVNLuaWQCmL5m87S0sG
         vgSc4sfApaVq9PfFlMhBHWFZPe7rAEOZWy71iWnz7YMDGIgWeidYp17LhIZnmWWLdEzy
         xGdcHpwLpiUxnJO8ZxJyIv37N9lCoScnJTP3fhMrAeMfMhU32hJ2GfpejLevryEWrpG0
         5pui5isRqqDOMxP++s8CaVOIR0+3xaD52MRuhSq435IkQRUiBEcGBu3LAd0QDWI+RhF/
         KBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036679; x=1746641479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bw3X5p6Hy+2rJiulBTqaYUggRZ+nbTaNRc7v49X1EHE=;
        b=T3q8zWGhMEWHHaQG/83g1XzxwQU14eOwMXfpeKEHK2Y3YRZQV3SJxBgXRtYGqOcYKt
         d/jqMjdD6Q/6+0kVh9UKDLT2qPGl8UREu8TTrq8j3X85kf35XYNM2ly2Ur8/rTHUMU+W
         6aCRnp9KA5GlL5bPRlPQ/xQQVwfiplJ/8z2ehdxuDt8T1whStD1rtNB5TZBrAkgF89Dz
         DFNmppjBfQHDsDM7XWftW+7tFMt2h9nGY7O2HHgWt/EhTdRzAiNbFxvlHbpJR17nJbw8
         NkmaeLoZuK7j6AjtdetTFh4BgoxFaSysd/kswNFNWE44qrDx2S3ziufDoK90p/1kOiTk
         bcpg==
X-Gm-Message-State: AOJu0YxSdHar/dnkoamCKuE2kWYkUb0rLA82Ft68xKnaJn/KDt+GXDO3
	vmDDlriX4k5QtCFGj7jt3KXny1OO2OFNTN6DICOZGuHcxuWWEtZtA7cNfXpCLGo=
X-Gm-Gg: ASbGncuoKI08MLhb2alYwy0cVEdDms4UrjVUfk3iZvlO90o1VSkPFMSXhubEHGAVpuz
	GuGrs8iosYx5JCWTAWQoTSWfpOjQmLRi3FTDyF8WX965VmvR1th0V3KA/X5OlKzx0JRjXbfv6Vg
	yKwEwpDu3e0lS0CXsSatuu9seU4Tz9DFGZhSvnyDUibIfqXuocmAF802Ftw+sQQzKaSQUMZyY8h
	kioPnmt5a6fZOLs3fWycttvWscJvGfbO4iiaa7V+8yFWhGU5WQYNYDN70kFX90N758t6k69n9hX
	uc5GCTq+bSy7uQJt87/w7SHLHAzEeru8FTM3miKd0nilwJaxTtj9POvo3SFsQ7xz1136QiqAdid
	i3QWjVSWUWnSaVdd5qpmRN9PLWP+F
X-Google-Smtp-Source: AGHT+IF9uQHO8iaM85TiFvA2BcpXkfNkQmvExe8PEqVIRx6LQV1WN3wovyF6KWS5M+cgfmqegzLPvg==
X-Received: by 2002:a05:6214:2405:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6f4fce7b58cmr86397876d6.10.1746036678981;
        Wed, 30 Apr 2025 11:11:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:18 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH v2 12/18] cxl: docs/allocation/dax
Date: Wed, 30 Apr 2025 14:10:42 -0400
Message-ID: <20250430181048.1197475-13-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small example of accessing CXL memory capacity via DAX device

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/dax.rst         | 60 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  5 ++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/dax.rst

diff --git a/Documentation/driver-api/cxl/allocation/dax.rst b/Documentation/driver-api/cxl/allocation/dax.rst
new file mode 100644
index 000000000000..c6f7a5da832f
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/dax.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+DAX Devices
+===========
+CXL capacity exposed as a DAX device can be accessed directly via mmap.
+Users may wish to use this interface mechanism to write their own userland
+CXL allocator, or to managed shared or persistent memory regions across multiple
+hosts.
+
+If the capacity is shared across hosts or persistent, appropriate flushing
+mechanisms must be employed unless the region supports Snoop Back-Invalidate.
+
+Note that mappings must be aligned (size and base) to the dax device's base
+alignment, which is typically 2MB - but maybe be configured larger.
+
+::
+
+  #include <stdio.h>
+  #include <stdlib.h>
+  #include <stdint.h>
+  #include <sys/mman.h>
+  #include <fcntl.h>
+  #include <unistd.h>
+
+  #define DEVICE_PATH "/dev/dax0.0" // Replace DAX device path
+  #define DEVICE_SIZE (4ULL * 1024 * 1024 * 1024) // 4GB
+
+  int main() {
+      int fd;
+      void* mapped_addr;
+
+      /* Open the DAX device */
+      fd = open(DEVICE_PATH, O_RDWR);
+      if (fd < 0) {
+          perror("open");
+          return -1;
+      }
+
+      /* Map the device into memory */
+      mapped_addr = mmap(NULL, DEVICE_SIZE, PROT_READ | PROT_WRITE,
+                         MAP_SHARED, fd, 0);
+      if (mapped_addr == MAP_FAILED) {
+          perror("mmap");
+          close(fd);
+          return -1;
+      }
+
+      printf("Mapped address: %p\n", mapped_addr);
+
+      /* You can now access the device through the mapped address */
+      uint64_t* ptr = (uint64_t*)mapped_addr;
+      *ptr = 0x1234567890abcdef; // Write a value to the device
+      printf("Value at address %p: 0x%016llx\n", ptr, *ptr);
+
+      /* Clean up */
+      munmap(mapped_addr, DEVICE_SIZE);
+      close(fd);
+      return 0;
+  }
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index f68a3eb2bb5e..f779dfb0cd64 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -41,5 +41,10 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/memory-hotplug
    linux/access-coordinates
 
+.. toctree::
+   :maxdepth: 2
+   :caption: Memory Allocation
+
+   allocation/dax
 
 .. only::  subproject and html
-- 
2.49.0

