Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283042;
	b=NMJ7bNCWEighP0ijhlAzKHRkAz+d67vdqZyWaNFBWmOipwHoyZrmWkmNfUwZSnOB4L+f
	 +IwlRagXCiJOQFNrbRGCCZspdY5XIdzsz6FQT27ZbAO59eiIRMYGVy7CLVVwJaSObz1GD
	 2yL+loeptqDaEBoce3I8Sw4O/kuFQ3BO1N8R+G0WbN3syWCIqTQiTLONLut2vIcVZziIs
	 XUwgN4Rd9SeNXuRcxZY9mnCI+LbI6OR6Pc3E7cNuuyn+CfPeZHwt8XkASVjvF5vt6b/Kv
	 f3EcPv5BTg7iZkOb5pnZOtSI+MUWXRn0il7hhkoW544EWEO/zrKtck6MfjHoQKMx6Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eceI8dL07kv9yfwsc+DTSqIVxIuF3lFqQT3hh7B4xzA=;
	b=pIeeTLDcRamFuys9SQW3i83r8oRpm4y3kYtGE1X5NT61IfuzZnq6fQ4piSiKvVEe0q9d
	 rfjqDZv+Y8Xue4WYQ13iC8YWDVoyEbiN2+K/uyYivwo9bezmHhWcgNBTByQgUdEZrjk4X
	 aLqgY4KHdHbLnJ2lrVfEKluLizOp3D7G7Ym6Bo2Q4MSDVYB/NDXviPDytxscd2/cYCVDe
	 7BTpfi7aZoy9Z9WNJ4ktvri8qYj35ggP3Q6dpMl4LiZ87AJw+wpNYpe9Y2a7cUo+1RYnQ
	 L2flvnhPTVmVZSXNqtFQp8fnZZWlwC2PIlMR8Po7dw6ZCyiCAKqTe/YfibXs3yR+52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Sjhac5WE;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EC606A32A
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Sjhac5WE
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1927669a12.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 19:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283040; x=1794887840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eceI8dL07kv9yfwsc+DTSqIVxIuF3lFqQT3hh7B4xzA=;
        b=Sjhac5WEpLMCRdzSW227ZB0OGfUzyJQ+60RcTN/gXuPK3juyGLV2WRUal9Bd3hSPBk
         6Uzhd+Xr0DGNQFarvdrHtHyK2F+vDZARjeCc2R2NHeWmWLeA8EzDQO11az8jAzjgu6iJ
         0ogHzqmzPWnJ2xNTste74JJxgrQ0le2++J3gwoFyD3BRNdb3IUGb6dd3N8tdM3GS4+SH
         JIAdaAgmFU0oBWiwIszafWVzI7+Ijj/qPraflFBY8JhoAYZLdqVLQGI+F3bm5PhrAGio
         dusDcN5L9YZ65U4n2MK38Y2NIBxfSlPTFjotQHiccK/K/8/kiT0OrwQyl50knQF5U4Fb
         QZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283040; x=1794887840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eceI8dL07kv9yfwsc+DTSqIVxIuF3lFqQT3hh7B4xzA=;
        b=g/HSOXe3yOhQ4jdZiNJfcszanMhPn1oN+KzpSNxA9rSslPNHw2pd4u9k2xDo0rxWg7
         xKvzT3NyrmiNE8qvjZYQf5frHaLbEAT2wAOkXdhjw20NpmWj0zH+8wpEz7eD/s8Lo1P1
         zV2cVzPj53LmajuZSTFCZv+lgGjBjjCmG/TEBRdSQm0KUjRsKvgw8MU4Rx6GgR32fdMG
         0BfraN6lz5y6TICnliI8cIjfnxY2rRbx0mWv60ES0WUQk5+gdnrIr8ZXAmXmhrpdfqBG
         lADVcaW/UKyOEesHQ50pxsi/Hx4aIbyuLuwHJYB2bJacUTAYqB6Xc09Z5JcvD/ydhNUV
         BBQA==
X-Forwarded-Encrypted: i=1; AL+hErGBV6oNPE6zlRAKHIPWpOy83FJPam6GSizdOcrNvk7wqr4O+hv0OkyCvj7X9SxKzBYgn9oayEkG2+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wC/3RjLf+beunOK3bbtfOXSKeec2IV4DCc+YYPTx/8ZQI4qeN
	vtmCiLORSdTEwmtEdx6pFagd3OGXHvlgza5/z48/RhG0JC7wXEF3mCxzkG1fjBiqMHE=
X-Gm-Gg: AYBFou2MWjAwqAMFxpYbfYzhD4XOXb8dbeuizOvEvWX5IdeVSmqEF6uhWyxE5Ny4aKT
	b5NJzIJGtD6aVuu1P5lipdlB7Xb4rFMaCUP7oyHxXdEgDF+4Y6siW6Zb/k0TxUqGFL2JDTosLoW
	WwYCPKLZzKB+Ta9/wYEMY6lpkf371LZWWhEMQ8jZoOT0rMXSqiF9tc728OOK2LTZqSC4vt0xI6K
	0CbUo0kXlcYoGZ9hl/HsmDvxmZ3iWay5FFc4lnBUEHtuoV9x4+Is49/JinsckvuVJHpyt0lcE3a
	I28RbqyJdoyyxSjdA5tmjlwmBkVsBweQcPnfZ7pCdefK7ai6u806bM4BTI1yk0t7jWrt1bUwjCa
	JtPy9qXuhBkVY/ckn6TJAIfQwOSs5DecAO7tM7vIBU9O/KzBtaKEu4enOCRJ7G9+Wv1MzHD7v4t
	AFW8lWKbd35xIIkCgxbqxhDIr+xdR4pvHma+Cv8XSlt3dRx9nyZjdhsOsO0VHqN/Nmx8uITZ3X5
	SyHMsTBTDzuaP3ghavqRxz0oKJBtI2u+189+a2qFzEmEmLFDpie1K51FMzlGNuMkA0j/k2WPkwy
	4XwDc5iagpJTDYm32xv+Vh2PCYWcV5kf0VCsKDb9ehciaOwrISU+VdN1KHwge3Yc
X-Received: by 2002:a05:6402:205b:b0:6b7:1d62:3916 with SMTP id 4fb4d7f45d1cf-6b755626b9dmr778195a12.0.1794283039727;
        Mon, 09 Nov 2026 19:57:19 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:18 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX metadata until skb creation
Date: Tue, 10 Nov 2026 03:56:58 +0000
Message-ID: <cover.1794281983.git.tianyi@cloudflare.com>
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

An skb gets its RX hash, VLAN tag and checksum status from the RX
descriptor, which describes the packet before the XDP program ran.

Without this series:

- On XDP_PASS, the values are stale. After the program strips a UDP
  tunnel header, the stack applies the outer CHECKSUM_UNNECESSARY to the
  inner packet [1]. If the outer UDP checksum is 0, a packet with a bad
  inner checksum reaches the socket.
- On XDP_REDIRECT, the values are lost. The skb that cpumap or veth
  builds from the xdp_frame has no RX hash and no VLAN tag, and its
  checksum status is CHECKSUM_NONE.

In one use case, an XDP program redirects packets into a veth device.
The checksum status is lost, so GRO verifies every checksum in software.
With one TCP flow, this costs 34% of the receiving CPU.

Another use case [2] is load balancing IPsec tunnel traffic with cpumap.
Without the RX hash, GRO on cpumap puts all flows into the same bucket.
In a cpumap test with 16 TCP flows and no IPsec, the throughput is
17.6 Gbit/s instead of 23.4.

This series introduces SKB core extensions for XDP. It reserves an skb
core extension area in the headroom, right after the space for struct
xdp_frame. An XDP program stores RX metadata in the area with kfuncs,
and the kernel sets the skb fields from it. This design was initially
proposed in [3].

The layout of the area follows skb extensions (struct skb_ext). A small
header gives the offset of each entry. An entry takes headroom only when
the program stores it, so the area does not grow with each new type of
RX metadata, unlike [4]. Unlike skb_ext, the area needs no allocation.

This series supports three types of RX metadata. Each type has a store
kfunc, and bpf_xdp_skb_ext_del() deletes an entry:

- The RX hash and its type: bpf_xdp_skb_ext_store_rx_hash().
- The VLAN tag and its protocol: bpf_xdp_skb_ext_store_rx_vlan().
- The checksum status: bpf_xdp_skb_ext_store_rx_csum(). Only
  XDP_CHECKSUM_NONE, or XDP_CHECKSUM_UNNECESSARY with a csum_level up to
  SKB_MAX_CSUM_LEVEL, are allowed [5][6].

The kernel sets the skb fields from the area:

- After XDP_REDIRECT, in __xdp_build_skb_from_frame().
- On XDP_PASS, in the NIC driver. A driver that does this sets the new
  XDP feature skb-ext-pass. On other native XDP drivers, the kernel
  warns once when the program returns XDP_PASS with stored values, and
  ignores the area. This series adds the support to ice.

The existing XDP RX metadata kfuncs are bpf_xdp_metadata_rx_*(). Only
a device-bound program can call them. Programs on cpumap and devmap are
not device-bound, so they cannot call them. Relaxing this check would
change their semantics. So this series adds three load kfuncs,
bpf_xdp_skb_ext_load_rx_*(). They read the stored values.

bpf_xdp_adjust_head(), bpf_xdp_adjust_meta() and bpf_xdp_pull_data() do
not move the packet or the metadata into the area. In this series, the
area takes at most 20 bytes of headroom. With the hardware RX timestamp,
the RX queue index and CHECKSUM_COMPLETE, it would take up to 40 bytes.

Lorenzo's RX checksum kfunc series v5 [7] also defines enum
xdp_checksum. The series that is merged second drops its copy.

Performance:

We measured on ice (E810, 25 Gbit/s) with bpf-next 0fb18ce8a2e9, patches
1-3 of [7] and this series. In the RX metadata column, the XDP program
reads a value with bpf_xdp_metadata_rx_*() and stores it. The veth test
stores the checksum status, and the cpumap test stores the RX hash. The
kernel then sets the value on the skb. Baseline does not store it. Each
value is the median of 5 rounds:

test                  metric          baseline     RX metadata
veth, 1 TCP flow      RX CPU busy     100%         66% (-34%)
veth, 1 TCP flow      RX cycles/pkt   2027         1343 (-34%)
cpumap, 16 TCP flows  throughput      17.6 Gbit/s  23.4 (+33%)
cpumap, 16 TCP flows  pkts/GRO skb    3.4          7.5 (+122%)

Both veth columns reach line rate, so the gain is in CPU time. A store
kfunc takes 2.9 to 4.9 ns. Details are in [8].

Not in this series:

- XDP_PASS support in mlx5 and bnxt. To align with Lorenzo's series [7],
  we plan to add xmo_rx_checksum and XDP_PASS support to them together,
  one driver at a time.
- AF_XDP zero-copy. User space can write the headroom of zero-copy
  buffers, so the store kfuncs return -EOPNOTSUPP there.
- Packets that enter XDP as an skb and leave it as an skb. This happens
  in generic XDP, and on XDP_PASS in veth when its peer sends it an skb.
  The series only sets the stored values on an skb that the kernel
  builds from an xdp_buff or an xdp_frame.
- Stored entries on frames that dpaa and dpaa2 redirect. These drivers
  move data_hard_start before XDP_REDIRECT, so patch 2 clears the flag
  of the area.

[1] https://lore.kernel.org/all/20260227153231.78d16b69@kernel.org/
[2] https://lore.kernel.org/all/ca38f2ed-999f-4ce1-8035-8ee9247f27f2@kernel.org/
[3] https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
[4] https://lore.kernel.org/all/175146824674.1421237.18351246421763677468.stgit@firesoul/
[5] https://lore.kernel.org/all/20260722113525.34092660@kernel.org/
[6] https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/
[7] https://lore.kernel.org/all/20260715-bpf-xdp-meta-rxcksum-v5-0-623d5c0d0ab7@kernel.org/
[8] https://github.com/tgao-cf/skb-core-extensions-bench

Tianyi Gao (15):
  xdp: reserve an skb core extension area after the xdp_frame
  net: dpaa, dpaa2: clear the skb core extension flag
  xdp: add kfuncs to store RX hash and VLAN tag
  xdp: add a kfunc to delete skb core extension entries
  xdp: add a kfunc to store the RX checksum status
  selftests/bpf: Test the skb core extension kfuncs
  xdp: set skb RX metadata from the skb core extension area of xdp_frame
  selftests/bpf: Test RX metadata on skbs built from xdp_frames
  xdp: add the skb-ext-pass XDP feature and warn without it
  xdp: warn on XDP_PASS with stored values when XDP runs on an skb
  ice: set skb RX metadata from the skb core extension area of xdp_buff
  selftests: drv-net: xdp: test the stored RX metadata on XDP_PASS
  xdp: add kfuncs to load the stored RX metadata
  selftests/bpf: Test the load kfuncs on cpumap and veth
  docs: net: document the skb core extension area

 Documentation/netlink/specs/netdev.yaml       |   5 +
 Documentation/networking/xdp-rx-metadata.rst  | 127 +++++-
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    |   2 +
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  |   2 +
 drivers/net/ethernet/intel/ice/ice_main.c     |   3 +-
 drivers/net/ethernet/intel/ice/ice_sf_eth.c   |   3 +-
 drivers/net/ethernet/intel/ice/ice_txrx.c     |   4 +-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c |   7 +-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.h |   3 +-
 drivers/net/ethernet/intel/ice/ice_xsk.c      |   2 +-
 drivers/net/veth.c                            |   5 +-
 include/net/xdp.h                             |  74 +++
 include/uapi/linux/netdev.h                   |   6 +-
 net/bpf/test_run.c                            |   4 +-
 net/core/dev.c                                |   2 +
 net/core/filter.c                             |   8 +-
 net/core/xdp.c                                | 428 +++++++++++++++++-
 tools/include/uapi/linux/netdev.h             |   6 +-
 .../selftests/bpf/prog_tests/test_xsk.c       |  25 +
 .../selftests/bpf/prog_tests/test_xsk.h       |   2 +
 .../selftests/bpf/prog_tests/xdp_bonding.c    |   8 +-
 .../bpf/prog_tests/xdp_do_redirect.c          |   8 +-
 .../selftests/bpf/prog_tests/xdp_pull_data.c  |  12 +-
 .../selftests/bpf/prog_tests/xdp_skb_ext.c    | 375 +++++++++++++++
 .../selftests/bpf/progs/test_xdp_pull_data.c  |   7 +
 .../selftests/bpf/progs/test_xdp_skb_ext.c    | 173 +++++++
 .../selftests/bpf/progs/xdp_skb_ext_failure.c |  16 +
 .../selftests/bpf/progs/xdp_skb_ext_success.c | 245 ++++++++++
 .../selftests/bpf/progs/xsk_xdp_progs.c       |  13 +
 tools/testing/selftests/bpf/xdp_skb_ext.h     |  53 +++
 .../drivers/net/hw/lib/py/__init__.py         |   3 +-
 .../selftests/drivers/net/hw/xdp_metadata.py  | 118 ++++-
 .../drivers/net/hw/xdp_skb_ext.bpf.c          | 166 +++++++
 33 files changed, 1873 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
 create mode 100644 tools/testing/selftests/bpf/progs/xdp_skb_ext_failure.c
 create mode 100644 tools/testing/selftests/bpf/progs/xdp_skb_ext_success.c
 create mode 100644 tools/testing/selftests/bpf/xdp_skb_ext.h
 create mode 100644 tools/testing/selftests/drivers/net/hw/xdp_skb_ext.bpf.c


base-commit: 0fb18ce8a2e9de830433923cf65838933d615359
-- 
2.56.0

