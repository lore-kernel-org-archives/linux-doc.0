Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874855;
	b=364aUw9R7Rcr8mIF3hPDF1za3lMhfE3vVnlL56MAdQD23v/rzYYlmQobNDDENcUezxX2
	 vUqYzejjpRGJsVzcxYtsxWYzawrnz/KnWqNt9QQ7x4f2265oLrsuqOAXYz4q28S2BJXDF
	 0lYjG/J6k8/ZG+7P3dVOdsCi/uRdctVtQX1RWJaGqN/ZYrk3d+Yj8Tqo7c4OqgI+MYJXK
	 eJRjvZgGovXokvMzKSKTN+39zLHs3llvrCBza3GRauN4MDcQnxwbU0+ril8WkDt/5vQXh
	 HHh8OpY0ywNQJI1QdPTIlAftJ7KaKqxlFipW/VpWsNbT5a7qd7yTtmfcaYRFG4CY1qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ayl4vL63SRDfFqUS4rNnHQY3+noL1p8yBbowjznB6G4=;
	b=ILeTisBdx9xCkBbXHv+I3a7pybe4DSN2CxEZ74C9u7d/xLhGs1eK4sP0M+fjSnFnqXaY
	 l4CKufSNMGly4BJ1cuwUH0OvqpJZxbw9IrMHwLfW3BI+9GgZMafezIudIza60g6bkUR6R
	 9BJ35vbv4pTMKorzKpYiUfQykJK4dMJZx9G+ML+I9o+Jkz4Gar6w8lwsjRhEolq8zQaEF
	 2nkhyP4ggGEKBWpktH64KGpqwmnuhxqQbqH/X925jZ25Dqrx/2q/EQ74MzcMSDreeplCU
	 Hb7wYFleEbD3pHFcSoR2wUG7oYfNdbO9KTGqr602fgXKGJfp3y0fIVdx6akWJWQJyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MF37sjiA;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57558606A31C
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 14:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57558606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MF37sjiA
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1779074366b.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 06:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795874853; x=1796479653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayl4vL63SRDfFqUS4rNnHQY3+noL1p8yBbowjznB6G4=;
        b=MF37sjiANiNc5l7el+TpsnAemm4aT5Yz8YXEq1+QSIfVHJqteVaW3QJThjfhppCsbz
         DEB+8LLIBBCM/ETMhUqqgfRJzLicVxoAveGI34GdxvtzXmS9+vzeDqZWilbWkkzTyGc1
         vRSKepvWKqaODJQGOmEN3y+ktKQ0u0ztya9l10Io1fcnunN7jj0cSGabKwxvtvwouOuS
         BxmeB3Kl+tsYdUGdKspB+4mXyogKmVq+r2fhQ/ZDG1PAQgCjJfEcp887O8t+rZ4RB1cB
         PDAuS3HIgfkg42ynlSxyTI+aGRgRoYKqfpLhW5ejYnehG7ZP3zKfeJA+jkMktIvlmCJ6
         7USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874853; x=1796479653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayl4vL63SRDfFqUS4rNnHQY3+noL1p8yBbowjznB6G4=;
        b=soryojU6p2IN94HFi36MTZuWMIh54Q5biZBiJQwr69OVBZK+PIL20ckd7QmlXsqEyR
         pnsQHimDnsZ0OfZxaad2MrSBIaM1efVo4O1WKpXN5oJ6cZo8AuRB/6xpCRVT6rX9275B
         aOvSgLP7MKSE8a+tT/3tdAaeFd00PNfr7pi2tu+UPf0KQHT7+SNnhZi6myWORqkfSwg+
         TcUHurWFr4DZJ0EUXJGXEatwon23DYerAiV/VcOjknN3Q54GFKt6tC5Yn6ZnJXz32Ojx
         LuXPf7G1wOhEAteJ5bH6Pz2I1pLl9Be2+hSsQ4Or9NBvTl6hLXaA1RwF4SxKddQxeIrY
         CdVQ==
X-Forwarded-Encrypted: i=1; AL+hErEmj/XewTxC//71Q5xKOmIT3Lw0qH1Qn3kIdiuM7rM4HsgH9t1cGTSTx5zENjl4k4ZiyRO7BjpSiJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rwsiW6r0IaeWqVc9yxFl8XF7SBvTB3iQxj0pGxk0C4l0nVotO
	1FcuLVpRhCsECuM2lOvNbN0tA0mKFKY4n1LUy2WIfN7xSGHTU1QBuxBrh9ZvlK5qeQ==
X-Gm-Gg: AZFdTZe+/OAclPRIZSL+zUZTmgm5bCO2KmzFvjv6UoY8IYz++GbQ1iafMaqmO7APLsh
	+yAolhHAZHed/DfPZ/3SLceMZVLdF+8QOVc+Y4ao2eX7m/ZPyb8n5Zcq4mjBlaqFhQVFH9dkZPz
	CMQcf83xgYxRN++86BCeyTwH5kycY0oqOXoAbzxCJGBbtERyJ/O8IatvbvfnDMWzRBVile0ukE1
	AyWrkOhJkqe2gFB9+75ZCx/rLgXQdJCkNGEixHRr/7ajtKcY7TH1+0fT5MLN/zVPOcgp72lIG9g
	j87hqJJayJBcR4ztvI+TNxDK7B74c3QVxwMFfdZ8b7DuZxWM+8K3cguDIuqCsTyqotJI3EwBIOz
	cVOfClRrx90AObkLCZEGeIhWb6p48v8hWLxMPH01Nk7sKp2YYz3Q2qCO5bUNMI7+nnVDklSscrN
	NuEurwfir54SoqE3U42zxkE3lhS/XApXAfohK+hA4liu6UovTWVtEFjHdVYDUnRnbliaxmrR0j1
	Ti+wpH9CoHZd6y4gdclF8VFagdLYa6c50iJ9NfkaaMWVepD653FBg7PEjCZVegz+9RaOdD3xUyp
	sLKymfAOwY7mCnHFcch6HSCKcqmIK1YpuYrUKdt4BQXyIY/CO1EScsanKG3JZrhmCmq/0BIoVM1
	JuyoQySyyPIRammzC2t2c+R+Zah8Ec+QXdLU+kqJydpP9VYnGMwJyfDQPj+NLfMJJ6auoaHnZ1N
	0lzfjMRYveLWnYJ50dcFxjH4h9VXEU2aOAJu9rFH4j6zyV2wNP+zJNScZ43AukGUHvPHtqltA6x
	oj/30vEJGP+kJj2paEGVXbvQXYHcwUb/V4HG+oaGDvV5FlNFvAeJrsx4M13WyxA3lWj4sH8JgO8
	foQXD6bfa3127RTXjwMU0CrTwziqHdeDlO2lTlE5x5Dnp9o3FkPyxbNbv3g7a56xn6jbSLAjzw=
	=
X-Received: by 2002:a17:907:6d22:b0:c45:219c:7fec with SMTP id a640c23a62f3a-c51319bc924mr2479907966b.27.1795874852496;
        Sat, 28 Nov 2026 06:07:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247083200a8c3fd0ab7d20fde.dip0.t-ipconnect.de. [2003:f2:4708:3200:a8c3:fd0a:b7d2:fde])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010a6sm990714266b.7.2026.11.28.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:07:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	zirajs7@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 28 Nov 2026 15:07:32 +0100
Message-ID: <cover.1795869698.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GRO sets SKB_GSO_TCP_FIXEDID for a TCP packet whose IPv4 IDs do not
change. Since commit 3271f19bf7b9 ("net: gso: restore ids of outer ip
headers correctly") the flag describes the outermost header and
SKB_GSO_TCP_FIXEDID_INNER the inner one, so every path that adds or
removes a header would have to move the flags. None does, and a TCP
stream that GRO merged and that crosses a tunnel boundary is segmented
with the fixed-ID state of the wrong header.

Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
suggested in review of v1. A header added in front of a packet that is
already encapsulated clears the outer flag, and ESP transport and BEET
mode with crypto offload, which keep the IPv4 header, copy the inner flag
to the outer one. GRO of an IPv6 stream in an IPv4 tunnel sets the outer
flag as it does for an IPv4 stream, and xfrm_output() no longer segments
a decapsulated packet for a tunnel mode SA as an encapsulated one. Two
flags cannot describe the middle header of a packet with three IPv4
headers: software segmentation uses SKB_GSO_TCP_FIXEDID for it, as it
used SKB_GSO_TCP_FIXEDID_INNER before. Patch 2 adds a selftest.

Trigger: a host with GRO on its ingress device forwards a TCP stream
into or out of an IPIP, GRE, VXLAN or crypto-offloaded ESP tunnel; any
sender on the network can produce the stream. Impact: IPv4 IDs that
repeat across the segments of a tunnel's outer header, or that change
on a header whose IDs the sender kept fixed; no crash or memory
corruption. CVSS 3.1 3.7 (AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:L/A:N). Until
the fix: "ethtool -K <dev> gro off" on the ingress device.

The hosted Sashiko AI review of v2 2/3 of my "ipmr: forward GSO multicast
packets" series reported the issue [1], its review of v3 the IPv6 and
the xfrm_output() cases, and the selftest in patch 2 reproduces each.

Tested in QEMU (KVM) with the selftest, 22 cases, 400 segments each:
- net (d5b89d55a322), the new cases, 1 run: 6in4 with fixed outer IDs
  fails (40 distinct outer IDs for 400 segments, want 1), and so do
  both ESP tunnel mode cases (390 of 400 segments carry an inner ID the
  sender did not use).
- v3 of this series, the new cases, 1 run: 6in4 with fixed outer IDs
  and ESP tunnel mode after VXLAN decapsulation fail, as above.
- this series on net-next (f89726ffabef), 3 of 3 runs: 22 of 22 pass,
  and with 2 busy loops on the 4 vCPUs, 3 of 3 runs: 22 of 22 pass.
- the v3 receiver on the v3 kernel with 2 busy loops on the 4 vCPUs,
  the 12 encap cases, 5 runs: 60 of 60 cases lose 18 to 62 segments,
  each exactly the frames the socket dropped, as on NIPA; the v4
  receiver: 0 of 60.

Changes in v4:
- Target net-next, as Paolo asked; rebased onto net-next f89726ffabef,
  and the Fixes: tag dropped.
- Patch 1: set SKB_GSO_TCP_FIXEDID_OUTER in tcp6_gro_complete() for an
  IPv4 outer header with fixed IDs in front of an IPv6 TCP stream;
  segmentation numbered those IDs from the first one (Sashiko).
- Patch 1: in xfrm_output(), segment a GSO packet for a tunnel mode SA
  before ESP only if it is still encapsulated; a decapsulated packet kept
  skb->inner_protocol, and its only IPv4 header got the outer flag
  (Sashiko).
- Patch 2: read the captured frames from a PACKET_RX_RING with room for
  every frame of a case and fail a case on a socket drop; on NIPA the
  socket buffer overflowed while the receiver was not scheduled (Paolo).
- Patch 2: add 6in4 cases with fixed and incrementing outer IDs and an
  ESP tunnel mode case after VXLAN decapsulation.
- v3: https://lore.kernel.org/netdev/cover.1795284858.git.julius@bairaktaris.de/
- v2: https://lore.kernel.org/netdev/cover.1794139176.git.julius@bairaktaris.de/
- v1: https://lore.kernel.org/netdev/cover.1792857378.git.julius@bairaktaris.de/

[1] https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 .../networking/segmentation-offloads.rst      |   8 +-
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   |   8 +-
 drivers/net/ethernet/sfc/ef100_tx.c           |  12 +-
 include/linux/netdevice.h                     |   2 +-
 include/linux/skbuff.h                        |  12 +-
 include/net/ip_tunnels.h                      |   1 +
 include/uapi/linux/bpf.h                      |  16 +-
 net/core/filter.c                             |   1 +
 net/core/lwt_bpf.c                            |   2 +
 net/ipv4/af_inet.c                            |   9 +-
 net/ipv4/ip_tunnel_core.c                     |   2 +
 net/ipv4/tcp_offload.c                        |   7 +-
 net/ipv6/tcpv6_offload.c                      |   5 +-
 net/xfrm/xfrm_output.c                        |  18 +-
 tools/include/uapi/linux/bpf.h                |  16 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   2 +
 tools/testing/selftests/net/tcp_fixedid.c     | 538 ++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh    | 472 +++++++++++++++
 19 files changed, 1091 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: f89726ffabef1b08c52e6163b7ab94b0d5f15503
-- 
2.53.0

