Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E3E352C29
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849980; cv=none; b=eU4abobjG9k+KALAm67WxGfLyMdIgvVSb1rqo9N8SYZKimNsL0O+KKZoqEexl70VoTD5hdnqCRcg94eP5e6/UzAUo1g32U4hHiCpgxXkQ44V0L82+rSXBCARNugRvck+qkCMo9o4/6kWGq8H3KHcVGkbYsGFxkfLXKazLEGJLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849980; c=relaxed/simple;
	bh=tIR9ZTfFc43iogKN4VnltVCT61CN1KDGtyex8888EAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVrck5Aw4RU46a/G7bG8Y8W7O16qtaeAhji7/vueSNCbhULaVi2tLON14q0637vxJwM6LVrgmF2FlrnT28X+df2/SN5v9IyTQCMOPJjwqAyXkC3I8mFTbWcXSfYldUCnNKgolEq3joMKRA24QtuTWcXvKIz2Tv32aMeDtu5ABiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjmsSs5h; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjmsSs5h"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-823c56765fdso1843692b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 04:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849978; x=1772454778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9zxhRiY07QYTGDQv6Cv2204Go1scw2vYwkAtxLUmkI=;
        b=CjmsSs5hi9rqHUx3/+UQKC2eY2cGTZzfoqkHzi5dxTct/6LENuNr4k43fYmdbisRlw
         aOLjjmo5UBRO2M4XNWeHJEL7QLxzW/6Ec38kHmVbAMYjRETkAh6AYLRX4VcGi0Gu2l/Y
         Pzvk7f4AALIo4ELZq/TTzIJ8B6NTe7G9SItQgJauLNRZqPSpsCQ8+2qAMufuGXsWeYQL
         DbcT/ipOzT4IQ6+EpVlceqqpdkSUphfPjhmSNczbfPzTW05G/JAazGCW+7W6wb1/xRAR
         3Fzv9s3r5MSR0VLef+fKj61NY3PMIBcY9lpty/hSiUb365egB5FoU9ipnafJVxDFp/vl
         4q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849978; x=1772454778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m9zxhRiY07QYTGDQv6Cv2204Go1scw2vYwkAtxLUmkI=;
        b=H7YQeA9VmbIc4U6vukaSqfxlsgtq52+99WRKhTsR+kMfFQtTTipBup3E50Yh8RtQTO
         zt7rE0sCcAErqFt35j+vteEXkaWx5AhVJPZTf60XwiiH39EvM2QfoOOq0R9Y8aIlcW8J
         zgHUb3slnECf0WHfdcYpcCXi4PamHx3HddpnV6KHl28diT5shCW2I48oBPkJkQRG4UZq
         YTOsH6fX1q/Hc60/Rlf9MwQDCLQ8PbS1dwWuEa+dZs6g1jQ7MqtZ0zRAxnSGZsdmarXa
         HhoOzszbxk8vEW7pOMuERRgBoSTMjiCcxaxCyPmvxub23BULRo4TPVO8IC81Zzjrplti
         TaDg==
X-Forwarded-Encrypted: i=1; AJvYcCXvmRMllV67OkSLRzR+bScXFoEtllY/6IXpov+PEafYK3mb5z5JJ0mRLaU5fI8244nPSpKxMX0XDtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8nzFdwnI6sRJr2BkyfKZtrxxyvDI4/T4q+vnVc3WIwc0eCgqI
	QOgNeFkQieGUDNMnIBKg3wh0acEM+8/x+s4vAfFUDc+fFSaAUxWaU9mBBwsnDo3LrQ==
X-Gm-Gg: AZuq6aLft+Fno0GSZjTpWKXW4CCT1wDpo+Eq/aP1pjsH2hkfaLKcLo0unXCRfrZo/rk
	lOEpi1bPelgZ3UKMKaNFW+7vBoIC4p02oO2Rc6LnYtXF1oATFjuSu5+Iq85buPaGzVcKgY5luxm
	NV0oyLtgq9MYDX1wIa0ZicrRcDrcy/qDWoo6WNGvrmhW5eVYAxmYehI/i12v8oPZ4UhZoCiC5nJ
	g3IY03KAXaQp4Z2AbRLyYp3G3yL3mzlb8d8hmOxVdJKhXPK9lTvXkW9hk1Cg0XwjHdojJK7o+Sx
	9qDooq4oczMZgTHOZUHxBrESbG3Ld/YVRzRwjCcOYvqJgGtkkpFeV9UClg8HoyuJMd0USn5R8AK
	GnLXEdMUmfxO+1D2Uo1zp+efURLe1HLykRXjKrslHtkK5Kj8i0ULV1fOKeX78dsPZR5fvJzlMtm
	4FOZ2q8oiRdecGJSbZRxo+9cqTmiTmt6LsV3Ovak24LAye
X-Received: by 2002:a05:6a20:439e:b0:394:6023:a0fd with SMTP id adf61e73a8af0-39545ed05cfmr7352911637.29.1771849978382;
        Mon, 23 Feb 2026 04:32:58 -0800 (PST)
Received: from LAPTOP-FDBL0TVI.localdomain ([49.37.157.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a73e1sm7454739a12.13.2026.02.23.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:32:57 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH v3 2/4] mm/damon: fix esz=0 quota bypass allowing unlimited migration
Date: Mon, 23 Feb 2026 12:32:30 +0000
Message-ID: <20260223123232.12851-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223123232.12851-1-ravis.opensrc@gmail.com>
References: <20260223123232.12851-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the TEMPORAL goal tuner sets esz_bp=0 to signal that a goal has
been achieved, the quota check was not actually stopping migration.

The condition:
    if (quota->esz && quota->charged_sz >= quota->esz)

When esz=0, this evaluates to (false && ...) = false, so the continue
is never executed and migration proceeds without limit.

Change the logic to:
    if (!quota->esz || quota->charged_sz >= quota->esz)

Now when esz=0, (!0 = true) causes the continue to execute, properly
stopping migration when the goal is achieved.

This is critical for the TEMPORAL tuner to work correctly - without
this fix, setting esz=0 has no effect and migration continues until
all hot memory is moved, overshooting the target goal.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 614f1f08eee9..b438355ab54a 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2394,8 +2394,8 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 		if (!s->wmarks.activated)
 			continue;
 
-		/* Check the quota */
-		if (quota->esz && quota->charged_sz >= quota->esz)
+		/* Check the quota: skip if esz=0 (goal achieved) or exhausted */
+		if (!quota->esz || quota->charged_sz >= quota->esz)
 			continue;
 
 		if (damos_skip_charged_region(t, r, s, c->min_region_sz))
-- 
2.43.0

