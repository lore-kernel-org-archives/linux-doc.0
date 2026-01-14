Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5736E482
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426672; cv=none; b=VojYmiHInauKaKJ679jNyX0JqGybDAM922PGSnezqXAms69cDIB89EZK2D5otUwSEXecoXXKPLmsEg46IhJ9HKA9ac4cWpfmXHlqIRU45RX9rFw/+RG+0BxVL5MDFwtckwibzS8LooTCQjH8y4EHWWbXhIxIiNqnMIwgb3cp2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426672; c=relaxed/simple;
	bh=qOSHTOI3Xwy3DZlyVIqnpnTOax8Iqhr9i1N4wEWNc+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxucgpyHs0XCUZV65KjwpBT5Vad7d4ldQRG5jnJ8/gxuY9cUKi6pbBwRNFOjLqT6POO9CPO69KZ/k7eulr5suhX+Z5ZqWy0+/X/tYbxI/ZlAjuRJRzBoQSQGZ3u0IKENRgusZj289KcVothbtW8aTzCHnTIUBa2mzrlWJ1lBxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFqKzBCG; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFqKzBCG"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cfd6d3df84so10625a34.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426628; x=1769031428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc2/Dnt7ZvDFJtfoDY9fKj1STHSnh2OdvJ7mPvvodA0=;
        b=DFqKzBCGwmy36uc4WM9nRABxa4ZaH0a0TzJhsgQwWWVxFpY6vPaWWDFvYaBXrm4BOG
         J9IznNse/jDzy4oh2ocmkJq9WWlve0ULh+GM3+QVdGv51sa4WwfLLqBNSoTEvoRgrtMu
         twp0HSXxwgIcR44+Z5/Q30Xd/0Re9df/IuRd+StdDPUho5AU8BoVFIKLbDXI+ef0Oay5
         Oadm9nzDifTWh+B3Qun1Eg4l2+gvFDAve8+8SNzQzmLoHJxZLQcMIdMELhspHQgjIocp
         YKTh1D0m+BAZ23OPU7FR3a+axj0R408vUgOSx2txRT5AZwgDz6ay3ncTH7Le4i+t8l/P
         gcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426628; x=1769031428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc2/Dnt7ZvDFJtfoDY9fKj1STHSnh2OdvJ7mPvvodA0=;
        b=OKINvuI56uX/6r9bfoyqpRB70vbhYCfLOibrG8H75BYgj3tm4IFjJNbLLJMkKf+Lm9
         pphJhMx6ePgu2Au2VBaVSh5dd6nObTXlWWGCKBuT90pzlufwiDYMWC7zg3wfG5XSqqWL
         giorTWZKshVptTtzrGLfaFRYCsrPR9jefa55eYtPmCxudY7ljAPRd55pAl4ualB9IlEP
         3VMbDITGLohaMCHQJULspJdhGXrqjvGcowvx/ppeODXpvbzb4l3zN6/F0RHtbLRsqFAz
         6jXUvId/1IJe9STQzEySoQp/vl75tolvuCW2MEpD4ettr5UI69CsIasAaL7FXDv8FwsP
         RsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmJd/f6geTH6x1FxBM+qyNV5gmeS+jwQvRI/5wnPyt+FyWIHPv+sJTpvo80TPcJCY5Cyr4RgOonQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDnLYja3OpTU+v2yZz/BB2m5NFNaVVmGAxy4gqA/wKWsfwSn9
	UJ0muCL2LqTIFad5grVFxUh+Vd7qRTxf4awJkNaR63QtB/yvPKtXMR5/
X-Gm-Gg: AY/fxX62FQa4CwPg7AUNl+HlN+Qx90rJtYRYU+TXQt7ygxIjE+lA0r8gIFXMRA+W64Q
	P0GaATizGxwlkppElo3Yx6XPHao07ypu+lieFprX+E+Cezx+6iVTXsQuVvqOTYYX//jq1/ftK3i
	/Zu5EvyGL8zduqei0xLmOsIoDN7eZAEw56sjCzWjlP1uBeAOxax2aJe+fmX6PYQqqgxO2O3Qudr
	UsTC/xvzI9+3iV0tC2L3mFlRURphpyrB0aUwD6DESdeT/P0HMFIx4JQdsnOq9bF9g5WcbUz/vyD
	7LlltRNXqGI8c+FI1oRqNvhcfNkINuD2DEs+7BY+dDaO/z6hHAyPLbuEflISZqW4mKvWBycaHAZ
	2JRcCGRQTI6UkvFCMFx4MLGakKcJTxpJV2Kq9x1ZBWbagxo/p/1VY7RO9XW4cR6ok2wJLOuVmus
	r+nnZYQFvrT7rEfxzUfgsjmumi6DEZhdWkdP4LQIi6bFdc8KwtJOLjWSs=
X-Received: by 2002:a05:6830:8412:b0:7cb:125d:2a43 with SMTP id 46e09a7af769-7cfc8b6a6b0mr1787867a34.28.1768426628343;
        Wed, 14 Jan 2026 13:37:08 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ee883sm19811078a34.28.2026.01.14.13.37.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:37:08 -0800 (PST)
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
Subject: [PATCH V4 09/19] famfs_fuse: magic.h: Add famfs magic numbers
Date: Wed, 14 Jan 2026 15:31:56 -0600
Message-ID: <20260114213209.29453-10-john@groves.net>
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

Famfs distinguishes between its on-media and in-memory superblocks. This
reserves the numbers, but they are only used by the user space
components of famfs.

Signed-off-by: John Groves <john@groves.net>
---
 include/uapi/linux/magic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index 638ca21b7a90..712b097bf2a5 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -38,6 +38,8 @@
 #define OVERLAYFS_SUPER_MAGIC	0x794c7630
 #define FUSE_SUPER_MAGIC	0x65735546
 #define BCACHEFS_SUPER_MAGIC	0xca451a4e
+#define FAMFS_SUPER_MAGIC	0x87b282ff
+#define FAMFS_STATFS_MAGIC      0x87b282fd
 
 #define MINIX_SUPER_MAGIC	0x137F		/* minix v1 fs, 14 char names */
 #define MINIX_SUPER_MAGIC2	0x138F		/* minix v1 fs, 30 char names */
-- 
2.52.0

