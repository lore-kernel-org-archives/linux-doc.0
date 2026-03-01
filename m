Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52732F84F
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372857; cv=none; b=SjerHb8h8JPmpPjHMmNxafQhPP7GrZiuzO2R4nK1bGhQPE7yI8uUg4WgIOWEVVt4djN4prXXbkDfF86IjoBaGhXnIDBjG0StrUlaoDIiBrKfoL8ouBdkHN9IM3P60gowJD+uKsjqjVXimr8dyOZu1ffWAB+bbWJgbQmcAuW5/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372857; c=relaxed/simple;
	bh=LZS4NqhuqgubsYa+sdQFc+VdDW9hgC6PJIa4x4HxdPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRo13xctLpLmlGJwQehBokEX8VOvyy/dTdkG8jOTiSJVz8NgQvlxTgFLl9+I3JzFyzHbbc8nWh6FQvC7LeLXrFtbdfdgag7XRLqxn2HW249UG9NrCuZng0fUEjDhlSE5rEJ07+3FTUyAa7zXLYlE0knR5ZVBaR3KWq9FN0knzho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7DaNfGp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7DaNfGp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48372efa020so28771985e9.2
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772372854; x=1772977654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NinA+3ePCLWqDgpdbA/AEykomkBo0WDHLuMB2QzB0x0=;
        b=Y7DaNfGpgk1YSGLCU7ZFesfVN10GtX2i+L3YMMwT8mKlXs9TFW1YU2HJXjNkwc/GSK
         KRrdxtQ3qRvj1Bm0ibik2XIqmrk+EY1TsWHSV6wS0CFzmbHHZHrwM/9cYK/rti/ZWyz1
         J9RisQy3uwMzBYus+FIttGTCPMJ5qTo/QDksTWFFVD0c1tqHAZOBxBE6flACenwwn+ni
         V/TwYWHIz1dgIwuCrZSFYmr8zOx9n5SChy7wtz95eh4hTpjAbToQEpt4vzbCQDdFp68d
         U0RnqCG3szcyO5FmjfvKOBF+RloNdeoytUiIjVW8KqGop0gVt8mle6pVrQL9hcDVLtCe
         5Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372854; x=1772977654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NinA+3ePCLWqDgpdbA/AEykomkBo0WDHLuMB2QzB0x0=;
        b=GrNMp+Ywg0buiQ37lNK7ZksZH8e5a6Gd6U3F5f39Ea5C0xdyBy06CQJyqRXu09su0v
         f0P+d54+PGaE54/Q8yJYuRZdi9ilR/yd7ylTvbjcV4di4s1s1QlhLGPi0OurpPNSugnA
         o0w9YlzsArPNfVOVa8c7ANzTS9kMS8ZQ1Wv/uewkl2DdcThW3EeivJxBucor9mdkmOcu
         Onr5310LtvT5oWgiZSriDm7FVFY7eY6qQWhyiYH6UcJUvhcKiQ1qW0Qr/O0VRs/jJlDA
         EIT9GexscB0Wx+hJ4KBhVnX4TJbKrFd1i7MQsJkL3bFf9kT+1X9hfX7JucdDSAwVepgs
         g0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXOi8wAGjFhV3hSjZYH4KagDKzEmHtOaEQRBvBAyS/jvc7NtVoooGGTTgYFp2MFsroNdGRsFsw3fiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDd7kzfPFWAWchp0xTp8YHNJzbcBdhMssGpBv8NbZvFVO7gYAV
	DAYFatCYL3nBsdwvE6xMFZ1JWrpixhSYiW/8v0h8vJQoiaAqlula6kDt
X-Gm-Gg: ATEYQzxnZAERWarAuKpIDxgUmvjzljobOQS5AZ/KKXDCF4iIuzeDk4UhMjhTmPSxLHf
	UwY3Oahl9ERyPD9vr99RjPHhn45cpZztbfU+YcD4LwmqelsuH1nxuZFGT7hyr4E27io36T4HxsA
	EkaFWdvLClev4fWdRiEafO+fERI7iIi+aNujRFQ7N5MRrRUVr6KUKOUk2f/CBLQ36sBUuaFylnB
	LLMpe8YeBqOYBSRCMH35If4/IraVstqDTLiL54NzuG6BKtuLPeymY1l6hIYKV6rXvSi4jYXHXc/
	73o4EXpEfL42TVImSjdgwu0D8oqq7F20h472c43RWhWQz69nuLI0ngxYfOcv3jlDvo8rbf0nsyi
	eU/15cjUxxT1f/cvyoG7KU9rcEJYoD2hlLohDLS0dvAsJQQ6TNV/KvNetXE1Q8MoE6otXzf6FEn
	EA/XS03scfsre+0jFWN+VYqvt+GuVjQyi34sVtTljsQ3YWxAgi3hcsj9HTOxHeo81mPzrQuqspt
	TUhOvwH645EhKsxm1PlMld6uJy4G2Qy3Wkl6nRFQR4KuaJfrne+Yvdr
X-Received: by 2002:a05:600c:40cf:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-483ca84a984mr98066935e9.21.1772372853767;
        Sun, 01 Mar 2026 05:47:33 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm341579375e9.10.2026.03.01.05.47.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Mar 2026 05:47:33 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	edwin.toribio.j@gmail.com
Subject: [PATCH 0/2] docs: sp_SP: Add Rust documentation section
Date: Sun,  1 Mar 2026 13:47:23 +0000
Message-ID: <20260301134728.64695-1-edwin.toribio.j@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces the Spanish translation for the Rust documentation section.

As Rust becomes a first-class citizen in the Linux kernel, it is vital to provide
localized documentation to help Spanish-speaking developers get started with the
new infrastructure.

This initial set includes the Quick Start guide and General Information,
establishing the directory structure for future Rust-related translations in sp_SP.

Edwin Toribio (2):
  docs: sp_SP: Add Spanish translation for Rust quick-start
  docs: sp_SP: Add Spanish translation for Rust general information

 .../sp_SP/rust/general-information.rst        | 178 ++++++++
 .../translations/sp_SP/rust/quick-start.rst   | 385 ++++++++++++++++++
 2 files changed, 563 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
 create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

-- 
2.53.0

