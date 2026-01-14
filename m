Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB03793D2
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426743; cv=none; b=Ywru89jhVl30tmvb++ai2fb13dzfgYQglFW1I0SNS8RlPw1O2K92OtT55zr2nVr35GFFJrjB8CdAcyWAZ7MhyZAk7/JEWvXhp38EhgBUXLzjD848KjPkE5FGp80wVSDtwLlwy2sOWCZRhgxeKsG9NKamq3eELqqn55tksgalA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426743; c=relaxed/simple;
	bh=Myxyb2rDcBHr+xqknzGDwrg3ZSxy55A1mHw+gpZxb+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVRapCnV/CD1yDYELUAotXzUVQ5nK/YwKXTPcZyCrhrkJGrP5LlNDW1hoq8gBTaI3doH9eCUUSjFl0jnnwpen33dev/MUJOEGV7f0SBxQ2IGXZvGYBZnC2L1Mmdfv/dPtme/Nkdn7fqzuuaXqaNKxAw4rqxZnOeLyNLiZ3k30uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXgcD/fi; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXgcD/fi"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40429b1d8baso100548fac.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426694; x=1769031494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtiQrLd8slGpp7/JWfnN4t75EcUXAx+gZvq0QNgV39M=;
        b=NXgcD/fi2em+OwuRcVGe0ltnj15i6JiXi4otxYXoLz3yEzAm7V1KCaSZQdbvJINsak
         Dn161oPSAFWJp6upDOmDPXmR8PMF8aIb2C3oa/i/SklURs7K67XBDsWn48aINPH3SoiO
         uSq+MEBAms+92BzmHaNZbGQDbepcq5sM5nna/LMYw7BOKdRuX8txgQ6Wr5PBaWxjkztD
         y+UwI4B62pu3YHhUQDdTT+pBiV3djnpBa3/KfsPNbbta1+H01SoVXDoLZH8ONaaaqi9X
         SHraDNOqsv8P7XIwy/DfCbHjsgiMYoL/2C+jfb7LTkKPCqe4gMK2xFj+At58VED2aFZ+
         DzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426694; x=1769031494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtiQrLd8slGpp7/JWfnN4t75EcUXAx+gZvq0QNgV39M=;
        b=TfNj+eUuqIPndb/TEv7ibRY7R2ymcfiJR8iQXg35sJ5bHq2JsiYrPWIddbfyZPY7kO
         OYhcZTE3kGK+8xVFE+6l9QMWkjhWH8myzgab9etTR4a2t9nIdpIcSiXE/w3k2vClGV0F
         U5mLpiV/edsnmUhlJDFS03IVBYHDvDzsMJTn2/FC5e8nG8Y1ze/QDMdZdx3WkZr0Xfxg
         X/ahGEodfrgM2ZJWIp+aUA8A0FSYo/iGEgkg/rkTvsJF2APEmBePJ8I8PboGJ7vN06Ew
         NBQ0dCU6529BUVgMDow3MULvacLm2rQ5dxt8suqcH4dpK3BXjhniKqFh9x+bhywkXOIz
         X4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8lOPMkB+mlXlYLv5tRjoTCzjNeVX2Oug90b6OruPEPqPoF0Wa/j/jPIvEtJ/T/7cSGFA7bZTOjz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjGMjxiBPv3fWT5J9LCtBRXr6r9c2CTzsFcbHKa9yZaFU6qwQ
	pOrRHzaAeCIMRjJH4GnNSiPfKsDpW/hoRTBkPs7CXBKd3wHNIcPcQ+13
X-Gm-Gg: AY/fxX5LNnPEMxw8ejOSU+bUd0VZBU6FZlngYTNGOm1l9TRq+qonjgIsP2lM0siisK5
	BAwSEr12lFZPTSY7oDCbwhEtsCjf89Ke5SjEbradXE6gXWCAD3fbXJuLj2SIiZYbHDqDVSQTR4u
	EFhqwH/XC8n1lREXP1ZPfugFiHMLNFxuJ+rloPQ9j6qYyS0gpFQHkrwfn0a9yJmTaajT3Lg054s
	Q7AB0zGJRS9tPuXAwrgqlYMHvMuphV50OBsMEMQuVFFmN3aQuBkfD4cIEphM4SovVmoT0+MCQNz
	XYfa6kJBDk/9pZShjn7KjeCmul1sJ0svqEQeF2hDTGPhMxzfKvWNUsPMUaUegH9P5ojgOsqZDFw
	n9l5xdkAi7Emmut+kCH8EMGuQGhUNKTaOrnNgwMKe6pchyvmTkVZyXVXsxUoiaXZYMOJq/Z/1a0
	bcPrALIQ7+IaA3cpmtU3b3dFl6vH4tflcqCb3D03KcYEuM
X-Received: by 2002:a05:6871:3a2c:b0:3d3:7288:fe44 with SMTP id 586e51a60fabf-4040ba24643mr2524454fac.11.1768426694295;
        Wed, 14 Jan 2026 13:38:14 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa50721a6sm17711247fac.10.2026.01.14.13.38.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:38:13 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH V4 11/19] famfs_fuse: Basic fuse kernel ABI enablement for famfs
Date: Wed, 14 Jan 2026 15:31:58 -0600
Message-ID: <20260114213209.29453-12-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114213209.29453-1-john@groves.net>
References: <20260114153133.29420.compound@groves.net>
 <20260114213209.29453-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch starts the kernel ABI enablement of famfs in fuse.

- Kconfig: Add FUSE_FAMFS_DAX config parameter, to control
  compilation of famfs within fuse.
- FUSE_DAX_FMAP flag in INIT request/reply
- fuse_conn->famfs_iomap (enable famfs-mapped files) to denote a
  famfs-enabled connection

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/Kconfig           | 14 ++++++++++++++
 fs/fuse/fuse_i.h          |  3 +++
 fs/fuse/inode.c           |  6 ++++++
 include/uapi/linux/fuse.h |  5 +++++
 4 files changed, 28 insertions(+)

diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 3a4ae632c94a..5ca9fae62c7b 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -76,3 +76,17 @@ config FUSE_IO_URING
 
 	  If you want to allow fuse server/client communication through io-uring,
 	  answer Y
+
+config FUSE_FAMFS_DAX
+	bool "FUSE support for fs-dax filesystems backed by devdax"
+	depends on FUSE_FS
+	depends on DEV_DAX
+	depends on FS_DAX
+	default FUSE_FS
+	help
+	  This enables the fabric-attached memory file system (famfs),
+	  which enables formatting devdax memory as a file system. Famfs
+	  is primarily intended for scale-out shared access to
+	  disaggregated memory.
+
+	  To enable famfs or other fuse/fs-dax file systems, answer Y
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 45e108dec771..2839efb219a9 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -921,6 +921,9 @@ struct fuse_conn {
 	/* Is synchronous FUSE_INIT allowed? */
 	unsigned int sync_init:1;
 
+	/* dev_dax_iomap support for famfs */
+	unsigned int famfs_iomap:1;
+
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index ed667920997f..acabf92a11f8 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1456,6 +1456,10 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
 
 			if (flags & FUSE_REQUEST_TIMEOUT)
 				timeout = arg->request_timeout;
+
+			if (IS_ENABLED(CONFIG_FUSE_FAMFS_DAX) &&
+			    flags & FUSE_DAX_FMAP)
+				fc->famfs_iomap = 1;
 		} else {
 			ra_pages = fc->max_read / PAGE_SIZE;
 			fc->no_lock = 1;
@@ -1517,6 +1521,8 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		flags |= FUSE_SUBMOUNTS;
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		flags |= FUSE_PASSTHROUGH;
+	if (IS_ENABLED(CONFIG_FUSE_FAMFS_DAX))
+		flags |= FUSE_DAX_FMAP;
 
 	/*
 	 * This is just an information flag for fuse server. No need to check
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..25686f088e6a 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -240,6 +240,9 @@
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
  *  - add FUSE_NOTIFY_PRUNE
+ *
+ *  7.46
+ *  - Add FUSE_DAX_FMAP capability - ability to handle in-kernel fsdax maps
  */
 
 #ifndef _LINUX_FUSE_H
@@ -448,6 +451,7 @@ struct fuse_file_lock {
  * FUSE_OVER_IO_URING: Indicate that client supports io-uring
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
+ * FUSE_DAX_FMAP: kernel supports dev_dax_iomap (aka famfs) fmaps
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -495,6 +499,7 @@ struct fuse_file_lock {
 #define FUSE_ALLOW_IDMAP	(1ULL << 40)
 #define FUSE_OVER_IO_URING	(1ULL << 41)
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
+#define FUSE_DAX_FMAP		(1ULL << 43)
 
 /**
  * CUSE INIT request/reply flags
-- 
2.52.0

