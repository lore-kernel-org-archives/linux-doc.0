Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC323B63E
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765176740; cv=none; b=EB5/HJbpIC4j38TcuKsdy/KlNfPGjodcFGTYI8+LqkeyxtqxMmZyeh6SDwR5ug/lmunGf/hjtkd5wJ0dKCRfa4tsKGPPNXjQY1REv501VDQC6qXNJQEA+igNOFdnly33wImlf48Hl51+CUg3KXVRcrpMFSWA6S1z0aqWCh0NuK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765176740; c=relaxed/simple;
	bh=wz7pf57/xREkUn+DgA5Bxc7K8WNBU2C0azhaFZiBSq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=joWSb30hP0l4P/p+XGpskOwYv2gSDitJwkb8sEvGVAEIcbkJ20b6hrKJDNIG2MA2UNMOPigqvhYxnz++pJAbjgWwJXr5h+aF1D8hRs0l7DKXPy8RFlKKHCdaZ6Pys/KQJupkWzQh+s2nXoz3NHf0um1YCNmTcXyiB1e/h2OCNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxs7Oj8y; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxs7Oj8y"
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so1442987137.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765176738; x=1765781538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bRCk54lRZ3zQNOvPy71sqTzZ+NMU6SMl7eXK4zSHzI=;
        b=Kxs7Oj8yf1lZmEQkXYu7L/L0SgtkbSgUMEYMWdqVKB7JO9e6OddVNN3ZIL/dnIUvbp
         0IlMvFUM2osVgP5UGyGmbIhq/Z6CaOe0T3NvkLjLXRTKdQYogw8xecjt1toSJkQSKlDk
         g+KRqW+PNu2vYA17yvdJyf9dOfjkGfM3YWmCSE9vT2iK1eiq3GAxHr2K843AxLBH0vf+
         HiYtIPa9K9fJFuU07qHG1QjPjMycTeU/nSQWD7I6fmUetXzXaxUDEqNJASyyg846Mc7s
         7tf2lILU3z3ogo/3hj5lTCS4CW2wKWFbfGJt5hPZw2kc2rrywn+PM8DRRIMI+T612vnp
         b3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765176738; x=1765781538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bRCk54lRZ3zQNOvPy71sqTzZ+NMU6SMl7eXK4zSHzI=;
        b=IcjWECM/ar/YJGE4Prm3bx6u3/LE4rgWsVxsOMUUdYw/d89l/Z93WPIXNwbaZsJ6Bx
         dHoZJXrZFPd9awON+H5E1tBCWAkiOzBDaVLaUp88h96T6EhXC9AwitQY5IJURHJ/2EIx
         yINdgtHRSZSsul9SwcjM9yMpbAugMy3QDLpyeQggfcUVQsEnkdiRPLInTawqnFVX5tZK
         kApg0Sl79rCBs7ritIaanXKCI4niI32ccjvIhIjt7561YmLrPly1Yr0+yjQ2971HsQSF
         EpLJDmoMT/XVVM8qL+tFh+p3F3rZtbJpd/y4iFR55pX0qjhps1dBvJXMfbL7qmMAUbqW
         Kq+g==
X-Gm-Message-State: AOJu0YzFYvY6r0uVN0iW280olD/q/4eid2nUl++e3mRwQXrmA6hjD1y7
	XMoQt06hi4sX5EPFMMa/I4EJeqFig1juIdn4ESgJC9ezfUZTkisq3FVL
X-Gm-Gg: ASbGncuIwUnllpKqeC8xYdIwe4AG45UxYkESNiMtaG+S8RSnxzg+VkgdTULULofcXIl
	fpMgVA40dgGXM//EX2Z/C4dnfakWyc+V7CzrBeKizwh15zfperUGY7y6AN2mG8yXdNJdjbkjT7M
	a2rwqNQ1/Sj96YQURx5fJ+BROdryayqwmWM6+gwygQ4BsSBt41wjbYsG6WvKvK+eB+uPx78mIgA
	Fn1p4Vyr7yxX0vGxL1CLeLJ6SCjBxVXCB5EqRdN7n3ZOlYSZy2HO1hsX66606XKH740mgfKHZLH
	ZQSUgzl4lMjFnwDcFEPvZXHyiQFDCVBcTdeKIqtZ7fY5t5oFx06rhgWyUJGQyXFaunxd0LQsL5v
	Y/1rLiAwyrIW59dVoyoRDNZBm0UyGy3fZOyvt8nw87fwjoswNISuy7b/B1v8E4/k1Z5pw6P+xrh
	36MaBc0VTQ0H1zOP8WWai0jbJypLrI/8bjRw==
X-Google-Smtp-Source: AGHT+IG09qHQDMrgJq41g1O6JwQhAfDhOSNJduezoE7Yg3ub2kJX89htl2o33xVoaytUZHKg8LoJLQ==
X-Received: by 2002:a67:e70a:0:b0:5de:736:71e0 with SMTP id ada2fe7eead31-5e52cc2756dmr1740019137.29.1765176738063;
        Sun, 07 Dec 2025 22:52:18 -0800 (PST)
Received: from localhost.localdomain ([142.196.103.158])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93eed58f540sm5577425241.0.2025.12.07.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 22:52:17 -0800 (PST)
From: Addison English <addison.englishw@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Addison English <addison.englishw@gmail.com>
Subject: [PATCH v2] docs: fix typo in clang-format documentation
Date: Mon,  8 Dec 2025 01:51:36 -0500
Message-Id: <20251208065136.9092-1-addison.englishw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clang-format documentation contains a minor spelling issue where
"intended" is used instead of "indented" when describing deeply nested
code. This patch corrects the typo to improve the clarity and consistency.

Signed-off-by: Addison English <addison.englishw@gmail.com>
---
 Documentation/dev-tools/clang-format.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/clang-format.rst b/Documentation/dev-tools/clang-format.rst
index 1d089a847c1b..6c8a0df5a00c 100644
--- a/Documentation/dev-tools/clang-format.rst
+++ b/Documentation/dev-tools/clang-format.rst
@@ -88,7 +88,7 @@ Reformatting blocks of code
 
 By using an integration with your text editor, you can reformat arbitrary
 blocks (selections) of code with a single keystroke. This is specially
-useful when moving code around, for complex code that is deeply intended,
+useful when moving code around, for complex code that is deeply indented,
 for multi-line macros (and aligning their backslashes), etc.
 
 Remember that you can always tweak the changes afterwards in those cases
-- 
2.34.1

