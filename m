Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEA3A1A27
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446034; cv=none; b=d/PXPCMAZKeT6xelj+L5xY0Jd6eZe80cfjlFn38C3ZREPbs9gS9PjLzasZHUzUuME2ZNA6zYWgDhNC1yKChQrA2jF1ZPijuuHc1Fm4kYJ0xV4Jz4G4YxofrqPn8/3+YiD5BDXXiWhRd1WhvBt2fF1w/wu3wLZZMeaRX/cjaG+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446034; c=relaxed/simple;
	bh=GlzyRXhW7BOFU2J58m5FlsVsMQJSPP8T+AYIfqJL/UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csit3E6IY94fcUKbPbIBd9iJhi3dL6NegufpB1VtGHt0STLHtA0dq/LKC8wwUytqEgMsGi1YwdW2wWqNjNjkkPtDvNY8az70M6HODOrLjAMufPlYcYo5jdrsRVr2g/kU6JEi3NGg7IqTjMuImbnLnzApsiPV2seaLC/6CFEAb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MteDqc+N; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MteDqc+N"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso6760199b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446033; x=1778050833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=MteDqc+Nzc+Y+LXHt9TzYJ2mp5ZYiSxukpwu3QPoJO+o0S6b7Zc9OO+TCF5qiv35mj
         cFQxvOoNVVNf3ROdWdO/OsBhNoaIP8GsolwA2wziNfG+ahtDiha5Ma1xGCFPSE3WPZz0
         zwVFryPwXIqe6PJu9JIyYB/gwrE6s8hBBM6etlW5egAh/mHpFMv54Lv9oSM7rJQa4t2f
         iSUmVZZZL/YTcD3FoPNHJlzyz8R59m2OeIE1xNr42ktveu4LEaX7q8/R+ri03p9oRfPX
         t/eRV+nVysY7hyjhsJd/4btqeS8vHJL3qvIRrAQ/y3mOZDIYfZb6gM8i8RP4/4pG8TFO
         9oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446033; x=1778050833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=WaosaXfFUnPipHyzZJsPEKmMAnmVkX7HKiHrL8j8EOJU7k3dLfMMtbXabTgdkaWzvT
         UyHmA6Z/26Qj7YgZrgRnL89DQJLTTXze8oiyX/MD22Q3efsupfdql92Ngmw0TtfjNG5y
         x296zUJzYX+odkT0bKS3GM6igPa03pvZ12On+QffJV4lVR+Vg6o10VNQZlbbYx6czDBN
         40l7KEoFlR4ebIhskvHQ/F2R1vl5xAxHl8lWNJ83ecvkzPNMgrkIVq+xNLcKn2OC92wP
         cjHpr2rhYcV3PRKOlpkrPIKLSzb+qdfyrGt84R4eQTs97G1uU8yp988xCTkS/posuVkC
         2uVw==
X-Forwarded-Encrypted: i=1; AFNElJ9vn8SYV+HJgs3Z/4s/W0Kewdjc4RuP3oCiXSJU1/MzC4YokQgFj/aStchZI8cKeaVTxreXTlaxFnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcNmc7ENjzFrWBN3IAfjk7US3PrMOs8jQATnvrsvBvUbi8IIf
	VExDflXOmUcLo5QeTqSBPEvIcPanv8b7Hl3bzNH5vQ7xynFBwRo0oTDD
X-Gm-Gg: AeBDievpM5SLH2a1DdTYxHj+ogQTkZmY3Ff2PF4ifiiySbotOiYCOzHerwr4QmvqAWi
	b1wfTisLT9aNvfR1N7RA8svy1YSpjxfpF3hztFSEbF4ptpuURbJt/MlknJHQPhbYDT/rCjFffQo
	BncAJ09nnLo3AiBErcJnu4sJxa2kNH+6tJnCkucR2TI4M/OHirwgECRJGOfeHFRr7goxUgMjMqW
	f/3WZe/boTi8CKPAmJ5J4qsyT2VmdSzOcLB183IX5qhjMWlNRH1rFyHj7/53CcKY61xRw9v5wk9
	zu5m7eGp/zA5h3NcvaMJbj72z3ir7KqFZ96Eh4L2fEuOm6SLcqbwYRte9t1V4Ck78UWuT4nUskz
	IJAuCuEuXt645HICkRia0t8HuOAi3Ue9N3e3e3u/NwcIgv5IdZuNR1kYsHSVTeRKCcoWxm1yjfK
	3s2QrRBgNv+VCaErF0/lA+rpLgavh11eyMQFWQldPbDBrQM1YO
X-Received: by 2002:a05:6a00:a14:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-834ddc14f4emr6920159b3a.24.1777446032715;
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 11/11] Documentation: admin-guide: kdump: document linux,no-dump DT property
Date: Wed, 29 Apr 2026 14:58:31 +0800
Message-ID: <20260429065831.1510858-12-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the new 'linux,no-dump' reserved-memory device tree property
and the automatic exclusion of /memreserve/ entries from the kdump
vmcore.

The section covers:

 - The two mechanisms that exclude reserved memory from the vmcore
   (firmware /memreserve/ entries and linux,no-dump child nodes).
 - Intended use cases (firmware-owned GPU, DSP and modem carveouts).
 - Interaction with the existing 'no-map' and 'reusable' flags, with
   the silent-ignore precedence implemented by the kernel.
 - Architectures honouring the hint (arm64, riscv, loongarch).
 - An illustrative reserved-memory DTS snippet.

The DT binding for the property itself is maintained in dt-schema.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..c2246888e84d 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -600,6 +600,65 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+Excluding reserved memory regions from the vmcore (device tree)
+===============================================================
+
+On architectures that boot from a device tree and use kexec_file for
+kdump (arm64, riscv, loongarch), specific reserved memory regions can
+be excluded from the ELF PT_LOAD segments of the crash dump.
+
+Two mechanisms contribute to the exclusion:
+
+1) /memreserve/ entries from the FDT header.
+
+   These are firmware-level memory reservations with no associated
+   device tree node and therefore no driver-level description. Their
+   contents are typically firmware scratch areas that carry no value
+   for kernel crash analysis, so they are excluded from the vmcore
+   automatically.
+
+2) Reserved-memory nodes carrying the 'linux,no-dump' property.
+
+   Device tree authors can add this boolean hint to any
+   /reserved-memory child node to request that the kernel skip that
+   region when constructing the elfcorehdr. This is intended for
+   firmware-owned carveouts such as GPU, DSP and modem memory, whose
+   contents tend to significantly inflate the vmcore without aiding
+   kernel crash analysis.
+
+   Example::
+
+       reserved-memory {
+               #address-cells = <2>;
+               #size-cells = <2>;
+               ranges;
+
+               gpu_fw@a0000000 {
+                       reg = <0x0 0xa0000000 0x0 0x01000000>;
+                       no-map;
+                       linux,no-dump;
+               };
+
+               modem_fw@b0000000 {
+                       reg = <0x0 0xb0000000 0x0 0x02000000>;
+                       linux,no-dump;
+               };
+       };
+
+Interaction with other reserved-memory flags:
+
+- 'no-map': the region is already absent from the kernel linear map,
+  so it does not appear in the vmcore to begin with. Combining
+  'linux,no-dump' with 'no-map' is harmless but redundant.
+
+- 'reusable': the region is actively used by the kernel for movable
+  page allocations (CMA) and its contents are relevant to crash
+  analysis. 'linux,no-dump' is silently ignored on a reusable region.
+
+The property is an operating-system hint; DTBs that do not set it
+retain the legacy behaviour (all memory is dumped). Architectures
+that do not honour the hint simply ignore it.
+
 Contact
 =======
 
-- 
2.43.0

