Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C41283FFB;
	Mon,  5 Jan 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632326; cv=none; b=eFfVvbrYuM/S1U0hrYeEpZTDig5sQykOobnCPsWykiW7EF5WbDlCbZHU+sYZNi/56Lu8nMECj3HVYb3OAQvOaGYAQl+goKMswlAuU6SICa8HVGBdZ1sHwK9+evCVB8gs0OH8J7fA/BKmUy8zQ8nIiPUjaC6fy0k5Q/jO5Mwokro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632326; c=relaxed/simple;
	bh=mupDn7J1NSAUZ9GV/4Xx6+A3fMSwov+EkCqaBWzjOm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jAApAlQTtAd/dpz4fy2ETYnHpW/lkj2vD6M+6XNiezh/z1OHlW9B6jm/vrldsZh2aldflldRckd4XzCxglFP0Vw70EANnre7VNcFbZGxnDNVZv5C5vP14znCBCjCjHdtnY0nBXI13H9DpJ8C20F4HrnBNdz1+Lu+b9b6HDg1gUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxhbXFH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxhbXFH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF57C116D0;
	Mon,  5 Jan 2026 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767632326;
	bh=mupDn7J1NSAUZ9GV/4Xx6+A3fMSwov+EkCqaBWzjOm0=;
	h=From:To:Cc:Subject:Date:From;
	b=YxhbXFH76Gyi1Q1IeKu6BX24k5shRmCdHTfQU6bcQLC+cFfvY6krzkB7bYUSyKShM
	 uG3/cpRYYGDTPOIHfDhg2kcFrP5Gp6NamzlQawAXRrOlyltMcby7Mt9b8DBtYbpKto
	 96jjELOv3zquxG0gGWkrpuk7p0oWRgvwDoo1qoJl3fH6tAs2rYwQ4SqlsRgydOkP3B
	 NNkzjtmUJXTBdpSoq4sJFo9aigVIYb24zrKwUzbbPMlbk2LV4TRc/U+BGF9XgsMk1M
	 ASKyg5/3mtBaFz2gwK99f/FbiD3h8zdRbVQp+P3XwjyWFE/ZxoqDI4dziDjI6+yBUY
	 Qe4yO5QYs0iig==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>,
	Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/6] kho: ABI headers and Documentation updates
Date: Mon,  5 Jan 2026 18:58:33 +0200
Message-ID: <20260105165839.285270-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

LUO started adding KHO ABI headers to include/linux/kho/abi, but the
core parts of KHO and memblock are still using the old way for
descriptions on their ABIs.

Let's consolidate all things KHO in include/linux/kho/abi.

And while on that, make some documentation updates to have more coherent
KHO docs.

Jason Miu (2):
  kho: Introduce KHO FDT ABI header
  kho: Relocate vmalloc preservation structure to KHO ABI header

Mike Rapoport (Microsoft) (4):
  kho/abi: luo: make generated documentation more coherent
  kho/abi: memfd: make generated documentation more coherent
  kho: docs: combine concepts and FDT documentation
  kho/abi: add memblock ABI header

 Documentation/core-api/kho/abi.rst            |  28 +++
 Documentation/core-api/kho/bindings/kho.yaml  |  43 -----
 .../kho/bindings/memblock/memblock.yaml       |  39 -----
 .../kho/bindings/memblock/reserve-mem.yaml    |  40 -----
 .../core-api/kho/bindings/sub-fdt.yaml        |  27 ---
 Documentation/core-api/kho/concepts.rst       |  74 --------
 Documentation/core-api/kho/fdt.rst            |  80 ---------
 Documentation/core-api/kho/index.rst          |  78 ++++++++-
 Documentation/core-api/liveupdate.rst         |   2 +-
 Documentation/mm/memfd_preservation.rst       |   2 +-
 MAINTAINERS                                   |   1 +
 include/linux/kexec_handover.h                |  27 +--
 include/linux/kho/abi/kexec_handover.h        | 163 ++++++++++++++++++
 include/linux/kho/abi/luo.h                   |   8 +-
 include/linux/kho/abi/memblock.h              |  72 ++++++++
 include/linux/kho/abi/memfd.h                 |   6 +-
 kernel/liveupdate/kexec_handover.c            |  34 +---
 lib/test_kho.c                                |   1 +
 mm/memblock.c                                 |   4 +-
 19 files changed, 361 insertions(+), 368 deletions(-)
 create mode 100644 Documentation/core-api/kho/abi.rst
 delete mode 100644 Documentation/core-api/kho/bindings/kho.yaml
 delete mode 100644 Documentation/core-api/kho/bindings/memblock/memblock.yaml
 delete mode 100644 Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
 delete mode 100644 Documentation/core-api/kho/bindings/sub-fdt.yaml
 delete mode 100644 Documentation/core-api/kho/concepts.rst
 delete mode 100644 Documentation/core-api/kho/fdt.rst
 create mode 100644 include/linux/kho/abi/kexec_handover.h
 create mode 100644 include/linux/kho/abi/memblock.h


base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.51.0

