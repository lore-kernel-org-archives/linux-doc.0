Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791101519B4
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782047552; cv=none; b=vDZ2iZ1k+LIBkMUlQqhSc/kljOfeIm3NZ2lpuLJlZii42e4yGuj33n6O734QA/hs09ZV6DwuprMxpdOI4SGPf/5DOKiLB76AYdgjrqvJRUOAdjixaBJgI+taYcuGjf7QBOgFUq1T5BE0NdEBOR+wMmtDJUY3xSwcmicxgjONDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782047552; c=relaxed/simple;
	bh=wJ6Q0n86COvas9rjAQelCO0LQZ8pdfRgNs2HSEYc4YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L1ZIDTBoyYdQ4QaQ+cCZjq+tA4wD1vdB6OXCLJn2MqFrEI604b1bS1jw8pHq/7R+KPynCYMMYQmwoUaPXtehrfBSbfkDKaQERc8FLH5SB/cCs6aQTZqp7SNRtl5+60FygCXm0Gd9MJfrc6OhSVRdRdmYco3bj9en9g3EP7Lj77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTpHtInH; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTpHtInH"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2c6dadfbaafso32365455ad.3
        for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782047551; x=1782652351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBVeZJ5psBx8E34wg34M0eWg6krxMwT4IwREDC2czNw=;
        b=LTpHtInH8Ax7u2Wn7UHtLel7tFW7pa4PxL8+/ynKXzjmX2ZhLC/b2Q0AqhNXIBjntR
         m2F7UPHr5ElAn86tJtmujH19lkmBTNyAIb3GZ6mrnhuePplqcnCbW5yEN4ze7pPq6JdA
         F+12dhOsLSZP0cO6nHQBTHffoR2PrMUoG6Syxvd05SzsdFXk4xMPhcNQ8w1Y5o73rCBG
         QPFAst6WemMsfyWhOT0RvKJwnaiEnHzNMVF95+BD7jIZlsE7i4KqN42ZEVyQZk09HRub
         NozTgLtDBbBSxCQF/WsqJLKmCQlpHnjSopzU4rywDE47Jke+Wz+u4+sJ2aYbkYHP8Sju
         YwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782047551; x=1782652351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBVeZJ5psBx8E34wg34M0eWg6krxMwT4IwREDC2czNw=;
        b=gcc4chpHHcgaBz+i0MC4aW9MU4axzwnb+8KS+bXwSUNKfjk9Z95n6cxuBN1XlRuQYZ
         58sBSHW23iYJQAf3Eb0v1XK31eJaEeJMi2vii8l5BzJvDFrcYQLXGBhDPWG6HgwJtZF0
         QtiOcgfRcQSVHUc2134oKtA/j+0tNyJH4ruR7sTBeg8yzpYmnlJkQome0uSI/MjCKm/4
         5IUqp9q08KnHu115HjoVHQaY+GAJD8jlU//BSzWF2WAyEDfYRorgSmWl7D91iECq5lVg
         MPsiFCT/l7wrCdf9o1M1dQL1clUazXivg+0x7bh0yrBSNwczq7hLDiscd9H4JHOGCcTn
         dmyg==
X-Forwarded-Encrypted: i=1; AHgh+RrQoEOqgqICRaLUeZhTGhZcbevdYT6xaWdEr8DngKXDOeor1hKdqMCSDtTwZ1b1ZUa4QDKNfh7D7FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZD8VzZVZvPyBNJroPxax9EMt2MUbSpIfk7GgY44L8OWTATYQ
	ZFkSQW+09P/NESJr6pciTjmZJWId5YrtdvqVO9D8GQo+dbK/slWhW01noLUkWgql
X-Gm-Gg: AfdE7clQh/v1GF5KY+IATvJzuJ/be4XeYWyL65z/DkE9kcznygzeoFZJDdno2+//tpS
	c6IWdCVjJaUSZK6+j4R82UMsAPMYaczouDW1aMbmLbwoCH9yOc9X/uAOTnafD1iZ02lbe0yNayQ
	6CJzc5WFL9Zjqmy7LjkArJ6bGsEU+FlgV8j5b8Xh7lz0XIugiFgsvgl/pvrjI9ZoL8Q3LxIJtdg
	AthyuB2HUui9Dx4MU5krQdOkXRNP4nW92bAYcGSGHIV06iR2xlv74gth7as/HwvVXQFFZpCshfj
	27IJI9oYVTItLs+DbwhAnUkWQtuP/U0E/Q3CM0nUF9N1jdF7rMJTmhg/JH8GWCpBZTIVT15YrTV
	5THWLQwQSe5XeEgKCWMYCmd8Tqnerkhzq5GPY5AWfdutJ33MgcxWJJ3dgWD2YZfTRR2YKJ6lhMa
	huWoYfjlwfkDjXwUdYcA==
X-Received: by 2002:a17:902:e881:b0:2c6:cd96:6a8 with SMTP id d9443c01a7336-2c718f3fa54mr129569805ad.30.1782047550772;
        Sun, 21 Jun 2026 06:12:30 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc1:3c11:741b:44f:bd4b:7c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe6c6sm45943405ad.58.2026.06.21.06.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:12:30 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH v2 0/2] docs/zh_CN: update translations for process/changes.rst and sphinx.rst
Date: Sun, 21 Jun 2026 21:12:10 +0800
Message-ID: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series refreshes the translation of doc-guide/sphinx.rst, I noticed
that it refers to process/changes.rst, which did not yet have a zh_CN
translation, so I added one as well.

Changes in v2:
Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/
- drop the separate llvm.rst anchor patch
- remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
- add Assisted-by tags

Jiandong Qiu (2):
  docs/zh_CN: add process/changes.rst translation
  docs/zh_CN: update sphinx.rst translation

 .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
 .../translations/zh_CN/process/changes.rst    | 528 ++++++++++++++++++
 2 files changed, 661 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst

-- 
Jiandong Qiu <qiujiandong1998@gmail.com>
