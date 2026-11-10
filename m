Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342269;
	b=SHuFgc1adDyIeMYI51lDfqHh/7JwZREDxkcUFI9m00jPuOywu1w7cvBSik2n3FRkZwus
	 E2o75nslBTUmr16gM1VeOjQTbqRNUR60S0LVu8ru3nE9E1BN9qVkwi2MRZuEp4yNFlBcc
	 Z3/Wy0ZlXq6e8hDKQeh2Mf5dmMmqVzemDRn4nigvtlCtdYwlLea/8JEfIgs22syV84abv
	 zxhNK4tv6LCghUuBjukw+4u0f4SBis9WewT0Sa7ah6a82+HmUCRAOjTNIca1Hyf0bhK0l
	 rM/loD9as541BIEXFJpw2cR0CyC631T6yTR8Rg3qhzXagqCSNiZahyLmCvI7jsuhY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
	b=rHGefoSFBkoW6xam8dFn+5d7OVNaInboxhZnuFXokffrZ3jnnC0D/sLRk1+hfuaOOTAj
	 ZlVbpaYJEetM6D1aWtTH94aLdQglpxorklTuOrkuGpXe21rPQmFm1eo1Biqq2FVPiw8PQ
	 1kZPTqssITB+MoqCDEYRBX/TemKLuCCivrZPgJXT/ogZOI1l5Ybt5YpdZ8fzD+cWvxoOb
	 hN1Q4DDJJm0nuOXsCtUJR36NrGMKqL42hYtuER6IwY5kHhFuxj+E/+0tY5zqY7ZcVoDGY
	 RjvibvMxHfKEufLO6nwgmg8f3sa7poSHDb/se0xp3lqTuPJHUd7s7fZx5kjIbaPKmkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jcqBjeP9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE44606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE44606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jcqBjeP9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4876639eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1794342268; x=1794947068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
        b=jcqBjeP9L1xp1JklGYM0b1vT5HG9543QwujHEfMVyjAPCMy1Z6a2WjLK/Tl762SFJi
         UfnBKtuHG7xIgvrcmWziQRbrx3Rl1pipPKXO3jAvVYOuhTQKXa2xyePhgc4jFBdyGKJV
         0OveURAQ+4+DKhtsqgMTu+6eiAg5d3BIrjSN4zl8G6KMfMYX5zo9p94MxmLBvOVFsjat
         FFEeM3SLOz7sUsMavU/8NkBT/oDHo1q+OEuEgBY5m1b8YIWPzvPr9EZWFUkvsmeruKGp
         RdTI4f0y9C5oqjnmTfd+7FvunT0vn04W+FqOHN0fvZf8UAAhYAx3SKfSg8Jit5ew2VTt
         +WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342268; x=1794947068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
        b=hnTdMNrAxRBrN99ck/rVUHg2z8fGX+WuNEBwOMu9O3hjzwuZVWjRU3CCiB4/6PSzNS
         SQRf/U4SyZ4vwVmZRX1UZQQqW1hBpXK++l+Bu+ujDp+diCE0GjhtcTn3rPSvSfOnn8bf
         RflSy8Ztyo7lHN6nX3+B7B5KwPoIb0IktcmoH4XLq7rbEzxjFd6OYDwde/WYCUkeezLh
         RJ9jF02YaUq86IyNbMp55+wxtboCjLdq5jniag0NEYFFOp2xQ5PrkSNtXmX7Mg5xJui/
         Tc1WOY1a/8tat7Robyq1bKD6lI08JWGeavlzlP3cqj1rTZ9LXV3NNwYiPiaGyiVQb++5
         yQHQ==
X-Forwarded-Encrypted: i=1; AL+hErFvm02YcPiUFDOyhbd8HOVyVM4pmYWriek/VRfPe0Eq+WvEago0tEmTMVG6tcb8izR1XzNMD96qpgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vgTnfkhKdCsZmGJUh5ssdqV+35Sw5ED9wV8HV10jdbHA+bNN2
	G3cNbaR15LvFpgMKHNxdBKQT4Fm1GscWoAnyNNY5Y6rkqzskLPdOvBHwMx2OPzOORA8Z
X-Gm-Gg: AYBFou2MEFhf9VKX65vt5HKbz8ImeNg18DSbqcO+ieD55bBQhb8oSgQko1fzPPId4PJ
	RV9CyY3UU6KDmrl7JmATxh0u+j/+sbS+x6lMk7KZ1qe6qlGk4rjZPOBDQW9VZbxcQHTMbvCnFeq
	p5VxO4ooJB6yGxwFb5VzexPdoc4gpp93mbfQE+FORy6ILArOoetT1aFt8zR+4J+BeVKsiGezjFa
	DDZA9eUA/v3sDJOrSScHceJNwWyviMVVZcHuLI5sJrQRZITm9bz1617YvC++86mtOhApv1L7wni
	vubJ5IKH+aiBngJWE37CYiZZ64XGzYJGwXePLN759UKgwYaV9eH2x6CdGKO96cSi399emzmnjOZ
	Tz9qIr15X+oNGBlnHRwKyY4uKifm69mWxdctvU9QKfW1CK5mELw5TNmoqfzU9j+2HTGqYHyTt7i
	oR6QdlRIzYmq98rOEg0phMSg1MjXxLuszXC2E4jx3hw3BNXuYY0IfWXE+wSTTIyBxSn3xedmKyA
	ac2KJj2cZGK2xLXRgLdSkvo+ws2AQXXjsPuqsN92g0FchHMnqkE6UlXc6X1Cez2PwiEFtPWn4iX
	hqnCWw8C02qWVdTCu2yV0eJceLbCrzEzLPL8Br7zoQX+vIxEHD4Tg+oO3IHhi7jr6BNKQRF0wYa
	PNPCW3rmRTrAjeKWxZL8GoOLt1Qpz7zNmBZYyhCLEh0/Ra4JJ1JjL4g==
X-Received: by 2002:a05:7301:488f:b0:376:2859:5b2f with SMTP id 5a478bee46e88-3768675d705mr516619eec.25.1794342268101;
        Tue, 10 Nov 2026 12:24:28 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:147:2742:6545:702a:2431:7dca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm10076615eec.21.2026.11.10.12.24.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:24:27 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>
Subject: [RFC PATCH v3 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Wed, 11 Nov 2026 01:52:46 +0530
Message-ID: <20261110202246.274-7-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110202246.274-1-harisudhan@armoriq.io>
References: <20261110202246.274-1-harisudhan@armoriq.io>
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

Add the KAP maintainers and the files they look after.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047a..0946d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14118,6 +14118,16 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-keene*
 
+KERNEL ASSURANCE PLANE (KAP)
+M:	Ketan Bhardwaj <ketan@armoriq.io>
+M:	HARIHARA SUDHAN. R <harisudhan@armoriq.io>
+L:	linux-security-module@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/securityfs-kap
+F:	Documentation/security/kap.rst
+F:	include/linux/kap.h
+F:	security/kap/
+
 KERNEL AUTOMOUNTER
 M:	Ian Kent <raven@themaw.net>
 L:	autofs@vger.kernel.org
-- 
2.53.0

