Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390BB142E77
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237783; cv=none; b=FDq6PvvV1RF131ZQ/+NPFh0oMIDHxoJzLPFJqYXSLhuK4noPOEQ32C0vbWwZBRuKb1QBIUm5qYN9KmRYzYozr+CkgXLVwuFz0OupG4J19PV9iMvjbZI8iaMXuyJsQmUmcb1Mv5DFVmF+revecDmbC59pjp7CZGGZlhww/a5FL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237783; c=relaxed/simple;
	bh=WLctN9kaPb7/tmtQ6JvEuX8Oxyx3aY5Zprh2cytD4Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ly3LbwhDJuwRxkhW4nURMALoLJ8tyLdxNsy+7T6SRrwbRQFkmqiikMMH2Aw2sFjb9HAjxX4Ei4KMjoKz6PrsJOLFlGbyQEpZZbu2GBgXEDytLPCLGelzpdZkL8f1YY6D29NaKyTCm9AkoLpBIRgZ8SayDbQLsOppK64/CeYCmzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cynh2bae; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cynh2bae"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso95963756d6.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 10:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1735237779; x=1735842579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulc8YI8Od+RVUqdmJbEp8bNR29/8W69RWWEZTKBLmks=;
        b=cynh2baeF8elsmsx7QJ5wXZArC5KJQ9QtiI7SewCb8ZfKQWB6fhQhflGXR09OBVVDo
         L4VEHld956yxcWko4PMezphVlKz3ecUlQPrVhbdl3HMxvLO3UHCR3/rnqKeE7sVJp7Mu
         C0EN/Fzrs/bDK6Lz5wnomRnZoNrR7qu5s0uYlD54GSYp4M6IKnfiqZI4hkLTgOjwR7tS
         lX00Y7z+P52pGWUIppO1sFJL1Vvsi3sSLbSuYe4W7egmz1KH7VAkAZwdAurvXbhNBRBk
         7J99fpM674sVs6tmhlsw5FxHVcXIMkhDWQLEMLS3XEo75WWgIJUti03YHV7QOHf/GwFK
         G84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735237779; x=1735842579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulc8YI8Od+RVUqdmJbEp8bNR29/8W69RWWEZTKBLmks=;
        b=kiBRuDJi2X4EPjMigaCpDg3NaG/RRHZfpupMAfXXKFEv6bhh6mIU9zCYp7unfZhauj
         8RHWX0zyos5U/CrD4vWdlFks508LnSuP7Dql3eBX8BTDrh0STlq90D9Ps2k4EysqspwF
         SZ9SNWv0VpgBX3aqt+JSnP9U786dkg5ocxhwm/htGddZwTYgror60n1US3DIVU8H1jrn
         cJuUaIcR78af8EF8eDJOlXWr/heX1ov/h/14M0UJBf4fitkkhbOn9PlD0jCqD6r4FCxb
         jxLLr85870sVMpeM2Rp9a2e2RR//jthuVtiQutcR3MaoptDT6gE7jiFQOXsBzUtsUXhe
         qHcA==
X-Gm-Message-State: AOJu0YwQMO4NHCsqrvdwCnt6zGvaKyp53ufEBwe15E/WUFT74RT2MVjk
	P2dyM4Qfshxfk4rIpqtnD9PR/z3h1kpRln+0z+17Pzw0PdwOG+zrJEbazh9JFQ4=
X-Gm-Gg: ASbGncsUCa4WMyu0jgWvkr9wGxvQjd1KaE2O2bEY2yLetPLXTFhYDCGlORWfrwL8Lj2
	plDs0KL3ChraFH5tqVngQY3jt8/ZxVHhRamMhqO1loawkhv83SXWj/Bq2XS7JovKR3UPLioKf5S
	PoQCW+NfnleKjUAb8nUttOQJ8+9MyAfV3dFb6GaTVoCgLsvzt+xzeFjFJ998GxrZQjw4M2LTh1W
	SL9x6Po8l15lh0E+F2abq9uP4UGN4K2GI5kNUBuimaGHDxCjwXr5iHIS20Tojo=
X-Google-Smtp-Source: AGHT+IGunNgWGzawZSRYp426fRZ4HyEUdARE5RrkmmyWVpaqiWqMPRG0VVdcHlqGkSu5TnJeGImAmg==
X-Received: by 2002:a05:6214:250c:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6dd2333737emr432315856d6.18.1735237779001;
        Thu, 26 Dec 2024 10:29:39 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d52c2sm71619526d6.113.2024.12.26.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 10:29:38 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	david@redhat.com,
	akpm@linux-foundation.org
Subject: [PATCH v4] mm: add build-time option for hotplug memory default online type
Date: Thu, 26 Dec 2024 11:29:18 -0700
Message-ID: <20241226182918.648799-1-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4: updated KConfig comments 

Memory hotplug presently auto-onlines memory into a zone the kernel
deems appropriate if CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y.

The memhp_default_state boot param enables runtime config, but it's
not possible to do this at build-time.

Remove CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE, and replace it with
CONFIG_MHP_DEFAULT_ONLINE_TYPE_* choices that sync with the boot param.

Selections:
  CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE
    => mhp_default_online_type = "offline"
       Memory will not be onlined automatically.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
    => mhp_default_online_type = "online"
       Memory will be onlined automatically in a zone deemed.
       appropriate by the kernel.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
    => mhp_default_online_type = "online_kernel"
       Memory will be onlined automatically.
       The zone may allow kernel data (e.g. ZONE_NORMAL).

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
    => mhp_default_online_type = "online_movable"
       Memory will be onlined automatically.
       The zone will be ZONE_MOVABLE.

Default to CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE to match the
existing default CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=n behavior.

Existing users of CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y should use
CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand <david@redhat.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 +-
 .../admin-guide/mm/memory-hotplug.rst         |  4 +-
 arch/loongarch/configs/loongson3_defconfig    |  5 +-
 drivers/base/memory.c                         |  4 +-
 include/linux/memory_hotplug.h                |  5 +-
 mm/Kconfig                                    | 57 ++++++++++++++++---
 mm/memory_hotplug.c                           | 33 ++++++++---
 7 files changed, 89 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c79691eee54f..9138fcd18260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3351,8 +3351,8 @@
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-			CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
-			option.
+			CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel config
+			options.
 			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
 	memmap=exactmap	[KNL,X86,EARLY] Enable setting of an exact
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index cb2c080f400c..33c886f3d198 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -280,8 +280,8 @@ The following files are currently defined:
 		       blocks; configure auto-onlining.
 
 		       The default value depends on the
-		       CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel configuration
-		       option.
+		       CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel configuration
+		       options.
 
 		       See the ``state`` property of memory blocks for details.
 ``block_size_bytes``   read-only: the size in bytes of a memory block.
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4dffc90192f7..1cc6e8843680 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -113,7 +113,10 @@ CONFIG_ZBUD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
-CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE is not set
+CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL is not set
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE is not set
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 67858eeb92ed..348c5dbbfa68 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -512,7 +512,7 @@ static ssize_t auto_online_blocks_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%s\n",
-			  online_type_to_str[mhp_default_online_type]);
+			  online_type_to_str[mhp_get_default_online_type()]);
 }
 
 static ssize_t auto_online_blocks_store(struct device *dev,
@@ -524,7 +524,7 @@ static ssize_t auto_online_blocks_store(struct device *dev,
 	if (online_type < 0)
 		return -EINVAL;
 
-	mhp_default_online_type = online_type;
+	mhp_set_default_online_type(online_type);
 	return count;
 }
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index b27ddce5d324..eaac5ae8c05c 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -144,8 +144,6 @@ extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
 
-/* Default online_type (MMOP_*) when new memory blocks are added. */
-extern int mhp_default_online_type;
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
 static inline bool movable_node_is_enabled(void)
@@ -303,6 +301,9 @@ static inline void __remove_memory(u64 start, u64 size) {}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+/* Default online_type (MMOP_*) when new memory blocks are added. */
+extern int mhp_get_default_online_type(void);
+extern void mhp_set_default_online_type(int online_type);
 extern void __ref free_area_init_core_hotplug(struct pglist_data *pgdat);
 extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
diff --git a/mm/Kconfig b/mm/Kconfig
index 7949ab121070..1b501db06417 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -550,20 +550,63 @@ menuconfig MEMORY_HOTPLUG
 
 if MEMORY_HOTPLUG
 
-config MEMORY_HOTPLUG_DEFAULT_ONLINE
-	bool "Online the newly added memory blocks by default"
-	depends on MEMORY_HOTPLUG
+choice
+	prompt "Memory Hotplug Default Online Type"
+	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
 	help
+	  Default memory type for hotplugged memory.
+
 	  This option sets the default policy setting for memory hotplug
 	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
 	  determines what happens to newly added memory regions. Policy setting
 	  can always be changed at runtime.
+
+	  The default is 'offline'.
+
+	  Select offline to defer onlining to drivers and user policy.
+	  Select auto to let the kernel choose what zones to utilize.
+	  Select online_kernel to generally allow kernel usage of this memory.
+	  Select online_movable to generally disallow kernel usage of this memory.
+
+	  Example kernel usage would be page structs and page tables.
+
 	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
 
-	  Say Y here if you want all hot-plugged memory blocks to appear in
-	  'online' state by default.
-	  Say N here if you want the default policy to keep all hot-plugged
-	  memory blocks in 'offline' state.
+config MHP_DEFAULT_ONLINE_TYPE_OFFLINE
+	bool "offline"
+	help
+	  Hotplugged memory will not be onlined by default.
+	  Choose this for systems with drivers and user policy that
+	  handle onlining of hotplug memory policy.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
+	bool "auto"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplugged memory into the zone it thinks is reasonable.
+	  This memory may be utilized for kernel data.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
+	bool "kernel"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplugged memory into a zone capable of being used for kernel
+	  data. This typically means ZONE_NORMAL.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
+	bool "movable"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into ZONE_MOVABLE. This memory will generally
+	  not be utilized for kernel data.
+
+	  This should only be used when the admin knows sufficient
+	  ZONE_NORMAL memory is available to describe hotplug memory,
+	  otherwise hotplug memory may fail to online. For example,
+	  sufficient kernel-capable memory (ZONE_NORMAL) must be
+	  available to allocate page structs to describe ZONE_MOVABLE.
+
+endchoice
 
 config MEMORY_HOTREMOVE
 	bool "Allow for memory hot remove"
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3b6f93962481..e3655f07dd6e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -219,11 +219,30 @@ void put_online_mems(void)
 
 bool movable_node_enabled = false;
 
-#ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
-int mhp_default_online_type = MMOP_OFFLINE;
-#else
-int mhp_default_online_type = MMOP_ONLINE;
-#endif
+static int mhp_default_online_type = -1;
+int mhp_get_default_online_type(void)
+{
+	if (mhp_default_online_type >= 0)
+		return mhp_default_online_type;
+
+	if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE))
+		mhp_default_online_type = MMOP_OFFLINE;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO))
+		mhp_default_online_type = MMOP_ONLINE;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL))
+		mhp_default_online_type = MMOP_ONLINE_KERNEL;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE))
+		mhp_default_online_type = MMOP_ONLINE_MOVABLE;
+	else
+		mhp_default_online_type = MMOP_OFFLINE;
+
+	return mhp_default_online_type;
+}
+
+void mhp_set_default_online_type(int online_type)
+{
+	mhp_default_online_type = online_type;
+}
 
 static int __init setup_memhp_default_state(char *str)
 {
@@ -1328,7 +1347,7 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_default_online_type;
+	mem->online_type = mhp_get_default_online_type();
 	return device_online(&mem->dev);
 }
 
@@ -1575,7 +1594,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_default_online_type != MMOP_OFFLINE)
+	if (mhp_get_default_online_type() != MMOP_OFFLINE)
 		walk_memory_blocks(start, size, NULL, online_memory_block);
 
 	return ret;
-- 
2.47.1

