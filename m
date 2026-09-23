Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC7A53C3CA
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181386; cv=none; b=m+ZuYRaxmy8IgbGU/AaiYs249XuWQo9djYuf5QNapktD48b1+v24RID3RCa4VImgcywOdJlpzTZU7ITG7sS6XDvkDGvx2WFExUM4ulbKO6R7L36TAFBwmayRvMLBQy4YsTSRWWTmq9nk2r+HrJIBvxvQ8TJQh+InP0hzX8AerUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181386; c=relaxed/simple;
	bh=9OeixsceemmEnxehS4nFF1a2FYDdepSavWu1P0EAnzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iqdt9ngdXoFDIGgVBHxqp6swSBb2XoanLNPRnYzgohcIPhYN3Zh1iX3p6+7OKjCcNEQu+3jM11By/dRQSlgTXIEdchPgnhjMkkJSsZ+0oGSKPN+/ycyvm8CzsnseAMrvMC+ALb6/O4COIM4yvj6K548vhjM3/nyjJgOyBqPqI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=cKOOysva; arc=none smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="cKOOysva"
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-8644b2b4ae6so330717b3.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181378; x=1790786178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=cKOOysvaur4Q9x2WyEc1b2g4vi39OoTsYvdqSSn+c29aYnEUz+0p0a/vBqVSU+iYBO
         Qa22NU3nCcjEZNi6Nwmij/tsLjGD3uW9hy/TZFDG8phDuMMqmryNMvoOzWGZ9QcxyB2D
         uELEEv+hnUftol0gtl1QZjtbgTw9Bp9rhoAtKUUe1n40l9l4IhPkssn7e6hxQUmp/kp/
         +gRyp2oM/V4iKDb0uanFXWj6YZ2UR8P+jmzUsnhkPn/dvuceEXctlGcM5Og8MIrqE6h1
         DuOBzM+Y9fSKcWkTw6AiCa9Fw1/EUrKDDZHToJ+/RSXGCGBsqi4KOJKFHfZSdC/RChVN
         DKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181378; x=1790786178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=JgclvHmAL7amRsVujwqxO7tbouoCG7KniuWXoTlaPPJZvY2vobdXk97PGpCCG/fMg2
         GOruByzUaxZSM7XDBDwztwCg4jXI6tnFSdW2qqjiCx34H2Ir4V39JAO09uQPpsUKs25m
         FZAQKkkaATzwjfwYiGjOYs7rR6WqvCdS/cjN18YLX5k9MYwjhCc2k24oNGnSxeDsw1kq
         SeXO592soYno4fr4UIa8cxGfTbRnENWsn88SelERNSaBpoUWo1/LfQN2g2x5WMlh7KR5
         Fm4MlSK8AdcOwj6xKD/PY0kQS3ybZSqGx1cQA/aWi8f//yGWjKNfEGpeJHqBBm1HgBdS
         co4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzC0ejNB6jvzKKRN5troBdbnjFijeYBRf2I9rwIPP6PU1N1gsOOvjtk9zW/hOZ/11HyOs10glFgMuw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMbEkQ552N5m64eLPZ+cvD/0KzqGP6OlNOWxQ4G8y3awcBvHtJ
	BEAk4IcINIMXIFga1Ez6kNBRbZPrDUldCXUPTXnRkVPieXlSr/X0K4KtSde54/6xPwEl
X-Gm-Gg: AYBFou0nVHzpoD6jl/B99PNtKxk4R5MBMYZrg61lMPPvnBdB5kmjOkgH+1qOAINemD8
	aBPKYNDKrMafe59X0iSv4wdY93Jh1tcCYfBA6/exykx/AhmIm+5c8+Ll/TLcuuWQVYlQP3SHEJF
	sRW0jcgXWPvyh8DM90zVH+ERxeoG+6eWSf7oM9mSLg08ncZd48j6k+7tJkvtxaVztAFIofrZMFH
	qjDQ+XXmMEu7nH4u+V1JFgLnsDMB5XAexWx7EEd48WHxteBwExr6zPo0lNjvW8nBU+EDIZvmJIv
	C90Vi//Ot6a88DMS/4KtJBosprdrcVUltPRafTdYoxZ7bmRk7mwLgHIucQ6UdqBg4EA7Dz6hLZD
	pbEYu8c+xcrhArlgjRYTMJZf7SR0u0+GF0TixKDttm3hOUBKvzbjF/ZmDVyX2lY28sN9Nd0B9LF
	mUsDXR398nZEjbxhX/2ByW4P/fKL+jcuZYDOxHBcMt0WnGkkVyk9e2CgLZCnL/DdIZoo/Wrly4f
	L0O0Lv4uINa9VuRxwNhfgK3ewmPBqDz05YhNLzZND/7v70m4g==
X-Received: by 2002:a05:690c:998a:b0:841:dd38:a734 with SMTP id 00721157ae682-8a452878e4bmr37543737b3.0.1790181378043;
        Wed, 23 Sep 2026 09:36:18 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:17 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] landlock: clarify TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:19 -0400
Message-ID: <20260923163321.79770-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document that a PTY master retains control over processes attached to the
terminal, and add a selftest covering this boundary alongside the direct
signal restriction.

Since v2, the documentation follows Mickaël's capability framing, the UAPI
description refers to arbitrary signal targets, and the series includes the
requested selftest.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev

Christopher Lusk (2):
  docs: landlock: clarify TTY signal scoping
  selftests/landlock: cover TTY signal scoping

 Documentation/userspace-api/landlock.rst      |   6 +
 include/uapi/linux/landlock.h                 |   2 +-
 .../selftests/landlock/scoped_signal_test.c   | 175 ++++++++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)

-- 
2.55.0

