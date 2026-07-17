Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F530568E
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278326; cv=none; b=hdvJKCuhkyx7afbnVXnX1JqEPoypZPV4epbMcKCkbw3kEXXi6E85aFn0eknIzjKb5bIruvgvtxgo6NlIVQ1IDcLNCdGo1Hm0gRrfQev6kG/UkqhbMDMbq2M0S23CESGbbpBMlULD0gjhMi0S94/0/dFSY8S2+AmRxae6VAVLKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278326; c=relaxed/simple;
	bh=WlyMPK6R/S/Y1XNv9PKf/FvucUrYL6Wpigd329uWio0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rdjHja1VL7Yqwly5qZYryR5y7HUoxOGwB4O1BYdOzaLWugXb4KrsESImvIQMOqPGk8jHiYGaQ+VTsYVn39xk7QN4BzkOjxRRpoNhu3okdsm8I2YoNi68QauBKa77w6n59/UaLKDVS4/iBzZ83XMzboOiDHvLVcbxav6gz2ZSRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQGS6W0K; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQGS6W0K"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so7462216b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784278325; x=1784883125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wikoEJgumCogKcLX24y4Zk/ieEahhJU9VfHo8xwaYrM=;
        b=eQGS6W0KgZmEqr5eamI2ZO4diufPkuNRh34WzUifE+YGRhujyv0h+49SpzNFbOIkhs
         J825fvF/Lpy8jjdRgkEr3Pi+psnVd9QA7EcRKjyEeQBJwJvDYoBjfK/lx2uHYOiuqE2I
         8ZNw9bzHT6oaKFmb78enasfFN+/0wsEQN0jcBfVLbaD1W8jBy4bDf3JXr5/dehT7xI/l
         KOGsSJ02YmloY3Cr/RAeNz9wNuYwthisqm96aLgPLPzpilgBRmYVVzIRBexWYudo40Se
         OtyQiBKbULYM/ZUrFljSbF+CyQnAOC8Wt0BnAwTecBoXdNkeia/yHbI08Qg35D2Q/XgM
         XNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278325; x=1784883125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wikoEJgumCogKcLX24y4Zk/ieEahhJU9VfHo8xwaYrM=;
        b=jLO0hjj8vt06P6vqWlNI19yGiyLbI/RU0kl6mcqKU/8ha0Ki/+nrx/EEI8aUwoCW+U
         rzy/PIH4AjK7Be0cIghn4Q5kSDpejUPZRu4GI3BVeXk5GudaaRzmPFBoL8jyJY7RaEc3
         sxcPDI3tjzJFZYUL3LIVoG9XvzL12Xoz0YU4lvIJvkK7cUxtnuuI/SwkRR2dlS8p8Ffg
         3ekAbTFm00ZDWs5DNJpZF1txM1u9sP4JQYsSCtGLCJXuK15U3ze71WjKye/fGm+HErIN
         7VEhDDXoayIiPq66/dh8PBrmor5LG89+XolRAOm+2w0b2NGs8ljV1by6WyVDnOcTi/17
         b+Pg==
X-Forwarded-Encrypted: i=1; AHgh+RoUOnxi7RlNDAY5sbX5fxq5mq/dTJUCc0NAkQipey6PEJhGwc9TTv2ICH+baf8Kycug5/gRJpc0c+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDho8S0xUivoNJ2IegmLEVcuEkfvT78gUtmy7vB1QOJO3byLL
	eodlR19xtP6qCmLRBQzMSmue6mepioM91kJo5LF4NN9IgaOPJWy2xeBxVBi/yg==
X-Gm-Gg: AfdE7ckMgj1tL4f42HChNDkbU3CNiZyf0SGpPrqVro8FJACXrQnZ08LlFSE0Z/GEY8q
	JzswKwgmLq/ZWlkWOxaVb5ykSWrtBRF2RtU52cod9Se1AD7C0Bvqu18w/f26QLbEaTZhUYhvCrE
	xd6EaDxvhAz6ymgscAmPiKTW2E71p6BtQXwVAtVl9N/tn0umYqMLOJmTi9B2wjCQ++GEX+M9P51
	puypF/a3vfrGIHQ1w8ELIy+A9GCccCQn4bIW45LvnxuoWRg5jaCFDuN2FaMvegG/DZ0jvRLhO7j
	6DE0BVwxJvXylZY8Rj9Dln/7SrGDtKDhLueiwZERHsV4dQ6cOwRBbPQy+wWxIalY4u01JSztzoO
	/lRd+jzSOFwmKWHIitc6+cNh/tAuOI4pBZJ4030qJWTssyd650M1DfVjCAggUAtklTaPJI3a1b8
	rCR0OVtPLYBk9VvSUrmAik6BQuAZjQmg==
X-Received: by 2002:a05:6a00:ac03:b0:842:708f:39be with SMTP id d2e1a72fcca58-84c292cf660mr1685117b3a.5.1784278324807;
        Fri, 17 Jul 2026 01:52:04 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f477sm619474b3a.58.2026.07.17.01.51.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 01:52:04 -0700 (PDT)
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
Subject: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global shrinker
Date: Fri, 17 Jul 2026 16:51:49 +0800
Message-Id: <20260717085151.22822-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

This series fixes and improves the zswap global shrinker (shrink_worker()):
Patch 1: Fix missing global shrinker when memory cgroup is disabled.
Patch 2: Extend shrink_memcg() to support batch writeback and update its
         return value semantics, thereby improving the writeback efficiency
         in the shrink_worker() path.

v1->v2:
    - Add a reschedule check to the -ENOENT return path in shrink_memcg() to
      handle the theoretical issue of prolonged heavy concurrent zswap stores.
    - Remove the shrink_memcg() return value changes part, and include a more
       detailed test report in the commit message.


[v1] https://lore.kernel.org/all/20260714081510.16895-1-jiahao.kernel@gmail.com

Hao Jia (2):
  mm/zswap: Fix global shrinker when memory cgroup is disabled
  mm/zswap: Support batch writeback in shrink_memcg()

 mm/zswap.c | 60 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 13 deletions(-)

-- 
2.34.1

