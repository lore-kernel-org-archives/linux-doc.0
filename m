Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB91A6828
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776734466; cv=none; b=OjuXZAgUna6q7HPwXU9sAfom4duAzgevwGHu2Ve5SFCgtcru5krS+8ywFuRUnrt1B1W4W1l02EJdnNso0bKfl9YDrMlgT4CNfiv5BdYLIv7cM0nb/PjzKQdwDrZExDY3My9mciksTfS5LBp84pC8x7w1+8PQTVa7hvg1Be6OwzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776734466; c=relaxed/simple;
	bh=vRCSbqHXwyn9w0QgeLkMbQIo4v+alkRVoWv3vOxbJqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXPDHh/3fTd013oR+3HvfBuClq9uqgFi/xraaD6PCADuHY3iI9rLnt1j42wq/kmZkTupJQaKekNj1UZHlMDfik/X4yIt2XMiNBBOGGnZCBQIvE/loIybEj5E4f0ZYipLJgi6G5Em5WIu+bsSA7g0vQltlKOq08c6JkFib2rRERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkrfcZHA; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkrfcZHA"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso44014926d6.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 18:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776734464; x=1777339264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hEOtQ4G+O2Nb1ePWGM6JmoZNeLxsvMXbczlW0oI7404=;
        b=qkrfcZHA7il892KK6iTwB5Af9JBz31HA4aj4AYEkgJqG08+9tjOYZW0KPsgl9o05EW
         WeHWHzqPjUPvVh+VNfD8iphFw1+xJF9M/z8+84m21bPgy4F9tFuGvSil17rU4rjGMCWe
         YP9Hwn3H0wHA5f7NtTmTNQgrsVlllkGpXtZdxmX5Q1FBbT4Z6kE2CGAsGQoOt1Hwyj9k
         NgjMGEpDytKAbBMw/kG4Sx++fdZ3lOqAmcodkI9enY0pKt1dpUo9FqCC8rky+ZTfrQ7/
         eBQe6JpipgFFKX9Fr2DmGd0FqC9beSxNdIN7c8b327OjZhOBHOrkntVM9nOxCqxMKvOE
         Um4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776734464; x=1777339264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEOtQ4G+O2Nb1ePWGM6JmoZNeLxsvMXbczlW0oI7404=;
        b=j2N7VvKOyPw3JVV/3qOoDTvk4R3OI4xSf65mPr+ZpCJphRaYCs6gMb9A2ZhSTjw8Im
         p9ge2x9feiC4Y8aNNLX5oxqsDli4E2ecu6+Bx++LkRwnJjokmhmS52L6UhQH3oEL+T/+
         u/Dymb7RvQ38oGIK3Kj8lDGfW6T98k15w62OQgYGfRCspmeqXKnhMDdiazgNW0q+OhaZ
         x4Z/hlRR40mccfHcsGIO6FgknEdT0lKNcGad0k4+XCNbehQpwMtMhLaICkqQZ0ZBt6DR
         UwO30ZXQYvOJC1qugMjBPsYopnG5sLY0uqlid5iOxKvgfjCOgi0z+JbOn8h9fcjv6Vkv
         BI+A==
X-Forwarded-Encrypted: i=1; AFNElJ8q5ajaYt8oc60wGi0WLOaloPJju+NAagLYJ/bkPmwGHdXMUfN1P3tU66XyT5CFibQ4PfbpxDCB954=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiPVXsJXE99LY4r2mG+RkQxqY0oftlncKWW02Z2wcsKKwX0z0
	H5K4VeXnr5e1nCQ3UieZ8wM1vob+F7REPsWmc14tOWi7hd2X7MiOLw5m
X-Gm-Gg: AeBDieuFRktMLxqzmm6QD0tWFcH2cbpUrq8Omdhhh3MfoZWz5DsnMSn5n4ssBap/eyA
	gHYbk86RZbh4y3HHQ9JYUcmJqrWvo26KaZRey3o6/Iz4pwbCR5Gmi7KY+qXfRS3RH3ILl7ZXGVr
	Fh1lvC9KHuUSdGehVJnT/crPZoMtQqvJKC7yNAQza0QQSIOC9pABjMLOBAQvvv8uckxoz6Wsi89
	0p8oE/XJZKgqocb0aVw5zPb8B53cLsMcm3i/nWjI2hwRP2rS/9ffR6AUBMj+UDyZLnAZyIK8dx5
	6jC9ZN0cM0IoV8VkMj3oQ4gxoL1xKH2dPXvChd5ThPIUrYI0A61gJi3RSQl3oVrYRXud7xdjJuk
	gI1/OleOZZHci/gI+SWfIat3B6UVAeQ5HWEpJdXYAocoFsd/3ACPdZKui3B8WAItxN2rbmuWca3
	ZXDbVw/SO6jETZ92UKGsTO2rubnsGLpGbjyg8G88Omhhs5d+bkiw3+5FWBQYSgpUGQmG4=
X-Received: by 2002:a05:6214:4517:b0:8ac:a8df:639b with SMTP id 6a1803df08f44-8b0281f5138mr280164806d6.39.1776734464029;
        Mon, 20 Apr 2026 18:21:04 -0700 (PDT)
Received: from josh-ThinkPad-L14-Gen-3.. ([76.78.141.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae61332sm86911256d6.24.2026.04.20.18.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 18:21:03 -0700 (PDT)
From: josh ziegler <joshziegler76@gmail.com>
To: bhelgaas@google.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	josh ziegler <joshziegler76@gmail.com>
Subject: [PATCH] docs: fix typos in Documentation/PCI/
Date: Mon, 20 Apr 2026 21:20:59 -0400
Message-ID: <20260421012059.251492-1-joshziegler76@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "chose" -> "choose" in pci.rst
Fix "result an" -> "result in an" in pciebus-howto.rst

Signed-off-by: josh ziegler <joshziegler76@gmail.com>
---
 Documentation/PCI/pci.rst           | 2 +-
 Documentation/PCI/pciebus-howto.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index f4d2662871ab..be35e9a1ee75 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -338,7 +338,7 @@ the PCI_IRQ_MSI and PCI_IRQ_MSIX flags will fail, so try to always
 specify PCI_IRQ_INTX as well.
 
 Drivers that have different interrupt handlers for MSI/MSI-X and
-legacy INTx should chose the right one based on the msi_enabled
+legacy INTx should choose the right one based on the msi_enabled
 and msix_enabled flags in the pci_dev structure after calling
 pci_alloc_irq_vectors.
 
diff --git a/Documentation/PCI/pciebus-howto.rst b/Documentation/PCI/pciebus-howto.rst
index 375d9ce171f6..9cc133ccdeec 100644
--- a/Documentation/PCI/pciebus-howto.rst
+++ b/Documentation/PCI/pciebus-howto.rst
@@ -97,7 +97,7 @@ register its service with the PCI Express Port Bus driver (see
 section 5.2.1 & 5.2.2). It is important that a service driver
 initializes the pcie_port_service_driver data structure, included in
 header file /include/linux/pcieport_if.h, before calling these APIs.
-Failure to do so will result an identity mismatch, which prevents
+Failure to do so will result in an identity mismatch, which prevents
 the PCI Express Port Bus driver from loading a service driver.
 
 pcie_port_service_register
-- 
2.43.0

