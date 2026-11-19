Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082535;
	b=2LajdBN6dqCISpDf3fLZjXBXoXg/vnUGSnWsRnx2CCiaix+FVO3Nob0XklUArG4jO5dS
	 yyDUF9lZWD0mSiDxXRlsn6nuFAWfrKOhucvrZ+qOJqhV+Tyc6QgHuglgOYHAzd0kj4E1O
	 FdK4itmRVSPGvN8Gm9VyncDWUnV9lnNWqC5tlYSkqmDkniQMRXuIkQ8ui9GQ+xCyF+Z+A
	 Ms2/4L0K/Mxa4LbGYXlHt1nT0O0CsPl/BFGO3gR8YeWTnz006uUp2qzRl0/d31ZxZ1lls
	 Y2BAQWcllGmslj68IypNAvDIclvYgoAjBDBRU0JwwK8jJjELnSwUdzA2DFOBagM4cBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082535;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=J1xrO2Y7n8BOFe6QC7CesVydiqyoOrVKZU9JIFCW6gc=;
	b=ZUN3WhzyPpNEOc42tyMzFocI7UwwEux7kpP+sKFVU6WAd/71la7YrCQivo1gLFvoaIEV
	 gPle0XYpP/DwHlszQ3sszjMVpedXbG2IDxkS+CzVrBGObwY/I33f+7y1v1PZDqfRy0Mrh
	 9oD+5BxRVouj8fjuwM+TX2b3TlJAqiVLdIZZeBIaVFRkWTrhKgEblSGmYAHFEJLENrWDN
	 HBdcJqix4dLUP9JFoRbgx3KU+JXxYEOS0xn9ZJXN6b2i2ssnSvsTaUZOLZqYHWZbDKXZV
	 nFSVbdenGveqEMCOGTQzuy7TO7u8EOpZaJtIWXLCJ8KCoRRsVT7xSpJT2lXU+PyAH7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2VP9dmAA;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1660A260D;
	Thu, 19 Nov 2026 10:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE1660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2VP9dmAA
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J1xrO2Y7n8BOFe6QC7CesVydiqyoOrVKZU9JIFCW6gc=;
	b=2VP9dmAANqSdFteXZIsBtMHxXgy3OCelrSi9r7RWeTV7SOEMBPKTGUoKrRxKXqaoIXu3LyLeO
	b8VVekInQ4nT3Ag8LPC/ugpx+E1fiIenhdwfEuJmkQLW64hixhf+oeiszAi1+nxylfdzQa0EaIF
	x9dI5GddupCRViCP9xMMLyo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jVYsd0Xf1z1prM1;
	Thu, 19 Nov 2026 18:01:57 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 930A140561;
	Thu, 19 Nov 2026 18:02:10 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 19 Nov 2026 18:02:09 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH v3] kho: do not expose incoming sub-blob contents in debugfs
Date: Thu, 19 Nov 2026 17:59:37 +0800
Message-ID: <20261119095937.826980-1-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo200009.china.huawei.com (7.202.195.26)

Incoming sub-blob pages are owned by their consumers and have independent
lifetimes.  Some consumers, such as LUO, restore and free their state in
early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
view:

  early_initcall: luo_early_startup()
                    -> kho_retrieve_subtree("LUO")
                    -> kho_restore_free(luo_ser)   /* page is freed */

  fs_initcall:    kho_init()
                    -> kho_in_debugfs_init()
                         -> phys_to_virt(luo_ser_phys)
                         -> debugfs_create_blob("LUO", ...)

debugfs therefore ends up pointing at a page that was already handed back
to the page allocator, and reading the file triggers a use-after-free:

  # cat /sys/kernel/debug/kho/in/sub_fdts/LUO
  ==================================================================
  BUG: KASAN: use-after-free in _copy_to_user+0x37/0x60
  Read of size 32 at addr ffff88810309c000 by task cat/27436

  Call Trace:
   <TASK>
   kasan_report+0xb9/0xf0
   kasan_check_range+0x100/0x1b0
   _copy_to_user+0x37/0x60
   simple_read_from_buffer+0x77/0xd0
   read_file_blob+0x75/0xa0
   vfs_read+0x12d/0x520
   ksys_read+0xc3/0x160
   do_syscall_64+0x97/0x4b0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

  The buggy address belongs to the physical page:
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x1fd
  pfn:0x10309c
  flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
  page_type: f0(buddy)
  ==================================================================

The page is already in the buddy allocator (page_type: f0(buddy),
refcount 0), which confirms it was freed before the debugfs view was
created.

KHO does not own these pages, so it cannot safely expose their contents at
all.  Drop the in/sub_fdts directory.  The incoming FDT is reserved by KHO
and remains exposed as in/fdt, where the same metadata is available.

The incoming sub-blob debugfs directory is gone, so remove its description
from the KHO admin guide as well.

Note that in/sub_fdts has exposed memory KHO does not own since
commit c609c144b0e8 ("kexec: add KHO parsing support"), but the
use-after-free only became reachable after commit d376e4b55c9a0
("liveupdate: centralize state management into struct luo_ser") which
added kho_restore_free()

Fixes: d376e4b55c9a0 ("liveupdate: centralize state management into struct luo_ser")
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Long Wei <longwei27@huawei.com>
---
Changes in v3:
- Fold documentation removal into this patch (per Mike Rapoport)
- Update Fixes tag to d376e4b55c9a0 (per Mike Rapoport)

Changes in v2:
- Drop the in/blobs metadata file entirely (per Pasha Tatashin)
- Remove unused sub_fdt_dir member and #include <linux/io.h>

 Documentation/admin-guide/mm/kho.rst       |  4 --
 kernel/liveupdate/kexec_handover_debugfs.c | 47 +---------------------
 2 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..4281da6be5fa 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -117,7 +117,3 @@ stabilized.
     kernel's state is in this file in the format of flattened
     device tree. This file may disappear when all consumers of
     it finished to interpret their metadata.
-
-``/sys/kernel/debug/kho/in/sub_fdts/``
-    Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 7d74477da0b7..3a91c47ad7a6 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -10,7 +10,6 @@
 #define pr_fmt(fmt) "KHO: " fmt
 
 #include <linux/init.h>
-#include <linux/io.h>
 #include <linux/libfdt.h>
 #include <linux/mm.h>
 #include <linux/kho/abi/kexec_handover.h>
@@ -97,8 +96,8 @@ DEFINE_SHOW_ATTRIBUTE(bootmem_len);
 
 __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
-	struct dentry *dir, *sub_fdt_dir;
-	int err, child;
+	struct dentry *dir;
+	int err;
 
 	INIT_LIST_HEAD(&dbg->fdt_list);
 
@@ -108,54 +107,12 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 		goto err_out;
 	}
 
-	sub_fdt_dir = debugfs_create_dir("sub_fdts", dir);
-	if (IS_ERR(sub_fdt_dir)) {
-		err = PTR_ERR(sub_fdt_dir);
-		goto err_rmdir;
-	}
-
 	err = __kho_debugfs_blob_add(&dbg->fdt_list, dir, "fdt", fdt,
 				     fdt_totalsize(fdt));
 	if (err)
 		goto err_rmdir;
 
-	fdt_for_each_subnode(child, fdt, 0) {
-		int len = 0;
-		const char *name = fdt_get_name(fdt, child, NULL);
-		const u64 *blob_phys;
-		const u64 *blob_size;
-		void *blob;
-
-		blob_phys = fdt_getprop(fdt, child,
-					KHO_SUB_TREE_PROP_NAME, &len);
-		if (!blob_phys)
-			continue;
-		if (len != sizeof(*blob_phys)) {
-			pr_warn("node %s prop %s has invalid length: %d\n",
-				name, KHO_SUB_TREE_PROP_NAME, len);
-			continue;
-		}
-
-		blob_size = fdt_getprop(fdt, child,
-					KHO_SUB_TREE_SIZE_PROP_NAME, &len);
-		if (!blob_size || len != sizeof(*blob_size)) {
-			pr_warn("node %s missing or invalid %s property\n",
-				name, KHO_SUB_TREE_SIZE_PROP_NAME);
-			continue;
-		}
-
-		blob = phys_to_virt(*blob_phys);
-		err = __kho_debugfs_blob_add(&dbg->fdt_list, sub_fdt_dir, name,
-					     blob, *blob_size);
-		if (err) {
-			pr_warn("failed to add blob %s to debugfs: %pe\n",
-				name, ERR_PTR(err));
-			continue;
-		}
-	}
-
 	dbg->dir = dir;
-	dbg->sub_fdt_dir = sub_fdt_dir;
 
 	return;
 err_rmdir:
-- 
2.43.0

