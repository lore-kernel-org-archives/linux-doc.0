Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701733;
	b=qf1i+De/DBGrkJi3XdlzOv8b9G61JNb6Sl0DcMdl+af9iXNtNquQs54gsZ/xmnNi6Axx
	 jVFTR9U1F0e6kECSTxuXbmBi7YsSUObUYEbARpjrZZTaZ+WpHFvbB6848FeKLgyBqEiwU
	 u+oTSsSvQ4GentGg6pvvzVxrhihQXSAoYdPrSK8AeHyEMgIjv/ARGbnP7ZdZzTD7Kxzb7
	 DRYWxo5ifHTRN457qFsiyuuq4ItegB9CRGuyDnxO5d3pvLCKPwmBYgKiKZULsl/Y5LHkS
	 gOuyH+RfNzgNLStqLHsaul4wTzWEntUniSVE7gf7YB9A/bJvkqU6PkU5jSbS8Lh2EYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xqr6MyIodV9h4/OO0jWOPYjNv1F5SYtqgxsNyjc0I/0=;
	b=gaKiNzMsdJm5/tPOlVOlq2b2y7WxQJoidkZHj4ZSEnC2QijVijtFZcDDUBUKKuEkDAst
	 MMy9Frxn6LsLig5qlO5EC0UeCRrh/HFrp8G8OJPmOmnd9Jxt4LqVUegW/9a29gCnSGvF2
	 Apz4vWXV54td1jWNcxdEmbWOz4J0VvHVgdfqlh0ZnZVwJK8RghYbDMplmGoa0DnPzs6LM
	 CkM7hRSLiX4aI91QPuypgqioVcGIPUMlETJIJy/5ozpt1MuLHmi9j6ue9GxLid/5Pi486
	 6/d24W9Q9TiKLRPXMxc4k+DEFeVFbPnaHRmK1FE00pp8KzBweBZqLcIgkSwMCSNzT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAvdXk+N;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE2606A32C
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 00:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAvdXk+N
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11340105e9.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 16:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794701731; x=1795306531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqr6MyIodV9h4/OO0jWOPYjNv1F5SYtqgxsNyjc0I/0=;
        b=vAvdXk+Nsm2uO9FB7pApMcnR2H7ccHnIpr6ZjueivXGHNOX+I/Mb0rvAauTeSD3PuT
         /laJalAJdiJJyACEiISutFQTQmnai/UVcGTLnyvQApS8Ijrjz0xUfVdr1BxdOFNv/U6m
         gJA9Hq+Jglp/CLmlPrWjA7sF3zcngwrvGNsrH0ts1V8sTXZvKcFTVXZ59oUkH+84q1Xc
         +PRK4Ayf6zhbiCt/JfbwWhO+fQP92y1NfPMT+oBCaCwr/aCgsU2ItYBmnHXaiMGGXh9Z
         lgKBme69JS7jyNS1gnuZALUXe/mVZguGZOI87wHoymZGn1TSRDwLHKsUwiTXA5hwQ0xW
         dxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701731; x=1795306531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqr6MyIodV9h4/OO0jWOPYjNv1F5SYtqgxsNyjc0I/0=;
        b=u8MkVGM+Q0VgnX9hnvVVD9uH9716CmNfFteaiClsSv6XJleM8q7IEN5X7XdvjfFx9q
         5wc0vvY0INQsDWNsl8uOcJH/zvLn//fyvJkWPLy1WAL+VNn0LJl4wZeyDLK5NQccbzRI
         sAIIr6cgS4/FbgQXuxALt1z3MbmIhnKEL1jmxDOBrbzVG2rsL9s/fwgkWwEoRPrmIzHL
         10EpFmXVP/a0bbo7pCNG6XxknMNFnDY1LsR3jLGi1tRQBz9ncWoBZtZt/tPXQnTjrgjr
         9MXPg2x/4LlW/buAJJPwRwl4NVsmGvgZ4OAExB3AM+b6Y+e8X3Irp26Ri2fuETdksXkP
         MHWw==
X-Forwarded-Encrypted: i=1; AL+hErFJdx8tPfZD6NM9NPBMHPj5ZPW8Ha+nw4kUYLXoSxUnQwwD+VueSZ7icPfRsbCDcpvf8N01b+Ov9fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DwHNFnjrBrWSKfTSvkE++vls7Cv8B6kVI0Vuwy9FODdXHcrhI
	Y6VpJz9Qp0sx/yOlDeXqfZkH3NlJWryBsXcP3msehjUJkRgH19EV7ert
X-Gm-Gg: AYBFou3/LKpBHOxHSncEdyCgTIsbEB4iY8r0Kd17eO9eNcUGHUko3+CDUuqtPKRA/04
	00qAfKZdVnGNFb2HL21z0eeKzBqKBixC07BCRkwq3XD9016reGbD9KR6HVREmMhHZL6ZCoWq8NS
	1KIkGy5Ofx91FwspIZlQHWgX2So6PwIFws8G6lp+3D/9fpWWDBC4ugEutaACm6LEBUcSBIHG8gO
	ndy56moxNSz2uZjNGDw6PDjgnfjXnECBOeFW+Y7dZ3mFgChEQnbsw1BO39IOyai5ELJu/YOXW//
	rAC8ZaCYg1JvW7nHdK/FA1gm5txm0w+FtpkWurIDKy6NzpSIzXqdkRsVPpgibPx4LtNn2vB8Lcg
	4ldTEfaYqjOy0/h0InEzLZEXiid7O94JMD4C1UG8SCZyZ8CUG1plGy/MHD/O5Pok0l5YT64hymJ
	ZIg1mNyaQ917NwD5UR1abBzXk56FkFnidJV2rox52Lg98MAVyq6NP2tRIYuqXURHBSePbWI+1qA
	WI9uqucB1QNV2p5zBnrj1cjv2VXytdA3xG8ezpMksAk6Oh0qUgRE/oYYMPTmEh+YrUa7aOsnYDS
	J8dsYMZqLIAoRh/IwbuA4wdLaYEJEP3y+2ZTQQGadvrSzh3AgM65z0mjhmdtGNM9uZhHTl4p0fL
	rYrj9T1vnwPM=
X-Received: by 2002:a05:600c:c16d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb55a3e3f0mr132213105e9.9.1794701730929;
        Sat, 14 Nov 2026 16:15:30 -0800 (PST)
Received: from mohamedali-HP-EliteBook-840-G8-Notebook-PC.. ([197.18.115.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm177925125e9.9.2026.11.14.16.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:15:29 -0800 (PST)
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
Subject: [PATCH v3 1/1] docs: filesystems: update VFS locking documentation
Date: Sun, 15 Nov 2026 01:13:34 +0100
Message-ID: <20261115001334.23026-2-mohamedalibouhaouala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115001334.23026-1-mohamedalibouhaouala@gmail.com>
References: <20261114235426.20408-1-mohamedalibouhaouala@gmail.com>
 <20261115001334.23026-1-mohamedalibouhaouala@gmail.com>
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

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>
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

