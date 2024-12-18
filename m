Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991015530C
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557385; cv=none; b=A6Ed6b9iR5AKMTxZRRDCw+ngIjQA+ZQeSijKOOYSyQCDK26IopKQLpGZtCgwU9PoteJlj+tOPcXBAtZQGzJo9hp7Dnyiv+ZWTk5Auws9nnCrnMa5DMZfBgWcjNLqq1VMlJNE3YwZ0W/b2GbYSs/r4E487FSebnMe9sn4JGySnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557385; c=relaxed/simple;
	bh=/GSzf5Eoi6r/sV5UXAmVCBr8u0h91/CF4nxiXCT1Eo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdi1w/z7XsAxCgrEgtI4lieD0v9eRkFfnkmBtDOyTi/aDayQzPY6f31wtftMnejfAu3nY/aDaBbLETo01RZo3dLlK1tMGTSx/t6NeI1EvKOzccATuuZb4bjdxHn+qpf7GYlkftv+W7s6pPuTYatlayGoxPd2aHcEjktOEZJXaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l0PnoN5S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l0PnoN5S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166651f752so1564995ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557383; x=1735162183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2f+eF/LcaKgyfUPQT/S7dDCqmInA4q6SnLyyzAuO/U=;
        b=l0PnoN5S4x2Esg6ITE+ZE21h75eKMxlzWyjIOZBXEss0ierdJAwGualYHmyf7M9kQ+
         XxlYKdMJNYolKp1Li0HBRodCkL6AzJkYmezDa/5xDliEWetolq2y1AtEIb3DhzizwH0u
         TMMx2SkSJulDjRwDwd4AZ1PfXgmoZoxn/9q5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557383; x=1735162183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2f+eF/LcaKgyfUPQT/S7dDCqmInA4q6SnLyyzAuO/U=;
        b=DWnKAa4miRJruHqC1MGeJtjZPoJ70t482kFJpWbapYS2yaEpwpTwVDYYiroaDipXvF
         v4IE2eNg7JCXlAITqykomX+fKMgkbIFj1HGY8GaT31CEtVmWAvcPQn+sOQK0i33PSJDY
         UX9ZRwkf38CN+9j3UIJjqXC2cSx+E8X9BhL1xSHdQYsFvHwPlMpvB59KNEIYdbY7Ki3Y
         CbZPrAILGvOHNy03siz5Cyj4tWhoWs4EG3WblRZGHxT8cP+6NU9W1GtXuDwWSFX9HuaE
         EZAN/iBOi2nrVZnCFU/EG6eSQjleWerJojwiS+kRNxTdF5DV4ZsFmckvYUyW64EsfW52
         OTbw==
X-Forwarded-Encrypted: i=1; AJvYcCVw+YElOlZ8bv/qnub02MGExDF/D3F7VNsWfRGAcQga6QvcAR7F+NU3iS1SnDw+ygHoJjFpezPzDpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT62Bz/X5CNNKvrkBdaU9aUIExDPip7nUvLnz0l+7yyIxSPlSg
	zTRMHcVj6RBwMahpYr9JwRVjdRkDs1i7HJMj7LJeM/M7wq5DHJZHbWiMWK4lFw==
X-Gm-Gg: ASbGncvEDFJ9x0UgL9IpNGrPEUf9mB8UasZIx3xyObL8BiOLAbsvPE8LGwnKuVu0+u2
	FEFzWcul+VkATwEj49Rwk6LJdzVOe9fZXvg+PfB5cA8Oj2cYInnVvev40yap6AeWNogZjkqUifl
	gzmhvWGSDA70P/x+PRr840pj/ScGlrrqiihBBHHgL5XctBDeDPBjzJxAyi4IJjoQa7T2GiGtyLt
	iyu7ML8ezh3bHDJIAGrGx4VkQ9NJV54kuMencTM/m6Co+1Un7Olvbvu8H4nWaQuoKLtGh5tWhUL
	XhEa/5XtD4fJmqzk+EViPtif8My4o0QjoBBXk7Yg0qxQbA==
X-Google-Smtp-Source: AGHT+IHRoIe4Kv5GcvetTkvgVDfI/IBtxg9Qf3dMb0mNlKNEo0ISTKhMaTcR+7wnK13THNDFlq2b2g==
X-Received: by 2002:a17:903:11c3:b0:212:63db:bb15 with SMTP id d9443c01a7336-218d72529fbmr76472685ad.38.1734557382879;
        Wed, 18 Dec 2024 13:29:42 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (200.23.125.34.bc.googleusercontent.com. [34.125.23.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e50455sm80506145ad.159.2024.12.18.13.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:29:42 -0800 (PST)
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
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH v12 0/2] binder: report txn errors via generic netlink
Date: Wed, 18 Dec 2024 13:29:33 -0800
Message-ID: <20241218212935.4162907-1-dualli@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
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

The 1st version uses a global generic netlink for all binder contexts,
raising potential security concerns. There were a few other feedbacks
like request to kernel docs and test code. The thread can be found at
https://lore.kernel.org/lkml/20240812211844.4107494-1-dualli@chromium.org/

The 2nd version fixes those issues and has been tested on the latest
version of AOSP. See https://r.android.com/3305462 for how userspace is
going to use this feature and the test code. It can be found at
https://lore.kernel.org/lkml/20241011064427.1565287-1-dualli@chromium.org/

The 3rd version replaces the handcrafted netlink source code with the
netlink protocal specs in YAML. It also fixes the documentation issues.
https://lore.kernel.org/lkml/20241021182821.1259487-1-dualli@chromium.org/

The 4th version just containsi trivial fixes, making the subject of the
patch aligned with the subject of the cover letter.
https://lore.kernel.org/lkml/20241021191233.1334897-1-dualli@chromium.org/

The 5th version incorporates the suggested fixes to the kernel doc and
the init function. It also removes the unsupported uapi-header in YAML
that contains "/" for subdirectory.
https://lore.kernel.org/lkml/20241025075102.1785960-1-dualli@chromium.org/

The 6th version has some trivial kernel doc fixes, without modifying
any other source code.
https://lore.kernel.org/lkml/20241028101952.775731-1-dualli@chromium.org/

The 7th version breaks the binary struct netlink message into individual
attributes to better support automatic error checking. Thanks Jakub for
improving ynl-gen.
https://lore.kernel.org/all/20241031092504.840708-1-dualli@chromium.org/

The 8th version solves the multi-genl-family issue by demuxing the
messages based on a new context attribute. It also improves the YAML
spec to be consistent with netlink tradition. A Huge 'Thank You' to
Jakub who taught me a lot about the netlink protocol!
https://lore.kernel.org/all/20241113193239.2113577-1-dualli@chromium.org/

The 9th version only contains a few trivial fixes, removing a redundant
pr_err and unnecessary payload check. The ynl-gen patch to allow uapi
header in sub-dirs has been merged so it's no longer included in this
patch set.
https://lore.kernel.org/all/20241209192247.3371436-1-dualli@chromium.org/

The 10th version renames binder genl to binder netlink, improves the
readability of the kernel doc and uses more descriptive variable names.
The function binder_add_device() is moved out to a new commit per request.
It also fixes a warning about newline used in NL_SET_ERR_MSG.
Thanks Carlos for his valuable suggestions!
https://lore.kernel.org/all/20241212224114.888373-1-dualli@chromium.org/

The 11th version simplifies the yaml filename to avoid redundant words in
variable names. This also makes binder netlink yaml more aligned with
other existing netlink specs. Another trivial change is to use reverse
xmas tree for function variables.
https://lore.kernel.org/all/20241218203740.4081865-1-dualli@chromium.org/

The 12th version makes Documentation/admin-guide/binder_netlink.rst aligned
with the binder netlink yaml change introduced in the 11th revision. It
doesn't change any source code.

v1: add a global binder genl socket for all contexts
v2: change to per-context binder genl for security reason
    replace the new ioctl with a netlink command
    add corresponding doc Documentation/admin-guide/binder_genl.rst
    add user space test code in AOSP
v3: use YNL spec (./tools/net/ynl/ynl-regen.sh)
    fix documentation index
v4: change the subject of the patch and remove unsed #if 0
v5: improve the kernel doc and the init function
    remove unsupported uapi-header in YAML
v6: fix some trivial kernel doc issues
v7: break the binary struct binder_report into individual attributes
v8: use multiplex netlink message in a unified netlink family
    improve the YAML spec to be consistent with netlink tradition
v9: remove unnecessary check to netlink flags and message payloads
v10: improve the readability of kernel doc and variable names
v11: rename binder_netlinnk.yaml to binder.yaml
     use reverse xmas tree for function variables
v12: makes kernel doc aligned with source code

Li Li (2):
  binderfs: add new binder devices to binder_devices
  binder: report txn errors via generic netlink

 Documentation/admin-guide/binder_netlink.rst | 110 +++++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder.yaml      | 108 +++++++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 241 ++++++++++++++++++-
 drivers/android/binder_internal.h            |  29 ++-
 drivers/android/binder_netlink.c             |  39 +++
 drivers/android/binder_netlink.h             |  18 ++
 drivers/android/binder_trace.h               |  35 +++
 drivers/android/binderfs.c                   |   2 +
 include/uapi/linux/android/binder_netlink.h  |  55 +++++
 12 files changed, 635 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_netlink.rst
 create mode 100644 Documentation/netlink/specs/binder.yaml
 create mode 100644 drivers/android/binder_netlink.c
 create mode 100644 drivers/android/binder_netlink.h
 create mode 100644 include/uapi/linux/android/binder_netlink.h


base-commit: aef25be35d23ec768eed08bfcf7ca3cf9685bc28
-- 
2.47.1.613.gc27f4b7a9f-goog

