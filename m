Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285625;
	b=HEBCF4UoDnD9ksvMLbvr/pjWUzMomFPGOKYpagOMXU3C03woJgVe9hgIwyy8BD51XNSc
	 yjAGUfZehxZkHh+xCzF+SUxBdGKooZyegfTYwBobA88zvxyzaGBRKB/lqLYJwazrvo6UB
	 8izWt0jnGqb204mYJ/9wJKF3vfFCCKocMva0V1TaxyiwWm4gQa8uYPjJ1jDEfRfUR5hVt
	 IV8XrLM80cZH8vElrQk+yKh0xEe8CVwu44rWxgJ9BjWE6Knv+kapF8muxYSw/XGK3ew8B
	 O40tNT4K5EqFJZtCdmA3KfwXmD/9QqKOUYkzWzHAJlIExWhrSaJu6dsFSd6T5sNWvhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
	b=4uTIrp1vI65gcFrd/OKbAM9hET/k/1qiAEPUQ7ikYPb+uSabLnhCSTjN3hPPk1r+9eZg
	 bLLqs9WIHVUitJqoiAa5yfwZoCJQ7LXQD17kXh/kLrYDFOyFx0ypcuJ0kKDDyl2UOOtcu
	 pvdVMkH0atMgnUarJU7MHwygY+yAGgPMHZY+ofgDKrnpagocuihMeORThNeY24xt/co2N
	 zyDpxWLRMcGdGdiSkEmAnPXk/Zu3U2hs758D5hoZjCtylfLD7FLum9zvxJIw3EB6HYJke
	 rpjsjeAJ2DgPyaMmFoElid3sgAKqJ71j1tQL9EDEdmHh8qIu146HpSmASvtJIxdF51w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88F606A330
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A88F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so271718066b.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795285623; x=1795890423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=v0fW51fZZ/SGc8wHJ1cKhm3+RD6J9PkbqhNgq6XuNECUhMVQaUDAEVRtVAM3hnqkYJ
         dwkeN1rv9+eSxpwci0y9LeeLRNjt4h9W3Ing/DJR/ZARxdkuXDEpWNq/tIU86Q/7qmDS
         v5M1lWbsKBWBrvy9d9K7BZ1LYFAfQHp3NITaJXhNbbBSP59o22P8JeDvlrxH4T3D4NhD
         X47bQEoKh0aBvOqxWi61Y8SGR7mWHACC+tWZx8/zzmOLp3/rog4+vQGEbXlPRbd5YOwc
         bGPB0gWn3axLCM7ZK5M1W2YgU3P22g2tJ38ZjOeBKoefUg0zuQQ5L3hmp+JUqx5q/A0o
         ycXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285623; x=1795890423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=IbzO9aF/QvVfltT2b9xPO7EdzzlqVKo3HYZTdfFZIB92mQ++Rlp0d+xGMr0tTBYhfp
         Jka4FXHoGXF5K9dUcBA6Vlbqgedqcsi/foQpus6lmQOkxB9DbSjOimV+sUhBhzDl5M8Z
         C8ftl5yBDf2wKmPzxyWE8KCuB3ZJAnM5TnAi1ARwPjC4VcdIj/GxiYSyHdpR010Sl34W
         xkfJRe7KevL6/K02FqNmpNTEeRVB4SuljmMiW1NpTO1TX43CfyhUCtbfIEZmkKkzMomS
         MpdL92jmzpbv8nAX6QPjA1J2hvguEkyvUQ5/mu/m+maDGgLi+aAl/L8gnrgO4omScV2G
         4m/A==
X-Forwarded-Encrypted: i=1; AL+hErHiXDuOUerK5YhCy9r6Ddhbk8H84M1XdE/OKohkjLNLaYp/uiFeSuQ1pHeU6ghSDysFMCL6NVRnhTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nYNL+eQjmSM/DH+UqFq0r18Vn4qr1kycouGcsPngS2beEmHGz
	sCJqOWLMctVybsIuysw6ylYG6UXD7DbOb2vuv9vA7J6Ncr0li8gYvH3mrvJXbkRJxg==
X-Gm-Gg: AZFdTZdEn/1hB2phyLmdILH0UMXF2lh0rAEWxPi4ZF0+dvYAY+V8GgjfuJfZyjtPuBw
	8b/PbPkffT1TiHYCv35iHJ6Sd+ep1+hmAz1HFclLutnaFxWHsvS+r21rs84jMOcSYqWgR/geGJY
	BFMn989W/rICQt5qpjjXCFOfcUKDZ7auBJI6l4w4OSzUCL37481M3gjt+IzIprpJWX9MejOXAd/
	2dx9Ljy+J2wWK6Bcl+39GszBgsFBRxKl0FdWb2BhjizsgXhjGRrZgyTPT7JRamOhbfboxE0jmzv
	aAUF7/P8ck8/izkUhJi1umApvxoe1PSczN3lt5G2ooqbs3uPQS3D8JnHkqtUlrR5gnmiHmrs0rr
	Jg89dEzbHJ31o9lAiDTufNqDNugmYsAs1leFkmAsyDO5j/vwjpJbFF3p+/DgbXtL9IBQlf/U7UI
	OWyZlIUBc4GiCWuWAW627weJ2pvp4mAnjVIZhXhneeGPDYwBFyWDCzeUlOTJLJ6J9F318picI4P
	DFk3s/5iDgCnw7W8psptJjIbUWxcANNh29aUiB0J/YMKdZycyR+9sNAVixUjPxcxvddSNIlpY8j
	MCgJvje0aNFwChrvxovuGq8PeDV0aalGNYTTqnwhz508GIPUdpaLLWLFAkkBXiJJSz5/Fx9XCrV
	riUVDotM34pRKxs1e+0hZ+zTBlob7ufwBGLTBE5eBRN63QEO19gTxcfHqyQ7pXUarOmCsWJq4Ul
	WUTQw5Szn175cIeg/QYpEKtBzbpmfd3NgXNsZgw0/heNcFCaJoKKZu8UA0zz6UaA9kN+N2ORYvo
	iDDWlfnjGGQFZo5QIWgx3j93PQOlNxo8mwxF4lJY4cwd+lTiOnuc9sKPdwfncQesq1x08Au9NjL
	YP1thp8Kh3qqXg5XSzvqUm4qsEzyGstZR+/0Y66+nciANhGnXmRewQE=
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id a640c23a62f3a-c513a8590b8mr434863966b.24.1795285622600;
        Sat, 21 Nov 2026 10:27:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm224519166b.79.2026.11.21.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:01 -0800 (PST)
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
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 21 Nov 2026 19:26:58 +0100
Message-ID: <cover.1795284858.git.julius@bairaktaris.de>
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
to the outer one. Two flags cannot describe the middle header of a packet
with three IPv4 headers: software segmentation uses SKB_GSO_TCP_FIXEDID
for it, as it used SKB_GSO_TCP_FIXEDID_INNER before. Patch 2 adds a
selftest.

The hosted Sashiko AI review of v2 2/3 of my "ipmr: forward GSO multicast
packets" series reported the issue [1], and the selftest in patch 2
reproduces it.

Tested in QEMU (KVM) with the selftest, 19 cases, 400 segments each:
- net (d5b89d55a322), 1 run: 6 cases fail. Fixed inner IDs increment
  after IPIP over IPv4 and IPv6 and after the ESP tunnel (390 of 400
  segments carry an inner ID the sender did not use), the outer IDs
  repeat after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs keeps that state
  after decapsulation into IPIP (10 distinct outer IDs).
- v2 of this series, 1 run: the ESP transport mode case fails (390 of 400
  segments carry an ID the sender did not use).
- this series, 3 of 3 runs: 19 of 19 pass.

Changes in v3:
- Patch 1: clear SKB_GSO_TCP_FIXEDID_OUTER in iptunnel_handle_offloads()
  and in the BPF LWT encapsulation, where a header goes in front of an
  encapsulated packet; the new outermost header kept the flag of the
  header below it (Sashiko).
- Patch 1: copy the inner flag to the outer one in xfrm_output() for ESP
  transport and BEET mode with crypto offload, which set
  skb->encapsulation without adding an IPv4 header; v2 gave that header
  incrementing IDs (Sashiko).
- Patch 1: name the paths that change the outer flag and the middle
  header that the flags cannot describe in skbuff.h,
  segmentation-offloads.rst and the commit message, and list
  SKB_GSO_TCP_FIXEDID_OUTER in the bpf_skb_adjust_room() decap flags of
  the uAPI header (Sashiko).
- Patch 1: wrap lines at 80 columns (NIPA).
- Patch 2: add an ESP transport mode case.
- Patch 2: skip a run in which GRO merged nothing before the outer IDs
  are checked, and check that ESP tunnel mode outer IDs increment within
  each packet (Sashiko).
- Patch 2: delete only the netdevsim devices the test created, also from
  the EXIT trap, and before the namespaces (Sashiko).
- Patch 2: make the receiver's -c optional, as documented (Sashiko).
- Patch 2: use slowwait and check_gen_prog from lib.sh, and create the
  netdevsim devices inside their namespace, as lib.sh does, with the
  new_device write checked (Sashiko).
- Patch 2: report a receiver that is not bound within 10 s as such.
- Patch 2: fix shellcheck SC2016 and wrap lines at 80 columns (NIPA).
- Rebased onto net d5b89d55a322.
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
 net/xfrm/xfrm_output.c                        |  10 +
 tools/include/uapi/linux/bpf.h                |  16 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   2 +
 tools/testing/selftests/net/tcp_fixedid.c     | 432 ++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh    | 427 +++++++++++++++++
 18 files changed, 929 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
-- 
2.53.0

