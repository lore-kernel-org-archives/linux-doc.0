Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272172F12AB
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784152931; cv=none; b=R8bXVc9alRMu7yqjPNCYhO0Kzo8kMaPjBcyTNY1cSg8yQW2wOe5A+f3yPwAOTy054+8bEgT5TQ1kS2cbDrpKW74SsEw1l980KQrKPhuvvpoHHJvfQ6ie8gJApdP1TKHChZwmiXLpaROvqcF0sy88CfOQ32NoJg40oBKuWWK5H54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784152931; c=relaxed/simple;
	bh=hXccJTGkDogFq9xNnd2HhyQ0ZplziOGnAqlX+J2y+Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDh/ir0vXQO8Cty6XIck5dX/afFaDcYnbOheTYmnxFicpIoOB0m3fqv1mFgEZdvoK397RN7RZS/i5auDupc8zfroutiSO890wbv3FVoaM95ToYrNZHemXfMGz7qGXRAVW1iW9q4NwIorD9K+yqnx0BwhKRPB1GurWFrZXIyyjFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S77IXi1b; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S77IXi1b"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9217d13c276so413427785a.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784152929; x=1784757729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvWacIrRt+twzRaS74wAVnv31KXtCgTOGubOP/O81X8=;
        b=S77IXi1bAVI6aX9OILWUPteCXYJNFgbfOpgd7Ck25143wN3Tg9JBA4t7a/My3B6RWD
         SncurGkXjMHLJiCpJAFznMiiR+EtdapvxRHN7d8Nn9DagbsEL0Z2k9eAua81vIj7ns95
         dkLQRn88xEWTEgqXrE/xDYg0UuhC5LBXF1kaMMPEhxY6Uq2LM40wgAWKxeN/k9hkQ/8V
         Tz60Oq9D1McCUVAA+5nhR40SHrAR2qK9bsbA4Yyw00DSn0iVJYtH+bgty/EY+sQq31q1
         Y+bYkVEsG2hwxFJTrhzF2YbAw/pyxInJpviZB5Vrfj+QXWFy120YMjPoYukce2GGk/Dn
         dyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784152929; x=1784757729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvWacIrRt+twzRaS74wAVnv31KXtCgTOGubOP/O81X8=;
        b=i9OZAc0LDdz6JRPLD9IbC2m1HavxKelngabG010mYKUi6n9VZWuCgr3g/igF9ZZfgh
         BcdtbDnudrJ3Wp+YP1zw/NxMqSxOm1M6FjO/kETbVJ/lt6A4VYnamS/9apdVz4hDW3Nr
         b6eX/KbSWPZqJlGRh/Mf8P+QWnjlFhgcb1P7jBVDaWPQemhd3gle84dTBT5dShtaEsar
         g/JHjVjXuR9Vkf6Knhhm8WkjOcbeEaCSIwlXwQ5SaBv3MGrrlSzq3Rg4bg5XBcCT9MNI
         cU1NfsQLrrn4vQbI+ggsqyPOnWKWuBaLK4po5RWexJw9P15ghP1K4lb/z4xvohRwdC+5
         U2LQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSLgXkkw28sKXImSD8XLRr15x1BpFt5k36w/sIYyue34ih+eFJIWgIW0H4Rel5fwt3J8upCazYahU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywOgI4Gqj6BnTvvGS6Mdiq3WHu3SFCjLgQ6dP/VtY/CJqaUrd+
	QHvp6F2XBFCN1n4BCBYPaLRIpYUq65Aq8RWzd3PAG7NK8Sw/Aak5RxcB
X-Gm-Gg: AfdE7cnnHeRUi/YTOW8EFHg5TYOAUuWz2avOGxCn4bCUQkjVLrOt9QGg2M9FPEZgToI
	DuTFJ5EsAOPn8Y0HHjm5dybYi9L6eCITTutQhC9JG7TyoC96lN+N+959Ulcey52t2xcQ2cf6kOG
	ThjxDXQmW7i/mG+CrEOmoJvDGtrhIdx9gXkCQ/brPmAIzsgMwCih33dqBYTrdJBM0T9c8/UTeqD
	x0hEMs8jv8RSJBSnLzpGKOPywXXnIIi7lRjnibPxOLDckQwlYNBRkPOnq5vYobDOcb/na1aSz0u
	h528D/4Yg3l9etQ69o93fWNNQSuPHKWF081ulBt5+FZXzrsTAqsTRKFEmzPZ73afQMeVjEIDdKk
	ZBSJI7WgMvx9Z/rtcKqZkpPC4x1sq+/vzCHrrgNm7ewOkI4u9oD7K4v59JQdnRXEluAE2VT+dZH
	WVvqja5Zj5H8lqXZTt8GqY79fDbmb9Ljr5L26MlQra8g==
X-Received: by 2002:a05:620a:459f:b0:930:a50a:4b39 with SMTP id af79cd13be357-930a50a4d12mr31029485a.75.1784152928660;
        Wed, 15 Jul 2026 15:02:08 -0700 (PDT)
Received: from nixos-office ([2607:fb91:1cc6:ee9:3c58:cb8d:fd13:5294])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d34f76sm1860910685a.35.2026.07.15.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:02:08 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: arnd@arndb.de,
	stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nico@fluxnic.net,
	officialnaumansabir@gmail.com,
	rdunlap@infradead.org,
	vegard.nossum@oracle.com,
	kees@kernel.org,
	tj@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] Documentation: warn users not to use select on choice options in Kconfig
Date: Wed, 15 Jul 2026 23:01:49 +0100
Message-ID: <20260715220149.48700-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hengelein's master thesis about Kconfig from 2015 wrote that 'select'
does not work on member options inside of a 'choice'.

So I've re-implemented his check as part of kconfirm:
https://github.com/julianbraha/kconfirm

and discovered several instances of these dead selects in use, and
fixing them is not always trivial. For example, see:
https://lore.kernel.org/all/a3b7a752-8cc4-492a-bb62-43121b852c41@app.fastmail.com/

Let's add a warning to the documentation (a place where developers
are more likely to see it than a master's thesis...)

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/kbuild/kconfig-language.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d9338407c1c6..ab2822d7ca1c 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -164,6 +164,11 @@ applicable everywhere (see syntax).
 	That will limit the usefulness but on the other hand avoid
 	the illegal configurations all over.
 
+	select should also not be used on the member options of a choice.
+	Selecting a choice option will do nothing (dead code). Instead,
+	consider making these a dependency, or using the defaults of the
+	choice to enable the member option when it's needed.
+
 	If "select" <symbol> is followed by "if" <expr>, <symbol> will be
 	selected by the logical AND of the value of the current menu symbol
 	and <expr>. This means, the lower limit can be downgraded due to the
-- 
2.54.0

