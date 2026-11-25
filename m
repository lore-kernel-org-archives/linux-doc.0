Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620918;
	b=5Qwi2Q/AvWE91a0ItRFGnMXLXhWq3vKee0vnpn0p6jrHTIBMhIT1c8Wid+28ZGi5GLme
	 8vGoCQcJoLpvQ9jzTrcvJnPVFKAnzrLLpPqXfYGzcQnjCD8Rx9jmPgn7j5m9qhRfCovPu
	 r7Na9nD5vi4mpAoCov9ckZA+P7SzsNo2zWiok2MG+p1cSwJTFo+dTSSWPrRHJE93pLsWx
	 Bebezz0XdimcKQr9ZB1vj+vAXhCx3fru3cN7OxUbwpyFxGzi5NtU1wR/XriGKxRK3U7gL
	 Yi/b960+0ux9pQNs4D1RQUxyydwh+HMX/HUeCmAo67ewU4FPxrBeYTjME+vc2h6zdFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=heq3AsQ6ua66ixuTUqAY8bU1AMYg/OwxMrZJKDM3k1U=;
	b=dVpEc2sssBf8QPwZqwMLf4CoyQPcdwEJ2dnWMt37HheKxPQVNvFn+/M8cW4Ij5abGHOz
	 aucyPZgIanlozqZ3HdnHnh7qIfIRPFLBTNUG/TrfAEves3YRDPmtG/bU37UJX/SwiK0qy
	 LQgGIpi4jkyPpQsPeGxqCFqvV2PKLsX+49wf0TxGdRW4w30hsoLm5xGVxlNXRbr5npmOj
	 CzgLTjwhXPgNl2VUn5hg6IpmrHDFBtcF/4E1sped8WKxfXHWZKptRQGSUIvcuVkfbaJ6i
	 uHU931tmP3LLWvHeX7346Opviov16ir80evNcMTfMfkxVDFrWlODJ15N8o5xr6HJYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=j6CsXjPw;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FC606A327
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 555FC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=j6CsXjPw
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4131378f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620916; x=1796225716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heq3AsQ6ua66ixuTUqAY8bU1AMYg/OwxMrZJKDM3k1U=;
        b=j6CsXjPwKBhn0D3F+YEhUqN6H+QvRV6IL5tmgWNCi5Ko0wIcE99byUo1c7gXZb7VTK
         xk4VlZd67fJFhBVV/0yhdCGiIpT/xTv73QEeqGvVMa77Oi3ecuUMxU2Zpb0SH0L8+GfG
         DNPAnSnr9FeW6DaLpMH95dWYzrqqgkpi5apH/uEhFhhLGnXpmWApA4Yev7zoCXv4sVOt
         KoXFGgyS2KPDox85F+hO+FK9fyerkgOgLBLnTbFzbMzRv+omWwFggp8OcRavql6gIiep
         vnCJ9UbUY1LpuI2aBKostHXXA4IonGlqK2Uy0JKgddDoKxN5OmIMwCktz8qn/ayXPcXQ
         tsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620916; x=1796225716;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heq3AsQ6ua66ixuTUqAY8bU1AMYg/OwxMrZJKDM3k1U=;
        b=fQCT6KiJy/pXVJEc85NcY9zw3GaMNpKcxXxhmaY5TmMRZ6IMMQjZzz7LtErHZYKAhI
         FJhsgnRWmEx8QrOS9c0sjAbC3Ds1oIk87/7oirACVKujVgGqPsUj4shd+4BMD5fqWTAV
         GHkL7jsvzpBez6kZ+K9Iv3gpVW0guu6CF247Mtrxjd/HBfHWDAxnUVGCl2plqvtqKHT3
         tcoH1oozQtqwhHUkLmrySMqBop1BrISvUiHz60cd9VsufsfPZWXr1+F555SUkwNJM0zE
         0KrC/pfjkZNsGkTRJxj0TWitcTKDXfPnW6H2fe1mDFFb56z6EtCavtvJXNGuXMMCPg4y
         Fikw==
X-Forwarded-Encrypted: i=1; AL+hErHTLhj5W5vG4+lyZQFNbqnOnnkMzJT42HxupQQJSprSSprKIhLBKHcqWo4DNTWFVEPm0JH4ucmzXQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iTX4tqJESNKZ+9gkoniwTa+LQNiSNKOuWpia84J5u3jmoVW6w
	6ZySMV0gV4VnhbNzJN53qRS/dd1bDkjqIa4W9DUJvR6eg37dRipSg2z9xkmKNc06PZs=
X-Gm-Gg: AZFdTZf7eu9PFaXhpVAIogjNNa6BYU1f5mOeR71GW0mkXHCNPQLUIJRm5GWCOFUrF+D
	fox7Nf5PhpR5pHG2xgt2juvrGIZdgOt3cRrM4W+Q3NWYUb3A3680haJixgxQmkovxA19GcXPb9c
	0nb4O6P/gZpXDYBxtEFgmFFIVT/GLc+7g2x8JgM5vwA4W/lUtY7sxcdMrmddmwaDlcxnXg8UQZl
	YCt70FKNasgZ3MruqOTtJifcaE3q7LWeLam5uUidf+ctkh4bExS8lg3kuxseCI8ZyKuAeyALnbf
	/iFcxmJx47PHpUrHixVyYtGaNkYHGZ3LjvRhBb8sWnGKXgyhl2zcNav3PPi9fVT569lvbh7bnog
	vnQf6sA1nQ47yQ+llEbp357YCKxgwuHo1mOLPJCjgTb7X3/f60mRvAcBadu7B2Dcc7zw+PRm1ts
	gIIiCTTEZiLQt7uHtA7lKvSX0mMbsrqO4dRgsCD7hLyaDg0/f7XubwoEO6c6xzE9WUgI+sd6YOO
	jaUAY98pxDdaGseKWN/PIS4R8IQjttk/Wf9avKlxo0HPBlTon2jgH55BvKIcPMxrZ0EtEBnLUc2
	bpr1AzxJUI8qzVpDUvvKs4d6SOV0DWkNH9Uk+kKfwG8C3iGBUKiqmXfHxYxSq51W/Eo12aUI07a
	Zd3xDe5cr9cAx85nHF4Y=
X-Received: by 2002:a05:6000:2489:b0:4a5:8f40:a644 with SMTP id ffacd0b85a97d-4abb1baa9eamr37631802f8f.9.1795620915562;
        Wed, 25 Nov 2026 07:35:15 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:15 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH v4 00/21] drbd: DRBD 9 rework
Date: Wed, 25 Nov 2026 16:34:50 +0100
Message-ID: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed (context: [0]), here is our DRBD 9 rework series, intended
for linux-next via for-7.x/drbd.

This replays about 10-15 years of active out-of-tree development work
[1], depending on your way of counting. The out-of-tree module has
severely diverged from the in-tree version over the years, which is
what we are aiming to fix now.

Hopefully that somewhat excuses (or at least explains) the massive
diffs -- we've tried to come up with a way to group the changes by
topic, but I realize it's still not exactly trivial to review.

We've been polishing this series for a while now, and we have taken
great care to make it as "upstream-presentable" as possible. That said,
there are still probably imperfections. It's a start -- feedback
welcome!

The netlink interface has been reworked so that userspace is not
broken: the existing "drbd" generic netlink family keeps being served
at version 1, and this series does not touch its generated
serialization or its UAPI header.
Every shipped drbd-utils release therefore keeps working against this
driver. DRBD 9's own utilities speak a new family, "drbd2", written as
a YNL specification under Documentation/netlink/specs/ and following
current genetlink conventions; its generated code is checked in as
usual. The driver registers both families and translates each onto the
same wire-neutral core, so the multi-peer administration model is only
reachable through drbd2, while version-1 clients see the single-peer
semantics they expect.

The RDMA and load-balancing TCP (lb-tcp) transports are not part of
this series; they will be submitted separately once they have had the
same treatment. The rdma_ctrl_rcvbuf_size
and rdma_ctrl_sndbuf_size net options do remain in the UAPI: they are
generic transport options that are interpreted by whichever transport is
in use, so there is no reason to remove and later re-add them.

The base for these patches is for-7.5/block, which has the preparation
patches [2] this series builds on.

As discussed, the goal is to get this applied to a for-7.x/drbd branch
so it can land in linux-next via block-next. After letting it mature
in linux-next for a while, it should go in via the block tree.

Thanks,
Christoph

[0] https://lore.kernel.org/linux-next/899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk/
[1] https://github.com/LINBIT/drbd
[2] https://lore.kernel.org/linux-block/20260923140608.1116713-1-christoph.boehmwalder@linbit.com/
[3] https://lore.kernel.org/linux-block/20261111083505.3998706-1-christoph.boehmwalder@linbit.com/

v3: https://lore.kernel.org/linux-block/20261110162646.3028472-1-christoph.boehmwalder@linbit.com/
v2: https://lore.kernel.org/linux-block/20261006154607.3936501-1-christoph.boehmwalder@linbit.com/

Changes since v3:
- Fixed the problems that the kernel test robot and the sashiko review
  found in v3 in code that is new with this series, mostly in the
  version-1 netlink compatibility layer and the drbd2 family: among
  others, string attributes longer than their buffer, the 8.4 peer slot
  and history UUIDs in 8.4 meta-data, the peer commands before the
  first connect, the resource-name filter of the drbd2 resource dump,
  and the notification error paths
- Fixed the link failures with NET_HANDSHAKE=n and with BLK_DEV_DRBD=y
  and DEV_DAX_PMEM=m: TLS for the TCP transport is now its own option,
  BLK_DEV_DRBD_TCP_TLS, which a new patch allows to enable
  NET_HANDSHAKE; the DAX meta-data code now depends on FS_DAX instead
  of the device-dax driver
- The link failure with CRYPTO=n is in the current in-tree DRBD as
  well; it is fixed by a separate patch [3]. This series applies with
  and without it
- Dropped drbd_transport_template.c, which did not compile and was not
  built
- Removed the userspace branches of the #ifdef __KERNEL__ blocks in
  the protocol and meta-data headers
- Fixed kernel-doc warnings
- Synced with the current out-of-tree state

Changes since v2:
- Rebased onto for-7.5/block, now that the preparation patches are
  applied there; v2 no longer applied
- Kept the in-tree DRBD changes that went into v7.4: the explicit
  linux/umh.h include and the conversion to sk_set_nospace()
- Synced with the current out-of-tree state


Christoph Böhmwalder (21):
  drbd: mark as BROKEN during DRBD 9 rework
  drbd: extend wire protocol definitions for DRBD 9
  drbd: introduce DRBD 9 on-disk metadata format
  drbd: add transport layer abstraction
  drbd: add TCP transport implementation
  net/handshake: allow the DRBD TCP transport to enable NET_HANDSHAKE
  drbd: add DAX/PMEM support for metadata access
  drbd: add optional compatibility layer for DRBD 8.4
  drbd: add application/resync IO synchronization documentation
  drbd: rework sender for DRBD 9 multi-peer
  drbd: replace per-device state model with multi-peer data structures
  drbd: rewrite state machine for DRBD 9 multi-peer clusters
  drbd: rework activity log and bitmap for multi-peer replication
  drbd: rework request processing for DRBD 9 multi-peer IO
  drbd: rework module core for DRBD 9 transport and multi-peer
  drbd: rework receiver for DRBD 9 transport and multi-peer protocol
  drbd: rework the netlink core for DRBD 9
  drbd: serve the "drbd" genl family at version 1 for existing userspace
  drbd: add the "drbd2" genl family
  drbd: update monitoring interfaces for multi-peer topology
  drbd: remove BROKEN for DRBD

 .../application-resync-synchronization.rst    |   208 +
 .../admin-guide/blockdev/drbd/index.rst       |     1 +
 Documentation/netlink/specs/drbd2.yaml        |  2615 +++
 drivers/block/drbd/Kconfig                    |    63 +
 drivers/block/drbd/Makefile                   |     9 +-
 drivers/block/drbd/drbd2_nl_gen.c             |   815 +
 drivers/block/drbd/drbd2_nl_gen.h             |   114 +
 drivers/block/drbd/drbd_actlog.c              |  1419 +-
 drivers/block/drbd/drbd_bitmap.c              |  2075 +-
 drivers/block/drbd/drbd_config.h              |    46 +-
 drivers/block/drbd/drbd_dax_pmem.c            |   175 +
 drivers/block/drbd/drbd_dax_pmem.h            |    43 +
 drivers/block/drbd/drbd_debugfs.c             |  1760 +-
 drivers/block/drbd/drbd_debugfs.h             |     2 +
 drivers/block/drbd/drbd_int.h                 |  4041 ++--
 drivers/block/drbd/drbd_interval.c            |    39 +-
 drivers/block/drbd/drbd_interval.h            |   130 +-
 drivers/block/drbd/drbd_legacy_84.c           |   651 +
 drivers/block/drbd/drbd_legacy_84.h           |   129 +
 drivers/block/drbd/drbd_main.c                |  7032 +++++--
 drivers/block/drbd/drbd_meta_data.h           |   163 +
 drivers/block/drbd/drbd_nl.c                  | 10355 ++++++---
 drivers/block/drbd/drbd_nl.h                  |   416 +
 drivers/block/drbd/drbd_nl_84.c               |  4048 ++++
 drivers/block/drbd/drbd_nl_defaults.c         |   168 +
 drivers/block/drbd/drbd_nl_drbd2.c            |  2669 +++
 drivers/block/drbd/drbd_nl_types.h            |   406 +
 drivers/block/drbd/drbd_polymorph_printk.h    |    42 +-
 drivers/block/drbd/drbd_proc.c                |   327 +-
 drivers/block/drbd/drbd_protocol.h            |   620 +-
 drivers/block/drbd/drbd_receiver.c            | 17563 ++++++++++++----
 drivers/block/drbd/drbd_req.c                 |  3208 ++-
 drivers/block/drbd/drbd_req.h                 |   332 +-
 drivers/block/drbd/drbd_sender.c              |  4565 ++--
 drivers/block/drbd/drbd_state.c               |  9242 ++++++--
 drivers/block/drbd/drbd_state.h               |   334 +-
 drivers/block/drbd/drbd_state_change.h        |    80 +-
 drivers/block/drbd/drbd_strings.c             |   103 +-
 drivers/block/drbd/drbd_strings.h             |     4 +-
 drivers/block/drbd/drbd_transport.c           |   550 +
 drivers/block/drbd/drbd_transport.h           |   516 +
 drivers/block/drbd/drbd_transport_tcp.c       |  1828 ++
 include/uapi/linux/drbd.h                     |   305 +-
 include/uapi/linux/drbd2.h                    |  1046 +
 include/uapi/linux/drbd_limits.h              |   138 +-
 net/Kconfig                                   |     2 +-
 46 files changed, 63195 insertions(+), 17202 deletions(-)
 create mode 100644 Documentation/admin-guide/blockdev/drbd/application-resync-synchronization.rst
 create mode 100644 Documentation/netlink/specs/drbd2.yaml
 create mode 100644 drivers/block/drbd/drbd2_nl_gen.c
 create mode 100644 drivers/block/drbd/drbd2_nl_gen.h
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.c
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.h
 create mode 100644 drivers/block/drbd/drbd_legacy_84.c
 create mode 100644 drivers/block/drbd/drbd_legacy_84.h
 create mode 100644 drivers/block/drbd/drbd_meta_data.h
 create mode 100644 drivers/block/drbd/drbd_nl.h
 create mode 100644 drivers/block/drbd/drbd_nl_84.c
 create mode 100644 drivers/block/drbd/drbd_nl_defaults.c
 create mode 100644 drivers/block/drbd/drbd_nl_drbd2.c
 create mode 100644 drivers/block/drbd/drbd_nl_types.h
 create mode 100644 drivers/block/drbd/drbd_transport.c
 create mode 100644 drivers/block/drbd/drbd_transport.h
 create mode 100644 drivers/block/drbd/drbd_transport_tcp.c
 create mode 100644 include/uapi/linux/drbd2.h


base-commit: aa7014f8d7565cfea117eac36a5de0a05eba65a4
-- 
2.56.0

