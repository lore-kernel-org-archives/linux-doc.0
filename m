Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680870;
	b=bNFT7gbU4sS8j+CKH3UCDgIfhO+JsIaM/JKd5gQ7whrT28pNNb58mbBRJ7bQO2nIMGFw
	 kd6V5hbv0scbf7O56JEcjLcByXSEAxpWBN/P/5zzaDr5twFCQ+hJwaRJGy1b37MI4iWjL
	 Yz2EevwgRq930kCdO6bfRVf6b++HXr0+abTX1D8F0Vta8TUWe4sPlJKjUswcCgP8fPmBh
	 B4PNnAkzJEtm5bkXZQcmsfkLW3apzauOANzTSV4E9CNEHAEKgDhaGmFWKSZrOtLWb34d+
	 rJlZ0OoY0QKDnX8d7tT3RAEdc2rFBJsHn5BHbKzaHhy3/Rjvf3FQjYangq37opZzxuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=821hPZ3mSrVkDru9zjRsyXQ6m5zbLDq4PwmJzq0vjp8=;
	b=YAeTsGx0zezo5XmyJhCRnroI+77BdT22e+Bt+AsiGoX7BxqVdg0WJnB9PPyfVurCCwTj
	 RxkHvWzXxeL5Um24oXfbVYRc2NsnVFDbbZZXZn85kENS3ZyywvrdZoJ+1cIIBQ1ntiJk3
	 zt4iKyYdYyYy0+Fk0ZahEi3vMJLe7+XQGyTOpbceRxOGUXjVKzW4nEeMA9xcw1UShnHg8
	 9t1s48IATPhRC7/1r15A69a3J8+zktDDipXvmGTX4jUjGupKq4tCMTBL6szxKYA0mUOLy
	 BijOJhG1rq7BNKR9stnCUscdovRWxbZFJE6vv7YhBXbaVzZ4hITsrJnmHRWnjY5bNkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ez3H+WVb;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1C606A330
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F1C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ez3H+WVb
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50604721c8so397661466b.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680867; x=1795285667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=821hPZ3mSrVkDru9zjRsyXQ6m5zbLDq4PwmJzq0vjp8=;
        b=ez3H+WVb8N6kuW9DSLlXuva7AGxWZhqKOmf3bTmNJDi15V1K+XpPiqn6V3wnMJ+z3N
         DzTmTMxOpPKMtqA7m6sFzIVGrnsIAwRXMsGoD+ctZ1mUNaqCpcHfTX6ISVopadsOmS1Y
         dI4TZ5U0q0AmUZXHAhjAjKh+et3IsiEX+asKYbfP0RSUUyXOqZmBRTpM1SFqoJyZb+dD
         +g4scdis7G/SsRvmAROVwigJRQrXtsff6692FBvdeC1pmSKAA0CjlTVllh+LdX2AWD0l
         XgQrBIk9Rrt7/rxndra2MG1WboVkfpi3iiKakjiYIh/7/mv0nKFLH9qVf16/AhcHP5Of
         BcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680867; x=1795285667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=821hPZ3mSrVkDru9zjRsyXQ6m5zbLDq4PwmJzq0vjp8=;
        b=hGRjVl16TuvmMTR7IHf6pI3D2WkdwMoUrKaQOlMJaqcJHDboxY9j4OpuWhq9q/XoMJ
         bWwFrDSQ+OsSUYnzbkWdvFQLXyWGE9ABpDTJNOt6AhkJwlXBNPOaf6+uxBlNTUNtiPgt
         XyX+6mQDUY4V/+1gViPU+OhdfJ9TdKDfqltcXu4YPAcGLuMojQTOvXjo6IjeqUSOYFc6
         HC4Z5TCWxWFJme2XG7QRXQcdAkX9vjMOyRemlolHNAuh/Zhe73F8rKVL18GXSSyN+A7T
         dlyZe57YIjHKHnDhPh1fdeEL3R1fAEvce+Z7FL/yF4b7/MmU26092xiJXktt32SZvW3B
         RyFA==
X-Forwarded-Encrypted: i=1; AL+hErE+8SxrvB4mQ9GWqmK489mupdeRYCzI+fPJkfJoRJBJ9wAn5m/SYnzXqGbgyewPCIhhZJmYQqnVEYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FIvlM+SLQXVm+y3S/R3D8uR7iac/0X1sRTJVELgO16VWvjjP3
	ldgcbS/2M9Q2lCjf7DMva8BIXAMailLrfKMJ05rZUtW8VemKU4pL88bwomMV+HVOWQ==
X-Gm-Gg: AYBFou03G144aNAWzUkBuDxT8pt7R4D+n4AulgH+OnR47uYx19qTLAx7dhVKQBv9ZSC
	+kCbv8EdAWJJAQIbu17t21buG6P6DRaKyUd4zW/VEzTqN96NX+cmFFbl/lrf2vC9yELD/0XEBOm
	9uMNW0jDh3hm09daqJjDZQn0rbPKY2q/yFGGRhuyUmI65OeAzWnCipASZl5H+gPeHfDjKSL/bkY
	SxTexurIJFulKgfyFG/roCk3weA/t5DoH3hIBU64AbHGynIG2w9RyzZ6lkObsZgg/LMioad9sQl
	h8m2Ujo8n3ne9KD2yHuPqk9uen10GD41PVW/ENe2jM94lwFRWR6PkC6MDdpUjf20RuyStLSeFtL
	dt/jYvksBG/jDthQTtoK3+BtzVZtmldDFqHjiJ1OvH/J1XsrQiTeEYfMoxXB1XtgtIIsoO5g2bP
	5B5udOEv9BTe7jM1h77SrTuOpI8QiDv+uQbXHiTBQgAVcbP2ckV3x+YkYQ/TOVFxd438kV0Y+DI
	YIkZ+JMEKNeDGdfMWLgFuiVOLDNsHwk3LWJ8S8X+SzwMWaUgaIb8pwVHCrwmAClw0O8zuxIZjs3
	a3QdBbttDYBis8NhrAIFwirCPlbake7V0Etzxoj8vyxNwvpBNonLqrm456N4BojuaGKHzq7SFUD
	ehmSYS2+AaatxK2eqT6I5dZBAyZoYRK7Ughrw3WEF8T1b81eFanPMZga/q2AaH8JlH+H28hCPmn
	f6VvqkIzrT86o0/k46fEgonnXbgZIzeFmWxvZKRPbAztKF0tmoe4OFOoMvdOMaJ3HLj1gtczNSW
	BRnIJrOkbmYtJvtwGmAwAGn9pKKqHwhhl5Y5ShAEpB7CKvz+nlNphEr7jlAhrTMTndFRjshMI1/
	mvc=
X-Received: by 2002:a17:907:86a6:b0:c4d:4be1:4197 with SMTP id a640c23a62f3a-c5096410ca0mr549445066b.41.1794680867320;
        Sat, 14 Nov 2026 10:27:47 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm245554366b.47.2026.11.14.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 19:27:43 +0100
Message-ID: <cover.1794139176.git.julius@bairaktaris.de>
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
suggested in review of v1. Patch 2 adds a selftest.

Tested in QEMU (KVM, KASAN and lockdep) with the selftest, 18 cases,
400 segments each:
- net (30c71476d842), 2 of 2 runs: 6 cases fail. Fixed inner IDs
  increment after IPIP over IPv4 and IPv6 and after the ESP tunnel (390
  of 400 segments carry an inner ID the sender did not use), the outer
  IDs repeat after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs keeps that state
  after decapsulation into IPIP (10 distinct outer IDs).
- this series, 2 of 2 runs: 18 of 18 pass, no KASAN or lockdep report.

With a tunnel inside a tunnel, such as GRE traffic that GRO merged and
that is routed into an IPIP tunnel without decapsulation, two flags still
describe three IPv4 headers: the new outermost header takes
SKB_GSO_TCP_FIXEDID_OUTER of the header below it, as it takes
SKB_GSO_TCP_FIXEDID on net. This series does not change that case; it
gets a separate fix.

Changes in v2:
- Keep SKB_GSO_TCP_FIXEDID on the innermost header and describe the
  outer header with SKB_GSO_TCP_FIXEDID_OUTER instead of moving the
  flag on encapsulation and decapsulation (Alexei). Encapsulation then
  needs no change, which also covers ESP tunnel mode with crypto
  offload, missed in v1 (Alexei, Sashiko), the Geneve GRO hint path,
  which sets skb->encapsulation again after iptunnel_pull_offloads()
  (Sashiko), and BPF encapsulation followed by an L3-only decapsulation
  (Sashiko). FOU, which pulls the offloads twice, clears the outer flag
  twice.
- Keep the encap_level reset in gre_gso_segment() and
  __skb_udp_tunnel_segment(): v1 undid commit 5197f3499c47 ("net: Reset
  encap_level to avoid resetting features on inner IP headers"), which
  with remote checksum offload masks NETIF_F_HW_CSUM out of the inner
  features on devices without it in hw_enc_features (Alexei, Sashiko).
- Drop the segment routing changes: the outer header there is IPv6
  (Alexei). This also drops the read of hdr->nexthdr after
  iptunnel_pull_offloads() in ipv6_srh_rcv() that Sashiko reported as a
  use-after-free; ipv6_srh_rcv() is unchanged.
- Convert mlx5 and sfc to the outer flag (Alexei).
- Selftest: add an ESP tunnel mode case offloaded to netdevsim; check
  the inner ID values, not only how many distinct IDs arrive; skip the
  decap cases when the IPIP device cannot be created; fail a case whose
  receiver reports no result; keep IPv6 link-local traffic off the
  tunnels, whose tx_packets decide the GRO skip; remove the temporary
  file on exit; sort the Makefile entry; wrap lines at 80 columns
  (Sashiko, NIPA).
- v1: https://lore.kernel.org/netdev/cover.1792857378.git.julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 .../networking/segmentation-offloads.rst      |   4 +-
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   |   8 +-
 drivers/net/ethernet/sfc/ef100_tx.c           |  12 +-
 include/linux/netdevice.h                     |   2 +-
 include/linux/skbuff.h                        |   4 +-
 include/net/ip_tunnels.h                      |   1 +
 net/core/filter.c                             |   1 +
 net/ipv4/af_inet.c                            |   8 +-
 net/ipv4/tcp_offload.c                        |   6 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   2 +
 tools/testing/selftests/net/tcp_fixedid.c     | 411 ++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh    | 400 +++++++++++++++++
 13 files changed, 836 insertions(+), 24 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0

