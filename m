Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D83D647C
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846190; cv=none; b=o6+2Srrgbw4WCl9H/wC4CWoTaY+oioSO48qbgx5MMxY3HjD+H5H3Y/fcprokP4m8bXdBHcBTXZdN+7ki2e7zaONtYe8+oTUQvNHnGyA5ZxTzN4M/wy/rhISPjhaIrHQp39vhKP76UsxTHlusu5p9+BX4lgHwS6FqoQ9ER2UOunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846190; c=relaxed/simple;
	bh=Jiptg9yDJQrV+D8cHBp3a16G3+cX7N41SQHpo9ylaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aX/8zWqWzBoiQLX6yN95C3s+6WMXacTiHuD7Qu+yQNa22TbJdOIsvrEeC4K2fVLSED0NuCFxgeLew6WJUc8SzXzPp2stSHAlfRnHLfMJOL1dBzq+qX4GataEcBIQICOlaWrnseU38S3RaYe0XHnCwSfP4CdT98tet2MvGqbX5Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e38f3f60so537240eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846188; x=1774450988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mel7QAaNVQ/Ezv2Sx36tyZ40BmWBA8rFfywqaIdVMQU=;
        b=rbE3KbtbX328CtpA+g42gG/fg5sjYizwmKjuGBi5zlHuaLnybNQQiojPfPMtCyB2Nz
         L7cFxJyna1IvJAeUczlCV4JirFsMO/wRgj0qh0EKDs0eRBA5LmWustoNuPhL6+RoDiPR
         33VNmxVAewnFw5AqO8sBSMdOBbun4Mmg3ucWcPnI5CyiL4itj3j67R48jLkJ6JHSVR31
         OtAS24/PlnuSE5aNkxAGJMdW5COjC5rw1LJACNjql6GWSoLq66RVXpF5AWMZgpCY6LWP
         tS/Xoh3irEPiL47m4lZ4ksmv7rRMvJaIRPYPL6Z71YAsKIUe3bjCioZPHoQfCgJTaKbH
         4r6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdOeNe1Sq4rA5Irb9xmwvHElcXipTXS8fy1GT7VPcLr699KIeVCur2hb7DtVfe9ejkzFO6QQIjk9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEakp7spz1mPDxd3qstfI4QfRl0U7V5VG9O0JwQIwUzQlZhL4e
	1L7/8JrTECpigFEEIwx7FF2ElFVL75idlqD8T6EIW5gUF1C9WbV3F1k=
X-Gm-Gg: ATEYQzydyhuKIBG2WwaET1aKgspe79KyYOPaHujKk7KMwoYKBYMvqHkrSgIHIDoWJAC
	gzmghqBKmwiaWCGQbveroLrDDiHboyi/SMOpJmfP+6dH1AW5ElbDnuKEflt/xkSk6AwWgrTI8gm
	62Y55m+2jCSGc7YZSD2RT+7Q3B65LCCq+MVH/BO1X5Z2qFJVsAhkKMS4TEQbcwecXu4yj0aiuP4
	RWa6XOglgei3oC9IKzWkbTWx5zszRrfwg1uQZ0Xyi6njju3SJvzny768Mj8l+CJxQ0U4f/9vy5c
	tR6oZHiAg8Fkpch0kX1vy413nDbQ/TVFtNwAOQzI8eu7KYnO3APwfk3NyPDP7A9lJNZPfQdYw8a
	psDkCREUtu1OefP5xkWWWYbzICAzotnzfnVxltSmhGZeA77O2wHrfTIt4JT91eiI/u0o+gfCb9L
	oRAseqRAGq1tC1E2Zh+AUTHibyo12W2pkHgw1idBmQFE4uFwqUJjqNQk6jufD/SAwuN+BfQAL8c
	ecVxEP0Z1YhqJX1ynZL1qQfr7BM
X-Received: by 2002:a05:7300:dc91:b0:2be:88f2:3c98 with SMTP id 5a478bee46e88-2c0e46d3cd6mr1489917eec.1.1773846186396;
        Wed, 18 Mar 2026 08:03:06 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ee672sm5053621eec.28.2026.03.18.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:06 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 00/13] net: sleepable ndo_set_rx_mode
Date: Wed, 18 Mar 2026 08:02:52 -0700
Message-ID: <20260318150305.123900-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new ndo_set_rx_mode_async callback that enables
drivers to handle address list updates in a sleepable context. The
current ndo_set_rx_mode is called under the netif_addr_lock spinlock
with BHs disabled, which prevents drivers from sleeping. This is
problematic for ops-locked drivers that need to sleep.

The approach:
1. Add snapshot/reconcile infrastructure for address lists
2. Introduce dev_rx_mode_work that takes snapshots under the lock,
   drops the lock, calls the driver, then reconciles changes back
3. Move promiscuity handling into the scheduled work as well
4. Convert existing ops-locked drivers to ndo_set_rx_mode_async
5. Add a warning for ops-locked drivers still using ndo_set_rx_mode
6. Add a selftest exercising the team+bridge+macvlan topology that
   triggers the addr_lock -> ops_lock ordering issue

v2:
- wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit (syzbot)
- simplify mlx5e_sync_netdev_addr for !uc (Cosmin)
- switch to snapshot in bnxt_cfg_rx_mode (Michael)
- add team to net/config (Jakub)

Stanislav Fomichev (13):
  net: add address list snapshot and reconciliation infrastructure
  wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
  net: introduce ndo_set_rx_mode_async and dev_rx_mode_work
  net: move promiscuity handling into dev_rx_mode_work
  fbnic: convert to ndo_set_rx_mode_async
  mlx5: convert to ndo_set_rx_mode_async
  bnxt: convert to ndo_set_rx_mode_async
  bnxt: use snapshot in bnxt_cfg_rx_mode
  iavf: convert to ndo_set_rx_mode_async
  netdevsim: convert to ndo_set_rx_mode_async
  dummy: convert to ndo_set_rx_mode_async
  net: warn ops-locked drivers still using ndo_set_rx_mode
  selftests: net: add team_bridge_macvlan rx_mode test

 Documentation/networking/netdevices.rst       |  12 +
 drivers/net/dummy.c                           |   6 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  53 +--
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  14 +-
 .../net/ethernet/mellanox/mlx5/core/en/fs.h   |   5 +-
 .../net/ethernet/mellanox/mlx5/core/en_fs.c   |  30 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  16 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |  20 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.h    |   4 +-
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c   |   4 +-
 drivers/net/ethernet/meta/fbnic/fbnic_rpc.c   |   2 +-
 drivers/net/netdevsim/netdev.c                |   8 +-
 include/linux/netdevice.h                     |  26 ++
 net/core/dev.c                                | 175 ++++++++--
 net/core/dev.h                                |   1 +
 net/core/dev_addr_lists.c                     | 110 +++++-
 net/core/dev_addr_lists_test.c                | 321 +++++++++++++++++-
 net/wireless/nl80211.c                        |   2 +-
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/rtnetlink.sh      |  44 +++
 20 files changed, 761 insertions(+), 93 deletions(-)

-- 
2.53.0

