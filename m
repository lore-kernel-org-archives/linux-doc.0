Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01B2C11C8
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156396; cv=none; b=peP8qdEHtR8H/OSSINS4/8xJsxSb0Cku20nnHsaT8tYKDZlt2TEPmMemNvGGflXLFR68tGmKWmrMwwLq7Xi0aKp2vgpaBsbo8P8Omm0q42nKp4P6i1WRYxXKgUqJU/4aJm/6RdVtWvti3JVa8mKxAjHfn4hBaUWsSOYDl+NRqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156396; c=relaxed/simple;
	bh=YI6y0WtkAOSxi3fWHEa12lXBLbRmRWX/UrNbhODMw7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F43/QFre+wSTE2zuGlklVCJ4ZR04MC8coCj4Vd9IyyBF0H3veGkXB/Cgnt4fMQSDZLZMzyWOKxoadEHosJbbHXQmpOvPpu24lf/AYx13eZJOBqll648pLlY5CS//P9relsLZJ4zZ6t7g818LhsYowCXmtmAv7bpQ8NSsCr2KWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=fgQbC0R1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="fgQbC0R1"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34029c5beabso3707480a91.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 23:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762156394; x=1762761194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yMtctYgS2rV+P47tm9bNW95kd+lcuzHA0J2B8KxNkI=;
        b=fgQbC0R16BbBxVgperj2mMJBzRM3/5FZwDegF6tlNBkkz0Kxf0M03DPBrG5fJN7pn9
         ulelxzJlKlMU/yVcDbQjNm03n4dfnwn/hHKmz50/W+SlxkRtHG8ZaCmCCbNoKmafKQRX
         GPKrPT8hwvRLwI8KDP/TxdQwsnvvHsI5gcAZWqZHzPO688g7/pF0d50PdBjGueNCV7Ii
         RIPDfuX77WT+9EBrNSngHWeijBkppvejfd5RFW4UbVcWIdnZYatehs+24HehDOcdYzp6
         sKjthJxLWMfFB25P4CSmQry8OK80bqEBs5pXvVaw1TC5CNPRcDMYhqX3YuVLi+LQtOZa
         fC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156394; x=1762761194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yMtctYgS2rV+P47tm9bNW95kd+lcuzHA0J2B8KxNkI=;
        b=G8yJnZJQHOlXptVoWTuJpbb6B76TACrh9uQ1Xmdh3wBUmhQ4keOyzfXDtcKQRlMFsm
         IPeXpgAr9HzqvknXI/iOo7OaeNuL2JB7tPG7HYxd+ZK4jZix6yWbN2ET9mNEVgz1Uz8h
         ga5LzTiNPxnEe3y/vjmRqsYtYSrsPa9lj2rIj9Y1J2qPBP1NsdLGXFwRbZRbN70Vzxgj
         2g9Q7AgroJ7QADD/tFpMqm16UQ0Xpq48RxNZ3uYMuMqwV00QD3Ixtz6ZPNStNTs1diFw
         GsKCP9Lvy5k48kPl/tGh0bdmy/qaS1Ji+hENCE1bXKNJ7ur+Y1IO5UBAMWvi6bOqSAa9
         REug==
X-Forwarded-Encrypted: i=1; AJvYcCUWndI9wYenFFC5/tea7B0U5gCThhNIgdRYEFFidVicl1tqS7seBtm400kSKvmOs+PDE71jIu24BFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHhobdcJGECp9k+TAzmR5wWXmmS1R4lutOE6nPKhO3oz6kMHw
	2t1TrAjUTg55BF0mgw5IfB55E01tY+CBZhOg7M7wqmZUVAhnSuyRRgN7wmGH7/9Y1LA=
X-Gm-Gg: ASbGnctczVPMuWcvjRAUz40vq3tapmWQIA5NtBPKuEKMfUWy+Lv812MPHiwQzg5ypDG
	4gJdfM96SCPEQOruyK7XYYLSEbwUhGqCKyQba/rP/Sg7+p8uA/vOxiEKN+1uoIlt8sBzUMsidjF
	qJaeqb9IZo27pyUp8bLME0Qk1EufsVno1FFDxBMETaGejI5Cie8D7icocC/+dqZOjbzHvJ9J26N
	zXsLG1NGGyyD9LwkVYo3LjU+ev82o+bwLtsM2X2MJgJvp1t2wOBBvm1kxUZZHftO5rKRiQZMCH+
	utWDvV9Fo7X9hdBRumY3MT1bg5hNt+y84A2mDcvfYA9f68CmUewETbweGq9v6voMCipmaiq696A
	OW1BZMdCISAijL+rhtuw95Tb0U5Ta4HSsTk8gql7QsNkxA7B1rkBre9reFyHO06kIrFlzK5TlTU
	8ZvFn6RwkOGnClQmjoovsTiI3y
X-Google-Smtp-Source: AGHT+IELQOgDx8D/eQP4ToiYJS7h+qaVvXs4UNrgHqqZp+hj5K9vMTs1s/xhbdYPxDl7zK1DXp+1dQ==
X-Received: by 2002:a17:90b:53c7:b0:339:eff5:ef26 with SMTP id 98e67ed59e1d1-3408307e71amr13784912a91.30.1762156393719;
        Sun, 02 Nov 2025 23:53:13 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a16652sm34552a91.20.2025.11.02.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:53:13 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: stable@vger.kernel.org,
	greg@kroah.com
Cc: tj@kernel.org,
	lizefan.x@bytedance.com,
	hannes@cmpxchg.org,
	corbet@lwn.net,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeelb@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	lance.yang@linux.dev,
	leon.huangfu@shopee.com,
	shy828301@gmail.com,
	yosryahmed@google.com,
	sashal@kernel.org,
	vishal.moola@gmail.com,
	cerasuolodomenico@gmail.com,
	nphamcs@gmail.com,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Chris Li <chrisl@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Thelen <gthelen@google.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Michal Koutny <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>,
	Wei Xu <weixugc@google.com>
Subject: [PATCH 6.6.y 3/7] mm: memcg: change flush_next_time to flush_last_time
Date: Mon,  3 Nov 2025 15:51:31 +0800
Message-ID: <20251103075135.20254-4-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251103075135.20254-1-leon.huangfu@shopee.com>
References: <20251103075135.20254-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yosry Ahmed <yosryahmed@google.com>

[ Upstream commit 508bed884767a8eb394640bae9edcdf082816c43 ]

Patch series "mm: memcg: subtree stats flushing and thresholds", v4.

This series attempts to address shortages in today's approach for memcg
stats flushing, namely occasionally stale or expensive stat reads.  The
series does so by changing the threshold that we use to decide whether to
trigger a flush to be per memcg instead of global (patch 3), and then
changing flushing to be per memcg (i.e.  subtree flushes) instead of
global (patch 5).

This patch (of 5):

flush_next_time is an inaccurate name.  It's not the next time that
periodic flushing will happen, it's rather the next time that ratelimited
flushing can happen if the periodic flusher is late.

Simplify its semantics by just storing the timestamp of the last flush
instead, flush_last_time.  Move the 2*FLUSH_TIME addition to
mem_cgroup_flush_stats_ratelimited(), and add a comment explaining it.
This way, all the ratelimiting semantics live in one place.

No functional change intended.

Link: https://lkml.kernel.org/r/20231129032154.3710765-1-yosryahmed@google.com
Link: https://lkml.kernel.org/r/20231129032154.3710765-2-yosryahmed@google.com
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Tested-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Acked-by: Shakeel Butt <shakeelb@google.com>
Acked-by: Chris Li <chrisl@kernel.org> (Google)
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Ivan Babrou <ivan@cloudflare.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michal Koutny <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Wei Xu <weixugc@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Leon Huang Fu <leon.huangfu@shopee.com>
---
 mm/memcontrol.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 03a984287e5b..433cd273006d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -590,7 +590,7 @@ static DECLARE_DEFERRABLE_WORK(stats_flush_dwork, flush_memcg_stats_dwork);
 static DEFINE_PER_CPU(unsigned int, stats_updates);
 static atomic_t stats_flush_ongoing = ATOMIC_INIT(0);
 static atomic_t stats_flush_threshold = ATOMIC_INIT(0);
-static u64 flush_next_time;
+static u64 flush_last_time;

 #define FLUSH_TIME (2UL*HZ)

@@ -650,7 +650,7 @@ static void do_flush_stats(void)
 	    atomic_xchg(&stats_flush_ongoing, 1))
 		return;

-	WRITE_ONCE(flush_next_time, jiffies_64 + 2*FLUSH_TIME);
+	WRITE_ONCE(flush_last_time, jiffies_64);

 	cgroup_rstat_flush(root_mem_cgroup->css.cgroup);

@@ -666,7 +666,8 @@ void mem_cgroup_flush_stats(void)

 void mem_cgroup_flush_stats_ratelimited(void)
 {
-	if (time_after64(jiffies_64, READ_ONCE(flush_next_time)))
+	/* Only flush if the periodic flusher is one full cycle late */
+	if (time_after64(jiffies_64, READ_ONCE(flush_last_time) + 2*FLUSH_TIME))
 		mem_cgroup_flush_stats();
 }

--
2.50.1
