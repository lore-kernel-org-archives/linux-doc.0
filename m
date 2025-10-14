Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBAC235072
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760419146; cv=none; b=jN+Wf1nv3JuudLkX2RyDn9rXwY+NAkUUAeRlETkSylxucc2P7+cthJ5HdiA4gDnCeTiVleqZ1bDDqEs1OXkmVZ2v7JO0cNTbsRo+6z4xJZt0bhEHDDoExSFL0cdve/lVk0gZ/bzA5hRHG2bovBH0MCPsrekobjvU9KS0boW/QQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760419146; c=relaxed/simple;
	bh=0891Evs5lqD54TbgKetbZhn/3ldOwvcF7ftrNN99I78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gX8RDJR/VDXTznDNCVrC8pWUk5kXQSHbQXUTcCm6fVLe8xxxNS43u59wrdr2zPYQYDnjZ4oTzc9JBrawoBruy6lPTh24D6y50561ijVS8Ega/Vq/SQ6cuDVgoY8pHQjeGnKQ129CZ94hs2OX/V1ZPoVpQs5JeDR9+3aP8FG4TSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdkbjjxh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdkbjjxh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2907ba47f71so2849935ad.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 22:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760419144; x=1761023944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS5ghyNqywnKYwR1bU0C0clme92ktuteU3RH8OfSvOI=;
        b=QdkbjjxhdW4ZmN8gxnQQbO/cQj4D0WY4LXASd61YIkENfjTXuSUAO8QghELRXDU1hz
         kR3FlzWIc1q5NY01QC9QpJ5G/NPih3QJe+AhCHj/jq5zER2bdJw0nAjW2I6A/6xuKrn9
         DFQIaWLBR3HqTHpYxTmOvangy+LecEfkssa6eXPIeBkFwP3GL+5csLMimZeSQCbR6tsM
         rd19r8vW00odjbdD4yed1yQobrtzgdGqe39BjjqQ6+d2Z06uARSY+Y/Oxwu0vzsmIxiH
         UWxMh4gaValILSG4DaNEpgfwkpFZOTkFWTdwKmnTsH2fQXaRyzsRVS8VQGQn9xRkEZ/f
         5RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760419144; x=1761023944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS5ghyNqywnKYwR1bU0C0clme92ktuteU3RH8OfSvOI=;
        b=Ul4CIW63LDqs6k6kOcF1Lm9jW18CQlCnPh2jJHWMFxqkO1DwdrwUadg6CTy/+9BF+W
         DXcafl3r6e+Cyz9gCKobNvRUmhB1V3lGZGOs1uYPvOuaU/ZH6gZNeprDKiDWCmJlbYp9
         rfll7usPznnO/8pXCiY7kKIkzuoOm1ocbBqakPmnw9pu2aQqQMZMHbRHD54a4JC4ZgHF
         VQgMAnEHOt4y+4W+pE/XirVTorDGQFc73ki0gSK6BYyN1tr6MtzuSYIUOyQjiRiy1mk2
         tgQ2wznE5FgL9syfX8eOhPRElogAUBvizKGtxhEhfIZf/XEFSOva8RCQoAaXR4sOZe5O
         Xpcw==
X-Gm-Message-State: AOJu0YzPnPxFM1E0H4m2iBIJtXBYCmXL117y0ymBSD8BpQew1yb79FLt
	DpkQayyjynKsk9lcnDVBKhxsCk8ueKnsDsnpMcdlpWPJA3xlH7h9Pv/xfd8+pdiF
X-Gm-Gg: ASbGncswyrkC6FulwwhwbuoGAVlSMMz8vvnDBSdXJJPfpcSJqv2hn5g+rNohmfXBEHc
	GiYPI/3MT7yfS0PwZZxCw4qpVHx0kn3zQ+9Ft/Vgea8dgzw9qGeeBigq7eEBXmtQONgD4R6ERNb
	PEdiO7Eq+oam03yz/2Px9IOCp4gv0R3id/WA0FuSQoL55dKqXuQMktImPYsMivai1WiIRWEOezA
	rscTtoYSe2bDqz1vUMoCcdcckRum0SKXabbgniEDxcW5K1XQorz6umwwezbhQHVolU75QnJsxRw
	CUFv3r8oM4WXBhDDJXQdm4eoLxWkitYF3iBFwXeJdPk/mVYBhw0NZrpksLtsp1CzUmorATRf//K
	yjRoiMiXe2VXSGAc2t7YP1jOKcYAEZm0YXXwdSp97vnqtKb/f+w==
X-Google-Smtp-Source: AGHT+IHpU6mGXZfoT5qQhUchdAk9g8Q+a7l0nInuSHiJEbwP4Nc8pJjP1AfMYRqiNiWA/AF+l9MMYg==
X-Received: by 2002:a17:902:ef11:b0:251:5900:9803 with SMTP id d9443c01a7336-2902723b876mr300456215ad.21.1760419143758;
        Mon, 13 Oct 2025 22:19:03 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08d0fsm151575385ad.63.2025.10.13.22.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 22:19:03 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH net-next v5 2/2] selftests: tls: add tls record_size_limit test
Date: Tue, 14 Oct 2025 15:18:27 +1000
Message-ID: <20251014051825.1084403-4-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014051825.1084403-2-wilfred.opensource@gmail.com>
References: <20251014051825.1084403-2-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Test that outgoing plaintext records respect the tls TLS_TX_MAX_PAYLOAD_LEN
set using setsockopt(). The limit is set to be 128, thus, in all received
records, the plaintext must not exceed this amount.

Also test that setting a new record size limit whilst a pending open
record exists is handled correctly by discarding the request.

Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes V4 -> V5:
	- Cleanup unused variables
	- Use ASSERT_EQ more aptly

V4: https://lore.kernel.org/netdev/20250923053207.113938-2-wilfred.opensource@gmail.com/
---
 tools/testing/selftests/net/tls.c | 141 ++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index e788b84551ca..158dec851176 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2791,6 +2791,147 @@ TEST_F(tls_err, oob_pressure)
 		EXPECT_EQ(send(self->fd2, buf, 5, MSG_OOB), 5);
 }
 
+/*
+ * Parse a stream of TLS records and ensure that each record respects
+ * the specified @max_payload_len.
+ */
+static size_t parse_tls_records(struct __test_metadata *_metadata,
+				const __u8 *rx_buf, int rx_len, int overhead,
+				__u16 max_payload_len)
+{
+	const __u8 *rec = rx_buf;
+	size_t total_plaintext_rx = 0;
+	const __u8 rec_header_len = 5;
+
+	while (rec < rx_buf + rx_len) {
+		__u16 record_payload_len;
+		__u16 plaintext_len;
+
+		/* Sanity check that it's a TLS header for application data */
+		ASSERT_EQ(rec[0], 23);
+		ASSERT_EQ(rec[1], 0x3);
+		ASSERT_EQ(rec[2], 0x3);
+
+		memcpy(&record_payload_len, rec + 3, 2);
+		record_payload_len = ntohs(record_payload_len);
+		ASSERT_GE(record_payload_len, overhead);
+
+		plaintext_len = record_payload_len - overhead;
+		total_plaintext_rx += plaintext_len;
+
+		/* Plaintext must not exceed the specified limit */
+		ASSERT_LE(plaintext_len, max_payload_len);
+		rec += rec_header_len + record_payload_len;
+	}
+
+	return total_plaintext_rx;
+}
+
+TEST(tx_max_payload_len)
+{
+	struct tls_crypto_info_keys tls12;
+	int cfd, ret, fd, overhead;
+	size_t total_plaintext_rx = 0;
+	__u8 tx[1024], rx[2000];
+	__u16 limit = 128;
+	__u16 opt = 0;
+	unsigned int optlen = sizeof(opt);
+	bool notls;
+
+	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_CCM_128,
+			     &tls12, 0);
+
+	ulp_sock_pair(_metadata, &fd, &cfd, &notls);
+
+	if (notls)
+		exit(KSFT_SKIP);
+
+	/* Don't install keys on fd, we'll parse raw records */
+	ret = setsockopt(cfd, SOL_TLS, TLS_TX, &tls12, tls12.len);
+	ASSERT_EQ(ret, 0);
+
+	ret = setsockopt(cfd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
+			 sizeof(limit));
+	ASSERT_EQ(ret, 0);
+
+	ret = getsockopt(cfd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &opt, &optlen);
+	EXPECT_EQ(ret, 0);
+	EXPECT_EQ(limit, opt);
+	EXPECT_EQ(optlen, sizeof(limit));
+
+	memset(tx, 0, sizeof(tx));
+	ASSERT_EQ(send(cfd, tx, sizeof(tx), 0), sizeof(tx));
+	close(cfd);
+
+	ret = recv(fd, rx, sizeof(rx), 0);
+
+	/*
+	 * 16B tag + 8B IV -- record header (5B) is not counted but we'll
+	 * need it to walk the record stream
+	 */
+	overhead = 16 + 8;
+	total_plaintext_rx = parse_tls_records(_metadata, rx, ret, overhead,
+					       limit);
+
+	ASSERT_EQ(total_plaintext_rx, sizeof(tx));
+	close(fd);
+}
+
+TEST(tx_max_payload_len_open_rec)
+{
+	struct tls_crypto_info_keys tls12;
+	int cfd, ret, fd, overhead;
+	size_t total_plaintext_rx = 0;
+	__u8 tx[1024], rx[2000];
+	__u16 tx_partial = 256;
+	__u16 og_limit = 512, limit = 128;
+	bool notls;
+
+	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_CCM_128,
+			     &tls12, 0);
+
+	ulp_sock_pair(_metadata, &fd, &cfd, &notls);
+
+	if (notls)
+		exit(KSFT_SKIP);
+
+	/* Don't install keys on fd, we'll parse raw records */
+	ret = setsockopt(cfd, SOL_TLS, TLS_TX, &tls12, tls12.len);
+	ASSERT_EQ(ret, 0);
+
+	ret = setsockopt(cfd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &og_limit,
+			 sizeof(og_limit));
+	ASSERT_EQ(ret, 0);
+
+	memset(tx, 0, sizeof(tx));
+	ASSERT_EQ(send(cfd, tx, tx_partial, MSG_MORE), tx_partial);
+
+	/*
+	 * Changing the payload limit with a pending open record should
+	 * not be allowed.
+	 */
+	ret = setsockopt(cfd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
+			 sizeof(limit));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EBUSY);
+
+	ASSERT_EQ(send(cfd, tx + tx_partial, sizeof(tx) - tx_partial, MSG_EOR),
+		  sizeof(tx) - tx_partial);
+	close(cfd);
+
+	ret = recv(fd, rx, sizeof(rx), 0);
+
+	/*
+	 * 16B tag + 8B IV -- record header (5B) is not counted but we'll
+	 * need it to walk the record stream
+	 */
+	overhead = 16 + 8;
+	total_plaintext_rx = parse_tls_records(_metadata, rx, ret, overhead,
+					       og_limit);
+	ASSERT_EQ(total_plaintext_rx, sizeof(tx));
+	close(fd);
+}
+
 TEST(non_established) {
 	struct tls12_crypto_info_aes_gcm_256 tls12;
 	struct sockaddr_in addr;
-- 
2.51.0

