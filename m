Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1C19C55E
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846575; cv=none; b=jlatD7JORFDhtR12rfcK/7h+W31xI1chQzhccFANqoxS+YJfxA0I9U+/T6Me/TfM7Plmfe7GC/mZw03ATZFClm0pwwD7gDFWLF9AWGItRR3e5zznJ7SJRcaJKxp6jjk8+Oq0zlZpi2JcQSK8ibzCpQHZYe9O4shodpnG7YciOoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846575; c=relaxed/simple;
	bh=s6mhJfy1wLr9wwae+98XWped88EO8RR6Rj9hVh2fPUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwV0gwzOQl3PfUGJdv645Ga+WMgNIWpyDTzhFO9UrNmWl/x1IyutmMW1/x1ODVJCMYkQ0x8+dTJ5zZXhSDboyzedFGZgSj4S9h2E+UqPF8PaIXzrpDnwuLUjdk/0Olj+BRzzN26yoik46ceXY0nEBU/fDpjHRxHwVf1n/T3g2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM2AkNDj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM2AkNDj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eed7bdfeeso4721455ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846573; x=1759451373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b5voxvHVAQ9evPBAMJkr0K4640egjfoU7iv7FHQ8OE=;
        b=LM2AkNDj6wNzRUiWXRrGj8H72x5v9FO2ZH47PZW7DoFbxWYb91OQBPRIfx64+WnGPO
         Wmdn+UiUT9dWBUS21y1ZK0+8q5FEUjpBQZEhWo+7nTw+q9lC1mHu8Q866MKSO/UDFYVo
         sF7oEU3/iXz5W2MH83TusynjOgnUEn16cN9QWCd156ZorxKMOJL3tIDhvJLCRZuuGKt1
         WQVA87hChY+VIvQaKOEymRaH9jWzNHnjqruFWod6Qzeib8NfAdFvdhHqXm3dewazpz4L
         K0DzqofrbMBdkBH4nW9zex6hFic7B8zKK0EIX1WAprjTMeFj8FdSV9VOzc0t75iuU8fK
         10aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846573; x=1759451373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b5voxvHVAQ9evPBAMJkr0K4640egjfoU7iv7FHQ8OE=;
        b=qb6H9Tvkt8VaioTJAXTflEMMnmrTm1qwydeKX9xN0IO5hSpvM29xyrNM4Qvhbv5HCB
         7VEo9pab0JGZMW/FsorAUuHwsiye7bWDmPBPL9inI338pWmAPMHBNu2kteuSsQGmQK0W
         kPqctJjvNciqD2a+Ul3DYVIp+AldReQOktzf7VzbdVeizidfl2Sq20s/EfdHwSWJWuqC
         1ULOfS3l9wY51yFU6QEd2c+8j3vpfilp98PiQawOvhBxms14A6JR+4OP7Pc7zZ8HCOAB
         UpSCCWR23mamyDDX5BV8Tj3z5VVtyTIiYE+D9BK4jtRnxPB/33nquSDX4m1EqgW8/0Hq
         /iQA==
X-Forwarded-Encrypted: i=1; AJvYcCV4cdFhn1/ZF2HYILtYL/K/NAkXjfiubokMiaXbzmq+9Ad0mkgpurNVI4PyR+bCkT+qLx+g62MA0HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmsd7GMCWfgTuoK51/MZsFlq/8jetOH1KMD7CMPuIBiJVGItOi
	smMZ4wKO5TLZelqAjqRTV2CyxIqLnL3pAP0OuVqSHxk+G5g7qUaFGzca
X-Gm-Gg: ASbGncsIPHIDEZy2eKZ42L7w6+P1M420pJemidesYCiMJpPIJxfMYWyWp3kM7JZ1jVc
	tzhTqN9Qs1X25hxQS0s0Ynovrab60hlQv0Q417Jtj/lrc+uLmpgQY6DF634WFrii2AC+pfUMSaa
	fqfGKNSrqibj7lEsESjuAJs4x6IFEovkaa1M7UPXl6z5TjvgJ53ylEO8Lw2RKnzwR/VzCnCQkVn
	lp7AkruPyU0GnlODJB3C8gdnbOW7Dx+MzDPJcAdVtiKxqQwcG4IVXtUVjtxvTPv3rt5ZfWQsiWP
	bp3gn1ov2XME+00dtKx16JI2AsXN3XGQmCN2YJ8yHRtc0VqpB69QN3BebWcNvT7ydJRRBo+HTfG
	cxHM5SL9NXvqEf35kpl+fCFd/OgVyPoYWwItpWsdm9YgKHo+V
X-Google-Smtp-Source: AGHT+IEHIVx4kLA4F6aUCgGEHZ0YDmnSl35bmhbet6WjaurCHoQfC42jLR71Pq42gzogAiSpCmWQBg==
X-Received: by 2002:a17:902:db0e:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-27ed722bb32mr50893315ad.16.1758846573101;
        Thu, 25 Sep 2025 17:29:33 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1d45sm36470675ad.141.2025.09.25.17.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:32 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 05/14] iomap: rename iomap_readpage_iter() to iomap_read_folio_iter()
Date: Thu, 25 Sep 2025 17:26:00 -0700
Message-ID: <20250926002609.1302233-6-joannelkoong@gmail.com>
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

