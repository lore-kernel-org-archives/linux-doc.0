Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887723DDDB0
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 04:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139388; cv=none; b=AAt8JwtfkXlzcze2ILq3HLbi3iyDKGmNRyRqrr2fKiGzPAv95AMfIFjT3pjOpqWfoxbRQMX9LIdocl2HLNxH4s0l7lBwTblKM07t+DFZ5+fB8Bx4vm/OqL+8j2uo9XycgFpTVvrDte14yZykn1pwLv2K+IvP0/Rtct/kuFqqVho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139388; c=relaxed/simple;
	bh=V86MNPLWnsX5Ccyw79DrEJWhumxSriG1Mfudp02+rr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwHRHnOg3jtZub102WCaWQJAYb5cRI2FbWZYFaOUcSjcuEGJIy9pxSECP71BbABk59iy2tpzA+K3GqTtkPtJYdh9wObs9nE155fkfvJCFnowftbx8qTGRhd5rm9s4YvWpYSZur7HEYKFn/L+IMJap/fDVvlJ6s4owpdtHIeO9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsJaBu1c; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsJaBu1c"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso478064b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139373; x=1790744173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sjzjwfKOPK+68pn0ND2VFCH5pb05Tmcgf4f+gG+DjE=;
        b=PsJaBu1cnccvgbxgC1tjOV4G11ajr5oyWDYyZ4TK6jFbWA8qVQyOsK/EGi3nl5hgo3
         H3WDPzy/mhaf4xrw8vBk4v0bJj82eK8LNKwV3L2EkHsv3PFhzeo8sIDytf51rARxj6So
         enS68IbVSDNGiOo1fYrFM2NkKlVVrkcBRkrjrpBBrF5oKICJUo8V2oaLnwmdY11mR0sd
         55x4bpZlVFigjF+lGGmpaoDN4aR+JPJPPVSTn7are9muryXHm6V2+zm1uqmEHuvmkMBB
         hfIwICaTI6jS51ocbhy5ZvXziFb0r3jhGc00QhWIQQsgqULTrNxz9ykavhHMGSu3yFXN
         b8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139373; x=1790744173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sjzjwfKOPK+68pn0ND2VFCH5pb05Tmcgf4f+gG+DjE=;
        b=qcPv+axTqf6/xX8bfARr5URbv+UdWCM3YyY+G51+gFVyJQ+o+4R27tjzyIRAf0vizG
         bigXPJyr8MKX2On+jTYNYlJuHNaqoWvvvlp7xJHeS7OjePavEAAvWRxs3IoJvOurAnX/
         fj56LoA75Qer6AxPTI8Pwi9UyiEJwI66oOPzigqD5V4Q792RoQivHIKH38QzdElx1LQl
         leiZa0qzG2HKYYu3mZKYAsw158Quii/3UM8QDoxhA/2qngxHQWrs0F64hmH0ZHjj/Cxo
         86KLE4HlD4534bf2py2hWtrvokq1Nqz7/O8+1iUBwRnxB3wzIzSfg2U3guUBG184MDul
         VjIg==
X-Forwarded-Encrypted: i=1; AKwUvBzvJqZRyz6H+cMuKVYHCV+CzT4C45EzHzh9TnAyt1vojmJUgrszJ7sFSF6VsiOgBImdGGV1owW5AyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lrLWy4em99BfmYWkHuQQlhNO3fFhYjx/ZexIYNND/7mjTp7dH0
	nHoEC2N0x7IWA8nb/XTUphn/YacF3vB2NZkM8r1O4UFGw7kBO80k8o6a
X-Gm-Gg: AYBFou09jIfuXUDEPi6h94Xm9uvvmFWlzJf+fkDNulBM/C4+zCkzAkISdtq0x3o8Rps
	hALJSFfqvamjSWhY5MsFFu8X1RFMlEEwFbJ3JEx3QoBJj2TOvJ0ojKeeSoCXfHkypSveCotKHFj
	Im/gAVMzEUiJNwEoEaFQlgUolyjPmVJCM8hE+98jc6c4Fg7qgIQ8BeeKYjqs5Yb0GyjnQorn2Q6
	jkA1/qImsh9L2jDYfJeUJ1OLZZf/4jR2apWnevOU4rVRz4nMonWA6/nQC9oASP4Wo09Yvj9zMjp
	vH4lYR/0X/qM7vrKLuFgIaKxtdt2dsBbntnov6lsQov9tomUKTWyhM7tO455akV60vDJ3Z+oTZd
	o5Xxjhmv/onJZHXoPuWuddYI5tOYSjtlW56blx5KIlkrkAvGk8EavxQd3fAxA2g+sTwsXjO+BOo
	v6Q/HCCeuNUfVC+ksOj/z/8vMTzLdGwk+m4GqnjCWMZ7+yXmhFG8CWZ22gGxQDOMqakZcAWxc5W
	+6jXDSx1gmaSJs=
X-Received: by 2002:a05:6a00:1586:b0:87d:3894:1986 with SMTP id d2e1a72fcca58-87d389421e7mr1072428b3a.31.1790139371407;
        Tue, 22 Sep 2026 21:56:11 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:10 -0700 (PDT)
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
Subject: [PATCH v5 1/3] gpu: nova-core: move the debugfs root into the module data
Date: Wed, 23 Sep 2026 11:55:49 +0700
Message-ID: <20260923045551.229259-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923045551.229259-1-vladazaharova2018@gmail.com>
References: <20260923045551.229259-1-vladazaharova2018@gmail.com>
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
 drivers/gpu/nova-core/nova_core.rs | 73 ++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 28 deletions(-)

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
index 1133c6ce5c55..08509f64770e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -30,40 +31,74 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+/// Pointer to the [`DebugfsData`] the module owns.
+///
+/// A device has no way to reach the data of its module, so code running on behalf of a bound
+/// device goes through here instead.
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
2.55.0

