Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267553;
	b=leSm6hsVLdgiS0uspONnFbyTtBabZhh8oXgTD8ozPrBVaEdYdUQpBynlgHjBx5L2MaR8
	 RkHjCZqM+N24R0jYWwlLuu3W3983qCapEM7OVShb2qPl0SFuu/R7sH9zkc9N/UMz9SW+y
	 ZGcaJaT45dZKzu7X32iTw02Kwp1zfsHZVWZGQO17biXPPCbxJXiV8s58+X4DjnrWezAPL
	 ELYI3cx1MDHZ7IlwhTqkMDibe1vcNTCynb+tzg5WC0VCERfvZNnDo1/Tlo3WL8h7RW9ie
	 /si9PizfzJzBYwAkXz+Moq1fm61b9Q5QTL2YMOJRq8+gRLVjovB4QF5t8JOzoyWMhyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
	b=p7ET369Wxu4qz90lfjBssZdVQoHoZywSSpK9lIs1M1aYvvijJS/DJKpIOR1GBDVaZlQ5
	 IigcuUvJTOqx1ZNl4rFm38miKvNtj7yNVnmma9Gc9ScDrVrJCc/OpQukfPxHTz61N2Dxp
	 rz+c0MskWqQdFhio+so/J692Hf2nD7Iqu2rbBX7oCdAjVpnpq9nHPZo755/C+jy5xzBov
	 MAlsk850INB93WGSe7A42CTVN5F8/NjMcj/BWUdZVzz+MMoDDzD0x9lzGzPA+4PLkpxpk
	 RZjF6gdtCjKbs9Vg5kcOd54ZzmJOIRuXC2rtoO25q/G7EuR+BODtdzjHfk9qDuD9KXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqnWLLS4;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82312606A32A
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82312606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqnWLLS4
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso6950445ad.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 05:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267552; x=1795872352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
        b=YqnWLLS4xwW+96B+d8I4pYLP3yTj7kADqb3LdxDnt4f9wJ6G6aey0lgseU/Ltggvil
         H0MXEb+JNeCssA0Tegz3ys0KcMXZqk3StTi2gRgnxREPO7wGLkqXEpmad7Y+VjpNu5US
         P9iiKLq4rmgLgjW4Z7GKMiJ7tQoa8oMF6gJL2uLgqsPpDUYWOp5HhDX5mfdEgnx32GWN
         oZ3gJ2wjlZIsuJbVe/YwwFJhk+6T7vYhIS7BzeBVhHDmFs6h50s9Nen92z3VuYZfB+mJ
         UOIidWtfUh0gPEH1lYcYNkJxucWVtDryDoaCa5nn87UOUB8+fAshQrLzJiVkFOVA1q0/
         vWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267552; x=1795872352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
        b=OwKku3GkWJmmPz8QGG4AlZmhptzBTRP5Dhc7+NBkowAfVgOB0fp7lIcEWNqNtOPLyx
         4UZF4Gpp3vG/B9k/5QXTbzPImrgvs3wh9Ob2wYlc2Lo7CqLTFsvlLCobgERwVUkI6X5n
         g00zfUnrR6X13ti+/Tk/FCX2uQek4XHaVWoSSfydwrP+TEsixv6DrFwj7ZUwlwCEQDtH
         653dKGB89ErYzERikEoo9cOvmhVvYJ5wUU6hYXL2dOKx6m68CK63Nd4xuzRlseJhykfI
         425HXJ3wiPUscMkpAgtJJIoi4qmcDIvaa02lyvaG9O5+Y0vSXXpayYmX/N76IvU01xrY
         NQCg==
X-Forwarded-Encrypted: i=1; AL+hErFfauQh/aLi97XT0n/4C7GXNrWn7ahRUobgiLFjpTAXEnlSoNUp8AaiW0bLMu56WiJxHanPAYNgE8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+It3MPuGrBWfwAompFsPYe2J//j9uH3utkN5inXnbWeCcZxNs/
	kFcoRe85OyQQP37mg25lf+nbu+AciO60nO8/tWkU8U1QBOs0pg7AUDk=
X-Gm-Gg: AZFdTZf1x6ZJaI/ompUelsBpp0F0gQoIrfWs+YN4T/oW/UaYKHvGouwp09toiV910CK
	xiJfPNcF6mKw8za4BPcF37d+sD9cAc75KqlT7Fn6/nDWYQZ5RDjxjmfnHTxWcIjpB6yL/sbWWMw
	80/Uy14FD3qHkVtrt30uXZkLiAG/U/a8RUH/o3Xf/Kg9UdZ0AE/PFXjyOKjE4J2s6K1YgbkWnZI
	HYBwHCPPpLWI9vRmEnyUIbYiul06E+fj6rEmoBxuuB7nBjts9sqkt3CgNky24nP/B3dcjJF6Y0A
	crFj5xlI0x537serz8REPvgPNiVrMALF2oBeM++ZLp72+QYyVNq8Fip1pllqFsch7hHAHDZpUad
	sNoQo7qSvIzHLP04wTvUz+kg5CnaZyp93Zy8LLW0a8b3FiHWp130MBAmqUOqxA+2eP84U7FI4Ay
	zHcHlspGz3Kue7L+tElEyw0crRDElUxk+BVtyKXmkV1C0Y7+IJdj3n8mYCFakXUVFWR9kX/EoF3
	HhPI4qg6cgyu6/eyCUBohYRbRktJV9nVzEEbD6/JZiiSLKm1IUA6aix2lcWFJ8mt0+GxSs5TnL6
	UgjnUv3FtKgZxyCaFt9zedCwIEZV6iBO4OoFQ5s=
X-Received: by 2002:a17:902:c409:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2f03f1fe182mr61390525ad.26.1795267551719;
        Sat, 21 Nov 2026 05:25:51 -0800 (PST)
Received: from archlinux ([2405:201:ac01:5300:572c:c4c3:6927:1f87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105bb2sm26620525ad.45.2026.11.21.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:25:50 -0800 (PST)
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
Subject: [PATCH v2] dm-inlinecrypt: emit key type as an optional table argument
Date: Sat, 21 Nov 2026 18:45:39 +0530
Message-ID: <20261121131539.7519-1-permissiontogallop@gmail.com>
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
dm-inlinecrypt device to be not reloadable, the constructor reads
key_type as iv_offset and shifts the remaining fields.

Keep the base table in constructor order and emit a non-default key type
as keytype:hw-wrapped in the optional feature list. Raw keys remain the
default and are not emitted, preserving the existing table text for
raw-key devices.

The two dmsetup examples in the documentation acquired
the same extra positional key-type field, so removed it there as well.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260525121348.1321282-2-linlin.zhang%40oss.qualcomm.com
Fixes: f9f57971da38 ("dm-inlinecrypt: add support for hardware-wrapped keys")
Cc: stable@vger.kernel.org
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
Changes in v2:
- Add Reported-by/Closes tags for the Sashiko review.
- Emit the literal keytype:hw-wrapped after the non-raw check, dropping the
  unreachable raw fallback.

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
@@ -522,15 +522,18 @@ static void inlinecrypt_status(struct dm_target *ti, status_type_t type,
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
+				DMEMIT(" keytype:hw-wrapped");
 			if (ti->num_discard_bios)
 				DMEMIT(" allow_discards");
 			if (ctx->sector_size != SECTOR_SIZE) {
