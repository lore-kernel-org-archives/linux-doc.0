Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035B21CFFA
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036663; cv=none; b=Z/Gq3+jv55TuhW/m8F21ihQe6BwTfor8IwWe0HEg4NQtNcUC9y1RePlqehT8WNdyCe/+tgqM38s1Gl4OYAnZQCRp8c1rIHQ8vqV0XSw6PgTpm2O3Pdjhm5zGuCJNE3PgqqzHB3Nm5TLXIfO4qlKGlGH2PtZIV2Tonaod6wQpXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036663; c=relaxed/simple;
	bh=MEaofih8DQTUjLJZ8Y6aOz3PBIcFQnbOGKwTnWVFryU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpNzJ4bwZRWkXstDKEzk8mYMRXrxyg+bU288abwEuuoQ0A/j4QePSNnEpgCdEvbiVzg3kW2oo78+blpvNgjLcARc1Z/4L14+hbfGtipw0Q2bT86gG373OfCE4iLWblZPB8okG7TOhVn7NzJDZ03cdPecentaF2hTB+Mgqa0N+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=U8VK8PlE; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="U8VK8PlE"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so2556696d6.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036660; x=1746641460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElkGZgxyuXWBoqg7Cax72ohCyfKJD9Wfpb8I5+GYTx4=;
        b=U8VK8PlEUSjD+56Zlh7wZVnbXX/pVBgnUeyBlU35mDkMQNgHgLbMAclJ05SFoSqomg
         4M7Ac9/6cWN+e/T+3RHInfDQnYrLUlXZ9Dm+nntFaMI2VPfpiXSQ3HlqZ+9BiKoOoPJ2
         YG0+vQx71z/8am8rNCPcLwgK93ArY2yTQYZ0g5W/aavsyPcAiHL/gh1sKq4tm3uxNOZz
         I0Rcd+tXUqdWMmeXjLD50zRqPVKYUcHwo5PMJebFy2f4zDPfQw/WapgreE0RIizKDcfQ
         RT5VvZdq3I9wrC9y+ZqW+f2zRc0I/t5QP4fD1ep/RjEBldWYK6I2ob6wEz2CR0ACihzy
         XR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036660; x=1746641460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElkGZgxyuXWBoqg7Cax72ohCyfKJD9Wfpb8I5+GYTx4=;
        b=d+xZE+stx900BmeCLSfcjWRWk2/VPbdt2Eapr3z5xcQ22vodNT07DIAeCoy0+NrkGx
         6N0FipvEPxXXxB5SMxftkH4L4hxwJPP718Zb3Z9WZRz9PHg7sYvXG+amPrU1Yj21ON3D
         JW8WhlFvg7qUgg3AHUDLrWpzyNVwow8pdJ0VZICVlX1/i8Cl9XgOBqDTPaY3Kd8lbBCe
         GtDS8kBKlc7aJm+PDAgYBN8+ySQO2P3IQla/fu4c12M5GN2uXjWVxtSrB2i4zeE/k8Lt
         FHQhoGK5MHu6d2UosEIHFF1KOg2G4teHcTQQMRlB0SmdR5ES9+/tVg4GiDe/NZ3Y6L6e
         2thw==
X-Gm-Message-State: AOJu0YyKD/GK2e56jOxWCzsZ+yeRNoFbf8sP/7V5n6FZNlAV47RQrA8m
	MHc3PhnkvD2RgtLrDs4x5xbbAzMsNRjN5hKOlred5r1Msake/s7CGIDGEARIFN4=
X-Gm-Gg: ASbGncuudEZVlcfFq+xbxF659NRfvNlneMnkybs2a9x+72nuAiAjMjm/00+k4j6H/Ds
	UKLC3ADd5ll1d1ybLv9p2RDR/t01GrHVXZ8GFT10jAPS/FobiBCKx8MLQBe0rJsIXPUMTWrpI3k
	IW3z+mJUIs/SbFIF9BEhVmcgIAlilKsrf68vCEFUXG7C52gVV4hcT8bdYusvGe91wd3H/jNTLI3
	ogbru5GCmiANWclXCv1XMjL04ALHgNJpE1zpvQINsX5Dh+cUqhi8VaxLMYAOcDmpT0yFe3fOkGw
	NgAalJ6Njn8lqkO+q131npgRVHPbe3XPA78Ac9vEcSSxYhk8MhJ5DdH1bBWO/T2km6jcOvA6/Tu
	/M1N1OvFnkHBWpFscMTILB8ml0f0F
X-Google-Smtp-Source: AGHT+IHiRVFMv0BtDAp44SLM6ZmC6d9Y5KHy1B6EE8JXhi5Zs693iMbZS7npAURK9OImYEJiBQeJoQ==
X-Received: by 2002:ad4:5aed:0:b0:6e8:f3b0:fa33 with SMTP id 6a1803df08f44-6f4fe033ed8mr71033116d6.8.1746036660094;
        Wed, 30 Apr 2025 11:11:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:10:59 -0700 (PDT)
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
	corbet@lwn.net,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: [RFC PATCH v2 00/18] CXL Boot to Bash Documentation
Date: Wed, 30 Apr 2025 14:10:30 -0400
Message-ID: <20250430181048.1197475-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies for the quick turn around on v2 - I wanted to deal with
the big formatting issues very quickly before others hacked on it.

v2:
- Formatting (Jonathan)
- Cross-links
- Mild formatting and wording updates.
- Some graphs in cxl-driver to explan object relationships

---

This series converts CXL Boot to Bash Docs to Linux Kernel Docs.
I tried to break it into separate patches to make it easier for
people with specific expertise to review.

The big open TODOs:
- use-case documentation.

  I only have the type-3 perspective, and only one perspective.
  It would be good to have that hacked on more generally.

- memory tiering documentation.

  I basically left this unfilled for now.  Would like some basic
  docs on at least TPP and DAMON.

- devices: CDAT explanation

  It would be good to have this spelled out at least a little bit.

- platform: ACPI SRAT Generic port / initiator docs

  I don't know anything about this and people say it's important.

Thank you to everyone who contributed feedback during LSF/MM
Boot-to-Bash proposal.  Hopefully I incorporated most feedback,
but I may have missed some.

Co-developed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Signed-off-by: Gregory Price <gourry@gourry.net>

Gregory Price (18):
  cxl: update documentation structure in prep for new docs
  cxl: docs/devices - device reference and uefi placeholder
  cxl: docs/platform/bios-and-efi documentation
  cxl: docs/platform/acpi reference documentation
  cxl: docs/platform/example-configs documentation
  cxl: docs/linux - overview
  cxl: docs/linux - early boot configuration
  cxl: docs/linux - add cxl-driver theory of operation
  cxl: docs/linux/cxl-driver - add example configurations
  cxl: docs/linux/dax-driver documentation
  cxl: docs/linux/memory-hotplug
  cxl: docs/allocation/dax
  cxl: docs/allocation/page-allocator
  cxl: docs/allocation/reclaim
  cxl: docs/allocation/hugepages
  cxl: docs/allocation/tiering
  cxl: docs/use-cases
  cxl: docs - add self-referencing cross-links

 .../driver-api/cxl/allocation/dax.rst         |  60 ++
 .../driver-api/cxl/allocation/hugepages.rst   |  34 +
 .../cxl/allocation/page-allocator.rst         |  86 +++
 .../driver-api/cxl/allocation/reclaim.rst     |  51 ++
 .../driver-api/cxl/allocation/tiering.rst     |  31 +
 .../driver-api/cxl/devices/device-types.rst   | 170 +++++
 Documentation/driver-api/cxl/devices/uefi.rst |  10 +
 Documentation/driver-api/cxl/index.rst        |  56 +-
 .../cxl/{ => linux}/access-coordinates.rst    |   8 +-
 .../driver-api/cxl/linux/cxl-driver.rst       | 631 ++++++++++++++++++
 .../driver-api/cxl/linux/dax-driver.rst       |  43 ++
 .../driver-api/cxl/linux/early-boot.rst       | 136 ++++
 .../example-configurations/hb-interleave.rst  | 314 +++++++++
 .../intra-hb-interleave.rst                   | 291 ++++++++
 .../multi-interleave.rst                      | 401 +++++++++++
 .../example-configurations/single-device.rst  | 246 +++++++
 .../driver-api/cxl/linux/memory-hotplug.rst   |  78 +++
 .../driver-api/cxl/linux/overview.rst         | 103 +++
 .../driver-api/cxl/platform/acpi.rst          |  76 +++
 .../driver-api/cxl/platform/acpi/cedt.rst     |  53 ++
 .../driver-api/cxl/platform/acpi/dsdt.rst     |  28 +
 .../driver-api/cxl/platform/acpi/hmat.rst     |  29 +
 .../driver-api/cxl/platform/acpi/slit.rst     |  18 +
 .../driver-api/cxl/platform/acpi/srat.rst     |  38 ++
 .../driver-api/cxl/platform/bios-and-efi.rst  | 263 ++++++++
 .../cxl/platform/example-configs.rst          |  13 +
 .../example-configurations/flexible.rst       | 296 ++++++++
 .../example-configurations/hb-interleave.rst  | 107 +++
 .../multi-dev-per-hb.rst                      |  90 +++
 .../example-configurations/one-dev-per-hb.rst | 136 ++++
 ...ry-devices.rst => theory-of-operation.rst} |  10 +-
 .../cxl/use-case/dynamic-capacity.rst         |  20 +
 .../cxl/use-case/memory-expansion.rst         |  15 +
 .../driver-api/cxl/use-case/shared-memory.rst |  15 +
 .../cxl/use-case/virtual-machines.rst         |  19 +
 35 files changed, 3963 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/driver-api/cxl/allocation/dax.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/page-allocator.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/reclaim.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/tiering.rst
 create mode 100644 Documentation/driver-api/cxl/devices/device-types.rst
 create mode 100644 Documentation/driver-api/cxl/devices/uefi.rst
 rename Documentation/driver-api/cxl/{ => linux}/access-coordinates.rst (93%)
 create mode 100644 Documentation/driver-api/cxl/linux/cxl-driver.rst
 create mode 100644 Documentation/driver-api/cxl/linux/dax-driver.rst
 create mode 100644 Documentation/driver-api/cxl/linux/early-boot.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/intra-hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/multi-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/single-device.rst
 create mode 100644 Documentation/driver-api/cxl/linux/memory-hotplug.rst
 create mode 100644 Documentation/driver-api/cxl/linux/overview.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/cedt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/dsdt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/hmat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/slit.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/srat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/bios-and-efi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configs.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/flexible.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/multi-dev-per-hb.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst
 rename Documentation/driver-api/cxl/{memory-devices.rst => theory-of-operation.rst} (98%)
 create mode 100644 Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/memory-expansion.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/shared-memory.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/virtual-machines.rst

-- 
2.49.0

