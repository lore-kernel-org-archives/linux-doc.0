Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707353BD254
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309853; cv=none; b=Z6pCbP5w6XSVX6LOhF0bMjSFBQwGRpSLF5aKaPQT59xQcJIetEzMNBdPvay6CbDp7LZ8yE3NLNaM2l4AOvpHzpEPRbstpAk0KM3JDT3xUlqoGJQbOblH0NXtJNG+48uQvjF3zNTrYWDu7Pt1THw5wyc7uFD0MD/3WKKJ5r/gnrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309853; c=relaxed/simple;
	bh=6VISSpzlZznNj9au7o+yMu5s+elbPaZGvkqibf2jiuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+j6sJFV5ZijsZMZHsvY9dHkgLTnxZ7i8JEHHXRTer3s/PmxEhZpm9pJ1HtQqeghS426bA/mHeap6IvC2dI0C8U0Z/g8GpQymCnApzXymyRIg7NtvVCoXx4cK+NrpBA3Ib8KGbotOq3wtfx8EIZBPAMdU6VJxaEZdg+aglhIfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=GNOlJrt4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="GNOlJrt4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so7490985e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309848; x=1773914648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyRQtY5fUA7eA4hQxNQZFrII39g5Q1jSYxzqSfKvGA8=;
        b=GNOlJrt47uGW7S28r6cV9gLG1PD6OhoDYrZMB02dqPGuXvVUjSJDTLA3pjnHz+kMdt
         eXTz/9O9g5Gm975t/iye6AslQbT/ga/tkGY6FUDk2UY6y/lvD4ZFXHN+KsrAU7wUICyE
         WmDPefMpZbE4i3wlhDeDDvPzLfkG1sC7Id+LQDwEK2eSOOIiGbrMmGT+bpJ6yraaKftL
         DsX0UYXqPqHUV4jiW1E0yBOVlgn791GBd8ssoTFnnFtjUlRBw7+vfhiPcs3cEgXlcYgZ
         /MJoDMMSXRyn89Gtnfyd2kpIOf5Ix2uKKV7mGrgKCrmXTsu4aG3zngfmtzFCEKgo4Lh8
         9osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309848; x=1773914648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyRQtY5fUA7eA4hQxNQZFrII39g5Q1jSYxzqSfKvGA8=;
        b=scSKMhBbatMrcQpTjQoZqmTgQb0IfPljQDMrw+aTogkF4RCYYp1KDUIg7y14NIej4K
         LGg3woHzKjbie03Qcy87+rdMgvBQwI4xtrdKAhVE9SYySrMiLaOAm5lB3jgzRBC3KA7G
         UxlZG4g/Lev7CcdRmEYmwLscvN4qURErvb2ZBvDn+Wyfe5HBQd7GL/IXwOeZgwHNaLPL
         qeicbfErSe9UzgHj7Wav/Qeg0QQh41sKOi/CcDDwGHSxixPOWNeWvonnUcbsTCkpSJGw
         Bw8M6QklvZ/SyygMy1wPjABahRQHtexabGBKJsORulkpGNztJi3sLRm83PewDamapBur
         saeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVszOoQYYjUjUGpb2dIlJtZu4sgatZ3JEN4RAbPB5NHO/VXXBuWSWJ+PrUMpj3UJQu1XVq9Ke5OxcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwt3VPyJBXAeyZdz/YrAgGQTOBB4Xi4SQU4UJV1UDh1jNim2J6
	LKuCcqi9bSzCOZzanzNAynK8I1/LkLDo6WEF3C7+L2YeWROssZlV4c2QxpPhEY2xrE8=
X-Gm-Gg: ATEYQzxynGM2aMddVZEsdRLMGu3XNgBPmjBLvbd8CyqWAESFMvWrsTS5yroToUqyxKj
	QYMlXntpQWh/x8Xk+oCGRiBVQkbBWygdnObpRcs2cALtZjif/SoYrmOmWOF3Fuahv/1Fwbk7F7Y
	YGQHzFWQBUdNF8orc7NCcUyC3GzL85sQL63XyDvfLfowiOoQI1Mjs7YX6aHGJCJ35IWqpMKQdAa
	8H+/A6Zm9tbgUBJcqYq3Kn4kytvySSka+7GK1d6n9GYPu9okogoe6a0gEbfaAYrxZna0eAJWh81
	1VMbEfq05hsUF3Pxmjdnev9nyM0wowZeELawfKRLdKoparaf2NR8VEDsU3h6Usib/wI92+RbG1I
	xXOF0W0rxiJn0KV6txWa1ovoih9k4FgYovdV3grfeQBCC/Rneg4lZgy2YcQB9RZhLuRR8T4Cn3k
	dyKV2NxB+HI4VYsQ==
X-Received: by 2002:a05:600c:3103:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4854b0acb1amr86891245e9.5.1773309848490;
        Thu, 12 Mar 2026 03:04:08 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e92d5sm117363925e9.1.2026.03.12.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:08 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	przemyslaw.kitszel@intel.com,
	mschmidt@redhat.com,
	andrew+netdev@lunn.ch,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	chuck.lever@oracle.com,
	matttbe@kernel.org,
	cjubran@nvidia.com,
	daniel.zahka@gmail.com,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH net-next v4 00/13] devlink: introduce shared devlink instance for PFs on same chip
Date: Thu, 12 Mar 2026 11:03:54 +0100
Message-ID: <20260312100407.551173-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Multiple PFs on a network adapter often reside on the same physical
chip, running a single firmware. Some resources and configurations
are inherently shared among these PFs - PTP clocks, VF group rates,
firmware parameters, and others. Today there is no good object in
the devlink model to attach these chip-wide configuration knobs to.
Drivers resort to workarounds like pinning shared state to PF0 or
maintaining ad-hoc internal structures (e.g., ice_adapter) that are
invisible to userspace.

This problem was discussed extensively starting with Przemek Kitszel's
"whole device devlink instance" RFC for the ice driver [1]. Several
approaches for representing the parent instance were considered:
using a partial PCI BDF as the dev_name (breaks when PFs have different
BDFs in VMs), creating a per-driver bus, using auxiliary devices, or
using faux devices. All of these required a backing struct device for
the parent devlink instance, which does not naturally exist - there is
no PCI device that represents the chip as a whole.

This patchset takes a different approach: allow devlink instances to
exist without any backing struct device. The instance is identified
purely by its internal index, exposed over devlin netlink. This avoids
fabricating fake devices and keeps the devlink handle semantics clean.

The first ten patches prepare the devlink core for device-less
instances by decoupling the handle from the parent device. The last
three introduce the shared devlink infrastructure and its first user
in the mlx5 driver.

Example output showing the shared instance and nesting:

  pci/0000:08:00.0: index 0
    nested_devlink:
      auxiliary/mlx5_core.eth.0
  devlink_index/1: index 1
    nested_devlink:
      pci/0000:08:00.0
      pci/0000:08:00.1
  auxiliary/mlx5_core.eth.0: index 2
  pci/0000:08:00.1: index 3
    nested_devlink:
      auxiliary/mlx5_core.eth.1
  auxiliary/mlx5_core.eth.1: index 4

[1] https://lore.kernel.org/netdev/20250219164410.35665-1-przemyslaw.kitszel@intel.com/

---
Decoupled from "devlink and mlx5: Support cross-function rate scheduling"
patchset to maintain 15-patches limit.

See individual patches for changelog.

Jiri Pirko (13):
  devlink: expose devlink instance index over netlink
  devlink: add helpers to get bus_name/dev_name
  devlink: avoid extra iterations when found devlink is not registered
  devlink: allow to use devlink index as a command handle
  devlink: support index-based lookup via bus_name/dev_name handle
  devlink: support index-based notification filtering
  devlink: introduce __devlink_alloc() with dev driver pointer
  devlink: add devlink_dev_driver_name() helper and use it in trace
    events
  devlink: add devl_warn() helper and use it in port warnings
  devlink: allow devlink instance allocation without a backing device
  devlink: introduce shared devlink instance for PFs on same chip
  documentation: networking: add shared devlink documentation
  net/mlx5: Add a shared devlink instance for PFs on same chip

 Documentation/netlink/specs/devlink.yaml      |  58 +++
 .../networking/devlink/devlink-shared.rst     |  97 +++++
 Documentation/networking/devlink/index.rst    |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   5 +-
 .../net/ethernet/mellanox/mlx5/core/main.c    |  17 +
 .../ethernet/mellanox/mlx5/core/sh_devlink.c  |  61 +++
 .../ethernet/mellanox/mlx5/core/sh_devlink.h  |  12 +
 include/linux/mlx5/driver.h                   |   1 +
 include/net/devlink.h                         |  10 +
 include/trace/events/devlink.h                |  36 +-
 include/uapi/linux/devlink.h                  |   4 +
 net/devlink/Makefile                          |   2 +-
 net/devlink/core.c                            |  91 ++++-
 net/devlink/dev.c                             |   8 +-
 net/devlink/devl_internal.h                   |  34 +-
 net/devlink/netlink.c                         |  52 ++-
 net/devlink/netlink_gen.c                     | 355 +++++++++++-------
 net/devlink/port.c                            |  19 +-
 net/devlink/sh_dev.c                          | 161 ++++++++
 19 files changed, 815 insertions(+), 209 deletions(-)
 create mode 100644 Documentation/networking/devlink/devlink-shared.rst
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.h
 create mode 100644 net/devlink/sh_dev.c

-- 
2.51.1

