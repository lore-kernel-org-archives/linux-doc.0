Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500512;
	b=l3ZoXACQ9j09vJbsKGkCIpztYYGlVPsAs18Nh0cCqBMRaMviU7yAkDzj+walb470PU1g
	 Yy0IsUQJFSKrI0oFHswTPUrlxs6XpLk5bBX0xi8qpyWdpP5NEGRo328BaH5gI/rEK4Rf/
	 94hgXUkIeVqKN61TE2UNj38amtgIEvLy/e5QAJpYs93xQu4H+9T4swSK9Ov75l3ALNXTc
	 AXpDQ1aoOxDnRd3Qk1vrgYa7lPH4/43Ab107A58p4qHGuVdnTw1+KtMnEgakK3AAebFU1
	 WPwEGC2Bd1eSbxTWA43Q61Mh6i8W4qe56JbU1MWpZKbMwOtnEjfGF9g4b+eJs7PIGjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jvGNkEQXxpCGRnxugPg2OroUq4ixAzACPllCORFjj2w=;
	b=F0+7LE8cMq1X6OAETc1PL6d1I5kfnTKPKLe4lCVIi0EGPH7w+FWUuwq7Q0rKTa2HBD8h
	 VxB4Lyrz2iSQ3U/XPOI5A1IXJvyjQ8T8vw8YJngA67JkW40emq6RF1fLgQNllirmQ8B36
	 LJNW19E9EZb1u28FUjFHqf4dsggozYUVGS276jUWFLI4WLvOHFgCMqtxQ748dq0MiRe4B
	 bwUHSHaLBUNo855XD+YJ0B0Xq4fpSYhjp0JHLm/R4+tKsqrXvIeMfRNRvSlxWpyAGPV6A
	 jKRcIov072wdG0tIEdHrinb4h8AjId7PuUxe/puVbYyu/YJ8SqJswy8YJa5tLZudtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXwROFE+;
	arc=none smtp.remote-ip=74.125.225.132
Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955EF606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXwROFE+
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-4a20fcb3e9aso4112915e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500510; x=1795105310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvGNkEQXxpCGRnxugPg2OroUq4ixAzACPllCORFjj2w=;
        b=eXwROFE+hg2htu4HuRIHEzizvRbOQ6hiaEWuBxRWFWrxLT65V2weXKbRZuAEie+pUQ
         Os+sFbGNkpcgd/vblW/O0GCJldJFliHi3CSGtCfTHsMZcGhhVHVZD/aexg0++FzU2KHW
         oTmCn+6c2AhTFXX3GmeSuKM44yttafHv0zZIoLw+suMhx6wtjrce+qE3BLyTH2XY4dvM
         T3Z+u1vhBkTquvStFlarKzSMupg0x/bCnPAGk0DnPKHbEJ/LlN7T4c/Jh4FHJuNGKUuA
         nhTwz9SnPT/bG5ub5K4jCGqMbDIzsNa+0/8YkPcA8sc7/hoNrq8QqcfUhvWApV3uSiaM
         uQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500510; x=1795105310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvGNkEQXxpCGRnxugPg2OroUq4ixAzACPllCORFjj2w=;
        b=cYNUFzHJZYbBGhmZ4y67JNr/pB5QtdDIIhX1Npxa0BTKhj5UMwAJQHs8umbc8GjZY+
         ly1yvJuEVCKXpVBLxSGC+ZSLIj/cwwh24aYPOb0ETxiLAf+k2Aioj6EawejhUo8YtR7n
         uaziWwCQvuVNNZDJKcRPMy1T0RWuTiPkFrWXUxKbzrNP3O6W3fwPmP4vP/if9qtebhpP
         AhJnRiAbtrxdTpDBPS84+1KFXm09zLqicXOD5J1WqEkPDHbWEQM6+/ZD8jsY4YE14uFZ
         4VhSjqREKKRXM5vwmuzMOp79VoRJlD4XXrdMjIYYA3xAXHST5tNpRywFlh4kS/XOrTtB
         EERw==
X-Forwarded-Encrypted: i=1; AL+hErEJ8AFoaJGQ+hc+Vkd8pe6DuFg9TZamGRqUjJg1cx1t3SAaNd1r7wHxHJN26872eu+pqNZlQBSAQCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z98O57zN8Jr87jRrIt6o0pPybkryCc/4pL6QZy22ZI+RubGlhvQ
	xDKaxKiYZJDoLmzcPMAuTF+ZaQWozicNM24Wx7VSasp+4/5X47H69mhJ
X-Gm-Gg: AYBFou0iSQ4tpG46h+/QyEBVCUpkoPXlyA1ta69WuAqDdSwDkgdS1Pjnk59LsQB8STJ
	nAwR6cn8eTGPncjP5t0eeTEDh4/2MnR9hsZQ/56lTJV3605hK8C+fkGI+rbJULJHcekSqs4f2CR
	6vzvSDNDVBaqCyVs8/h6WqxdG4+IURmDEz2Rg+uJdwuxgyVnxqKkhS+Ssvphasc5wPB8CCzR01a
	rjFy8qGKgesHFStjtLmTJN11LEqstl2ihqwSFtUoa97FQhD9BRDlPpvRo5zyIg9iWvWGwqbi4Mu
	CvjloaXAeXnuA4aG4MRJz3v+AvXJsk5uizxGuc3dAmQfQpVcfJnwpsg2avcx+zubqwK9ojnu6UP
	Kpe/6jxNCKjqm9/LsxAc2ZVSNiPMMAuqGVZ2PNStYyCM9Oq8fRF6fNrRD2+pgnUSwBFWamWMULL
	i44qe7853G2v7lWKZeXZ79lPZh3FHGEBWUWsBZJmsKDE8vB+IHPPNBo3zf3z+jX/jmkzlAUvQBD
	GsF1wuzw6oIaYdDrdAsTtO5XX9HNudMb7p5U24NU6np0WvAJ68iEJxCwM402akz8KQlz3iKKB8u
	Lxpc/H3HJbG+RQcnTneVHENQ0b/2LCa+uQiD96EE/hAGslm/eMdIl3ZJp1hDce4MQN0cGMrYZA9
	OAg==
X-Received: by 2002:a05:600c:37c8:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb4e28d48emr67944075e9.13.1794500509593;
        Thu, 12 Nov 2026 08:21:49 -0800 (PST)
Received: from localhost.localdomain ([196.178.27.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm83116425e9.6.2026.11.12.08.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:21:49 -0800 (PST)
From: mohamedalibouhaouala@gmail.com
To: willy@infradead.org,
	jack@suse.cz,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>
Subject: [PATCH v2] docs: filesystems: update VFS locking documentation
Date: Thu, 12 Nov 2026 17:21:29 +0100
Message-ID: <20261112162129.77610-1-mohamedalibouhaouala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111160516.30458-1-mohamedalibouhaouala@gmail.com>
References: <20261111160516.30458-1-mohamedalibouhaouala@gmail.com>
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

From: Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>

Update outdated VFS operation prototypes in locking.rst to
match their current definitions.

Add the missing d_prune and sync_inode_metadata callbacks,
and correct the signatures of existing operations.

Update the locking table to include sync_inode_metadata.

Signed-off-by: Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>
---
v2:
- Use the contributor's full name in the author and sign-off fields.
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

