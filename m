Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556419;
	b=tM0HAbnIfkHO/FN7cFLCedyq0K2BuIFkIi0VgKiQRFT6E5UdD21X2YkEQjd6P5bKb0PL
	 TrXVbRIc4nUqNf6n61zBJw0nIWytsZ4PJsV3FSJ7ip9o29zdr9+SFb+cbrV2Wqg5bgClg
	 LfQnae5SCT4jgLtIWXxR/rHMGECK36TNdLDEh7EVaJBsNb0+aD7yNxLLAepvzSUI8ty3G
	 p5Nnu6ftFeJZI8fApRxhQXRd90mzWB5inT6yaCSSgKfI78S1IatczL2ecS+v0lEfgpwtF
	 yE+ImK0WyBKX6ZGK7LlCufh92eQOd2IVr1ilZTcOBiJ927h5J3sGzC7z3dkqgWX98Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
	b=zOgOieiCPRuDGAA7acOOPjdUGhJpPBp1+oPei4HGYsThXbWngW6HFk+/ta0ThFjg01QM
	 aPNgFJ9DMsKFVaR8HU76Dx9ca/eQfgMAB4JQB5SdeppKIvgjLk1SRohRf2E/b5c22Dknx
	 2Y1deUnlc2sKtGXlxbU0an4p8dNcv4sCpwrfI/yZEIevWercGsHFbKZc/cgkFKHBW5JPG
	 NCwIPUkUUefGgKF5B1PqGBuzvi+pwgIMgB5EGfJN/myeOk74K0r+neMTaE4/wIG3ea8xf
	 +K7l5v88jnG8sYdD1ypeEH2P78XahzfmrN0DlR+fxHpc/dmSC9vPdnXGI7hZx51MUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwNtIWws;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F02606A327
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwNtIWws
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso993973a91.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556419; x=1795161219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=gwNtIWws1fr2f8biaLCpjpOSK5SwqS9fE7H6wLAlljtjMGzHVJS0FtWqg4zoedkQFe
         2SE4xsjs/pElhKnORUj9FUjH+GZT0vhksN98zZ6YI+g4CZ93Ev0SCQ7jj9jEjEbUunAp
         89AumG+msO3A8wiSQb+iWS6i521RVcKbdfRrnfmCAJj81+iIfCf73O9Bv44kj8ezolLD
         GktfctL3fwPjuBY6vL1ZqrVyGakX+wNGcQdNTyiHL+4GcQnWNYqaJmNdvcNUXhcvpJur
         6t23dxoWSB5WvKoGzCMooHkFJMy3DcIsS8pH1LBXW0NAp4j429nfNSXb+Hz31rgQJuCZ
         f0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556419; x=1795161219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=CZwij8cKU1HK8ybnqs6KCCZbz/se4WDn/EcZJlXZPLbs+1KMZybNCYyl/5CyK3hZjb
         iRTMvlDm93ydeVCxt2G2CVUXTmqxJWV8y/CqfXbvi2tS71tNfaumPOMSThVZOi8bFEvS
         sOMCjJekxOy0KIiB9EDSm3BLuNxIc3qk/TH+3iQTOmu+HNDbZp7iOTxsKtjQ3g+GJ6AC
         28NG8UESm3LkJhVKOmMJqnO8sjAir4TQTVQZkcdznNaB/c8zqUv4INSiYjHimVcN1suo
         Z0K4OMXq2yEwfH5oUiY/Wh0Gd31bzXSr5CkTh09c32LeND4ja+qmyK8nUoc6RRd6mkNp
         Zo4A==
X-Forwarded-Encrypted: i=1; AL+hErE59gLi3GqN9YXlwCUQGCaatmJQWDF99gUIwTbOGez6COvxC+1ZFpCOAuDVsXomZGtHVz1oX8Sni0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d4Em2u/OxdfZd1xQ2dSJ7mJaa82YVLtass7kv/8/UBJ5N+d3+
	eAOFyjn4YVurak0WsBsqLbJ0bwgZ2zAl4rPuO4uEYBNhwTq7855alWj2
X-Gm-Gg: AYBFou1TM6BVbc/AZAmLQhqzm9Ko4D7TtOKl2xwoxg04EcMr201ex59H7NM4nrLFTtg
	NzCrX91eRQyZBRkagk06WJLhhtKTCwDsUlvYj4ECh7deAnA7/0/lg88adDYLyHvL+0sFcPQg36u
	YHwRserS/F19GVcLyl2SlXuURN9JFKX5Zlx+UWTb7vYwdaOzEDhUgyef4Z3rGJMJEThXqwmN1d6
	8DpvAQeVGhpnC8UPqAUcu5WHSZm5fjNFZDxWSQNd3oF1hpoNGX8P2Pxc+MQDS6mASea+1Wfvvy2
	2Nx3WWQfWrNk5sVDj+RW9GGB2odcfg5M+wyj1NSULYqLxh3INoHpBpvqiwleEANd6o8I2nEzWtA
	pYNsXfPg2NDaclyhnNpr885JuKHpr+gh6XdUHPVcYZf99rEhQUhpaNIF7OrnxAb0Vgw0901aQ2Q
	edx4tjI1JP55lYtJ3/UbJSqycXe+pehZs2c160kAu4HNMi04eiiKFO5AyfOjBLFn4uyl4a4OOKt
	r0JJdHheaQnrw/X5MXwO3Y6ttWekGzH5sqyQAO3JGnylIHIGj3sMC+zoItdVMjINfoZ8LqxR+Dr
	NKXKu+oSm9+vyK1tPbX9qAG+Z5ZaE8jEuyoelqNLBrlo4YzPEiX8uFAM
X-Received: by 2002:a17:90b:3808:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b1b0d08ec9mr1691398a91.55.1794556418764;
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
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
Subject: [PATCH v7 1/4] gpu: nova-core: move the debugfs root into the module data
Date: Fri, 13 Nov 2026 14:53:14 +0700
Message-ID: <20261113075317.934264-2-vladazaharova2018@gmail.com>
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

The debugfs root lives in a static that is cleared by a guard field of
the module data. The guard is built after the driver registration, so if
the registration fails, the root is never removed and the next module
load finds the name taken.

Move the root into a DebugfsData owned by the module data, and keep only
a pointer to it in the static, for devices that cannot reach the module
data yet. If the registration fails, the root is dropped with the rest
of the module data.

Fixes: 09691f5d8070 ("gpu: nova-core: create debugfs root in module init")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/debugfs.rs   | 29 ++++++++++++++
 drivers/gpu/nova-core/gsp.rs       | 11 +-----
 drivers/gpu/nova-core/nova_core.rs | 62 ++++++++++++++++++------------
 3 files changed, 69 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs

diff --git a/drivers/gpu/nova-core/debugfs.rs b/drivers/gpu/nova-core/debugfs.rs
new file mode 100644
index 000000000000..6c6ed129f0da
--- /dev/null
+++ b/drivers/gpu/nova-core/debugfs.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Debugfs data shared by all GPUs of the driver.
+
+use kernel::{
+    debugfs,
+    prelude::*, //
+};
+
+/// Debugfs data the module shares with every GPU it drives.
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the debugfs data of the module.
+    pub(crate) fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
+
+    /// Returns the root directory of the driver.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a4b832f6aec1..79ee74a0a16f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -200,15 +200,8 @@ pub(crate) fn new(
                         logrm,
                     };
 
-                    #[allow(static_mut_refs)]
-                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
-                    // after driver unregistration, so no probe() can race with its modification.
-                    //
-                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
-                    // registration and cleared after driver unregistration, so it is always
-                    // `Some` for the entire lifetime that probe() can be called.
-                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
-                        .expect("DEBUGFS_ROOT not initialized");
+                    let log_parent: &debugfs::Dir =
+                        crate::NovaCoreModule::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..f5d08de8a212 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,7 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
-    debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -11,6 +11,7 @@
 };
 
 pub mod api;
+mod debugfs;
 mod driver;
 mod falcon;
 mod fb;
@@ -30,42 +31,55 @@
 mod vbios;
 mod vgpu;
 
-pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+use debugfs::DebugfsData;
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
-    }
-}
+/// Pointer to the [`DebugfsData`] of the module.
+///
+/// A device currently has no way to reach the data of its module, so it goes through here.
+///
+/// # Invariants
+///
+/// - Only written once before the driver is registered.
+/// - Points to a valid [`DebugfsData`] for as long as the driver is registered.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order. `_driver` must be dropped before `_debugfs` to
+    // uphold the invariant of `DEBUGFS_DATA` that it remains valid for as long as the driver is
+    // registered.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
+}
+
+impl NovaCoreModule {
+    /// Returns the debugfs data of the module.
+    pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+        // SAFETY: `_dev` is bound, so the driver is registered. Per the invariants of
+        // `DEBUGFS_DATA`, the pointer is thus valid and not being written to. The `'a` lifetime
+        // ensures that the returned reference cannot outlive the bound device.
+        unsafe { &*DEBUGFS_DATA }
+    }
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
-        let dir = debugfs::Dir::new(c"nova-core");
-
-        // SAFETY: We are the only driver code running during init, so there
-        // cannot be any concurrent access to `DEBUGFS_ROOT`.
-        unsafe { DEBUGFS_ROOT = Some(dir) };
-
         try_pin_init!(Self {
+            _debugfs <- DebugfsData::new(),
+            _: {
+                // SAFETY: The driver is not registered yet, meaning that no device can be probed
+                // and thus nothing can access `DEBUGFS_DATA` concurrently.
+                //
+                // INVARIANT: `DEBUGFS_DATA` is written before the driver is registered below and
+                // points to `_debugfs`, which is pinned and dropped after `_driver`.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.56.0

