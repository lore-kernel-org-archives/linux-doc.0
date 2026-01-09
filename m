Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83535BDCD
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964867; cv=none; b=u+B7xO83kh6Cz9NdCbLiy/dMz05XqvzADbzxru5suvMV812RhETuwdcpYA/JVcNyJu/9n3hNfupo+KwXrYhM819liOGeXvx1pqZyGiLFTrKcUyVAGKodDizw3USq7m3/WZKAdgayeOI1cGUX17U3cayXhb9mAjOh4QgRTd0ZoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964867; c=relaxed/simple;
	bh=ME5RwYYeXnXNLbQ/Bkl/rSm+h34n/XlbEQhFl4FNSPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwCgI6b8d1E34e0/UuvTcU10u4C2vncYhNv3jT22ivlGSDA76y2uLY5pjQO4y+NSA/yVlF9NhE0BHdkjVg6uniITj1/C0hbePeKsiStVQQ6HxIO3oi1fVY2h37KToTlCMGurc5V/WXW2QwmIZf5F/FjeoxukxCf0m7lWyiQebRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xqb5jup0; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xqb5jup0"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso6466782a12.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 05:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767964864; x=1768569664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQi3F9taD578uKhb5WeGr8+LqFJi+cgMU9mJCgFH+JI=;
        b=Xqb5jup0yqzKUCkbZD5ivhWWcgn0DRemuV+ndnsCpHKbqAp/OZyeigmZI0AwNpZudm
         snPrebGNTCf1mAUByZpuXlg80beUx841vxvDJQHTM/mz67/bCNV0keDbubtmiAPKN5qT
         k7AV8N1qR3/2gYXKMbxRpRbi8DChHAmv79M7IiuXUwRjQjrk7SLZGEKvuhgjfTkIjPM4
         APNFPTnfH3GPSwQZOTULp8gu7rYqg3a1AI2E/4t5vNuExr7H990X5sHR1xlI6Yoo8mQY
         2YirV5iN1RLMMJa3sAwe3vYWG+FCOHqP9pRJj468SOoHj/xKmoS4hpTIEkHLaxSuWoki
         wtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964864; x=1768569664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQi3F9taD578uKhb5WeGr8+LqFJi+cgMU9mJCgFH+JI=;
        b=l0iRyAPgq5K1rCuw7FvaoYsodCr2HEFojQvFFDi0UU/9j9fHKsIV53RbfCsNS65OuJ
         7HElR7b2yBMriBaxkOiGg0K2aHdCwEpcPyOT59z1K1780n0csL/pjXRisDXkbggVkVGJ
         7CZ3TrMM4d1nKZHRMkLjctBN91J6LJvPTs4GZd5lOVSVOs8VQ9gq9lEUP+M8NDIfuHgS
         oonRCCBkDc+5KRstSXiBbOlMKOrW3NudPXWr6QAXx0j6FaJOK57pFu6tzNa1S5pWQGqL
         oCMb0urXNk1IX17iUDevwcPppPv/ZzSMX9qFH8HkfHWK0198TUo5OuWQfuB4Oti/jqFv
         6upw==
X-Forwarded-Encrypted: i=1; AJvYcCUZSA3Sd/4IoLxXtn+bihOstYblU1k6iydysUIAid/mnS7ffRFlt4okwjrcaaejzNSMHcF11rjLgAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrv3pVGRBkwH06jll0uai0XAY2RSgZJJSy/aJxy4uPC18k+cIB
	9HQMA6u/nW8EYqSI74RZbcwd0Obao8VJQSffmCd2iSMvLVgQDSBzb00n+w841g==
X-Gm-Gg: AY/fxX6lvQMfwgG2M2+0aqdvgSDIcPrM6XBxceuFdmR51XHBvclhd9eTpGzSpPzekxd
	GjgjvrX8FomDPCfQ/49iC8qpUFA0exZJXYME3Jml8rBSPK3s8fag735wt7klWZGDhWuuhi3Jbu8
	3xl5uSF2gcr9LYVyKxwhZ/w7i3QOCEyo+NtszYsm1YW3nySdZf/IFqQOQQCF/CtZwWZK4kz1w8Z
	6lkSUpR2ADqdh4U3+OyvHkQrGDwjWENTmpphGH4A0cE6uUXDoz0cLYZIpdUD/mXYS3UQ+wObWMx
	R9kOpiV8BTZMWRN0lNq2YZj3uA9w0jKtXC/Z2GZ2AII0D1C6LcwfpdFvoHcWON4DTV1uQeQMFB6
	SZsby1lnRmqi9Ll9VKImza34GoWVGzHBO3SV8XAKAFZB43QbWZ3ukJeKCeTy1++CmTW9FBOA/Ak
	MhIcTBLRq9krXgUGGR7g7wNKmJIzQ79l5yKuTOW7VJkO4I+ZGRHnaayDUSO7lka1yqZxFQUNuD1
	8kej/Dn
X-Google-Smtp-Source: AGHT+IHEu00dTqymHYnWX3YB9+V+M0g0pVj0f65C6gXQXrOLC70cW7LkbUbrjcu3dFBefYWTWksRNQ==
X-Received: by 2002:a05:600c:4fc6:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d84b0a902mr94022565e9.5.1767958133975;
        Fri, 09 Jan 2026 03:28:53 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:69b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm60056985e9.0.2026.01.09.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:28:52 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Tim Hostetler <thostet@google.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	John Fraker <jfraker@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Joe Damato <joe@dama.to>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>,
	Yue Haibing <yuehaibing@huawei.com>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	dtatulea@nvidia.com,
	io-uring@vger.kernel.org
Subject: [PATCH net-next v8 0/9] Add support for providers with large rx buffer
Date: Fri,  9 Jan 2026 11:28:39 +0000
Message-ID: <cover.1767819709.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: it's net/ only bits and doesn't include changes, which shoulf be
merged separately and are posted separately. The full branch for
convenience is at [1], and the patch is here:

https://lore.kernel.org/io-uring/7486ab32e99be1f614b3ef8d0e9bc77015b173f7.1764265323.git.asml.silence@gmail.com

Many modern NICs support configurable receive buffer lengths, and zcrx and
memory providers can use buffers larger than 4K to improve performance. When
paired with hw-gro larger rx buffer sizes can drastically reduce the number
of buffers traversing the stack and save a lot of processing time. It also
allows to give to users larger contiguous chunks of data. The idea was first
floated around by Saeed during netdev conf 2024 and was asked about by a few
folks.

Single stream benchmarks showed up to ~30% CPU util improvement.
E.g. comparison for 4K vs 32K buffers using a 200Gbit NIC:

packets=23987040 (MB=2745098), rps=199559 (MB/s=22837)
CPU    %usr   %nice    %sys %iowait    %irq   %soft   %idle
  0    1.53    0.00   27.78    2.72    1.31   66.45    0.22
packets=24078368 (MB=2755550), rps=200319 (MB/s=22924)
CPU    %usr   %nice    %sys %iowait    %irq   %soft   %idle
  0    0.69    0.00    8.26   31.65    1.83   57.00    0.57

This series adds net infrastructure for memory providers configuring
the size and implements it for bnxt. It's an opt-in feature for drivers,
they should advertise support for the parameter in the qops and must check
if the hardware supports the given size. It's limited to memory providers
as it drastically simplifies implementation. It doesn't affect the fast
path zcrx uAPI, and the user exposed parameter is defined in zcrx terms,
which allows it to be flexible and adjusted in the future.

A liburing example can be found at [2]

full branch:
[1] https://github.com/isilence/linux.git zcrx/large-buffers-v8
Liburing example:
[2] https://github.com/isilence/liburing.git zcrx/rx-buf-len

---

The following changes since commit 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb:

  Linux 6.19-rc4 (2026-01-04 14:41:55 -0800)

are available in the Git repository at:

  https://github.com/isilence/linux.git tags/net-queue-rx-buf-len-v8

for you to fetch changes up to 37f5abe6929963fc6086777056b59ecb034d0e19:

  io_uring/zcrx: document area chunking parameter (2026-01-08 11:35:20 +0000)


v8: - Add stripped down qcfg
    - Retain the page size across resets for bnxt

v7: - Add xa_destroy
    - Rebase

v6: - Update docs and add a selftest

v5: https://lore.kernel.org/netdev/cover.1760440268.git.asml.silence@gmail.com/
    - Remove all unnecessary bits like configuration via netlink, and
      multi-stage queue configuration.

v4: https://lore.kernel.org/all/cover.1760364551.git.asml.silence@gmail.com/
    - Update fbnic qops
    - Propagate max buf len for hns3
    - Use configured buf size in __bnxt_alloc_rx_netmem
    - Minor stylistic changes
v3: https://lore.kernel.org/all/cover.1755499375.git.asml.silence@gmail.com/
    - Rebased, excluded zcrx specific patches
    - Set agg_size_fac to 1 on warning
v2: https://lore.kernel.org/all/cover.1754657711.git.asml.silence@gmail.com/
    - Add MAX_PAGE_ORDER check on pp init
    - Applied comments rewording
    - Adjust pp.max_len based on order
    - Patch up mlx5 queue callbacks after rebase
    - Minor ->queue_mgmt_ops refactoring
    - Rebased to account for both fill level and agg_size_fac
    - Pass providers buf length in struct pp_memory_provider_params and
      apply it in __netdev_queue_confi().
    - Use ->supported_ring_params to validate drivers support of set
      qcfg parameters.

Jakub Kicinski (2):
  net: reduce indent of struct netdev_queue_mgmt_ops members
  eth: bnxt: adjust the fill level of agg queues with larger buffers

Pavel Begunkov (7):
  net: memzero mp params when closing a queue
  net: add bare bone queue configs
  net: pass queue rx page size from memory provider
  eth: bnxt: store rx buffer size per queue
  eth: bnxt: support qcfg provided rx page size
  selftests: iou-zcrx: test large chunk sizes
  io_uring/zcrx: document area chunking parameter

 Documentation/networking/iou-zcrx.rst         |  20 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 126 ++++++++++++++----
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |   2 +
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c |   6 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h |   2 +-
 drivers/net/ethernet/google/gve/gve_main.c    |   9 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  10 +-
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  |   8 +-
 drivers/net/netdevsim/netdev.c                |   7 +-
 include/net/netdev_queues.h                   |  47 +++++--
 include/net/netdev_rx_queue.h                 |   2 +
 include/net/page_pool/types.h                 |   1 +
 net/core/dev.c                                |  17 +++
 net/core/netdev_rx_queue.c                    |  31 +++--
 .../selftests/drivers/net/hw/iou-zcrx.c       |  72 ++++++++--
 .../selftests/drivers/net/hw/iou-zcrx.py      |  37 +++++
 16 files changed, 318 insertions(+), 79 deletions(-)

-- 
2.52.0

