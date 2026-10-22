Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688331;
	b=fRxEtydI7htvrPp53e1+IYAQyMQGf1JtiWCrE6K9fGOmkSCoTSYRiAM/9Z1VGJBkjPqN
	 UOUjNiLPvHcSXHGVzl4fJZVy6oQPUaEW5orKNIH+cQ04YMWcobtbD/mYLhoQoIYzYGYQS
	 lDIkhwr9dfAJ9eQaDVlWj2ogMvkWB7s5wH2qygjFbC1aFMq4caKtE5A3PNDkQAQFJ8Ohc
	 QCaRm0MFofBgH6IrIV2mden4Q+hBFxYH8I6EtwddLvqba7qWdbf8LNrrXkyU7H/ujkUrr
	 wrcIS3AtjxE8011YRtYEnsZyPkCUQu3lRgn9ij5BO4SyLDnb428LXyesmdJt4w26MOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
	b=e7FUikxyNJwt0XyGgrKZWpLTym2lU+UEDjyRTuGs7LJphm650cLbM+IEGp4iv1RhMUUI
	 99uENzArsEIqrmwmlRBaMKcSBqrkLutRDThiDWCvbcogPCfWr8izu6JCqU3eIGf15koXv
	 PIMZLlP9BwdARMNWcUAVueqJ7fw6Mr1ulv66Mci6ht7vXL+hhXnk15LLMwgwSCG6PLB4d
	 w6hjz1jVYU6aRJVAzZNunut1KdtjxrcH5mLafIKGoLSo8qipcs3F67vwwCxJPfTS3jxRp
	 iyT/DXyui9+hc01oyqaBb379fZ+VsBixjcp0z8Ei58E3yBn4pFdv/nuVImwHGVXiw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=eQRcHZvR;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137A7606A324
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=eQRcHZvR
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so2702792c88.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792688330; x=1793293130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
        b=eQRcHZvR2vd9ZIlpOH12y640m9H2xfPxm9TswHnMTQdHUoqdFjEZvYpAfUxySnpznM
         Ct1fnWck5tZHcH7DYwVIplagroS9AML3MEcIMtLvNhXbYfkcpdb7rSh0KVyGspQsNq2I
         iiN6n7n0TPoO3XUj79+oKa6ESqi+hbfz4hGZTfsEpJR4tdT5TpvgXioAab2N8zXDW40q
         Cx7vcalkW9o7vGWXWChDD5/FTlp28bUydovKVNvaL6aoBmTh5fYbFnztkjeldTE9vk/F
         lzcSi8cpTvUBHeomTbKmOAqhZHRxjDlRPZ9ZOPiaiGUuF1+8XSRXz0V7WjCKA6ugdwSZ
         m7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688330; x=1793293130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
        b=m15GVekxrRq7mK2sTWzB/hrUtY80epj7R5WNg+cHdRm1RqWF5lY/aPuJ8JDE7kcrbR
         tnvvfQwg8+s3Cg4GnWcBetRAn0vNv4+cFH82Dd+l0pcBeuli9tYfBkQ6zomfm9uraVsR
         m9zwyLXeabF2jvtnWYVxb2FAF11tDyX7I19ycjD2K9Dq7/dg/256z9eqdiIQgBkIOyzs
         fkOrrbv72ljWRbUzv+jmfUnS6QQotX/3qP3VWOecbT59XfKBfOufCMzW/bOg3ONE0pQw
         aLgrMp7g6awTcdHunAvcTCJf7+mt1HCuRh3fC0OKLJMic623X7KVWUvuMyLbKFk1Vb6t
         98Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzvXXw/MMEW4bT6PxeWgt5koQQTMKUwABt8Cnl/gq3Vit2SBIeIA4g6jEp+cDXGfHmpBi4A2gHi1nQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeGB9Bd/aeaDc2++3Idh5/Hxlc3zJGXbVKls88x0cKMqRn8N5i
	qYOAwbS8CTAI9k0Hq/vJBCXVIJIzJwTbPS7+fRiLa1TvzjUgUlcIgRAui8olgVZReg==
X-Gm-Gg: AYBFou3tibJQvJuisSuNczWp0KvP5p36qrEdeQ/PMswvJkJFaKhXDFbsaZzvEbPfZOs
	5mKnF70crhcFp1M2S5xX+uXiW4Mw9L50j+HGSGDvuruCKO9Vbfasji2CJiptIWF9srr43Dhz8SF
	5u/Uqse00dtJJyyNJKOAlLOA34Cjv0FlA7IR3Ga/558//mKNVJmemudnAuPRgGTXsfaoQS/7pBK
	cc12D/S7G84j7N6ML8bLjjtb9x3cbKnRxbTg6JroXiCFvYxfqOk24b6BpKDXaUq90DuMYxjJTHv
	rCqWFzvlL2VT0tfL4qXA8uTbM/sfreJQfMpQ62iHpq3f2JLQrUxbzaY74MRezBVCJCuLoPAAIIs
	OyHZGvbuHnh+PlHFf3tB/Sv8BbKQtEuSVOfn0GHiaa18bRQw2DZthfAwP7CHmdu6vZK9I4EtUiR
	I6Ys771Om62wM19pJyEtPLs1+QOzNCptuv4qtGeRaetKP1kNN6RsYxCQSgCCk5OCD+OG3XwPr3g
	Z6d1VrFbZvGA2d3UJJtQQxpFAM/A9lkA3YOyxs016zDQHxhz+/oEKP8ZoTBj+gASH48P5P/uZ0t
	h7jR5mjGzq3I5ZBWeBw45dw6EA1uhQW4bUI=
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr34185c88.37.1792688329950;
        Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm15951151c88.19.2026.10.22.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/2] PCI: Add boot options to disable DPC and AER recovery
Date: Thu, 22 Oct 2026 16:58:40 +0000
Message-ID: <20261022165842.1463451-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On large modular systems with a complex PCIe topology, allow userspace to
inspect uncorrectable AER errors before Linux attempts recovery and to
opt out of Linux DPC and EDR support.

This series adds two PCI kernel boot options:

  pci=noaer_recovery  - Retain AER logging and correctable handling, but
                       skip uncorrectable AER recovery, including CXL RCH
                       callbacks and recovery of GHES-reported errors.
  pci=nodpc          - Disable Linux DPC and EDR participation, including
                       ACPI negotiation and EDR's DPC-enabling _DSM call.

Firmware-owned DPC settings and firmware error recovery remain under
firmware control. The two options can be selected independently.

Changes in v3:
  - Patch 1: Check the recovery option before dispatching CXL RCH and
    ordinary PCIe errors, addressing the CXL callback bypass.
  - Patch 1: Preserve current GHES cleanup and device-reference release.
  - Patch 2: Add pci_dpc_available() and use it for DPC services, ACPI
    DPC/EDR negotiation, and EDR notifier installation/removal.
  - Patch 2: Skip the entire EDR registration path before its enabling
    _DSM, and prevent native-port overrides from defeating nodpc.
  - Clarify the Linux-only scope and rebase onto the PCI next branch.

v2: https://lore.kernel.org/linux-pci/20260709185429.627968-1-yurypm@arista.com/
AER review: https://lore.kernel.org/linux-pci/20260709190616.DF0CF1F000E9@smtp.kernel.org/
DPC review: https://lore.kernel.org/linux-pci/20260709190730.E19A11F000E9@smtp.kernel.org/

Yury Murashka (2):
  PCI: Add pci=noaer_recovery kernel boot option
  PCI: Add pci=nodpc kernel boot option

 .../admin-guide/kernel-parameters.txt         |  9 +++++++
 drivers/acpi/pci_root.c                       |  9 +++++--
 drivers/pci/pci.c                             |  4 ++++
 drivers/pci/pci.h                             |  4 ++++
 drivers/pci/pcie/aer.c                        | 13 ++++++++--
 drivers/pci/pcie/dpc.c                        | 24 ++++++++++++++++---
 drivers/pci/pcie/edr.c                        |  5 +++-
 drivers/pci/pcie/portdrv.c                    |  3 ++-
 include/linux/pci.h                           |  6 +++++
 9 files changed, 68 insertions(+), 9 deletions(-)


base-commit: f4319f548f7d8cb595ac1c91bfd459876399eeb3
-- 
2.51.0

