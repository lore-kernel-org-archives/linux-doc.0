Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013385;
	b=5bHQmHysI+W2l5GomYasnjx/DTagUSCl7kRV5976fxK0qtVu4SgZGowuabXO9KlizXXP
	 slkbUXbWwirA+jcDlhkMCU/JcW9VrZJPtR7qbh+zYOQ/BRkN1byJWaMDjDpdV2DfUUxEE
	 nJLae06qjxC2dcZ+skiVakE9NCEWVAPeOdmXAnI4Y4+16aR7S91xlH7bdGD6TuCwlmWiw
	 cHkEntzSO71c9cqOmFDnRo0LBEZnaho8cXiTrSD0ZCftI2GoMwTQuk9md5W2/6AiV6oCL
	 KmzEt17AlYD3NCcSxggVmkFWrUcOThyfMUC1Po3y+j1vRT45wAXHNx8r7s6dZzh+h8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
	b=j1KEcA91W1eUCJUHg/pSp6XuSZtSuDpo418PXwHYL3vinZ/rXKSaysWXHtlZtiLY5U4T
	 7oY8o00DcqQ5L/5l4SQW0Hdg9hVxnhhGhJVhYadNPoKUkUJ4OpvNO8S5UkSWQkKR4G/Sz
	 9zBVKPXofw/0WDgWMQKWehbYvRvTV+jySUAF4+xrUNPZmoE9NoxNS2R6NjY2OsBtJ28PY
	 PUcxC7uLYPBFt789MCIcPGi+RSBtBr8pCmRTvN3QvEHBT+ADq5PjECO+6ZiLTEQVAgXPK
	 cCelFrv0AIYbrgpmpcvtKB+ofFj2TMV8WImr6EEwZU9kfudRTgYlT+hMbnu7rrPwvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/dtqwDD";
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F0606A90C
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307F0606A90C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/dtqwDD
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso508664a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013384; x=1793618184; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
        b=I/dtqwDD+Us8GmtNcipj1TAJUj0KaLw0UGElvxdGiC6GFTaipKaMxmKYfVJM/J8A3g
         LZDueCQXvm+fkRUt1+6MFXcLZe7KvUfcMYFZmNSWhmDWKd1WPLTnBPr7EYBEdXSBUpQu
         lNxZgRF9VcSUrMccK3PADA3Ka26VacgUAyEGqCBPwXpqHe4MhfNK/y/lzUzfTnuTheD+
         Ufw8W3owRzl7WKbJe80ThKrUI0Tsp4ES1PPESNzurBh+yMQCGPbll5Q040uuajMcTpio
         8H06DjNzXoFRYqOT1mrVcEKAYkRCFtf1wOEbPjO9ipkw8V+2xuzmDT5Lmu3WeOLd88/7
         UH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013384; x=1793618184;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
        b=U9KF1iAwl9Lq44BvGKva0nAM4E6lPnbUV2LVXdvqq1FtF6eBMB8xFdr9ZEX2O2CX5x
         3J8gB9Gy3I4i/VbMORkGnSmDR9bQzTbMUe0stR+qvKJNrXBLOB5NHPXuiS0sn2pZm9RC
         vYzA4acvMu5PTpt1N1lCG+kamZaUG0cSIJNFXDdsY8MjDVQkv39BWpv+Th9L9FYwqSSO
         b4SWSlfu43jT0gnGsqbQ7RbVAxTdzDATj7Y0r8nUmQPFZnV5mnMmFuXSSP0brvWOjvuP
         Aa70OgMN1iKcqtkbxJbLVeVeCjFA8Bogo1tHWY/+LBgcg73TrZC4IPBhGmmrNA7o75qz
         MjUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKjrdQ4VtmHV5PZRavjnOPUSRcypWwgDE7U6OT1BqD/maJkZrX/ZVc3clS3ShL+EPp9rQwEgiCHQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgZNzHT+IUjuNV7wt1kU5+TIslr62d9IzvcttQVIE5E5V2n2ie
	x+IKBmYw03IuzsQ1xIYVgv6LhEXEgNkYBcq6LDhjFYQ1RiitLkan2a2/
X-Gm-Gg: AYBFou0d+PCef1+igT0hwaehRoGaTPEZeu3nWIXcrI15h4XsJM+IrcYXc5EVDtxV+10
	wbDQqx1LZDpc/Hyttqn3CjHrcbczTSLJKgSQYTZRY+kJpqr8046fx5gAoriJOrsm4tSiE+w5Y1H
	ExEnWtknhDi9mpocF7PRwSeJfs7TdiHBdmlFARtOq4bKd5iTspJq+2MRnz1KuMF0ce3X6okureG
	ZYIYhaNHu4/g73ICSk3NZffkMV+BWetWcre7b6c7NncReYyIIfCFlWIugW/3AJ6HKPxSduc1m0i
	p5zjZ51aMHJWOteFQpzcRnzVsPaJ0KNizdhj6TPN45FoKe0JvKrHbJIAx5maX5h2gH1GUAvv1Rq
	XBWGADkm2aoGc4FfS0h2UdMygU/C803Oz7IR93GdKEf9FrqdtV0msDsjioHf/uijkXJIXzBYZGF
	SSAgo8vPsfCUQdKP7b4m7Akh895T8g6fZc46g3ZWkJ2Dwvnjz/KJ7yr27NjfINyfzMWcoS69oJU
	UR+vsoGW2+r+KRX2A31TDr0/kl52/pZtSDDYPRi7YZO9eqMwXFOk0BuLLqyVaZjOfsifupNfpxk
	njhG9vL2mmGPi77otI6uZZE47xOEQmQOG2CmvzLr4YoC5v3PxU+lEQ==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr3439038a91.46.1793013384321;
        Mon, 26 Oct 2026 04:16:24 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm1382169a12.20.2026.10.26.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:16:24 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Docs: damon: fix grammar and typos
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:32 +1100
Message-ID: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

I was reading the DAMON docs and kept running into small grammar
mistakes and typos, so here is a series that tries to clean them up.
There is one patch per document, and nothing beyond grammar was
changed :)

Some fixes pushed lines over 80 columns, so those paragraphs are
rewrapped.  Patch 4 picks up what I think was left in lru_sort.rst
after Manuel's recent fix.

Based on damon/next at 9d301805e3f6.

Thanks,
Aveline Noir

Aveline Noir (8):
  Docs/admin-guide/mm/damon/start: fix grammar
  Docs/admin-guide/mm/damon/stat: fix pronoun agreement
  Docs/admin-guide/mm/damon/usage: fix grammar
  Docs/admin-guide/mm/damon/lru_sort: fix remaining grammar
  Docs/mm/damon/design: fix grammar and typos
  Docs/mm/damon/api: fix verb form
  Docs/mm/damon/maintainer-profile: fix subject-verb agreement
  Docs/mm/damon/monitoring_intervals_tuning_example: fix grammar and typos

 .../admin-guide/mm/damon/lru_sort.rst         |  45 ++++----
 Documentation/admin-guide/mm/damon/start.rst  |  10 +-
 Documentation/admin-guide/mm/damon/stat.rst   |   8 +-
 Documentation/admin-guide/mm/damon/usage.rst  |  31 ++---
 Documentation/mm/damon/api.rst                |   2 +-
 Documentation/mm/damon/design.rst             | 108 +++++++++---------
 Documentation/mm/damon/maintainer-profile.rst |   2 +-
 .../monitoring_intervals_tuning_example.rst   |  28 ++---
 8 files changed, 118 insertions(+), 116 deletions(-)
