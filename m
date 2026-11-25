Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635048;
	b=QFHP2yFFKcbLaHwmXWiShKQk19gDrKqFwHhWWPxCX9ePYH5GxMAoFQKWwtmMXO2rBSeV
	 B50XLnKvGtqrkOppPA1F3YcSC/Dyt43zv35Hi9OIYFVD/U2H0dkgOlvwf3IcYRXBJstkZ
	 6nFjEvxSY9XggWfDqAyJeEXzPUcJ0ctqd/6XqGhIGCSaR+U71+Sjo14zzls0If7lE0FHe
	 MjiSa5MMRa/3g1tJK+2WjBTeDM5KVV+A6/YeNhnxVGUXQ18Jn4KX+4di9o2fKKhWdoWOK
	 +y6V2n9jugLzMi4XnQihKGP9pUyT6efdPEcxA8MlA9klKZMqZJchdC13iDDwf2trTww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
	b=B6iXpH7G+PRE39Bdze/NkDJWHEjUEUSLnfwG34Ib4E1QeAjs82akZv0qbpAyiGGICce0
	 LV/tHz37CNn0gmFExI0IAjgB3uFYH9yBjYK99kNTk8Vkph9rSiSc2rItAIjxkaYm03aOw
	 Xj1AbnQl6Ls2zfk/ZYSBtIOUPtJnKcABqIS8GYWflp9fAjBdW1hkV1jWjfIu7E+77fEXO
	 LDYMb3btGS84PY95ytGVpbWWhcSfWBNAlAu2pvfnbahs6pHlD4MD0W2byOA7LxqwXKeBy
	 sSTvW8g2StQbzx4AoLkY0wgSa7wUW45lSu4G2mnMa4Z9pBpKWJ6LCqb/Ar8V3zrpfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdCXUk2b;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935E606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3935E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdCXUk2b
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02ee04378so49708435ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635047; x=1796239847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
        b=tdCXUk2bln2JaFny46JeCc5ZMNDw/3+qR+WmADxAJaxlBXAqX0v7O+dGqHDQ7i9OSO
         HbGkyILfSoi2nqfk8zUQWh5tDLUrxLt3p6sOytd4oLf7WVgE71Wp5Lihy5FPwPFaBdLh
         AlZc4yBCwG/sE+NOF4koYCSIT//r7D3Kb041g2LQMvdiJa97tXnZREWzUbqsDTNvvk09
         t3r5BXnhfp4OWgjpsu7ninDi+MrCPp05mwXwwCH3+hMI10yLSwnsYAf2X+Vz71K2i1ps
         +D5udO8qxBudO1hPoqXH+t9LpgyRwdoRTAkmaN3dxj/FOvhXutPMEGExsJqi+wVE5f6D
         R3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635047; x=1796239847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
        b=KDx9mvMRobhbmiNcdHnfcKKQ3FccM0ibS/8B/h4gVnvlrDkAwlXBYdgiAiOshPIbG0
         HOhU+sj494Bm2dDiyv/N2MbNUOWS2tEESb2Hb3vXnzWum3xd8QZ6HEnjmwwDPIlVa7DS
         Gb6T9ZeFAE2sGLTg4RTHZ8WVMNqIkpKAvcy2e0mhXroyCes0XVgyowwUrZpASBdjHvyb
         agDTmb38Kmvtp3++v7v9UX/GDPgcd3lc/KHz3ibDhbw+hpC4+zr43tU9La9bF3Y1joRO
         kiRjlmfzjHHv8nNJKjNiE87Mo2b//2mCiIkZqzoZ30iwJ8xsSRAHMy9gmMTDLzQ0c7Uf
         i/ew==
X-Forwarded-Encrypted: i=1; AL+hErEilHZ7DTtc7Ii4JUz1B5WrX/y1UHnAIDe1GyN91/B9j3oDVf4YIslOsdVNyaG6Wnj9E342fke+OuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I+6rHOBOdUyt8jcnrD5Nh29nClcxOFn0clZTpiYb6o2Cov2Cv
	9DwI5VnlC3bdF3G2QQPtnXNPyzSjcCBUG0OBeydBJT0vOV5HF/ETwRm+
X-Gm-Gg: AZFdTZfx7cQwzD4I2twqDiE22f76uyhEJFc0D9erHS/KoNOnYGDgxs6epDYTs/3xPjt
	7B51Jki3W1vRy03J3+9PRmX387I8wSTnRbi1lj8vs8LNloewS2cyI954UhNA/sXoeaSVYyqiOJR
	LsOiXYrtZsqkoD/ErLEYjajoXmUJ2yINff0a3qtHEnj/a2tKt41DMVooR2+BMzuM+jvZ3FG9lqc
	Y5ZwvU/oNtlE2VeIYSToMWIzUpWFXhDcP1bCHND2ilgZs2xWK8mznHspAOumWSwFkEzPm3cRVMd
	uJqLRlH+ePvGcQ2Cnmg7rW/kR34HL13cIh+Jc+6v9Z4EJtZ6YopwTi4+111rVaGvLRi276FPS1Y
	cziEmd+H9bygR+eZREL2i8glEpIDwSTwL+U4mlNMlqL9wycyzFsD6sEQAPvM4BIkTsLyfB+eKve
	72+hYLFEz9k02Yqs4ltF9yAfknah/F7Pdvl2Uq0sRDeZ24UHRxfcTKTxHMSSSOAa+CYjqrG667N
	MqAVJSBEE1kxMWRHOxtEMVGyzAfJducRKLlYiDjzJe6iGsVYViKTNAiCawupr4Tf3iYn+X+hr50
	VFLJOp8IkNZF/fTOu9lq
X-Received: by 2002:a17:903:19cb:b0:2e9:3dd0:c8d with SMTP id d9443c01a7336-2f03f1cf44emr208593395ad.14.1795635047369;
        Wed, 25 Nov 2026 11:30:47 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm93698535ad.6.2026.11.25.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:30:46 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dan Williams <djbw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] docs: Fix the name of the memory hotplug online type configs
Date: Wed, 25 Nov 2026 19:30:39 +0000
Message-ID: <20261125193039.2437025-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The default online type is a Kconfig choice, so the symbols it defines
are CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE, _ONLINE_AUTO,
_ONLINE_KERNEL and _ONLINE_MOVABLE.  There is no
CONFIG_MHP_DEFAULT_ONLINE_TYPE symbol, but five files name one:

  Documentation/admin-guide/kernel-parameters.txt
  Documentation/admin-guide/mm/memory-hotplug.rst
  Documentation/driver-api/cxl/linux/early-boot.rst
  Documentation/driver-api/cxl/linux/memory-hotplug.rst
  Documentation/driver-api/cxl/linux/overview.rst

Spell the family with a trailing _* so that a reader looking the symbol
up in a .config finds one that exists.

early-boot.rst also gives the zone choices as _NORMAL and _MOVABLE.
The symbols are _ONLINE_KERNEL and _ONLINE_MOVABLE, so write those.

Verification: a build of the tree defines
CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE and no bare
CONFIG_MHP_DEFAULT_ONLINE_TYPE in include/generated/autoconf.h, and
grep finds no reference to the bare symbol under Documentation/ after
the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt       | 2 +-
 Documentation/admin-guide/mm/memory-hotplug.rst       | 2 +-
 Documentation/driver-api/cxl/linux/early-boot.rst     | 4 ++--
 Documentation/driver-api/cxl/linux/memory-hotplug.rst | 2 +-
 Documentation/driver-api/cxl/linux/overview.rst       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..8580099b98c1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3948,7 +3948,7 @@ Kernel parameters
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-			CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel config
+			CONFIG_MHP_DEFAULT_ONLINE_TYPE_* kernel config
 			options.
 			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 0207f8725142..c7de458a962f 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -280,7 +280,7 @@ The following files are currently defined:
 		       blocks; configure auto-onlining.
 
 		       The default value depends on the
-		       CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel configuration
+		       CONFIG_MHP_DEFAULT_ONLINE_TYPE_* kernel configuration
 		       options.
 
 		       See the ``state`` property of memory blocks for details.
diff --git a/Documentation/driver-api/cxl/linux/early-boot.rst b/Documentation/driver-api/cxl/linux/early-boot.rst
index 414481f33819..be9d5e510f99 100644
--- a/Documentation/driver-api/cxl/linux/early-boot.rst
+++ b/Documentation/driver-api/cxl/linux/early-boot.rst
@@ -34,7 +34,7 @@ which dictate how memory will be managed by Linux during early boot.
   * Linux Build config option that dictates whether the kernel supports
     Specific Purpose memory.
 
-* CONFIG_MHP_DEFAULT_ONLINE_TYPE
+* CONFIG_MHP_DEFAULT_ONLINE_TYPE_*
 
   * Linux Build config that dictates whether and how Specific Purpose memory
     converted to a dax device should be managed (left as DAX or onlined as
@@ -61,7 +61,7 @@ SystemRAM.  This will expose the memory to the kernel page allocator in
 If `Specific Purpose` is set and supported, :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_*`
 dictates whether the memory is onlined by default (:code:`_OFFLINE` or
 :code:`_ONLINE_*`), and if online which zone to online this memory to by default
-(:code:`_NORMAL` or :code:`_MOVABLE`).
+(:code:`_ONLINE_KERNEL` or :code:`_ONLINE_MOVABLE`).
 
 If placed in :code:`ZONE_MOVABLE`, the memory will not be available for most
 kernel allocations (such as :code:`struct page` or page tables).  This may
diff --git a/Documentation/driver-api/cxl/linux/memory-hotplug.rst b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
index af368c2bc9cf..df27520b193f 100644
--- a/Documentation/driver-api/cxl/linux/memory-hotplug.rst
+++ b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
@@ -19,7 +19,7 @@ Default Online Behavior
 The default-online behavior of hotplug memory is dictated by the following,
 in order of precedence:
 
-- :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE` Build Configuration
+- :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_*` Build Configuration
 - :code:`memhp_default_state` Boot parameter
 - :code:`/sys/devices/system/memory/auto_online_blocks` value
 
diff --git a/Documentation/driver-api/cxl/linux/overview.rst b/Documentation/driver-api/cxl/linux/overview.rst
index 648beb2c8c83..d567353e1dab 100644
--- a/Documentation/driver-api/cxl/linux/overview.rst
+++ b/Documentation/driver-api/cxl/linux/overview.rst
@@ -17,7 +17,7 @@ are generated.
 
     i) EFI_MEMORY_SP
     ii) CONFIG_EFI_SOFT_RESERVE
-    iii) CONFIG_MHP_DEFAULT_ONLINE_TYPE
+    iii) CONFIG_MHP_DEFAULT_ONLINE_TYPE_*
     iv) nosoftreserve
 
   b) Memory Map Creation

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

