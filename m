Received: from mail-lj1-f225.google.com (mail-lj1-f225.google.com [209.85.208.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6441DDC34
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325475; cv=none; b=dawZ4t4GOFjeDBtXzlJPXdpBUGj9KrO/bB+ytUwhX+nz3oIzQaGc1ammMCQhlUxvRYCRe0a4qaPdGMOJugIk1mDPYqCB0tL721iP86WLqFtBedxJoD9FCXq8btDOBakn1FnwgmOBzobgBssIlzg/+yKFAT3keUfai6Ji6eQ8Gro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325475; c=relaxed/simple;
	bh=vGyCPabMAbOh+4jbtzjEEtcRZNRpv9x7chfzociw/IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i6Cnfv9uflAy0Lfjcj98WXelUVrn5JFO6zIKNpwoZ/nd62JrthnIBb2TE+3sLTq1t6Ef9HIFsGQcWKoRh1NXKveHO7AOIFkYp81CcIgxbz7/SxLHZvxW8ZZfwYKCb4JVK0yal/gnEVnkuhI85Zh+YdeP/trAxGGRodQAmJpCd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DbXwFhFp; arc=none smtp.client-ip=209.85.208.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DbXwFhFp"
Received: by mail-lj1-f225.google.com with SMTP id 38308e7fff4ca-2fadb636abaso46809121fa.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1728325472; x=1728930272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV02ciEJA9IyAtmxJn8482aGKbVkirPtp9fOh2sSSus=;
        b=DbXwFhFp2WvjBXtl7UEt42sho6gORgPdbfjjwa7w3GnQjSmaUIhAjCIV8NKuOFDn67
         1A2EO/kQ5eqZ+Twr5bxbGTY7ZBkgDNyu04KjV1dh3H5bW3D4FNjJoPfDJ8CGOeAkwI76
         qdP7vgLVcru5MqG5xZ5h1mmNPXrOMkzKXSav6McJ9EO0ZINqrzz4hIkfG/DfCj2w5HSq
         jRbaGrytB7tDuM/54r1T/uKVXsx7QVzEXtQhEO+VNo/DXenw1y1WQNaWI8xWVHZsW5lu
         A9O4K+eeRzVWHp+t5YvpEPxuey87/gXjDCDfonjBd60AFkc4gykrZ84EZjUTBAkgmewv
         mWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325472; x=1728930272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV02ciEJA9IyAtmxJn8482aGKbVkirPtp9fOh2sSSus=;
        b=AtDO1rzlwp9aWadAohQ4ZVssIdzOZPNMPwuOG2slCyiX83CgcQmjsE2ANcaQ96owZ6
         lxgPYtEHZFPVVe/J+qfsAS+hq0NSQaiyGaS3IHHfl/K0mwykOmPu3N1xerrYmC7Nb8MV
         lrJfD8ErocxWsgiPH4RCwsM2q7KyWC5GmMy84gXYB/5N2Mr+gTTjfd5XtOUfSxUXPemJ
         fywvZARzJk2UPu4aiXGOtzTZrjID2b3adzshVW2r8qf/6KaWB1RDjJauw5GMMHnIrlAo
         M2srlxkRbuqocpqQbFaInBoRcgf7kMyNMOu6a9wVusmc9YV+xYDMzmpwS4MsNvFElILE
         MnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWmLL1LOGPkzajO8wxPEaTN6FKHu8IV+DuPWkJ0Xj2tG9ahbcr2XkBodOrVzyp4rrx4ZH7sB1w1cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzIKhSijFb5jdDPZGQgIrwofTn5jy9Ze+HWMXOQLIFKiCC5uy
	iKQVCbmAlYHx313a+9glq2HU3cyvUodpAFGywT07WupNduNkBp1wjyl9PZNqTKOMUNXpUMe9fyY
	3my5NNaPGdznnz/iFateIEqnjgOrRmw6n
X-Google-Smtp-Source: AGHT+IEGrVvDsKQOxqj+lfsL0Jj2PQJAKrxu587qjLPVFyw24AbNaEqKpQYNkS23cVwhqDr/CB4s8MFzLwLd
X-Received: by 2002:a05:6512:159d:b0:536:53a9:96d5 with SMTP id 2adb3069b0e04-539ab866484mr5825828e87.17.1728325471874;
        Mon, 07 Oct 2024 11:24:31 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 2adb3069b0e04-539afec199asm167836e87.17.2024.10.07.11.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:24:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3B094340CD2;
	Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 2889DE4062A; Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/5] ublk: check recovery flags for validity
Date: Mon,  7 Oct 2024 12:24:14 -0600
Message-Id: <20241007182419.3263186-2-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007182419.3263186-1-ushankar@purestorage.com>
References: <20241007182419.3263186-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting UBLK_F_USER_RECOVERY_REISSUE without also setting
UBLK_F_USER_RECOVERY is currently silently equivalent to not setting any
recovery flags at all, even though that's obviously not intended. Check
for this case and fail add_dev (with a paranoid warning to aid debugging
any program which might rely on the old behavior) with EINVAL if it is
detected.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index a6c8e5cc6051..318a4dfe8266 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -62,6 +62,9 @@
 		| UBLK_F_USER_COPY \
 		| UBLK_F_ZONED)
 
+#define UBLK_F_ALL_RECOVERY_FLAGS (UBLK_F_USER_RECOVERY \
+		| UBLK_F_USER_RECOVERY_REISSUE)
+
 /* All UBLK_PARAM_TYPE_* should be included here */
 #define UBLK_PARAM_TYPE_ALL                                \
 	(UBLK_PARAM_TYPE_BASIC | UBLK_PARAM_TYPE_DISCARD | \
@@ -2372,6 +2375,14 @@ static int ublk_ctrl_add_dev(struct io_uring_cmd *cmd)
 	else if (!(info.flags & UBLK_F_UNPRIVILEGED_DEV))
 		return -EPERM;
 
+	/* forbid nonsense combinations of recovery flags */
+	if ((info.flags & UBLK_F_USER_RECOVERY_REISSUE) &&
+	    !(info.flags & UBLK_F_USER_RECOVERY)) {
+		pr_warn("%s: invalid recovery flags %llx\n", __func__,
+			info.flags & UBLK_F_ALL_RECOVERY_FLAGS);
+		return -EINVAL;
+	}
+
 	/*
 	 * unprivileged device can't be trusted, but RECOVERY and
 	 * RECOVERY_REISSUE still may hang error handling, so can't
-- 
2.34.1

