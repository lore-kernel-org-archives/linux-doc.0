Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBFA158A2C
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523976; cv=none; b=Lyyo9LrwkwsoPbFUhIi/tBMwiam8jx+vri7GaM/gDuqFULHU7yDxFVtXbviLx7TRB/SS8tLOxC6Y2sHjqvB5q/O702FN0I7zwwX7CMokeQn05KrR/MxQ/t6ICeH64vNimWRrupKY+hJDP5gABS2Fj3CjV1OSgqafi291fIBe36A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523976; c=relaxed/simple;
	bh=c6/xDqIBUH9kZJ3dSSFqPpC8zcL9m+9ITWVHyL9+N9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaKwQQrKlq8zYdhJZsEomMOBvgpsvF7L2P9FdYP7ywCAiKQ2fPmiPoexE6ybBnBHyHiDPfgD1+jOit12rf0GW2CGI8d+Hb7wFF0TCB2/3ff5PxEmd5oL46FSJ3ExaJHisI6LEFq09Sr4cXPHZQwVjKWemfIFzL6vsbhWhk7Q+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUljBhmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUljBhmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720523973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9cY1BbeC8V5UfvyXbcs6HntSp+BaCe1he0FDoMTU60=;
	b=BUljBhmwm8qa7IQuWBqfD3mvCUJL+IkfUINJ0i6bd2HLHFPhggKvtffHLys6C6yMBtxp1e
	BYvY38KIDYLySpf0GIZOhZCLo33NBbcxYJS790qc/u4CJ6jSHoxx+U+SyUTNNKvBL94SJD
	bRlx1Fijf7KHxAE92tmguU021HVNvoI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-dst0vMx7PCiGSLG9Z8YAwA-1; Tue, 09 Jul 2024 07:19:31 -0400
X-MC-Unique: dst0vMx7PCiGSLG9Z8YAwA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42674318a4eso5406205e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 04:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523971; x=1721128771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9cY1BbeC8V5UfvyXbcs6HntSp+BaCe1he0FDoMTU60=;
        b=uJDuXOifOio6ny5sPXIU6j9uz6cFFMm313MvHI4RnpCZ3ufqMk67D86TOVX+BTlvKD
         1OdrTUGC2mjhYHtC3KONsN/Zv4loWj1E/V5bQa44IhTDCjJzueVNv0ZgPP22mEZX8Fb5
         7g3oFuZAf3yDifHfrFe1008g9lJOrvFNVoX310PLNbpxBAHiZz6E+4YfANKh8Wyvwpvz
         OLVeQuZOfcvLUJAt64ofHK9G7gqvWoq4oICWDUsDnRc0Fz+kDSsEc8mzIlg2OM+wzlgd
         g3HaDtRIbLSOgHsbsxdrmr/Cj2w7AzkLNuUz3hn+ANnDnySgUBhPGgAOVgY6mbhFMZCa
         6kjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB2qzV3cBWPGzmdcnVTt+oz59Xe2cxRviqj+wRjBU99HXFMbp7LggF5vngbhrJC0/AHBvzw07iVQM7cw2xcJyxKgsPh9jCEzWp
X-Gm-Message-State: AOJu0YwdLaEhh+WKsZXTZdMep80xwr51L4Tan5/apQ81l8Ls3lX8a1EQ
	ZGqilHtkjb67lHf/DH1qJtaa4uQK+hTloqmSiJnn3Rin/vwux17q7TfErL3VeKVq8LNwL3yaKcN
	KfIvHblzf1jHfNHFMn+r5RNZtY8LXq87KLOYsqZCgUnK810YgfLgZi33N7Q==
X-Received: by 2002:a05:600c:4aa9:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-426707cea49mr20582995e9.10.1720523970699;
        Tue, 09 Jul 2024 04:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrv6eA6i9gD88/LrJNrSNZthLrsY3bNl7E4tsBwJPh0TpR+xUYGQAK1zetmlYXCP/zrmOVNQ==
X-Received: by 2002:a05:600c:4aa9:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-426707cea49mr20582835e9.10.1720523970311;
        Tue, 09 Jul 2024 04:19:30 -0700 (PDT)
Received: from localhost (p200300cfd74b1c2b6d9a10b1cecd2745.dip0.t-ipconnect.de. [2003:cf:d74b:1c2b:6d9a:10b1:cecd:2745])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab106sm2254684f8f.103.2024.07.09.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:19:27 -0700 (PDT)
From: Hanna Czenczek <hreitz@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Hanna Czenczek <hreitz@redhat.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH 1/2] virtio-fs: Add 'file' mount option
Date: Tue,  9 Jul 2024 13:19:17 +0200
Message-ID: <20240709111918.31233-2-hreitz@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240709111918.31233-1-hreitz@redhat.com>
References: <20240709111918.31233-1-hreitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new option allows mounting filesystems whose root node is a regular
file instead of a directory.

FUSE itself has the more generic 'rootmode' option, which theoretically
allows mounting filesystems with an even greater variety of root node
modes.  There are two reasons why we do not let virtio-fs provide that
same option:

First, with FUSE, this option is supposed to be set automatically by
e.g. the fusermount helper program to match the root node's mode, no
user involvement necessary.  It is easy for fusermount to stat() the
mount point (whose mode must match the filesystem's root node mode) and
fill the 'rootmode' option appropriately.  In the case of virtio-fs,
however, mounting is often done manually by the user, there is no helper
program; and I as a user find the simple '-o file' preferable over the
more cryptic '-o rootmode=0100000'.

Second, inode modes other than S_IFDIR and S_IFREG have limited use with
virtio-fs anyway:
- Device files are host-specific, so passing them via virtio-fs from
  host to guest (or between different guests) seems rarely useful,
- FIFOs and Unix domain sockets currently do not allow communication
  between guest and host (or between different guests), which is really
  the only reason why they would be used as virtio-fs filesystem root
  nodes,
- and symlinks in general do not make much sense as filesystem root
  nodes.

The more generic 'rootmode' option is therefore not very useful for
virtio-fs, while being harder to use.

Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 fs/fuse/virtio_fs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 1a52a51b6b07..ba1a6ac31000 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -107,11 +107,13 @@ static const struct constant_table dax_param_enums[] = {
 enum {
 	OPT_DAX,
 	OPT_DAX_ENUM,
+	OPT_FILE,
 };
 
 static const struct fs_parameter_spec virtio_fs_parameters[] = {
 	fsparam_flag("dax", OPT_DAX),
 	fsparam_enum("dax", OPT_DAX_ENUM, dax_param_enums),
+	fsparam_flag("file", OPT_FILE),
 	{}
 };
 
@@ -133,6 +135,10 @@ static int virtio_fs_parse_param(struct fs_context *fsc,
 	case OPT_DAX_ENUM:
 		ctx->dax_mode = result.uint_32;
 		break;
+	case OPT_FILE:
+		ctx->rootmode = S_IFREG;
+		ctx->rootmode_present = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1401,7 +1407,8 @@ static const struct fuse_iqueue_ops virtio_fs_fiq_ops = {
 
 static inline void virtio_fs_ctx_set_defaults(struct fuse_fs_context *ctx)
 {
-	ctx->rootmode = S_IFDIR;
+	if (!ctx->rootmode_present)
+		ctx->rootmode = S_IFDIR;
 	ctx->default_permissions = 1;
 	ctx->allow_other = 1;
 	ctx->max_read = UINT_MAX;
-- 
2.45.1

