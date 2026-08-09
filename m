Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCC3A0B24
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270776; cv=none; b=qo55GSWamPZPE89HpKpgUd176kL3zYChKraeo3MGvfzDGgH/ZM/5v2aJPOOzxASldXqlvAlKyFYysDwnWQMC9SXTKOdf1RZJuL6iF5Lr2QJFidSyw+R/AQwZRd9kPh8g2M/72PA29JkX1FY83oYecm/I0S9wBbosm652QOoOZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270776; c=relaxed/simple;
	bh=oFzQIdP01ylYDrwXdf6yGiE1ASOcq3I86hOGD76zs2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ynt/h3EZlVTntUM+aGDp9DZXAub4l48TcrDgw/sYEruCJgd4e8lqODhHX1tMb8KAcqc6zKPkrRbHpMKKeH+hFEKA644CTht/+xJYTSy4Wq7fswXE0q1trAq+ODkqXXugG9SUvVUwGJ9qduSnblDWYv8OSjUpxB90OjkHvog1hA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FprI8XNn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FprI8XNn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so993853a12.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786270775; x=1786875575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LzGM5UsMIBI4+CFS50A81tXlcLHhMrj9tj7iT8tzLcc=;
        b=FprI8XNn3Oppu3qRXA3+jNWF7Ry9kVMmX6D8ObNRusFhHDZEWFOPlmlvzIKhWqoOoM
         b8VYA+hW8plC5hqN43HomGwTKEoe2UW5GEeDIjI/oVnY/4MFyEPan6BI3goIdVbRFpYZ
         J84fRzNj9Wg3jQ9LmVEgZCAL8kfBUesK0mNmJLk6Yb4n2ytp/R3BlBELuDNUbCDh+MUk
         vSWh1F2518iauslUGY5cu9VGQg2se8eNJJPYK0bWG5pie7ZD1xXwTgazdm//bkOfe8aP
         qUJJV9KcUFVdqLuxQ/rwr8jZg9DXT0yESqtswCkTmebeM0FEygB3Le+Gm6mqugMBI+rI
         SqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786270775; x=1786875575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzGM5UsMIBI4+CFS50A81tXlcLHhMrj9tj7iT8tzLcc=;
        b=BEk209f7XFC1gwgtDdnUZddde3zPuIYv0SkP0GY9yfxuEk2FPKixn4wjnTSKB726zV
         M4wV6JvcOrM+evWXdFWHZK/dgxpCjDC9Zn90HQt8vVliRoHuitluwi+MuhNVQv5YsWyp
         /6FOSJ3Q+OFDoz3vDkTZfMEARoZzSO1vqq3nsABDZBwBTSCPJl02dnshfEcr5qE99c2q
         GA+9OvvsDMroPk4/NlA4g25xwIN7rfkA40zu61icnBe14efsXL1RIv19lzyWcp7K+Op7
         YUkrlvhLaxG8DQT5iShapvr4Zn7OCSwtki9MozqVniVEdI50zDk4KR6icFq5ho8YudFL
         GzFA==
X-Gm-Message-State: AOJu0YwLeGRRvGTgRVVOIzuEA7hG79enSUrYGUBVTTd6nN9Yd5n/A2bO
	0m7TJcSK1HqDbJBmk4+HeZyeRtKrU+HvSwp3FO69QwMrMOqmcIQAV6lTx3BcvhHJ
X-Gm-Gg: AR+sD11e89omIuEUexeZfHle2i0eKFGO970pFHZ2/k/fXyAdPMJoCsat+uOPi1YlRqe
	jJyQFAh9LAWW+hElb/DihLcX2ALw371SEulIxx/TpXkAd2qP+x7uVx2LDcLjZfZtmo2aqxC56a2
	I09SsNZVcIT2l/m1zhmraA3vghJyvE/Mo2HbpJKz/fl5xcNAZCcwOCL3+PBvp/AHhMmPP0+QWfn
	pHydqrp3CSB0c9KsjIOHZRcu2LQ94mu1KOaOYH93vseW6OkjjeWnuUWX70rPqG6XDD+7r2THiVO
	p7/aX8Nfcx35UnOFoDfvA+WDh43fjjY7nCdYiZ0pLzys8bKCzwIaKeCweCNbjOVASxTMD7R/7c0
	CodjAVV23vl+ais4a09aMQsHf0NoAJNrQabhBQdGRnPqdjuixx9UDlyPK2ftCueobVs8EofmiJd
	pObPwigjlyOKqb99md5vodjcQ3ILkGRlY7BHYcsQHLl6yyE/qc0Z/OfXS8AOhZHYmKfClSU9Oc2
	Co=
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr19310303637.24.1786270774914;
        Sun, 09 Aug 2026 03:19:34 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm31496134eec.7.2026.08.09.03.19.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 03:19:34 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v1 0/2] docs: sphinx-pre-install: improve dependency checks
Date: Sun,  9 Aug 2026 18:19:19 +0800
Message-ID: <20260809101923.13176-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The Sphinx dependency checker currently does not provide useful installation
guidance on macOS and only checks whether a make executable exists. This can
leave macOS users without a clear setup path and allow an incompatible make
implementation to pass the dependency check before the documentation build
fails.

This series:

  - adds macOS/Homebrew dependency handling, including MacTeX cask support;
  - checks for GNU Make 4.0 or newer and recognizes Homebrew's ``gmake``; and
  - avoids printing an empty installation command when only PyYAML is missing.

Thanks,

Chen Miao

Chen Miao (2):
  docs: sphinx-pre-install: add macOS Homebrew support
  docs: sphinx-pre-install: check GNU Make version

 Documentation/doc-guide/sphinx.rst            |   9 ++
 .../translations/zh_CN/doc-guide/sphinx.rst   |   7 +
 Documentation/translations/zh_CN/how-to.rst   |   7 +
 tools/docs/sphinx-pre-install                 | 141 +++++++++++++++++-
 4 files changed, 162 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)
