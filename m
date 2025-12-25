Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5CD3A1E7E
	for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766692104; cv=none; b=lCqauFlpG1VIO7ZbCaY6THtA9z/d8Wp/HAwuRcG4DnxS5GHYavHMlG7/fpMRC8kouRlbcawf4HX4QcB+bKHfTIW+ZbLVZuLLJ8xat39A9KSCUZEYBdBcqUqX53YoFZY4HDbQuIpqkH0ejsPN+DepdyH+uBGMlQgzaJiSRn03t0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766692104; c=relaxed/simple;
	bh=N4yfqmX7QLMKhI+VsbWUt4ofOQzxrfnpzPNaJ8o1jQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xzii1ZPH8QqFQ6PkJEqHa3R6hVA7+R2VcbBgIRVWE9Ncx/ljhrIb3NR8rJmNCkSbXj8d8oZTNNvm3Gk3rvo0eBel6TYbooUfEEB5czzHRpQb5uAVs/e95Tyt54jsH/LCSm3wEQ0phS/fUJr65r1u2xUHIUiLgxAVCfFUWFFUPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/jbuPpB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/jbuPpB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so53497725e9.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 11:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766692101; x=1767296901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTmUpeRnumGRyIio1C2Cc7iN7wUizzkQH52HxMcnxm0=;
        b=e/jbuPpB9PptbdlnqAt6Kdkk9GXzpx9piLC/iX/OgsBb0pYkPz55rckUk87sczebi0
         BSqY7K+KzU2xgJBhR4ldKqIPBtWX9xvt9uS7HSmi4DqBx8kLxt57LiJTdFYQX0JxsyiK
         BVvhas2rP/CAFF2ZswVenNB/OjRPMrUVtATNkiOqfG1GEsN1hYkbBshnqS/o3UlZv5Ci
         hGjVPkaHJ8X+pB48vwrGhqJfm+sEuurwPJ+ZWFteemP+oqDBYL5aJZp8y8KpF20r4GZl
         58MBaqwUugK13lno3AL6TpSpo5+5FreN0stRBEqfAXGdBnhnhewrZMgJXgPUzs7RYPa/
         0KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766692101; x=1767296901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTmUpeRnumGRyIio1C2Cc7iN7wUizzkQH52HxMcnxm0=;
        b=PCEoCGnB3flqp6brVCHTsEHZgiDr7ZrHM2FVCMpklO9G7Md+wGIxgQpChScWYsFyug
         paMsDXPXM/IQZD3dLYEp8rJ34SRNrPuWVR9NwWAm7xX8ZIGZ1oJ3tSjbfheCwVt0BmK0
         9Ec+r1P+qLHI7nPgi0GBeiC2pbK/94+Bl+DF2W5gPYO8AMhWMmBVDaX3XrENk5JRYjxu
         c5U2gayj/Y6wMuY6aJOuJ4HeXnQDg4SpXocLXvTWUKvOb0iC/X35rcAO4Tuwd/VgNG9t
         94cstLrepJCeV+np69eRVhaoJo1tV0xJOgBLsFuDpnBYrRiC4NYQIcI56rRnYq+UAWfl
         YT0A==
X-Gm-Message-State: AOJu0Yx8H/grxi/xCgEyjK8IgSgkAZZU8+7QFIirEHKefRbOOh/WvZ+r
	+hl86inELW5KfT3FKkKEaOgvH/Mw9UgBU5+asqB6WEPbuK4w+4zgxcf0
X-Gm-Gg: AY/fxX5++ERorEA+VQNVGyjp89lRfh3QivcLr49fcJSsRVemGhDtLA0/Zpv0OLB1Gc1
	fFJeHbaaR/67nKqNw2VIiAJ0J0MghGDvCemooBd7xHFNqOcwz315CWWyjJtJU3TllKtJ9bqlKbx
	9cDiy7nCTwT1YZ6LrVKHMrGeUvA/ltKanI3WLmBOdMsflnvkNP66VXmBz6jG/Yre4ZkFOidPBSb
	o0du53mHgAG3iVU26+Uw9kk1QWlfDkUCY8dW67dca+e06HK4OQZfrZisBPaJTe8sgiiYjLUVAnM
	Vqwf80Z4rvIuKdab+BGvPdtXeormke6z84e7GjquQHNsf4K0iT/S2/zVCQErGXf7jKaLTyu2Ec5
	UB2Rtzv8FWsktOs2YsoD2HjOHsAMOTiTcUB7UD4Fxozz/rsUsHK8Oc2Rz/swP/AKv95sWBx800J
	ErLTqOfr+7N2JB+qoDpubU7FxcHnh+JaLx
X-Google-Smtp-Source: AGHT+IH9b73ZLWtPYqL6ZnbP4b7bL1wbOmhxIK11ZYopo62NK2b6CZY0UaTpvQEln/phkg00vVgqGA==
X-Received: by 2002:a05:600c:3506:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-47d195499e5mr193785615e9.2.1766692101359;
        Thu, 25 Dec 2025 11:48:21 -0800 (PST)
Received: from localhost.localdomain ([188.51.201.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm41644368f8f.1.2025.12.25.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:48:21 -0800 (PST)
From: mustafaelrasheid@gmail.com
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Mustafa Elrasheid <mustafaelrasheid@gmail.com>
Subject: [PATCH] docs: Makefile: wrap SPHINXDIRS help text
Date: Thu, 25 Dec 2025 22:46:51 +0300
Message-Id: <20251225194651.190149-1-mustafaelrasheid@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>

When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
causing text to overflow or wrap in incorrect ways,
which then makes the text difficult to read

Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e96ac6dcac4f..5619e4e09361 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -98,7 +98,7 @@ dochelp:
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
+	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)' | fmt -w 80 | sed '1!s/^/    /'
 	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
 	@echo  '  provided that there is an index.rst file at the subdirectory.'
 	@echo
-- 
2.39.5

