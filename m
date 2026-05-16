Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFBA37DEB2
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965448; cv=none; b=qt+xddO3NwayB17GQPLMadVrlIiIVhfqWBIwMsYkSoYwkgxZrL3LF6s0P+b1NLksBPDKCHpHVCK9E3s29Oo+qaUBhYnkLJKg8e3m3lKVLc3VVxEtONdRu+W0uiX04yocOhjRcNUBOwpAi6o3NsYt8QUct38ACqo6RFGS4TvjAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965448; c=relaxed/simple;
	bh=KzYiajAK+nfFBai/4/fm3cADm7PKM27ScIiqlEri7s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Erx1tDCWcpe+hzjHROapuDiW2EwGSKRzkSHkdL1KoJwHjr+BxJYW0QxVYXtP5q8dBgG3aPHjoOnEpC1iq5/xPY8ESjd9LKubVkZuTvxE1LLYKIjJnAs5e1aQZFKJBcxUkcMr5yp4a7Ox2DJvXuFuDwpH13vIJK5D3vxmR512Vtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ8okIvf; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ8okIvf"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7bd87e5d8ffso5048217b3.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965446; x=1779570246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+8d6F/ecIm4OU9cM2uGG4hmEo0TfbVFCv/yoQTzhTg=;
        b=cQ8okIvfH13f8sDCMwES9mmpGCysjeW46WPqlL8XwL1XYMnP2oosCjfzWMwcpQjLFn
         FlgTSyNZP1WrpMs68EtkODnkGFP2/IashtYQE+Sm8SoJwvhn5S2rINwFFdZTxbPeqxxP
         af6dvMOtZ+ALDs+a0xY+R129kwLr6dnsKPkLCKLkX3/JaCZ/ya0/Q28ovrZN+cCvBOL5
         zqJEQk8lLQ+KCT40azUJNX0r3gbTLjXY6ZLUPF7k5mRq4RaeFaLI1o43TDaGAoUcNIiO
         TQimB8wNEDDNCRw4L1inWIhP4L9PuByxQyzbSg/3RdW237GGJfKBjykT2dNJgCLD2sHw
         N7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965446; x=1779570246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+8d6F/ecIm4OU9cM2uGG4hmEo0TfbVFCv/yoQTzhTg=;
        b=KGNSQVAu4NzvazZcWMdCPhF6eVi471D292GuFQtoPXc+cPl3f24wwQE+J0eReCOryN
         fkyp4SShm3l6BcFLIqDhulIgej1iNnOqkL3GXvz3h196llQEayzbAR+Oxje8XvdgUWe9
         XNyq1KX2cpI78oOaQdSCWxEFvCOcNRZDF4BU8vfZyL8dOGJkwVVV2P49ZUpzbYZ7G+9X
         vyva2M5HjYsEC9FK0Rfnwd2VGS4OiURAzlOUWcIM5S8Tq9bKUCbjLLUHz/Bzz17yvLRX
         DJ/7ey9m37OWLTvPl1KULXUKySdP1o6SS3ps1VYa68a8MPxo7tlnW2uTZlFQbs73h4UA
         ou8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CHLah89D8qmiaOq2iKst5VcO4g+tHR++cW6gW5gAkgLgo/6D6EPpTwUNM0BBvhLk+GaxojIwKuHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEOEmvdSMTkwTGNYA77SVhLmfvhPJdK7nkGhOpENzS++EdUIA
	gRYXYRUAE6zEop0zUJNmoBS0cv3elMV5ibzFzz6dTX6XhBfXVW+BM0w=
X-Gm-Gg: Acq92OGRlQeTnoFeMQ92rt8X4YM6P5XIPuySFMCXXvylkL7x6LclCs+sSOX5B3Pi/c/
	jioEXUvoJnZxyJKiI0Qtf8ayNh3YVt/ZA7GzAIPwkRHUd1Q+RsCiCc1ffUmmb9THTkRfdJxArFM
	Z3ftmBMcT4T2R1DOtAS8i2dIMyzUg1+w4ozo6xYgIMe42rjSLpRea6lEGejshxIVEuShvUhQlS7
	897aaV8XLyC/5pdE6lRDQF5Xsd14DBLDwu8zPhKTgRypZEROLWQtU62xjP8fnHvgWsZgBf7K/kI
	Ne1fMBscUd3CvcLuMfWUqwfqm5/OdZlnkVt0pw+A0Nn9XQfI7PWcuWUR9NKNqSONy87kWi2Xf2a
	FVEoGeEX0Ve45FFcoOHztUvordZf46bLRGC45W6EYkuyltWVnZQFK5ifctJsJrNaOCtM9ridnL+
	v/M6RDJsKmEqkXIiitUpbWVaVUuVF9uNLg6MY0IWelH68JI+/i0kpmkMTGFqMHsg3hPmux2gUj6
	1F8DELoHuHF
X-Received: by 2002:a05:690c:e28d:10b0:7bd:9a25:f39f with SMTP id 00721157ae682-7c7e5d8e253mr91991277b3.4.1778965446076;
        Sat, 16 May 2026 14:04:06 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f4ee8726sm48887337b3.27.2026.05.16.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:05 -0700 (PDT)
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
Subject: [RFC PATCH 2/5] mm/damon/core: cap effective quota size to total monitored memory
Date: Sat, 16 May 2026 14:03:54 -0700
Message-ID: <20260516210357.2247-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516210357.2247-1-ravis.opensrc@gmail.com>
References: <20260516210357.2247-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAMOS quota goal tuner can compute an effective size (esz) larger
than the total monitored memory because it integrates over cumulative
deltas without bounding by the actual workload size.  Once esz exceeds
total monitored memory, the per-tick "remaining quota" arithmetic
stops being meaningful: any scheme can apply to the entire monitored
space and "remaining" stays positive indefinitely.

Cap esz to the total size of all currently monitored regions as a
final bound after all other quota calculations.  Add
damon_ctx_total_monitored_sz() helper that sums region sizes across
all targets.

The helper runs only inside damos_set_effective_quota(), which is
called at most once per quota reset_interval (default 1s) per scheme,
not per kdamond tick.  Walk cost is O(nr_regions) at that frequency
and is dominated by the enclosing tuner work.

This bound is tuner-shape and goal-metric agnostic: it constrains the
quota controller to physically realisable values regardless of which
tuner or goal metric drives it.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 9975f3d9ebfe9..fd1db234ca304 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2614,6 +2614,19 @@ static void damos_goal_tune_esz_bp_temporal(struct damon_ctx *c,
 		quota->esz_bp = ULONG_MAX;
 }
 
+/* Sum of all monitored region sizes across all targets in @ctx. */
+static unsigned long damon_ctx_total_monitored_sz(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+	unsigned long total = 0;
+
+	damon_for_each_target(t, ctx)
+		damon_for_each_region(r, t)
+			total += damon_sz_region(r);
+	return total;
+}
+
 /*
  * Called only if quota->ms, or quota->sz are set, or quota->goals is not empty
  */
@@ -2621,6 +2634,7 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 {
 	struct damos_quota *quota = &s->quota;
 	unsigned long throughput;
+	unsigned long total_sz;
 	unsigned long esz = ULONG_MAX;
 
 	if (!quota->ms && list_empty(&quota->goals)) {
@@ -2649,6 +2663,11 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 	if (quota->sz && quota->sz < esz)
 		esz = quota->sz;
 
+	/* Safety cap: never migrate more than total monitored memory */
+	total_sz = damon_ctx_total_monitored_sz(ctx);
+	if (total_sz && esz > total_sz)
+		esz = total_sz;
+
 	quota->esz = esz;
 }
 
-- 
2.43.0

