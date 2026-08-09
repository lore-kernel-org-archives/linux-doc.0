Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93D37C0E2
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786299848; cv=none; b=ct6a+Jirw8hjTNmnszUEZWlkJJ0buLAo+qqLEbaLiYaz2QXl0TlHsaP9NsqHgky/l5brkutfxHhXo5x6+wT7gudCnZR60kw6g5fXGiQGVHglrEB9u+AE1OvO3YIAVj+uoh2VikZnjkoDeRCK+G2Hn3i6AnqZc2D+V70m8HJI5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786299848; c=relaxed/simple;
	bh=hZHi9NW2g/WqAEpGxXYimUrRfchRnZho0g3kDJOMeUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzL3VeIiEUqgVMAsSMbaBXYtC60ec1z3cL734UM7eVMhqMxesGogW8QMNR+awkd+XT8yEN7ca60PbcKAXHnmSx6EUSVfEr/SJyYa1xQTfWl4YR8wz5MRJwSKdgNdmSwBp8hS8owuEYA6ZATBsbno0vwYoOeVJw0pEikt6Fa/8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4hST7C9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4hST7C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786299846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6/TbhPr4NGkFf7ZBR9YY44udE2MKMd2e1TIVa7v+k0=;
	b=S4hST7C9ti3uPgodcYHour1LvO1Nv6Fl4Ed8NBNjHn21u4K4FTfl/aHDJ6PLYrltawlyOq
	x5gRrjiTxBU/BXb09NuV1Xpspr80cWgxJmhMiW1Y0NYKxAi7Rs6M3iWxRf/F3piNQ2MLce
	HMZQbLNXp/LFZCK1HwgiDlv4S8Kls2A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-rmDA2ecIN5qdf2i-kSxzGw-1; Sun,
 09 Aug 2026 14:23:55 -0400
X-MC-Unique: rmDA2ecIN5qdf2i-kSxzGw-1
X-Mimecast-MFC-AGG-ID: rmDA2ecIN5qdf2i-kSxzGw_1786299834
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE5651956080;
	Sun,  9 Aug 2026 18:23:53 +0000 (UTC)
Received: from p16v.luc.cera.cz (unknown [10.44.32.36])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A4A319560AB;
	Sun,  9 Aug 2026 18:23:48 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Min Li <min.li@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Petr Oros <poros@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v6 1/3] dpll: zl3073x: scale poll interval proportionally to timeout
Date: Sun,  9 Aug 2026 20:23:38 +0200
Message-ID: <20260809182340.1081610-2-ivecera@redhat.com>
In-Reply-To: <20260809182340.1081610-1-ivecera@redhat.com>
References: <20260809182340.1081610-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Replace the fixed 10 us poll sleep in zl3073x_poll_zero_u8() with
timeout_us / 50. This scales the sleep interval proportionally to
the timeout, targeting approximately 50 iterations regardless of
the timeout magnitude.

The fixed 10 us interval was adequate for the existing 25-50 ms
timeouts but wasteful for the longer PTP-related timeouts (up to
3000 ms for phase step) added in the following patches, where it
would generate on the order of 10^5 bus transactions per wait.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
index 5b2d77f2c2288e..2e8b52c8de5e26 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -322,7 +322,7 @@ int zl3073x_write_u48(struct zl3073x_dev *zldev, unsigned int reg, u64 val)
 int zl3073x_poll_zero_u8(struct zl3073x_dev *zldev, unsigned int reg,
 			 u8 mask, unsigned int timeout_us)
 {
-#define ZL_POLL_SLEEP_US 10
+	unsigned int sleep_us = timeout_us / 50;
 	unsigned int val;
 
 	/* Check the register is 8bit */
@@ -336,7 +336,7 @@ int zl3073x_poll_zero_u8(struct zl3073x_dev *zldev, unsigned int reg,
 	reg = ZL_REG_ADDR(reg) + ZL_RANGE_OFFSET;
 
 	return regmap_read_poll_timeout(zldev->regmap, reg, val, !(val & mask),
-					ZL_POLL_SLEEP_US, timeout_us);
+					sleep_us, timeout_us);
 }
 
 int zl3073x_mb_op(struct zl3073x_dev *zldev, unsigned int op_reg, u8 op_val,
-- 
2.54.0

