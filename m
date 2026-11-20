Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193195;
	b=uJWiZR0J37b5ZWL5eNxuyh03efMC4/6AKKVO1Kli1lUFI1AuzDg9dQ5sWbr6GVwZbHeD
	 rtLtl4jz+5JpEJ5kFg9ez+5wa+fJLTCF6+lUZOwkrw5jreTx7zZq/sf++WmkASI+ks4zu
	 /CqPD2iWS2wbVtirsregKS9kj/hek5ThkiPngTVWqW6qcWBTSsN4i/Zr87AZ/UpdSlZFT
	 qF7lRKBD8hU5kApqaD51AvCSq4aWRxEiV/zEWrhnIiWFkeaNxVmtGTPfNNYaMWbucu903
	 CQqphFCi0nzvElREqd7T6Qqes2aCPloetXrF/7faPDayOGMChcwTgHdfNbTu6jUj0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cVr6BO8LwnEwZj8CTAB9lfzXGWtsY28dFZWdaaxR7Ww=;
	b=k9MWurTKFeJu2AZ17+dr+5ouQ5gX0uLWgqcZyM9cgT8Rmc/CndkyzEXj1AQ0mL17XJeh
	 dg/XbOotZ9USC+n1IQY+6guCIK7cXAjZ0ogz3sJsmuBijLK6h+Fl1N9rxzFEiAx+61D8T
	 z0CFgmMMhGZpojdlA+kbzBz4JiT5q+lrYE3GuZLLPQxfQkqiBomq8spzF1tyTPOtgmtrV
	 YOgjt8MG3s1Xjy8/wbQiRID+MK0TTnkGVKW6LZH5d/ymPCjTQEgBmSiUmPLYaHAfKX8y3
	 82Z/vy1sC8bUrrA/iXLOKv8Kq1dJHtxXnyNAuZQRl+cvZP92zNIuauFB8Y0qzagfkVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7NAeGi0;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B570606A332
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 16:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B570606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7NAeGi0
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b3fa8df5c4so542731a91.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795193193; x=1795797993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVr6BO8LwnEwZj8CTAB9lfzXGWtsY28dFZWdaaxR7Ww=;
        b=g7NAeGi09wr8JjPjuKUNTWWapYXFBcGnJwYhH7yR9YcFTbSOmubvSocAPk3QehZj94
         WsvU3XCdrke8TmhICFklT1Zn+nlyi5uoaaWH+z5T8pGnXKwmtKzEUdrv1n4V26nb/wB/
         JmtNwopHnXpoLv/rVS3gSM7NqjKkJHQkSG3HgvAMvI5Y+AZ7B98ysNYyh8jZneCqcdW6
         dCoLLFjh0fiz0hncU/7PNH1xDktmSPVNnw/wQ87dS6f6iZqD18A+Qbp9pNOxRcfSDRBF
         4gPqvvHAOqOZCf9qM6NzEusJxQ3Zsh/AdhHCS1Hb4okPd+70ZuooXKtaOHeG9j1ngh24
         nnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193193; x=1795797993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVr6BO8LwnEwZj8CTAB9lfzXGWtsY28dFZWdaaxR7Ww=;
        b=gjEg7TxvpwA8Ytyd7A+r80zTSYMDZIrMMS/qaSDqBoKXQRy7CbbYJ3c2kI0tPRB03l
         VqJwDH0GZJVzJSNgYeQwgpciLM9q8xtDU+BA0i87EyTD6YRpW1S0CvR4QeeFA1q7HfuN
         qv9awd4kOOi1R8SfNV1CMooxnoV9bEAzS026jKOxnVcvR2kGjR9rWtdqe9dsXMsuGAeG
         0M/MQqZ1OmPjPalnvXASrIoFOy9nezwjdzAhLh8hTNFnRo3HyIOTlB/vxR6UuGwnRUz/
         ClhX76nB4AID8dhhFAwtp+blh2XqXI/jgfACnjrFzmFCum+3QjScBRYwW9rGOHdLR/6u
         /o3A==
X-Forwarded-Encrypted: i=1; AL+hErFBa+hLOFCmteBYnNTiki8aA/xCzS5tIli2WquOWx8OXqG6I3gJDci0x7LRmfoSb8YfoeYdzrZ/16Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/j+TuMXvP+scsYLsL/xN1P9+VcGC2C3omiosPOB8Q8L1xJH0m
	AS+G2kcr5Bv3N00EQoGRXoIqNrO1Cn+cZXQpgX+6KadVF6dYB5PI1+8=
X-Gm-Gg: AZFdTZfS22B3OW3W/FmADj6iRxl6ZbfbZg8GUGjnzdqj18aV7MjOzaJVrzXKNJ3tP0O
	BaoMeanffK+gAvjhFq/jTCsT0eoBiyOV6TNu+MbjYEVDNPulFQ6m+R94Wn6NWjHjkkW6iDchTo+
	ZDCwt2xyPbCAco2Sn0t7eswgHvl1QcU2yDBuDSBXMGScqleTTugYY68keno33HLZYbidt43geq6
	LULaO2cJzCAUJTt8mna8nlkZN8mVxAuJ4kbSAOY6h5fX8+lZ9aZnjv399cUyB49ZaSw4rBLBdDk
	8wkTQ2zj8ognKf22B2NTRwkZpbSEIRbQf/2ON14NtdFuXhszbFkd8C0Ej6Gn3XPCHmKGti1JFnM
	1Ao0pfxQG5YPGWrxTwIAZzaingAIUE6mVpAbaHKkeXYHFaz3BOwx/VmrivoP/eO89V7izf0IcxB
	+LYH90IFMGOgteOQj1S0u8v/LxNRajPIFJ4aJttv7IZTj3gDbx4RNwZCxyRKvSHtrlwUNiPC68+
	1AJ7uo3dYB3E2tkdgh1jMljA675JfDa12A1PwSrmBvu+Q2Zv3IC9VAs8JBH/fRXBQZBp3e+EhgM
	3hEGlAInI8Tn4L0vcbnA3WF5viljszNVakmnOUA=
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr3540757a91.66.1795193193511;
        Fri, 20 Nov 2026 08:46:33 -0800 (PST)
Received: from archlinux ([2405:201:ac01:5300:17d2:d5ee:24bc:b49c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm7903186a91.13.2026.11.20.08.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:46:33 -0800 (PST)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dm-inlinecrypt: emit key type as an optional table argument
Date: Fri, 20 Nov 2026 22:06:01 +0530
Message-ID: <20261120163601.114199-1-permissiontogallop@gmail.com>
X-Mailer: git-send-email 2.56.1
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

inlinecrypt_status() emits ctx->key_type as a positional argument between
the key and iv_offset:

  <cipher> <key> <key_type> <iv_offset> <dev_path> <start>

but inlinecrypt_ctr() parses the base table as:

  <cipher> <key> <iv_offset> <dev_path> <start>

and keytype, is an optional feature argument parsed by
inlinecrypt_ctr_optional(). Resulting in STATUSTYPE_TABLE output for every
dm-inlinecrypt device to be not reloadable, the constructor reads key_type as
iv_offset and shifts the remaining fields.

Keep the base table in constructor order and emit a non-default key type
as keytype:hw-wrapped in the optional feature list. Raw keys remain the
default and are not emitted, preserving the existing table text for
raw-key devices.

The two dmsetup examples in the documentation acquired
the same extra positional key-type field, so removed it there as well.

Fixes: f9f57971da38 ("dm-inlinecrypt: add support for hardware-wrapped keys")
Cc: stable@vger.kernel.org
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---

diff --git a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
index 8258a72f00a8..84dd2e6a1b26 100644
--- a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
@@ -119,11 +119,11 @@ using dmsetup
 
 	#!/bin/sh
 	# Create a inlinecrypt device using dmsetup
-	dmsetup create inlinecrypt1 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 babebabebabebabebabebabebabebabebabebabebabebabebabebabebabebabe 0 0 $1 0 1 keytype:raw"
+	dmsetup create inlinecrypt1 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 babebabebabebabebabebabebabebabebabebabebabebabebabebabebabebabe 0 $1 0 1 keytype:raw"
 
 ::
 
 	#!/bin/sh
 	# Create a inlinecrypt device using dmsetup when encryption key is stored in keyring service
-	dmsetup create inlinecrypt2 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 :64:logon:fde:dminlinecrypt_test_key 0 0 $1 0 1 keytype:raw"
+	dmsetup create inlinecrypt2 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 :64:logon:fde:dminlinecrypt_test_key 0 $1 0 1 keytype:raw"
 
diff --git a/drivers/md/dm-inlinecrypt.c b/drivers/md/dm-inlinecrypt.c
index 3479dfe5f708..c4a0501e7b9a 100644
--- a/drivers/md/dm-inlinecrypt.c
+++ b/drivers/md/dm-inlinecrypt.c
@@ -522,15 +522,20 @@ static void inlinecrypt_status(struct dm_target *ti, status_type_t type,
 		 * the returned table.  Userspace is responsible for redacting
 		 * the key when needed.
 		 */
-		DMEMIT("%s %*phN %u %llu %s %llu", ctx->cipher_string,
-		       ctx->key.size, ctx->key.bytes,
-		       ctx->key_type, ctx->iv_offset,
+		DMEMIT("%s %*phN %llu %s %llu", ctx->cipher_string,
+		       ctx->key.size, ctx->key.bytes, ctx->iv_offset,
 		       ctx->dev->name, ctx->start);
 		num_feature_args += !!ti->num_discard_bios;
+		if (ctx->key_type != BLK_CRYPTO_KEY_TYPE_RAW)
+			num_feature_args++;
 		if (ctx->sector_size != SECTOR_SIZE)
 			num_feature_args += 2;
 		if (num_feature_args != 0) {
 			DMEMIT(" %d", num_feature_args);
+			if (ctx->key_type != BLK_CRYPTO_KEY_TYPE_RAW)
+				DMEMIT(" keytype:%s",
+				       ctx->key_type == BLK_CRYPTO_KEY_TYPE_HW_WRAPPED ?
+				       "hw-wrapped" : "raw");
 			if (ti->num_discard_bios)
 				DMEMIT(" allow_discards");
 			if (ctx->sector_size != SECTOR_SIZE) {
