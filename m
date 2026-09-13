Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F233938B
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324679; cv=none; b=E9DbEpiMwGAHSz6LM4+g5uOOxgcUuq1+I8XcN0FSslUabsN8i4hrrmIBfdaV/SVVV60Gxhuj0bwG8WsUmQgSryK8QErT3+63T3N1kqEqzcY99TXSgzdboD7JY3LG37QB5DxXsnmdc/X4dgC6BTISuV2SnZis5Gokdc3HRKvuE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324679; c=relaxed/simple;
	bh=5MkNv5HhmnRadnPiFZ7Kpq6QLGkjqqFh7YYd35NzyS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlYXIBEGMkbaHDMHFzHQBx0yuI41e9a5mS3Ar3stqJwfZFf5oY8LweElsAqS0pbbR3MEbw6kM1bJMBuY/jf/72/QPN2PFVpXC0sInbI16o8L9l7BEHa5K0Ik0x3lglZeZyLxwMG/Mcz0Q5352osA75dyaOF58gWZZwvINZMKMCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCkRJ1bx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCkRJ1bx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2661846a91.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324676; x=1789929476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLpXy9tNi5ms1dbYyVi6I1as/81y8YWcT2cY9iWq8NU=;
        b=TCkRJ1bx2IFTofsKflqvb3SRACSiTu8znYe+y1i7ZQ2/uMlJ/0sWm4IqOe4pIfK0Tq
         1meGfoI9jCRdpBO9/DISfAYGkpOv8lqs3tOPo5nnE9Ya9RjFGpb/65KsN4r6QGrOoDL5
         /t1/B575G6iwlKHn6J2WTHwjW/bUYKHMUNoQPIKcIxGE+fHALyLVhBNaY1c6GLMr67BT
         w3v1TupA6m61ZW6CYb+QdqWVp4BmpXsANymn/dqQLhk/OVy69wV0RdeXWMbj7gXxNZ0N
         Vx2YlvUgokZ2zsoNaOM0zyuRH07o2iL2E7pXBALHF3Tmtc8cpBDsQZoLdxKD9HnwhP3M
         KViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324676; x=1789929476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLpXy9tNi5ms1dbYyVi6I1as/81y8YWcT2cY9iWq8NU=;
        b=Rxl6V5PuZEg1MIqwOvrmkznHdhpRAglA844jwJ4NNKHGpu4l/yfMvR+EPG6LvD9t5U
         tObM/MamgWfBJ1sqjgv5PMtuEg/PO78Q6XtMoes8pXGGGsS8bBWb6EGgilSKalVib+oU
         39P/4J7EletRZSBuCoJQNTFlbxQXrX7lz/NleFFeNGQbOfkEOAQvYd360TsGC+giH8QJ
         sMNh3qjtZ2qQuC88XxCPJmDBxUbvCVy6UtWmixe/wqwp7/QyvPU9ta9IitMamIKXH7aU
         76o9vPTRpzvcxFJ4z7C2z5ymgdU5sK6VMvqMvw0UMPrnGQsXkvqvum5c4+79ruTFjzMq
         fToA==
X-Forwarded-Encrypted: i=1; AKwUvBwXuJ0XW86kCLQm0xPgcrp0L6dAgL6oMl1/zvungiUb8mmqsJ+nFY9Q5pGs5NMcVCufzwr81LpY7lg=@vger.kernel.org
X-Gm-Message-State: AFuF++lfLC3f2Xe3BGaL2ZsCoewQ3YIZGxjPqjUxK8XrZ5biLUf7zTgb
	nO6Ria4w2Z5I+hFF1Y/olp5RF8H1I69QFmeMuIbwQCx0vDHJ/foDQieS
X-Gm-Gg: AYBFou0++IE7StV2JDExeeduM6NFj2XEfu4UuG3iCKpqcLzM+SYZr6pWFDdME34gVoh
	Nq4QatyiCkj0vt9l5jjGgi2eJeQPjdnvORqpWpnbZ5xoDq8blCFlubaFMSStdHDCu2luT19Myz3
	Bbf2l7DNcmAamwSGKkwpCJ7ixaNuihbQipVr6/L7ipYvgEr7sLIuLmD5CUysMPphv0GD5fmSur9
	10TcgUse2lwzhpUt9iOXUKL4nKQup6Faa/mzkdzS+iiW7qTbrlOEFVcNNiAbiHtS0RqpMDo18wL
	Bx4lbFDQ5lx+Ca7pZLc2z9Luk3DlZfKw3PHNllv+D1M4YkCOtObBYiceHR0xiqQHCdRHh+BTLBg
	eeLpDFV/WtTXcF5Goy5DKZWodgJzLlqhzG7x7T7h+2rtT6Fyjg7QwJaVCzA/F9mCd3dvfCnKGkw
	m/7j92Oenlc+rqHX0I+VgGTCVfcySlYNLG1jEaor46RAs/v5mhGqvRqzzPxnbYXIxRmMdvSwlug
	4Ps5A==
X-Received: by 2002:a17:90b:3812:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39d9beb8e80mr23558089a91.9.1789324675485;
        Sun, 13 Sep 2026 11:37:55 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:37:55 -0700 (PDT)
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
Subject: [PATCH v4 1/3] gpu: nova-core: move the debugfs root into the module data
Date: Mon, 14 Sep 2026 01:37:32 +0700
Message-ID: <20260913183734.134307-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913183734.134307-1-vladazaharova2018@gmail.com>
References: <20260913183734.134307-1-vladazaharova2018@gmail.com>
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
module. What is left is one unsafe read for the users and one write on
each side, with no guard type. A registration that fails now drops the
data that was built before it, and the directory goes with it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs       | 15 +++---
 drivers/gpu/nova-core/nova_core.rs | 82 +++++++++++++++++++++++-------
 2 files changed, 69 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25ea43f1cbe9..f29e601e6753 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -196,15 +196,12 @@ pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self,
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
+                    // PANIC: The module data cannot be gone here. It is published before the
+                    // driver is registered and taken down after it is unregistered, so it is
+                    // there for as long as probe() can be called.
+                    let log_parent: &debugfs::Dir = crate::debugfs_data()
+                        .expect("module data not initialized")
+                        .root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..0f8501c26e05 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -30,40 +30,84 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+/// Pointer to the [`DebugfsData`] the module owns.
+///
+/// A device has no way to reach the data of its module, so probe() goes through here instead.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+/// Data the module shares with every GPU it drives.
+///
+/// # Invariants
+///
+/// A non-null `DEBUGFS_DATA` points at a live, pinned instance of this type that outlives the
+/// driver registration.
+#[pin_data(PinnedDrop)]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the shared data and publishes it, so that [`debugfs_data()`] can hand it out.
+    fn new() -> impl PinInit<Self> {
+        pin_init!(&this in Self {
+            root: debugfs::Dir::new(c"nova-core"),
+            _: {
+                // SAFETY: Module initialization runs once and before the driver is registered, so
+                // nothing can be reading `DEBUGFS_DATA` while it is written here. `this` is where
+                // the data is being built, and it stays there: the module data never moves.
+                unsafe { DEBUGFS_DATA = this.as_ptr() };
+            },
+        })
+    }
+
+    /// Returns the root directory of the driver in debugfs.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
+    }
+}
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
+#[pinned_drop]
+impl PinnedDrop for DebugfsData {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: This runs after the registration is dropped, as the fields of `NovaCoreModule`
+        // are dropped in declaration order, so the driver is unregistered and neither a probe()
+        // nor the teardown of a device can be reading `DEBUGFS_DATA`.
+        unsafe { DEBUGFS_DATA = core::ptr::null() };
     }
 }
 
+/// Returns the data the module shares with its devices, or [`None`] if there is none yet.
+///
+/// Only ever call this while the driver is registered, which is to say from probe() or from the
+/// teardown of a device that is bound: the data is built before the registration and dropped
+/// after it, and nothing else keeps what is returned here alive.
+pub(crate) fn debugfs_data() -> Option<&'static DebugfsData> {
+    // SAFETY: `DEBUGFS_DATA` is written while the module data is initialized, before the driver
+    // is registered, and again when that data is dropped, after the driver is unregistered. Both
+    // happen with no device bound, so a caller in probe() or in the teardown of a device cannot
+    // race with either, and by the type invariant what it gets points at live data that outlives
+    // the device it is used from.
+    unsafe { DEBUGFS_DATA.as_ref() }
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
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.55.0

