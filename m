Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9882394477
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800061; cv=none; b=QsL+47k3SVnqyx+1KlmK/vkrUjGgjSpXtAJXhNDNl8rse3okh6E7uvCAcvL1P33ipxPGY0HStqcErnrc1/hICUX6IG5bTxXtaemEB9/zjNlX278NfiNP3Nwg7kQxsQD4Lm+jYELSCTOxx5SnBztCOzstz27gdYpZjSNn6ESbQiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800061; c=relaxed/simple;
	bh=eVZvTKoGzS9QT9AZIVcrZZeY/VZ69Zoen8NpofDAoxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Btdcu3zhSsptCd7AmnkQYgygdM3IauQ5BsDOCLGjwxJIYjjsZ1F8PP3lo8Ishh90XgYBKMpE2iszY4daLfNxopvgrEpljQEbdLXhGQRv83BLYDfHNB3YaVzWZELk2HxvR/L/PTxpYwXfB1lRM6pkJg3qTaNGp9mVcBVO0edHrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGnvaW4c; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGnvaW4c"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c6da42fbd4so1205968a34.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800058; x=1768404858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioRMhdbsJjC8v5pL1MPtuv/dIU5BMDQOIZe20AJ80PY=;
        b=UGnvaW4co7XWirS/NsFr1WBKa5z2Yg9k29ztmMLr5Rh/iwNkIUZL4MInE1Up1WNYnW
         aPUBxfiPAQKzdu6D3XZqWtIgv0nFhLt7zkU0skIarPSJfgfs7sRT3OcAc4/msmER1vwP
         47RlqOdzGLN1YjCTUU93/CpkZ744c7B56s/pkPPNqJaXDqqUbZ/9z3Ne6mleRmUEzmDX
         3f6jVFR3WhI1Z7wKs6kYbBYivQBju0sMlu8VfUGcIztrovsgk2PPJXQM8xrZNH8bNyly
         cuehlgEs8bzW+/b2Zyb0ceXGiAKsqoVTZjcm0iOMRNAfN9dBExhRnWBygUgbmV2Xzi7Q
         gViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800058; x=1768404858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioRMhdbsJjC8v5pL1MPtuv/dIU5BMDQOIZe20AJ80PY=;
        b=ALBfcyQEzC4YiNJ1oEpnkCAMLjtezsWTRfjqkzvdai4WpKaZ+rrt9sPJCKpC8YVS3p
         KNA1ov2tTmIE2hfTxjBTe+vHhCHBPE206gP5LnVxSw4LIpse4uECiC9PvEJIHzqIYTYl
         VN2NDY1xI3+jrf/iv/8sx/jII2po0otZq9OHllPXGYNeCuR2RfcXbCn+BRokdb5IFyr0
         Wjt7fyD6lRZcM5uajA8oVUfIWpkV0qcAMIhAZS96Q8O4uakaLFom3qTcKS7sZ2E4ToOD
         NbDKXRh6zEWAFLCqkT5mT8r5qp02xlMxnJTK46zns1O9eIiKWckY/xN34/z/8bvDdcqS
         yfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjhz5+toFXwr/1P75z30//wbVzQkBOtEIp0VAM9rdyg5nC0H3IkY9l6HIBInJGXrUKR+g66EXDItU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqHqqo6s3MW9zIiY7WWuXAxzPqcUrTo0tW+iR0rXqVWM9qQKK
	sVbHkKbQSDX+h0pQCE4p/hLKnUJEMoOQS5O3vkuAZEMoY4ronSsmnyWD
X-Gm-Gg: AY/fxX5vg75fS0Ii1PvO4K9FpIC6fXZeP1TUCKkibbBl5ewdZaLyCMnf9iUj7ATGUhq
	ihmsssDyIt/UmyaJgaiHx9tG/JP8xAaYuriIcrVPfiGqUKE0QD6CrQWWzXGwvl+B4fWxqCEo3VO
	wDUxI04vKAjF3gqCxaksIRPo3DORZq0a9QWrNDYwcLg4C6kFfOkA8T78OkBK1gjH/uFJQIRACcr
	q52uQvEYCPIW1UGzdwJO+Tbd+GJpHSLx6l/I8mISTpiBJZslo/vI6Ef5dltO19AdM1h1Se6Rq3m
	6bk+yA8zl5RONlu1Ooiba2ADY4ux9Yd+U3WxvJwLo7Pl6EcB8XXFP/G3eKlhiMzSGDi0WiNqtpi
	7mex3SxK3r3u2e3XR/rH8Qqph7GGAmJ3LfR88Q/jLJESQbV11i09UFwEI0MObp7eC15bXvOeF0N
	FP4t+KeWK3O9gya/ZqN3idjnS9KnZsa3NopO1kIinBwP6K
X-Google-Smtp-Source: AGHT+IG/OP1ZeA8RVwGBd2hiwLTF8z2bJWxQ5Kax1EN4BvyeAQ3tR8TZf8cyaewyY/AtJiZ/nDb6hw==
X-Received: by 2002:a05:6808:3442:b0:453:f62:dddc with SMTP id 5614622812f47-45a6bccd815mr1304391b6e.7.1767800058505;
        Wed, 07 Jan 2026 07:34:18 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2f1de5sm2398106b6e.22.2026.01.07.07.34.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:18 -0800 (PST)
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
	Chen Linxuan <chenlinxuan@uniontech.com>,
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
	linux-fsdevel@vger.kernel.org,
	John Groves <john@groves.net>
Subject: [PATCH V3 13/21] famfs_fuse: Famfs mount opt: -o shadow=<shadowpath>
Date: Wed,  7 Jan 2026 09:33:22 -0600
Message-ID: <20260107153332.64727-14-john@groves.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260107153332.64727-1-john@groves.net>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shadow path is a (usually in tmpfs) file system area used by the
famfs user space to communicate with the famfs fuse server. There is a
minor dilemma that the user space tools must be able to resolve from a
mount point path to a shadow path. Passing in the 'shadow=<path>'
argument at mount time causes the shadow path to be exposed via
/proc/mounts, Solving this dilemma. The shadow path is not otherwise
used in the kernel.

Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/fuse_i.h | 25 ++++++++++++++++++++++++-
 fs/fuse/inode.c  | 28 +++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index ec2446099010..84d0ee2a501d 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -620,9 +620,11 @@ struct fuse_fs_context {
 	unsigned int blksize;
 	const char *subtype;
 
-	/* DAX device, may be NULL */
+	/* DAX device for virtiofs, may be NULL */
 	struct dax_device *dax_dev;
 
+	const char *shadow; /* famfs - null if not famfs */
+
 	/* fuse_dev pointer to fill in, should contain NULL on entry */
 	void **fudptr;
 };
@@ -998,6 +1000,18 @@ struct fuse_conn {
 		/* Request timeout (in jiffies). 0 = no timeout */
 		unsigned int req_timeout;
 	} timeout;
+
+	/*
+	 * This is a workaround until fuse uses iomap for reads.
+	 * For fuseblk servers, this represents the blocksize passed in at
+	 * mount time and for regular fuse servers, this is equivalent to
+	 * inode->i_blkbits.
+	 */
+	u8 blkbits;
+
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	char *shadow;
+#endif
 };
 
 /*
@@ -1631,4 +1645,13 @@ extern void fuse_sysctl_unregister(void);
 #define fuse_sysctl_unregister()	do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+/* famfs.c */
+
+static inline void famfs_teardown(struct fuse_conn *fc)
+{
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	kfree(fc->shadow);
+#endif
+}
+
 #endif /* _FS_FUSE_I_H */
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index acabf92a11f8..2e0844aabbae 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -783,6 +783,9 @@ enum {
 	OPT_ALLOW_OTHER,
 	OPT_MAX_READ,
 	OPT_BLKSIZE,
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	OPT_SHADOW,
+#endif
 	OPT_ERR
 };
 
@@ -797,6 +800,9 @@ static const struct fs_parameter_spec fuse_fs_parameters[] = {
 	fsparam_u32	("max_read",		OPT_MAX_READ),
 	fsparam_u32	("blksize",		OPT_BLKSIZE),
 	fsparam_string	("subtype",		OPT_SUBTYPE),
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	fsparam_string("shadow",		OPT_SHADOW),
+#endif
 	{}
 };
 
@@ -892,6 +898,15 @@ static int fuse_parse_param(struct fs_context *fsc, struct fs_parameter *param)
 		ctx->blksize = result.uint_32;
 		break;
 
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	case OPT_SHADOW:
+		if (ctx->shadow)
+			return invalfc(fsc, "Multiple shadows specified");
+		ctx->shadow = param->string;
+		param->string = NULL;
+		break;
+#endif
+
 	default:
 		return -EINVAL;
 	}
@@ -905,6 +920,7 @@ static void fuse_free_fsc(struct fs_context *fsc)
 
 	if (ctx) {
 		kfree(ctx->subtype);
+		kfree(ctx->shadow);
 		kfree(ctx);
 	}
 }
@@ -936,7 +952,10 @@ static int fuse_show_options(struct seq_file *m, struct dentry *root)
 	else if (fc->dax_mode == FUSE_DAX_INODE_USER)
 		seq_puts(m, ",dax=inode");
 #endif
-
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	if (fc->shadow)
+		seq_printf(m, ",shadow=%s", fc->shadow);
+#endif
 	return 0;
 }
 
@@ -1041,6 +1060,8 @@ void fuse_conn_put(struct fuse_conn *fc)
 		WARN_ON(atomic_read(&bucket->count) != 1);
 		kfree(bucket);
 	}
+	famfs_teardown(fc);
+
 	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
 		fuse_backing_files_free(fc);
 	call_rcu(&fc->rcu, delayed_release);
@@ -1916,6 +1937,11 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 		*ctx->fudptr = fud;
 		wake_up_all(&fuse_dev_waitq);
 	}
+
+#if IS_ENABLED(CONFIG_FUSE_FAMFS_DAX)
+	fc->shadow = kstrdup(ctx->shadow, GFP_KERNEL);
+#endif
+
 	mutex_unlock(&fuse_mutex);
 	return 0;
 
-- 
2.49.0

