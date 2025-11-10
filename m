Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02730216A
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803408; cv=none; b=G1JCetEwbB2wN8NohD+KvV3mXYCFU94tQnna/5rRvMGDxUJeJNAx7IQf1dKAhucWbfkx/28qAge8fuvCWM3ax2nb5yJvF6gWkqZ1ybO1kL9WdTjc8ZQvjO5oiP0QsxPkd90hnzNx1EHACMXchUXWq6ZGXWGGXL1TymYnaz5xot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803408; c=relaxed/simple;
	bh=uOPdRM2zXUbj0uAF4/Y1KdXhAAYdQVcF5zz7omcQwNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uOBlFyC7wSf2hRrOxVvQtreyZ6vOW0ewSeEDFjWVJLrwXBtZ0UBhJbUeb9h+hJqObZWI993hExNF5+EVoadqp7XFS9GiVjw+a47fwPdGspXqz8PYQIRPXzQZKmQlbSJTfR+s4fPdiiUxUnVtaYQOaCwY4hJIdrI9kUE2AFZqCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H2VjVHLy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H2VjVHLy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47728f914a4so20265455e9.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762803403; x=1763408203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDpt0zy7PtnsCd6fKg/NI/I37lccoSys25WO0LkUemM=;
        b=H2VjVHLyJvbeTUJmvaX6D1/Mk5MMIzvGOzaQ0YqgDPSWmjLUWywvO7mHfVQVCldqig
         FdYnboyQqE7doRR1hyBJx7CVkbvbgNsg3Xz1/fkOoodMaZhFarOWw3geJOxwLGXTnTKc
         funqi5dWl05SbdIRZ2bWB0GgackLEXXsk8XSH9QPK5PTY5ZXIlOY0v1S2pKYcBi0KZL9
         u4LEJt1P6dfaUAMwXJgZaVwVN4c4jei3eQes4nZ7cX4eV5mPjJ39f7JcXcm0LqCMkwTK
         Nll6ntBK/xDWfEyF7iBtf+rK2TOlIfemg+tIQDboywb39uqAWYHQ1QdTCgE5vtqmRosW
         Axxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803403; x=1763408203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDpt0zy7PtnsCd6fKg/NI/I37lccoSys25WO0LkUemM=;
        b=BGpTqzgNapsUKNMeQdvijEUfeKJr1/FLvTus0NjCScuEkRVSjLsxZ9dHYZobqCXDjA
         IdY9Zc15hrtv7whNQkQqCMeAeWrbWKUxS6hDN3VyMaslMHOo2D5/JDGldjrhEKQXFoVd
         JZ3li4PzAhzB+TRB/wogPhv0GF2KHmRNuLgX6DO2EmRnZPAJ8YLU7E/A1f677yFp8afm
         5MvIxiSEbtuFsxd1APzj0K4zU9ejmnosOtQCubfWw1esi7LXhSfrGJUp9PghCPqovOZd
         oNCPYEy1Ox2jovqyxoBsQfRujgJVFa3LahHOvxPqZFlrpGWIDdgZlEKcsIO7U6SPB53V
         UZkQ==
X-Gm-Message-State: AOJu0YxI6xOnOswJvB8Flys0YsNqAhCFfGFkz4jZ3qR7Zg/ZsTN6dKEU
	phGLfM1mbX0O088EQDOALvEHqCUVAr9nyn9Mm1Az3wFr2HmC/6WL0owwfL5qanAhzNwyTFZAiic
	DmKaR
X-Gm-Gg: ASbGncsny+EX++f0wsv9f+odTzGdUoHXgM6b7dun69bl5zpe75baMwKVEDNHRayhb16
	P/GKHKv4h9M/VFlparcoukoiZtMEbsg/sLXLcfOa5b6uHSP0fHURdL48/SvfrF/qa77jNXa+Zfh
	hGN1ZXR5xZZN/Q52OFiVjM1OTy7M7T1w+fUd+bfzvyGTriSlQBqjztpoU9uFe7XLEMidSX+pv4R
	G6KxsmOs8OUUjNMco2PzBRSq8HEwcJXkaXXORpqY1uqyt98uxzsm/1FBIodGQMQhD078ETjIHym
	bkJDZl1yiatJjDzDBshgZ3t0J1FI8RQgHVBucbRPgSTL/Q1hQLWK7M8/znq5mBNBS71JFIr8GEq
	ISJEmVHdyMZbTRrj/Fvp8fgAKcuHBy4REBn86itZRkK7sM4nXttIqp4Qc1eoyKOq1PrSoPkxhRe
	032dCRrXs/a5DlBAtJXaWAXm+O7sATrOM=
X-Google-Smtp-Source: AGHT+IHeuLkKSsH8AzcRusY4bSGEmMJr+yCrFo1Kif3KcLfYiwCAAN+hODaeTCLagsz7hdm8X9yqTQ==
X-Received: by 2002:a05:600c:3b01:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-47773288bf9mr97918675e9.31.1762803403412;
        Mon, 10 Nov 2025 11:36:43 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm336766725e9.13.2025.11.10.11.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:36:43 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH RESEND 0/3] Memory reclaim documentation fixes
Date: Mon, 10 Nov 2025 20:36:32 +0100
Message-ID: <20251110193638.623208-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I think the reclaim target is a concept that is not just an
implementation detail and hence it should be documented how it applies
to protection configuration (the first patch). Second patch is a "best
practice" bit of information, it may be squashed with the first one. The
last patch just makes docs indefinite until the idea is implemented.

Originally sent in [1], this is rebased and resent since I still think
it'd be good to have the concept somewhere documented. (E.g. for the
guys who are implementing protection for the dmem controller [2] to
arrive at similar behavior.)

[1] https://lore.kernel.org/lkml/20200729140537.13345-1-mkoutny@suse.com/
[2] https://lore.kernel.org/r/20251110-dmemcg-aggressive-protect-v3-5-219ffcfc54e9@gmx.de

Michal Koutný (3):
  docs: cgroup: Explain reclaim protection target
  docs: cgroup: Note about sibling relative reclaim protection
  docs: cgroup: No special handling of unpopulated memcgs

 Documentation/admin-guide/cgroup-v2.rst | 31 ++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)


base-commit: 1c353dc8d962de652bc7ad2ba2e63f553331391c
-- 
2.51.1

