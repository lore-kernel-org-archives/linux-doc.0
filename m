Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605933;
	b=G2glbIwKSKfjSOkmpw6AcKS6vCq57wVy5m9kYDt4Wldu31bXzgHGJztxaKrfK075xF4W
	 0HiGIN9TL24zN+gkekOTzJlAYdhguvGGTEWyUPPYwpdtI6DGOCjxL2xanTLLuedeT644a
	 1Tkyn+dY1gInBhPNggREG5yNlYM8N7ZtCFfwxLQV3KSdfvngoGKWgc8xpNickYLgvajRg
	 yEDgqGgov/BGTZ3Gw820EM2rijsgexQUvpFVeBzYT6+0dCpvt/sDHxtMS+7/yPKRYdX6g
	 gk1DS50stdYs+RdjznaXc661OM4qmVfl2XMlwwutFk6EEJ3FOEmIXP62z9ArEumPzBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
	b=1DcROp2gIqhJFRRrSyenS72nwNJvZE5y2xFAo4kxLljH9akLxMdZzUuWgQGhq+DyAdCp
	 SPku0OxFx8jSbDHNmdFp5sjOE1UCMtzJ7cGhwJ0Fu/jt4cyfkGTJ0rhnGhac+pQLcJL9L
	 aGqNT9J7g6wdpzIHL0s0QeVCdcM86b42fCl5KGp4p/ueSYwfiI1De4lj+S531QukjwATx
	 p68fWtxVPC0XzXB03hgzVa+Be6mBrTf0exhsK9q16CggRQDDSlmMczTWMFNQpiEJ/wrjM
	 tHLewztQgX/y+v2rYUwDUpcL4oH5TB7W5OJDxIWrLgxwj162Oah7BXY1Vy2CyMOLPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ii5B2VWq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9F606A319
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 18:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D9F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ii5B2VWq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so12191705e9.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605931; x=1793210731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
        b=Ii5B2VWqfwQW5rzOGgccwN0tkdmw/e4rjES1c5Zo92Eo0X5gjyDyp5PY38u63ZPztE
         uVtGhuu47sjcZgNH1Wo/jaIgCeym6Ms8YT9fEnibOKNBnQRdevlo7AO9rtWlYUIJIsqy
         x7i9wy67Yb/MnMKsq9nAG0J+0gIMNOB1eaLKhYtLYHSlrhUXRxA3nZimCsJRByF1QNlY
         RsVQJBPzWToj8ihKGmpCfsecuceIY94Cex4ogp5ahaUKwiHB58wCl9xgJCQz+9Fzp1bC
         Fes9WVUmPxSIFuH27OMYhcrpYJGSU9mA91jOKK6lqOTpzSrK6eb7HK4i+tuWFf9fp5OT
         RGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605931; x=1793210731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
        b=DvoinXU9mokMxn/v9RL906OzIonkzwR0sUpwCR/m8ALxMDwWwmNfJEMBz22NRPsc/5
         5XK842qQCI03VnxgkOH0hxCk2+HTTV2ZpcPOZtXoRcDNX4ywOwPCy2XRJ+r+/iBuad2W
         qqvTrRFR9SntfHIbPA1EglpmZeX+0Bl2iDEXRnOcMQkMcEhYA0pqb1thTeDSE25bSbMq
         X926PjK9/sbT4PuXwP6egvXQwB8CCBLKaA+IZE2MM0vxaNVQT2B9RY1nR85NGT+BAhto
         Zs3efPRY4XORuEQJB/5D+RcCPEhozrc4eTyryIDpVSA3JOV3q3qaSlAklSikQRPG36r/
         hO4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5rlo7ZKq1CfRcuZzt3VaLwMExYOKKEhpCwRzJlodStRJEr84SW7paiZ9SwQ5xVEQ5EejPIWyHN3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXdIqjGaH66t2xn2/tN9Vkq5UH76FjJZLtpTJSAjj9B2gR7+DY
	GK7xoNa7wTBIG5DKPmThauIjLcf59sUeL28jr1ySgIt/94xRRZvM0vLa
X-Gm-Gg: AYBFou3JVkTXRWXcX8zzsDBYTibgyozH2sKfuYTNFibnpg7Ys5nCwBnaFUXC4CGsEnm
	xF16yMN4hs0Jysqsq3Y5ikQGZBZhCds5Gp+8lLRi8BlDTRgUKPx+Lp3WM1r4fJzo0XO2SqJAAjq
	85oXZoeHGW7bDHYYaSv+xsVpXypDU1aL/6AIsYXAvRzm/a2Oe+kKEjar+84GUduZZ8i7LmjlrL8
	KNsqR8EHY5UXgeC/8DMDXuOCJbdDgbdMlUnSYPQVtXiI4JdeCgwys5Ycioh5IRwdo/lkx2Z8Sul
	T+6aIzSfvMdpAcJeHamiJnUxppXYNk1YMXGDiwKV3upllRjF+RiDVrmh4UJUaEdnVgWCDkcmhuT
	5QzXsCrXgTLxuCjYgaHHvh3FiTmmnLFNvCpzTqCHDRJLNIeMeYvDpyjJe1cTLloJT+TOBfdk/66
	u2xoJfF5hQudRo2MJ19Gsr9kkpY0cfKTKCSaelhkgvVfo2fny/aaSNG2fKo2JauQ4+KttMN9lrA
	zWJfNADagpvq4BSRBQOfq13l+19l8UKfFw++xLLT09wpD2RNgp/2NgPGe50JtdRijSCT0g1PTV0
	EIcx0JBRJo05Qed0c3DK9tnnvOZDtJkkz0Q57O/ukFswi9BKyufod6darVG/e0yXD8inrpdixQd
	jR0IX8clHqZZDv0er2M81ZqVBE1vDYuRP
X-Received: by 2002:a05:600c:1d0f:b0:49f:faa3:3ca2 with SMTP id 5b1f17b1804b1-4a1fdd14249mr60316635e9.13.1792605930927;
        Wed, 21 Oct 2026 11:05:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c6:e6ea:6401:f04a:ac6f:988e:f33d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd13891sm47007775e9.2.2026.10.21.11.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 11:05:30 -0700 (PDT)
From: Nick Simpson <nick.simo@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Sridhar Samudrala <sri@us.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] xsk: document checksum offload handling in copy mode
Date: Wed, 21 Oct 2026 19:03:28 +0100
Message-ID: <20261021180329.26358-3-nick.simo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021180329.26358-1-nick.simo@gmail.com>
References: <20261021180329.26358-1-nick.simo@gmail.com>
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

In copy mode, XDP_TXMD_FLAGS_CHECKSUM requests are now left to the
device only for the TCP or UDP checksum of an unfragmented IPv4 or IPv6
packet, not IP-in-IP or GRE encapsulated, on an Ethernet device; other
requests are completed in software before transmission. On devices that
take skbs without a linear part (IFF_TX_SKB_NO_LINEAR), every request is
still left to the device. Say so in the description of the flag.

Assisted-by: LLM
Signed-off-by: Nick Simpson <nick.simo@gmail.com>
---
 Documentation/networking/xsk-tx-metadata.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
index f240930ca1df..028564dba43d 100644
--- a/Documentation/networking/xsk-tx-metadata.rst
+++ b/Documentation/networking/xsk-tx-metadata.rst
@@ -50,7 +50,12 @@ The flags field enables the particular offload:
 - ``XDP_TXMD_FLAGS_CHECKSUM``: requests the device to calculate L4
   checksum. ``request.csum_start`` specifies byte offset of where the
   checksumming should start and ``request.csum_offset`` specifies byte offset
-  where the device should store the computed checksum.
+  where the device should store the computed checksum. In copy mode
+  (``XDP_COPY``), only the TCP or UDP checksum of an unfragmented IPv4 or
+  IPv6 packet, not IP-in-IP or GRE encapsulated, on an Ethernet device is
+  left to the device; other requests are completed in software before the
+  packet is transmitted. On devices that take skbs without a linear part
+  (``IFF_TX_SKB_NO_LINEAR``), every request is still left to the device.
 - ``XDP_TXMD_FLAGS_LAUNCH_TIME``: requests the device to schedule the
   packet for transmission at a pre-determined time called launch time. The
   value of launch time is indicated by ``request.launch_time`` field of
-- 
2.53.0

