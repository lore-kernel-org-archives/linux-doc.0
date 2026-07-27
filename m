Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0153D8107
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182091; cv=none; b=FlL43flPJvreTU3HvjlziY+8NwSvgyjHu2Hu5yvt0/DsTqRF4VezNXT86l2rOZ+RHjfbHdf0kTO/NKYkBUxZILKlUznOYVPWIKK39TuDT4SBQfQn8978bboY277aBqsGDAeFdaCTUUj8LIYCLs3tIkTY9fR1AdkMgqpjOp/w7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182091; c=relaxed/simple;
	bh=JyBUjyxL7nT4ZYclweO/wW6mn+OU7uxxJf63SKPKOeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZnECZWPzGNdMehNLzFvDLeejFGmH2/Zg5kKQAYqCLaPqilqLFUrJ5fOOH/MjUke5vSnLr4rNZi1JpnJnq3E0RZT/rV76HRVDJ314CoqFVhZUjHSBaGCQBWMxCIDMBi35pKRx3rTVxitDebsjypARvUxrW6R0JRPJRyOQkL28LvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqRr7AU1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqRr7AU1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3064992a91.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182086; x=1785786886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo3Jh0L4b+BG4DFcYUfx+a8EHRfupQuURbh1tRgkMyQ=;
        b=QqRr7AU1JYVbcH0raJzQdjOp6QrzR67IMEdaXIyEFeN7FJooD9s1JsEmGUHjTg3gFK
         3aQPbold32/Olu2+QGL5NqUFK0DtOHnYhoP30zF4Q7Bu6h+BgYZ6rtCBfRpoRKJUMbXc
         wXhQmUr01NsT44HxpYRS9Ocxr8gPmA7Np6afO2n1Zh+1r9UMY606IMpSygDcokZKZ1/R
         4RwZTWZOB9l2aagwl7THeZmmaajiScTrkXpIHD6iFdlUa3hyHKB5B1JSHcht/hYfkv0s
         3vnQl02KYro1JIzEZXQ9cu9B9pjUODTqpsU6BkCgxOH9SMds4Gq1qPFipj/kYYFhC+nL
         9tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182086; x=1785786886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo3Jh0L4b+BG4DFcYUfx+a8EHRfupQuURbh1tRgkMyQ=;
        b=haHq7uPUaidw7Q8j65YfJMOHM5MLT/yO2tulr4QN7sYcHCb6MbN2+RSEEO0cOLXQBL
         RgPwwuvlgq4Z/dAcDAssOWUabH3vKtiqEvZcVzAUAQX1vAz9pqmE2BIKf+/auhVkeEi1
         tcET0ETbc5G5Ap8jjxaiBXKSNQiP9XS7/OhygZ60EKlw0mc0xYJl7W+3fczpjplS7kBS
         85NUp4tVxFdSaLW+YG7yslpq/MmPZ75kJqotlJByTkSufvjx+c4I++siH22mj05ZEUBz
         5i7izvfNYpM3GHEQLoMNrufntut7PfZ8h8BHsQcEz7Z2kzzGa2O5V1HeiRZZlGn67/TX
         98NA==
X-Forwarded-Encrypted: i=1; AHgh+RrjgrLMDDzfCKOjiwLIRNhn3bAkj4Cl8zqX4rLuZXs3aVG1+WyV2iCZSVzJlUni5ZK9vw7/S8obQi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+WDZ8YPTEx4szOrYqcf0oc/yesxr5zdFK6nULvBZ5gFLOJL3
	5tTc1gpb767hZdulRinikKWkeIgM3Hg49Iv4IspN7G7i1j/UtfmumYDD
X-Gm-Gg: AR+sD10pUOlqVODhuP+o4bPVgsLZtuIAqW9dDcer8QqCLcesLocQkHSlRuUrDlXqOnT
	DDNTEKymAhFSWgL6Tz+EakofqcKh4H2n9TXEgCG6TWY2PfRQVrMm5E4BprfcOllCumMxCe4V/3o
	2b2lHi2zTXy9fFWy8pqD2Ry5bmbmPBGdsvH3deEuf5RrEUsISOc23HeqS7d8KRNtRJb+rRavO1M
	/KyAAxQTfoc0aaUgTDP6paxHbGAC57PK4CFWj5EWJQv4ItFe3ST4sPL+KfxcN3/vgTqw0B1TS9C
	gX44JlySzLMz0HPcEEqpb55FgyjJTDC7jfgjAmRTueMUUzldHHjdIQgtNkJ40zZksB7jGPvFPyM
	soKCJRgNYwdYEUMgucFNWdlm7Y3290f9WU9XHzglMfeqhSLkIFP0C8FeaXkfMWLdQAznHX0cbkv
	AoN5+YBjByxb5McXLTr7RGcQDVPgjOmbVjns6bz9Kqiz5izJZerY8CIT0WigSIVEu34A==
X-Received: by 2002:a17:90b:2c84:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38f64cc9e1fmr539746a91.23.1785182086532;
        Mon, 27 Jul 2026 12:54:46 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm57447013eec.13.2026.07.27.12.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:54:46 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v4 0/2] usb: core: Add quirk for 255-byte initial config read
Date: Tue, 28 Jul 2026 01:24:32 +0530
Message-ID: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a quirk for USB devices that fail enumeration when
the initial GET_DESCRIPTOR(CONFIGURATION) request uses wLength=9.

Patch 1 adds USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to use wLength=255 for the initial config
descriptor request, mirroring long-standing Windows behavior.

Patch 2 splits announce_device() to log device identity before
enumeration, improving failure diagnosis.

Nikhil Solanke (2):
  usb: core: Add quirk for 255-bytes initial config read
  usb: hub: Split announce_device() to log device identity before
    enumeration

Changes in v4:
- Reworded comments and messages
- Moved the memcpy() block that skips the second read after USB_QUIRK_DELAY_INIT

 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/hub.c                        | 16 +++++++---
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.54.0

