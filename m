Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23C2ED84A
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267426; cv=none; b=U6pYNslqO8/VIqmXrrZNQc82qgMagH9Mga89XB8TE/kNZcQb4jS6AslQmo2gZOUE8KdUXO46kDjoU6g2accNx3R9f3//9IcpGH+ob5HGxz+MIVmvv3gsTTgzqFZF5ueIhRD0hWkRnXZcKF1dz/OBhB3/U0iIfs2cyyABp1PkSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267426; c=relaxed/simple;
	bh=kxSqByyeQG8x8Q3nvxMnhN6h3epnkIv8HdewAakEGSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sMUicdYw+kXmcEncTLsPFA6YMDI+vl/Di+NfIk+Cw2EsxJhK6GiJnG9FT3pwVuUHH8qEHUr/dqenqBgVsWdmvz7r3AOKfDVaKZMOB4IEVDYSyBq2zVzp0rLWdvdCWTupQumO+SERA7fkBvLVVHUxQU7RIsqF7TUAXT59++6T5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQgD8rGJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQgD8rGJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so91468a12.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267424; x=1791872224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jlBcrEL7AxGWXF4qOYzXsJylUauI2sPDbkv+5OBUgw=;
        b=OQgD8rGJaBv+tdwY7tkCYuJDsbumeE1CQBWLMoIr1dMskaLks+209xKNGyoe75VKJY
         WYCREIO9cAeX4tEvlMmbMSi02cLzsfH+himdNYZWbjKYiJhR6GLs9z6s6ZwMx8Pr/F5S
         u8nMB+l48F0JR52Lt3k0r7TWgtGMNpbPBYUfTy7/cziSKUjY9xestBJAz8Od594fURw0
         3AmYmzeSKYbOGkqyshekNL8xhMxJYt9CTW3aL0SooV5aOgZDUJSTGnzpxrx8Mpnmxdq4
         5cyLa/3jjhpzrNbdhtxQZEpBvn1WvbAk9mpdGvaVOPlm+OiQ60gUlECEGbu00TrLJ3kQ
         MX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267424; x=1791872224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jlBcrEL7AxGWXF4qOYzXsJylUauI2sPDbkv+5OBUgw=;
        b=ihmUK8Y1fG3hcNHnriLEwOoWpbVqNmAYWGJL//j8gxDkkSHrPyck13qW0eyzeojy0c
         J2j8+g7ax1k1rOjuOVcJUnqpahv00HFOjbVT0DiuZ7bb045UD/t2VrWTjyF0Kvomu8sU
         Wvgq6kFu7qWZkrnJlERnOK4Is2Xw67MA8yopV3joBdtZVr5vbh30wb3yBasBaRMm5voz
         TWZJEHBMMVS5O5ToUtB7OTZcyCkJN5dV5yIS9FJ+0I1c8H9dcrJKr5jVdcW5bBeJQsf2
         YtixW19iEfroJTP9ru1dxWzTPJuWkVVqeXG9t2g4C77vqZpGPQzm7/rdjJ7aboKSwv34
         gIHA==
X-Forwarded-Encrypted: i=1; AKwUvBwv36BLIqNiTv/eSvm4Bqp5K4I2eQfNEb0iRebdCWYmYgiwp+drKl5JRG6c3MHqYBzQywgsQdwyidU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqm/MELPURDg2sARwpmjKCxPvJssv0d1GS0E7qZADvCp7ETZpe
	4Fa/TbDPHWLnWBrew42+vr72en7TTj80kAFomtmeu1BztpYGJrGitdDw
X-Gm-Gg: AYBFou1vwi3bUBPt8FCEYTE7ht+LhU7PGIG6GdVQcFCB34NGgKT1xdzOqMHB11oMWhK
	LPwcfx4OatVFFgRhgOkr9R4J3+Qe8O3zzijHyGU0q9up3oUG0hn0TvqAIwUMPVRbFD6WO0me2pH
	y5B0m38kp5dq5eeaQAqFRlk0jN6aCpgCT5eiznZKcjJU/GhaP9k+4fLIT6JCsGEZ3CwEUKIn+iq
	IuebAwaq4hFQ5oFwstuwGbCpSRCr7bjwDYxiSR9bVRBvzvYi0RYt9X2OXkFkdcEsIxZC3WkI066
	9m960ySytbhuPMdvZ9aDAAUCyE3qn56tu+bsLtp1qb1/iFtOjwjm1XrCfOTbuu/pfJOVWnyf6wF
	lON7hD7+g9/kiLomUZ6E3MF1l58D6PWOr4sf5z0n6cIemfL9vlyzMWZF9jtioE0w86uDGZ675Cq
	kCZ+UzTh7ZkL5mffL3592Skj+PYfAHkxmgvjeCMf8E1AUxpWSinSQF/zbM6U/2xMWE+OqP8ecmJ
	ROJZjMaNNBGQFLEymnGkR97lPLyTJ3AzvZXWk1ugcH63SnQFiIIylXA5Xnryee3nM5xzhVkcyu1
	+oRm8eCfVV/0/OMJ
X-Received: by 2002:a17:90b:4a47:b0:3a0:9640:8043 with SMTP id 98e67ed59e1d1-3a873517b39mr304141a91.15.1791267424571;
        Mon, 05 Oct 2026 23:17:04 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:03 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 0/3] Docs/admin-guide/mm/damon: Minor fixes
Date: Tue,  6 Oct 2026 14:15:46 +0800
Message-Id: <20261006061549.627-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series fixes various typos, copy-paste mistakes, and an
incorrect command syntax in the DAMON documentation files.

Adrian Huang (Lenovo) (3):
  Docs/admin-guide/mm/damon: Fix various typos
  Docs/admin-guide/mm/damon/lru_sort: Fix copy-paste mistakes
  Docs/admin-guide/mm/damon/usage: Fix incorrect option syntax in perf
    example

 Documentation/admin-guide/mm/damon/lru_sort.rst | 6 +++---
 Documentation/admin-guide/mm/damon/reclaim.rst  | 4 ++--
 Documentation/admin-guide/mm/damon/start.rst    | 6 +++---
 Documentation/admin-guide/mm/damon/stat.rst     | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst    | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0

