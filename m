Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C6317161
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036707; cv=none; b=Zv8Fm2MABcZz9GGGCPLDPHKA0jXZVN3k55GLutU3le9devPlkdxRvEo6vnWQIaKVEJdtTYq4xxrm4DXbej71sxOXqJ9PaivFr0m4l+VOgytEFUMDfN2+Anl0L0liv9p/wOyJ2phnQD4bHt7fJ4+tjvRxLnj3zlVWxzMVJTWxdIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036707; c=relaxed/simple;
	bh=hb11/nUQEsUITe15ptl7gaVSGBK9HGkxdnrQNIZngeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dh8nJnq7PbQaDSiLowI0lkWN3C6aq11hGWI+Ixs/gFfba88mHufhnpKWN1CbS7vXI5X0B9Cu+QQl9IANCQiNgMKpQ3c/GwD0DYU74DSyz/JN8jrq3664LZOaxyZDVoKDismRVuIlLZ+HeH9yAYDvYQUtg86RCXjI1by05Whh6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RneC3D+1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RneC3D+1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so5741425e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036703; x=1787641503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqcogyCGg70wu1Q5vb1IMYop9IyLUdmqSQiNTAzefnQ=;
        b=RneC3D+1gTLTsREBXU6g8tUAQogg5qPme8zCQbv9lwQYtCxjfvXUK6N0vQ/MK0mhiS
         dACsvxdpH+AjnREeZprsVexmpB3izwgtMSqKlSyOmM/WBv4QVwIbPfqx4NPt6NBLxwBH
         zdi0GXHBfeWBUHzYLANS7ZTT2ddgDnGT1eGPTptoEfhNCRHOU6/JanWgticwf6+ubKPD
         ykGJoUDvHwFv5of4dRhbq5OP8eFXH4BIm6Tow0jwwUQQuDZNGNXBhnDkVfB4kqi5deOY
         zol6CTv67cfZdq8LPqzRc4DvWMzW2M+c4UXOs2dZv9H0Ke2J2+eIV+5JZJQ56N61rjgH
         Hw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036703; x=1787641503;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqcogyCGg70wu1Q5vb1IMYop9IyLUdmqSQiNTAzefnQ=;
        b=l094DRSRLqw+0OpvsVpBlabShCwB6wu/eh4McC8p9Exzm45Uy6LJi9SO/Y6wlcnXE0
         1CluIUoiHQfiVXIwWB5HC6mq7w+WHDIMLd+nrIUMHLsgBoPJusklJlQ+hRzR+4JYsTAC
         j0RfhRbkDF8swZhvgUvTthtNEBKKRia8O2RCqyf/Txl8K3Z8p5i6vIBBf9vcPcLNmWCr
         0GBz2bSITrow7PELQb2rO1XyyodQNI96f10nLorcGgza7ma0TKQwgqOkFQpnwqTnvsD0
         B5i7vWiCyXK3KV1K4zdpRGo9reqszY4nDGtAKmx9iI3FoCouT//t+h8WfdbNWpAIH+98
         9R2w==
X-Forwarded-Encrypted: i=1; AHgh+RqjvnmMpXsCIzUO3X4M+POI8lkBgzpIybLZWepxSLZ8PL2X7e8dR5s7VBvRhL7y0MO6EiuCZrU7JK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88Z6dxyG6bgxb6hkepCQfFjhb6KY4fryoQ47vOvHtf27u3bNr
	xAg3XXeZeCQw0IsqcYiAY64JsKmsQQZUZNMQLYn7szyJ9yFhql77EBlV
X-Gm-Gg: AR+sD10bWmhHjlOIpBXBDbkazi5/mvACRIJJJrKw4vt5vYjb7REHLePXTbNjyWkH4YY
	zEoUsygF+tLrdhoUK4iXGGxahUitu9xO/uxk82QvCCrLS2giDaxrWeOvA0U/U/YIxvj21XeTjZR
	laZvt4NySZX48/BnvpOhg/++qoGzDrZMmeE5+AhAXyK66SLuX2MDQ9obo5dzSsVSwNnKtAi+l3Z
	WYz6HgDLrUw4HYazWph6PBUnub0tpuaNwWF3ep/NJ9gzAVZtl35XLaub8HWq/TTz2u1H8E9MDIq
	YpHuSUVWW+5l1WMaGpZFUe0wTGWAk1SPCjkdhNoTCER//VViGxXtcxmdJFFpF09SMvRYGogxFS4
	fnPSpFdeieUG2p5s4mKMmxd5zRthd6l+Mxh8VqAbke1qE7+uumuOFkXI/41guwDvISag13mdmBk
	8/WUxVxgAnMHYi2Ot5Wh+8bggFokAHvSsBXXWpmIFiaZ/Bqm1TtlvHPgv73XNFlU5SN4/B+hosj
	h6UtONGbNwYFbZgZmWPgBJkZoYXuo7U8lhs/r1zpcIASYFH7nqcHSQm2hjDrCnkxkNNMYeHiJO/
	/we+MWTBR9sqICsLi5TYOu2dCHhA2PBdO96cAJ8hx+WL1uMh0TkV84KY
X-Received: by 2002:a05:600c:8b57:b0:499:8411:9e8d with SMTP id 5b1f17b1804b1-499878cb099mr229907745e9.0.1787036702721;
        Tue, 18 Aug 2026 00:05:02 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm495557495e9.13.2026.08.18.00.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:05:02 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] docs/zh_CN: update DAMON documentation translation
Date: Tue, 18 Aug 2026 07:03:42 +0000
Message-ID: <20260818070358.455768-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bring the Chinese DAMON documentation translations up to date.  Update the
DAMON design and administration-guide translations, and add the DAMON_STAT
usage translation.

Changes from v7:
- Use the suggested translations for the DAMOS quota goal ``nid`` and
  ``path`` descriptions.
- Replace the remaining "聚合间隔" with the consistent term
  "聚集间隔".

Changes from v6:
- Clarify the DAMOS quota goal ``nid`` and ``path`` parameter descriptions.
- Improve the translation of "offload" and fix the duplicated character in
  the non-access-pattern filter description.
- Consistently translate "tracepoint" as "跟踪点" throughout the series.
- Consistently use "监测上下文" and "聚集间隔" for DAMON terms.

The changes were suggested and clarified by Dongliang Mu.

Doehyun Baek (7):
  docs/zh_CN: update DAMON design translation
  docs/zh_CN: add DAMON_STAT usage translation
  docs/zh_CN: update DAMON index translation
  docs/zh_CN: update DAMON start translation
  docs/zh_CN: update DAMON usage translation
  docs/zh_CN: update DAMON reclaim translation
  docs/zh_CN: update DAMON LRU sort translation

 .../zh_CN/admin-guide/mm/damon/index.rst      |  15 +-
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst   |  68 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  82 ++-
 .../zh_CN/admin-guide/mm/damon/start.rst      |  63 +-
 .../zh_CN/admin-guide/mm/damon/stat.rst       |  94 +++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 523 +++++++++++---
 .../translations/zh_CN/mm/damon/design.rst    | 667 +++++++++++++++++-
 7 files changed, 1345 insertions(+), 167 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst


base-commit: db6ed2a3d31068ca5577466591b2521dee0508ca
-- 
2.43.0

