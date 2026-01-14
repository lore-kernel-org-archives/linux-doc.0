Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716837B40A
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426900; cv=none; b=Y/9I/e3+jgkYtrPeDBsG498PbYkIroL5mBXYU9mDfvnteuOSVC86BkjJGNM5Hfdl+NJelAqtk5ssLqSPHR8ilkSK0fjEnqlM414AO8cNA3ZutYP6SjRZR7gs5VVSCaXhzqOTO33gnPv+xsJf/48Ib/3B0L+djGb+NZ9r1/T9U+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426900; c=relaxed/simple;
	bh=XuywZGj+XDpfZvHURwVbpU2ahP9/m0Z4xu0nAUB//wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwzqPmZCxsXUASSFStwb1yrj1g5au8Zd2XtlHsnLU5+Frd9UFVaU+3b8QH3Q9GI/wclYCDGKlf5dEwW0vZtqreJQ7AHFrj8BfdAq8foh9ESBHOyoVhMEeTpK4CR6rGBAiYIaixYbXQhf5JdehNpQspnW7kVM3FrywUFClEbE1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LatlMkST; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LatlMkST"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7cfd1086588so175677a34.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426892; x=1769031692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikg86hLweLFlugyhGYJjhkjBVnchP1h60r6PTv+Ts0E=;
        b=LatlMkSTsYu/l8/Ja0zhCxdgQWUdY82RbwgAi6ykhvIWH63St5yaK2WQx7RNvztPLG
         oUyGbTXDlMNiWUKAEh+WqCpiRj0zEYGQi+uBIiGgDJXPFDYOcKbxvJ4ioMkxBfmTnJB3
         1lbAlpaKoxzad8+wjDMyqf7w2YPLhQj6Vn1WcF3m4nr2jW8779kzpGWAzqnQwHTvTuT2
         qL1QW3qyBZiiFBjjtFkaE87JWBBHQSbtDZ4B1STythH8Axd1OGO7ST1j+pjRaefJz+ZA
         I3ArH83uTzCaIT0gu/ddzrUDEXk6J6iVluSOIR3O6jA81hEzpljJDurnOFWlYByC1S7o
         0vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426892; x=1769031692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikg86hLweLFlugyhGYJjhkjBVnchP1h60r6PTv+Ts0E=;
        b=RgJezc4w6nx93K7QB156aRxsDN8rNb3yCuj6b/0TLBQ93iPa//iPVvqCf9DCb8zC/i
         QV0q/vobz90GnDPhXHflUUYwyLgBe6Jc9YXIY9rxqqXs7g/Wrmp845y83yidod0TxPy+
         0XkDFOuO9+28iM3Imsl35i71IPOU+giv1SG/FdSpiLCHsD11lV05MKORiCQFjZJG6hFm
         1EfUbOy/0YQlHe/JFotjJfTvE9URk+UPCpwdug76ILww+tUGQ87gHbAFmuh3FgULRlmw
         Fk+UySxYy5THZq8bARmTWDTQx3Ib4Z7ms3StrTjNdoi/KAsTBLvJku+iBMozYhkzXRFi
         D4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI/dxi0fGBs7+Ku7TXnmE1XulBWrZw2OrQlrEWdyQUQiXF8u5LtPfEXsBjOh/Ocm9mnSb1LkycA4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgvavZTzWFQTF4TWzdrk8hlkA7ccfVfUWVhGZZ0yvFdwfVvGpR
	bapgJ12dwVICdR65P20Qjfd4V/LJFRql9B8iValWql/RtU4jCPggTZR2
X-Gm-Gg: AY/fxX7UoNDYBdgMay801QfgjXpo5ptuu0SG5KswKjFoFKujo/wfMhht+iEtsuDhWN4
	iZSyFXbyPpvBS8QFGeCP6B1DMkxVYHsnCUGufWDuHIM9kXGbMGic1Jb92oszh1pKv0fLwGrxBIh
	ti/7Lnh/XvLHjq/orNRUxKY4LQmq7bXpHfic7xfVOonUYXcnllwcHbs/m9+F9kpeG3QUvNxsOCX
	WzkgjMB9bgBVf/f/ZdxnReHbzHXYKreBZldE7+WTUBLGAu6Y2CkRPxX3ThF8BW+dBNWQdLT5vnn
	h6ohuT46PHI1ZNdSGA2E+iJdyvlWn552uDIFOm6ePWldmMSyOPgSpzbaxLOM0XQWJs8xyAlEg16
	8WROb74aWC/EyhSF4RktFFdJSf1d/LAPw4HIzTs45BfZ+XyY5VRIG4l3VO5fzAa2L6GIJTY71B1
	mBMZfvJwvF7RLIkN8OM/y8qz9bV3rZa+nZSrI+JfyCAoJX
X-Received: by 2002:a9d:3e49:0:b0:7c5:3c7d:7e67 with SMTP id 46e09a7af769-7cfc8b5155fmr2043023a34.29.1768426892219;
        Wed, 14 Jan 2026 13:41:32 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ede38sm18802373a34.26.2026.01.14.13.41.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:41:31 -0800 (PST)
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
Subject: [PATCH V4 17/19] famfs_fuse: Add DAX address_space_operations with noop_dirty_folio
Date: Wed, 14 Jan 2026 15:32:04 -0600
Message-ID: <20260114213209.29453-18-john@groves.net>
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

From: John Groves <John@Groves.net>

Famfs is memory-backed; there is no place to write back to, and no
reason to mark pages dirty at all.

Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/famfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/fuse/famfs.c b/fs/fuse/famfs.c
index ee3526175b6b..f98e358ea489 100644
--- a/fs/fuse/famfs.c
+++ b/fs/fuse/famfs.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <linux/dax.h>
 #include <linux/iomap.h>
+#include <linux/pagemap.h>
 #include <linux/path.h>
 #include <linux/namei.h>
 #include <linux/string.h>
@@ -39,6 +40,15 @@ static const struct dax_holder_operations famfs_fuse_dax_holder_ops = {
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
@@ -625,6 +635,7 @@ famfs_file_init_dax(
 		}
 		i_size_write(inode, meta->file_size);
 		inode->i_flags |= S_DAX;
+		inode->i_data.a_ops = &famfs_dax_aops;
 	}
  unlock_out:
 	inode_unlock(inode);
-- 
2.52.0

