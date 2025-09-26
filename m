Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B671DC985
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846589; cv=none; b=Pr+crFtqndHE3h41vpMYU5/dne92+idCQH42BbJnOgXjVd37ouc6R6epx0A6EokSVcNAGcGij6QU9Fybbc6v2sUcR4k2OF8jdPxdbaqS6OV+XQZrQ5df42uBFFLO98WnePXU5p1TMrJHgVbjy1cg7E90ecfgfZTh0EWgJfmADyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846589; c=relaxed/simple;
	bh=douu/OH3JOBJbcNCPjglBlefsScRwWQQRJejY8Y8034=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svIe8T7in1sjWd9DFOYBICKKTR1Wq8DyyD1WsD8PFG7piZ4VNrxy7711PPqyBnFg/V4SB5MiuFC++NlghsIHKViLJqVwAbZIjZqe/81/FuckSR2baufxHxKXlgs2bUxeqE/W3uPzugefDczhZBFBYHbY0as35s89+K3C9jqjfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGx+iQR+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGx+iQR+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eec33b737so5227945ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846587; x=1759451387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mZBfvjKH+a+qnWQMQA8rEgrcPJHuMhz3ff1QpWHtCw=;
        b=nGx+iQR+qyqgjlVxNjOWNBRQBARpkHQDu8nvzKY8sI4/iGRIysq+WxDBaiUtcCRVZQ
         sn/jmfQK3uI3YTQNhlEi1C6qxr6rIeQBi6HZcldgaGdDp95lKGda90OXEUEtKsy9u9sw
         jg2FoVq4NIM4qt4JsV7zE7hdEC59+KQWnoZdKunCOHLnwaeDB1xzVAuFjVeNruq/3Woc
         zBzEtY50E5UCd3GgxxOnlyhduMwhrZJI5Bx9HrhWkz/sLecZg0hGQ9dGryc8w32QRLqo
         e4dpF89L6vwq3Qdafy1FyNFRCIC5QtK/EuGNkYeSs3A5YhEJFefmSwE1wJlGS5/iBvLY
         MivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846587; x=1759451387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mZBfvjKH+a+qnWQMQA8rEgrcPJHuMhz3ff1QpWHtCw=;
        b=vTiL5KnoyTA/OoCpN8DwFihGq8jo93SIamE4/C8HKz6FMeJot4L0tN02PQ5KZYV1BD
         2CHTe2GEzD44eTI0GJoOToDGwsG4j/edZqN5Bo2xeejGPTYLI9hj0vojaMtwV3s48o4e
         4tVK2TBlzqMfObq/h8V7XNcpphk7ju/0inZEBMIdYXxsuEOyAo+lDDOgmHNLs+26FgPW
         Do9u0oGjVrABJHBR8pirrktWOKFuTkqbxgEFzWkKV0aaAxa5tce/JUBuNWkmJDCHZ4Wi
         kEx7P4C+AwePAsxKcuKylsxcOcTVI+RnWnAAU/l/AcDRezK9CcJy8in2J21cz+MKs9Mf
         eL7w==
X-Forwarded-Encrypted: i=1; AJvYcCVTR2UC0zvR0PItZSMWEjQ9BdAwpXej9r86SeWLzM5JJRH+XsxZIocbZ27ly83jVd7Q4Vs3KQJACdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyILgp/GYZJiookzGUeo6BHVER/YWOmhsRg8VCvH2+dcHkh5JyZ
	pDbaTdh3Za3CYG/76r+3azPBkE7j9kr5k+Ry1Fh3mlYVh2nfdK092unr
X-Gm-Gg: ASbGncvJO1p5gXkI3PUAuy9Bi9LIcACezT9BMcgIgHZcoAoTfRL7s7QaHlDqH/P0fvd
	ewufwuAHJ9CViL7mHZ36RQfthvUAexBCHcPloiMAdUoD61pxLjrRvXnjmT+G8wPPj+Z967EG9pk
	0E0AEXPr3UEFn5GRFirJ5EGtdS+io1XmJYbenGGjY6AOjx7oyJGtrGfEps++gZX+FFV1hWRCf/B
	0SeBaMGIgL9Wst4Fng78oHptSUdtyW/70fxgrqBLgSPHUnXI6SjFcWrKPAKFRkb2W0QyAlExQK/
	ZJ+TJOss6KGLno7aKFDtmNYIynR/THzLGe4Bv7Xse/xq17DxH9Ld8xmsfRU6nKi7H5eb9PO4qIj
	F6H6hSEYDmsav+965r2bt1YgsTsVGhMHSH8F8D82FX0bRhl8P3m6rg3REdoM=
X-Google-Smtp-Source: AGHT+IEMH5lJf7DHsnuKCyqZaYo7vRM2tcWdcLIid+23yMPPfujKM5L9NhzST+ddt/eFTEXbRRQDiA==
X-Received: by 2002:a17:903:32c2:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-27ed49dd7d2mr60037595ad.16.1758846586702;
        Thu, 25 Sep 2025 17:29:46 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:3::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6716081sm36552055ad.53.2025.09.25.17.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:46 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	hsiangkao@linux.alibaba.com,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 14/14] fuse: remove fc->blkbits workaround for partial writes
Date: Thu, 25 Sep 2025 17:26:09 -0700
Message-ID: <20250926002609.1302233-15-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926002609.1302233-1-joannelkoong@gmail.com>
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that fuse is integrated with iomap for read/readahead, we can remove
the workaround that was added in commit bd24d2108e9c ("fuse: fix fuseblk
i_blkbits for iomap partial writes"), which was previously needed to
avoid a race condition where an iomap partial write may be overwritten
by a read if blocksize < PAGE_SIZE. Now that fuse does iomap
read/readahead, this is protected against since there is granular
uptodate tracking of blocks, which means this workaround can be removed.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/fuse/dir.c    |  2 +-
 fs/fuse/fuse_i.h |  8 --------
 fs/fuse/inode.c  | 13 +------------
 3 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 5c569c3cb53f..ebee7e0b1cd3 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1199,7 +1199,7 @@ static void fuse_fillattr(struct mnt_idmap *idmap, struct inode *inode,
 	if (attr->blksize != 0)
 		blkbits = ilog2(attr->blksize);
 	else
-		blkbits = fc->blkbits;
+		blkbits = inode->i_sb->s_blocksize_bits;
 
 	stat->blksize = 1 << blkbits;
 }
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index cc428d04be3e..1647eb7ca6fa 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -975,14 +975,6 @@ struct fuse_conn {
 		/* Request timeout (in jiffies). 0 = no timeout */
 		unsigned int req_timeout;
 	} timeout;
-
-	/*
-	 * This is a workaround until fuse uses iomap for reads.
-	 * For fuseblk servers, this represents the blocksize passed in at
-	 * mount time and for regular fuse servers, this is equivalent to
-	 * inode->i_blkbits.
-	 */
-	u8 blkbits;
 };
 
 /*
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 7485a41af892..a1b9e8587155 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -292,7 +292,7 @@ void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 	if (attr->blksize)
 		fi->cached_i_blkbits = ilog2(attr->blksize);
 	else
-		fi->cached_i_blkbits = fc->blkbits;
+		fi->cached_i_blkbits = inode->i_sb->s_blocksize_bits;
 
 	/*
 	 * Don't set the sticky bit in i_mode, unless we want the VFS
@@ -1810,21 +1810,10 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 		err = -EINVAL;
 		if (!sb_set_blocksize(sb, ctx->blksize))
 			goto err;
-		/*
-		 * This is a workaround until fuse hooks into iomap for reads.
-		 * Use PAGE_SIZE for the blocksize else if the writeback cache
-		 * is enabled, buffered writes go through iomap and a read may
-		 * overwrite partially written data if blocksize < PAGE_SIZE
-		 */
-		fc->blkbits = sb->s_blocksize_bits;
-		if (ctx->blksize != PAGE_SIZE &&
-		    !sb_set_blocksize(sb, PAGE_SIZE))
-			goto err;
 #endif
 	} else {
 		sb->s_blocksize = PAGE_SIZE;
 		sb->s_blocksize_bits = PAGE_SHIFT;
-		fc->blkbits = sb->s_blocksize_bits;
 	}
 
 	sb->s_subtype = ctx->subtype;
-- 
2.47.3

