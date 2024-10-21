Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED61FA26F
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535313; cv=none; b=msHWp3Jn/y7dPsZU/MBed1vZInURuOcBVyX3Oyqmjp+v56uT2Qray9ioDoamks5eeYK/3AklXpe+hr23twcr3nj/x0aH/bux7BtqVUUytvNJ1Hc4n6PMrcCGVElLWyV538ThqvhmJYWHVhxK1Paj9k7FTEoHstzbRec3XfevAUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535313; c=relaxed/simple;
	bh=gKOx2VMsu3fJ2+F1EAaz+XRWKA5QretlVbcZj3ufrrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSRoEcbFUAQF8qRNAxhQUJ+fnmsDLk1S35uAzKWm17libH7zEIZDdQiqbNTk/o05NCHwNIBWQWXJ7ATyU5cmo2OQSXL9R6KbXjFOmjsNNCgZbnyz0yqjsiwzD3Y6ZAMX9KdxpaB4BOnJNLKzrtifcUjnYAVQz9/f3rNJbfxE13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZyklImah; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZyklImah"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf3e36a76so46918335ad.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729535310; x=1730140110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Is747y5KxQdJPA/4jySZSBRe+U5SRmn2DdM14znVgc8=;
        b=ZyklImahysShCiRFTH9hTB/bGW/2/HAUNtVKgSypEWcPZkYPzsmOCK/dX3cBd19Oxa
         +drhXMaNxViskYRmj0Iqnmdz09M9bw97lJejN40w4nK66+2mWpPQUou5DFCa2Ae6hMNR
         tni+GdZhcTMeWMgTZFpwVYYLO7UwfZZ5rFTGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535310; x=1730140110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Is747y5KxQdJPA/4jySZSBRe+U5SRmn2DdM14znVgc8=;
        b=EI4NNhBV2P5Jlq+XYKCcrgpstx3PVEJurkk5ETiEZMGK2aSsTHigzgJ95rAV49oRfL
         yeBww+5F2Es6Wq0o0eQ/smovgNnCWDwPbZUjDztYCPpDiEkXZ2a0zP1c8UVi+eo7zJiY
         YOtCLpDZuuCkqFwA2at6raI5+4W8SX4U+KjHLUXwwS+9Un0F8gq7KpaUCBthsemchdw9
         cxPuaYbX4Ic+FwUdP/oZIAdoZg68Go99nRbln0PzzJOa62oYTmWztoJcFFQrcJ8ub+Tl
         Q4QPSap9sTRBlt+/f2G4BpXkBwW6PfInAihlhYrxMVImZD0FvmGkkZVZaWEsIT9BkhBy
         pWqA==
X-Forwarded-Encrypted: i=1; AJvYcCVoQCbiq0ZWO/MZiPUnIrigsmHuFFKemb13QRn4zPK7cfPXG2qatHUUqFDmcBm7alrCXKbQHHJJKU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytI8iWlBVRgYHuaLlBoXpDrBM+Zs7/9wOfIqwSFMvedfjDlv/u
	UK7mNPEcmmNVKv9OO+o0VQWFl4kvRrWMyyNP6BwYddTGPOmIJuYWZCBONnZBFQ==
X-Google-Smtp-Source: AGHT+IEKeeCCY30WC79pUxzbCYGAYxKVneqTzAHMpEIuJv9ofIb9oNQlNHzt8utrdrVuG/f9Z+IJhA==
X-Received: by 2002:a17:903:2284:b0:20c:7eaf:8945 with SMTP id d9443c01a7336-20e984aab21mr1105705ad.28.1729535310208;
        Mon, 21 Oct 2024 11:28:30 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (43.222.125.34.bc.googleusercontent.com. [34.125.222.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3c95sm28914195ad.253.2024.10.21.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:28:29 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH v3 0/1] binder: report txn errors via generic netlink (genl)
Date: Mon, 21 Oct 2024 11:28:19 -0700
Message-ID: <20241021182821.1259487-1-dualli@chromium.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

It's a known issue that neither the frozen processes nor the system
administration process of the OS can correctly deal with failed binder
transactions. The reason is that there's no reliable way for the user
space administration process to fetch the binder errors from the kernel
binder driver.

Android is such an OS suffering from this issue. Since cgroup freezer
was used to freeze user applications to save battery, innocent frozen
apps have to be killed when they receive sync binder transactions or
when their async binder buffer is running out.

This patch introduces the Linux generic netlink messages into the binder
driver so that the Linux/Android system administration process can
listen to important events and take corresponding actions, like stopping
a broken app from attacking the OS by sending huge amount of spamming
binder transactiions.

The first version uses a global generic netlink for all binder contexts,
raising potential security concerns. There were a few other feedbacks
like request to kernel docs and test code. The thread can be found at
https://lore.kernel.org/lkml/20240812211844.4107494-1-dualli@chromium.org/

The second version fixes those issues and has been tested on the latest
version of AOSP. See https://r.android.com/3305462 for how userspace is
going to use this feature and the test code. It can be found at
https://lore.kernel.org/lkml/20241011064427.1565287-1-dualli@chromium.org/

This version replaces the handcrafted netlink source code with the
netlink protocal specs in YAML. It also fixes the documentation issues.

v1: add a global binder genl socket for all contexts
v2: change to per-context binder genl for security reason
    replace the new ioctl with a netlink command
    add corresponding doc Documentation/admin-guide/binder_genl.rst
    add user space test code in AOSP
v3: use YNL spec (./tools/net/ynl/ynl-regen.sh)
    fix documentation index

Li Li (1):
  report binder txn errors via generic netlink

 Documentation/admin-guide/binder_genl.rst    |  92 ++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder_genl.yaml |  59 ++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 287 ++++++++++++++++++-
 drivers/android/binder_genl.c                |  38 +++
 drivers/android/binder_genl.h                |  18 ++
 drivers/android/binder_internal.h            |  22 ++
 drivers/android/binder_trace.h               |  37 +++
 drivers/android/binderfs.c                   |   4 +
 include/uapi/linux/android/binder.h          |  31 ++
 include/uapi/linux/android/binder_genl.h     |  37 +++
 13 files changed, 625 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_genl.rst
 create mode 100644 Documentation/netlink/specs/binder_genl.yaml
 create mode 100644 drivers/android/binder_genl.c
 create mode 100644 drivers/android/binder_genl.h
 create mode 100644 include/uapi/linux/android/binder_genl.h

-- 
2.47.0.105.g07ac214952-goog

