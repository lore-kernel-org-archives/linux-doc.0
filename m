Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159925A633
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763425479; cv=none; b=oSDblD2V3uesXjD/WtvWve8oMQtJ/PvgtUnQyTcbptYiAvWuQTJRLUXq25TbV3w3Hb6HCU17gzwMVtcHdv29sS0eUV54ecrwFpYf+jRlRyMF1bxmTr4T6TN9lDF5vXcqQN3wfT3aZiJ03SVjdb7iNkX2ncQjkRjzOz1etwAk1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763425479; c=relaxed/simple;
	bh=t5qlC/z0jbPcIgQmc6xi5TA+xYD1USfzHwCFjZ9ECdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MC1ycVLEGaeZwgqU937uyIuUM3I5LxCYgCIoSvzvWrw1TPnP4sVh06BCprSxPdXrhSSfP0bqcjjmuFGeym4tnMyOXgvV9PAZz8F7lciteXHy33ZupxIVt1RoOyNX5mTKlo8xS5FIMU71z3eGUefdnj6En2BicQ9CfkytJYBSBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Atn02gD1; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Atn02gD1"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63e1e1bf882so4170876d50.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425477; x=1764030277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0UP7FJ+3v7dtudpFsNUQFNBayZALtyMMn0oBcAVymM=;
        b=Atn02gD1chJz74pkB+VhtbATPQAw40Z1z5+lfhVcacqsDIxGrmy/XXAVaBVXgVR33z
         XHvA4m4GiP3feC6y1ohPbnDZOA0wkgB9gY2gtl3xuN29y3WIQJHilANxwkLbtulJ8w8j
         bQ5+i9+cIMwaqetz79Sb3AcUssQeGX12xngb2Wj8sJv/U6H3GK6BEuWEXFGZS6+pqsg3
         YuCUI2NLHl3gBcDtac4KM5nbxpS0AFLALCe+x/VyQG88h6WlRyFYrBgzM3d+aeCxAzJv
         Xu6CftzfLIJjBpwwoorFt61NNgb07/Xes0iKKFhFjSd1rwSqxxEqhkU7NCOVmjLdmiPG
         CQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425477; x=1764030277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0UP7FJ+3v7dtudpFsNUQFNBayZALtyMMn0oBcAVymM=;
        b=JMYhy5FiiJfaIFGRa0SVKqMVomBqkLUaPG5VjC8OwTyNehXCj+VNSLtG5CbROr7ojR
         CRWHGBSMHIwY9ZeI87PQOFzZkEp/sD3VsYKl/rG1HB9MWLIffajtOKtZLlBeFq0xb4VQ
         RgO/FNwu5yyWIzBXXxaawzU7Jep+OcYend6proEwzBu5ZwiMsOqQz2rCiUXTmZbXUPbh
         JSU/ksOEdSCheE0tFKANoFmj5DdIXG2xhZLkFY39kbRkedi+UkYggKFJSalyR1+GsKgK
         wyL7pnsk08rLubnmLO+YxntMOFnQ5Lr/U0qTvnu8+mRk1Sk29kJvmKoT7DH0G15CDZvf
         ZuFg==
X-Forwarded-Encrypted: i=1; AJvYcCVZeYWNhUgOWs3NE3ej5g3l9Gy1keWYn5HcN8pcNXyHh3qZNDPqNLkqQwPoZTttNPw1GIp1iSDom74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGZZ9yfvApWqrqz6RWiALuGD57+hWIbnywInaZSP14bqDS0GP
	ub2BGWgJz8CYqcgj1lazsaJ02mCl1LStknCj99uTUIfczEexxIpGZmsg
X-Gm-Gg: ASbGncuWUGlubFeWe88xFGqlSkgKHdApeBI5pX1iez5i+2ANhpM6WB+iLUZjrBgHzNi
	8c5RZPqgrdapLuLvp5X2/i//C+Yb7bdhaR7ah7uvugNFKl0up4IFF3s1B7lbc+GS/CdNqjXzdbv
	4LqZ3DlQLKfzi5PpWn8FwQm0fDbNLkby27UHsThyqQ85zVdvRQqyAo5oDvfMEeKcJBvCXomypcW
	VPU0l+0xj9WU34dFxzMH7HB9UNhRX6cm/fPesmjN7DusRuiDQY3svfp1hajF6YyMKFflGyApps8
	dFDdjHknj9pybb3bvzhi0D6B6HbBWuKv4LlXPOEr8HAxeTUSRo7+f1oz99XKu5PmNCLNpWA9SY7
	jUYOyEhiB6nBgKJ2FNXGgsmR45yhrhNm9vwle3f68DXyx5hDW5bQiS7Xfs+PC2tQ/D6YcUFjedw
	zs/yIau485DCYj3RN+ZpGeWY9kPl10wHY=
X-Google-Smtp-Source: AGHT+IF09w2yBxQlT5cuZ8Zztc5mXfSzI+lOaJf05Wl57QjCQS10rQlMLicMrBGLYzfxkfyy4w2WyA==
X-Received: by 2002:a05:690c:6810:b0:786:5f03:2b33 with SMTP id 00721157ae682-78929dff31dmr252313157b3.1.1763425476694;
        Mon, 17 Nov 2025 16:24:36 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:70::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821e5d6d3sm46794597b3.25.2025.11.17.16.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:24:35 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Brett Creeley <brett.creeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Bloch <mbloch@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Manish Chopra <manishc@marvell.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	Vlad Dumitrescu <vdumitrescu@nvidia.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v4 0/6] devlink: net/mlx5: implement swp_l4_csum_mode via devlink params
Date: Mon, 17 Nov 2025 16:24:26 -0800
Message-ID: <20251118002433.332272-1-daniel.zahka@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a new devlink feature for querying param
default values, and resetting params to their default values. This
feature is then used to implement a new mlx5 driver param.

The series starts with two pure refactor patches: one that passes
through the extack to devlink_param::get() implementations. And a
second small refactor that prepares the netlink tlv handling code in
the devlink_param::get() path to better handle default parameter
values.

The third patch introduces the uapi and driver api for default
parameter values. The driver api is opt-in, and both the uapi and
driver api preserve existing behavior when not used by drivers or
older userapace binaries.

The fourth patch introduces the a new mlx5 driver param,
swp_l4_csum_mode, for controlling tx csum behavior. The "l4_only"
value of this param is a dependency for PSP initialization on CX7
NICs.

Lastly, the series introduces a new driver param with cmode runtime to
netdevsim, and then uses this param in a new testcase for netdevsim
devlink params.

Here are some examples of using the default param uapi with the devlink
cli. Note the devlink cli binary I am using has changes which I am
posting in accompanying series targeting iproute2-next:

  # netdevsim
./devlink dev param show netdevsim/netdevsim0
netdevsim/netdevsim0:
  name max_macs type generic
    values:
      cmode driverinit value 32 default 32
  name test1 type driver-specific
    values:
      cmode driverinit value true default true

  # set to false
./devlink dev param set netdevsim/netdevsim0 name test1 value false cmode driverinit
./devlink dev param show netdevsim/netdevsim0
netdevsim/netdevsim0:
  name max_macs type generic
    values:
      cmode driverinit value 32 default 32
  name test1 type driver-specific
    values:
      cmode driverinit value false default true

  # set back to default
./devlink dev param set netdevsim/netdevsim0 name test1 default cmode driverinit
./devlink dev param show netdevsim/netdevsim0
netdevsim/netdevsim0:
  name max_macs type generic
    values:
      cmode driverinit value 32 default 32
  name test1 type driver-specific
    values:
      cmode driverinit value true default true

 # mlx5 params on cx7
./devlink dev param show pci/0000:01:00.0
pci/0000:01:00.0:
  name max_macs type generic
    values:
      cmode driverinit value 128 default 128
...
  name swp_l4_csum_mode type driver-specific
    values:
      cmode permanent value default default default

  # set to l4_only
./devlink dev param set pci/0000:01:00.0 name swp_l4_csum_mode value l4_only cmode permanent
./devlink dev param show pci/0000:01:00.0 name swp_l4_csum_mode
pci/0000:01:00.0:
  name swp_l4_csum_mode type driver-specific
    values:
      cmode permanent value l4_only default default

  # reset to default
./devlink dev param set pci/0000:01:00.0 name swp_l4_csum_mode default cmode permanent
./devlink dev param show pci/0000:01:00.0 name swp_l4_csum_mode
pci/0000:01:00.0:
  name swp_l4_csum_mode type driver-specific
    values:
      cmode permanent value default default default

CHANGES:
v4:
  - add test case for default params.
  - add new cmode runtime test param to netdevsim.
  - introduce uapi and driver api for supporting default param values.
  - rename device_default to default in mlx5 patch.
v3: https://lore.kernel.org/netdev/20251107204347.4060542-1-daniel.zahka@gmail.com/
  - fix warnings about undocumented param in intel ice driver
v2: https://lore.kernel.org/netdev/20251103194554.3203178-1-daniel.zahka@gmail.com/
  - fix indentation issue in new mlx5.rst entry
  - use extack in mlx5_nv_param_devlink_swp_l4_csum_mode_get()
  - introduce extack patch.
v1: https://lore.kernel.org/netdev/20251022190932.1073898-1-daniel.zahka@gmail.com/

Daniel Zahka (6):
  devlink: pass extack through to devlink_param::get()
  devlink: refactor devlink_nl_param_value_fill_one()
  devlink: support default values for param-get and param-set
  net/mlx5: implement swp_l4_csum_mode via devlink params
  netdevsim: register a new devlink param with default value interface
  selftest: netdevsim: test devlink default params

 Documentation/netlink/specs/devlink.yaml      |   9 +
 .../networking/devlink/devlink-params.rst     |  10 +
 Documentation/networking/devlink/mlx5.rst     |  14 ++
 .../marvell/octeontx2/otx2_cpt_devlink.c      |   6 +-
 drivers/net/ethernet/amd/pds_core/core.h      |   3 +-
 drivers/net/ethernet/amd/pds_core/devlink.c   |   3 +-
 .../net/ethernet/broadcom/bnxt/bnxt_devlink.c |   6 +-
 .../net/ethernet/intel/i40e/i40e_devlink.c    |   3 +-
 .../net/ethernet/intel/ice/devlink/devlink.c  |  14 +-
 .../marvell/octeontx2/af/rvu_devlink.c        |  15 +-
 .../marvell/octeontx2/nic/otx2_devlink.c      |   6 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   6 +-
 .../net/ethernet/mellanox/mlx5/core/devlink.h |   3 +-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c |   3 +-
 .../mellanox/mlx5/core/eswitch_offloads.c     |   3 +-
 .../net/ethernet/mellanox/mlx5/core/fs_core.c |   3 +-
 .../ethernet/mellanox/mlx5/core/fw_reset.c    |   3 +-
 .../mellanox/mlx5/core/lib/nv_param.c         | 238 +++++++++++++++++-
 .../mellanox/mlxsw/spectrum_acl_tcam.c        |   3 +-
 .../ethernet/netronome/nfp/devlink_param.c    |   3 +-
 drivers/net/ethernet/qlogic/qed/qed_devlink.c |   3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |   3 +-
 drivers/net/ethernet/ti/cpsw_new.c            |   6 +-
 drivers/net/netdevsim/dev.c                   |  55 ++++
 drivers/net/netdevsim/netdevsim.h             |   1 +
 drivers/net/wwan/iosm/iosm_ipc_devlink.c      |   3 +-
 include/net/devlink.h                         |  45 +++-
 include/net/dsa.h                             |   3 +-
 include/uapi/linux/devlink.h                  |   3 +
 net/devlink/netlink_gen.c                     |   5 +-
 net/devlink/param.c                           | 180 +++++++++----
 net/dsa/devlink.c                             |   3 +-
 .../drivers/net/netdevsim/devlink.sh          | 113 ++++++++-
 34 files changed, 689 insertions(+), 91 deletions(-)

-- 
2.47.3

