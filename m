Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA163FADFD
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016928; cv=none; b=Er4jlANJ1XET4B/yUf8VZmB1n+KKOTaaUZDA/Ch/xe4B/Dq52LMUxsy4tzv8fSyjMnL5L/GeY8rNRbBlQeTGJU79pKHa2/IpwXPlKsyalzfYdSPczkJdiOvrV2K9DPJUNjBHiRNUEEq9p7zslHQfw0ztUGByrwxE6xnvZeJhwZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016928; c=relaxed/simple;
	bh=gjDQFznmSdirZvXrAdUwJLGvKxuPAwsc2c+JUpH22sk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jqiHjYZ/8yuiZ1PklSnHrbuk/A6XMNtZy2BcITtvT0DttNZfjBN9uXnF9hyGHkxAQHSbeycMS4DpUDdLi9yIvXdroPddN8bI8IMMcbqbQL1uOshMixpsXJtGqd0RE266TDMF3F8AJud5b87A7Xs5Q4QmmhMYpgjaqLfyB85s364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmeHp5q1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmeHp5q1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso511371a91.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784016925; x=1784621725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6v3T/GQPfCFX0/32VfRd7BGJzQx4Npq1DwXlYIYPAls=;
        b=ZmeHp5q1ZQC6aT4JHDAIqALPy9+wBrvJ8F9ddM71+UGiXpGm/LSGtYEPlF18UJ000B
         /yW/i67CEnIsVRfbsyZKUlrdJ+mYa5fpUmF8uWPo83tY2MU9ncynaLxSuFtFrqeEzXtN
         y6pt8nuEzWgG7tP4yCTmC7xu9RiZTd4lAhFj4sUmh8+BoH9BET/1/jZW7NwTIgJF4urz
         8v4jrdkb2+1jots44sla1AeOyTK2ditDw7rkyQYEF2EjnsXTP2JyZ6fWaVcSSwQmpZ2S
         /0nS+KyxN/YkLjdNe2QwpmJNhYab4SuFsr++ndXWOV7F2D4kWvTUFWtTA/zlItFbeVUD
         k0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016925; x=1784621725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v3T/GQPfCFX0/32VfRd7BGJzQx4Npq1DwXlYIYPAls=;
        b=VXg/QpGKkKdvJLNgEUbJoRX3sEFbyCHZzIT36YxiToSQgqmU6vykbLccTsoMR8OSf2
         xFoIbEWXcuRBNhPgvojPamGAiBfJEfX7IZU/yeci38zKeGoq9Tot5U7fc3ZA9NcHFUHW
         QknMPlyo9GK9zbCYBxWgFF9JJnXQirbS7dlA1jJ8CK+mXXzdqzYXKQN7q97mGQjDUzif
         XcHOM+UHvQQIXcr/beIX43WI0NZ+kPRzOo7ZnA8AByKtr53u0aibU1p8jLD1US9/q83N
         eVKWKuV+webonWlUMwiWYCFCTTCwtPikpquSeyUn113hIo3LlhGj+4ODciybdgrRlo6Q
         Lp7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrobFqhsI/1ncugt1/v29j9oHti96QJVTyUj+Sui0K/cXR7hrHN3gV/vkueupKEyleaLA79NAxAC48=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5LAQmEmreiIkuirj0DwVDtpz41SBR77rrl9KUk659AA/nIme
	OnplpFOoOjPR6lNtXBeJzugzpxG8krnOfRzMtLIxdfRk/+1Y9oxL0E6+
X-Gm-Gg: AfdE7cneUUNtnUkREo0kwPeRdWMtVfUkLvKk9g0WJDVEC7osXgSWrXKm4VUuClKIhcr
	d/cF0zCD4U+TTcXtPBNonFXEEKAqvFcwkIMhA5V6CzL/EkigxCTRudV9Y0zFjmYmXpc80/8BCJo
	HDat9vG0oQt1ixk1R/GEsIH4MR0O5hA0pxHz2JGfoNTkyy04wp/FPvhreT4S10aZ2ZHBsU11vdv
	gWvzF5Tytd1SWpijTmdVXxRD6M9esdf52squXZWz4n1TC4WO/UfNLW8BWBKFOEVcAQjMp0iy7pd
	C0skgpA3B5Gd27koWaJZeORpwkYhSqdAfnB3cNwRE9sRAq1xGatRr6L74V7F0BfSPjQsvHrtd9m
	8t/VO+y6STxAQmHwEe/MbMeFYnQWtzMjkM2gupY7InxnSZzNIki5kgPekL23IHq1I39j1fUB0rZ
	1IP1+F6MYRfhdJZtnWHg7xAJPX/95kOQIyxRcUJe41
X-Received: by 2002:a17:90b:3b87:b0:38e:120d:df07 with SMTP id 98e67ed59e1d1-38e120de08cmr3459964a91.11.1784016924878;
        Tue, 14 Jul 2026 01:15:24 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17443f4fsm1091008a91.11.2026.07.14.01.15.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 01:15:24 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH 0/2] mm/zswap: Fixes and improves the zswap global shrinker
Date: Tue, 14 Jul 2026 16:15:08 +0800
Message-Id: <20260714081510.16895-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

This is the first half of the patch series[1]. The remaining part,
which covers proactive writeback, will be submitted later once the
swap tiering design is finalized.

This series fixes and improves the zswap global shrinker (shrink_worker()):
Patch 1: Fix missing global shrinker when memory cgroup is disabled.
Patch 2: Extend shrink_memcg() to support batch writeback and update its
         return value semantics, thereby improving the writeback efficiency
         in the shrink_worker() path.

[1] https://lore.kernel.org/all/20260629112032.20423-1-jiahao.kernel@gmail.com

Hao Jia (2):
  mm/zswap: Fix global shrinker when memory cgroup is disabled
  mm/zswap: Support batch writeback in shrink_memcg()

 mm/zswap.c | 100 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 75 insertions(+), 25 deletions(-)

-- 
2.34.1

