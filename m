Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB12DC773;
	Sat,  6 Dec 2025 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062246; cv=none; b=JnJjGWAaoHC713ChLKubAD8ayps+L29tBN0UkDYkzTNUkIHvOkCXk2KNnvq2/uq4XtOJG+Zl+WPlbqP59W23yVZ1lLsUwpbVOJQdzx6KAlznNfxAPasKVUayjII2jTLiqZZd+Ej7sHi5q0OnaG+wFF2LtXrvqdFHP+QAHH1vd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062246; c=relaxed/simple;
	bh=gXncaBYBOs5IUsTyWV7q0US4snXFBOIObGWREdQ9Sns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8Df4AutUt1n/xGNUWxmLNfP02k3gwIh9TsmpU0ZCzHb+gBnaMB1IT5EzFBOYMsvz95+SvdXE8nihcU4zrf9LetNPsdz+gDqUnz2PcBkGBdMeBM7s5E9Fu995Q3dlvVlOiwT023VI3SCgRlumcWiftVbD7CaJSHq8Ye0I7NWwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP/6uH1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP/6uH1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85669C113D0;
	Sat,  6 Dec 2025 23:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062245;
	bh=gXncaBYBOs5IUsTyWV7q0US4snXFBOIObGWREdQ9Sns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PP/6uH1lLGKx06Es/lMFIkxEUOdrjqMxQZboNQnpa8XyO/ODoN3HjDooRNgm86nTt
	 S86qplm9dvPcMC+CNcYHMszhOH8tHaNYzLhZi+vaCP58EJwfMCdX9ATQeohFf1BCva
	 oA74WnIF8xgRxjm0Rrop9ODQK0j50sSH/cJeOPb/jWI9GBMwhbc+3V5TyBWoU4Mjj5
	 WxIw3HAmoq1udOQhiDake+op+JCEroNQh2FKK6GPrB6DyGxAkFJUMLi5eBOUZFvFJD
	 n2LaVBSZ4L2nxbcD1wzso1+kTX7ohRFUbtN6dtPzjHubChlbaptgloKgC27OEmAOds
	 Acg2cBDX7hLLg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 09/10] mm: hugetlb: allow freezing the inode
Date: Sun,  7 Dec 2025 00:02:19 +0100
Message-ID: <20251206230222.853493-10-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To prepare a hugetlb inode for live update, its index -> folio mappings
must be serialized. Once the mappings are serialized, they cannot change
since it would cause the serialized data to become inconsistent. This
can be done by pinning the folios to avoid migration, and by making sure
no folios can be added to or removed from the inode.

While mechanisms to pin folios already exist, the only way to stop folios
being added or removed are the grow and shrink file seals.  But file seals
come with their own semantics, one of which is that they can't be removed.
This doesn't work with liveupdate since it can be cancelled or error out,
which would need the seals to be removed and the file's normal
functionality to be restored.

Introduce a frozen flag that indicates this status. It is internal to
hugetlbfs and is not directly exposed to userspace. It functions similar
to F_SEAL_GROW | F_SEAL_SHRINK, but additionally disallows hole
punching, and can be removed.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---
 fs/hugetlbfs/inode.c    | 14 +++++++++++++-
 include/linux/hugetlb.h |  8 ++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index f42548ee9083..9af0372c7aea 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -673,6 +673,11 @@ static long hugetlbfs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 
 	inode_lock(inode);
 
+	if (info->frozen) {
+		inode_unlock(inode);
+		return -EPERM;
+	}
+
 	/* protected by i_rwsem */
 	if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE)) {
 		inode_unlock(inode);
@@ -743,6 +748,11 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 
 	inode_lock(inode);
 
+	if (info->frozen) {
+		error = -EPERM;
+		goto out;
+	}
+
 	/* We need to check rlimit even when FALLOC_FL_KEEP_SIZE */
 	error = inode_newsize_ok(inode, offset + len);
 	if (error)
@@ -864,7 +874,8 @@ static int hugetlbfs_setattr(struct mnt_idmap *idmap,
 			return -EINVAL;
 		/* protected by i_rwsem */
 		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
-		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
+		    (newsize > oldsize && (info->seals & F_SEAL_GROW)) ||
+		    ((newsize != oldsize) && info->frozen))
 			return -EPERM;
 		hugetlb_vmtruncate(inode, newsize);
 	}
@@ -933,6 +944,7 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb,
 		simple_inode_init_ts(inode);
 		inode->i_mapping->i_private_data = resv_map;
 		info->seals = F_SEAL_SEAL;
+		info->frozen = false;
 		switch (mode & S_IFMT) {
 		default:
 			init_special_inode(inode, mode, dev);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 8e63e46b8e1f..d70a3015c759 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -511,6 +511,7 @@ static inline struct hugetlbfs_sb_info *HUGETLBFS_SB(struct super_block *sb)
 struct hugetlbfs_inode_info {
 	struct inode vfs_inode;
 	unsigned int seals;
+	bool frozen;
 };
 
 static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
@@ -531,6 +532,13 @@ static inline struct hstate *hstate_inode(struct inode *i)
 {
 	return HUGETLBFS_SB(i->i_sb)->hstate;
 }
+
+/* Must be called with inode lock taken exclusive. */
+static inline void hugetlb_i_freeze(struct inode *inode, bool freeze)
+{
+	HUGETLBFS_I(inode)->frozen = freeze;
+}
+
 #else /* !CONFIG_HUGETLBFS */
 
 #define is_file_hugepages(file)			false
-- 
2.43.0

