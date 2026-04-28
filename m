Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD43FCB25
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380488; cv=none; b=CxvRlaKiVp0rH2wGCCDz+/OczW2Im2Ci2oCgyWICUZtFLjFRkApyGeBTwIk7iP2Ft5XibSN8c3SMgj64G0ISDsF3LYuD0R9tdEhlKTjk7HiKohFdUcXs5tKgc9MqFeooSRmuTkblU9+BKurMP//E8RFtBR3MchL8+IRazxL4KJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380488; c=relaxed/simple;
	bh=VUccE9kXvuvBHe/0mezmkTh1893Ofu3nXFps9mY5+hg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IaeXpktLoAtd6Lv6qSB3jzSY3cpyzrGHwSq/Dny0jrRLmTfQ8iW+XXGJcTLwqubYLW9EoALKfDggM5zjnNJtnje5yeOTc/6uv6aT4iVOHsAnR+Db54wyvWJKT9XrfGGqHswYLp1MUu8FFu/oCGVdZodOlxzNEQiXXN3AkiDxCoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imGv7Weh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imGv7Weh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso85314855e9.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777380484; x=1777985284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgmCV2/fZulR8QPgdY8Ciezrt0cn4CHAQ+Jxlbp1+Z0=;
        b=imGv7Wehk2yCQot/cXe+/DwHzxVRM3ZU0xaBwhZ73/f8fqM3CYcxZpJqpTcip0F2XQ
         aL9hPdhAy2hHLK4C/4rAlghiRMedW8zf7FoOrDQCozJfe5bkqs3ReOxENuv3JcE6vVCR
         fbtbS4c9Q8d7mXiuEN9IrRhr6ZpzAYBUPTPpfSb2a1Vh9xVUFO9Sp4BesOkET0TmDL2q
         VDIyTgvPWhvptT81ijoKHkUmmMhkD09AftjkxLIRWBaOzaqEb+ZSXskqRBDbgwAY2fhg
         Tj1Xznw2tVaOIqhajcfUjh5/KjSxbz6XZV7XHRTx8qzptw2v1wRFZWO2YqSyHDIGmSqV
         1w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380484; x=1777985284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgmCV2/fZulR8QPgdY8Ciezrt0cn4CHAQ+Jxlbp1+Z0=;
        b=Q+LGsci8a02XEHW8SPbPEMRHmgVuvIQY2qz/o5Wujhn2TDMABclaxveykCph7eyx3m
         J7KTcUwdTOwPq1N+BZjlLVP10uX+T+nP869D3eeG4w59K4CWuAEmWBJKlcFhMCmZMJt9
         qaxzYr8bJnQh3i+k1dWTYetStISz2otautLh5Uu1rT0QTwZxk3k9NuAlFIlgRlOy24/R
         lm8807FT8MoZvC842DrvftiFG6fFY7gjsYPop07XPA7S2YaAMDQk7na3F01U4yMOPOqp
         ypwNUt9tyHc7an9irWdkI/SKBnjHCaufGdU0Ied58HqsfqbTHFUrr6erpAo4ftkVaS9g
         jFDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+WCtoxq0hpvA4BudNwSRuvum/H/k97vViH80RPzKC6N/BmXQo47nmCCyjyZVEFLEZyUUogOJKNDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbYVmuQfnziakIkMOm24lqRwESB6PkZb98af4ba6aag1MvofJ
	YtkHzSg94Q38RJph65NSdo8hXMV8yX0tbEBcdC+U9Mt4zSm95KUUzZNo
X-Gm-Gg: AeBDievTqvcwYbouJP8wEfNgSwrQyupAoIldLudYfW+9KOigwfjfYpYZCCiTfpcZYgh
	DGTBpNp3AmcWpIJHYe5cepOpy9Uo+i4WsEbHlbosaRrbRdNCrR30eRSZMlnM5osYZtjb7QbQ+Ba
	RTwavmMZlOXlewA3AM8uS2HxaRXhSiMoX+S+jwxN022Hi+ryauAclgkH7W8KWRTkDmwzkpCoCey
	bfJ9sDebwyfHWlsH71c2mldgtzZ7UpfZ5ev2OJflHrbqQ0ILuK1zfGPQ6HoEFtlg8uOKgJRrwjn
	ZU9zMA4ZearB7ti6VOrIGxRbRUt+tcSa4iN9KUDRRvV3Fw9kdKoG4dGakcZ6y5yFG2kbqDcuNzM
	RgBwcmZWyFe5kKsiOgaqAeP0QvScMkNYDOmzkpBqNItnhaHFwj2i2A9fOuUbQBl630Xigm+UbDP
	1aYVPAHJ8vnsVqEFwEuoQ+vG0A7GeHS13X/xYNY97ut5aTVvqL88Sqt1xq7DfoMKMLPqrblxeCb
	wiDBDJqYYqakusDHvB+mctUQbw=
X-Received: by 2002:a05:600c:3b15:b0:489:1f04:96c3 with SMTP id 5b1f17b1804b1-48a77ae53famr53287405e9.2.1777380483914;
        Tue, 28 Apr 2026 05:48:03 -0700 (PDT)
Received: from ubuntu.nomadic.bris.ac.uk (eduroam-wireless-pat4.nomadic.bris.ac.uk. [137.222.229.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774d7be0sm28803655e9.5.2026.04.28.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:48:03 -0700 (PDT)
From: Ilai Levin <levinilai972@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ilai Levin <levinilai972@gmail.com>
Subject: [PATCH] docs: driver-api: eisa: add SPDX license identifier
Date: Tue, 28 Apr 2026 12:45:55 +0000
Message-Id: <20260428124555.102039-1-levinilai972@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing SPDX-License-Identifier tag to the eisa.rst
documentation file.

Signed-off-by: Ilai Levin <levinilai972@gmail.com>
---
 Documentation/driver-api/eisa.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
index 3563e5f7e..e98b21b60 100644
--- a/Documentation/driver-api/eisa.rst
+++ b/Documentation/driver-api/eisa.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ================
 EISA bus support
 ================
-- 
2.34.1

