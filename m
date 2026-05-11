Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217983BED7F
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543319; cv=none; b=qYtg+YwdVCqBnLchLefWiOwHFiqSBa4cm3aFEkrZ3rr+YIYjJVJGYM8RL1o57SuNXr03Ku+GMWueDIowO2EIyNKJ8myh6EazB094kgIYog1H2aM4EUnfpcrQ/Fr6nFOXriErVZaO4J4qR3DIKtt4PcsyMiEDg5eK1EcfSITZd20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543319; c=relaxed/simple;
	bh=2O3kiZbxsoqPdSkkFfZY/ZsPS5GCY/RmMZMzns7zjr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qob15q7dpgxEBBtM2Icviu6IO9xrvqrcCvF3eboHrBnWu4KiR83uC/3/1U1qFvK4iatnbRm1NtDHNZLXG0yFoQlZB6kzkgcvyJYsbcII33i5qg0oMqGDwWqttNA9hgTeFTNIIxTMqU5xChn7U0juIRnsj8DR8MzE4mql5o/xiqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipDJcFIh; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipDJcFIh"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354c44bf176so5879257a91.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778543316; x=1779148116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciHF9s89MGSV42RioHjLjFryxlWaYoxn0O9vl4XFI1I=;
        b=ipDJcFIhdiURZAVFmzT9q6Vqy7RliouHFFE1Xj3ZlmXy1nMO7bMTgNrgVJiOODxoB9
         at+NI71ZRYNF3bF25/xIP7qoMEjWIMGJgYyUof/kOkxEytVAw7jmKOnPxSPdGt8ikFCT
         ZGrC7WfjcKmDsPlDBnX5joQ1O2Gt3Ywuw8/9sWeZ8S2EVbSGYG3IhkonGJMIg1KhAaBJ
         jVBdAHRB1qgZ5qD1AbWLGXW5PYuSbZcbTziTAbidlENoM3ZDQF+etwybV2X56yHcyrt2
         LvWhLQ6FhXIhVlqSkglp+DkPhJydEblQA4Fq3AHjhfzDSGsi69jYc5quRyZ81IwNtJx5
         KQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778543316; x=1779148116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciHF9s89MGSV42RioHjLjFryxlWaYoxn0O9vl4XFI1I=;
        b=VGHj+g6A9JrBw5ivdukhAwvXEOmiuhMULsN4K+DMwCmNC65mg+vyubse3TtZGwAWy0
         B+f7q3DRlFZeua8NiCawLnqvz7YnL/UOFrWgMJH9B6wTSQURGYAxj4n/cn24JcD0r4yE
         yPZg2y5bTN9ELkipweU/mXLDEfVdoKAmth8vxjd4uvijGrRIH1vDPa0fXjbnHO5CciNi
         wFir8cncGr/jvKldhqdiSY+3sVNS91o/RmHKkx+JkCnhgVfhmInE6Y2JbhSRJHJQnnbb
         bz7xI59EJKorLld0BgURKLS3dhPjPVRx739oOHShXO8uOndUbXcGI300jlhaFGPXKH/+
         46yw==
X-Forwarded-Encrypted: i=1; AFNElJ+UcO1I51az39QlMdT77kI4hNJw/zot+5AiVolYVT90ht/lXZ65vCGcmehJhgvLPcGH4HwuxRyUpiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4gu3isWqrlaenvTmQwUBCxhw079sUJfCQc+x+5NsilpQbCC1
	ksT3mGURmpAlBFZiOf4u+KQUIULCgeJB1EPO9ezhcb7ZJhwWBO+GN8qh1umSjB0sYx2xfW9CY4f
	X1HKi+Dt6jg==
X-Received: from pjbdt11.prod.google.com ([2002:a17:90a:fa4b:b0:368:aec2:8d2f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cce:b0:368:5367:d67e
 with SMTP id 98e67ed59e1d1-368b24ffb1bmr755202a91.10.1778543316136; Mon, 11
 May 2026 16:48:36 -0700 (PDT)
Date: Mon, 11 May 2026 16:47:53 -0700
In-Reply-To: <20260511234802.2280368-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511234802.2280368-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511234802.2280368-8-vipinsh@google.com>
Subject: [PATCH v4 07/16] docs: liveupdate: Add documentation for VFIO PCI
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, 
	praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

From: David Matlack <dmatlack@google.com>

Add documentation for preserving VFIO device files across a Live Update,
generated from the kernel-doc comments in the code.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 Documentation/core-api/liveupdate.rst         |  1 +
 .../driver-api/vfio_pci_liveupdate.rst        | 23 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 Documentation/driver-api/vfio_pci_liveupdate.rst

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index d56a7760978a..c55d0d9d1d3b 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -34,6 +34,7 @@ The following types of file descriptors can be preserved
    :maxdepth: 1
 
    ../mm/memfd_preservation
+   ../driver-api/vfio_pci_liveupdate
 
 Public API
 ==========
diff --git a/Documentation/driver-api/vfio_pci_liveupdate.rst b/Documentation/driver-api/vfio_pci_liveupdate.rst
new file mode 100644
index 000000000000..1098b84e5ecd
--- /dev/null
+++ b/Documentation/driver-api/vfio_pci_liveupdate.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================================
+VFIO PCI Device Preservation via LUO
+====================================
+
+.. kernel-doc:: drivers/vfio/pci/vfio_pci_liveupdate.c
+   :doc: VFIO PCI Preservation via LUO
+
+VFIO PCI Preservation ABI
+=========================
+
+.. kernel-doc:: include/linux/kho/abi/vfio_pci.h
+   :doc: VFIO PCI Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/vfio_pci.h
+   :internal:
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/core-api/kho/index`
diff --git a/MAINTAINERS b/MAINTAINERS
index b6c33c2bcc7c..737c5ed1ce38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27979,6 +27979,7 @@ T:	git https://github.com/awilliam/linux-vfio.git
 F:	Documentation/ABI/testing/debugfs-vfio
 F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
 F:	Documentation/driver-api/vfio.rst
+F:	Documentation/driver-api/vfio_pci_liveupdate.rst
 F:	drivers/vfio/
 F:	include/linux/kho/abi/vfio_pci.h
 F:	include/linux/vfio.h
-- 
2.54.0.563.g4f69b47b94-goog

