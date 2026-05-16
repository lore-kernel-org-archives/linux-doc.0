Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com [74.125.224.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42CF37DE9D
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965450; cv=none; b=bBifFuIZGYmhtcqjqtpYm0dGxeadcmComkAv/u+eQkpGKedU1EWc8Gc8KhAyvwVkdsgj7fVVqQjE7wEBwL8C2VL4krqt8huHUh45gFBXaxuNj4ujgoYntrxbX5yG/dC+mn6kwyK+CT+1Fsze/6xg2VO5m1gPJVywD4zZnne0WiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965450; c=relaxed/simple;
	bh=A8UrwxnJyTbkNKJFRY/W/SfMc11SJ1ohzLrCgP9cYxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qi01bDldzaefREIX8ubdV+cHzJZWkgVAonYaW79SJhJSTkkbFYKY3t/ecBsF1SV7d0kQTtNMtaT+WrfLWga1Ifisg1IA0a61urmtKxh/BRem6YPLBWXYE40A4yfW34Soa3o3AAw0qkYZaD4+SltxYUieOYmKwGh71gZJ0l3JD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C74aZqS5; arc=none smtp.client-ip=74.125.224.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C74aZqS5"
Received: by mail-yx1-f65.google.com with SMTP id 956f58d0204a3-65c37eafcbeso1403519d50.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965448; x=1779570248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O47MXZLACGVXkwBLvK8wvdJrmJyHZnllVL8QQ770hw=;
        b=C74aZqS508mjmVpu85NNwEXBFwNaepui0+4oOYzU449i2cx0f0tK1N0vgoOK58Nlg+
         3nF4ZeVdYWa5pAKBFPNxAj3MeuHXTlPDzn20tRiKvlXBXl+LBYYkWjfyujPX5c1U9fmA
         PV1+lGnkpgyoIn+dhB0+Ll2rXTDZvuTVLnWRZWhFC4qWEi3B2jCnlAQA0mBE+DNyl5SS
         JeRtNU3mwP+U3xR+Pevk87WwDyKnz1YnV93KADrOHobTwxhtaHiq3GJqLXP7rEyCoqAy
         +0fGwIs+Kue6W0o+LHAUrmzLkL5l+wdNopPQQ+iMMGU0EoEeUb1PRYCKhCAs1EtCDZCZ
         7ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965448; x=1779570248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3O47MXZLACGVXkwBLvK8wvdJrmJyHZnllVL8QQ770hw=;
        b=haXa65XBh9rdhRlfrOWjg+i7s/fcmG+7R7fPs/m3/2CPXxA3Rq5szh7PlzVaCNf1Bw
         I0DEsQhJalHrTG49xwd5upnZ1yxvhDx5i5loLJjYGoU3+O2M1SnFEM3ITRdNqnPCcZz/
         M/utd1jBYtvHYI+IGokIyxM1i5cMQoxh+K8vmBm1IwV65B0OV7V/6JBgmAGHf9D4T7TX
         DwgoMMFhPXAMF7aYLFiTNUnZye58IGV+Gl1ADLBIAUIOTcasjpxE2ynkzs/nXou4teXA
         jkQXf8L2dm9qnMQIAy30L/ZKy/gAa1yEb7Avtj+pWFdHVkfT8KS5Lhidp/rFL/kWEPK0
         H7Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/aPXtzQCguWMRUx0fG9oeDCNamEunOrVGD1/uvVXaYcqoFSAms15OS88w/OmfqZFejwwnPnT4/8b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyULKqylyc2orc+0QzVlorLlvvxYQ9EIukqLlpgDnuwI+pMAwfz
	CVsCzIT4cKStoG1gN/zcVTcJK9xg0bi98fC3ZXr3aaWBNLH4Txq68FgR1TRj7aM=
X-Gm-Gg: Acq92OFFh9OxNywogiOBHbYon/cjNCMGhcb7Qc3Ki8vv5Ll8vRsCD6eBs8vpuDxVV2g
	mRR+y2aQfD4AP2k3xJSslgA1dOnOPifk7AOZ0L6nggA1guC7XLAQ3bZJZ0mbvTBxgTNYrEUVlFq
	xzCnMJ1Jk3QhRLyYQZIMkmfbaei8S1+bZ4u7d1yP4rOJb4+yzgQ25ti4LnTfm7xQW8AZSolqmaB
	WArbv05xCfmkVNrddZc7My9wYlxTSe1CWCgjvqnrXo2ObZGe0TfSrD/hDZbtI8A8rh9LaGTw4U7
	VCSf88eXxPgSTt4fwkE6H8YXbMkuIzcH54eWg5oXTKi3catYg95qc+iKerNwTu6lTHVKRujlefM
	tH/pjGhrYaZItnQrLKux89lggETTvHk8VSaGUfk3lvNJu99ctyDSgEWb/25R99uX2v+3f9o7PgQ
	uUsuhJ8qoeWxHxUs2RwxZuhYo0KJN+lZvYy3OlUyTRKatmeTPEDx47JHOzk6ltn5OGaDi1U801h
	Q==
X-Received: by 2002:a05:690e:c43:b0:65c:1302:ee48 with SMTP id 956f58d0204a3-65e2286ae3cmr9596405d50.54.1778965447840;
        Sat, 16 May 2026 14:04:07 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d86bc02sm4342876d50.4.2026.05.16.14.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:07 -0700 (PDT)
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
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 3/5] mm/damon/core: floor effective quota size at minimum region size
Date: Sat, 16 May 2026 14:03:55 -0700
Message-ID: <20260516210357.2247-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516210357.2247-1-ravis.opensrc@gmail.com>
References: <20260516210357.2247-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CONSIST quota goal tuner initializes esz_bp to 0, producing an
effective quota size (esz) of 1 byte on the first tick.
damos_quota_is_full() rejects all regions when esz < min_region_sz
(default PAGE_SIZE = 4096), so no regions can be tried and no
feedback reaches the tuner — a bootstrapping deadlock.

Floor esz at ctx->min_region_sz after the tuner computes it, guarded
by an esz != 0 check.  The guard preserves the temporal tuner's
intentional stop behavior: when score >= 10000 (goal met), temporal
sets esz_bp = 0 to halt migration; the floor must not override that.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index fd1db234ca304..d33c4360cbd60 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2650,6 +2650,10 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 		esz = quota->esz_bp / 10000;
 	}
 
+	/* avoid cold-start deadlock, but respect tuner stop signal (esz=0) */
+	if (esz)
+		esz = max_t(unsigned long, esz, ctx->min_region_sz);
+
 	if (quota->ms) {
 		if (quota->total_charged_ns)
 			throughput = mult_frac(quota->total_charged_sz,
-- 
2.43.0

