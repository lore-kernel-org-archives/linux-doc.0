Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38DD218592
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545822; cv=none; b=N26AzTyRY/cEEq1mtlsaiCWQED12aywjM6HkCY3efKzPZAhAHvRXJTedV+aOhKy2JSe+SsN6A6FOpE+34jAXpRN2UHYPMYCfVveHorZKXQ8/Tz36GSYI05agC8npjPAPMHC2YA92D2InHuJX0SWkA/Ke+5PMNezXFip3GA9J6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545822; c=relaxed/simple;
	bh=auSMoPKWCajUDwEFhG4/1C5B0ulKuOi59DJ5mdB4wqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UTnCal4DBaSVy5N+J2N0dazVpfSpvbNmZe2afIlsxuluzuP+wQNDmrrMFwWmIbWFgnXDleUHAAOBke2Be2eYUCTELpQof2PA9TOv2ITeICS3tcKxMQHzuLja3Ew+5IZprKxptDfgWQqUIUVZiThF06XO+WVvsU09wM1lqPopVpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhBWnCY3; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhBWnCY3"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso17669586d6.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 22:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768545820; x=1769150620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSj8YbqJilmqRga93ax0BVm+4H5y9SZdZjVdaZpiAbo=;
        b=DhBWnCY3gTsvmQjiTDCNRTdDYHd1HkQsUwCj5L8+WRnaPGcn6pR98x8TCVj5j+03pq
         31SOU5P908Rf9AmqhXKvqbMH202BXfjGwPhxnGSrY7w5GpFEENuUJcyUojuK5tCpvgOH
         UFmm6mj/Esw7a+QOYrol7hCwC5MQe43x0d5cC2hFf04fRDZ0xLhwopqpt4olHNyO6XhG
         /N5YyONzic9i0ylUmHQqkcdernaO3HsylxUjt1FMWXkGkb784wZdHxnGI0ymC2gJ+p75
         W95eUU7Tp/0nlUBoesznpyLKwHyy8CV5XsTMHbAygHdZovfGJn3IcTGDH8E4GJ7PFE4I
         8xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768545820; x=1769150620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSj8YbqJilmqRga93ax0BVm+4H5y9SZdZjVdaZpiAbo=;
        b=IR/0KgRJ3kcA2AL9mNtDsTDhKZRP+g6qch1cJfqbeWY7aWDsHXotrDTD7xkp4gQ70u
         C5gQQ0v/A5I8mCgraHW2RmCOVqknh0u9S9DjiSYgf4TEbJD9ST+OG/GIVXXAC79BM8HX
         9s5lXqEuusiDHQHY7fSFLyAATvg1aEDfTiozJHSfUDPDA3bfJja85iBe+4n8mrTVUsfB
         meSJ9RwEqBj8gLf/TOhJdOkTtPx1x69NksI3pLw/ckCR5tVTlveExPRl3nOKO1EdbWQD
         ISBQFROacr7loyrx0ZByVOc/kmMQZGAMw6MZkxk7MTeuoBjrjkGiOuiV3G5dIUvYgp5L
         xgdA==
X-Forwarded-Encrypted: i=1; AJvYcCWOFNHYQV4rb4nePYWRob3Di6ZlhIlX/da36WadrZyGQJLqUFyrjJUmUNo9sBPvrjDttBpGIrrcx2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS6/zm+tNGdfiVmdrqhagqRapZc5WeH2BskMIH6tgjHeGoScs
	iN468bHx0RTKEX7ir0rUv0U+brKOLn0vWPt7QhYPPDXLV0CGhRs93TKTRxVZDg==
X-Gm-Gg: AY/fxX5HTfZltAPof+fT1CAC3Pwn2ZMKcrBWb0vx3DU7XY5Vy/VL3/6QaTrRfb/dkZR
	2rogLtloubNHEReE3uz708yK6LKlyUcATqGGeOc8++WFoAH4eb1DfnEBnRZwAKU1VZ/oMnAFJdX
	IHhTdd1nrTJgniHdtbLyleqGaEnT2kihxGfwSWheLIe7RNd2yJrsIBfhZbrmTvs3zOtftL4ruMw
	6k51jfC4TIX0aWZHvZl2QrZjFIyMBNGZ3+DpwPd9jaOjaFAan14bAuVMtqa2N6M5YT4hXY6MaAg
	eOJVJoXrLybfGxDWDzqZas0SN5Kx2GkYbEKUe0B2/BSCwfmTpz3mPmoNLVSs/m1PTXrWVojiv4d
	J5Xggp0CkRx4ir6ld6O7bK9DXgkLHss4ShwlI/X6fJDUvYkomktXtqrCYuePdFAeNuiXFeTAQdQ
	4NODBZGE2iqhfcRo0OrR7/
X-Received: by 2002:a05:690c:46ca:b0:78c:25fa:1bb7 with SMTP id 00721157ae682-793c68762a3mr13549577b3.60.1768539797365;
        Thu, 15 Jan 2026 21:03:17 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66f326bsm5392537b3.19.2026.01.15.21.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 21:03:16 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX token
 management
Date: Thu, 15 Jan 2026 21:02:11 -0800
Message-Id: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTGaWkC/53SS2rDMBCA4asYrTNl9Jayyj1KF3qMa9PaDpZqE
 kLuXjC0Nd6564HvH4Z5sEJzT4WdmwebaelLP43s3HA8NSx1YXwn6DM7N0yg0OiEh5LmUFMHcYr
 xTqX7pCGMkGkZaICarlCnDxrh61rqTGEA4UUkblXWKNmpYdeZ2v62Jl/ZSBVGulX2dmpY15c6z
 fd1l4Wv87XqURyuLhwQsleGGx+11ngZqIaXNA1rahEbnvPjvACE5DBbqWNWWu54ueGFOc5LQEC
 nojIxB+faHa9/eY5CHuc1ICibotOtFtrTjjd/PEd1nDeAQMG71KqsMO6PYzc8P/5QiwUEHmJyy
 lipVdrx7oc3yNEe5x0geJG8cUZy5c2O91v+H9t7QHCohJeYEbPd8M/n8xvX8SiHkQMAAA==
X-Change-ID: 20250829-scratch-bobbyeshleman-devmem-tcp-token-upstream-292be174d503
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, Neal Cardwell <ncardwell@google.com>, 
 David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

This series improves the CPU cost of RX token management by adding an
attribute to NETDEV_CMD_BIND_RX that configures sockets using the
binding to avoid the xarray allocator and instead use a per-binding niov
array and a uref field in niov.

Improvement is ~13% cpu util per RX user thread.

Using kperf, the following results were observed:

Before:
	Average RX worker idle %: 13.13, flows 4, test runs 11
After:
	Average RX worker idle %: 26.32, flows 4, test runs 11

Two other approaches were tested, but with no improvement. Namely, 1)
using a hashmap for tokens and 2) keeping an xarray of atomic counters
but using RCU so that the hotpath could be mostly lockless. Neither of
these approaches proved better than the simple array in terms of CPU.

The attribute NETDEV_A_DMABUF_AUTORELEASE is added to toggle the
optimization. It is an optional attribute and defaults to 0 (i.e.,
optimization on).

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Changes in v10:
- add new tests for edge cases
- add new binding->users to binding for tracking socket/rxq users
- remove rx binding count (use xarray instead)
- Link to v9: https://lore.kernel.org/r/20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com

Changes in v9:
- fixed build with NET_DEVMEM=n
- fixed bug in rx bindings count logic
- Link to v8: https://lore.kernel.org/r/20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-0-92c968631496@meta.com

Changes in v8:
- change static branch logic (only set when enabled, otherwise just
  always revert back to disabled)
- fix missing tests
- Link to v7: https://lore.kernel.org/r/20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com

Changes in v7:
- use netlink instead of sockopt (Stan)
- restrict system to only one mode, dmabuf bindings can not co-exist
  with different modes (Stan)
- use static branching to enforce single system-wide mode (Stan)
- Link to v6: https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com

Changes in v6:
- renamed 'net: devmem: use niov array for token management' to refer to
  optionality of new config
- added documentation and tests
- make autorelease flag per-socket sockopt instead of binding
  field / sysctl
- many per-patch changes (see Changes sections per-patch)
- Link to v5: https://lore.kernel.org/r/20251023-scratch-bobbyeshleman-devmem-tcp-token-upstream-v5-0-47cb85f5259e@meta.com

Changes in v5:
- add sysctl to opt-out of performance benefit, back to old token release
- Link to v4: https://lore.kernel.org/all/20250926-scratch-bobbyeshleman-devmem-tcp-token-upstream-v4-0-39156563c3ea@meta.com

Changes in v4:
- rebase to net-next
- Link to v3: https://lore.kernel.org/r/20250926-scratch-bobbyeshleman-devmem-tcp-token-upstream-v3-0-084b46bda88f@meta.com

Changes in v3:
- make urefs per-binding instead of per-socket, reducing memory
  footprint
- fallback to cleaning up references in dmabuf unbind if socket
  leaked tokens
- drop ethtool patch
- Link to v2: https://lore.kernel.org/r/20250911-scratch-bobbyeshleman-devmem-tcp-token-upstream-v2-0-c80d735bd453@meta.com

Changes in v2:
- net: ethtool: prevent user from breaking devmem single-binding rule
  (Mina)
- pre-assign niovs in binding->vec for RX case (Mina)
- remove WARNs on invalid user input (Mina)
- remove extraneous binding ref get (Mina)
- remove WARN for changed binding (Mina)
- always use GFP_ZERO for binding->vec (Mina)
- fix length of alloc for urefs
- use atomic_set(, 0) to initialize sk_user_frags.urefs
- Link to v1: https://lore.kernel.org/r/20250902-scratch-bobbyeshleman-devmem-tcp-token-upstream-v1-0-d946169b5550@meta.com

---
Bobby Eshleman (5):
      net: devmem: rename tx_vec to vec in dmabuf binding
      net: devmem: refactor sock_devmem_dontneed for autorelease split
      net: devmem: implement autorelease token management
      net: devmem: document NETDEV_A_DMABUF_AUTORELEASE netlink attribute
      selftests: drv-net: devmem: add autorelease tests

 Documentation/netlink/specs/netdev.yaml           |  12 ++
 Documentation/networking/devmem.rst               |  73 +++++++++++
 include/net/netmem.h                              |   1 +
 include/net/sock.h                                |   7 +-
 include/uapi/linux/netdev.h                       |   1 +
 net/core/devmem.c                                 | 148 ++++++++++++++++++----
 net/core/devmem.h                                 |  66 +++++++++-
 net/core/netdev-genl-gen.c                        |   5 +-
 net/core/netdev-genl.c                            |  10 +-
 net/core/sock.c                                   | 103 +++++++++++----
 net/ipv4/tcp.c                                    |  87 ++++++++++---
 net/ipv4/tcp_ipv4.c                               |  15 ++-
 net/ipv4/tcp_minisocks.c                          |   3 +-
 tools/include/uapi/linux/netdev.h                 |   1 +
 tools/testing/selftests/drivers/net/hw/devmem.py  |  98 +++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c |  68 +++++++++-
 16 files changed, 611 insertions(+), 87 deletions(-)
---
base-commit: d4596891e72cbf155d61798a81ce9d36b69bfaf4
change-id: 20250829-scratch-bobbyeshleman-devmem-tcp-token-upstream-292be174d503

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

