Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556427;
	b=lr1/nAx8IOWJMWo3lMtk7S+k9ifiENGCR+yBYQC2MxVPCc995T4dBcNWTkRhebEz2xQs
	 LnYMTOlL1DP025u3JxBK/0Bv4G4LD62nhNWS4B912Ml1gsQKdvEHvbKQqw31SpJ5BTr9X
	 +xZPMmLVvKwrKCTXJbKYZqGdbb/1WHucsaVuiT1wl9z13/DvJu75K9yOI4AmAA9DhSIzv
	 wEJXxnrCAdvjpbqgKzqQu5NXfT2b0CN5yTiI0lp3ecz8A/AZ01XLPSvqIM3AjbvkShBId
	 UuGl0gAFEARMZFWh7g0HHALAqDaL23hPgsUcxGCaBAHn1mfnEYR++kymN6FN5wm5upg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
	b=tMqWyXeNQiWQDM/wvGuTKONdeiD2O65cvfM4QBCqcfPNnN9ege9X5TNW5jTjTj+2Tr+D
	 rP8ApcRxxweRWSos2cEEHC09XrWZFCuOOYSM4fmB4tLFucKOUJeFPgaXDlhUoJjjF222g
	 w8MuCy+nBMw5D6RhM5ct0WL2o1oLKqkjdMfQTeql3fsLjsigHS7nAXthd9udVJX5EG5Mg
	 tlo6gKfygMyx1CJu9I1twgnsHF5eiLwKkwgZoaYxSsJBdK5o19qrumYHWj9fhtTpBc4KD
	 X9KGfpoU+OgMARlGwdKySha/AgN4PcryUE8icJHvLnFBP/ESWiS/5IgjICHRK+0V08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8A8utfe;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385D606A881
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4385D606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8A8utfe
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b1535be329so623417a91.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556426; x=1795161226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
        b=x8A8utfebOaOZ7hPy8NWMGVS6LVpKJnmq/TC1yA3CZPVCHzu7V89dP5Mjx1MigBNKy
         zLrSFHtEaqB9/yn2dw66xr8OgdaEQCtP8OXDG6ceSef3e5C7KRj5dd5nwr9I7cZyGreC
         2t+MHbxr24g8/3oIlq+EMZfG2pmLbdP6aJDaYNGm11riYIqZrgI0/C1b/DbUW5gKm15F
         aBFQBj6/joFof7itdYwss6AfK7IK3aGtZhVFY25GAQ/MJMEnJ/QUE3w+TFv8K9NTiG9a
         xTJMAj8N4uuRsmQyl05hK71lV0/2Y+uU8Aq4xtQcuiTn3UPr/wszBnU3pfK4mc+PkfL6
         /ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556426; x=1795161226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
        b=To+7Vlge5RJRWPWmONpHGzAL2lXbEdgTQg4DhRlLWFa0aEURlDaJJnd3hMwo//NolZ
         30M9DpWdHvZGseGeq8J5Kggx8t+lSIGYSClnKS63ZTWcAFkurLEvo/ltlk+jqW6ko/Fe
         JlYnyiXN84Fipe6MkquipAqeKG26gweVat72h7InzwDudZWZ0heaQEFGs9xzOoDOdZkj
         xqfCeBWf/OlmEdcz1ZS/sLv54cH87k4CQBYZChwwvnN293emJU9+msqFW986YiZIIzfw
         T1aAFq7IZ/zo18yZL0lVMPaYL8mgntATHhSCnEjiuW7JMG3+fNFNAQDtTIqkU97lvRmT
         dc2g==
X-Forwarded-Encrypted: i=1; AL+hErERfRvgFmKsW86k0z0ViOOI/uCmjp1VTw4mA7OUK2XhJC6I1zbCAC1Arhmhoo6xiI1EXZcw2sj/t2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QbxemI2QT0k4WC6WbbVSfpDhV68Y74J2HO8lyFtd0sCAzxyvg
	BmV2OsZuZ8oHcPcuqnNTxmRUiTZTYTZBTml4QCgWCqJgn8ZEt6sS4B9l
X-Gm-Gg: AYBFou1a0LnLM7gaD518LoVJMY/GZD0eq+ZXJyq26kW6W/iuPtVEVW3hqZ192v7cZsA
	NcRdQOWWV4AZoFI7HwnbjE6c9CKpkiGqr2nNblnCoqngxMxQy4Ls9mtMKOjml84t9j6W8zF66Lt
	bLNpYKLLCzadUg7mwAvMnHg8WINaTK73cvM191C6rMpBH4Z32K4By5wkdSfGjPQiPCoevww/kxY
	andhZ79Aa09N3CuQkxLgS3M1Z14Ssc9xuO/uddy0mOjaJJKEZzZhhljA8FcXNddaAyhBTZgOp7R
	ClEoDVkyVutcykotuWsmqvq8xUxgg2FfkHWMLemAUar7J/r6JuUMP7u4NwWpMNprIuCKDy/2lXP
	iEqZrp3dDuKe47NDcuX/Ad6mhSzbx43xxglXgmMweY+5pkU9hU06M6ae864DlFr9EocZIsN9C+3
	p3fZDXAYZf+Up/RmZ9OXvKObDEa3s8k9xlE8RaIbRwNf2UEOlOwW+W+jMnPHoyb0QNUT5ZKFTUH
	P2fg8zkCV1QI38eE4mm6aQrgs+h5+o9KznaZ00HSQciVDaTtxuNJGLShtOMnye2ASEP/6YyZtoj
	HWOeo40i95faSlaNQMoJja4ynyI3uakpzOI=
X-Received: by 2002:a17:90b:1dc4:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3b1b0b5e500mr1447942a91.60.1794556426358;
        Thu, 12 Nov 2026 23:53:46 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:45 -0800 (PST)
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
Subject: [PATCH v7 2/4] gpu: nova-core: gsp: move the log buffers into their own file
Date: Fri, 13 Nov 2026 14:53:15 +0700
Message-ID: <20261113075317.934264-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

