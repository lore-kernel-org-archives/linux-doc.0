Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5815616AC
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992779; cv=none; b=iZT74qkyhHgKQDrAfZqPwCkvmGBgiyTty2ooC/JY73QiA5E0vXHFOj6ncVENI/sgorfx/d3rwLMC7Z/H5+qf9rrZwDMjxCqF4GVkVtvE5xsE5C8VyHuBXrCiSPBgfvIxNikxolgGKQxPfX7JeAK1APkZIB9JVqhTusAoExqv4vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992779; c=relaxed/simple;
	bh=wz8QQ7DeWXQsVXbj0hmgPgxjX+r3acDRS4N1h+N0AKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5Xdbe5/HqWra3gpJp/FfbfawYwm80RhyIvByAbRJbcU5hMwG2sDcqFgz9vCy8kBGFyTom3ke8VjbdXkKm35wZKhmUYRUs5/7xUtf8ll1txX4YB0Qze8XL9ZbHa+SkD6EQ2DPCRK61rIHcs/uLROUo57h31me+0MWidLqy8VCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY1NWh42; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY1NWh42"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89d4030cc57so764599b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992775; x=1792597575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy22pDYfeuvek64LZa9ynQRcmq/GB+YgHcRlx1f8W0A=;
        b=UY1NWh422kU/o+QDxqtovFhT58zLcNvmqK1fGvfzsHBknJ6Pn5kkjjm+m9+gK7ODYk
         CISTfRlhGbVRYaYyQPUzs2sjpr2t+XIR8tksSbpThLgydFK+ScsBhRQVJbrjhn3OyZrx
         VHQr47TBLGXXc+epkLbaBBjip7/5BBhRVHoHgz56T+bkqN+6RXkfrr76lLcYuo6t3aC8
         1PSsAdmgD4XXgc9ePX+WGU8mnA9V0/osR7G6M+f9QXWxgSW1tIO/YbMfKpsMF6a4sMHd
         HaWKGUCqZE8uZSJQU6e3jShln5028fOsy7kvOJKB6B3CcnL7i7zHYPHq8Hzv734L4zuA
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992775; x=1792597575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sy22pDYfeuvek64LZa9ynQRcmq/GB+YgHcRlx1f8W0A=;
        b=BquYoRxsthGYFhuswvKq6guQfYfKvEcY4dkXWKnshh/XMlYEbhjsb1SbfB2b/N7jB9
         YLcACf7SZo701V02pyujBW10yccoaFjMNvgl5g4V1hausjzTzNS1Q2F4WuRtkGcXRtgt
         iABM+UcQ4x4/d8/PhhPw+1Cc2nhbA45AnFyrI1a0efOuazmp87wgnejrkMDAMwAv3hxj
         LBe/dP/erp+DDkixy6qoGTE2zcgbwBWOpIrXXGCOYcTSKDEu+UoYO055H7zH+bKwGToY
         rQfHDsBXNJvCi68FlOZZyfr8Vc4HxYgrML3hI64cIbTPg81ZoIPCmdYfIAuaJLoVioqE
         US1A==
X-Forwarded-Encrypted: i=1; AKwUvBywy2d8Y4fyxYG9t4EI9uoA4O7erqzXUifqgjj1Y364B5BTV4fE+t3bQ8WQSQqmBeallY5YqVjLTME=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHZX5I2yFK6wwmiGzL3hojsPCHjhILkTfrbGxCi70Bpk72a6a5
	SJ4dtwgE6t0U82H6wVRNWP1XnD1tNpb2TjHykobcqyZ7nftTogdltCHz6MtmT5f4tOh0dA30
X-Gm-Gg: AYBFou3gqQI+FtB1vHsHrTWS3Znm9BjDCmSW0R3wiIovvV40t/Klw+eRxADIydnLKH5
	SYmvTnKrvbZw5AeT4nSGJpIcBbJnZQOxfmCqj9ptWhRYs63AhcjGaTWft8CtlXbjXA15waa+nus
	p3cteuAZay4oKMIm+tMVBj5iq4k9MXcmKK2oQZr9Z65GWoLY3jKBlRmfpBKzOGznbM34yyzDJ1y
	e6oMGo8+AfqMdGb5z+vmq3hgrrUr31buOpfoirA+lvJvXb9TZ/5zVVud9DLUOYohUHiNyzrrIUX
	sb4q6EMKe/YBXFSwyLiyUaJ8XenIBlPlKxvQlNx3NipXAP2QDDceF1vj/8oHPU7Qe3DDhSL2kEv
	OTpwoQ4LRWPIUZvWRGSZu2j7UmzZ9rYqX2nmyyA8k7hj2+pYm2Isho442rQfWNXaKDNDAKqe2Ln
	/dqc4uluyQ48nUpy4GgxtxgWnfiMwuh3PRgC9Jj6QXSfQ500wEQWmTOLMsFvMCp/Tdln1xwdHgC
	hoi
X-Received: by 2002:a05:6a00:22ce:b0:89d:7832:55f2 with SMTP id d2e1a72fcca58-89d78325697mr3135446b3a.36.1791992774636;
        Wed, 14 Oct 2026 08:46:14 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:14 -0700 (PDT)
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
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 1/3] gpu: nova-core: move the debugfs root into the module data
Date: Wed, 14 Oct 2026 22:45:52 +0700
Message-ID: <20261014154554.231015-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014154554.231015-1-vladazaharova2018@gmail.com>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs root lives in a static that init() fills in and a guard
field of the module data clears again. That costs a `static mut`, an
unsafe write on each side and a guard type whose only job is to undo
the write.

It also leaks. try_pin_init! drops only the fields it has already
built, and the guard is written after the Registration, so a
registration that fails leaves the guard unbuilt and the static set.
Statics are never dropped, and the module is unloaded right away, so
the directory outlives everything that could remove it. The next load
then finds the name taken: debugfs_create_dir() returns -EEXIST, which
Entry keeps as it would any other pointer, and the driver comes up with
no debugfs at all until the machine is rebooted.

Have the module data own a DebugfsData instead, built before the
registration and dropped after it, and keep only a pointer to it in the
static, for devices that have no other way to reach the data of their
module. What is left is one unsafe read for the users and a single write
when the data is built, with no guard type. A registration that fails
now drops the data that was built before it, and the directory goes with
it.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs       | 10 +---
 drivers/gpu/nova-core/nova_core.rs | 74 ++++++++++++++++++++++--------
 2 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index dda58095f40b..01ed4adffe93 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -199,15 +199,7 @@ pub(crate) fn new(
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
+                    let log_parent: &debugfs::Dir = crate::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..ee3a6600f320 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -32,40 +33,75 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+/// Pointer to the [`DebugfsData`] the module owns.
+///
+/// A device has no way to reach the data of its module, so code running on behalf of a bound
+/// device goes through here instead.
+///
+/// Written once, while the module data is built, and never again: what it points at is dropped
+/// only after the driver is unregistered, so it is good for as long as any device is bound, and
+/// is not read outside of that.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+/// Data the module shares with every GPU it drives.
+///
+/// Reached from a device through [`debugfs_data()`].
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the shared data.
+    fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
+    /// Returns the root directory of the driver in debugfs.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
     }
 }
 
+/// Returns the data the module shares with its devices.
+///
+/// The bound device is what makes this sound: the data is built before the driver is registered
+/// and dropped after it is unregistered, so it outlives every device that is bound, and the
+/// returned reference cannot be held past the one it is taken for.
+pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+    // SAFETY: A device can only be bound once the driver is registered, which happens after
+    // `DEBUGFS_DATA` is written, so it points at the data of this module, which lives at least
+    // as long as the caller's device is bound.
+    unsafe { &*DEBUGFS_DATA }
+}
+
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order, so the registration goes first and no probe() can
+    // still be running once the shared data is torn down. `init()` builds them the other way
+    // round, as the data has to be there before the first probe() reaches for it.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
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
+                // SAFETY: Nothing reads `DEBUGFS_DATA` before a device is bound, which cannot
+                // happen until the driver is registered below. What it points at is dropped only
+                // once the driver is unregistered, so it is valid for as long as any device is
+                // bound, and nothing reads it outside of that.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.56.0

