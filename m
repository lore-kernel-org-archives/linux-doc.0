Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33238F65B
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131536; cv=none; b=aE8YhkBYkgqc/S8f7WSzYpU631MINCjsXGu2myn5GZ5MwySISdK3lDQ2/u3DvLmtg7f9gDTjhfVaQAAcGVR4ZAZcnwUFmStoH/QYEx56c2zVQIpXyHWTqfw+pMkURvGs9uMXKX8XmkgagJIlViBhSNXjqJGW52k0TTYhphyaZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131536; c=relaxed/simple;
	bh=SoXSf5SpGqI0kBoFXThh39QkImfKpBI2uqfpuW5aPZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0Znen3G3fZOsRFrspi1ak5lO45r4zRUfcuo7ys8U2czzKWee6k5zIvDsrB1BPGX4JOr5EER0CCFFU5UA4iOR+JvbHyl5Vpr3f7BWvltNlzi0ur92Tb3UhFOuilCDAJ904uh+CqXCNuN/HrH5KnFEl6Ej/HLh7dU+G68Dq8e5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grFfbOw2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grFfbOw2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48909558b3aso28571725e9.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131533; x=1779736333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvA0jsT56XFOzdzNJ2doFH+eXNoXIcVbsna/QX/3LyM=;
        b=grFfbOw2dCy9mudk/oA8VqjaYjEHPdVokshc7xYTGMQ3+jCvkLJYm6+nIvqaVVCq1M
         xDUmmHypTEm1z2E0yPy7bjJiy2xj6HQfJ+5/eEGsqpN0eQEuwMcfmbB2kbUSzUrlzgP0
         FQ23mbes75ehy700ONVXtFGIuRDnJEJRA3wbBY2S6oJoHKEpowlv+wTadsenU6GrrViq
         V38eaBeckZKa4aC4L+Do9PW8VFg26NvsyNmuAM2nkoyksnSwU/zXAtg+b4uaoxyyF5ac
         72DoC/JtAx0vwwJrGskwon2gdvo2zCC8YUE0s/20l3jWJEFVGvycTKdmkxS55/GAj2sD
         +l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131533; x=1779736333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvA0jsT56XFOzdzNJ2doFH+eXNoXIcVbsna/QX/3LyM=;
        b=Q/g+0Tp1HuhoXw+uBxDR0J5N6KWlhUuehbWULms9hF2VCQVPTw9mtKmTAN3MryXb8l
         pXvcDjdJDXbmUG4584S7KGXkFJ/446i1wo3meLX7Ga92th4Cj4hMEEcPrv+dUdmuXuaN
         pGKEN15QkP/X/Cz0phKpBfbFcgvD6TqVuJ4IhKmZMNZl+QbD16baEwEGmWCUHmipjeEr
         IVnFathydaDrbFGhQP9laElnEWAuRaSWSE/5T3di33o29L50Xei+eMHaa8IKF+RQZc4u
         Lx4aNhzQ0zIjL//F4wdsi8/xjyTMh5rowRsXxm2QbTSHSqcd1msB41sg1gIHBFKf22ZM
         AIDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6E9hS8e5jdghoE4vJHN6kQneTgIMLKcZq+FUMnVP/3r4WgRaNQ4/6ugaNMgb+rsLkr/zMItq72Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nMhOb7L2h7pVm+QWTcc4xTtysagzopLWedFfrcBQMKeQspJY
	ad+d144VadHgEe5iEPfK2PxMlndoLQL5Xsrey300lvLfaR2isO9vHnxL
X-Gm-Gg: Acq92OFWveMs8hbtLR8eqhjNxhE6cn3d1YSLhJNVFOhCtTGKsRaZyzOdKvKMW4/ztbM
	53sppVLXxJTuVpBLUWETd9GO8giMVLzHhzRGiBHB4E4DBx1kWejx33rGyHCTg/yQnTGugokqSuC
	ebabn7c+VBBNG2IqmGzgUncc0u7XrTcsmtjll/op+iNk7IPWPaV6V2l2skKnvxLNezuUNYtenuU
	BXEWXmvjKG+B0PKYKyfoJ+Kqd/QkTMeJjBJVL7X7fKkTiBYXSszojydfRZVGIZvT8t6k704RJxU
	JwVOponhWEvQuZtsw6Mwz53Dn/OZgzQuuVRBiLr252TSQ4um5V2kyuNghFvwSyZSMLi2SytgFcr
	LCgAj90W7/bYB2KLDMpbObwTGLE7abg6JlG5fOSYCZqaMMPeK5UD3H+uUJqGqrSQI/BQkURnvtU
	6TolyRCH6pmKrkve+RqWJUOrMl1wEW5FQNa0CTwpXwY9WqdvBAtbo=
X-Received: by 2002:a05:6000:2c06:b0:43f:e9ee:5610 with SMTP id ffacd0b85a97d-45e5c5e2ce0mr26609560f8f.43.1779131532440;
        Mon, 18 May 2026 12:12:12 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:12 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 2/6] mm/damon/sysfs: implement update_schemes_quota_goals command
Date: Mon, 18 May 2026 22:09:28 +0300
Message-Id: <20260518190932.42270-2-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the logic to copy the current_value from the internal
damos_quota_goal structure to the damos_sysfs_quota_goal sysfs structure.
Introduce the DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS command
and integrate it with the sysfs interface via the 'state' file.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 mm/damon/sysfs-common.h  |  4 ++++
 mm/damon/sysfs-schemes.c | 29 +++++++++++++++++++++++++++++
 mm/damon/sysfs.c         | 21 +++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/mm/damon/sysfs-common.h b/mm/damon/sysfs-common.h
index 2099adee11d0..9703414fa15f 100644
--- a/mm/damon/sysfs-common.h
+++ b/mm/damon/sysfs-common.h
@@ -59,3 +59,7 @@ int damos_sysfs_set_quota_scores(struct damon_sysfs_schemes *sysfs_schemes,
 void damos_sysfs_update_effective_quotas(
 		struct damon_sysfs_schemes *sysfs_schemes,
 		struct damon_ctx *ctx);
+
+void damos_sysfs_update_quota_goals(
+		struct damon_sysfs_schemes *sysfs_schemes,
+		struct damon_ctx *ctx);
diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 5d966ac86419..5793659403ca 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -2812,6 +2812,35 @@ void damos_sysfs_update_effective_quotas(
 	}
 }
 
+void damos_sysfs_update_quota_goals(
+		struct damon_sysfs_schemes *sysfs_schemes,
+		struct damon_ctx *ctx)
+{
+	struct damos *scheme;
+	int schemes_idx = 0;
+
+	damon_for_each_scheme(scheme, ctx) {
+		struct damos_sysfs_quota_goals *sysfs_goals;
+		struct damos_quota_goal *goal;
+		int goals_idx = 0;
+
+		/* user could have removed the scheme sysfs dir */
+		if (schemes_idx >= sysfs_schemes->nr)
+			break;
+
+		sysfs_goals =
+			sysfs_schemes->schemes_arr[schemes_idx++]->quotas->goals;
+
+		damos_for_each_quota_goal(goal, &scheme->quota) {
+			if (goals_idx >= sysfs_goals->nr)
+				break;
+
+			sysfs_goals->goals_arr[goals_idx++]->current_value =
+				goal->current_value;
+		}
+	}
+}
+
 static int damos_sysfs_add_migrate_dest(struct damos *scheme,
 		struct damos_sysfs_dests *sysfs_dests)
 {
diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index d5863cc33d23..ecc880b52b32 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1320,6 +1320,11 @@ enum damon_sysfs_cmd {
 	 * effective size quota of the scheme in bytes.
 	 */
 	DAMON_SYSFS_CMD_UPDATE_SCHEMES_EFFECTIVE_QUOTAS,
+	/*
+	 * @DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS: Update the
+	 * current value of the scheme quota goals.
+	 */
+	DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS,
 	/*
 	 * @DAMON_SYSFS_CMD_UPDATE_TUNED_INTERVALS: Update the tuned monitoring
 	 * intervals.
@@ -1342,6 +1347,7 @@ static const char * const damon_sysfs_cmd_strs[] = {
 	"update_schemes_tried_regions",
 	"clear_schemes_tried_regions",
 	"update_schemes_effective_quotas",
+	"update_schemes_quota_goals",
 	"update_tuned_intervals",
 };
 
@@ -1606,6 +1612,16 @@ static int damon_sysfs_upd_schemes_effective_quotas(void *data)
 	return 0;
 }
 
+static int damon_sysfs_upd_schemes_quota_goals(void *data)
+{
+	struct damon_sysfs_kdamond *kdamond = data;
+	struct damon_ctx *ctx = kdamond->damon_ctx;
+
+	damos_sysfs_update_quota_goals(
+			kdamond->contexts->contexts_arr[0]->schemes, ctx);
+	return 0;
+}
+
 static int damon_sysfs_upd_tuned_intervals(void *data)
 {
 	struct damon_sysfs_kdamond *kdamond = data;
@@ -1656,6 +1672,7 @@ static int damon_sysfs_repeat_call_fn(void *data)
 	damon_sysfs_upd_tuned_intervals(sysfs_kdamond);
 	damon_sysfs_upd_schemes_stats(sysfs_kdamond);
 	damon_sysfs_upd_schemes_effective_quotas(sysfs_kdamond);
+	damon_sysfs_upd_schemes_quota_goals(sysfs_kdamond);
 out:
 	mutex_unlock(&damon_sysfs_lock);
 	return 0;
@@ -1813,6 +1830,10 @@ static int damon_sysfs_handle_cmd(enum damon_sysfs_cmd cmd,
 		return damon_sysfs_damon_call(
 				damon_sysfs_upd_schemes_effective_quotas,
 				kdamond);
+	case DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS:
+		return damon_sysfs_damon_call(
+				damon_sysfs_upd_schemes_quota_goals,
+				kdamond);
 	case DAMON_SYSFS_CMD_UPDATE_TUNED_INTERVALS:
 		return damon_sysfs_damon_call(
 				damon_sysfs_upd_tuned_intervals, kdamond);
-- 
2.43.0

