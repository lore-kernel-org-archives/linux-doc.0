Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283060;
	b=WBW/wwBt2nupBraHGgXv6jP2QI5wfjj5ZMm5VbUtqHK7CPasTULiblamuLQwYvpj+EJe
	 sr9jV3b6Qzz4fae8tHQWQBmnSGSoBI8hxgvxzNB/MW1hJwPGZwfua4tY7ucOSV5BaxWRt
	 wb1gLHA8qxg4Txoimhlb8Ms14DnyaRp2DY2q6iekGoqT63rG/Sl3WQ1gmzXt1pKjjXezt
	 X0PladeEKbRMrEpGB40EIVxr9nAv+T8eQTyQ7MKtXnEEaZv/ILqz1Lc8GOSWJX25eJKB2
	 fShbIBq1oV0kspIfrpOQDrLnR+GJwt09WHSzM1emwPKh1WbIiiZ1r2+WJPso7Bt/rkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
	b=SW5DINxmI0yqVZSsvlbzm1yX4z4Ga8xgFr3Hl28XKmD9FP25/jvgGAkgVd461y/+UKKJ
	 ur4yxo1yuEDZU+9kFrVXAT/PQ+QY+4jjTRCNKMVXuLUWjdatqsk6AqBD3WdPxVyYrLdvA
	 P+2WbV3+TOkIesMBn1c93+/6fVIkechrzkWXEOCyOUvNaCepc8QHtieI7XC8WAfR80hds
	 64xaaOUE1qzLf3TMZNPATDPwIBHAqDGvV2RUi/Ejs5mp/y49Fv75BIgf+RZqjecKYbXFJ
	 Umy0gl9jgYVOpHXnLMf3XGvFwlqN+WwLfCleJdMaNzGAGlzLpBUI4+SoA02vT2Rg1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ABwiHJF8;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFE606A335
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CFE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ABwiHJF8
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1813400a12.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 19:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283058; x=1794887858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=ABwiHJF8uRoIuX+DLpvMiqGhGqYaOhFABFxorxDzxkd6GIYPkHWXYOQ6ue2pWUuMm7
         PDulVSH6Ie4VNDUnAV+H/U0lhiJTP4IUp+SSFxwXvXTvRpfnk48hhYvBDP0G/yr11/UI
         9jw4ILmTvgoTC7Z1aC9K+b/J8rGTfpb4cZanllVLj4J8zsAYyvUUdIsKCezz4yee3yKD
         QMMHnppoAlrXJWQziV2HFCn8ayWrrrNvefvaGYXOTJUoUqs5XrZyhA0jm0qgrl2O1csR
         qJTbO96GXHjU2z/WKmGdzyxBI8xW1VVv8nLaGpg65yqKqRQWtIF9ZRe5CrgcV8mEJ957
         Z9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283058; x=1794887858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=c7ZJAI4yXXcWSSIBpRT2bWRs7XfyLqN+fjtA/Nz34mvTzXUW8BcZxucXTOSLYzopkb
         LIVrUCDTWGaOmTAMcOkqJD+be1QXhtfgp+d0uV8ttXfniCAA6Vysig/eah7Bvway3BWd
         tDOL1OWDOkqM7guYp8aoj43FeM6rdTv2yZiiaFP3hQLcP11Rktv6A24S9n4lw4aVn+Zs
         4a5PNu5/ZJVb9wT4SAd5asVs5e8XRuuv1XfRAN+gR4Ql4qKeeFCsxHxGc54gGRBeF2wQ
         baKMd9Egkk15I/WSA6U62jBftYJ6UZfalWvGbYdAT/Rf1Exz0XjhrQTAKuRfjG1+Hyrt
         UozA==
X-Forwarded-Encrypted: i=1; AL+hErE9+RYsAKi6AEyTBYciVFL7xKqu93Qk+wu+eWSdUGAdP9PgNR1dOFfWyFjOr11cdbBeu22r/4Y7VOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z91KQe0d05fM4Q0yFFvGLDaJexnvvvZ/J3g372MvF0tuxyTtx7G
	HNRcUBO5UmdHbkjvSs8JmYMawl2PB+6Vau9uY9nJyiHTp8c/viFx1Py5l0X/jKpz8gM=
X-Gm-Gg: AYBFou293CN2Awr1WLnaZv8j5R06qdW80DXWlhhVpI/ryFMnZKe0yYkHD1U9EnR41g4
	HKQdq23TyeruhSGVrk6hxw9pzzJHkCxgVnSIGimazN1qlCbD/v51NWqs4cTVkwVM08ljkdZYZ7h
	ZBZNmWOLRcehG2ym13pQ0XTVS4hkBZlbp01DBbY8g1ne1LKD/gy9ISUF2z+h4EkVBeAbS2tvxDX
	hZvNaDYMUKmd1dB/Lzun7HbMRA2kYsiJ1W8Ocq1Sjfr1297iG2qVTnK1fkK2c2MSdfVdO30ikb0
	rbj4jXbMABy03SsRsTqus/PzwEoyMfQ+YG3yBWROMVgDrNH0YKoXZVXX22OtN22ckOS5/iTYCrj
	5xSj4uJzYGg2Wu9WMajiMnzWRXW2SjQksQ6AA9bEPBWmqSQmHqc+PUYp769pDGg7s7fgZTNVE/a
	XpCCtZ4Q61HtoORABbIZX+QSyH3sQfEM19aNda6l7T0GUVc6epTcib1zGvQZ1dglR5SOXV2Rxzx
	z/ZgoDi3UmiFdQnktJfa+41w1nXy258hCtMqs7HPS2JJwOqOMd/kKl/j8PGWRcXgSIe/I0Yrh43
	lfXypydyuWUI+WDbQ0CeNSg/NaKIIvCNkZWYm7OQmQ7hVThOEx8DEAPA1NmAALA=
X-Received: by 2002:a05:6402:4007:b0:6b5:8695:f839 with SMTP id 4fb4d7f45d1cf-6b756b0bf4cmr1096174a12.45.1794283058320;
        Mon, 09 Nov 2026 19:57:38 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:36 -0800 (PST)
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
Subject: [PATCH bpf-next 05/15] xdp: add a kfunc to store the RX checksum status
Date: Tue, 10 Nov 2026 03:57:03 +0000
Message-ID: <f17f2567802dde23ad1cf81b572e0834c6531fe7.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

Add bpf_xdp_skb_ext_store_rx_csum(). It stores the RX checksum status in
the skb core extension area. A later patch sets the stored status on the
skb built from the xdp_frame. The program can read the status from the
NIC with bpf_xdp_metadata_rx_checksum() from Lorenzo's RX checksum kfunc
series [1].

The kfunc accepts XDP_CHECKSUM_NONE with csum_level 0, and
XDP_CHECKSUM_UNNECESSARY with csum_level up to SKB_MAX_CSUM_LEVEL:

- Storing XDP_CHECKSUM_UNNECESSARY asserts that the checksums are
  correct, as in [2]. A program must store it only after it has verified
  the checksums.
- Storing XDP_CHECKSUM_NONE invalidates the checksum status, as
  requested in [3][4].
- After a decap, storing a lower csum_level updates the status, as
  requested in [5].
- CHECKSUM_COMPLETE is not passed to the stack for now, as suggested in
  [5].

Link: https://lore.kernel.org/all/20260715-bpf-xdp-meta-rxcksum-v5-1-623d5c0d0ab7@kernel.org/ [1]
Link: https://lore.kernel.org/all/20260630191510.81402-2-deliran@verdict.gg/ [2]
Link: https://lore.kernel.org/all/20260227153231.78d16b69@kernel.org/ [3]
Link: https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/ [4]
Link: https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/ [5]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
enum xdp_checksum has the same names and values as in [1], so this
patch does not depend on that series. The series merged later drops its
copy.

Stanislav was not sure that any NIC reports a level of 2 or more [4]. A
separate maximum for XDP would give the same skb field two limits, so
the kfunc uses SKB_MAX_CSUM_LEVEL.
---
 include/net/xdp.h |  6 +++++
 net/core/xdp.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 23c976e92898..d8b77d80bfbe 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -701,6 +701,12 @@ enum xdp_rss_hash_type {
 	XDP_RSS_TYPE_L4_IPV6_SCTP_EX = XDP_RSS_TYPE_L4_IPV6_SCTP | XDP_RSS_L3_DYNHDR,
 };
 
+enum xdp_checksum {
+	XDP_CHECKSUM_NONE		= BIT(CHECKSUM_NONE),
+	XDP_CHECKSUM_UNNECESSARY	= BIT(CHECKSUM_UNNECESSARY),
+	XDP_CHECKSUM_COMPLETE		= BIT(CHECKSUM_COMPLETE),
+};
+
 struct xdp_metadata_ops {
 	int	(*xmo_rx_timestamp)(const struct xdp_md *ctx, u64 *timestamp);
 	int	(*xmo_rx_hash)(const struct xdp_md *ctx, u32 *hash,
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 2c1d5ec3311b..eea04e7b7204 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1004,9 +1004,15 @@ struct xdp_skb_ext_vlan {
 	u16 tci;
 };
 
+struct xdp_skb_ext_csum {
+	u8 ip_summed; /* CHECKSUM_* */
+	u8 level;
+};
+
 static const u8 xdp_skb_ext_type_len[] = {
 	[XDP_SKB_EXT_HASH] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_hash),
 	[XDP_SKB_EXT_VLAN] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_vlan),
+	[XDP_SKB_EXT_CSUM] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_csum),
 };
 
 /* Limit the header and all entries to 64 bytes, so that a new entry
@@ -1120,6 +1126,56 @@ __bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_store_rx_csum - Store the RX checksum status of this packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: ``XDP_CHECKSUM_NONE`` or ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Number of consecutive verified checksums minus one, up to
+ *              ``SKB_MAX_CSUM_LEVEL``. Must be 0 with ``XDP_CHECKSUM_NONE``.
+ *
+ * Store ``XDP_CHECKSUM_UNNECESSARY`` only after the program has verified
+ * the checksums.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @ip_summed is not supported, or @csum_level is not valid
+ *   for it
+ * * ``-ENOSPC`` : not enough headroom for the entry
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_store_rx_csum(struct xdp_md *ctx,
+					      enum xdp_checksum ip_summed,
+					      u8 csum_level)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext_csum *entry;
+	u8 val;
+
+	switch (ip_summed) {
+	case XDP_CHECKSUM_NONE:
+		if (csum_level)
+			return -EINVAL;
+		val = CHECKSUM_NONE;
+		break;
+	case XDP_CHECKSUM_UNNECESSARY:
+		if (csum_level > SKB_MAX_CSUM_LEVEL)
+			return -EINVAL;
+		val = CHECKSUM_UNNECESSARY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	entry = xdp_skb_ext_add(xdp, XDP_SKB_EXT_CSUM);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	entry->ip_summed = val;
+	entry->level = csum_level;
+
+	return 0;
+}
+
 /**
  * bpf_xdp_skb_ext_del - Delete a stored entry of this packet.
  * @ctx: XDP context pointer.
@@ -1149,6 +1205,7 @@ __bpf_kfunc_end_defs();
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_csum)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
-- 
2.56.0

