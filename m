Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E92BEC55
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969905; cv=none; b=bbcmI9W3Hx887ppCbi2DEL6MBWu+35JCK3gAG5N40/UNMuqdkHU3XUtJ1VTN645OcDooz10ZofSOoG63MVaDjZqQUQD3nZx40YgzGp+Z8SwsH1j/ZDzJhVn8pVv++5XFVNb0EcJdz6xwIhFq2gYy1CP/GdPEzooghMSo4TsvhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969905; c=relaxed/simple;
	bh=k/3MiZh6ObBA2Gh0WgqU7rsQmjvA6q6JXhNX15TphY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YCKWINezYkqzEJHUJYZoqT5fGsumIpQC/4uL1im7e1eIP5fccoYsbEJaOlqmh4mQOAIbGgTkRLlxdEmSFRowQqPgdQog8r7MzME1pucGrY/CU2Iv5ZiL+40mluYjFArXWV6FS6STapBpPhLoDgn0o655yByClTP8kMLQ8UjnxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso2572781eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969903; x=1774574703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rpuLOskCPApojyOfZj7pXXkMzfKSIlGWmqpeqvyGp0=;
        b=MILf39vwBvN7vQH8HeGcfVrZ/HCJo89K9V/zEi+kYutxQpnA93rGeNeF/c4sHFCs7i
         6uhjtKh+c7yT3DawMgdB2T81tenOEVhqrCixlqLpfGCwUe3EjbyQ1NvYM5TsRGGOqbun
         YTNPwded3IJTX1Uch6Mqh6lzzJRn+ygmWRKxrlWBJL8q4HdtTG8Ob5CUKF9lURKrZxi8
         BLzSTnfkjCuQ7YI1PBoUoqJUbNMZ8OefDiX1DsmLvkvONKByMZoFiMVK47n+r51wGuc0
         LzGhjHLf/zYyUI/L74noGsIMZ5TCWtz1H4X7LJ8WVHUhiphFL8bmsM9IOwyTNHvB5V1R
         4r9A==
X-Forwarded-Encrypted: i=1; AJvYcCVkLViLl/NscMyyHx1JIC6luzYnTuPRe8WbqEY7sekUZWq+Ra3Ihh5KpXr4uBvf/Q0aDhhn0HorO6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGF7wTsRgTPpmtnu+kAfM2ptLhkcWZ4S3echHqI89xPXWLvLS7
	ntjTacidOeupObRVf1svKmkoSfg/36IPF5DRNKHIhmaTMNWEs3Aw6f8=
X-Gm-Gg: ATEYQzyuLy/PRjpB9rH3/O4s1WpQjlhzaKCs+pJKF3Ok6ul5ToJn9JOgOz3+dTnZZkV
	73MIgCCphoduoma/OLwXX0H4Y4fuek34kdnmTLq07HCgmA7fmm0dM6arMyVbIrc5/SFf8cZ+7cx
	OIR2xKzxdyS4hZqMxD47IsPf9t9h3R0UjD4ms+8kr9799PQdVc7Nb5KJQZvfALuSew7IP0CJvs/
	I4Htsjbc+SN1Hkg9itvtPPir9AhdV7NZwFY7JmY3uX053aI3n3nsfQ4OWZENZkLalIAI9w4naYJ
	EsenPBYNBybPIsWk7hVwBt79w4Bd4nboet+sBGYPUOqiTFzH2+oLPNlFurYNy4fndfhl1SpdQ3Z
	56MUOnMizzZdaJyKZy4/OxepK/eZovu8aFzHFzgXZxP3nKVPlpR0VVGVS+DLyTk++b/JMVAuzX9
	DU9uD/1OtIMxekmAjVfQ5MohS9uAo0pjEL1NKtwQWxAADIqRz4EFm3wlfy3dvcsB2zT/rd1pibq
	trIFnyk2HeKM97AeQ==
X-Received: by 2002:a05:7301:9f0c:b0:2b8:4c95:365d with SMTP id 5a478bee46e88-2c1095f54afmr757541eec.10.1773969902833;
        Thu, 19 Mar 2026 18:25:02 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b35116bsm1575407eec.30.2026.03.19.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:02 -0700 (PDT)
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
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 00/13] net: sleepable ndo_set_rx_mode
Date: Thu, 19 Mar 2026 18:24:48 -0700
Message-ID: <20260320012501.2033548-1-sdf@fomichev.me>
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

v3:
- module_export(__rtnl_unlock) (nipa)
- s/netdev_uc_count/netdev_hw_addr_list_count/ in bnxt (Aleksandr)

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
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  55 +--
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
 net/core/dev.c                                | 176 ++++++++--
 net/core/dev.h                                |   1 +
 net/core/dev_addr_lists.c                     | 110 +++++-
 net/core/dev_addr_lists_test.c                | 321 +++++++++++++++++-
 net/core/rtnetlink.c                          |   1 +
 net/wireless/core.c                           |   1 +
 net/wireless/nl80211.c                        |   2 +-
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/rtnetlink.sh      |  44 +++
 22 files changed, 765 insertions(+), 94 deletions(-)

-- 
2.53.0

