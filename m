Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581232;
	b=0Hy57VpRDRmz0FGaQ4RyVbd4L7vFnjQ97C986IaObYX4NvsFUd7wJqI4vL1iZfUeSwdI
	 V9Q49xoCCApOX/2qY13T+WMwm++GH499qOOeOlYUJaIPPuYL0vcKGTSxcVPMfMnOCgA/L
	 zdAQS4jy5vBYOuQheRdUEv/rn8ZOGCyK4smtxxswccYSkfL2TmFr/NCGhR0zAZSuDq/Pz
	 DSVv7Vh1r1ktIS50W0Wd7GIBCNNKrsQwAGMx764R0ck8KJ/1QP0I++5LNMbGu8m39SIn1
	 XJS5qLT/ZS+ItsVAA5X8Y8oGnfgDLDkAOtebuhmeopVusr6smYQAo1t7LU5gGA/QqYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
	b=A4ffaEbEi+f/0pO0Ovx2HMRyB3D26Jqxlk11qNmK4Y7PxvS1Nye1ThT2qH40hYfJm+bT
	 Lp24dUeuvwfcA17BT8BMvY1h4jrnJCLomfpFTkuUZzKb/KV6N8U3Ao+ZSNzqzaGX8zJtO
	 9hLuxW+cLl0v5uHqgbQvH8U3rM+wwFgv2ZEuFK3nGBj8Cvpv5CcsxGNtIUuQD7vnD6bWi
	 3awGZg2xYmImkRYpf6LhXr+ZNwbbaKXTXATdMHFCSn6fp+hquGwnAG/IccTnMaVEaO8X2
	 jAAGXVRuNpS1YETmnQvttDKTPkP7zS59pmktZ2S81PFs/r6ECS0/Jp40kGn8MqB9RBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chH7IhID;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE47606A327
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE47606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chH7IhID
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070781f63so2484216b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581230; x=1796186030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
        b=chH7IhIDzACP8OdWe6XQSwvgLN46Ccc4YnceYIjl+QYGKvD2HEUIckvJNd7O/8NhV9
         2ixcuGQV6b4TLrx4eDMzssY2gGhHRu6U22govbaCr86P3AZgDko75glJQ+jL08bOh3NF
         vyyzhtqxuF8ssWyN/8ort/BNVniPt4A/Txlgh9jKZN4jIATw7HE7MmxtjoPj1+PF5CZX
         +rd0h7wMPwzJBc5RaNTXwitLiOLzZYW2MnX+dbwadEIEywjmPuVEKBD8/SzQeoGnbnUJ
         bsldSqg6udiR+dD+MECf6DgbnNYrmZb5sCUte9fU2VCy7BF6ZNO04zKs/IRokn1zhn/M
         Kghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581230; x=1796186030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
        b=AG/4sBpVT7/U+ylvuHw/AyOwjNbou+ULezRgaRDyCa3g+1LnE5g56w2NfAaJdoxUPz
         g2frDvxDdzBVUEhnvblfalAue+wt2CLsXaFgpav/m2+6R6Z8+2gpWNh7jq0xgbF8GuI7
         JhnhYXu4knrG6c5nzAiB0fMdNAe9uypko43n3UFF0gVygD8Yy8j6FPyzISQHRr4hFNYQ
         oR4XnPUIpZ8PLTqV2MRp2L8Y2+1HwjiZ/iKJepC6VQ4UngA7wCn414zrXWX+KjUoVFMt
         JoqqTFh6Qi9jf04wN1ReqRSgXgoasFyz+ua9J9I2Nl4sGn0DemUUeFGl6X9X7FvE27+K
         agEg==
X-Forwarded-Encrypted: i=1; AL+hErHcvPyFKLcUe9C5VTW9mjdlo5jNnYhNafBjyGuSDS1mxG0xnNzLBfHsn8kagak9S2UiiwTQUT/oC1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f/dmfqND+lXJ8mRIahcfN66KWJtD10LXh551nx4hAnzI4dedQ
	sznMkktOaNLLrYIc85E6oy2omS1oz5wdr/551SJusiohBoKRh0Nzss/PxDgtz7cG2dk=
X-Gm-Gg: AZFdTZc6Pn+LZdgc+BpVWxpWVZ0+AveeENavVU2sL1mp0ZXx6v24DwDaaRIgG/d/rMS
	bo0FbG7gR+MpIvlJXvTJaFsvAXaX0+r4/YIBxnRaw/xra92LKnQviGXGToaQUFhwpWgNtM0FS8R
	uWq/g5aOS7EePJUIb2IYHf7M4XAt2PfQQevKkN1bscEvm7sBHZz6JB6i0XUeTljW6xz08u8Wfdd
	jxFbPm908dMt3Z2bgJ5Y9x4lD5XmgqVhWyrFYum3l7/I8iggIBqslwLKOjJ+a7hferpvlaRDFmQ
	t8A9X4iqLVIbh/f1j3B2Y2HaTLCPpsN+S7d6eYdYtniGDhP8bV2tZpGl1hk/cGDFqTwRXjuSaTM
	5kfZqE+k0GijEqI9QTYOEj6YAaZFu588EC3KT51nQm84GNiDO+ozR9z13EYs2FhSk7FyyoxW+b1
	Y723GY4cxhD0nyVMDk+gjqBpUqUsjsvBrApAB0b0z7GsiF50bPoWACHFvdK8UsFyoMBwW3/UUdn
	RF9sJjPTWprZZe90BFrjyp9MvFYwL3SG3gMMIp6BPTnl/6t4bYjfaDKQf7r5JDZ26+b8xZCGkIm
	gSUgj5BVCJ7aPn4DHyGg3OHAHD2Lwkdof4NNrRF2s52dzTLr1loex0bjUJgauYPGdxBcurQB38f
	R4tKnmBsCdG6WkjHDTqfSlpuah0Qw7eumPbAD51T5vR946+6YhoeB3OHKBCDSR9mSseaoeQ==
X-Received: by 2002:a05:6a20:7f8e:b0:3f8:c7b1:6899 with SMTP id adf61e73a8af0-4014bc49db2mr17569291637.42.1795581230367;
        Tue, 24 Nov 2026 20:33:50 -0800 (PST)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8528812b3a.36.2026.11.24.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:33:50 -0800 (PST)
From: Peng Yu <yupeng0921@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: Joe Thornber <ejt@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH 1/2] dm thin metadata: report uncommitted state and refuse commits after a failure
Date: Tue, 24 Nov 2026 20:33:24 -0800
Message-ID: <20261125043325.138351-2-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125043325.138351-1-yupeng0921@gmail.com>
References: <20261125043325.138351-1-yupeng0921@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two flags for a thin pool:
* commit_failed: Set to true if a commit failed. It is a fact that may
  be caused by IO errors.
* refuse_commit_after_failure: Set to true if we enable the
  wait_for_commit option. It is selected by a user.

If both of them are true, the user should repair the pool.

Add a new field:
* changed: A new field of struct dm_thin_lookup_result, set by each
  lookup that finds a mapping. False means the thin device's metadata
  in memory was the same as on disk at the time of the lookup; true
  means they may not be the same.

Add some helper functions:
* dm_thin_uncommitted: Return true if the thin device might have
  metadata changes that are not on disk yet. When we get a commit
  failure, td->changed might be cleared, but the metadata changes are
  not on disk due to the commit failure. So when commit_failed is true,
  the function will always return true.
* dm_pool_metadata_set_refuse_commit_after_failure: Set the
  refuse_commit_after_failure flag.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Assisted-by: Claude:claude-fable-5-1 [Claude Code]
---
 drivers/md/dm-thin-metadata.c | 61 +++++++++++++++++++++++++++++++----
 drivers/md/dm-thin-metadata.h | 14 ++++++++
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index e60e1326376a..7b56c970a524 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -221,6 +221,9 @@ struct dm_pool_metadata {
 	 */
 	bool in_service:1;
 
+	bool commit_failed;
+	bool refuse_commit_after_failure;
+
 	/*
 	 * Reading the space map roots can fail, so we read it into these
 	 * buffers before the superblock is locked and updated.
@@ -972,6 +975,8 @@ struct dm_pool_metadata *dm_pool_metadata_open(struct block_device *bdev,
 	INIT_LIST_HEAD(&pmd->thin_devices);
 	pmd->fail_io = false;
 	pmd->in_service = false;
+	pmd->commit_failed = false;
+	pmd->refuse_commit_after_failure = false;
 	pmd->bdev = bdev;
 	pmd->data_block_size = data_block_size;
 	pmd->pre_commit_fn = NULL;
@@ -1020,10 +1025,15 @@ int dm_pool_metadata_close(struct dm_pool_metadata *pmd)
 
 	pmd_write_lock_in_core(pmd);
 	if (!pmd->fail_io && !dm_bm_is_read_only(pmd->bm)) {
-		r = __commit_transaction(pmd);
-		if (r < 0)
-			DMWARN("%s: __commit_transaction() failed, error = %d",
-			       __func__, r);
+		if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+			DMERR_LIMIT("%s: refusing to commit after a failed commit",
+				    __func__);
+		} else {
+			r = __commit_transaction(pmd);
+			if (r < 0)
+				DMWARN("%s: __commit_transaction() failed, error = %d",
+				       __func__, r);
+		}
 	}
 	pmd_write_unlock(pmd);
 	__destroy_persistent_data_objects(pmd, true);
@@ -1351,6 +1361,7 @@ static int __reserve_metadata_snap(struct dm_pool_metadata *pmd)
 	 */
 	r = __commit_transaction(pmd);
 	if (r < 0) {
+		pmd->commit_failed = true;
 		DMWARN("%s: __commit_transaction() failed, error = %d",
 		       __func__, r);
 		return r;
@@ -1397,8 +1408,15 @@ int dm_pool_reserve_metadata_snap(struct dm_pool_metadata *pmd)
 	int r = -EINVAL;
 
 	pmd_write_lock(pmd);
-	if (!pmd->fail_io)
-		r = __reserve_metadata_snap(pmd);
+	if (!pmd->fail_io) {
+		if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+			DMERR_LIMIT("%s: refusing to commit after a failed commit",
+				    __func__);
+			r = -EIO;
+		} else {
+			r = __reserve_metadata_snap(pmd);
+		}
+	}
 	pmd_write_unlock(pmd);
 
 	return r;
@@ -1516,6 +1534,7 @@ static void unpack_lookup_result(struct dm_thin_device *td, __le64 value,
 	unpack_block_time(block_time, &exception_block, &exception_time);
 	result->block = exception_block;
 	result->shared = __snapshotted_since(td, exception_time);
+	result->changed = td->changed || td->pmd->commit_failed;
 }
 
 static int __find_block(struct dm_thin_device *td, dm_block_t block,
@@ -1796,6 +1815,17 @@ bool dm_thin_changed_this_transaction(struct dm_thin_device *td)
 	return r;
 }
 
+bool dm_thin_uncommitted(struct dm_thin_device *td)
+{
+	bool r;
+
+	down_read(&td->pmd->root_lock);
+	r = td->changed || td->pmd->commit_failed;
+	up_read(&td->pmd->root_lock);
+
+	return r;
+}
+
 bool dm_pool_changed_this_transaction(struct dm_pool_metadata *pmd)
 {
 	bool r = false;
@@ -1836,6 +1866,14 @@ int dm_pool_alloc_data_block(struct dm_pool_metadata *pmd, dm_block_t *result)
 	return r;
 }
 
+void dm_pool_metadata_set_refuse_commit_after_failure(struct dm_pool_metadata *pmd,
+						      bool refuse_commit_after_failure)
+{
+	pmd_write_lock_in_core(pmd);
+	pmd->refuse_commit_after_failure = refuse_commit_after_failure;
+	pmd_write_unlock(pmd);
+}
+
 int dm_pool_commit_metadata(struct dm_pool_metadata *pmd)
 {
 	int r = -EINVAL;
@@ -1848,9 +1886,18 @@ int dm_pool_commit_metadata(struct dm_pool_metadata *pmd)
 	if (pmd->fail_io)
 		goto out;
 
+	if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+		DMERR_LIMIT("%s: refusing to commit after a failed commit",
+			    __func__);
+		r = -EIO;
+		goto out;
+	}
+
 	r = __commit_transaction(pmd);
-	if (r < 0)
+	if (r < 0) {
+		pmd->commit_failed = true;
 		goto out;
+	}
 
 	/*
 	 * Open the next transaction.
diff --git a/drivers/md/dm-thin-metadata.h b/drivers/md/dm-thin-metadata.h
index 2f64f48b5f19..d7b149471e0b 100644
--- a/drivers/md/dm-thin-metadata.h
+++ b/drivers/md/dm-thin-metadata.h
@@ -81,9 +81,16 @@ int dm_pool_delete_thin_device(struct dm_pool_metadata *pmd,
 /*
  * Commits _all_ metadata changes: device creation, deletion, mapping
  * updates.
+ *
+ * Returns -EIO without committing once a commit has failed, if the pool
+ * asked to refuse commits after a failure (see
+ * dm_pool_metadata_set_refuse_commit_after_failure()).
  */
 int dm_pool_commit_metadata(struct dm_pool_metadata *pmd);
 
+void dm_pool_metadata_set_refuse_commit_after_failure(struct dm_pool_metadata *pmd,
+						      bool refuse_commit_after_failure);
+
 /*
  * Discards all uncommitted changes.  Rereads the superblock, rolling back
  * to the last good transaction.  Thin devices remain open.
@@ -112,6 +119,10 @@ int dm_pool_get_metadata_transaction_id(struct dm_pool_metadata *pmd,
  * operations only.  A small performance hit is incurred by providing this
  * copy of the metadata to userland due to extra copy-on-write operations
  * on the metadata nodes.  Release this as soon as you finish with it.
+ *
+ * The reservation commits first, so it returns -EIO once a commit has
+ * failed, if the pool asked to refuse commits after a failure (see
+ * dm_pool_metadata_set_refuse_commit_after_failure()).
  */
 int dm_pool_reserve_metadata_snap(struct dm_pool_metadata *pmd);
 int dm_pool_release_metadata_snap(struct dm_pool_metadata *pmd);
@@ -136,6 +147,7 @@ dm_thin_id dm_thin_dev_id(struct dm_thin_device *td);
 struct dm_thin_lookup_result {
 	dm_block_t block;
 	bool shared:1;
+	bool changed:1;
 };
 
 /*
@@ -175,6 +187,8 @@ int dm_thin_remove_range(struct dm_thin_device *td,
  */
 bool dm_thin_changed_this_transaction(struct dm_thin_device *td);
 
+bool dm_thin_uncommitted(struct dm_thin_device *td);
+
 bool dm_pool_changed_this_transaction(struct dm_pool_metadata *pmd);
 
 bool dm_thin_aborted_changes(struct dm_thin_device *td);
-- 
2.43.0

