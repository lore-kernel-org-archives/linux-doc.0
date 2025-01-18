Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE415EFA1
	for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737187789; cv=none; b=e+XIcXK6VOyZaMGJR+voY6UCAe6f+Dcb30Vl7jGqkKeM+npWCnUWfpp3FZVv4CQIpklMgAO9pzWH2IrYSvhyi2EkGCF2rGlP5Yt3MwCO6MmyE0mlTVTT5j3jqB4ALCWk9l3E32qfxzlg4AW9QxXy7AtAXTFMGWxwIyOKGOtqmzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737187789; c=relaxed/simple;
	bh=lk7i9VEmfFrx0Vj7XQMC+s9K4I7nQndxPNju0KEzUhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8vDtDsJOPcI+NaY+GsTiMMXZXqgLnl9ZbydG88OhPfqiIPhjtrbW4KO9kfyKaD6Sdve7S2tStsphy7sYjQE4APYCjkOYeERB9QAK/GtgRrdqHBCnF6vtf00MgmIR5xoy7DpgKXyw0BnR1BcXbN2I5c/eTb+qkKYDnOMPA6OqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d/fuFyqK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d/fuFyqK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so5030759a91.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 00:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737187787; x=1737792587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ts7rCfO7RdQOq9AEOS5H6idZJ+Ca7XhoZ5MB9B744OA=;
        b=d/fuFyqK8645I3h5ku+aeY/V26WhuSH1V5FZc0aHjd1uJroJwo5YK1PS6zAdtxU9mc
         B5iRCIIpfyD1klhIXGSnd5f48MtgUxOPC8k6dFDQBH2XgQ03PEKGWmtEUt8RMVW5rUyE
         qxgsJbC6fpYgDYox7cLC3zn5tm1wLaIiH8zjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737187787; x=1737792587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts7rCfO7RdQOq9AEOS5H6idZJ+Ca7XhoZ5MB9B744OA=;
        b=TzAKMpcYUQ3gTVW95DT5bbLS78IZ6wN8yx7FqwwAh9S4DX5rvIUnTsAkca+g06AVSx
         jR+IUt/4EKsERhVfbmof8LDzUy1jDA8MoIPV6Fy5aLXCUCMhvRw7xtaTryFJeNaySVg9
         a4aGXfr6Lo8Imvg01cxvK2o93lBpH/i/tI6JFuCBf0M/fpP8lTcQoKf/9osM+O4oA3gA
         3ES6+agcZB/aSx1ACrSn53yXKzx0HFZpFzYpcTkh5yOLkoyMNVWbuNGs5x7KmewYf3xP
         mwEkI9kt+iCnckoZ6dmeCYOX9Kw/v1k3pt8f+N93pbQPlysDRfO+m/d0eWkKGLwO4opo
         NxQw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyWrBNvVGoqhwwYgtLIu0wYxxAlQvKA07evGmfby4rB1nCO/Gwklem6wCvgLbYHqhe7feJ4Iv6Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0lFZH9V8EoQrmIuPr0UKjqL5pMn3Jt3JWX+h9UAPVwv7zen3
	nsqygjB1xRNudpbMOjR7qsRUSFtF7ZTgdVbrjoPNdv7L2vEX1vptM7xpjYh9fA==
X-Gm-Gg: ASbGncsRJnIKhx9UHg7ov88TEnf24lj0MSLbPlM2PrlV2M6Gz9MceAHFpxi8dbNx03n
	iRsdw895EcVyEllCfsPL1iS4Jq1+sWm5lSacso0ckZijXFHwkVosYuzSlNzWz2KRDSosDAUvbwC
	EzBVvY/2QKZQ2cI/O7Fe9vcvZQE53QsORoTVXU/asJ4xdthc1hKsEyh3co/iMgLXW42Bceq1gCy
	AV2HIDjtvH6Lmo4/JJjAd0vIcxZfUUk2xuEVYCzmPHfVx026akGUbDwQR67/9oE0Uid1GkQpj/K
	yVQEHJ0+asbSlgf5J1UKty/ibV1RrKCxSdiCC9v+jGHKW41Fs3GCZ/yuKoo=
X-Google-Smtp-Source: AGHT+IHk1AI/XHd5Gsea8u2Z/slWcUR5j4TYRRf/qGyH0gKekdSy5AOWEh3eP9AxBUZQD3f8rDcm4g==
X-Received: by 2002:a05:6a00:a95:b0:72d:8fa2:9998 with SMTP id d2e1a72fcca58-72dafa44feamr9452075b3a.14.1737187786630;
        Sat, 18 Jan 2025 00:09:46 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (134.90.125.34.bc.googleusercontent.com. [34.125.90.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f0877sm3213225b3a.23.2025.01.18.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 00:09:46 -0800 (PST)
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
Subject: [PATCH v14 0/1] binder: report txn errors via generic netlink
Date: Sat, 18 Jan 2025 00:09:38 -0800
Message-ID: <20250118080939.2835687-1-dualli@chromium.org>
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

The 14th version fix the code style issue by wrapping the sock priv
in a separate struct, as suggested by Jakub. The other 2 patches are
no longer included in this patchset as the equvilent fix has already
been merged to upstream linux master branch, as well as net & net-next.
This version has already been rebased to TOT of linux-next.

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
v14: wrap the sock priv in a separate struct

Li Li (1):
  binder: report txn errors via generic netlink

 Documentation/admin-guide/binder_netlink.rst | 110 ++++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder.yaml      | 113 ++++++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 280 ++++++++++++++++++-
 drivers/android/binder_internal.h            |  30 ++
 drivers/android/binder_netlink.c             |  53 ++++
 drivers/android/binder_netlink.h             |  22 ++
 drivers/android/binder_trace.h               |  35 +++
 drivers/android/binderfs.c                   |   1 +
 include/uapi/linux/android/binder_netlink.h  |  55 ++++
 12 files changed, 699 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_netlink.rst
 create mode 100644 Documentation/netlink/specs/binder.yaml
 create mode 100644 drivers/android/binder_netlink.c
 create mode 100644 drivers/android/binder_netlink.h
 create mode 100644 include/uapi/linux/android/binder_netlink.h


base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
-- 
2.48.0.rc2.279.g1de40edade-goog

