Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A073B47FD
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477110; cv=none; b=QJ4su1TPHHCV7Dvs/n5vk3hEsnEF1u4pDA1Pz5xd0p0exQGFbQg78Waz4LbHl38AX8Yc7eSLl8hnt2WUahSXpegkT6MMimaFTyOolOWr8XksEDR3Hg4XyyWutQEsSEtxAGb/vi7GzYThiVWCCkUv6GeCrlfanShdKVwaSJpSQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477110; c=relaxed/simple;
	bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6iuMFbsTZypIAOSoPCNXp0Qv9alwVEX8BlJSyoeOT9gDUmr3LGcvtroMnMLzzy5QEEg2yXNn3yRIfCSFaI3YXCGoZ0/VMcdioI5EY6OOlzTWjXFYG8qLWU8LuKAbGOVVrxKpDPG9FVM2VHOBaFGF5GknyUJWFTFq+ASMdQFd68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmponPKp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmponPKp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4896ae35be9so93437b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477108; x=1784081908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=kmponPKpgb5B4dwGxbKJhfF6/mkTx8UP9lZBZ5oSutP5V6U0ixh8T/sCo2sK6I6NUR
         8du3FDdzuoQMB49QfDn/nemm9S50j5+S10/mm9Y7rEkKVzefs21Lfep3BnK1V9uZz9TE
         gBajGwCB7SRhmFhX9umvzmAM2TkJR1PONwwAZVfcjHsia7So+B7AMfjjz/tdw9jCD4+v
         DHctaF1HXyxyDt3WHgOZLSVYLDwfZOJJvcy2x76/+MFQ4IjFfVULiSiWNcYxoIncgxia
         dPKixl4tELyhbC7VJz2uGd8ppRX61MXjuJtRir38o8BQZg2OvelYGt30y6OdvdIgb+vV
         9fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477108; x=1784081908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=YkP7d/HyMoO5N9dk7SmQawzpxXMaJc92hDeG/j32XOvoM6mqdBTSqNFgCY4HkQFTHE
         VeCwFLfk62curAJ+uc9QFQPrYCHkHQrNmxsgF46jLIG6VjCeTt0t5RRzh8UzRlE4k5KF
         SuEJN0ZtABZ0rFui7LoyqTj2UcjMn5ShZ1QZLKQ3SRHruKO2NUfPzgEYJm1opZJGEwj4
         1/FDOcf+902lhe94jwitgKqBnrLbHCYdAGREbMsgIcb8r4j5z1aG2k77i3zPrWYEewtf
         dmd/yCbSw6IKmy3mKty7IBH9w+1yKb3+yuoowJDSbyKq2WBT0ybla3agXrigkDzQDrLH
         urTA==
X-Forwarded-Encrypted: i=1; AFNElJ8l4bPc+9g3wBKBbRJ7UNFnZNcyob3BdZv6chPVs1J4E6ED08i2V5funR15Hn7sX+1npD8fYjWCPWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7F5bsKamN1qNlwciZuZSHqvvfyperg5k8mPWXRwsbXrJhcWa
	0uu4/aOc2DOCb3R+W8dtSVSWSlD6jjRTABcvk+l2Do5XRnXLgZOeyqmO
X-Gm-Gg: AfdE7ck3ePjSWAl7kjO0fDnJJs9x/1uhXYidm1Y8fvkP60i5hA8TjtLAWqPa/KCQfRI
	/+yn3Ff62zJuyi1Mg9uegupo7TsRA1DdAMq5370BmChEF9JR/je635b+VTxXqVVPKwpXWPWFX8g
	sS2vpE/eOkb6WKEgioof2csSfCnB1MaTicXSOKmTZgY3KErFECw4nOew1dUCTThwITZs+C5axll
	hNtafBdr0InRQeOR7Q9MlPvRE1WWuG0b1yRQGeabvlLhUTmSPhBiJwAWkkmtlkF8e9/Rd7+vn5q
	ka+/HACQP3FeSfYzawh/EQVXyEyIU087PPVfwz6Aw+GDEPsKKR3KJbtDf1R7KYWoQDn3Mod6K9u
	/kUWzIQVrkftO6uBs5ldyYViqAF/mBbc/uZ0pKTpSTR/QLKiBNsrsZvGoKEGnwSDJ/mg4TxqscM
	PEHzeuNGNkTFKk/wU3t78MeiiKLvXRomMZarrutjOuU68aQqx8fng=
X-Received: by 2002:a05:6808:1301:b0:495:f67c:d96a with SMTP id 5614622812f47-4a20264e162mr418615b6e.12.1783477108113;
        Tue, 07 Jul 2026 19:18:28 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:02 -0600
Subject: [PATCH v6 02/24] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-2-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
 b=SW23dhkCOL2pSCo6EH2WYcPsMXMwsLEFgTbnzKPCXHy+TJuLv9grtIQXaj7l92AGZ85zaQDO0
 mPpMl6EC6ViDb0cLrpFnIMxdam2Jl2qUBgCdf4+kuCsDM0rZKd2SFlv
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 8c29293ca7fb..268cdc34389b 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */

-- 
2.55.0

