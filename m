Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041447;
	b=vjI/V1XluCI7MX9tevsO5AKiuYGn6ysU/wjX63l+WMCREr2PQEMq+IoD28rCmI1lLUbt
	 bchqn4HeBwCwfVpgQJbgPd/W4s6N+gm2EayHy7AeiVSBQxlmJZDoSbsNmh8q4YwxASsHQ
	 bfwhh9nsROlVO8M8774+lxH8wQMIuqhQ07/okwmWiEIuAPmCf6GEDNKlu61GW8LWxjd0w
	 74uAe/xPUUmQFrW9I4k90beC2Kd31xgp+LDZf8XBvhRZ8iu794nPu5GCd3D3oT1FoIdLe
	 cDsrAflBzP6NxY0h4rpwNZK7JjH3lhvLdnOFg5Caj0FNxz/8GhUiPfnLiI6eNt5jWyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
	b=fkAqRDkLvWIsyE037gQ6jEBIbd1/oSk+JUImkdOryC+BXGeTmwWeu4Ln3U50rCkNDAZN
	 xFHeEAbjp1mFyy9/wPmXd5AX7OeA22Fj7IeZCu0eqfibLJcEgDdqKosaO3dd5u1kIh31o
	 QH76BGrD+8s4OFQafQ8sYkvixiA2R1O8c4js+YRKe+0LGZR1vgmpZNvkxh35ujLfDXARS
	 RJKhT+bSs5R2DxpmnXlRe36WY8q8Kkr0HJ4dKjZLS5W4PA88u+QCuJjgn6KcYRIrON2uQ
	 vsPF5yTwwyl6hWvOBbeZXVj7NuJSYSW7BcBZRSzPYz06z3fy4O5mD0sq8EV+8QpHi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCkWdhmk;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DA606A996
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1DA606A996
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCkWdhmk
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso1653484b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041446; x=1795646246; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
        b=UCkWdhmkNToAqzBuAZIqNBHEJM7rm+H9Zh7cIkX7PfF0jiS26HDO0jUbwchxm1CuIr
         uzEOwKxW8lyVkOBgQ5D5C2B4XszDmLGny78iQmPI24gMe22WfCjq1LDE9KJlYwGovg+A
         MhXRUNpSi/9eD/h1uqojO+B9TsGJzkz5FjiG0q4aZbHDGvGXS/pL+DKc9n5U3K4l7cGa
         pFOdUHV/czu4WqM7CSgbVcrauDXYJPeZSupdH28DmhKinlPsKZAvvoo2mGWlnwCtue15
         rISFylo3OQHfQy4mRTEG+E7c33k7AZn9aAI2GYEriRQIHlON5jpWy7egX4k0mg4cRRO1
         esCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041446; x=1795646246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
        b=SNEehwyNtddydVSXG9eLXWANSXCAIY4qO+vyKMF2UYGEhTD9eEHKr+pWVyxen/T7gH
         LJK1cR9qEye4b9Pzln+KRxmGmi8KgOU7wgsMksMcbnRfFB6I+8UkoEtGLMPaUwC8WbCi
         KZt8LDg1Cw59J/uMAhrHVqKn8VRux53+ve5udUbatEGmnC4mnI9d/RFvG9L59zDLLbFi
         tE40fAxGziE1aCJNoVjtm/OfpVLVN2/r4dw6eKrzBscIG64vYdpi4SnSVLKYz5k7kmTU
         dbFUhMyYN++QDJTEjC3G4ExRl3S925cneT10qp7JLMm2q5ITMZkcaK2qUJ0vx2Puh/6u
         dkIg==
X-Forwarded-Encrypted: i=1; AL+hErE8TJG7jRuaRp86uCPgC/511DbPZ73tHdD8D8xLFz5VuI2ylrHWo7jhqHtjcLEth0Ix/sXA0/By6+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gQdkgjQXCezpY962UC4DyxtzszovB84qsys716yrtxbf6lzCn
	d5ecguWKB0b8kak8eTFgftDlu6cnWD5P1mTNRH7cCB0nFCiNEoKwFh/zFtUYJWk8hg7NImupOPQ
	kB1gb5/RXjMW6Fw==
X-Received: from iocre7-n1.prod.google.com ([2002:a05:6602:87c7:10b0:9e8:de6c:a5a3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr4971244b6e.45.1795041445551;
 Wed, 18 Nov 2026 14:37:25 -0800 (PST)
Date: Wed, 18 Nov 2026 22:37:04 +0000
In-Reply-To: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118223704.3286085-14-dmatlack@google.com>
Subject: [PATCH v11 13/13] Documentation: PCI: Add documentation for Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Alex Williamson <alex.williamson@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add Documentation/PCI/liveupdate.rst, which pulls in the kernel-doc from
drivers/pci/liveupdate.c and include/linux/kho/abi/pci.h, and link it
from the PCI index and the Live Update Orchestrator documentation.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/PCI/index.rst           |  1 +
 Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 MAINTAINERS                           |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 Documentation/PCI/liveupdate.rst

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index 5d720d2a415e..23fb737ac969 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -20,3 +20,4 @@ PCI Bus Subsystem
    controller/index
    boot-interrupts
    tph
+   liveupdate
diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
new file mode 100644
index 000000000000..96b1d7f5df3a
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+PCI Support for Live Update
+===========================
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :doc: PCI Live Update
+
+Driver API
+==========
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :export:
+
+Internal API
+============
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :internal:
+
+Live Update ABI
+===============
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :internal:
+
+See Also
+========
+
+ * :doc:`/core-api/liveupdate`
+ * :doc:`/core-api/kho/index`
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index b3c689e633c1..2bce2644eba2 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -74,3 +74,4 @@ See Also
 
 - :doc:`Live Update uAPI </userspace-api/liveupdate>`
 - :doc:`/core-api/kho/index`
+- :doc:`PCI </PCI/liveupdate>`
diff --git a/MAINTAINERS b/MAINTAINERS
index 6b7c5f3a64d3..1572f6c905aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21554,6 +21554,7 @@ L:	kexec@lists.infradead.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/PCI/liveupdate.rst
 F:	drivers/pci/liveupdate.c
 F:	drivers/pci/liveupdate.h
 F:	include/linux/kho/abi/pci.h
-- 
2.56.1.703.gf848ed807c-goog

