Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9D4A204F
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186704; cv=none; b=pEt8ES1dNnrbHzDYEpXpzpQSrvLwpxKGphGEXswAa7n4uvls0ogoVeloAU44SkdglELhTnlWOucHzlRL+CDIuvixGy3ebhOmZZ0lFqUPjPCW2D8/RpwR7d+WCJTOXynnmxOete3TzHD89FZqGkLuakL7a6s2JVQG5+VAuc1l0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186704; c=relaxed/simple;
	bh=kaK0aH74Qi58txlPAy5w3sfoQZuIxN2QNza5PBv/HDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eJkYMpdtii3YGNqFILEUQxUNbMoNHNfv08bF0g/vH50sVMzD/zJdGqV69Orz3TGtWYlhF/zAYFanZtW/2pSuwn0jLvC+fGaIl7Yxw6CTkUFkd2sVYg6aqXo5liRBkcJg3iuAFUvfJcRhm73lTBqI1owyBgeIfNw0xgT1rMoV4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESVSTQID; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESVSTQID"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso33046455e9.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186701; x=1788791501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUYFrpKNt6IgGZvcijxJF7MWDCddgrnldhyZfo7UGic=;
        b=ESVSTQID6CPw+mFnqfcIxouJmXmkP4VtLtKbujk7ToV9aGGd/AJYKNAD2rV/o8PXuE
         SU2Dpp2SOV9Z350KjTgaznFUnSrzCapxmEyxcnpnQb6M7xfCEk5v8BpnbKESjt7tRB2Z
         Uq3ujX3VIqTQDVo4Ltyxc1wL/MKObGBcnnBzGF3VgVULuceNZUN4KG+lze4C8U2sk91W
         s4KUBLEdXHyFsbCnfPn+Nnv2nqGUgAtvdJFiMf396qRj595w6rgP4hJaYQcjmh7lC+CW
         IWsgRGgK0zzno8iMx1m9Enw42CA0Yb057tjXPJoVk5+J3wtmGDYNDf9Mn1bToJvKlfYa
         DV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186701; x=1788791501;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUYFrpKNt6IgGZvcijxJF7MWDCddgrnldhyZfo7UGic=;
        b=C46QneeE7QLOVUh+/5mI4yXY3DbKVfGw7GQYK+ukA3hr6kHtGUOrweNuUZY3U/91pE
         /xBPL9yUvUYYhAvBqh5xEFJR4WZ8mTfUFK29Snhk3qG3ESarK1t6rfxpOsbBvrmj8tJD
         ePs26KBzKH6yBOvdxECn0A3rPAmlWriOsXa1ueEjIPCd2V8Th6qebMJVi6H6YzYZTyGr
         kfHunuFMxgrmT18rfmPGTgaoJO2THEwh1gChZZhm6jgeYmWcwNxZss2tVP022m/jK0oB
         TYlGvBhwWfrxHGaVekubEcSSd8qifB21iwMJc4BZanHIxOrMYsy1mqvHHcWliFKjhutM
         MGCA==
X-Gm-Message-State: AFuF++mHE7BlPjE2CyqRuxcHOvp1SJI+m4cQESS1isP/ZY17iD82MOGx
	LaY3jM2fnP4WiwGErW3u1rAi221iiwmctc8GHnUyqRDs5AVCNE7eBy6J
X-Gm-Gg: AR+sD120DkFunsxkRf7rCwZicMm2W87HKU1w36BiDAaz5Vlnl0nwm+1Joc+bS+emw5E
	6aD2LwkX2DsJfrc42xIiUjUFhfP4oAZQOIjaiELnbs89AP4KaT63IG4MEznuZ1HRBsXxjg24U2D
	hpIGFV/uWdKz2oWIE4KebX4SNwHKJwEm+31tCScTHMNoEoEwGVV+xNqoLKKvwnjRCydDcew94ck
	L9qHYqeMfBB2ZMVJxgeuu+vvHKDi0ZjopXy5OmB8Pj0xgKAQlBvjfmASA5JmW/hMMWqvqZAURfx
	+O1gRbah/2YGU4tdQrRp7tqxRMYdF0IeCJiSpG8Ejk4+BA6u7IFwlhMVQOxDSG9g/CBIDJceu3A
	KqwV+hs1Q+89By8srQTmJklzaNXOnigF7zLzHI3wVibBIAIg8amEiE4dWaQ8+IJAaaLSBvcv9Y7
	buLzfuE4MYxwOsoep1NhP/fmXXCljO7IYn7O+BttEpFa8kOk9t0NloFJV5TfY6LexhH5Y6RaY9F
	3KRNJw7VIHId4qe061I8I6i
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr362296585e9.7.1788186700961;
        Mon, 31 Aug 2026 07:31:40 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:40 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 0/7] docs/abi: align userspace documentation with implementation
Date: Mon, 31 Aug 2026 11:31:18 -0300
Message-ID: <20260831143125.151360-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation and ABI alignment fixes found on v7.3-rc1 by comparing
userspace-api docs, kernel-doc blocks, and uapi headers against the
current implementation.

Patches 1-6 are documentation only. Patch 7 makes GPIO v2 return
-EOPNOTSUPP when EVENT_CLOCK_HTE is requested but no HTE provider is
available, matching the documented behaviour.

No functional ABI changes are intended beyond the GPIO errno correction.

Iván Ezequiel Rodriguez (7):
  docs: futex2: fix documented errno names for futex_waitv
  docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc
  docs: gpio: note lineinfo padding must be zero filled
  docs: dma-buf-heaps: fix CMA heap name typo
  docs: vduse: align documentation with current uapi and driver
  docs: ioctl: fix stale NVMe registry entry and note N conflict
  gpio: cdev: return EOPNOTSUPP when HTE is unavailable

 Documentation/userspace-api/dma-buf-heaps.rst |  2 +-
 Documentation/userspace-api/futex2.rst        |  4 +--
 .../userspace-api/ioctl/ioctl-number.rst      |  5 +--
 Documentation/userspace-api/vduse.rst         | 33 ++++++++++++-------
 drivers/gpio/gpiolib-cdev.c                   |  2 ++
 include/uapi/linux/gpio.h                     |  2 +-
 security/landlock/syscalls.c                  |  2 +-
 7 files changed, 31 insertions(+), 19 deletions(-)

-- 
2.43.0

