Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062071;
	b=agTfR0cg5y7Cpy3bT+9vsVa1QMy12TWWYEckjJ9Hfu2kgnVdFgY0IuDt9DdLFKo+LZqx
	 AJci1UEI+GQ8p9AbBJAt6GO8LLkS4rH5v0a5tY7PZ/SmEAy8hMtSFMUZldBeBAxlUGVpU
	 DvsOxyq1GoG+lgOrLlM1d7o2HDqSOhSmJUqi5+c+ip8St7C265YkBeDbkHSuI4cO0lYVx
	 n6SAWCoiHGF4tRl9FtujbagIyiNkrc1TeIaq5Mmb0xBtHgLkIvy8iB1/Yzo6T39+S782Z
	 KbF10vMTJmpquGin2f5ixvjcV6R8jrILmEOi+a77mKYwtT8ui6kGm4hsKC+s9PolNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=uLjnuBpt7yMkqEBriymOGzgBneM2V07WCXkiOcYOiGMQ9ArproaWrdMq0IKNmV9uBGN3
	 2l2fy+2sDJt35jRmYdX10zxsj/RtTWh0bVX/eViFrwdmwVR3onj64vAdm5g+uZQBkxdqr
	 4BICsQDEX8q4viJiskohib1kAWpDjqcKHi5VivsYPFP39RF2PSMKR9bF0yt1IROUJIPNM
	 l9ISB/zXeYFYevJfjmxt2ZOvv8gFqBghlznqSwB4U6AjJUoXkb91zFnz727Shr6s+rr5x
	 lPEkDhYXCXMB8HLqtqD1UrlsxA3bm2B/DdFk7iyXe9eHsuYewr9yHXczurlQbmalZEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA5606D829
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EA5606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2583006eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062071; x=1794666871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=uy8hJ+ouE33Mb9klB09Dl11PkCB34KQuwLsOOMICYNWvhhXLIA2Kbbq6QiieOCYj7C
         4eguE5aCXm+w74x70kWaWpIeVBkwNq10UIN76NP0MgiclIbRU/2bBeAICVwQZOwKKmPL
         Tta/EUuDSir3csCHLluQyk864Qx4TG534ALWvYfCQI1QQTsftFlF0d5dnD3UXIDOjfNw
         lQSd2SqnfQYxhzY8qAzIODtD3KkcwFz9AInGmWwZT6KiULdQsQP8hL8JuTxY91kJOJYY
         mjWNa24STMk5DLF7gzA3vY8WQftSlF7H4yg7rhU1kg3qlqkOaCT3XaehnSN2b5JDr3/7
         NMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062071; x=1794666871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=sEh5YFci0perhUbl+WoBVW2ZYT9eHYt7Y49ggG+NIhf9xQMBgleAefbD2qPrrwW3BI
         jjQwvtkHs6Wq+zBqJ8V6nbJv3DedDcM/BcRg/v6lVw0eH+156ECcajcHY2z72BKFwKNA
         TYnphKkNdxfohr4mJIq8ENc7bGB5ED0+7NIffQAfsy9dkX/phHdlpqA2XRTcSjXKB6hI
         owyMmDa1IdpqIYyxW0kJF7gAgFQA7vlZ+Gtlru/rpnEulJL7nPsjgS7N5GCXrBG5WcNW
         yus56BdYQm+M9oSQd9rS7x8cnEg9IiALmyCzI4uKy4beOFwdprAeAHkcesgRhseePG6P
         gm/Q==
X-Forwarded-Encrypted: i=1; AL+hErE/NGHyB/zp/72x11Pv2DG01JTVcmigKO7MbNs1kBJPFWS/sqG4oqvNKNr+HKadj9RqX2K1qTH8WEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v4adWUEte1rq9n3/yOUBwuOi15lbgOiizxcgimV10YHnacTrh
	1dRS1AcF/yGp95sTRY4/xPIcNBhoJUJLjaXI6SBEd4JXB3debsTinXdU
X-Gm-Gg: AYBFou2jFGNLzJVfm9AoB7RDGZFYnjTDspWyvXEdEFu31NcSP5CyUjOMnQETndKrxey
	jVplGqL+/5SsDeqsSM08vqGpbEeT8rW7JYHT3XYasQcV2WT1E5zF9Al+zuPSteBVv0iuJt7FJyv
	PtgOm0+Uf8YiffpufqRtCd4jtq8Q/AIsWjYr7bFJi8fzdmvw/XuZ8PleDQ+wz6MoLJKey+xrppI
	KStWsgAZqOATlwYiFTGIwMSzsRcfwkg22+lDFUlJ45Vnhymn7EuqaS9xKbTbpOuonJYbyR6pvYd
	TrYbOsXJzvRrayKMvB3UlCf2F9yOimEP4IsiFzPvobOJrmCu2CVrsyJCAU2syVqo5LxpOiHIvYG
	aANmvqnAijROD8H4uf25mxFZHtu4RCnzDJBQDjihe9xtNgzqYo1EVl8maaq4ET8X32S1jnRw05B
	42vECdoWa+jrSD7vwMBn2fvmZx8ol0Kx+jHk6XMlB5tPE5VeuDBfZmbfQFjKB3euCx42nGHvz0u
	74ViXsWcpom7raKA18RUKRx+nGquMy0UKoMBJ6AtXquwmP1JCuEHoEnUZSuhyNPJity/LGcW6dK
	YXceAThoSnIrc+XgQ3+ZaPkOJzNctCmTAe5NG1Y4o1LMKCSxzrYAHOgHusNYoHd2ddVrGbm84/o
	bjgUxpKE1G3pegKUHHo+QPTxBb6A95czS+RRU4g3DIiQoGA==
X-Received: by 2002:a05:7301:d813:b0:36f:6b99:f94d with SMTP id 5a478bee46e88-36f75b1f80cmr6584172eec.20.1794062070524;
        Sat, 07 Nov 2026 06:34:30 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:29 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v20 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat,  7 Nov 2026 23:34:11 +0900
Message-ID: <20261107143422.29319-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
