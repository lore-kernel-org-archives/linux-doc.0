Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322433;
	b=19XbJkVry/tOLT4kVjrFGpspdFNc73CMhISUdrBqxai7DEP2wn8BsSRjINbIA7awlaPS
	 kszPfpyybkuTu68CQ6evQfzUPCdwNsEBa1bEHUHiLeX4Z0Bio9lD1BzCHLD2EDCr7RDE4
	 8c5yDDo+5Tt6UIG74jl4n1aqEwDjd957RR9+aLH8nTlQCa5jji7vWkcJrxo0h0KfNMtex
	 vvghRz7aVE4/ICfwFlD2OLlw6xwn9cHvo8MpPz3wCeqv9OCzxRjLn2HPC2JCRek7bTyuj
	 FvgEGY/fnoNyQhzYnwp43TD+NFahPjaTNAl6fMtqh0LfQQGCTzfJJ1nRNJitB3Hg1EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322433;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WCgC1zXUa5VL/T5uc6IwWPmG0hdt7c8H96K9cBn0Wzs=;
	b=CtiHjHVI+qpCgp357A6UkO3q+4Me8Exjj4XA27WqFjiqkafnQGUFaxQrz9MAvu4esa97
	 BTdGILzPUTY0NMo4h8O10Iaib9DdKPdbgJ751Ng8hY0S8T9HrqmrC7gIB1DybbsWGpkE6
	 wV2fKSxlF6FsHohynOfBglMMon81djyT/P2UeH3XwqZIfYD5VXvkoAPrkm/lkw2DhoSjR
	 tHomDy2r+Xkmv1HU1X4xsbhlVYDKH8IDCdTP0QSUxBX5ayfZMD8ptUPCugsWXhxP/xbdx
	 +jEIueUnBnWUXzENnZu//g8WdihbQS2TjGlBr3N+xAks2D07zqCw/PlDar1L4v0Oeag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=riwfylkG;
	arc=none smtp.remote-ip=95.215.58.49
Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80330606A31D
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 01:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80330606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=riwfylkG
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Nv3Qapbd26NXNw9VLTz9mB5x+18ToQc1moQuFuI0cM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322430; v=1; x=1793927230;
 b=riwfylkG0qa2TTPV8SYaL0bV4lfKhREC8OHop17tOWv7qH/qeWSsRnc3RACtdIrzdKPfMR17
 l8TlOWx3RY+FQDn2FZIZVE4XNpuBa/hxdT61xApqWIudpy9yGonqa1TnxkbZobxeyz3qZtrfK6i
 euLjJ/R+iTVcjaVvdVrvVtxA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 81e6a1b5ec0f981a;
	Fri, 30 Oct 2026 01:07:09 +0000
X-Mizu-Trace-ID: 81e6a1b5ec0f981a
X-Migadu-Flow: FLOW_OUT
Message-ID: <e52cf574-7070-4a2b-93c7-64592b5f049d@linux.dev>
Date: Fri, 30 Oct 2026 09:07:04 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] docs/zh_CN: move GFS2 translations into
 filesystems/gfs2
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-8-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-8-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Move the GFS2 overview, glock, and uevent translations into the GFS2
> directory. Update the filesystem index and add the GFS2 chapter index.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   .../{gfs2-glocks.rst => gfs2/glocks.rst}      |   4 +-
>   .../filesystems/{gfs2.rst => gfs2/index.rst}  |  18 ++-
>   .../{gfs2-uevents.rst => gfs2/uevents.rst}    |   4 +-
>   .../translations/zh_CN/filesystems/index.rst  | 112 ++++++++++++++++--
>   4 files changed, 116 insertions(+), 22 deletions(-)
>   rename Documentation/translations/zh_CN/filesystems/{gfs2-glocks.rst => gfs2/glocks.rst} (99%)
>   rename Documentation/translations/zh_CN/filesystems/{gfs2.rst => gfs2/index.rst} (93%)
>   rename Documentation/translations/zh_CN/filesystems/{gfs2-uevents.rst => gfs2/uevents.rst} (97%)
>
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
> similarity index 99%
> rename from Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
> rename to Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
> index abfd2f2f94e9..a73444759a27 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. include:: ../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/filesystems/gfs2-glocks.rst
> +.. include:: ../../disclaimer-zh_CN.rst
>   
>   :翻译:
>   
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2.rst b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
> similarity index 93%
> rename from Documentation/translations/zh_CN/filesystems/gfs2.rst
> rename to Documentation/translations/zh_CN/filesystems/gfs2/index.rst
> index ffa62b12b019..af6c10af2fca 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. include:: ../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/filesystems/gfs2.rst
> +.. include:: ../../disclaimer-zh_CN.rst
>   
>   :翻译:
>   
> @@ -16,6 +14,9 @@
>   全局文件系统 2 (Global File System 2)
>   =====================================
>   
> +概述
> +====
> +
>   GFS2 是一个集群文件系统。它允许一组计算机同时使用在它们之间共享的块设备（通
>   过 FC、iSCSI、NBD 等）。GFS2 像本地文件系统一样读写块设备，但也使用一个锁
>   模块来让计算机协调它们的 I/O 操作，从而维护文件系统的一致性。GFS2 的出色特
> @@ -33,7 +34,7 @@ GFS2 使用可互换的节点间锁定机制，当前支持的机制有：
>   
>   lock_dlm 依赖于在上述 URL 中找到的用户空间集群管理系统。
>   
> -若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需：:
> +若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需::
>   
>     $ mkfs -t gfs2 -p lock_nolock -j 1 /dev/block_device
>     $ mount -t gfs2 /dev/block_device /dir
> @@ -55,3 +56,12 @@ GFS2 在磁盘格式上与早期版本的 GFS 不兼容，但它已相当接近
>     gfs2_convert		用于将 gfs 文件系统原地转换为 GFS2
>     mkfs.gfs2		用于创建文件系统
>     ============          =============================================
> +
> +实现说明
> +========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   glocks
> +   uevents
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
> similarity index 97%
> rename from Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
> rename to Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
> index 3975c4544118..a60f9fdae6bc 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. include:: ../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/filesystems/gfs2-uevents.rst
> +.. include:: ../../disclaimer-zh_CN.rst
>   
>   :翻译:
>   
> diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
> index fcc79ff9fdad..5e198707c16b 100644
> --- a/Documentation/translations/zh_CN/filesystems/index.rst
> +++ b/Documentation/translations/zh_CN/filesystems/index.rst
> @@ -2,7 +2,6 @@
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
>   :Translator: Wang Wenhu <wenhu.wang@vivo.com>
>   
>   .. _cn_filesystems_index:
> @@ -11,34 +10,123 @@
>   Linux Kernel中的文件系统
>   ========================
>   
> -这份正在开发的手册或许在未来某个辉煌的日子里以易懂的形式将Linux虚拟\
> -文件系统（VFS）层以及基于其上的各种文件系统如何工作呈现给大家。当前\
> -可以看到下面的内容。
> +这份仍在编写中的手册，希望有一天能全面介绍 Linux 虚拟文件系统（VFS）层及其下层
> +文件系统的工作方式。目前已有的内容如下。
>   
>   核心 VFS 文档
>   =============
>   
> -有关 VFS 层本身以及其算法工作方式的文档，请参阅这些手册。
> +这些手册介绍 VFS 层本身及其算法的工作方式。
>   
>   .. toctree::
> -   :maxdepth: 1
> +   :maxdepth: 2
>   
>      dnotify
>   
> +Todolist:
> +
> +* vfs
> +* path-lookup
> +* api-summary
> +* splice
> +* locking
> +* directory-locking
> +* devpts
> +* fiemap
> +* files
> +* locks
> +* mmap_prepare
> +* multigrain-ts
> +* mount_api
> +* quota
> +* seq_file
> +* sharedsubtree
> +* idmappings
> +* iomap/index
> +* automount-support
> +* caching/index
> +* porting
> +* adding-new-filesystems
> +
> +文件系统支持层
> +==============
> +
> +这些文档介绍供文件系统实现使用的文件系统层支持代码。
> +
> +Todolist:
> +
> +* buffer
> +* journalling
> +* fscrypt
> +* fsverity
> +* netfs_library
> +
>   文件系统
>   ========
>   
> -文件系统实现文档。
> +这些文档介绍各个文件系统的实现。
>   
>   .. toctree::
>      :maxdepth: 2
>   
> -   virtiofs
>      debugfs
> +   gfs2/index
> +   inotify
>      tmpfs
>      ubifs
>      ubifs-authentication
> -   gfs2
> -   gfs2-uevents
> -   gfs2-glocks
> -   inotify
> +   virtiofs
> +
> +Todolist:
> +
> +* 9p
> +* adfs
> +* affs
> +* afs
> +* autofs
> +* autofs-mount-control
> +* befs
> +* bfs
> +* btrfs
> +* ceph
> +* coda
> +* configfs
> +* cramfs
> +* dax
> +* dlmfs
> +* ecryptfs
> +* efivarfs
> +* erofs
> +* ext2
> +* ext3
> +* ext4/index
> +* f2fs
> +* failfs
> +* hfs
> +* hfsplus
> +* hpfs
> +* fuse/index
> +* isofs
> +* nilfs2
> +* nfs/index
> +* ntfs
> +* ntfs3
> +* ocfs2
> +* ocfs2-online-filecheck
> +* omfs
> +* orangefs
> +* overlayfs
> +* proc
> +* qnx6
> +* ramfs-rootfs-initramfs
> +* relay
> +* resctrl
> +* romfs
> +* smb/index
> +* spufs/index
> +* squashfs
> +* sysfs
> +* udf
> +* vfat
> +* xfs/index
> +* zonefs
