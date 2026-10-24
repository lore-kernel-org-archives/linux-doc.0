Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874379;
	b=eYFF0pV6h/iNfIiHr1jY20oIQ1XmzRpub2kShO+toyOxh6h0m4BYbXwWqGTD2vKSCYZF
	 C/Dk9cMAwnUFonCO0kFINtd5Q1lKsQMX05O5efiZAEkC5S3gDFekmc2fHdApaqkW9PT7e
	 wzCPABshSvlwIJDltnp1dmStyrTDOpbIpSkCOOJ5uNFH6mw4zEyI4MT9dWGB1AO1BHZ6G
	 pGloD4opdXBclZlhe1m/vPfeFIyesGUG6Up5owJaWNbUZ/1iiDz54Ea55N5gCfJ1x2Y6t
	 Dq8G780Mb4qYUhPBJCHAUbERJf4V6hmwgN49ICpqW7GhO5TMrFqWyTAx1E5muuQ3+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
	b=dWnDMZsAySWjYZwJNSdycNVe7MSbSDtCtPdIqKLXIWHMi5BpYfPhIoviZHTu6kg8xZUu
	 yUOC3w8QoKlr9JLBZ8Hx+Bbjefvk83k5lI4U/D6sCxWZSz78DlZEJ3niaB37CeRwREqYd
	 zyMPtIYb/+autME8mW9z2EVNvUabU+Ff6ECbcC3psxMNVrz4pNv5Pfob/N9MlXKd+XgJG
	 579V57tvpnWh7MZ/Q8iYKyfideR3VY+pH2VuvIgglZAKvl9fvqPB+MKx10jKxlFtiHZbg
	 KbcNxz26o08npyttWviFiWrRFFKMQtgFA6wPrvVYhlbTul9y49KvfO/Zbdepm9JREpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A41606A325
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 20:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A41606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so3468509eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874378; x=1793479178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=PMy7oqnbMqRkj+wlnM5ZI1BakhZ+3ZaFxEmgkOIziba4zAuFu8XH0mG5P5Yyai1H/x
         +QH+oK5OGdRNCa7sQFJV0r3uwyCNlybfzetfkXQCdSXhtWwMIYN4XSsw2/ehCbjHMx61
         /lUzF/kdZF8nGIwY8qI4yJ7YkI0kEqIe9gJBG9mvSHmV4lh34Kx9egnyECo+L/XAkAKs
         fcUAX3Fxrmtl7mnFyiR/AZrquRq8Om+TudZByRYZm5QWNl88CNw4UQ6U78BcJTtSRwcr
         b6Y3DoAYYNwhyJ69Q63fCQlrJaywk1UXgeILfti365/f0Sm1qzpquWykLni/Hq8wBnL7
         /oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874378; x=1793479178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=CNv27r8M/vFbAIvf1Qo4iXefIR6WalFRFFAjhHRQ3C2VzZ2ipcl9Y6mPgU7P9pEbKC
         5S8hoSQ4epv6Tmrqfx0rBy92/yph1e4fqA3xZKCob9rEIWdHlBviseiREX4X4ES/tE+S
         /2aW7nyFU9NT6uRh0StkUFjkFctqQv62Hz4iu1MTWSJcpYVvLeO+ezfbn4yEGlxcQ1VY
         FrSvluf9YapOdxVvn75xJ1wcd8enLTHSIwHn6B18Bd4HuIPbPDQl4/CEc8zGtcUVN4SQ
         yt9R9W6XX4VJnrGfUVJzVRyiveH1JOR/8rZrUUH2m2Kq5Xkto2QdmAxn+Rd94WaYLmoS
         kljQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmv6JhiDM3KpvJKoQUleE7voTK3uLq5br78sOrTiV0wlUNpAJ4l3rOVvFxQZmQbtS+3FnBHcM6MjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI925kMSJiBIv6TZ8/IM8wIMyEiN3nf0yirQ6zXlgvD9PTCe0/Z
	oAhmmItq75I6qLj+TCZ3VJXuwyfFYk8USW7oeX6PcOQlFxyEif3A4+pC
X-Gm-Gg: AYBFou1WilxjepfdUPIyxxFtbB4vSluftZqilyB32FLUvL/UknC2SoIL8KJJUQHD5ZZ
	ktCw1mDTuFXK1EnB5SBma4nIDNMHNHVlrZqPnE5S+eJM2zQ97Wi5dhoKJEZhUOuL5+JHNgDtHyM
	TJKvs/j3maLASGlf9kgh4LMWXJEk/HhfoVWYwTD3BRTmmphu5FZ/gcazm/UGQqivWCCkeeho7gH
	yC6Bp1pcMR6tfFkgcsaij9Ms/ipCB0/TxfALf3euoqy6lXAjyl5XZ0ZhCV4jlQlR34J2+ZLAc7C
	0LxtdZRsWW36rhJMdbEjuwkI+0/P/fmjSfZls5usIQSP0T6YMZZ65o/Fzoqr+tH37aUFtD0qS4V
	D9X+93+z/58zhJ2Upa6lLU0MmkolyHoqH4a9Gm22GqAQFUAUt+LudaZMn18BCRVgimuvD5KjvQj
	RMkNdk1NO2Euy2mX8u3dgfTe465ZT9XomXStPvyubzzf6ld5fs14BLsOhG1wAkjrU4uvSVbu0DD
	lW8G6MT14oEEiNc+uyBgw/FdulGKORPA3fB7E8l576wrgXZL7msJs3CC3yz0g==
X-Received: by 2002:a05:7022:204:b0:188:ecb4:489 with SMTP id a92af1059eb24-19937307a0bmr5814234c88.34.1792874378320;
        Sat, 24 Oct 2026 13:39:38 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:37 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 24 Oct 2026 13:39:17 -0700
Subject: [PATCH RFC 1/3] lsm: Call inode_init_security hooks without xattrs
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-landlock-created-rights-v1-1-77c8db3f6bd2@gmail.com>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

security_inode_init_security() returns early when no LSM reserves an
xattr slot, so the inode_init_security hooks never run on a kernel
whose LSMs provide no xattr. An LSM can then not use the hook to
observe inode creation unless some other LSM happens to label inodes.

Call the hooks regardless of the reserved xattr count, and only skip
allocating the xattr array when no slot is reserved. LSMs that write
xattrs still need a reserved slot, so they are unaffected. Landlock
uses the hook in the next patch to track the files a sandboxed task
creates.

Assisted-by: LLM
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 security/security.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/security/security.c b/security/security.c
index b284e24e3771..bb94c94d97a5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1353,10 +1353,11 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 	if (unlikely(IS_PRIVATE(inode)))
 		return 0;
 
-	if (!blob_sizes.lbs_xattr_count)
-		return 0;
-
-	if (initxattrs) {
+	/*
+	 * Even without any xattr to provide, LSMs (e.g. Landlock) may need to
+	 * track inode creations.
+	 */
+	if (initxattrs && blob_sizes.lbs_xattr_count) {
 		/* Allocate +1 as terminator. */
 		new_xattrs = kcalloc(blob_sizes.lbs_xattr_count + 1,
 				     sizeof(*new_xattrs), GFP_NOFS);

-- 
2.55.0

