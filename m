Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631413;
	b=Y3c2RQQ89a0APUhlCjNgdmD4fjUecPa9aPEQqseh6g5Vp7edJGDkixbsQnIpmiY1J8Pd
	 +rh6eYtQnelC6JAH7P4rUsHqtO/mXlXpcpnlIauYkW7QHT/hB4h0NTqBKAlQRTAbjJVXk
	 daUkSc+TusWfmfiEzjH/AqcsjUJXuCUptHELWcgkwrAVykIoIGzxl2fCPcSAM/oDlUMat
	 9qezmV+HmzQlC3AcWuggyaInetQuJPdVH0LugEPTLikYxl/TKwOSAyHGSnDEmj8DHLFr+
	 6LtaTEWiAjRvFCVrLNsiUz8qOeeYQvrNtY8874ydoV7PQkhEg2WOzhGxXPp23+9erAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
	b=xhtvWhcsCTZ7f3LrIzYNfhJe6+iYmgdUR8EunYUU+uSdLdRdszZqdwr05e3OzF3wEnnu
	 RIe1ONP/lyVF94QEQvRIqmtQrOHqJY62o4Y9z0ZeU5kIa8xWWdX6sHCC68vGXx1Wz9NJy
	 7cpYf3ALw2BHpL/pFTYWl0Y4Dj1kYVM263Pr9Ak5+X86c4QQ3pT2tttbqojqeUkCK3C8S
	 VmFWcurcKejdTx89VsVa6xKqyDRoIJWIzHRydcwX5GVI2yNENZkXBT9TcSoNjnZ8IWgGm
	 Ma/B008hjRFl6l8fB+cooLAtAsgqtbC9aaCBZR/+F6ILGJKvPhaRK3tj2ocrpunY+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fui/6Fsm";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD88606A32E
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 04:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD88606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fui/6Fsm
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1367340a91.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 20:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631412; x=1795236212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
        b=Fui/6Fsmz46smK4HQ0XLve6RRiGsNnHNNc0Vw3wk1sbbAm6n6QNjddrUjg/EFqyD0s
         Gti4CGA63a842IoqEUKdtidorDsZdzS2yw6ehMhFA++oadpdIJHxUIK3+xyiACl9UsST
         zZoTngu2zxrlktgIrZtn89vRtQ5WFKacQcRaeQE5CiZqZ6tfvIFLflsYFnKGlMCuwUiG
         cheMbaNS5wVWfzX3O5wqdgzgMKTjwaDdJ2u18Vl5lmhjx7rCrvXuBpPs0wHx+dCtGHR3
         vagK50Vm7kvlYIhfLVygC+oVulxNVBXLLdz+n90BQTsRayffD8g4IPTZZWiQzJ55ufC1
         8vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631412; x=1795236212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
        b=LrUldM+5WDrPyrn3MiFIg19ywO429k8ofLr734iRTj9I3OmS0SwOXu4FSpjQSXuFRU
         Q2zDyMWh0q7j3QFVq0Ci2PQ4TBdMBbC/qariTv3n5OR60w3MmsY9GavhFpu2eVliO57E
         Vw2CT5/nuWUJjjS7v5+qjbqgVLcprUPsBCdKyRRGXveimYag3iNbF1++dNrss44t7MIQ
         pLmpIfl9j9rQayYdy0F8RHUQ6OD5xxpjqEGHtqiX0nP22AvykQta4JpJ6do6eXyRQeyj
         n5bzjvUJqox2Vgj0OjUhWRIXbdSMpmdh1+Ge0sF08by2y8lsEKwshewoS2O7yheT6LvC
         fvvA==
X-Forwarded-Encrypted: i=1; AL+hErFvNvRTc0Ij3gj9PJUiZfW2Zz9kQJYIw8squftNkpgEqf8Lxj0F4Ij8t9UQwlWBevDfaW/90XlQ8nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rvorWx58gr3COJN81t3ZAX9wLu74kUWCBuMK0qHEYqmBF5zJP
	Uzx/nZugLuz9foOw0HA3qymTWNiVHPjVlqDem5TyxaHs2p+rpM6AENqu
X-Gm-Gg: AYBFou2h4L0YqvWTKLCCgal4skMTD2qPDkM/YqbM6h4UVXiAFcf0P5rfr21sBVrKS8o
	NIBmh2fXBRMPv/eOdhSXGbKqL+Rh4ovkKOcfN2vot5UpQefN1LEFfCmGbi+Nw8nUOrUdSmdoGeX
	rPFxsq2G5E4In3m1G3PVP1EeJz3cwAE1PvT0GOnCcK22E3ZLjtybBQV/VdyTex24mEQnpr8SIJa
	m311YHWS58954v7ju9u0a67UcUDRfO5vxxwbjXLhP/yxYPiqKDR23Rf+0CAsTyGlXoFVw1jOS2P
	xV/D7n13EkHoJF/3iKZOtklZuFWGQXYkTvkm0UDw1VZYxw0rIG+kQ6HlX2LMfVlNW1yNFe9PoeF
	pa5g256R/E/6IxMC2Tb89laG6vVF5WcEWVAPVbca9kd/QD2GyHk+UaZS/PBEhATMQrpe7293++B
	TV2QlY6QJucNdZR4Qda6GJXfbsQxEoZ/IdQuq2qe2BOQ3TzHuxLW6XUKivrVpw4D8+5ZAgS2q8h
	oVNgNwAW7a32IHzMP4Ue4hotqiC3Qqs3V6z47OIjenFM99XcLDVhoG0QpRsrct7yPfcHy/0leXX
	3ffGlZP7tiSjzb6i1BzF7jgM0CPjqNWOSRmv
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr4243189a91.34.1794631411951;
        Fri, 13 Nov 2026 20:43:31 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:31 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v8 2/4] gpu: nova-core: gsp: move the log buffers into their own file
Date: Sat, 14 Nov 2026 11:43:02 +0700
Message-ID: <20261114044304.245684-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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

Move the GSP-RM log buffer code from gsp.rs into gsp/logbuffer.rs, ahead
of extending it. No functional change.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs           | 59 +++--------------------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 65 ++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 79ee74a0a16f..43df95406d35 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,11 +12,7 @@
         CoherentView,
         DmaAddress, //
     },
-    io::{
-        io_project,
-        io_write,
-        Io, //
-    },
+    io::io_write,
     pci,
     prelude::*, //
 };
@@ -24,10 +20,16 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod logbuffer;
 mod nvkv;
 mod regs;
 mod sequencer;
 
+use logbuffer::{
+    LogBuffer,
+    LogBuffers, //
+};
+
 pub(crate) use fw::{
     GspFmcBootParams,
     GspFwWprMeta,
@@ -78,10 +80,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
     }
 }
 
-/// Number of GSP pages to use in a RM log buffer.
-const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
-
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
 #[derive(FromBytes, IntoBytes)]
@@ -102,49 +100,6 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
-/// The logging buffers are byte queues that contain encoded printf-like
-/// messages from GSP-RM.  They need to be decoded by a special application
-/// that can parse the buffers.
-///
-/// The 'loginit' buffer contains logs from early GSP-RM init and
-/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
-/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
-///
-/// The physical address map for the log buffer is stored in the buffer
-/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
-/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
-/// then pp points to index into the buffer where the next logging entry will
-/// be written. Therefore, the logging data is valid if:
-///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a>(Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
-
-impl<'a> LogBuffer<'a> {
-    /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
-
-        let pte_view = io_project!(
-            obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
-        )
-        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
-        PteArray::init(pte_view, start_addr)?;
-
-        Ok(obj)
-    }
-}
-
-struct LogBuffers<'a> {
-    /// Init log buffer.
-    loginit: LogBuffer<'a>,
-    /// Interrupts log buffer.
-    logintr: LogBuffer<'a>,
-    /// RM log buffer.
-    logrm: LogBuffer<'a>,
-}
-
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp<'gsp> {
diff --git a/drivers/gpu/nova-core/gsp/logbuffer.rs b/drivers/gpu/nova-core/gsp/logbuffer.rs
new file mode 100644
index 000000000000..1fb411ce6d01
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP-RM log buffers.
+
+use kernel::{
+    device,
+    dma::Coherent,
+    io::{
+        io_project,
+        Io, //
+    },
+    prelude::*, //
+};
+
+use crate::gsp::{
+    PteArray,
+    GSP_PAGE_SIZE, //
+};
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
+const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+pub(super) struct LogBuffer<'a>(pub(super) Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
+
+impl<'a> LogBuffer<'a> {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
+
+        let start_addr = obj.0.dma_address();
+
+        let pte_view = io_project!(
+            obj.0,
+            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+        )
+        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
+        PteArray::init(pte_view, start_addr)?;
+
+        Ok(obj)
+    }
+}
+
+pub(super) struct LogBuffers<'a> {
+    /// Init log buffer.
+    pub(super) loginit: LogBuffer<'a>,
+    /// Interrupts log buffer.
+    pub(super) logintr: LogBuffer<'a>,
+    /// RM log buffer.
+    pub(super) logrm: LogBuffer<'a>,
+}
-- 
2.56.0

