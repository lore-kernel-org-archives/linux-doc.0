Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07D30FC03
	for <linux-doc@vger.kernel.org>; Sat, 10 Jan 2026 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018701; cv=none; b=jadURthm97efoV6VKC/oZKXXo1QzW6ofIcXXJyjJqXaxbmObdFAKS8Ct+w67WNbUCES2xVaaOLr1kDTKaFc25Xv1s0sqVLrY3Z+VV5tRRsnct28VBiOd3/NMkgeAVkCcC71hXziQ7IyCYjRCLSn/HwkW5eVSjVwEW6UBE23b8Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018701; c=relaxed/simple;
	bh=zRMaG2UZoaDAk8JWg4Py4arxiWvpQFKHkL9OU1MsMMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kPC/22gpKKVXC5AQSprg9lCtiOPO1KBGlWYWkelygvoqkgWSvd/1z9BqvLFcTcgVj4KAATGlxKsm5IPMR69Lrfv1DfUhihnw85h85qX/mUMfGm8SQoNMaOgbb+GLWDjAkHhmdWKkBmXjo2Yk720gQZffWW+JwG2Wa/9lRAtZNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzRrry2x; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzRrry2x"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eea75115ceso1393751137.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 20:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768018698; x=1768623498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzuCZ10ab2Iorj0lcSOmaTCThwhF5YTUtr2Jp++0Xa0=;
        b=fzRrry2xiJ2nvgk4XoNTHTtFurmcj0P6zVnJVox0eGOWhweNyJxrfa1PXoBdoLsSah
         iDLNsBLbT/ILC8Naqdshq3YChJwMLkO+wGM9V+FWSd2MYlSH867vMgg/gneIIC9bWPd6
         o+EfzrmFUSmXYM7dEQvGe6pcKGRA0VXjHomXzaNgSSVUjgL8lNV5s3rNFXEMgW5U4D5S
         jpm0BEg/a4psDjFqdn8YKmmSdqngUXmIwhhowIIGkmTg3KLktNMCs1FBCufbkT97kN2K
         punoL5w+92UcYaSsP44ov54rAOhR9qe3uqUySXJ6TxGE0fx6gBrGt63fchpMeH9GOwPh
         SoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768018698; x=1768623498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzuCZ10ab2Iorj0lcSOmaTCThwhF5YTUtr2Jp++0Xa0=;
        b=hyAaVcYgPUddlNgNIEMvUXBeFp9NURaQD3eAYTuo3G25YnuZ8Zmt0kiScFbxKr0EIo
         HG+c6SfmVID/TyKLoKYYkw+w+6gWuPR/Vyw8KUU8zNInbENX8XvaBUz2Ti0pLLmsty1V
         UG4oArne6RD9PZdf/3Kjz75nr/TA+kBLrwddu04x2WL20FzxkfwI8CXcqaP+UwRELlir
         a+kajgVTKsK+WXk7nKEg9eJ7QiwZbTHKHKCdp4NPn9g4H9M5iaK/Xn1sMneIy0+pUBTX
         M8efoonQMkU46gpK9c1qTHxtE0vMRftaKY31xurGw/v1qadZ3jLQU7QPYYNHRPcR66Lf
         GpUg==
X-Forwarded-Encrypted: i=1; AJvYcCW5pke++jeOc+uAWeDElAwfuo/nixgqzvZTI7qF+vnBmeH1cTOtTjRqbrMaze8cpEbFongDJeVbAAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpSI7NzoZYXCmdfVIwMldqA7R2O1YZ9pE/Fg+XsMAeEgpnpvbX
	arGAEzqkrUok8lYp+QPhS8gY4hJaiFgVnfpanB8E5zTWhFyk8hqXwVOarv8x+Q==
X-Gm-Gg: AY/fxX4jZCM2Kcmb5mTM/Wn3bpWexP5lELyoDWKGE//Fom2s+mxXRP7FWOP20Ou3J5r
	PUOmXYmeHOdmMvpgq3Ml4vwYQoJ0P07bEZyi4j72FSn1ww7U47n3rf/iSmTOwsXYPK7d7u8ETNc
	tQDG6/Pkw1J4zjp6BTn/ER7V3r4uF9IN7FLL6ZjicKJ0SA4guHSj7ZD8R3DXnggt9VsFn+BUoUp
	ZrS5WDxSBCpy3IO3hwHDibdTKqzDT9J/REXGACuN+cdLGRM/a5IJqFnbCDGlkymNA0KqeH42Qts
	UF5wWhOZiDvXjEfTCzgcfjA6F79TUvhC/yam5SNxwyM45fqWoiO5yvOr7t6XXhZny5yZ78KZmaS
	l5KhOUqKrtnwdcXr7k2XxpjEnwrJ1S42zsg/0xHU3QzM73m5s9VnRDA7N/ai6ux/ikwau4xGZGd
	Gl3eHztf3VOA==
X-Google-Smtp-Source: AGHT+IEz37L2wQQJA4qX8j5KYwrwN9NH1ecV7Azu8uWOr9xF8kdhENvXLiTeJfu5CUWtgau8Fq/JnA==
X-Received: by 2002:a53:d005:0:b0:645:5297:3e5d with SMTP id 956f58d0204a3-6470d31648fmr10030592d50.46.1768011539825;
        Fri, 09 Jan 2026 18:18:59 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:42::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790ae603282sm43469157b3.13.2026.01.09.18.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 18:18:59 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v9 0/5] net: devmem: improve cpu cost of RX token
 management
Date: Fri, 09 Jan 2026 18:18:14 -0800
Message-Id: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOi2YWkC/5XSS2rEMAyA4asEr0dFfttZ9R6lCz+UJrRJhtgNM
 wxz90Kgbcgua8H3C6EHK7QMVFjbPNhC61CGeWJt4y8NS32YPgiGzNqGCRQanfBQ0hJq6iHOMd6
 p9F80hgkyrSONUNMV6vxJE3xfS10ojCC8iMStyholuzTsulA33LbiG5uowkS3yt4vDeuHUuflv
 q2y8m2+VT2K09WVA0L2ynDjo9YaX0eq4SXN45ZaxY7n/DwvACE5zFbqmJWWB17ueGHO8xIQ0Km
 oTMzBue7A6z+eo5DneQ0IyqbodKeF9nTgzT/PUZ3nDSBQ8C51KiuMx+PYHc/PP9RqAYGHmJwyV
 mqVDrz75Q1ytOd5BwheJG+ckVx5s+Ofz+cPGcVR5jEDAAA=
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
      selftests: drv-net: devmem: add autorelease test

 Documentation/netlink/specs/netdev.yaml           |  12 +++
 Documentation/networking/devmem.rst               |  70 +++++++++++++
 include/net/netmem.h                              |   1 +
 include/net/sock.h                                |   7 +-
 include/uapi/linux/netdev.h                       |   1 +
 net/core/devmem.c                                 | 116 ++++++++++++++++++----
 net/core/devmem.h                                 |  29 +++++-
 net/core/netdev-genl-gen.c                        |   5 +-
 net/core/netdev-genl.c                            |  10 +-
 net/core/sock.c                                   | 103 ++++++++++++++-----
 net/ipv4/tcp.c                                    |  76 +++++++++++---
 net/ipv4/tcp_ipv4.c                               |  11 +-
 net/ipv4/tcp_minisocks.c                          |   3 +-
 tools/include/uapi/linux/netdev.h                 |   1 +
 tools/testing/selftests/drivers/net/hw/devmem.py  |  21 +++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c |  19 ++--
 16 files changed, 407 insertions(+), 78 deletions(-)
---
base-commit: 6ad078fa0ababa8de2a2b39f476d2abd179a3cf6
change-id: 20250829-scratch-bobbyeshleman-devmem-tcp-token-upstream-292be174d503

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

