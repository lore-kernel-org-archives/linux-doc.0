Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E07519E0B
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064068; cv=none; b=Simv0xKNhMhLvHEXaQpUoboRkpU7o/YMs7tg31iqlvVNy2ew8whzlcAYcGSm1UCTyEW5eEZsMfGCxZL2bFQSrUSN0s4qDFDKxYX4yp5jkgmZEuqnqzSNNAs4e04+BTCj4UTD/OhZFYCcTItYSa3RVjH33kgeUzxQUrv37eves/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064068; c=relaxed/simple;
	bh=MGAVWVaW+Tg8dZUdOiFPSJ3nrgTHVCtI9XtxGfm6MrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7bji9qVpVtblYFXz1dt7jzSYdEjEaHTxfB9LbqhHkRd+OqjF7LE/XCdpJuKeE96yvVOYQ76dNP/fMUO+iQAsRuvZZhi5SpIco9JdKbp89axsyFC/DDkp6iiJu+nFZIszrmy7AujvhIFxxOeYFhFGGnDRhHGT45quvaw+9RQVGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUXr8a0+; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUXr8a0+"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so5752258eec.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064059; x=1792668859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+7nU1vQBqIL4fZLlZLYX7HC1ZmF5kpJ2h6hcqSk68MA=;
        b=fUXr8a0+X98auKW8iNUJCbHsuj/XbooFHHDNo4jKAkRnXPPBgS/PEJcf1DywuEh3/0
         8ff+f5NSUHsjUB6UzkHDVlyLi5Zzwy1xmwQoPLyUqn4NoXHAxfSwITcHjZu8SuleBmPG
         BQ7E55bftgzykEz55yjwL5H6AAfgOz66nbXOo0uDKjjPKPJV73QrE9alSCDltW7Y303G
         gydNTAeiISrRay1yT7NjURAa3jujGzYco8q286QiasGpLIRJIeWHhGArKlLw24XZ/HV1
         y0kA9N3pztTj3UVdHx/firQ9z7F++BDOeOLWURHHPzUw+k4+BQMAAi58qbQXfiUlHfbA
         PTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064059; x=1792668859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7nU1vQBqIL4fZLlZLYX7HC1ZmF5kpJ2h6hcqSk68MA=;
        b=OoTVFRu1QmoUWTHv4MF4Z4JTgTTRzU98sTdoPnB5XWwvgWHHECgK3Uak6QPaP/GkEm
         zF0xI7Ch7/vPOJBOy4pEfJZPaKD4mkbtFxJdz9dAE4ClvmR6t6aUkmB6/PJWHvHtfD9h
         8DNI4Y7FdJh2H+Azn3DDh2caWd6rxtzRfACyI3v/CPgMJgXGRacxUATPOAfu2Y1CgnEB
         Fvx9ajee8KhLLWwcdQ7ciQEdTXCFFnhBHnQsqheXvb3rOsKKpspMQLVuBOypOTHX/OwS
         mcF7Py8g06Qo/1D77rsSjP4kCONK6DA1+TitzmbhZKAdmHeuJxGXlGzgy+pulh0vSN6V
         FETQ==
X-Gm-Message-State: AFq9FYIAVF4aMOLZxFckojqtI21HO7BcDHJ6UOePDYvg9rFdV4+kQ+sR
	Jd3CfPm+wzI8kxQHzQc/dk6qa2uKOyaECaepPw1lkgCMFFTj9rtvXVi51XLXTQga
X-Gm-Gg: AYBFou3UeqlS3mnTRP3RoeZde9sHP6Di/sZ1n0kYf2R4tOIN8GGferUN6tD7Qj1JwyN
	cP0q1SJXfXUcqYzeG/n4BhIEz48MzGZFyZ6oBw4aenbnl7BaKhvt+5K03g15qcj3+HsXHK3Jg7d
	urBqs5nbqeWV2erSDrKwg1S3D9nttNMVfq3koGtS1oUYq1XjyMpzSZDdfFUPM3uQoHLSM1aSHRO
	kcEqWMxUkFiMcHVr2tiIYLp9WHr4EfCMFXD26ta3Sm5EzaiKp5rah3ACOgd040Ip3OgP9/jrhHC
	/Ws1g3bDndyww2zPkgznIQ6LtWA6D8CFV2X/6MybKhs7BNBVKC3fWTs8HWJ5jkujQ703Ag7iPcN
	V+6vLGeqWj2KuMj6RsylU9jV7pD21vECkJYPF6QVOMNUc5G/6Txf87QX8wNTETU0vNJzyINXrQ6
	HyAoz1SM+HtoOwp/nPFITPCvKw3n1q9HCShUN/Qic5qgO/zNx+lDjLXopKTV1uht9o3EmqB+oQT
	vvateO4nnTpwO74PsJDv87GUiHUQZ8JUlvWVrN36m6bO1Xqk1g1O1QaT0mLnbTSkDPwGt8In7ec
	DycSrZ1IOnFfXJIcOwSTMrI=
X-Received: by 2002:a05:7301:1987:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-35df3cb100cmr9809959eec.5.1792064058770;
        Thu, 15 Oct 2026 04:34:18 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:18 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 01/10] docs/translations/pt_BR: admin-guide: add features.rst
Date: Thu, 15 Oct 2026 08:31:09 -0300
Message-ID: <20261015113121.4550-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add features.rst and update admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/admin-guide/features.rst | 3 +++
 Documentation/translations/pt_BR/admin-guide/index.rst    | 5 +----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/features.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/features.rst b/Documentation/translations/pt_BR/admin-guide/features.rst
new file mode 100644
index 000000000..7651eca38
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: features
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 471b76f00..2db14d3b4 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -26,10 +26,7 @@ etc.
 
    README
    devices
-
-Todolist:
-
-*   features
+   features
 
 Uma grande parte da interface administrativa do kernel são os sistemas de
 arquivos virtuais /proc e sysfs; estes documentos descrevem como interagir
-- 
2.47.3

