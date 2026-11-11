Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413136;
	b=L2CgXP4OQIITDZvsgAEWkVqsprhlwvMi9tr+wJge3YRD96IjnLQjR6gBcMtuUh45gMdW
	 wnQwuGCchafRveRi8i0oWUS81uLow6dGnI8ohlI2DltxnhU/CyFdJaPnx79Gni35RV+Vw
	 PGaKswRKm6l3HoANZq6ybl4zAX77XZ3FoQ7n4g9y8uj2UKiPw/UIWfSLdvSq8U38dK0F2
	 zzcIstX5oBw6XNNb4+UbzqU+Wxm1vzHfsnJA1sYXwcU38isqh5uj1B2fzjM2qWvOrpIar
	 lRYXeHc65ZKlQvDsCXW6YpUqtOgEqoBqb/3SL9QJMJvKHrb+jM7NtWoTxtHWO7AbZCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lRiUlywrwld98ENTQ9ryYYw6DTlHnImGRe3UChrbN5g=;
	b=KwU0gpjpYHrRfsq7sTPWprysuJqkP21pVF6v31MeWxME1KFwaj9hY9ZVOZy21nvLsUXD
	 lUkD46LHXY8YCMDvM4WhYIbsXMeS9+GzWOS7D6XPKB01MPmGug6datQlTwIgXiT1zPNoK
	 Pm8vQddDLq+PaqgW7rgZsJvrA08GAlWtHofR4MI+EFJziq2Wn1iFuHIkh1yOeRusH5Ipe
	 5fq6wDy5C1rAW15BHqjcyjDhQ//hLYQoYz9gw5PmgmIrKB4eaFY3hn7U3X+12VmZprfpm
	 f4eUnr6CZuOeBTIhjBNEMgUKxxpgeNAgeCwJWqjEKCyVcTXPGms65F78ceZeWxxbUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZpfwrxf;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89964606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89964606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZpfwrxf
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a77811be24so11278395e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794413134; x=1795017934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRiUlywrwld98ENTQ9ryYYw6DTlHnImGRe3UChrbN5g=;
        b=DZpfwrxfItonON6JeJwmvGe3xqgK+5wH3SOsWdhxB6VeeKmW6YgyZB1I5OPIOtvHHd
         hrAeW0o5peoZdhN27BKml8BnfL6EFGLmg/cr5EC4VsyL0lOmZvH8k/+bC5SvPDSkIPpa
         MhFMgdCSmygmGPYvIxxdAxjJOmOrvH3V7rti9fZ99yEj8Qmf9y6KK2QxH14DTGNqI/ob
         WbiGOL/UxU28ZwooAG6QBDGhdKygG4us8wzXmwGVemFBPYS5SKypmXvDjBcfC/elB8Ps
         JuGLUaDwMnlp6uzRADhD81Xy+DEGK86UsVQws5YoqXdKxLBjkOz6slzbGaGwkV4HDwQC
         NzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413134; x=1795017934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRiUlywrwld98ENTQ9ryYYw6DTlHnImGRe3UChrbN5g=;
        b=B8TPLEhaCAiVkd8g+W/H8ATDWoRd/rDoGhPYJtb11PwmYvuH4CippxQxJUa2kmxTQK
         ogY1kNLl8e73OHLnW/9jh5nuaQ4lM4AV+arqZU94/DqV7f8tYPBbCQ9FANW/sfL0L3ru
         VZ1+eFVLClKK3lPLm+AclDOpYZJhdoYZitGWuZ9j/Mno+F2preVu9Y444FOD4RC6c850
         jomzZtPWCVFoB5zJVg/1+BtgkMh4azKFFRgYLSR7+tqi5p/97TQx4T6bMDhs6/RSTxJK
         aWBm4qZ/u1e/g41/FlMtQ04NHzbSf4xRYK7KKRN3lyPdgCyXP3ip+/4ryUgreIJWEF3a
         LraA==
X-Forwarded-Encrypted: i=1; AL+hErGYKfZ/bDS0el6VPjIWc3LVRjrOLGzZSi8ilnjOg5g6bpYlWzJWRQcxtvJc1HBwi0S6YLHm8TexYss=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H3uM51jO0EpIcVN/s9Ut3Wgtz7s5m0HBASJ3UKKuAlOJylxVc
	Y890qAtJAX7aKN8p14fWzsR7jFQocqgrMOsWlb0b2l7Q1KrIIBPLHBg4
X-Gm-Gg: AYBFou2Ls6YkymkeT1YMx0iQhTgwhozi+QwLxNJ8ndUVjSc1TU5HvTNd26cSuGdetD6
	xse2B/DtmKLZ6sAnc1Z4r2YYDw2wsze+NkGC605uNt8++PU+gbkK08IjaXdpulUoMMpjXyrjGka
	ww7f24Yn/YLWD/HjRVMrE1qhSp1gsa7JSQF6ligfA/Io5Yqm7zVDr+qVRgIvNKaIwzLMOupAFws
	Ig7YLEzeDh/qm4XV3JcqhHaZASf+zIcudNYpAtvfrm8yAP5T5s1BECcl7epFwXAbUTWFsKZnusQ
	M2wk4pGrHR8p1VX/s9X+YzPgUObzXk2b/9EJBm/xeVKiYmGkwjDhKsXfhJm7oTISVL+HM3NdQtX
	89UPVO4BdqgExVN7HlAxaZ0L3Hd4MgGP/5PS65chRr+VxfTeI1QzrUC3kqAuwZbjOlpI0f+kVeu
	Ex1KHPdXEIF1qKnkBdP/qDhlSzImVpu4ZiBRbFwp6yK6SLrWo9e0/u/7cSKoEi+pxK0+3Fm2X9C
	rNNnfHLlX+QvFdDjxHouDz40EVP048cDC1ojLAUGSmBlUenvQhQOVNJRgCabZ9U24j2NNn5TW17
	uFvtbcwQw15TL6xh7o8VXwKWz4MHGby5gSOSdvCiN/um70OQRqSVKvlcO/iCbAJ0pYUMTwNVC8v
	dg25hjzYpQY5BRFppiC26jTi5Yg==
X-Received: by 2002:a05:600c:46d2:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4ba093b1bcfmr49437235e9.34.1794413133588;
        Wed, 11 Nov 2026 08:05:33 -0800 (PST)
Received: from mohamedali-HP-EliteBook-840-G8-Notebook-PC.mshome.net ([196.203.210.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c55f667sm4955755e9.15.2026.11.11.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:05:32 -0800 (PST)
From: mohamedalibouhaouala@gmail.com
To: willy@infradead.org,
	jack@suse.cz,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	MohamedAliBouhaouala <mohamedalibouhaouala@gmail.com>
Subject: [PATCH] docs: filesystems: update VFS locking documentation
Date: Wed, 11 Nov 2026 17:05:15 +0100
Message-ID: <20261111160516.30458-1-mohamedalibouhaouala@gmail.com>
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

From: MohamedAliBouhaouala <mohamedalibouhaouala@gmail.com>

Update outdated VFS operation prototypes in locking.rst to
match their current definitions.

Add the missing d_prune and sync_inode_metadata callbacks,
and correct the signatures of existing operations.

Update the locking table to include sync_inode_metadata.

Signed-off-by: MohamedAliBouhaouala <mohamedalibouhaouala@gmail.com>
---
 Documentation/filesystems/locking.rst | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index f7363ad770c7..a6a011858ada 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -26,6 +26,7 @@ prototypes::
 	int (*d_delete)(struct dentry *);
 	int (*d_init)(struct dentry *);
 	void (*d_release)(struct dentry *);
+	void (*d_prune)(struct dentry *);
 	void (*d_iput)(struct dentry *, struct inode *);
 	char *(*d_dname)(struct dentry *dentry, char *buffer, int buflen);
 	struct vfsmount *(*d_automount)(struct path *path);
@@ -80,8 +81,8 @@ prototypes::
 	int (*getattr) (const struct mnt_idmap *, const struct path *, struct kstat *, u32, unsigned int);
 	ssize_t (*listxattr) (struct dentry *, char *, size_t);
 	int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start, u64 len);
-	void (*update_time)(struct inode *inode, enum fs_update_time type,
-			    int flags);
+	int (*update_time)(struct inode *inode, enum fs_update_time type,
+			    unsigned int flags);
 	void (*sync_lazytime)(struct inode *inode);
 	int (*atomic_open)(struct inode *, struct dentry *,
 				struct file *, unsigned open_flag,
@@ -173,6 +174,7 @@ prototypes::
 	void (*destroy_inode)(struct inode *);
 	void (*dirty_inode) (struct inode *, int flags);
 	int (*write_inode) (struct inode *, struct writeback_control *wbc);
+	int (*sync_inode_metadata)(struct inode *inode, struct writeback_control *wbc);
 	int (*drop_inode) (struct inode *);
 	void (*evict_inode) (struct inode *);
 	void (*put_super) (struct super_block *);
@@ -196,6 +198,7 @@ free_inode:				called from RCU callback
 destroy_inode:
 dirty_inode:
 write_inode:
+sync_inode_metadata:
 drop_inode:				!!!inode->i_lock!!!
 evict_inode:
 put_super:		write
@@ -255,7 +258,7 @@ prototypes::
 				loff_t pos, unsigned len, unsigned copied,
 				struct folio *folio, void *fsdata);
 	sector_t (*bmap)(struct address_space *, sector_t);
-	void (*invalidate_folio) (struct folio *, size_t start, size_t len);
+	void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
 	bool (*release_folio)(struct folio *, gfp_t);
 	void (*free_folio)(struct folio *);
 	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
@@ -265,7 +268,7 @@ prototypes::
 	bool (*is_partially_uptodate)(struct folio *, size_t from, size_t count);
 	int (*error_remove_folio)(struct address_space *, struct folio *);
 	int (*swap_activate)(struct swap_info_struct *sis, struct file *f, sector_t *span)
-	int (*swap_deactivate)(struct file *);
+	void (*swap_deactivate)(struct file *);
 
 locking rules:
 	All except dirty_folio and free_folio may block
@@ -455,14 +458,15 @@ prototypes::
 	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
 	ssize_t (*read_iter) (struct kiocb *, struct iov_iter *);
 	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
-	int (*iopoll) (struct kiocb *kiocb, bool spin);
+	int (*iopoll)(struct kiocb *kiocb, struct io_comp_batch *,
+			unsigned int flags);
 	int (*iterate_shared) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
 	int (*mmap) (struct file *, struct vm_area_struct *);
 	int (*open) (struct inode *, struct file *);
-	int (*flush) (struct file *);
+	int (*flush) (struct file *, fl_owner_t id);
 	int (*release) (struct inode *, struct file *);
 	int (*fsync) (struct file *, loff_t start, loff_t end, int datasync);
 	int (*fasync) (int, struct file *, int);
@@ -475,7 +479,7 @@ prototypes::
 			size_t, unsigned int);
 	ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *,
 			size_t, unsigned int);
-	int (*setlease)(struct file *, long, struct file_lock **, void **);
+	int (*setlease)(struct file *, int, struct file_lease **, void **);
 	long (*fallocate)(struct file *, int, loff_t, loff_t);
 	void (*show_fdinfo)(struct seq_file *m, struct file *f);
 	unsigned (*mmap_capabilities)(struct file *);
-- 
2.43.0

