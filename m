Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3B380FD1
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197530; cv=none; b=cEHofbf0y3cpvQzSMTX+M4s+P0ZPjD9v35Q/bExfmW7jATZh9l4Ds/Sf2SYauNSsJFAQXoLQA7T99vwaEoDmomtQnIF8wmTT3FPkBInnpmGdDbfNajbvBeNFmwR4c76UkQuy5No53lX7dPNON2J7GyWB471WGc4IqK0bg6rj8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197530; c=relaxed/simple;
	bh=icmX+e8eV5T7lwdK+/Ae7/ixgFSBDIOa2J3Wav1g/+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmPpMoBjhMKcL83NwH41W3Z23j6AXv31iSWxRMOeut3v61jzHWBjW8BgCr2/0VEvacne8BjovffO64AaLXpFZsi9OIPrlahR/dnHvS5GBMU0zblgYcbcy4pEMHyDPl478fJ3fyW7bayK9lOQT14VETlmtAJSp+wC7OjReGennu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7IP7bhH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7IP7bhH"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso2466920e87.2
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197526; x=1789802326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=W7IP7bhHg4v8425hAcrGW4dD+vnuuEWnKcpWjpBdN2qfJSMSkUBPy3L04e0FQq65U8
         KGJ8KJYP5qQnTjXvXcyjIv5wFW4C6HIJimoiDJnuKbVxzWMQJiZuCMOdKwrwFyPo1eE8
         WkZbfSlanz42qiqaU0jDaiX6rHZjmP2TLFQ5YrJwz9H4WN3vTFQ9j/keyuqdAnwWJ2KU
         19YNL7W1TRl/kTm9DFGtq2d4hLGNK3V0AbejEwpUALAt4QHbO805HbEtvdTn1L8CLgL4
         zCWdX++2l+YllCJLwT9PF8a4PgscF250x9d+KtC1KSjoj910mBc4nf5vy5YuC+IPZ4NG
         6DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197526; x=1789802326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=AWNivIjh3CQ8hzUIDZwm83UvRtpYXFBatJEri0vpjpE2v30HcGBR0IC1JBYuWQ4/mi
         j+rzT3vtZS8ud7IWjA+AGv7ndxOH6SOyaJAhCWJGRooUyngLZnR/ysxcaShlVR/fOUlG
         RLkNK1f5cS0En+tDoXmd9h36nw6al9jW3hdWFik52S4Mkq1aP7n7XkWfVeJ2dTWnTm5C
         BJfjI7J0/QWvc9Z2c2vC3EVPDmISX+qPglXSI+afBAq3EALuCy5y9Hd+KDPAAU8jvfok
         L+AZTNQ9I6XdNJ2uPAvCGcThmZgag8DQQattNwNJpJo+HNcvqxxovzimtfDtbd1rsEU5
         qFlw==
X-Forwarded-Encrypted: i=1; AKwUvByt+y/57xjJ1CqTsdpxeal5VkTJ+z08BFKiZsPM61+r/fCxqADHtzBfLTXTv9uGc59DGFtBUMnR3ns=@vger.kernel.org
X-Gm-Message-State: AFuF++nuZS+kzjR5Tn9DR/lpDfiKeuPQUlOsk3ou/bz0IwQNF7FUtn8Y
	igCalkj8KDy4pAx/lYBd9EFr0vk0OuJ907IDsOkdFX/tAeoRc/A+INM7
X-Gm-Gg: AYBFou2VFDAoo6/FAp1snkbWxFuK7Fd2jFsleDfqmVicSOhIRswktMSHK/gxLbBLV1n
	rJsov8aeKT4sT/sZyUF957ExdPsgLshG4XezvTButqyE5LlivhnVI60C5ghFHsphBevvT3EqE+a
	1yylzAKwrCz0wfEPfCYUKKGn3S9x82dDVZ7kTZLWankCIkCgIuuv561EKCC99l77kFKo8oNAvCH
	z2FmsOS0VabfiYrVFFwMbf8n//p3GB8LbnHxr4MM+dW8/0XqfjV7oB49dTfJ1tKNLV/XHH1Jcr9
	X/2D0hoFKS3Z30ZFSJpn7HtiDT8Xu+dtFq6GA6sBansyI4Gq1//arahBBmw50fiMntGQ9bhgRKz
	FU+YmHFjTGoduNRoHmxgqQFb0xP4fYxHtrgwt8L2vRaUA8C979rwALZEPHud9tZ3P9ayewDuJyY
	zeyrotWRQCygBbwU0p5mFnRHTSOCB7g3TRD6QAAFNaUWPh+G1iLi/P7ypj7c8FpHQ8NdJ1D4fFT
	K2nBQ==
X-Received: by 2002:a05:6512:2246:b0:5ae:b7ca:33ec with SMTP id 2adb3069b0e04-5b8a02de7eamr1453366e87.9.1789197526260;
        Sat, 12 Sep 2026 00:18:46 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:45 -0700 (PDT)
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
Subject: [PATCH v3 1/3] gpu: nova-core: build the debugfs guard before registering the driver
Date: Sat, 12 Sep 2026 14:18:40 +0700
Message-ID: <20260912071842.622696-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init() creates the debugfs root, hands it to a static, and leaves it to
DebugfsRootGuard to clear that static once the module goes away.

try_pin_init! builds fields in the order they are written, and an
initializer that fails drops only what it has already built. The guard
is written after the Registration, so a registration that fails leaves
it unbuilt and its drop never runs. Statics are not dropped either, and
the module is unloaded right after, so the "nova-core" directory outlives
everything that could remove it.

The next load then finds the name taken: debugfs_create_dir() returns
-EEXIST, which Entry keeps as it would any other pointer, and every
debugfs file of the driver silently fails to appear until the machine is
rebooted.

Build the guard first. Drops still run in declaration order, so the
driver is still unregistered before the guard clears the static.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/nova_core.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..11fe1d2858a9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -47,7 +47,8 @@ fn drop(&mut self) {
 #[pin_data]
 struct NovaCoreModule {
     // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // then `_debugfs_guard` clears `DEBUGFS_ROOT`. They are initialized the
+    // other way round, see `init()`.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
     _debugfs_guard: DebugfsRootGuard,
@@ -61,9 +62,14 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
 
+        // Fields are initialized in the order written here, and an initializer that fails drops
+        // what it has already built, so the guard goes first: should registration fail, its drop
+        // still takes `DEBUGFS_ROOT` down with it. Nothing would otherwise, as statics are never
+        // dropped and the module is unloaded right away, leaving a directory behind that the
+        // next load cannot create again.
         try_pin_init!(Self {
-            _driver <- Registration::new(MODULE_NAME, module),
             _debugfs_guard: DebugfsRootGuard,
+            _driver <- Registration::new(MODULE_NAME, module),
         })
     }
 }
-- 
2.55.0

