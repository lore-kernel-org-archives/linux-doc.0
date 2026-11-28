Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848571;
	b=Viaf+a4c7hXlTVasVnRmJh8zwyCFFdel/lbw7LGXD6zXkGCXv9VgBxRit0DiGsP5m/QA
	 XWPtd+cvJIjQgj8DpryqhJxyvIm7/mPRbuoKShU5qlxwMcpgRYHqXfaJgRHDKyJletsjp
	 fcQFrqv50Aksl/rLEBdTDFUN2JHl2W4Sxs/3Au4rixNHglFPikuwoDg2/lYf5YnY87Oop
	 LM771uv7o+glL3tr04sH5LpkunBVlq/1vGjVw3WmAI1L4rw+kDoCkoxV7sgNyCFkU0UNn
	 f/+iClmc1hMm4RAOoXqwMIfFNfZ380uucjM3VNVsfz6M1kF+mc8tbFoPOCdnFY0xnMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848571;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=w2K3gLavbBJF2tXGVVPdBR0uV7DZf3XXZMRfQ/hGQDA=;
	b=cJKdFhaAzh0rdaAkPimsdY5AIzTIC+r7gcNX+L7EO72up8GtLM+UmmJD9P5scpZBElk2
	 xmoPw6bcQlTYnqENTSFMUDRVuVp52gH6tKWwDqVHJkxCc54cYxS6wcEDFfFFXZN37rV+4
	 j7ztSmPT0cIV3ZGdEiuJZB53lGy2kgCSyTPQnaA7JWUQMlaig/Jk7jikvS2TYGjFLUass
	 HyD6UAoGajEGmBqfBvevKgjMZ8QSiWqLqtooonZ1P6DwKbIk6nvvXA6Q5AAZiB2mEe+3Y
	 U/ovFoTyvRPOY8NUd5MU+ASLdpoitTLIRIkohFbPqc1CCs6XGhM9Q/wW+hdreQr4oaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C73606A32D;
	Sat, 28 Nov 2026 06:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C73606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAG7Q96eQprpuYJAA--.14079S2;
	Sat, 28 Nov 2026 14:49:30 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S9;
	Sat, 28 Nov 2026 14:49:28 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
Date: Sat, 28 Nov 2026 14:49:14 +0800
Message-ID: <20261128064916.3481435-8-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261128064916.3481435-1-dzm91@hust.edu.cn>
References: <20261128064916.3481435-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMAG7Q96eQprpuYJAA--.14079S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1rCrW5Aw1UZFW8Ary7Jrb_yoW3Jr1xpF
	9a9rWxKa4kJFyUC34fCF42qr18C3WrWwnrJr97X3Zaqr1DJF1ftrsxt3yDKasxGrWxZay5
	XaySgryjgry2y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	WxJVW8Jr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r
	4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UKXdUUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Move the GFS2 overview, glock, and uevent translations into the GFS2
directory. Update the filesystem index and add the GFS2 chapter index.

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../{gfs2-glocks.rst => gfs2/glocks.rst}      |   4 +-
 .../filesystems/{gfs2.rst => gfs2/index.rst}  |  18 ++-
 .../{gfs2-uevents.rst => gfs2/uevents.rst}    |   4 +-
 .../translations/zh_CN/filesystems/index.rst  | 112 ++++++++++++++++--
 4 files changed, 116 insertions(+), 22 deletions(-)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-glocks.rst => gfs2/glocks.rst} (99%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2.rst => gfs2/index.rst} (93%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-uevents.rst => gfs2/uevents.rst} (97%)

diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
similarity index 99%
rename from Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
index abfd2f2f94e9..a73444759a27 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2-glocks.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/filesystems/gfs2.rst b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
similarity index 93%
rename from Documentation/translations/zh_CN/filesystems/gfs2.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/index.rst
index ffa62b12b019..af6c10af2fca 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
@@ -16,6 +14,9 @@
 全局文件系统 2 (Global File System 2)
 =====================================
 
+概述
+====
+
 GFS2 是一个集群文件系统。它允许一组计算机同时使用在它们之间共享的块设备（通
 过 FC、iSCSI、NBD 等）。GFS2 像本地文件系统一样读写块设备，但也使用一个锁
 模块来让计算机协调它们的 I/O 操作，从而维护文件系统的一致性。GFS2 的出色特
@@ -33,7 +34,7 @@ GFS2 使用可互换的节点间锁定机制，当前支持的机制有：
 
 lock_dlm 依赖于在上述 URL 中找到的用户空间集群管理系统。
 
-若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需：:
+若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需::
 
   $ mkfs -t gfs2 -p lock_nolock -j 1 /dev/block_device
   $ mount -t gfs2 /dev/block_device /dir
@@ -55,3 +56,12 @@ GFS2 在磁盘格式上与早期版本的 GFS 不兼容，但它已相当接近
   gfs2_convert		用于将 gfs 文件系统原地转换为 GFS2
   mkfs.gfs2		用于创建文件系统
   ============          =============================================
+
+实现说明
+========
+
+.. toctree::
+   :maxdepth: 1
+
+   glocks
+   uevents
diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
similarity index 97%
rename from Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
index 3975c4544118..a60f9fdae6bc 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2-uevents.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
index fcc79ff9fdad..5e198707c16b 100644
--- a/Documentation/translations/zh_CN/filesystems/index.rst
+++ b/Documentation/translations/zh_CN/filesystems/index.rst
@@ -2,7 +2,6 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
 :Translator: Wang Wenhu <wenhu.wang@vivo.com>
 
 .. _cn_filesystems_index:
@@ -11,34 +10,123 @@
 Linux Kernel中的文件系统
 ========================
 
-这份正在开发的手册或许在未来某个辉煌的日子里以易懂的形式将Linux虚拟\
-文件系统（VFS）层以及基于其上的各种文件系统如何工作呈现给大家。当前\
-可以看到下面的内容。
+这份仍在编写中的手册，希望有一天能全面介绍 Linux 虚拟文件系统（VFS）层及其下层
+文件系统的工作方式。目前已有的内容如下。
 
 核心 VFS 文档
 =============
 
-有关 VFS 层本身以及其算法工作方式的文档，请参阅这些手册。
+这些手册介绍 VFS 层本身及其算法的工作方式。
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    dnotify
 
+Todolist:
+
+* vfs
+* path-lookup
+* api-summary
+* splice
+* locking
+* directory-locking
+* devpts
+* fiemap
+* files
+* locks
+* mmap_prepare
+* multigrain-ts
+* mount_api
+* quota
+* seq_file
+* sharedsubtree
+* idmappings
+* iomap/index
+* automount-support
+* caching/index
+* porting
+* adding-new-filesystems
+
+文件系统支持层
+==============
+
+这些文档介绍供文件系统实现使用的文件系统层支持代码。
+
+Todolist:
+
+* buffer
+* journalling
+* fscrypt
+* fsverity
+* netfs_library
+
 文件系统
 ========
 
-文件系统实现文档。
+这些文档介绍各个文件系统的实现。
 
 .. toctree::
    :maxdepth: 2
 
-   virtiofs
    debugfs
+   gfs2/index
+   inotify
    tmpfs
    ubifs
    ubifs-authentication
-   gfs2
-   gfs2-uevents
-   gfs2-glocks
-   inotify
+   virtiofs
+
+Todolist:
+
+* 9p
+* adfs
+* affs
+* afs
+* autofs
+* autofs-mount-control
+* befs
+* bfs
+* btrfs
+* ceph
+* coda
+* configfs
+* cramfs
+* dax
+* dlmfs
+* ecryptfs
+* efivarfs
+* erofs
+* ext2
+* ext3
+* ext4/index
+* f2fs
+* failfs
+* hfs
+* hfsplus
+* hpfs
+* fuse/index
+* isofs
+* nilfs2
+* nfs/index
+* ntfs
+* ntfs3
+* ocfs2
+* ocfs2-online-filecheck
+* omfs
+* orangefs
+* overlayfs
+* proc
+* qnx6
+* ramfs-rootfs-initramfs
+* relay
+* resctrl
+* romfs
+* smb/index
+* spufs/index
+* squashfs
+* sysfs
+* udf
+* vfat
+* xfs/index
+* zonefs
-- 
2.51.0

