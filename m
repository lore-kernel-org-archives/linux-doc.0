Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275EF149E17
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163983; cv=none; b=mUR7WZ2IOr/VpQCfVdolasZHsApEBXp5kNaIt/7WNrEtnXDqmsfOIw9LIKngpklWJNHVcCSFC5XnTaJB8zyf0cBawGQsXCOyRWsFAtxciUjgKtazbfYKkBsW7YMJKKgoboZTxuy8HDWpZSz2OedxDvAQuYP8/W6xm922ZV/PMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163983; c=relaxed/simple;
	bh=0D/WrdGQQE7ltHL5+mGa/wEqsIL3YPu+z4L3U2Lyshg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dm5xNIjfMcrmgg2RGafiM1tjs47Laplya18QQv4SvGoJ+BTfb0xS7/pt4vAR1vqIykhebi4eYWhezntJeWfhVjnU/rC9kQlG/RVq7c+mydFx/tXOeRDdlYWzvdK4okBQHZGQveD7mm5Y4x0tsD6I/LpxqJCglYuJsB3/e6KyO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ei6ASSpc; arc=none smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ei6ASSpc"
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4f34c5f2f98so22010531cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 09:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766163981; x=1766768781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kou8afbLn05l+95wrl3ljXnrRcnV/4rBFXifcZSKEU=;
        b=Ei6ASSpcATcOSt4Hg9M1P5/7rlrbnn7cUE1w7jloYyMv/AjUQknuuIQJL8cfJ8Lsg1
         e/FtFrk55jLNHumNaKgy6cDm2bQSVCOZJCYBWUOOtQc/0Q5hp7CNbZG3/NuKFrXuJPFK
         x4P1fcm7F9fi+osc/VF9Cu6Aqu04dBFO4XYKcvpJJtair0Z9976Dz+iNyFcxi5H3oPwh
         mk5rBGVjBiQndB+1xFvYulMAuTrFjPUj0P5Xf/7fxkKBQDDGLql7j+jb+UKce7zpx/3F
         ycfKauErYVzpsZIYDlWZbwRgtH16A3KQfsjTuucnDQjvtZOeqyB/H/JMDECBmIV1tBkE
         Mwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163981; x=1766768781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kou8afbLn05l+95wrl3ljXnrRcnV/4rBFXifcZSKEU=;
        b=rvrhciJaSbtR5K0QeP+HH47TO8GsM/ZaStlzYNwOU3pLROnYwaIUNrrVRFAQdoScwk
         zlRtvZ4oFWAQCUNk/oiQ2L6njCTdt+cyBGbhcAWs33O6XZR1dw8dHKgHP2KtYckEUfpZ
         nqBheyydgTshBcW5JOJSRPugDPHfjj9NwoK4+J0g8fso5obu6ENf4XJHvzSpDExlKDcS
         rjGJC9MEJkDVkUgYV0YZr+rg7qqwWLwm79m8A9q+MsZlZUKb46irKJN66/M9zPYcKn6S
         rYT1A6JYpf1BXReHG9HkS7z4Yfht3qhc/0ulDUb2dyglAiXZxt8IjUKhlQ4IVjWOhj4V
         e7aQ==
X-Gm-Message-State: AOJu0Yw7T0F0kpUd8c+boF/iBFQhFlnoLxJbirSQJn/oe1XS8jF6pr9T
	P0X3ojRQIRSsgeWxcjiEs4D4+oyBErVyg9fbAhd4QO6aXj/k7NKK9+tRpEwpA2izhVQ=
X-Gm-Gg: AY/fxX4ibGQW7uNWj9giNaK7lI7J7Hk/Fg/85jcerplF655Wdh3U+yAkoE9Mioz7Moh
	TKWyyiVle6vvRoxpdnop1yrB8FgtSz9KCjK5Byyh+eoMJ6JS4rWKSymXHrHHonL1VusBRn8NRDr
	udKPFw/i1UuwunL5J9Y1+jzPhgf2JiuU4XWbERhGi0mZ/WdArM8n4dzQaU9e/DtEB19BRP+e55A
	S26kSxLpuvBL4ZtH3Bc+gX0KEx5v4iUyCZoCDCZCKwYHn+S2RyxxOHiXmFcVz+nhBvWN7bbcj3l
	4skIpnZTu6X6fploc9Tml9Qht30NttFJ9n0HPpruj1r9uPfgYHD/kt73VB0Fo2jO58UYXu1vdLv
	85ag6HYoURGxfv1MNSEdar5VroyrW68g93gK+r/rGtCMdeYYi0Rpsb34zcTEZPjrqGQdUv3ABhV
	Ohv2SB6MGy4Cy0/59NWUgUjAUPFGoFmg3wHiA7893kh+xpx7Lcq4SHRXDVANm1La3TfoorIs5+B
	x4=
X-Google-Smtp-Source: AGHT+IEw8aBZs2L4mMPmBDnnSLjfBX5Ies32NoaSuD3sFkoiOQdXSOB6QOg5l7pX5LIIu4V5HSwekQ==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr47440391cf.37.1766163980936;
        Fri, 19 Dec 2025 09:06:20 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096787536sm223197185a.4.2025.12.19.09.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:06:20 -0800 (PST)
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
	gourry@gourry.net,
	rakuram.e96@gmail.com,
	alucerop@amd.com
Subject: [PATCH v3 1/2] Documentation/driver-api/cxl: BIOS/EFI expectation update
Date: Fri, 19 Dec 2025 12:05:37 -0500
Message-ID: <20251219170538.1675743-2-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219170538.1675743-1-gourry@gourry.net>
References: <20251219170538.1675743-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a snippet about what Linux expects BIOS/EFI to do (and not
to do) to the BIOS/EFI section.

Suggested-by: Alejandro Lucero Palau <alucerop@amd.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/platform/bios-and-efi.rst  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
index a9aa0ccd92af..9034c206cf8e 100644
--- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
+++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
@@ -29,6 +29,26 @@ at :doc:`ACPI Tables <acpi>`.
    on physical memory region size and alignment, memory holes, HDM interleave,
    and what linux expects of HDM decoders trying to work with these features.
 
+
+Linux Expectations of BIOS/EFI Software
+=======================================
+Linux expects BIOS/EFI software to construct sufficient ACPI tables (such as
+CEDT, SRAT, HMAT, etc) and platform-specific configurations (such as HPA spaces
+and host-bridge interleave configurations) to allow the Linux driver to
+subsequently configure the devices in the CXL fabric at runtime.
+
+Programming of HDM decoders and switch ports is not required, and may be
+deferred to the CXL driver based on admin policy (e.g. udev rules).
+
+Some platforms may require pre-programming HDM decoders and locking them
+due to quirks (see: Zen5 address translation), but this is not the normal,
+"expected" configuration path.  This should be avoided if possible.
+
+Some platforms may wish to pre-configure these resources to bring memory
+up without requiring CXL driver support.  These platform vendors should
+test their configurations with the existing CXL driver and provide driver
+support for their auto-configurations if features like RAS are required.
+
 UEFI Settings
 =============
 If your platform supports it, the :code:`uefisettings` command can be used to
-- 
2.52.0

