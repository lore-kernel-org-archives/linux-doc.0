Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543115;
	b=oZcmceUZmqBPigrKCt83N/jIvoV6ojgH9n9CifUxNfAJURJhQ0CfY3mdfLZhgG8WIfKR
	 EfeEx6GluX2eluAzuWGdnFMFyGRLSa6Gni2UMptpQ3Z1MttVbN96Kp2nhZU5q211jrcdK
	 HyPIBA+WrwYkW8FdrjYqE6yuJa2XdQ8CuCAWTRqKQdwTg91exUZcCMFnPQvYkfIaX7Sve
	 rYEZfa3BK4rFy2OKrU3C+AH+ukUDdgis5346/5Kd1iHCqYJbCeLFF1A6dGqjqWybe1slU
	 wviLb1ssSyH2hqDUfjZdhSH6+tNTKXxUq1hvo6MQysCnlG3smhvDTRFi69I9zUvle5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aQUx3TL65pMyWzlf2bMKB3xiAtfdB/7ZATJytxZbwVM=;
	b=GItXk0FoiUvsSb1myx5LEh2vFc6p5rb1evEGD0941NQiVOOUuyoQ53P/lorDcYqg/Fnn
	 syEJLjTNkaAKlgU1uOPSH6wHwSdhfSp6C3a51+qJHXiqRQKamZCQo5GRaeboJWu8FjteT
	 PNIMyanfDwLPi4TAu/VuofiKhOia/3ch2Yz8RFDFba+ertrGjvbEy8b1L418teIeYd8R1
	 NN79pnoIgH82Hf9cgOg+9yAA8ybEoT8rlTVcgVMTtP9w/w2R4klE/tteCTA0aP/10onyM
	 MAwCAb4U+K/qiq+XEqEZMVBJgIlBiIiHQ0QRsDWTaHG/Cit4EAL6iq/5a5/fIJERBlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CaJCF+Ut;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE347606A321
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE347606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CaJCF+Ut
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so5995318a12.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543113; x=1796147913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQUx3TL65pMyWzlf2bMKB3xiAtfdB/7ZATJytxZbwVM=;
        b=CaJCF+Ut4+fp0euaRNosEJ0+zYbVC5DJBYCBoaCM/Ta7mZpi0TIN0doFHLGqpMAYv3
         KL9LzXaZcL8wmGKubksSn9bjdSC8If/vVxCKIVQPzCdgmJx4ogqShBYcPZfpB1pL/mAI
         RPip0q3RfpT5bNMxbzG0vloKfFYX3+uJ486DKYs+rJUylupPn518FsodC7ao4/egBijf
         zPXtyDx4iv8+WGY9jBX+EBbaDv2eclRZxitXE2GqPu9ITLdTxr9mRk1ahoip+gwIXPP4
         CH8GQjTP3d+IJrNuz1iU9u/Z8JOm5Y7g3StzHMTQFot6WFFpysnohxOWN+rP9cxk4jia
         dyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543113; x=1796147913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQUx3TL65pMyWzlf2bMKB3xiAtfdB/7ZATJytxZbwVM=;
        b=g/Bf3EWo2E2XHehSY4ZffPeMg71eCCDQq6/F2E64Hu6nfz1nmObrGHeO+KnunReHPf
         qzh5EiHdxoj1PEYdpCVNkxqjazJTRdLmsE5oiz3QRdRYW/gQf0OqtaU6RYRekWy4CG9r
         M4KtvCFoflybD3kE4wJ9aa570AFLfyoAkdsle92fypkdgsM/QTAImInOvKudU4jn4Hkj
         pgQpLCfkk5YnVz/E4iLP5M4hyfvFFRhfZG/SXsFdddXWCfnfjI4yTM7yXmhUZBKsAKKG
         fzNq8QhvhlVzP6+4e7lyDNKQ2eBzFZ2hFA8OmPOAKE5khppGEvnwLN7rbcihDW1TfzyH
         f9fg==
X-Forwarded-Encrypted: i=1; AL+hErG/iHujN+xl82lDcXFG1WNT9ShRd/ZuVQiqpRHZZqye32TjbB2RAFbWHyIjTnQtL4glmeGBbzokbIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gDQu34DvParRHCNpJrdKB/X2AE3sPotVA6zprmBEBb74rG+I/
	WJzYM6sVCqujPJc1K6cB7L3bMgrLpeqJTyZcim1tj9J8OlUdVxDg81WnuDe6DQldbgo=
X-Gm-Gg: AZFdTZevQNZyhRye0LA6TwGavFUSmyb06vAWuciFjEZhTbuwzXuH5WcEJURei5vvqGQ
	2kHRppGFrun5KXKsFYM0rNofb3u5GjFfUbVpaJvatXSMQ8u+rQH5zNEP3vmt0nvPuhIj4oypiTO
	8WMXuZd++E16HhtK8yle/78+NtFCZGr5vGjgmFV19/LUoZeVgrgFOr3Kt3pojbI0nFX6temZrNl
	6Uit4z+uL/mNnQ2twwPkmIeWf/rzjTq+iY+rwsLlMa1c4kRHOjwCQP2dK1sQ59zz/08HFFUv5rE
	my9n6hELD7Tp6kOP/eVeWIY9kz9bynk5hUEPWv80Kfj+xsgQI8IXo/WDSD29JxuAMYRZT5ayI5T
	poNuLI0BKjix5gdXlHOV/53ma4ERyjbMgzA6BCay3wYIGdM+2UDZ5465SttnCpnAfw1UK9MYp9T
	cq3tGcdibAsb22LaeUlRDbLj+ImJaBVJvJZRhO3R9bLU4mSBsLeylnROnj5+EhGDOqBwu2OdQK6
	RpM8CfYBsvfwNvcYSFXK+aK2a/HDsw13MdxwE7aLZqC2E5VSOgxBI1g9jlR31XJcihu+3IdEzSt
	VBVoHKuPiNLoixT5hyb54/GJ6/FUecBoxiEclyVQlbeSmq0=
X-Received: by 2002:a05:6402:42c2:b0:6ba:90e0:cc06 with SMTP id 4fb4d7f45d1cf-6ba90e0cdc0mr7601394a12.28.1795543112897;
        Tue, 24 Nov 2026 09:58:32 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.58.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:58:32 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 00/11] net: extra TX headroom for local egress
Date: Tue, 24 Nov 2026 17:58:13 +0000
Message-ID: <20261124175824.60470-1-tianyi@cloudflare.com>
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
Content-Transfer-Encoding: 8bit

This is v3 of the series that David Keogh posted as an RFC [1].
v1 is [2], v2 is [3].

Locally generated UDP, raw and AF_PACKET packets, and AF_XDP packets in
copy mode, get only the headroom that needed_headroom asks for. If an
XDP or TC program needs more, the skb is reallocated or copied for every
packet. This happens in three cases:

- An XDP program on a veth peer needs XDP_PACKET_HEADROOM (256 bytes).
  The peer copies the packet.
- A program at TC egress adds headers. The skb is reallocated.
- A namespace sends through a veth pair, and a program at TC egress of
  another device, such as the host uplink, adds headers. The skb is
  reallocated on that device.

(patches 1-2, from David Keogh) This series adds tx_extra_headroom to
struct net_device. It is added only where a locally generated skb is
allocated.

Each case sets tx_extra_headroom in its own way, to keep the new UAPI
minimal:

- (patches 3-5) The kernel sets it when XDP is attached to the peer of
  a veth or netkit device. New skbs on the device then reserve enough
  headroom for XDP_PACKET_HEADROOM.
- (patches 6-8) Add a BTF decl tag "tx_extra_headroom:<bytes>" as
  UAPI. A tcx egress program declares it, and the verifier reads it at
  load.
- (patches 9-11) Add a VETH_INFO_TX_EXTRA_HEADROOM UAPI for headers that
  another device pushes, such as the host uplink. It is like
  IFLA_NETKIT_HEADROOM for netkit [4]. The CNI plugin sets it at veth
  creation, as Cilium does with netkit [5].

tx_extra_headroom is the sum of the extra headroom that each case
requires, limited to 512 bytes. For example, a program at TC egress
pushes a header, and XDP on the peer then still needs
XDP_PACKET_HEADROOM in front of it. The kernel recalculates
tx_extra_headroom when XDP or a tcx program is attached or detached.

For all three cases, one option is to raise needed_headroom instead.
This causes a regression for TCP and forwarding, because
needed_headroom is also the minimum that ip_finish_output2() and
ip_forward() require.

Patch 3 depends on commit f564749b3b26 ("net: record XDP programs
propagated to lower devices"), which is only in net-next, so the series
targets net-next. Patches 6-8 change tcx and the verifier. An Ack from
the BPF maintainers on them would be appreciated.

Performance:

All tests run on a Xeon E5-2640 v4 with a ConnectX-4 Lx NIC, on
net-next at d6816d9a93b6. Details of the artifacts are in [6].

The first table shows the regression when needed_headroom is raised
to 256 on both ends of a veth pair. XDP runs on the namespace side:

test                                 net-next       needed_headroom 256
netns sends TCP to host              32.1 Gbit/s    30.8 Gbit/s
host forwards 1400B UDP into netns   0.583 Mpps     0.366 Mpps

The second table shows the gain from tx_extra_headroom in all three
cases, with 1400-byte UDP payloads. All numbers come from one kernel
with this series applied, with tx_extra_headroom off and on. Between
two kernels, the code layout alone changed the rate by up to 13%.
Off uses a benchmark-only patch for the XDP case [6], the push program
without its decl tag, and a veth pair without
VETH_INFO_TX_EXTRA_HEADROOM:

test                                          off          on
host to netns, generic XDP_PASS in netns      0.237 Mpps   0.283 Mpps
host to netns, generic XDP_DROP in netns      0.386 Mpps   0.465 Mpps
host to netns, 20-byte push at TC egress      0.385 Mpps   0.468 Mpps
netns to uplink, 20-byte push on the uplink   0.190 Mpps   0.219 Mpps

Out of scope:

- Auto-tuning for the second and third cases [7].
- Backlinking the originating netdev to set tx_extra_headroom for the
  third case [8].
- Native XDP on veth. veth_convert_skb_to_xdp_buff() still copies
  these packets. A follow-up veth patch changes this for XDP_PASS and
  XDP_DROP.

Changes:

v3:
- Mount bpffs on /sys/fs/bpf in tx_extra_headroom.py if needed.
  NIPA's VMs boot without it (Paolo).
- Mention in 3/11 and in the documentation that native XDP on veth
  still copies locally generated packets (Sashiko).
- Document which packets get tx_extra_headroom, and the -EEXIST
  failure for two decl tags (Sashiko).
- Bind in copy mode with xdp_helper -t (Sashiko).
- Add the maximum of tx-extra-headroom to rt-link.yaml (Sashiko).
- Check the value set at veth creation at tcx ingress of the peer
  (Sashiko).

v2 [3]:
- Drop "configurable" from the series title and rework the cover
  letter.
- Drop IFLA_TX_EXTRA_HEADROOM (Willem, Stephen).
- Set tx_extra_headroom on veth XDP attach (Stephen), from the BPF decl
  tag "tx_extra_headroom:<bytes>" on tcx attach (Dragos, Willem), and
  with VETH_INFO_TX_EXTRA_HEADROOM at veth creation.
- Turn the LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX() macros into static
  inline functions (Willem).
- Test the veth attribute with YNL only (Jakub).

v1 [2]:
- Add the veth XDP case and the needed_headroom regression data to the
  cover letter.
- Remove LL_RESERVED_SPACE_EXTRA(), which has no user.
- Replace the RFC data-path selftests with a test of a push at TC
  egress.
- Add tests of generic XDP on a veth peer and of setting both ends of
  a veth pair.

RFC: [1]

[1] https://lore.kernel.org/all/20261015235335.4162993-1-dkeogh@amazon.com/
[2] https://lore.kernel.org/all/cover.1794020868.git.tianyi@cloudflare.com/
[3] https://lore.kernel.org/all/20261119013830.36935-1-tianyi@cloudflare.com/
[4] https://git.kernel.org/torvalds/c/b9ed315d3c4c
[5] https://github.com/cilium/cilium/blob/4a5cd2a20e31/pkg/datapath/connector/netkit.go#L63-L67
[6] https://github.com/tgao-cf/tx-extra-headroom-bench/tree/main
[7] https://lore.kernel.org/all/20261108214356.95406-1-tianyi@cloudflare.com/
[8] https://lore.kernel.org/all/20261110201250.95225-1-tianyi@cloudflare.com/
---
David Keogh will post a TCP test as a reply to this series.

The iproute2 patch for VETH_INFO_TX_EXTRA_HEADROOM will be posted after
this series is accepted.

David Keogh (2):
  net: add tx_extra_headroom and netdev_get_alloc_headroom()
  net: reserve extra TX headroom for local egress

Tianyi Gao (9):
  net: set tx_extra_headroom of the peer on XDP attach
  selftests: net: add flag to send a frame in xdp_helper
  selftests: net: add tx_extra_headroom test
  bpf, tcx: Set tx_extra_headroom from a decl tag on egress programs
  selftests: net: tx_extra_headroom: test a push at TC egress
  selftests/bpf: Test the tx_extra_headroom decl tag
  veth: add VETH_INFO_TX_EXTRA_HEADROOM
  netlink: specs: rt-link: add veth attributes
  selftests: net: tx_extra_headroom: test the veth attribute

 Documentation/netlink/specs/rt-link.yaml      |  16 +
 .../networking/net_cachelines/net_device.rst  |   1 +
 Documentation/networking/netdevices.rst       |  49 ++
 drivers/net/veth.c                            |  44 ++
 include/linux/bpf.h                           |   1 +
 include/linux/netdevice.h                     |  40 +-
 include/net/tcx.h                             |   6 +
 include/uapi/linux/veth.h                     |   5 +-
 kernel/bpf/tcx.c                              |  24 +
 kernel/bpf/verifier.c                         |  31 ++
 net/core/dev.c                                |  44 ++
 net/ipv4/ip_output.c                          |   2 +-
 net/ipv4/raw.c                                |   2 +-
 net/ipv6/ip6_output.c                         |   2 +-
 net/ipv6/raw.c                                |   2 +-
 net/packet/af_packet.c                        |   7 +-
 net/xdp/xsk.c                                 |   6 +-
 tools/net/ynl/Makefile.deps                   |   3 +-
 .../selftests/bpf/prog_tests/verifier.c       |   2 +
 .../bpf/progs/verifier_tx_extra_headroom.c    |  40 ++
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/lib/xdp_helper.c  |  85 +++-
 .../selftests/net/tx_extra_headroom.bpf.c     | 138 ++++++
 .../selftests/net/tx_extra_headroom.py        | 437 ++++++++++++++++++
 24 files changed, 964 insertions(+), 24 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c
 create mode 100644 tools/testing/selftests/net/tx_extra_headroom.bpf.c
 create mode 100755 tools/testing/selftests/net/tx_extra_headroom.py


base-commit: c2621b518b38ed38e280e008aa33e6c2d302f8cc
-- 
2.56.0

