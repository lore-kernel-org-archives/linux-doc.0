Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFB206F06
	for <linux-doc@vger.kernel.org>; Sat, 25 Jan 2025 05:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737782747; cv=none; b=IM9lyVDk4pWSqDSJY53zQBr0GEEDwoVKCOQ7YuiAK7KSg0quYpEWQItDexeWg5DMdUs3u+r0FTlGcEeQ/lk9PzejvoucR97DbHSxiErZVPv7jKjn6Npe3n+ezEeW6/pYpmTzmrlnvkzmvH4ZtDZDI+0b6jeq9e1xm/YDKguBwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737782747; c=relaxed/simple;
	bh=a2EY7aaBq8HZEK3Tz53FoEOt8XTSEy5zw6G63alwJJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ibJbN9QUxgwupDenON4waMoJkC/anJCiX2BETt/8g54jT25AM6J5hLkDb/Bcl9oHK/YVzyAr+1eHXIFuIXpK7VoMvDWEAaBquj0z4OuKFdN8zEow4cTiwwFl6AKsKszl+RCxVmR6hqBxMRCUHgmt56U6CxE83WiHimy5tI4I+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LF4rOXnr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LF4rOXnr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so610471a91.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 21:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737782745; x=1738387545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbA5Vc/p7jG0EkRkkCEVfocE9Db6+ixW92buSIAp1vA=;
        b=LF4rOXnr93Ek7igiQ9vzfmWfO0Q7PBiSAT1bnvNOV4/858w6YW29TJbec3R1mx/4Fn
         e3r21qSJvzwHS611dWMhRxhkJ7p0VhzFfcpRwtQpB1357Dwc6Vt1JPTrdnWOGWosO2Ti
         TZp9Uuo2LfTvtcx46DNfVs7ZePB0NxOP7ZL3bKu/qJEt0MbfP9353mk0K/1ROq/6PgzZ
         jVD4P81g59lZ9MnhSIS9R5xsvCcc1hhBMzkAMrjrXqZKIXe828nQtascUXkMDQyAoPjO
         VPIOd+FFpr7SO9cjIK+4BY+GtCwTggwJ+LReyIee/oDlVDbdI5OuvP8vCs1xCncnP+Mu
         sYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782745; x=1738387545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbA5Vc/p7jG0EkRkkCEVfocE9Db6+ixW92buSIAp1vA=;
        b=YL3bvcLQj/yM617h4dEXebPYs/CinYc2qFRlYuUbhe4Wp6Z5LUZA0n9ztFMZHOMtkE
         4pkOlMQkHtC2Ygd4NMFaM68jcPYZmxXFkuBzlHlGU+NLRbeqmDRol0yKoxRfoIW+fc58
         0VFaEkU7j+r+h9VrFzRmdoq2engB8llV3JWHZnWXMS7ccGbkJasFsKBXfZHbLgO3/6zj
         gGZp/GNT+FEkOiubR5lsVQIwA+vfgL/cbbU1rBtBLYmcoPSunWuM7MMV39LuIMHRkr0i
         ShO+8aURGwT7kaYfmdy7zn5NNCHe5ml4ZCTtzrF+CYPeiNF/XB2wwXQwdBnWWctYMNqb
         PB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbNNVh0AjwHb5M1vgk39NK2EeHXDXpJLRzGQUi0HotJQX4xTcg+oceFmcyq4EHucHl/B9j/erXQRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nFVH+thlVZ/PqdEcmKTwLpEyjcvrHrT77hm4ejlDNo2HIGEU
	XrEKbeu+5icCgo3NyPvZ9oQJj6FNeWHc9AnkRNN7gi7gvERMBQ4VUs5W5GAcbxGH6zBJiZL7XTC
	B
X-Gm-Gg: ASbGncsDeH2bV4C07i4qogra2GvpcxXVb/fk/al2cSmxAM133As2+VOT2BFoHPANKpv
	294IYc4UfApSynbDJuXUa8LhGZXyhdbzP4ve/x7r+z1E/38cSqXOg270tfqr1TLI+DMBOMenHlW
	Dht1crsGl9QNbeDheK+9iXBxeZBV3bA73Yocw6+BPVGVOdbhmaTiUtDPHjKEpbxt6Mo3+I3f3kj
	+g/O/POQcOEH0CzxnqcUCSNUmdaM070lNgo2wZSbulSzAuNoDCuoqM+naVMxzNU1K71IoFxX7u/
	kfyL2XiQPsea66L1KJLlH7rBaCRmATNTyZ7au/8tNeA=
X-Google-Smtp-Source: AGHT+IGPjWX4qVb5BtdEM0bm6ThIQyDK3FZpMNGfXlrJZlmK8SVr/pW7if9Daxdls5M25Y1cTIsKjg==
X-Received: by 2002:a05:6a21:3416:b0:1cf:3be6:9f89 with SMTP id adf61e73a8af0-1eb211833famr20512932637.0.1737782745130;
        Fri, 24 Jan 2025 21:25:45 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbdc9esm2563856a12.63.2025.01.24.21.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 21:25:44 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] Fix and cleanup and extend cpu.stat
Date: Sat, 25 Jan 2025 13:25:09 +0800
Message-Id: <20250125052521.19487-1-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1: fixes an issue that forceidle time can be inconsistant with
other cputimes.

Patch 2: cleans up the #ifdef mess in cpu.stat.

Patch 3: extend run_delay accounting to cgroup to show how severely
a cgroup is stalled.

v2:
 - Fix internal function naming. (Michal Koutny)

Abel Wu (3):
  cgroup/rstat: Fix forceidle time in cpu.stat
  cgroup/rstat: Cleanup cpu.stat once for all
  cgroup/rstat: Add run_delay accounting for cgroups

 Documentation/admin-guide/cgroup-v2.rst |  1 +
 include/linux/cgroup-defs.h             |  3 +
 include/linux/kernel_stat.h             | 14 +++++
 kernel/cgroup/rstat.c                   | 75 ++++++++++++++++---------
 kernel/sched/cputime.c                  | 12 ++++
 kernel/sched/stats.h                    |  2 +
 6 files changed, 79 insertions(+), 28 deletions(-)

-- 
2.37.3

