Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434306;
	b=Z4iSPiULs+IH2SktfZBcpVcohnzOYzVg0trwirHCe4N0UCtVJcbUqa0+4Y4SQBJkqJ7i
	 nnaNhFapdFcAhtNgulqQokbn+J+0X8Vd4Yp1DvjfmuNZZ6HHLOE1lLo/gEOL4zH8wBcMj
	 j5bBPG1i85rxAIXIAejCAhq1jP80DybZ0Tv5F20rTsQGPMcFUkxSGXOIaIgdqZacjQ0Yv
	 oQDjNCSMTUqTEECF7aspgAR9+ig8w2BYaRPFngVyGBV38l03w4M0++GXJE6eaTxgE3NVV
	 F3ItfSu2kPnCj+auegz0gZkgPWi/My4zfp/1SgPD5wogEJowB9PgZCW7jyT5nCTV0UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
	b=LbItykUpEe6ViOQhKSqabl3cTmtQAEIxg1Ie4PLGpOYjxceWOQqadpkx2uQOlax0QOcR
	 aiMRolaAgFyt1XV7942S0Gzu8FNC/H2+OrQvJNKnZjz4FAG4A7P9l1ouvl+ymNqL/kHKU
	 4vNh/2KwA1phX3kFkcTVRwzNw6N+eCz4ui/TuDkf65QtNeaITlubqdF/09x8DwoAGP6WN
	 ImAmVXO7JYWAcIX4TWErQmMlPbD7+6q3HjReXSjp8LTlGlNcbQCodhxGk1J0LNTY5CkpD
	 1y1QUxOeDKatAA7TaiHDLg2HBgn/9LbSX2JAUoLTfNdC9YTbIwBbqMwTGlLPdST4geg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHJMp8Bm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6714E606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6714E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHJMp8Bm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38564b4b017so3417736eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434305; x=1796039105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
        b=YHJMp8Bmk8/Y5UGI3WO+C/4G37ilVZeCpz7VnZ7ZI2IEqbBuGcd/bi+hG2XsQHt0u7
         um+s77GVp+2kloGsHhii9lNheqXIJCDiWwoYZG38b3ObmOX4hBZ0pYvhqgAorDSuz1n9
         roxIut84FpOVTZ4fqXz+GvpsVZxTIycJSxLESdALF462vjsH2nqeASBtJr4ZWVNM0qgr
         gT/KLKX8kxCCh0S1zIh3TIdwb3XU/uJYwxtVIGxau2qZTdn5ztZMfTG/C9uru6fQimLZ
         Fh0iyxte36lYEhK1do5rJtSxdFpMh5s6nMhI8OITJZ+WoWcqjfyqesDbAqJRyImOmISc
         Y/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434305; x=1796039105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
        b=LINeIQXNqkVxBCs93XyKLLw+UxHwk8nyGddQIDeJEuHKvZOIOmKelgvWWdVgcCgMDV
         x/PSAcgr0UN2oPzHM1ITStTrW5P887NYKMss4nbLDaKc6wNRCgw3LbtDVAYKYqudtWx+
         qboRkk10jebcLbmKmWjp1fNDVYm9IQf4DK5TE0Co/CQvLIJz3XN7rfvGrNGHoXgY1gsr
         qaKSSQOewm3cwlkUj/T+ic5+DVS1S8ChC09Uqzzn8aV32A+94Fpc8JnqD1NiYtTBcOjh
         JRY7twf+pbU0oPflkgndTbD5jXtl9ZFxlnRm/9eU2nFb9czjTA7ev2hVWtLAwKKuTk7/
         tEmQ==
X-Forwarded-Encrypted: i=1; AL+hErGH7mNE8gUea1da+hp+SA7MAcC5kxs0ZC75chg2+i+G3dF+71bLM7FBIAaDjNOM9mSqtcomszvoCUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SbkUoXQVxdUYWf7qwbaFuOy9mpLUmsGIrPHp1yWvDqYKcLS8G
	RRwCv3zI5Yi0TOx2h/MGhhlvsp6gJj1pNSJ/h2C8CeyaBnF+rVI2BqC86zQOpHXGvBEx
X-Gm-Gg: AZFdTZfzS3nBKHxHRlsrMf8NegIXpnqmL1vHu6OMhrrxIZF4L4LWIof1EJKQyFA99du
	R7nvNHTLs612NGr22+yY+Wre6SrE/Y17ATciMzovJL2ewFAV3O+quRPcYp5zVPsrCWE8pWnmIRD
	4lrvsmw981Capsq4xbxUCzPUZ9msUdXqubpmdRKwMPPnpnl9PxJvd3pRsy2JrizdzW43xEVUt5M
	S52umOsWZxR6/nMP+Ku88K0VQ/G3aMLfoZRTfm7YVUqnz0uwUL6Ad8c1tkUrsG8tz/CyqhrAVk7
	RDWXPnpVnYBPajVJHT10c7gklTEDSQE7rwMgb/oJRNWs4bWMUsHVZbw4qynu0R7Dqf9hyVhZxZ7
	MzRXcrCepMonImE2Zwg0kuLWz6jMX2U9isiWV7I8sV5D/CY0FCtAwOdF8ZD90NhcdD8cygoqr+z
	2h6PPl30uQ/S1YVRWY/Yi7ibyaOgE6WvTEFENWcE1DvM56pLIa3ZaFTJQxEScR+1KAYgsBhQZkn
	RioNYO0UxQx4XGmIxEi1Xyu70cPXPDzPxGmYOtIOMu/vYCcNCuTwSGNVeKz/xN8E6u/oXXvtdS8
	WSuZQLVjFg1e7q+xl78cp7Nt28b0bGlQ9OCx3Ch7gNy+qZdM+0/21BRlOfGp+LZxDmwaQ2NlgK7
	TU3NXYq77gpS2ydjgEvzMyAjimiYAM/4GAApHzIHqtxz31bc/XFxBtQ==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr9810486eec.18.1795434305311;
        Mon, 23 Nov 2026 03:45:05 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.44.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:45:05 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Mon, 23 Nov 2026 17:13:08 +0530
Message-ID: <20261123114308.8103-7-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123114308.8103-1-harisudhan@armoriq.io>
References: <20261123114308.8103-1-harisudhan@armoriq.io>
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
index f53047aa8..0946d151e 100644
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
2.43.0

