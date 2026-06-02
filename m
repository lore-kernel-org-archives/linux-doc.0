Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D73769FA
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397769; cv=none; b=my3ZML029OuW2KI+vMzsVttXYRS8tVVZRbG2r1eHwB49eriKQaJIbYSeROVlZN4o1DoPeSolxzb4An2+Qt1Jl1kbtjYcC48P0pS1HJYHsTdNtSwObyoCu8+71aSnkkCpfb4enkW4SwLzKW8KzIgZJOBlga9OT5UloNsSCDuuGRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397769; c=relaxed/simple;
	bh=QVHEmFnx0DUpGUKy/kZIWW0fq7FBpCeUK0VEnbP1aKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQUiNVUr/l9No7tXIabBeVJ0ZTzK9QLS++FxwYX6mzQa0YTnFpa/p6HE5naqj4uWmatc84+/0buCZdU7Z2vU54WUixyc3ZxUCawNuMZD0Ze6jcw7sjFr6TYY0r183YqyKPnB+mKZ4oAOnr8XUZ1eGKef6/5LFIzr9xMABTQwnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=JYtnyp+/; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="JYtnyp+/"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137dd5161feso63399c88.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1780397767; x=1781002567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tU5zBVcnweYdPS2s4Hj5IdEBDkNLbQ2aMEv3yP+HtpE=;
        b=JYtnyp+/mXQdczbIBW+D61++lXUfEKuzTtxAbAhKHtBw7P8xZLuXQc7Syew1sPUOPZ
         ZVgdHZlruENkayXjMFkxvRwgfg4bPfoFOej9XGPBgfTN6VMx3FHVAMahOZnN51uMmBuI
         Pu8fBAgXDeQ1JngIYZzVNsPb3Sl1wEc1QTCO+qStfP2sbVITa84KU0yWZCdvlrgf1WLW
         KdV1VxRUgHpUDKnu9WV/GQ1Iu2uxGbXyWqrp/a/D7CGpEswjuca3ZIRwjkQYoRWlnL5r
         KebLNjUUsWPPQ5Inc+V4A0kdm26STVSinT01oJ1pQTuEZ739dSv/+a0wjGS/aPvN/D2D
         jFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397767; x=1781002567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU5zBVcnweYdPS2s4Hj5IdEBDkNLbQ2aMEv3yP+HtpE=;
        b=BGcZuY4kmafhuumAD/ziMsfIuypKzLmIvx4R0PCcdwc7dyyC3KGKVSANN+qnCZx1C3
         RY5f1WqFpGfGyXLMYLSm87bUD3MvifmSHnrRGVY9P8axMzKCNkYDwWKIFcRDZR8lZvZA
         uGwnPniq3rx678o7lzVI40eW6N2Ll8THCUA1xQooxP1yOe/KBABS5ULsdGS/SV/zVPO4
         mSgy8UCSOoLRWOEYrnsLFZd76WcBwYwT7CocIoTtPJ8CaE0JwN18/5tmUMiDnlYog/GY
         wFRjw+3VyoEHvlA5DWeTeWgRu7f37YfYo6VbyEuCo0BLxEgqwnqdbQatZXGGXIU7CeKy
         G8lg==
X-Forwarded-Encrypted: i=1; AFNElJ+bzvbcpTYa5UXFivenWgzCEYxTidq7/MXjfZ3q9JKu9ugdD8w9blFAOOe1Ecp4Uy7cZp/RytWEfG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VeyqTScTvO85LamTqsgVvQp6x7qeywFYVWeS7pu5MncsFGaC
	oG5MgocYyLd1gvcVxSjTVISDRCy5LMcYrqo/1UoDr736N1PvFKLhkwFu2nvKmpi0Gg==
X-Gm-Gg: Acq92OHlLxZRryBMEo26ADBNZWk8oCNSsTCxOL1UDIUYVOdVRUqcNnG1rexX4XBpafe
	eSDVzoUQcls6nuNIlahtuOJWMuj536nGQqOSSVKlNL4m2I9OxT90aaglH9KlpYxigb6dAslL8yG
	kU8luhpKWG39BLV3eu3/ppoJxDOUnkQ4XLG6HGM2+oriNKzRs9lg/WkYI7xm9yLgJBYwSr3ZWvN
	JoLgxY+Zb0RlKdRHN+X+SCbgqL5kYGUf9pZcn/SRJzQTkzwi4xZGHFtCCwFv1Vo+hxZmt7AX6PN
	1jH8hWQOeFjlatRE07JHjDA23S3v4Kx2IGcp3uSWWAwklZEuTXbZQykZ/fO7YrknVyE5XAcAwA5
	SXW3a2IwZJs1IUBdXz9avJiMhqvnGWY4QWUpF5oviGVEMG7jMOUWeNFQKQsSHVshGYJvOVPUsMK
	OJB2QK1fmaPZN9DP8VhmBC4bNo9uDMvj3V5TXl4peU1p2l+tmguvfgGj6DrIBMZaduWio2JNNFz
	VEY
X-Received: by 2002:a05:7022:981:b0:12b:ec67:3529 with SMTP id a92af1059eb24-137d3e13d8cmr6754013c88.14.1780397766712;
        Tue, 02 Jun 2026 03:56:06 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b36c6700sm8875678c88.6.2026.06.02.03.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:56:05 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>
Subject: [PATCH 0/2] PCI: Add boot options to disable DPC and AER recovery
Date: Tue,  2 Jun 2026 10:55:56 +0000
Message-ID: <20260602105558.1799563-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On large modular systems with a complex PCIe tree, the default kernel
AER recovery and DPC behavior could cause unexpected side effects.
Sometimes it would be nice to have the option to keep the system in an
unmodified state and be able to handle PCIe errors from userspace.

This series adds two new PCI kernel boot options:

  pci=noaer_recovery  - Disable AER error recovery while still clearing
                        error status bits
  pci=nodpc           - Disable PCI Downstream Port Containment entirely

Yury Murashka (2):
  PCI: Add pci=noaer_recovery kernel boot option
  PCI: Add pci=nodpc kernel boot option

 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/pci/pci.c                               |  4 ++++
 drivers/pci/pci.h                               |  4 ++++
 drivers/pci/pcie/dpc.c                          | 16 +++++++++++++---
 drivers/pci/pcie/err.c                          | 15 +++++++++++++++
 5 files changed, 43 insertions(+), 3 deletions(-)


base-commit: 6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
-- 
2.51.0

