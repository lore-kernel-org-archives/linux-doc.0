Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD70361DD0
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358384; cv=none; b=MQxE20bNa5mOs2ZydzQmHhgtlyoQACIYqgeX/Zb+RFvK78GzalxfWXUAGZWQ9zAg8EaYYMULBZ1jsT95VlTlThepyktnR9sUIQsodgCoL3Kxb8cbzPothuhMfeG/r1mUQr+IK/BVmXcWuBc7YeBqTKAfAQAouLx0gyQqlAizE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358384; c=relaxed/simple;
	bh=V9oMmKBuAy0HzNU9dHvJsrEVQ950oTkPENYiU9M38dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyA8ymlmdWHqEBEalFfKo7PsOQFIX/hT+a6rw+B+kE/6C9lc2AjDVtMuSsf2/rmfUISqNTXK3YjPZ3K6UOJpj1ekKdnw1T97julatQ4nYF2jlFg7bH5OuyA8S+8i5UVUeuMAHYJ9S5+QuwHI9pMN8EWDwsQG9tbjceDIePcGyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZLBQI/n; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZLBQI/n"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so38745095e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774358382; x=1774963182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDW9QxylvtudolC4OrULLL0I8iMCwV1m1od/FFAOgBU=;
        b=AZLBQI/n+B8UQ4z/PBbbRta7WCkJBhIqf3t/ICJs39g27m1N9Qrdtn6b1Ql6lHrDN9
         plFbuZcDzjwS3556cyOQBHeMrKSy9RpbOH3fvO0hsgy+iMAhnlJFHQgeGfiUwKz9MgeU
         rWoNt3C3hwxsyqGLHBb14NxaVWtCHUcqeNDe144p+yucaoAtspkoTpYAajWyt7FMIPxt
         2UklR6rODfMt/q/bNs84cmy6iSxqHQkoyEQrIvUuAHRUXwGzCHnxjsDsuN1FA1cJWPQ8
         Zvc7NjeF2RATIqk5C8e8snnd1qvtL/zhJZl9Ntlgr+0NmKmg0i9poPa7lttRZFB4vgNZ
         NQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358382; x=1774963182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hDW9QxylvtudolC4OrULLL0I8iMCwV1m1od/FFAOgBU=;
        b=lXWmnzQQpXzwA00pwDh+8hAtTyg8P9iErtILRhxZuXmFb1O7NH2kPO27vtBuxK8v0w
         3VMi1hT/8zS9N4cexEB9YciqqMlrAOPoM5rRRHKVUzG3Mjbl1bfFrnkwh0OPoavAMQoO
         uvd3ipVBlfLKh6C6c/Ndm0PLtUSS06r2/aVh80PgOsMl77BjwbaSjfujQIn9hWFwZ7h+
         xT14OdgoWr0WZvnBTOz67TQUWfUctEmN8wWFVhMAjzWWJSyLvJZ6WQKtS4YTBKBytGBv
         Jh/zJ2DrCvXG9FF6d82vErLjJH0CObwsxH63XmavqDzahdhpvFEgboAH0SekZQZ3bP8Q
         5lHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6nzWBNSaB18zhxn+Z8mdcNYdo9NrV0M1MSRYInzojKCKq/sD2cyA2EmzMOvsACB+veYcD+6xwpKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZNV10BuK0FERO3NSEw6sjSkZytMI78NcmKsqCSzpVApTCiLf
	nYWqHe+Lfpap4ulybDpcW1d+c66tqt+pnOULnX7v0JL2WkoaxPaIqIc1
X-Gm-Gg: ATEYQzzBQr4/+snqDo6QnqlPXLQ8rKnSPArwaMqflbkPQ5CsoMv9nX057sB2J5a5wQQ
	OfXvdviOZ7AQ9PVscsUvGmKvvGF/yXTpCBmJm68QCqXuaCvL7MOpWOwDbZn14mUPwX3kWUjh7Tl
	5WujuA1HhTJiQTRbkfj8tcGfpNdyyNPzX7QDPoBcNTtlF/Jy1owsey0OXZfFfhSSBu6cI48YiWN
	flayqLdJSdBoze439yijm+klcC29l6Te/HY/XqEhckQBXzW6Rdhx0V2NzZ7orKLuqSnPCuENTxb
	/+8NWet3S5Hcvj3ysHN31sc9QZbJoceLRzWBEJP3wES7wtAsqc8sSp9FSeu0ttQkXZ1+SscL6vC
	93oDIBI9Lh2AFmDB/daqxfxLlvKRLr1B+geF4nOhQYyue6JT67IutxP7UheAcPSd0a4zsxHfmsu
	FQuyzy2cp4gbi8RqaeZ+c=
X-Received: by 2002:a05:600c:1c16:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-486ff04fb4cmr260524475e9.33.1774358381485;
        Tue, 24 Mar 2026 06:19:41 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-487116939b8sm77926095e9.3.2026.03.24.06.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:19:40 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nphamcs@gmail.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	kasong@tencent.com,
	kernel-team@meta.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	riel@surriel.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	Kairui Song <ryncsn@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
Date: Tue, 24 Mar 2026 16:19:31 +0300
Message-ID: <20260324131931.4004123-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320192735.748051-1-nphamcs@gmail.com>
References: <20260320192735.748051-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nhat Pham <nphamcs@gmail.com>:
> We can even perform compressed writeback
> (i.e writing these pages without decompressing them) (see [12]).

> [12]: https://lore.kernel.org/linux-mm/ZeZSDLWwDed0CgT3@casper.infradead.org/

This is supported in zram. The support was added here:
https://lore.kernel.org/all/20251201094754.4149975-1-senozhatsky@chromium.org/ .
It is already in mainline.

-- 
Askar Safin
