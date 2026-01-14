Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5559379980
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426961; cv=none; b=SfSOoZjy2RLDIS9UeAkCBOpMVYmCNHU93o1gzjPBHrj3A9tcVBucyrX1/iD+Qt8+PP1kz7XhCUbuHiQKQugxcIbdprBU4xh7kO5GZBzlnXbSMwVh/D2iCwX1k1QmnIh4ZOvAsbpP6wRJ61vCUHBJbb+HgDxPK76ELQHpvzcZuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426961; c=relaxed/simple;
	bh=VL5oOUiKrAPPvKr1vFu621tvVEzPIunWgTzSeWNY/A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USw4Kep0F8xbSY4Qz2sqx8qOwq2fIOaKOt1OV6XB2E61Ifz3kQ6DBqZcSKrP7mCd7uFZEDYqvUsvTTF6qIwCxT6/bo+s/uAzo/XuOOdO3dF93AAgzFxYV0xQo5S+THKYHbpsQaV2NUjsz2WfCZ6d/ltI+iwJnLgTREFkpndO2l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYz2ovlW; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYz2ovlW"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7ce229972f1so206448a34.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426925; x=1769031725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAgvwt1OR9TYLgNznZNLzZ51Qby0qHLIemjsJLSQFFs=;
        b=LYz2ovlWQFptlGWfhp1NtFCWhUw28nQ1K+fgwBgaDZwO0Ms3a5ICdSU97gdn5aYKYi
         kM9ZUwHrF3kMPXjCs2vqrCfz4I4Xd/8m39x+Id1H6jof5Vsq+E8jTegX1iZ12Gf9uj37
         icurrqkHP0cQqdmL/XVtmtfEAPs38uIyl9zu2nAJY1TwKNOovK8trm+u2Laic+ulXRJN
         qkf4oKVkXVM6o7Fn5gMvVjOJ60LMGNUAHUrJFBDQYAWMkpRCCiJ42Du5/4Tvu4PKWTym
         bmqgYqkrT1xHMFonvp2YWjydP8Uu9JjWJ1dF/IBvHTG4Je/3CeUoO1PhcPwe1vuOsqeG
         P45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426925; x=1769031725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAgvwt1OR9TYLgNznZNLzZ51Qby0qHLIemjsJLSQFFs=;
        b=Y1PA2ouAKYd7+vnbCsHaCRlrv+F8Ffs03zGNTu3nM5HeiZkh399jO9tVdyxyemst5H
         ffIEJWKZbO+0ryBXM4F6wiCB5lJXjiTvZoGhVPpYZ6YFHIIhQnYbn8Q1yhIYzt5SOVvl
         mMgvGcaTpenau3YAJUXL+4aM95uWzkOjzUJg+rMZpeyQfowdosyJ2jlQUqnJuv0hX/sm
         onSX9lDPOavs46DNDLa4syCZJFvt0yvhN+Uz6CKSGvfgAlIIsX+6jeUr0ZGUWIDfH2oo
         E0bMeGyfGNbC7JW/uedSmsMJjMERXq4+XwZmrG25kcqiNl3aA4FuIenVJRL8uXoCUQfU
         DaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo84ounEleVOyiuT8arQE6fWK46nsEA6HCAqP3dcaUrp09u8QKg9SrzvukLfhrX+ZDgUyqEqcW7NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIogiqJrkh72EJ5ADBIpbK8znZLDuWcpbR/toXnE3ucdCVXAir
	Af3pN3DrmSMkzPtjre1FzLODX89h4C/mx+zglO7am9n2cXcotbgbddY0
X-Gm-Gg: AY/fxX7pm+JqBEVmzzyU4a+2qGF73KAtrKtL9hqjxJdWKpvj8ZKupnu/E4hZyTFeYcP
	9rgguKuvms5tzq5ApyViaJu4Wb4MRo49RdyY4sO86zg3B7wbXTc8ySuvtMKWNSSARSJlkB0Um51
	ZS4n/md1ZpWgnPZmfmo4XhFOLPZPJZ2KAjCs6qWI8kj+qWDCtwfJ921lbPl9MKdB0WEiKiKkFcQ
	b3dz3fKCPEd7eastEWkJlW821r2ZHu0OSZ81eMcMqk7Eja+hZ0toVRj1/uegtsQ7bTuuzTA35JU
	KrOz2hw52fzjZQqK9yu1EZetfmBhhiHRxWaJz6j7GLmiWBKca7uQBc7WdbQayGOBzix/LleVWqI
	Ao8uggo3HFtpPEl7EORJK6NdISd0JB3UKC7LZaFAAF8ALXGHjXaDr7qNhgRACsVAv9LnX0xGgI9
	RnyQyRL4ytKZg0LGAovMVUO2tYdaMehYvibHIKTSs/ypnM
X-Received: by 2002:a05:6808:18a8:b0:44f:94ef:baa1 with SMTP id 5614622812f47-45c73d673c1mr1898228b6e.22.1768426924855;
        Wed, 14 Jan 2026 13:42:04 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ee883sm19819637a34.28.2026.01.14.13.42.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:42:04 -0800 (PST)
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
Subject: [PATCH V4 18/19] famfs_fuse: Add famfs fmap metadata documentation
Date: Wed, 14 Jan 2026 15:32:05 -0600
Message-ID: <20260114213209.29453-19-john@groves.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: John Groves <John@Groves.net>

This describes the fmap metadata - both simple and interleaved

Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/famfs_kfmap.h | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/fs/fuse/famfs_kfmap.h b/fs/fuse/famfs_kfmap.h
index 0fff841f5a9e..970ad802b492 100644
--- a/fs/fuse/famfs_kfmap.h
+++ b/fs/fuse/famfs_kfmap.h
@@ -7,6 +7,79 @@
 #ifndef FAMFS_KFMAP_H
 #define FAMFS_KFMAP_H
 
+/* KABI version 43 (aka v2) fmap structures
+ *
+ * The location of the memory backing for a famfs file is described by
+ * the response to the GET_FMAP fuse message (defined in
+ * include/uapi/linux/fuse.h
+ *
+ * There are currently two extent formats: Simple and Interleaved.
+ *
+ * Simple extents are just (devindex, offset, length) tuples, where devindex
+ * references a devdax device that must be retrievable via the GET_DAXDEV
+ * message/response.
+ *
+ * The extent list size must be >= file_size.
+ *
+ * Interleaved extents merit some additional explanation. Interleaved
+ * extents stripe data across a collection of strips. Each strip is a
+ * contiguous allocation from a single devdax device - and is described by
+ * a simple_extent structure.
+ *
+ * Interleaved_extent example:
+ *   ie_nstrips = 4
+ *   ie_chunk_size = 2MiB
+ *   ie_nbytes = 24MiB
+ *
+ * ┌────────────┐────────────┐────────────┐────────────┐
+ * │Chunk = 0   │Chunk = 1   │Chunk = 2   │Chunk = 3   │
+ * │Strip = 0   │Strip = 1   │Strip = 2   │Strip = 3   │
+ * │Stripe = 0  │Stripe = 0  │Stripe = 0  │Stripe = 0  │
+ * │            │            │            │            │
+ * └────────────┘────────────┘────────────┘────────────┘
+ * │Chunk = 4   │Chunk = 5   │Chunk = 6   │Chunk = 7   │
+ * │Strip = 0   │Strip = 1   │Strip = 2   │Strip = 3   │
+ * │Stripe = 1  │Stripe = 1  │Stripe = 1  │Stripe = 1  │
+ * │            │            │            │            │
+ * └────────────┘────────────┘────────────┘────────────┘
+ * │Chunk = 8   │Chunk = 9   │Chunk = 10  │Chunk = 11  │
+ * │Strip = 0   │Strip = 1   │Strip = 2   │Strip = 3   │
+ * │Stripe = 2  │Stripe = 2  │Stripe = 2  │Stripe = 2  │
+ * │            │            │            │            │
+ * └────────────┘────────────┘────────────┘────────────┘
+ *
+ * * Data is laid out across chunks in chunk # order
+ * * Columns are strips
+ * * Strips are contiguous devdax extents, normally each coming from a
+ *   different memory device
+ * * Rows are stripes
+ * * The number of chunks is (int)((file_size + chunk_size - 1) / chunk_size)
+ *   (and obviously the last chunk could be partial)
+ * * The stripe_size = (nstrips * chunk_size)
+ * * chunk_num(offset) = offset / chunk_size    //integer division
+ * * strip_num(offset) = chunk_num(offset) % nchunks
+ * * stripe_num(offset) = offset / stripe_size  //integer division
+ * * ...You get the idea - see the code for more details...
+ *
+ * Some concrete examples from the layout above:
+ * * Offset 0 in the file is offset 0 in chunk 0, which is offset 0 in
+ *   strip 0
+ * * Offset 4MiB in the file is offset 0 in chunk 2, which is offset 0 in
+ *   strip 2
+ * * Offset 15MiB in the file is offset 1MiB in chunk 7, which is offset
+ *   3MiB in strip 3
+ *
+ * Notes about this metadata format:
+ *
+ * * For various reasons, chunk_size must be a multiple of the applicable
+ *   PAGE_SIZE
+ * * Since chunk_size and nstrips are constant within an interleaved_extent,
+ *   resolving a file offset to a strip offset within a single
+ *   interleaved_ext is order 1.
+ * * If nstrips==1, a list of interleaved_ext structures degenerates to a
+ *   regular extent list (albeit with some wasted struct space).
+ */
+
 /*
  * The structures below are the in-memory metadata format for famfs files.
  * Metadata retrieved via the GET_FMAP response is converted to this format
-- 
2.52.0

