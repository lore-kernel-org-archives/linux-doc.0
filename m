Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9C1E25E3
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587643; cv=none; b=cakm3Ex0D2Z9Nxitmhgbw9lt57CWCz9jevwFEvZ2PwBSSh+//C0Cara0cHGs7uUDBjh+Bq4duSNaw695HBRLZ/59giweW2ZrYxJy8E7OEarndKWjvwEO7359WVVnju3+9FYTEo6xrWSfTZqbSE8hJoLtR24m/clRiYotoW1+fOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587643; c=relaxed/simple;
	bh=s6mhJfy1wLr9wwae+98XWped88EO8RR6Rj9hVh2fPUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipg8ktMH31uL2tGYe9plB2NjD8GnDEPvnMN/OdlMzxND4v/MLbSmocbwpEH5AVwemXyY2fW/MTPx7nULabS0J1KvojT/lwUaTajMdXHW1xwj6FF/ocQkzU22y5omb5VGBwkXyw8XOekXrL5idcy+5R3a0USImfjac9v2r3RxXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN7ChBlc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN7ChBlc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27c369f898fso6776195ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587640; x=1759192440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b5voxvHVAQ9evPBAMJkr0K4640egjfoU7iv7FHQ8OE=;
        b=WN7ChBlcUcvD/CuQRoDxSCYlalJJ0DWmeKGqx3nWwxcEPN5o0l1AokBao54AosjfRq
         pUxz5TGfwIjDQR5z79NA+rf78aoBYW413W1trtClWZhZQ1NS4JlZfjwPApjo1O49Mc0f
         3ppRXqdrRYAbwGRA8o6qUrou+9LK7Wj9jhPGqpCnkR/JWtl4HKr5mjkix6upWxacvkL+
         jiXjX1INuAlVoF4l8F9moRa+uALWv4UnUeFjSMdSl09YyyQgQuuH9V8x+8VVt3/JC3Mi
         wdWinT1jC+EKoPCy+/x22/H6yNDU19r+sGI81Of9LeqsLuEmJrT1zFyDY2BVd7uhHFNS
         9pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587640; x=1759192440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b5voxvHVAQ9evPBAMJkr0K4640egjfoU7iv7FHQ8OE=;
        b=sNc04Ierqys2GJ0s7vyEt6gQ9EPX5zXZwqQvyQ63Md7tmiCATL0yMDE/F/P030HrnD
         PL/rc7Z0Jeo9KYEOgZ5vCMZn79l1rf0EuBodP4hdIAezltpK85Xer9/lga0CtvC+NDYk
         +VTlGDE/YMOO2kGmBx3U3pVmGwd9hj3+1tfaNvs/Yj+scOrwNgTBAuYeasZqqtMD0gIF
         AzDwGUuRyQN6OFuVPEQ8voIPJCqFI84XI6hJATpS+GMqGQYM2W1vJAVbdDxYScnNwV5R
         L13CdJ8FhRq5xoD9IjObRw2jaKK7Ix4PmypAroCHya1YWNcf5yEQDypSfHzSSiZA/A3p
         L3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd8F/U0wuSB+sqHpMB6sMBKBDQERdQpJpg09eh//CgeUWML0D6KFeZr96mswnAGB2PvHwB966ZCuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcQHfQ8rYpmT1/oFY+xaW/yxWICIuYw3jn2uL9LOsQW24qpbW
	jGfDKBjfdJxA9mOL7Q10jZaJ49uWu62Zq1oG39aYlqyEmiJhP0PAhIaH
X-Gm-Gg: ASbGncvSIQUOJaBQJyAMcV4Bj9BJzKQm2MHgVTB0qWOwSsmQ2rgHerqXG89r566MKxh
	oGUapy1sz/MC5lVZh/1o93TuEfioFs/xBjbJMHuuFIfjPuwCKxWIk9eNRlbmr7RR0uyjaCPz0jz
	cfuE/t8tBgkVArrYqXu09wDVHfFk9loB33VTp92wOITrurAtF34pTAMUBlQn6oP4Cfror9YYdKm
	aqY51VxBOTa9SeGMMohGXK7OZiPYeYcl+iIxgHcZCt4FBlnlCCIXCrZnwonHzPPUsnwQw+ykwPk
	d/HOAJoIrFdO+cTNsgpZtZbTs6MrPk8cEbZ0mBHUZzX03x/CsZ3LO0PihEMhF3Lgyaz1CGl1SMP
	hfP78Hzx4nT26jJEXHXILzqZxJdt4gsH8ylhpKUb/QCADj0of
X-Google-Smtp-Source: AGHT+IE09TVUGqvhRnJ0j5/kebD7MODetqdlA1rNkjmRk63jDyjVyF8TO49tFsaKOOBbleAow9Cquw==
X-Received: by 2002:a17:903:1209:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-27cc580deebmr7891545ad.31.1758587639758;
        Mon, 22 Sep 2025 17:33:59 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980180bdesm143588125ad.56.2025.09.22.17.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:33:59 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	hsiangkao@linux.alibaba.com,
	kernel-team@meta.com,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 05/15] iomap: rename iomap_readpage_iter() to iomap_read_folio_iter()
Date: Mon, 22 Sep 2025 17:23:43 -0700
Message-ID: <20250923002353.2961514-6-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923002353.2961514-1-joannelkoong@gmail.com>
References: <20250923002353.2961514-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

->readpage was deprecated and reads are now on folios.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index dbe5783ee68c..23601373573e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -422,7 +422,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 	}
 }
 
-static int iomap_readpage_iter(struct iomap_iter *iter,
+static int iomap_read_folio_iter(struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx)
 {
 	const struct iomap *iomap = &iter->iomap;
@@ -487,7 +487,7 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 	trace_iomap_readpage(iter.inode, 1);
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
-		iter.status = iomap_readpage_iter(&iter, &ctx);
+		iter.status = iomap_read_folio_iter(&iter, &ctx);
 
 	iomap_bio_submit_read(&ctx);
 
@@ -521,7 +521,7 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
 				return -EINVAL;
 			ctx->cur_folio_in_bio = false;
 		}
-		ret = iomap_readpage_iter(iter, ctx);
+		ret = iomap_read_folio_iter(iter, ctx);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3

