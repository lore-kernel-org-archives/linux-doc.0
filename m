Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2B36073E
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849974; cv=none; b=hr4kq85Cxmpu19iWG99Os5Oy09ApOPdvVXCpg+wxbll/PciEmnSjltufmOcnaE026WEB3Ublcd6d99G5km1FfsusHCQj1bZVZurxPHSZjMrR821JqU8Z06pWsDsa8TL19EHtrDv+vYsyLbYursi3pSGHa0GTxjK5590P35jprCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849974; c=relaxed/simple;
	bh=+Gb05PxvumN+Pl9XaeCIZFLytIRa9gHhOeCrXLllhEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFQRS/urhjYLXC6dd8CVcXS65mcXhmM0swpiZMrYwwhsWQTQfDHoVVS0cFJvz64EzkxOCrnG5pEwUxA9wq2YUhP0sar3zsPcIHXwBzvbvuaJ8tBVGvGzWHfj3yedA4TTPOGLK85uvjom0WJ+MR8ZKha+/4m3rBd5a6la9BoE2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/b2j5D9; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/b2j5D9"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c6de0364915so2619412a12.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 04:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849973; x=1772454773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRjDZcOUW3p8fFG0+tNWgPy65ed/dP2/X89AKu5rG9U=;
        b=H/b2j5D9dvoBKapcveYPneT/C/8NQHnWTUDk/Rnac6wSqhVzkkSGNwRhdSfB/qj8Sv
         k24hT0ZpxW4GaXyVyok+AJflu7U4ANYV+X7hxQLHHBGwkgff5fxGLaJcQUC/TAYb3pMU
         3O0iZCoop1mJ+cuK+ezHz7uUrVHDljmwwaxSolwvJ0RaD3oYYLHtk9hDYaWc4NK+YlWP
         TxoSD5vIDMPURPxPu5hK3TqgbfVSO5wNcdoeNy/rYds8JbaProv5IxBi57lRQzE4UQAa
         DNv21T6432HeMFAep9gEMrb3NquuHZNQppyscQByFKIHk1M0pB3t3/me13y+GeR2SUgy
         e7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849973; x=1772454773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRjDZcOUW3p8fFG0+tNWgPy65ed/dP2/X89AKu5rG9U=;
        b=tbwBQw09gF1p2vew1nkdNvTq0dEvhdO1yyFHEjPuE4lSRbHyiVJqErjbfhtK76mSmd
         fAaT+DFgOOY64U3mifg39UXQFWHflXZfXW1dT4CO8RTKgb2UA5ovLdomG5SYpobuPQGq
         H83vsRuWM7MR6bTMy5Rn7pqiwx4DbF4A2ueLNgb1voMuNCdJqBFuAl9PityWH4i9hB4U
         SJKiB3VDDWYCcZpB67fpxaOGuBJIlnOvirtrlU0cY1jCkC4WvNrFYnyoLlR9MVW5B7ys
         L1tV3Ca24RxcpsFFPP5EMxr2z/cC3mcXKImY1j9KvUzlGzEd3lrKQ+QAfvSq5w2pSOJ1
         STyw==
X-Forwarded-Encrypted: i=1; AJvYcCVmJxkAfuuqApYLIUaYl8G8k8Tqk96F5hJoNfwzoHlozoRvlLYnDnjFDccpNTDKR0CZMJRilRZTFCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcbmdz1CmdefJoXqEWunfNZ6LQCKLE+J528O4dKu3CKzR88Mw5
	Xoba9RsNGvqr6XQm4y2HQ3eXgVrIWjocz1ha6NrVjEdgckGsA2rGmFk=
X-Gm-Gg: AZuq6aIXrGr9j7/2e9O4QGnPdFzqRMFnNhgG0Giw9QJik8ivJlWHhmcstuOWqVXQPBX
	o0hVX+UhJOQU6gGFMHYS/YqFwex2reu+hVNZ+ZUQsC+TNcCESto9WuMih8A8diRPPv74jhoUxD/
	wtCS6XYxtvtOBcnendgHVyhLw1+S/h1cYHzUXwP712iilA1YR8soTUPikcF7DTF2t3ZRWc/cLuE
	Fm/9HFXtDyAvEAOyZxcuaGbCxUURsNZUNlQGytSIg80KFCpz5RQwT/wdCuLyK30obaXSC4REhCg
	MUIpoK9aW0WTk/D7DfBGeZQyUBw1tJyAXxSdlS1TNaayQ8KJQOyfwCbx+ymc5oN/HGWEqXxD3Zt
	xM7i8p5lXPGBRE0LN9AFpFH9RVLMd7y7xQ4404GMf9JtAlkIc8PatKzpnxOK5XmZOZd6k5H+TN6
	HIs8dBmI74QIr1DzrCLPmMmZ14cpfAPgQihKJ2QIs0IW5W
X-Received: by 2002:a05:6a20:d80f:b0:395:291b:f555 with SMTP id adf61e73a8af0-395460224e4mr6425517637.69.1771849973278;
        Mon, 23 Feb 2026 04:32:53 -0800 (PST)
Received: from LAPTOP-FDBL0TVI.localdomain ([49.37.157.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a73e1sm7454739a12.13.2026.02.23.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:32:52 -0800 (PST)
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
Subject: [RFC PATCH v3 1/4] mm/damon/sysfs: set goal_tuner after scheme creation
Date: Mon, 23 Feb 2026 12:32:29 +0000
Message-ID: <20260223123232.12851-2-ravis.opensrc@gmail.com>
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

damon_new_scheme() always sets quota.goal_tuner to CONSIST (the default)
regardless of what was passed in the quota struct. This caused the sysfs
goal_tuner setting to be ignored.

The comment in damon_new_scheme() says "quota.goals and .goal_tuner
should be separately set by caller", but the sysfs code wasn't doing
this. Add explicit assignment of goal_tuner after damon_new_scheme()
returns to properly apply the user's setting.

Without this fix, setting goal_tuner to "temporal" via sysfs has no
effect - the scheme always uses the CONSIST (feed loop) tuner, causing
overshoot when the goal is reached instead of immediate stop.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/sysfs-schemes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index bbea908074bb..fe2e3b2db9e1 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -2809,6 +2809,9 @@ static struct damos *damon_sysfs_mk_scheme(
 	if (!scheme)
 		return NULL;
 
+	/* Set goal_tuner after damon_new_scheme() as it defaults to CONSIST */
+	scheme->quota.goal_tuner = sysfs_quotas->goal_tuner;
+
 	err = damos_sysfs_add_quota_score(sysfs_quotas->goals, &scheme->quota);
 	if (err) {
 		damon_destroy_scheme(scheme);
-- 
2.43.0

