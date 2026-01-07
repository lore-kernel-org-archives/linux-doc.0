Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03B396D3D
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800079; cv=none; b=dQwuNriOnzc9x1srzdrP7LZ39UiWM/gQEamzXkU8ZBO7CeWUjpp/dtAUkjtt0GL8FJeypHGR5c9FkC1Ppugj5Br2T1vBoLiSC/55ifwDrw4GhpTmoxnGez6W0eQhwta4kuXkfaX1f8p/l3lVMNi+efZCXOD3HgXCFl3qM9S8IoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800079; c=relaxed/simple;
	bh=zQL6OSWBO4m5+Q/hEBIHqSQry3+21Rl32A58FZEFgEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozirkMbOegIVMNQL6qmqbqzastf1VOEF836x7hvQkTT1SxkzMAgUib57ssmdQxC4F76BQozmethYjqwDwkS1MfnTkdW1LS7dWRuvmeqfIxoaQtqgFtbxhyXKundihdUP1HPDHTMCu5p0DiPTBsIF+rIVj6P8Kmt7PGyNIsqFSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JleWKWKK; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JleWKWKK"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-459993ff4fcso917435b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800076; x=1768404876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BadRqtdIUTjJqSpAIjL5u97iCPqnyeMr+lfViz9uPAM=;
        b=JleWKWKKZILs4kfdIcm67y4G/+cPmDE8Eh9sSBPGt8bosmO1BQJxYUIciTesaGkZmH
         k0maEuJOCN1txO0Z7yGlpuIhvRNEsqbFmd1MSV5CW8soCIdpxxaBe86ybTym+zFpyLxS
         vOZqtX9lPTNxRb2WPcBCecXuBpGFS4wJqaugmG2/Wh2SGPQIR8A4dTj4KdU26/LSYrEI
         KUpnS2wdi35TkbpjN8hSHcToVQBtSn+585t54AkDJ0l3tCYLn/ZcRjYtr7GzXrxyQlns
         42Br/b1X8Q6gPMm+2MwNgSjKbgq3skPX0nPs+yNOPlfJcVFHeLi1FlBBFX/seBcp6urb
         elfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800076; x=1768404876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BadRqtdIUTjJqSpAIjL5u97iCPqnyeMr+lfViz9uPAM=;
        b=FH5bFYju2eazXyYdw3vsiB39CPlIhUbss4KYhiSxkqRTiiS/nSag6MZH3xuk4f473U
         T9I4DBiwroiRljh+A+sB3X58PJ8QyEBt5syLj9OhbwZjwFUU2LjckMBIKBG7jo7bO3YJ
         1JFvlChW9UZ+p+jcJZuNHtf77vcF2uSrS9Qlr7mZQ020gphIgBKD8Yziz6/ShyjITgwP
         6S45xSOVfPlRdUuOryBMk1En1B9jFUbotF2SCz+Hq/j1+1UGdb67Zdf9cnw6geqFkXuh
         Jp5lhiLjn1geL/Xlc7jFV+a9uPHenk7sgQzRPYppwr2JUAGKSvQhasTDSXIpLVHtPmoh
         9SyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ncrde+qwxW0amVCWzOxSmyZlA+ZsQiXRed01jO3hpA/Ry6LEqp6NfMI4IA91pEG2StJy0q1gsU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZP4Q7NS0JQupZFqbzuuhOFDbshqzCLcJjW4BC3qnK1sOkpGFW
	J+Cg/8wz5Gdx1DiOivXfp7mRyVdVM1PCAdFwXRt+hrCHtT1d8ToerC/2
X-Gm-Gg: AY/fxX7HxGLOKdStnq//pLLfoRx9Wdgr8aln+Y6LIqfVFflXis16XpZw+V7N/sBNiik
	yhYZq/rS1M5+BdnYRRb7U5wVmID0EhRfH3u3DXuAI79z2eDN/BQXm1HfqNP6sFhbQjSRpKLlPlT
	eFuxcKBep/pFMfYMW5ieusB6hmyyZpfUR4S55RxBDFscVPXTkZSFZtGnSNijAyKZofyJS9LWyl2
	KkW6D4T3Uf52j1p91yV+DC6sHYFlyEQ0AZw0U3iY/FavehbCKpp62nYsj622T16SBl+tHIgmGxa
	H2oFkdaap/418bxuNnGvHhI6E1r/kgV9mUEjYlnMqIQo5AHDOOUgU00KKyTGd+Dty8eUUxJplvq
	vG1FFS87kM20ZHvXwywEMc8jROM7fc1heTLzSYuyh4OUp3EjtY5UT+QPs5qXlPRoEIlbJKWrQSU
	bAcFpT9A+xUSGxA5xwE0RzIcT4Q1pFrlBUlFzJYxjfOu6d
X-Google-Smtp-Source: AGHT+IGiBgbbbwZi9OtjHC2lwZve1mJRhadFMJn6qeQ/EHq2CoD4bMYUWvkIfhWahXqGzzsZgFZhkg==
X-Received: by 2002:a05:6808:2383:b0:45a:156f:dbcd with SMTP id 5614622812f47-45a6bf2a83emr1169537b6e.62.1767800076370;
        Wed, 07 Jan 2026 07:34:36 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2f1de5sm2398106b6e.22.2026.01.07.07.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:36 -0800 (PST)
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
Subject: [PATCH V3 19/21] famfs_fuse: Add DAX address_space_operations with noop_dirty_folio
Date: Wed,  7 Jan 2026 09:33:28 -0600
Message-ID: <20260107153332.64727-20-john@groves.net>
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

From: John Groves <John@Groves.net>

Famfs is memory-backed; there is no place to write back to, and no
reason to mark pages dirty at all.

Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/famfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/fuse/famfs.c b/fs/fuse/famfs.c
index 4eb87c5c628e..32c3d0c2ec48 100644
--- a/fs/fuse/famfs.c
+++ b/fs/fuse/famfs.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/dax.h>
 #include <linux/iomap.h>
+#include <linux/pagemap.h>
 #include <linux/path.h>
 #include <linux/namei.h>
 #include <linux/string.h>
@@ -38,6 +39,15 @@ static const struct dax_holder_operations famfs_fuse_dax_holder_ops = {
 	.notify_failure		= famfs_dax_notify_failure,
 };
 
+/*
+ * DAX address_space_operations for famfs.
+ * famfs doesn't need dirty tracking - writes go directly to
+ * memory with no writeback required.
+ */
+static const struct address_space_operations famfs_dax_aops = {
+	.dirty_folio	= noop_dirty_folio,
+};
+
 /*****************************************************************************/
 
 /*
@@ -657,6 +667,7 @@ famfs_file_init_dax(
 		}
 		i_size_write(inode, meta->file_size);
 		inode->i_flags |= S_DAX;
+		inode->i_data.a_ops = &famfs_dax_aops;
 	}
  unlock_out:
 	inode_unlock(inode);
-- 
2.49.0

