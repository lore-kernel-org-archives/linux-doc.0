Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5E140E5F
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786757581; cv=none; b=t/MJadbBKlcncPb80bVexV12dZv4q/4Wsviay33B1ce3nvtZ4Vw3MoLGM8/N2xNLUh741UDNyw8xvpdvpJqfKjRjN7BLMrieSA+x9SQhfFyaDFquccRrTXITmIdxDu1pYj7vPf5O0/SjAq77chrS0K5UJBWFGH/vxx74SNzP/mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786757581; c=relaxed/simple;
	bh=mDgAsKs6meo//NBXXLbI4OKPjgjud9Wvq+usYByvNDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fo95zuv+LCO6rCxX43V0My5IFV3+Cg1AvJcveDJ9Tk+Vl0tSdEh8YPBjT7g6SM6tn4cl6qdCGt1PXm+nrBro3pxCKC3Vx/PqKpd+S7hgIbGaZ9x34r+CeK8FVlngjjZMC6abvDI1uIYj+41BCOlZ1FHEh/wph/W5WFbRnPFklxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5a5Jwzw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5a5Jwzw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so14078095e9.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786757578; x=1787362378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+EBtOS3yArt80y5oN+qnjKWVwEXEBrwucchm/mxHIo=;
        b=K5a5Jwzw3tm37oBhTUkKHQMR82eb1IGEfsZ1l18+RcsHFlgC+4on6OooCAZmQF+vJl
         B7lojnRhXV852EbJyAamAR3NTRkuz5hRWJbQ50mWLtC6oZtQDdRKErgXaWtd+rjEk7iM
         Gq6wJkCZHvkBg22ZfaUilig+7Y3lWXKMKmDO/uGdyq4/P1/pUM7ccYS4DRUKnQDozMRK
         OU5OTyPtgMTtJDcF/CdbMU218X4kcQ2HgGlTfy/Z7e7srxjecaZ5oxuUcfNmuqVFTxi/
         rS1Cga+rSS/oKfWwJFwTfvFXBMBoX/IpUT7h2u7fqBOaXhiyHIVck3i3RQgs7y1mfjRA
         W0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786757578; x=1787362378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+EBtOS3yArt80y5oN+qnjKWVwEXEBrwucchm/mxHIo=;
        b=kNAwVVJ1TRmHjH6FKKVZk5jm1OdHMcPiWZWM7qPekym88J7Fl1dRvRCbWKTAJF6nIU
         uqO/uhpNdgAIpbtlRdRul0V/SnMHL0EWVipJeTrGQI5XzdpTHfL3TKe+JkKf4n0QNquK
         f5/9v1s+9lfHEzoOUqGEBpTDG2Nnsu+XU2ryZ8YQJyCzw9elSZ8QevQByHiV/mftuamN
         gRND/VDRo/IhaQacugHnoTlCExzaBzFLkHYcZ1DsbePpCLqZmHQhWZ51NRhM9IBRzp4J
         6DhDHG/zmQO/3WtYzTCC80DDzTIeB+FGv4/t6WPHyj3Okj9n1imzxKQvr2BOZJ9RjV5f
         Iljw==
X-Forwarded-Encrypted: i=1; AHgh+Roipa/qt8QKP5aVbq7qsZc4zTjIIWtRe+C/0my01VfMHsimo/4NOnV3BENv2d+ZyyegYsz/+yMJlcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwMVrhkIY2uYSh99UIAr+8kXtyHyWrihr7ZoHFavEEW/24JMM
	T+uXvkMkgxdp75LPs0Pgf5Bwidat5go/oRJbe7oxn0lgaZMTj6gpWFRS
X-Gm-Gg: AR+sD12KtRD0/F2KIPQOkgpKl/yqa9VK7uKvJxF/wPgwvKf71Hj8ZO4X1yDYKJsRhn0
	yZuITBVpETqGuCk2knUyhMQmOwhdrhE6qkCAzenuILvpKtqn7hMrbGhMC+HkVYQwQPgxMbzT96V
	R633aXGi6J8Ljpxa/6ffToMBor+O/6wa19Z6coJB2Xk69BbASdv4P9RRppZyje2CZwYCHpXDnDm
	ft+K7by6jixLx6yS+vnGQBUPa8RDmtoaWKhfzqQrt9UOHNZNa+18tSfIdiPQMqoKateGCTmCyW2
	v5dlW0JxuHQnfH4oEgdaOgfFbhn6zbEiRHAdvwWuD0mIJ1WUUs3MMDKIDCH88UTja8e4ECCHMe2
	d99s+KV4ArxoCA038eA2Ujz9WFg+LfZCL96GlB+vyvbVAetwOv/x1qMy3YNUipEokf6oN6awXDI
	VfJHWOsmUiV85MkoxGHG45rCcS8KSipKMN6hmpegiy5CzspySBIML/s2xAanciFB3ZUqroaokKc
	ppI0ESuI62V+pReUvVwiYAoVPsVEcQwTU6A8cxaZPNlr/VjRxBLgXuzeLTG+6ASUbpnc2R7keZ5
	BS79TxIyQKln9EQCUTVs0iDPU3A2BdZzPoYUfVDacLoGD2ExeKc+JbrgS6mKPzebF9GiEhIXlqz
	d+7I=
X-Received: by 2002:a05:600c:3491:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499879653bbmr149398885e9.8.1786757578369;
        Fri, 14 Aug 2026 18:32:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d7d-f301-9495-44ec-73e6-1be7.310.pool.telefonica.de. [2a02:3100:9d7d:f301:9495:44ec:73e6:1be7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b1a31esm110672885e9.2.2026.08.14.18.32.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 18:32:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net_shaper: fix kernel-doc rendering
Date: Sat, 15 Aug 2026 03:32:27 +0200
Message-Id: <cover.1786751700.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The net_shaper_ops documentation contains a malformed ReST list and
exposes a kerneldoc.py title-context bug which drops valid headings.
Fix the list first because the parser correction makes it visible. The
parser fix also restores three Xe DRM RAS headings already in mainline.

Tested with Sphinx 9.1.0:

  Docutils 0.21.2 and 0.22.4:
    make SPHINXDIRS=networking htmldocs

  Docutils 0.22.4:
    make htmldocs

The full output differed only in the intended net_shaper and Xe rendering
and checkout-path-dependent build artifacts.

Changes from v1:
- fix heading parsing instead of replacing headings with bold labels
- split the list and parser fixes
- add diagnostics and point the Fixes tag at the kerneldoc.py regression

v1: https://lore.kernel.org/netdev/20260813192131.21254-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  net_shaper: fix kernel-doc list indentation
  docs: kerneldoc.py: preserve headings in kernel-doc output

 Documentation/sphinx/kerneldoc.py | 3 ++-
 include/net/net_shaper.h          | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)


base-commit: 3205699d79f262412c1be7fc1c04066610d3cd52
-- 
2.53.0
