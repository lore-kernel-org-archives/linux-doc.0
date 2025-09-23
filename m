Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544021A457
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587651; cv=none; b=XmsISmgcxxDfyGJKlZR9SSE3vMh/VCn5gjZ7+e2QmEMHUM8769C0oOH3Kk8Osc7CfgOB0114jXqE1qy5YxGr+eO4vCZhCEuhgJMeNWR63BqgpTiypu316htWD/uwxPCjCvTA46IPEO1/QVMy7neOAI1aVTttwyF0dzJf7yWcZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587651; c=relaxed/simple;
	bh=6gl5Z+JZLYv55qqXi1LyVpN6JlxHo4rap/E6cwLJcX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/ocHnnLHngy6ZfevgdQMeMyqhWbQspzvjz+Z1Xj8GM0JO5Emfw+pu8X3UGYR+wVvs3nqw0B3hB+x6gC/6YnpoYokn1yp8RcV/tbKB1bdR3S25IQ2XdI1vBjM/a4fDkaJ7nrTfF15YXUZnfmiiu3L3Xkr1miEosh2qWG9D6tYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQg1+N+I; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQg1+N+I"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so1777522b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587649; x=1759192449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfDhWqoAEKFVOf/mlnVW8HkSqt5eAKrI9BC9iX0QNTA=;
        b=VQg1+N+I6wgsWicFvuceUi3taXEX7Cl0HfJPJE38vcy02wS6sCakS/hxZtj8R+zidX
         9pgie9tLnptq1T5yuBaDarZ/b7b+TIhnoHx4zjaPPWBoAFHeDpO2D0j4kFAi3npX1JUS
         y9EryXy8qmfWMgFUSAyQhXlIY8jAHFMSQwzhgvoyswQN2yWBHYmCAzO00VvAHfXb9oFB
         8Ak0f1xuLZc9UC5RM2f5Y/1Ga1jWp+0oeiIZLQG6xbtUd0T7HeauNFMbKKEoB5Yq9YBF
         ufJN43/LEqAn98LrbQoSaAfc1C/miwwebzbhWiVrIlT2Ztwt8YS/U7quNL0yOUPB+lqJ
         CASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587649; x=1759192449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfDhWqoAEKFVOf/mlnVW8HkSqt5eAKrI9BC9iX0QNTA=;
        b=qLRhx6BaRgJnpUs+uMRZyvyyq6c4rWSzPa6lZ8Vpb/ZJovgFymnIOSXyKGeogF9i/d
         xFSstRxC5zVIpOVEa9QY1P3yuogaLT464S7GvTr1SJKVE2dXpj8faRH2RSFjEKmeVLjQ
         cK41zrPq/11T8+QFnxLQrenNO0ENS9gsVS+l3lxoBk9O1BeqxaRM2/GctuNcVhpbiitN
         /kNQKFGqMC8qiP7IdFbPLrGd0YjOdKnRIZ2AzYCTQV4WwO9nRDvSvojr2HM5zW8e8aay
         SbTbCSxieCp7aYtbkz4KYq3cpu2ZcfJydiKHjN/ZlHRewzLtbb/1qT4SD/D1uA2mTacc
         kBVw==
X-Forwarded-Encrypted: i=1; AJvYcCV0XxmP/e4T53udatbu969wMZUK7/8zIukIhEuREf0t1wGj7PNI3wXOV16d5SqAFDEyNpmfDqivO+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp385NKfGSDBLz2HgBW99KoXVDMZoMVUfvU21ZtVvCkWQ/+717
	kyCVXFlNgbir1uKSRlvOiamAFdVWNNMh4RHwU9PMqCvenOcmSh7kZxDx
X-Gm-Gg: ASbGnctAtme428tDavFKz3q+Z6/RCHYX71BTZCDTmPP8fUorvh4HVjQ+5Raj4kVFHgP
	S1nUUeaxeq6S1o1yHSIusSeth1/OKhTXNLxM8cqyKUPxCXgy8mTpx4znf6d6NxVJEtp/4jL8lIh
	Ib7kBeB8oTTJmyezSEPc2XlFVWkqVJW09OfcxcYDneoD53+oAHp4x22T3tC/PSToZ5Pf3rZg5Bg
	WLf8FAuWu6k9nYFrnCo6jTMWzFIz/iyVIYYCkCHFqM9tWwJmRYMym+uZ+0xjGcBsQAS2b/9HGuh
	0YpyM0vrx9RjRTqq8oivMS9hTp3wxrP/Hcr2UuqNSXAh4aL7s1s8XhC9XZ32uDGRWIsOE+LUdKm
	+QGSEpFN4SdN/gv5M0sE15PaWgi210NGqoiQQJptlklLCBuPu
X-Google-Smtp-Source: AGHT+IHwN6QET28Com0mnDzTsPnGxiZ9CeU+qh1qBSs7SYJ7KF36Ej3bcT5nNRqK/1il2tMZr28MWQ==
X-Received: by 2002:a05:6a00:4fc6:b0:77f:5357:2c07 with SMTP id d2e1a72fcca58-77f53b64b19mr919389b3a.27.1758587649243;
        Mon, 22 Sep 2025 17:34:09 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4fd7223esm1127430b3a.103.2025.09.22.17.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:08 -0700 (PDT)
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
	kernel-team@meta.com
Subject: [PATCH v4 12/15] iomap: make iomap_read_folio() a void return
Date: Mon, 22 Sep 2025 17:23:50 -0700
Message-ID: <20250923002353.2961514-13-joannelkoong@gmail.com>
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

No errors are propagated in iomap_read_folio(). Change
iomap_read_folio() to a void return to make this clearer to callers.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 9 +--------
 include/linux/iomap.h  | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index ed2acbcb81b8..9376aadb2071 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -450,7 +450,7 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
 	return 0;
 }
 
-int iomap_read_folio(const struct iomap_ops *ops,
+void iomap_read_folio(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx)
 {
 	struct folio *folio = ctx->cur_folio;
@@ -481,13 +481,6 @@ int iomap_read_folio(const struct iomap_ops *ops,
 
 	if (!folio_owned)
 		folio_unlock(folio);
-
-	/*
-	 * Just like mpage_readahead and block_read_full_folio, we always
-	 * return 0 and just set the folio error flag on errors.  This
-	 * should be cleaned up throughout the stack eventually.
-	 */
-	return 0;
 }
 EXPORT_SYMBOL_GPL(iomap_read_folio);
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index c1a7613bca6e..f76e9b46595a 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -338,7 +338,7 @@ static inline bool iomap_want_unshare_iter(const struct iomap_iter *iter)
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
 		const struct iomap_ops *ops,
 		const struct iomap_write_ops *write_ops, void *private);
-int iomap_read_folio(const struct iomap_ops *ops,
+void iomap_read_folio(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx);
 void iomap_readahead(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx);
-- 
2.47.3

