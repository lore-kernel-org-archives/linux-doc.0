Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F884766B3
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200756; cv=none; b=XL5E4wgJ7IDW1mWZelDDSM6SkRi8AEm+fWrMv0konERUEmCrvhwwjW8hq+cFpcjSJsW0N6hqPVjDxC5GfCypNpaBILSO7ouJvJQtTQ4ALGd9XFMITXobLEzl6FF5n1pvPWL0fx9ZkZC53BOo+bcQh56z+JjxyS/Asq0+pKONu18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200756; c=relaxed/simple;
	bh=8RGeXtjXxObOBlh27DtryI+xEEeTDaHvX+2W2+vTgIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snyAtl8HidbzZfujbfO4jWsBWNkILJ7HJvr8D7s+u/DYIrzvOntN+RaG3GJRueA+pBEGIK9LlK4G6FdZgE2e0p26//4+pmxjbsccrm/RtiSgV5xTRNpzsZ4j9F9238fr7Y8vxwui5csFBZPDrDjmKPsLbJXsyLaU2/giQTCfqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVaHzNiK; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVaHzNiK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ba73bee8so1216327a12.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790200753; x=1790805553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=25b6rXxcvDVFluQ29z+eb44YMWbVsajT92YPOJsFwDw=;
        b=OVaHzNiKBqx/cr/Ll3JDJZ7dYL3Fn+7fMw4pizbJCd9e3P40Sj0XPMLtiS8YLUCxsf
         /9+X3fr5DoXx8vCjvQSK/L3M10gdbQe+dnXTCyNDIOxmnvfPBnpVLKmJSLuly1qDNlcl
         o1mZJav7Fm6NxxbCDbOVPWIaWv/P1sFvsLlEAayLut3ZyWi6kpWFaRWCCSh7FqaVcJum
         lihbTEfqe/g265nj6v38zxEuHNz7LLuTvES2CpLeo4JDKx+yc1r0U2hQA7aPdXsiruDA
         p05nESDNvkzAHiLJoo4I0m6ZxSl9YAAfDXfDexdWg2pyWkKCDHsmPZTTrGC7Jd2XxOsL
         1uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200753; x=1790805553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25b6rXxcvDVFluQ29z+eb44YMWbVsajT92YPOJsFwDw=;
        b=fxamKUmbpwh2uyubltTri8HhihxSBJYQnGZFrPlqdVQaMlDvyn4I09YWaEZAy8T65n
         fpp4rZC1xJd26OsAeCObCqM5Q2PV6pS18JL7/NXIPD/PlhfXn+0JHoFXSNF8m/8GmGsL
         grWhZTpokpR0IHK6V/Jeo5wqUUn2kA9UHVI+HxM3eAlGBeN9WohCGXj6G/xPzWHrhRP0
         KgfHuUxX8A/pgmBlhB7ENmZzEn5u5u1t0kL2pfiFoaGh7zsKHblRe2SfhiNa1D8yvkLq
         2XkhE6PjbYJaAj++INWMldQLUmXpB8402V5nwPm1oIyRmIEJ/Sf89KJVv8Ibrq5doURk
         hDIA==
X-Forwarded-Encrypted: i=1; AKwUvByn3NoXbig4mB+NLEahiu6Dk3C4vxvwUY5vO88RB/OmYpZnLl7whFa7o4JAvvOZR9yQx5RmdNU8NvU=@vger.kernel.org
X-Gm-Message-State: AFuF++lCsd09XY+EYhyST5JJsCkOzd8yB+7+MR1i1Mq6q222K3MF1+zC
	VxXWgoCq2Bx5DJ2axnSmNojxiR/r4YXG0No5/pcRSA/7tCu7Hm1yWvoF
X-Gm-Gg: AYBFou1bceiu2HQNAOTZmAm6c4xro2Yk7XQZhda0GKC7x3HDXSVTBUbpLLtwNgEutpO
	dC/zhuI/ZB+rJEvJeMhDr4U//ZP29G6GJxAqMMl6Ou2CpBdKr5xuJLw4DEteViXtI7ctrf4sGV5
	pGr9ftRy4LhZrdznVBAgrsvqkJVEBp19es1Uv9EoXZrdEWGcOUd9Aw7naQeRGql0HtI2nVKa0m4
	0yrUgEj0Im2Zie+KZ3I6fxvCmeqf4srPwegjbEPGn6gi8HfjJNsJIFuSl/+y3JTT9P2A+Sgh9U4
	izo+HWukQBzj1+IBfkpTkzPoaTVz/tCLI33rUNNvLwF0V7BzZvBGqP8O8I0H+IPCy0kplZZKOHH
	ZZbgRwxJAxLHmVrlPNM5OML0puMTyL1SdnXlP1TwP41n8mutwxDyb5i0vRGbphat3dR+iyVEv+m
	G5ZlZlsSlDhfoVavpjHDMU5J/ustGOUxvlYrANR+MGtv0w1Ku8aUNkZ6A2vhXk6yf6V1I4yprC8
	yN+c2YCq63bRP59YOYwwgDCMDNDNrjb4w7DNAltICEYdM+PV7lh+7qu1eyTUJiQ/1YDAJuxus8i
	vnuoRroIujcGxu4JMUtd
X-Received: by 2002:a17:907:6a11:b0:c25:f7db:4beb with SMTP id a640c23a62f3a-c2ac236053emr38359966b.17.1790200753378;
        Wed, 23 Sep 2026 14:59:13 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-25.cust.bredband2.com. [83.233.130.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm197647666b.61.2026.09.23.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:59:12 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [RFC PATCH net-next v3 0/5] net: dsa: qca8k: add a QCA8337 CPU PHY consumer
Date: Wed, 23 Sep 2026 23:58:52 +0200
Message-ID: <20260923215858.1653-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qca83xx PHY driver is already in net-next. This series allows
passing PHY flags on DSA shared ports and adds support for a QCA8337
internal CPU PHY. It implements CPU port selection, serializes MAC state
across global MTU updates, and proposes disabling SmartSpeed prior to
CPU PHY resets.

The first patch extends the DSA core interface; the qca8k patches
provide its concrete user. No board-name matching or board-specific DT
properties are introduced.

The minimal topology uses a single CPU link: a conduit PHY connects over
MDI to QCA8337 PHY4 on switch port 5, with each endpoint having its own
phy-handle. A reduced devicetree fixture based on Redmi AX5400 wiring
passed dtc and validation against the complete net-next schema set. This
is a binding fixture rather than a bootable board description. Because
the pinned base tree lacks the IPQ5018 Ethernet MAC driver and RA74
board support, this series has not been boot-tested on RA74 under pure
net-next.

On one RA74 board, diagnostic boot logs showed PHY4 advertising
1000BASE-T full duplex after generic config_aneg() succeeded, but a
later read found the advertisement missing. No intervening write was
found through the instrumented Clause 22 BMCR/CTRL1000 path; other paths
were not excluded. The exact trigger remains unknown. Clearing
SmartSpeed before the initial reset preserved the 1 Gb/s internal link
during the tested boot sequence. Runtime testing did not establish
late-peer causality, a broken pair, or successful fallback to 100 Mb/s.

Two scope questions remain for this RFC:

1. Internal CPU port selection currently falls back to ports 1 through 5
   only on QCA8337. Dedicated ports 0 and 6 retain priority on all
   models, including mixed CPU port descriptions. AR8327 documentation
   describes per-port headers and destination bitmaps, but I have not
   established its internal CPU link behavior. Should this fallback
   remain limited to QCA8337, or can maintainers confirm the same support
   for QCA8327?

2. The proposed SmartSpeed policy applies to QCA8337 internal CPU PHYs.
   SmartSpeed is the hardware downshift feature, so disabling it removes
   that fallback behavior. Current hardware evidence is limited to PHY4
   on a single RA74 board. Is the internal CPU link role sufficient
   justification for this policy, or should the quirk be scoped more
   narrowly?

Changes since v2:
- Patch 2 uses reg_mutex across the MTU pause, frame-size write, and
  state restoration. Variable declarations now follow reverse
  Christmas-tree order. This patch precedes topology support so MTU
  protection is in place when internal CPU ports become available.
- Patch 3 adds internal CPU port fallback while retaining port 0 and 6
  priority, leaving QCA8327 support as an explicit RFC question.
- Patch 4 masks the revision before setting the CPU PHY flag, clarifies
  SmartSpeed downshift behavior, and drops the delayed-conduit causal
  claim.
- Patch 5 clarifies reset and config_aneg ordering along with hardware
  evidence limits, keeping generic config_aneg.

This series depends on the separate net patch "net: dsa: qca8k:
propagate MDIO errors":
https://lore.kernel.org/netdev/20260923215748.1336-1-yongzhao.derek@gmail.com/

Testing:
Fault injection against the actual MDIO/PHY functions and kernel polling
macros covered busy-read errors, timeouts and successful transactions.
The old polling code reproduced false success on read error; the fixed
path blocked SmartSpeed writes and initial/resume resets. Tests with
mocked hardware also covered flag scope, CPU-port selection and
MDIO-to-MTU error handling.

The changed qca8k-8xxx.o built with W=1 for x86_64 and ARM64 under
allyesconfig and allmodconfig, with no compiler diagnostics. Unchanged
qca8k-common.o and MTU locking retain the earlier build and concurrency
test results. Hardware tests used downstream RA74 firmware. This
revision has no full kernel image/modules build, pure net-next RA74 boot
or hardware lockdep run.

Original RFC:
https://lore.kernel.org/netdev/20260919085406.1395-1-yongzhao.derek@gmail.com/

v2:
https://lore.kernel.org/netdev/20260922202653.1153-1-yongzhao.derek@gmail.com/

Base: net-next 8830e65ed46de41f849eefb8ba227d4852c460f6.
Local prerequisite: 3ba847ea54227f704ee3b04f95d4b52d4e22d483.

Yongzhao Chen (4):
  net: dsa: pass PHY flags when connecting shared ports
  net: dsa: qca8k: serialize CPU MAC pause during MTU changes
  net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
  net: phy: qca83xx: disable SmartSpeed before resetting CPU PHYs

Ziyang Huang (1):
  net: dsa: qca8k: support QCA8337 internal PHY CPU links

 Documentation/networking/dsa/dsa.rst |  2 +
 MAINTAINERS                          |  1 +
 drivers/net/dsa/bcm_sf2.c            |  4 ++
 drivers/net/dsa/microchip/ksz8.c     |  4 ++
 drivers/net/dsa/qca/qca8k-8xxx.c     | 39 +++++++++-----
 drivers/net/dsa/qca/qca8k-common.c   | 79 ++++++++++++++++++++++------
 drivers/net/phy/qcom/qca83xx.c       | 32 +++++++++--
 include/linux/qca83xx.h              | 11 ++++
 net/dsa/port.c                       |  6 ++-
 9 files changed, 145 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/qca83xx.h

-- 
2.43.0

