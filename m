Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79872DC357
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015684; cv=none; b=DndF2bnR5+bNA8HrMFj5DNs0X/lpIBqSt11Qv9mWhDenrHlX4rHXC0j5zj2RSfIlUMLpdBd8VGDJg+7UsJElEKqngeVUnnoeyh1nDDnfIMgnqDSdiDnXRvqSnhQQ/XotzI6A64XzLJKz095UFjoqjTFPZZyqTPtkv62xplvAWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015684; c=relaxed/simple;
	bh=OsTW4W33/dOPYebmwIgRMD90tqv9rvMiSMFARTYGp+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw5kmaWeTvAhY3GQkGeIOTksgl6D7rySO//4wCTHi7UK+Vkyqjd/PZyutX1RPLQzR75FU2kateuFHTDYWU6d27x6L9yMLfroFde5e71iBD4eWLiRN6sD+32AZn+YH33dpYC5rBS9EJensbdu7ALlDe7PAaTChJGE3ADuciEGBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4zWO/R1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4zWO/R1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a767521dso6215945e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015681; x=1781620481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+p2KLWGB60/y0hWSjB13j8Ag8QaYpZolde8d8AEva4=;
        b=I4zWO/R19u8ZptccQCijl0uTmvLYjb11nzUxg0yoK+nL8NODjLV4/TafKo3TFCPPdF
         m4vvlNXiZSPJhkbnK+PjYIhFeXxlWiIKNAq26sJCOiNHkUpfw0cUsRrwBm/Sj7egZ5f5
         7AqLxCAsHmd6ogSi39eoqeqriuIZRJCqH5Hh+KQsz/ft+B4adfXs8Jsy7Gif0TOhlAp4
         9BXNlJb9MBspfnuPMRlbeLH3o1j32yLuEVlsMro9JXdTafHMOcp3n3KDGGY4U/RLdFjB
         QwUxUWdItv2rPBcTxvNBpZkbCy2xYcJn4zDoOv/DpVtpSkFyvFUwGir3nXPi2y/xsgiK
         6o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015681; x=1781620481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+p2KLWGB60/y0hWSjB13j8Ag8QaYpZolde8d8AEva4=;
        b=HIsqVV066O6Q50x3M3lqiEZyo7REarIM1gJ4wBh+h85jkY/xg48n8+5RXwNhgnVsaq
         JmPo6K1YpZ2LKy4dC2XZMI0dtAaS/gWlQ/+1pWQmNo7YBQ5816oBK1r3+RPMoVns9Zya
         rDxrOta4zTXETXE4tiu+Jhs4uTazhjcF5gwTAmje4dKjo/qODY8/NX9CN25bEAIpCCeT
         MKJxbT0prJUVjj96sf1RBKWDxnWy9+BPAioCxnWZV5HRyCuuTOsLxFf1ehzCsYE1//RP
         Wzx8qX9e3IoofbatRi3UEVk6C67m0YyBebQHDEN2I36+dH39KRcpnWikDgQd2SkJzwnw
         jgOA==
X-Forwarded-Encrypted: i=1; AFNElJ9wwNkZORlOTIqiDAEtFwvWD1dcownlteNrvwVT5P9AcAW0StZy8c+pBNcPWEbUFN3ss9FWVBy7BFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAI6u8itQjy4qjENkZCX8to+K20tfbU0d0eHsi0j62S5ilsR87
	N4XuNdwGOo2HTG2j4j8OXMtYnB0ewYmWlbE3ztId565hFfWXab4e3Auc
X-Gm-Gg: Acq92OGlcjLUrDgkc8tB/82Fx2iRs9kZCT8Jd4HlPqCFKqu79Mz01oPQJx8mqpYGjPI
	tkRIStmeJUt7DPzT0r4Mc0pqZiEy7HubJe8/jQf6jv4Q75FFeMApDwWw9L3cU3FduOgnQujFaoL
	HSX54jLG4bFuVFXf+JehCKBZiVcDY6g7PTxNDg9KMxdidITz6cLnSPz5MsVT8+RJLxN4BVTol0v
	JwoP47W5ad8fITDfD1z4+9ci4aVFtpEdDCfPujbRm2yon/QeLk8/ONgX9rtbF0eraGQ6qliIGpd
	jNt7JVs29OHbgFmX5gWNUEIBSQ7bL4GGUbXNtEd5WYIyxexzRTm8PpQd9IUhgs65yPRdnhdjL9O
	DXpl7R4OfHIKiTCR8FBWgmemqGfCpzB/RvxFshlAfO477xupF1KPUzYtGtsNhDbHXWkQnnRWcnr
	7Z1wOQi3nVgMGhty1Dh8z8A4E0mTwamg356qgPFU6XI7DJGoJIqr9+6VnsMiYX520sKG5as3bWQ
	Q7ChMNERDpG+PZVyigeD+taK+v6ONe5H/V6tA==
X-Received: by 2002:a05:600c:45d1:b0:490:6e0f:2a10 with SMTP id 5b1f17b1804b1-490c260ffafmr146105085e9.7.1781015681040;
        Tue, 09 Jun 2026 07:34:41 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm68670615f8f.5.2026.06.09.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:34:40 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	SeongJae Park <sj@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	damon@lists.linux.dev,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v4 0/2] docs/mm/damon: fix docs and update zh_CN
Date: Tue,  9 Jun 2026 14:34:24 +0000
Message-ID: <cover.1781015560.git.doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523094420.741003-1-doehyunbaek@gmail.com>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, thank you very much, Dongliang, for your time and
dedication in reviewing the previous versions.

This v4 sends the original English DAMON documentation fixes as the
first patch, and the Simplified Chinese translation update as the
second patch.

For zh_CN, I translated the current DAMON usage.rst paragraph by
paragraph, and added missing pieces such as stat.rst and the related
index/design references.  The zh_TW changes from earlier versions are
dropped from this series.

The translation text is paragraph-by-paragraph.  Some references cannot
point to the exact zh_CN design sections because zh_CN design.rst is still
behind the English design document.  I added selected translated design
sections/anchors needed by this series.  If requested, I will also update
the Chinese design.rst further.

Changes from v3:
- Split English documentation fixes into the first patch.
- Reworked zh_CN usage.rst as a paragraph-by-paragraph translation of
  the current English document.
- Added zh_CN stat.rst and related index/design references.
- Dropped the zh_TW translation patch from this series.

Tested with:
- make SPHINXDIRS='translations/zh_CN' htmldocs

Doehyun Baek (2):
  docs/mm/damon: fix DAMON documentation details
  docs/zh_CN: update DAMON documentation translation

 Documentation/admin-guide/mm/damon/usage.rst  |  12 +-
 Documentation/mm/damon/design.rst             |  12 +-
 .../zh_CN/admin-guide/mm/damon/index.rst      |   1 +
 .../zh_CN/admin-guide/mm/damon/stat.rst       |  80 +++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 541 ++++++++++++------
 .../translations/zh_CN/mm/damon/design.rst    | 145 ++++-
 6 files changed, 615 insertions(+), 176 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst

-- 
2.43.0

