Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557C318EE5
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800050; cv=none; b=vGKBl0FnDiYHpnt9yjrbPm9n/DVHhwbayW9bwZvrBdDKo5wnzmQ+zONT12u5eFpXD34b27iQYpiVW88nXMsVRj6v5yss+ehIL68/MYpVveR9CfVeyKzw8o0lFO3Fpv6va1v4KQSYfUHPjsTzGL66jAEFZQsSS9x5X27w9LOIXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800050; c=relaxed/simple;
	bh=G0p06p4Oj55Eoe9gPvplGLniqIrk/l49GkW6H+icHvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBZcRLYS8DQDUuoyIvNJ45kt6jJx/oD3BEZJ8rlHSAVLWXB3bmBFHIOJWFCkZhp9qvjDAeYv6XjzylzGv4mvhX593hhvWtZW2C46eF+Ek5NV8fXmsgwGmJGo1suN77ifVZEHsy/SLyvS18YLA9zCmeCU9rTl3x8XV92XOrNoi3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFpr9umO; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFpr9umO"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-450b3f60c31so1049371b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800048; x=1768404848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO9EJ1SzMv+Xy0KnqPrEHfvHLOumowI49Qpx0L6iCR4=;
        b=WFpr9umOXk3BBFeUe/mPboHm7D0pgGFB+1BB2X7hNWI2t+0tyMml5JDSL1v35KrOQK
         9bSl416Mg7zGl+XaNaKe6fcqQDcSooHqQrP9M8+dG4qV3eMHeOl5QplIkjCYCdYTNyBW
         c1kt6GwVqdQMiT4BFJknc1tS5BA4eEPmeaY6mYi3xq12EmvIjG1KqrVocqOmStrTmNZP
         jK//xnxq4Gj1YVGIUhUC222VfIDWmQ37s4KglsjdH324e0Rue9802EMvRR6GVwc9NXyY
         lJeWfaLK4ThnjYD00slpHxKppa56s3xA15rsp8XCWUhWmYvlyp/FOlUtqCA/oQbzAc42
         syPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800048; x=1768404848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eO9EJ1SzMv+Xy0KnqPrEHfvHLOumowI49Qpx0L6iCR4=;
        b=JMi1kNIBZbDoWKMXmDqopeYGqpnaRrTgZxtsOcVIAqnDRNWoSZRR+g8sIbisCsBGbw
         yCjDkCx2hhix6zOH2DY+U0SQ74fZUGd3zO7EIWzYgLzW8KQM0FU45nKsHxhGw0rZu/l0
         w3RU41LuRmNx6v9mp978n5ZSiNyuXqfmyf2p4nP2fZ6iAgX84sUn1HCEqYAcCNfHijet
         6oAAi73FzNN86FpRDBudQX+x0U3UWCkuOrhfTzX+IMn3ZmBvdHxuDTVBdd2XzTt3Aq5V
         xXy5m+7zWlMGtwBHFbxw32EX+jW23t1FdGmwbODrbYK9Aw3Q91me5c55nsCvKdGhPFii
         t1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUQYm7Oe0bLZ8WARpaq8/gJ7aBNw6FU5K/iMQI42RU6sKupXPk06kH8tkgCPkohL2qFvkBwqXjbjkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpePfnVZtN8g3k1y39vgIBTNar9YQ+Ki7Ao2qyN1LLYkL1qH4
	pSoqowGQuUNWVzKwx/X0+Ql5/bKJo+PWKp85SvlqrrMwmbP+1pHiBsO3
X-Gm-Gg: AY/fxX7zD5om5qaRWfKoT8pQY/9inBEhIqNdwbHyu3HoTwKsbATLsMJA5lgR6lnga+W
	dghjRuAmsWWWgrDiwS3bkym2Qor3BwnZRHFGuwSUGWtnhmOwPwwUZEdXhrxY903jqGENnEzNEz9
	5RpBQeHHQJbZDONtfhqFYOlZ4jLCHyYGPXAClq5MHBE/NtKNftxkVBo9lPm2t7AlVISz/KE6+7M
	sEUUMNJ+KDSq/dF9WWQGg1pKYhSO3sWgjGFrYyMNzeUXT9NM+9nX5/RsotxWwTjXHx+3+9K6SRF
	QRUuAo/UzmUtdO8lQ87cZ2/BzWwWlA3F//S9UFgRdmCOZJy6/ZSZrP625TU2MGv/V1S7HgF7Iop
	P9BNhfJAGyBm3MOOZ+WECgVo0LKw3OLEzbBqLmjjzkXth214Ri5FegnFMOsdKj04/jYOuFYH8BY
	bjnrYUCjXnyrNlaNKI3v2CbPlyNeDF3vvfciV9Nveswqdi
X-Google-Smtp-Source: AGHT+IGtCDu0G6eYH3g3wT1M6IKy3YB9HAJ3+3EJ/cXXN1DdsBvhXWe62M+fG6NKVgTW6NRYPp6OFA==
X-Received: by 2002:a05:6808:18aa:b0:450:32f0:4887 with SMTP id 5614622812f47-45a6bdfd28fmr1087090b6e.31.1767800047653;
        Wed, 07 Jan 2026 07:34:07 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2f1de5sm2398106b6e.22.2026.01.07.07.34.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:07 -0800 (PST)
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
Subject: [PATCH V3 09/21] famfs_fuse: magic.h: Add famfs magic numbers
Date: Wed,  7 Jan 2026 09:33:18 -0600
Message-ID: <20260107153332.64727-10-john@groves.net>
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
2.49.0

