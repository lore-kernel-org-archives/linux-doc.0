Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C20241687
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937002; cv=none; b=JT37WVi6bJvkdmziBs2B5R19A7vV0U2MTgZzVm6dn/d+xJPIxOJ669Vvgrk+C1E7+sNLH+pqS5uXpsOAxLVDCMbBAFJk1Zotu0MEbcFkYHRVGIRGcuktz7eojlSiEohCn41Xs+ulo1gfNYRxsbfQNJRpQALVC3RyX2MBPhwZNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937002; c=relaxed/simple;
	bh=jt1m/j9PSVPxzuvoQ8e+uL32NKiLS/Jv487EtOtqPzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLDDvjY1TdKZ9v2zDjah1fIHwDak4HxulcRm27GdUIwbExM28NjJThuxHLQWep1bzYTyOnUYeD9FSkPqy7+WNvsIFzFGMR65AE2yeXUklXnm8bpbmGS9pF8OvLXnBxIv/YR9Z14zcVTVqi8DKIMSfhpYmqdopQuQ7Fb1XENtKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DnggEdan; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DnggEdan"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21649a7bcdcso111635315ad.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736936998; x=1737541798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9e7Uw/2eMRVn+Ju9W+kjDajWwn8iBg3HrM68HGerkk=;
        b=DnggEdanyf3C/Hravj3jW7sYa4YPflHqkyAYFw2vq9k+R10p3vNHhgiCdU0iNhdonM
         vNneEHXz6LHrr0U7RxtYIdkI3Vn+18Y3sDa+kotQqP131EdHPUfIqOeGlMs3AksmEHf5
         2MBPMKup1MiBEy8BKk2KWJ42899ezu5wNQ27Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736936998; x=1737541798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9e7Uw/2eMRVn+Ju9W+kjDajWwn8iBg3HrM68HGerkk=;
        b=tL+Eg476+acQ/gffYgdyc05ZkxXJLFULL3NmawChXEhHQQW5WhfMuDSuLjXnYuJFPr
         VxrjqjslLYUkCEZsRce9TyNcoIU8eNTrZSgfBLIMCxEPYv1UMCetiWT3YF4aD7RdYlEy
         HAAAkz5VufEGj4PF2jm8EY2oqVfhT+dYp8n7yV1yEinJuwJw5lgtvpgnzQ1dVLV3bN7J
         RaT8gpDxfid5a1wKq94gLJzWhd6majPiKoUDPI9sUb6FRDUtJ2yqIC7GLEenRl9Z5v2w
         TxMOebhPpdEXeiQMPVqZylnqeDUJ0dBCPxhE7ROfpFj4h+dmcRQURNumQzRdI7g3NnRs
         l2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUkMFszJthYL2ov2epuUPh9oq9BNkPlI01mFTmvMRMwTFcFrykgHEAerVRZCv/hWdb1n/t8tdJe0+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrhwpbs7exufjbXBOGrgukH53/XiTXAV6Ra+V3myH9SNIzsDhI
	gzZS4Jjag7OSYXHFKMn3KIvBU6Xb55JtCRrxlITCYhngwmQK4AvW4c1Q0cdGXw==
X-Gm-Gg: ASbGncvRPxQIZOC/5BX2QkbvfY18C1vk+I6DCQfDVD9ns8joU4a6QeFf6U+pB4k70+j
	LdMleCm8UO9O/Pr1Rh0MbSGZdWVvG73u6ntehy0RaPRN0UhJwl7cu3Uj8XB3u8eXa4GZmCJ3bj+
	WjvPKwvKvcVhar1jkQ83Pr0TMi1grlrnVpWHnk9GwB5DSkdJzWcVh7AVpCL8YnaS50L1EwzWwoK
	gN1wTRufFyyCORtIjbu0upplZA5/CQ5wEDWD7j9c1y98IF5VQSp9/t1OLOD2dlK6xcQikv3t64L
	KmX/86vRryezikUz2y0v9lFOacTC78FedPKO1sU9iRJF1A==
X-Google-Smtp-Source: AGHT+IHeOIm5wcljItb2rSwY2xBvgeEwNXjG2ti6WA0n6el7SGS50/P1UCVMvEkVGUzl+NLyB6LWfA==
X-Received: by 2002:a05:6a20:7fa5:b0:1dc:bdb1:349e with SMTP id adf61e73a8af0-1e88d0ff203mr40869971637.17.1736936998448;
        Wed, 15 Jan 2025 02:29:58 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (134.90.125.34.bc.googleusercontent.com. [34.125.90.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e591sm8835195b3a.126.2025.01.15.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:29:58 -0800 (PST)
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
Subject: [PATCH v13 0/3] binder: report txn errors via generic netlink
Date: Wed, 15 Jan 2025 02:29:47 -0800
Message-ID: <20250115102950.563615-1-dualli@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
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
https://lore.kernel.org/all/20241218212935.4162907-1-dualli@chromium.org/

The 13th version removes the unnecessary dependency to binder file ops.
Now the netlink configuration is reset using sock_priv_destroy. It also
requires CAP_NET_ADMIN to send commands to the driver. One of the
patches ("binderfs: add new binder devices to binder_devices") has been
merged to linux-next. To avoid conflict, switch to linux-next master
branch and remove the merged one. Adding sock_priv into netlink spec
results in CFI failure, which is fixed by the new trampoline patches.

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
v12: make kernel doc aligned with source code
v13: use sock_priv_destroy to cleanup netlink
     require CAP_NET_ADMIN to send netlink commands
     add trampolines in ynl-gen to fix CFI failure

Li Li (3):
  tools: ynl-gen: add trampolines for sock-priv
  netdev-genl: run ynl-regen to fix CFI failure
  binder: report txn errors via generic netlink

 Documentation/admin-guide/binder_netlink.rst | 110 ++++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder.yaml      | 113 ++++++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 282 ++++++++++++++++++-
 drivers/android/binder_internal.h            |  20 ++
 drivers/android/binder_netlink.c             |  53 ++++
 drivers/android/binder_netlink.h             |  22 ++
 drivers/android/binder_trace.h               |  35 +++
 drivers/android/binderfs.c                   |   1 +
 include/uapi/linux/android/binder_netlink.h  |  55 ++++
 net/core/netdev-genl-gen.c                   |  14 +-
 tools/net/ynl/pyynl/ynl_gen_c.py             |  14 +-
 14 files changed, 714 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_netlink.rst
 create mode 100644 Documentation/netlink/specs/binder.yaml
 create mode 100644 drivers/android/binder_netlink.c
 create mode 100644 drivers/android/binder_netlink.h
 create mode 100644 include/uapi/linux/android/binder_netlink.h


base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
-- 
2.48.0.rc2.279.g1de40edade-goog

