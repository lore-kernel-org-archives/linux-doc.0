Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3557425A2DE
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741696629; cv=none; b=VTqAJHlaFD7mnAoRMI0SJ3SJ4uJdRw+J68rSwyMMCWlQIYTDT5DyvUODym20LkaFjhcyG5iNslSM2L/cdV0w0WrJWFZnadsywXWvkawiHM0n7+S0ar8G89YT/yBzCzuHdZ+6u7MS3lmblbB/uMWsZheCvqgpORJMjVz4qMGsJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741696629; c=relaxed/simple;
	bh=lpN6C3vH3f4PCCjaCmy194/gBX6pshhqP80Aixto8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvcdVEu5FHVctCNniZ1hlpcrnYqwlj7cmFu2TBLrh9RySJh+YV07A7eMNNYLuwvnYsA/d0TJHFGxO/VprmA+Lk9PnCyf69Z4wRzNgFEKGEz30cq8nxH19aS8Nv/ZdtCzwatGPopKeS6K93jwxoUe3UCfOQJTOJ2EzkeAiKcJYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IlIo8lz9; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IlIo8lz9"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-43cf680d351so12936625e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741696624; x=1742301424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzWC6pSc3pyPRb1xLnLmWP9XGPQURz0PKrv7Tm61llY=;
        b=IlIo8lz9LT+JHpY8qdbY//hWbYR8TdrXcFpxAacz6k/ajVvUt3xtikno+i3O4l6bhi
         +X8Kxo6SKvEL9RhzRIgQlTTUYGoeJo/fhdycjwASJdKuoy2htZnd9S3ZQ2Hlkrv/IcxH
         TMvl0Smuf2xdR5rIgV3GL1RKc9FK6JkGV0FbNF9JyxJAYzHy4rbuWasdFbwWB56EGWW6
         cq0P2iyh607LqApoNTjE3gyZwColq/zr6nL74CQer87eQLcixzDh6tmdpz7KJcIJnuaL
         JswHo8m/+IYhq7MiF9V8XnQCVQPIobCmzl0UY1vCmXGnhlGOt+QvxjIGDKSQr8jKwoEY
         QXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741696625; x=1742301425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzWC6pSc3pyPRb1xLnLmWP9XGPQURz0PKrv7Tm61llY=;
        b=tUND+PTTuKtUUVF3pxpWeA0zlCMWJr8s9hX407fbtuvaijdgMIEcNKpVyxEmVuTgq3
         LglyN65qtlth4QJM0YNb7YUKpGIClFTsEuCOXP4U9EqmjUPvzy1PSCEC0dfMj+72XIju
         JeE64MjUzatLvUhTcpQwXDJvpcHkWkC9ybVl688EKM4F1orFfvTjFH5HlXXVbutdeD+V
         usAxy+oNaFsXgdpj/E8ZIGVh7kQFvdTjaVaoTHd7An1UnWCWxL4MQaqJqKLGOSBpPbmo
         QcPcctOljz+OH0rOXeHKdO2lDiTyOa6U0XlkbIsDm6faWaYcs7lcytyyev8d4JpZMT7q
         JnHA==
X-Forwarded-Encrypted: i=1; AJvYcCVyxUh+RSY0kf1Hny2HRz0mPSj+2WH/7cGU5LF+aJNnP1nQMu1xgbJ2JeI7uNKkfBx2eRndr7CzGIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qoG6LxIm1XIS21SfV3BV3ADQgUzHSYMv0MDORoW40zLmPQDd
	SxTuIriOOecXCCIbqq56hJ2hVhOB6MM48ytisbg6mIBVf3XH9CbCde8zpCUUnew=
X-Gm-Gg: ASbGncuaRZAGoY4n4KAwFuOBHtflPtAvMs6Klr/uDPIrdvpXD+URJrWbMchFtIlRYxr
	8y5N97SroFrc18FJr1fh1sTv1gilPLIGBZmgVTzMARIlpXNmRVLbllngbiiN2DuI9rjLifiCiGQ
	VVPP2RWyIFEIeVYvWKa6vtjT6yR7crzCxvSxh15fhJ3tfrhUh2bECCUAovqXIHD4FHs/z3hlstf
	5KFom1eQrKgx+LFDU1UeLYEd7VaWh71Wzsxrr8EBd3CnhfsO6RuGM4V6A6tmicIrmyCKOxCoVV1
	pWhfSVmUpn5PDOWUtrrkt+PTXjbLqGRMPQPpLk27dPhTxOE=
X-Google-Smtp-Source: AGHT+IHjGGtwlqaOo23AVRgIZZjsnb2eS9q9J1v0DCucwlPhaecePxi66A9LjOaMhcu9jnvCUdaHIA==
X-Received: by 2002:a5d:6487:0:b0:390:e9e0:5cc6 with SMTP id ffacd0b85a97d-3926bdf5c18mr4141501f8f.1.1741696623166;
        Tue, 11 Mar 2025 05:37:03 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d04004240sm9742265e9.3.2025.03.11.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:37:02 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 08/11] mm: Add transformation message for per-memcg swappiness
Date: Tue, 11 Mar 2025 13:36:25 +0100
Message-ID: <20250311123640.530377-9-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311123640.530377-1-mkoutny@suse.com>
References: <20250311123640.530377-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The concept of per-memcg swappiness has never landed well in memcg for
cgroup v2. Add a message to users who use it on v1 hierarchy.
Decreased swappiness transforms to memory.swap.max=0 whereas
increased swappiness transforms into active memory.reclaim operation.

Link: https://lore.kernel.org/r/1577252208-32419-1-git-send-email-teawater@gmail.com/
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v1/memory.rst | 1 +
 mm/memcontrol-v1.c                             | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v1/memory.rst b/Documentation/admin-guide/cgroup-v1/memory.rst
index 286d16fc22ebb..02b8206a35941 100644
--- a/Documentation/admin-guide/cgroup-v1/memory.rst
+++ b/Documentation/admin-guide/cgroup-v1/memory.rst
@@ -90,6 +90,7 @@ Brief summary of control files.
                                      used.
  memory.swappiness		     set/show swappiness parameter of vmscan
 				     (See sysctl's vm.swappiness)
+				     Per memcg knob does not exist in cgroup v2.
  memory.move_charge_at_immigrate     This knob is deprecated.
  memory.oom_control		     set/show oom controls.
                                      This knob is deprecated and shouldn't be
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 2be6b9112808c..29ca6489b4ff7 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -1855,9 +1855,11 @@ static int mem_cgroup_swappiness_write(struct cgroup_subsys_state *css,
 	if (val > MAX_SWAPPINESS)
 		return -EINVAL;
 
-	if (!mem_cgroup_is_root(memcg))
+	if (!mem_cgroup_is_root(memcg)) {
+		pr_info_once("Per memcg swappiness does not exist in cgroup v2. "
+			     "See memory.reclaim or memory.swap.max there\n ")
 		WRITE_ONCE(memcg->swappiness, val);
-	else
+	} else
 		WRITE_ONCE(vm_swappiness, val);
 
 	return 0;
-- 
2.48.1

