Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749916;
	b=xez9qamoMsOG1W/bwF3o6iDfVBOF2aCKNZFTwxQA93z1gvkl8Kl4UZzS9G2/JlEdPtkd
	 VmAzj2guKElo6tANL4GCNy/zWf+1A6opnig4F/Fu2f0adyHTqIUv1vNsKoq7SldUs10aZ
	 gYuUW7I39NRGpzcqmGhlX0kJtjgJjwmbmgHj5VBitSfsgeePiaGvIbHpNvfGbmUaatbRP
	 ic7Em6SUzrlJQTVHLlVYQOAMyp/aaUfENLNEaomRC1s8gjySjYPZhpyNaOiF8FToUufue
	 eR4L9rzx8cdM52UjWK5HoB0O7Dz5ByDHa2TRW/dIG78T6tMui078N+//vEqqy+D9BFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WiIxk8lmn3E3SUR9Jb0MhBZnr39A0s76dtpbyO4LWvw=;
	b=VQHRfh9dIw32VKs+0UjclJVGZM4b88UN7s7PR0RoE85Pftv3LoDl4VWNpgbGdX/LeE0o
	 y/tWzBJLJAjzPdkyarJ5BzDH7jJZ+pWsfSO8zHBvBZQkMZan1B2xqwzWEjCbjoIAkqINl
	 P0ogdOMNq0QpZZ8p9mQznqtfDHJFAI2SVbk5/H7EqSNs3XlKagVzTGgp4WSQOvze9SgW/
	 0iiPETEB1MZnB0bwQyUUjjyouD+AkchlqhYY+DS7/Ui9Hberr7NUlMC2TVdT9xfB+QjvD
	 1Jgm6fZCLqep7FrXx98249vqaSW1rzgNs+rUFml+SViythe1VLKHZkk5iYnWv5kRGMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lbNZxN/J";
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CDD606A328
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CDD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lbNZxN/J
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so50018eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749914; x=1794354714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiIxk8lmn3E3SUR9Jb0MhBZnr39A0s76dtpbyO4LWvw=;
        b=lbNZxN/JoRpFqMfhLuSYErnkgqNH49/S94mNzomhzs41p5Jmo25C6y4zIhyCNkRBN2
         gNtD5vdbAonjBWlPCnOFUDrQO9Xsnwk24ksZLC+N39b2xcxnrnna5dkjAoG0wVm4hVSA
         nSJT3DAKaLVM2N0Lh5DhMKrTzqPzBJPJH+Q1ucmtCn2N4+wLhXl8GPzCP/f8UTAfav9q
         4uMklp0MPw4JFNcVE0al6U7qZghyyfXlEql+y/bWx684E65qK80PZaJ0fcFWyvLSRTqO
         JbcC47LQqvshRFta58zw2W/FeAevgC2HcND5oRZ1zVhBwWv26L5yBTDs1nVuLmdMRUGs
         fxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749914; x=1794354714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiIxk8lmn3E3SUR9Jb0MhBZnr39A0s76dtpbyO4LWvw=;
        b=bbagY4BhgJqFeoYXZOeMOD4ezPWu0eS3w/o59EiW2HMSsmIVYnkRjBJJcMEmigyFoz
         MSfA/pj6cTRI4bYTpGU84uWp81pkF42V6brUmTASlrT4+2Cpr/+MYfUOe0SqI6s3BhWw
         faCGfg0NQlX6ST3tkdiGjVU8ew02AcJX1O8MKEqCNiPlDcSTqCbQIRtS5MOT0WQF/cGO
         CZZpQDvWYYeCriKFqaX1BW06nWj8ZV6mVajzd/f5hksNoOJjT9fT8+KrwlwH4aROznEX
         pkz3yIjAPgRHdrRTPgJo7tkCqF/RFpU95YFGVQUbtiyBlJi5GonJJ6K/WhPC29XalgUx
         lZPg==
X-Forwarded-Encrypted: i=1; AKwUvBwbIayizjUbjchjustSm9/3/1ANCwdi6Aj5eFZ8hN5+6ZarBXX305HvjGGeScnx9BPwEBlqAQvvObw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QHzMhe/+KdRhmkNFJR4pyk8TbpE4k1ITCvKAStutZ4PUYZws9
	C52jk+5YWf8oN6QcKW79Szs1bVHiZ1p5D2Cv8p4cfah7i4zqBX2kfu1T
X-Gm-Gg: AYBFou0WNtzj/Pr94jmCVOcJp6gVU5gjnDfVORTWtMccpqLFYM+jXfKBj2uegcbEVzP
	4qvsl/wheSWD04iMytiRbb3dVPd3gVq7Xxfev6pumu0C9YHDAaocGDDmpLDbHuGlyrnpT/fmub6
	74/k8HZWWuIU3jlBsUwj3yHx0179nziiAMBZFKlKntPixM7vVJ2pe0kGE0bTE4Bwzqt0NAjAytd
	uw7xxPzxW1/dNzk8LpLiBekoc5WaOr+sNnxiWiNJyFbCAp0dOwQOBSAWmhPTRMsTzqtDA05yJdk
	LdqHAlo5XZkeVqtml2YTod7L1t5GPH5vyzu4/AGVBsw2CE6TK+G70w0zFGIgOHpPy1cUdN4jckF
	Xr7zL4TYWM0DxENS1jqH+VzDL67df546Ikz2WVjPLYg1mOE8B1o6UEctbU5AmpSiHSC025iXGRM
	mfnfC7kKdEgSqm9FakPBA6vnEYdyo2ODjbp3vFBz7jVi4Y2lL49fI/EFbfjk/Xs9VnbpJly1Ihk
	KQEX/RDh4uBsxKmRF8hzCXJ4tXNnwB/oEHxNrv6YsZKqy0GsbG0vYS4EmsmragJe7qtq+R9vTR1
	7j9x6yGm+7zJYqt7Rkfyl6Y=
X-Received: by 2002:a05:693c:87c9:10b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a4241985bmr21750959eec.28.1793749914150;
        Tue, 03 Nov 2026 15:51:54 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm1755960eec.16.2026.11.03.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:53 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/7] net: devmem: size TX net_iovs from the dmabuf layout
Date: Tue,  3 Nov 2026 15:51:45 -0800
Message-ID: <20261103235152.1904727-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
68KB, which makes BIG TCP ineffective for devmem TX.

This series picks the TX net_iov size from the dmabuf sg table instead:
the largest power of 2, up to 2MB, which aligns every DMA segment. With
a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
no UAPI change since TX addresses are dmabuf offsets.

TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
A single frag can now be as large as the skb, which matters for
NETMEM_TX drivers with tso_max_size above 64KB:
- mlx5: 32-bit length per data segment
- gve: splits frags into 16KB descriptors
- fbnic: keeps the default 64KB tso_max_size
- bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
  per-device limit

Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
kernel on the sender only. 1 flow, MTU 4200, receiver tcp_rmem capped
at 16MB so it doesn't drop, median of 5 x 60s runs:

                              before    after
  frags per skb (sender)       16-17      1-2
  throughput (Gb/s)            208.6    211.2
  sender sendmsg CPU (sys)     40.8%    19.5%   (-52%)

The receiver's CPU is the bottleneck, so the gain is CPU, not
throughput. More of the transmit runs from the ACK path, so the
sender's softirq grows (52% -> 59%), but sys + sirq still drops by 16%.

kperf output (sender side) of runs near the median, before:

  client: == Source <sender>
  client:   Tx213.826 Gbps (1603901849600 bytes in 60007723 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60007723 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:             0     0 633      2    0 15556608 7657
  client:   net CPU 49: usr: 0.01% sys: 0.10% idle:44.13% iow: 0.00% irq: 3.21% sirq:52.53%
  client:   app CPU 50: usr: 0.05% sys:41.55% idle:53.88% iow: 0.00% irq: 1.40% sirq: 3.10%

after:

  client: == Source <sender>
  client:   Tx211.242 Gbps (1584440279040 bytes in 60004741 usec)
  client:   Rx  0.000 Gbps (0 bytes in 60004741 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:             0     0 556      3    0 15499264 7650
  client:   net CPU 13: usr: 0.01% sys: 0.08% idle:37.75% iow: 0.00% irq: 3.87% sirq:58.26%
  client:   app CPU 14: usr: 0.06% sys:19.48% idle:77.23% iow: 0.00% irq: 1.19% sirq: 2.02%

The bnxt patches (1 and 5) were tested on two 50Gb/s bnxt hosts with
CONFIG_MAX_SKB_FRAGS=45 (with 17 the check in patch 1 compiles out).
kperf devmem TX from a 2MB hugepage-backed udmabuf runs at line rate
(46.4Gb/s, payload validated) with 2-3 frags per skb, none above 32KB.
ncdevmem sending 1KB chunks builds skbs with up to 45 frags, the stack
segments them and the data arrives intact.

Patches:
- 1: bnxt: segment GSO skbs with too many frags in the stack
- 2-3: devmem TX prep (truesize, niov_shift in the TX lookup)
- 4-5: per-device netmem TX frag size limit, 32KB for bnxt
- 6: pick the TX net_iov size from the sg table
- 7: selftest for TX from a hugepage-backed dmabuf

v2:
- reword the TX truesize commit message (Mina)
- use 1 flow results in the cover letter (Mina)

v1: https://lore.kernel.org/netdev/20261102191438.1059771-1-sdf@fomichev.me/

Stanislav Fomichev (7):
  bnxt_en: let the stack segment GSO skbs with too many frags
  net: devmem: charge the frag length to TX skb truesize
  net: devmem: use niov_shift in net_devmem_get_niov_at()
  net: devmem: add a per-device netmem TX frag size limit
  bnxt_en: limit netmem TX frags to 32KB
  net: devmem: size TX net_iovs from the dmabuf sg table
  selftests: drv-net: devmem: TX from a hugepage-backed dmabuf

 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netmem.rst           |  6 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  6 +++
 include/linux/netdevice.h                     |  2 +
 net/core/datagram.c                           |  3 +-
 net/core/dev.c                                |  1 +
 net/core/devmem.c                             | 37 +++++++++++++---
 net/core/devmem.h                             |  1 +
 net/core/netdev-genl.c                        |  2 +-
 .../selftests/drivers/net/hw/devmem.py        | 10 ++++-
 .../selftests/drivers/net/hw/devmem_lib.py    | 43 +++++++++++++++++--
 .../selftests/drivers/net/hw/ncdevmem.c       |  8 +++-
 .../selftests/drivers/net/hw/nk_devmem.py     | 11 ++++-
 13 files changed, 115 insertions(+), 16 deletions(-)

-- 
2.53.0-Meta

