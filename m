Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECE199385
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727906997; cv=none; b=Zw1DioGevYuzPo2blyfx9seMCxbwpO3kXq4/fJetWe/u/40vt8bnMf1fjFP9o1eWqUZl7Cd7/ZHYYYjKOvbmqoKDAOuDurd1EpDhEEn9pN9Sib8LN9+EBgNbMdqCVrF0q0tqMddCbPHKfQ504NygaG75Lzlrvoj9GkxRy0gc+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727906997; c=relaxed/simple;
	bh=vGyCPabMAbOh+4jbtzjEEtcRZNRpv9x7chfzociw/IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5RHELtxR54EKs7OHBsyN9vDjIQruhdjb5GvJd4/8ynt6jD1J2JXx2F32DLL1WmR5VOJiE1NB4jcap/CZlmgq9aA3A1sj0JiDnDVJaQijAIGZbv6eIt32nABy+yTNy4ivWYsAKldtHZdCnPivr2z5FRmUY6i0v+F7Py+KnH936U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NXT/FTE8; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NXT/FTE8"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-3a3636ddad6so1029595ab.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1727906994; x=1728511794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV02ciEJA9IyAtmxJn8482aGKbVkirPtp9fOh2sSSus=;
        b=NXT/FTE8Rfv0COrEvMMADTt0X34aZwqa/DzpIt/RqV0xKQcmw7+gknmy/bdCoGRZxN
         RFed/kG0UgEW0vaNM1ZIPbBttNYhFt0QdL4ijvDIOdm/MEu9rlllS2qmORIkxtQadVpZ
         KaaRe+qkczwIfFhyLVavh4BZCJKxJLTn76PddSenjAsKIp1vOu9fz8HrWA76PEeubL6v
         ZmegiHSHrO1prmRVbc33OBJ+im9yEUF5c1DEmZT8TLVFEcxe3LBwtAz/UkFSoDNQHG6H
         dCxNWatQqOvNKkBKqNTX5ha3rthB2CWYiW3DJ0NPHFBpiwDMtDFunocNIQOpgomw2hTb
         OU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727906994; x=1728511794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV02ciEJA9IyAtmxJn8482aGKbVkirPtp9fOh2sSSus=;
        b=myencoA33vLZC6ShMUsUFP6p0zS3Zn5k2cJ0lhm0MKSFiQAOrrgP4yK93++3gT2WYA
         7GgT8LXtt+SmLHZpp/C55IkcN4DinNaaWvVnJS2NAt7thM90ub9Vuc+MOQ1kuS86K7gL
         bdtq/VaZCiKWSXpOjI23P2URFePRBhf3VJTxJs05QR/1ldjPGhYdIeaFgb0UU2Nsp+vT
         dxDdvCALssbTOazhrypZKKVP2n0faH5MAY0w3jR/z1u3GXaXJaiLgH8IqHZwvZ1h7fWP
         jbwph7c7cN5aOr+mM/Fb6dq3PkSS9USHE3Jyr+nzdm5ezMKTMh2yI0pTWMeBaRe2U33K
         hCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCSvGWVujujzkmoPyM3bf0ThqyTrKn6BmcxY641TPwCbTiUyGO5xaoC7ZF5weXvC8F2uLYs7InR5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPN3HHr8tNoGnSlJcBfTVNv0xGeBA1hACIEtld2eD3r49LkH3w
	Nq9Xwv6SVxQfTYTc/7zKBA2ABceGdTna853vbuZi//0qXk6GQJLtCxIphnnrDKFvyvf/SkJA353
	UOEH9GAUUpN/3itSwHZoGeAWJji5X8sIgWGDR17l67S5wo6hP
X-Google-Smtp-Source: AGHT+IFKKA16avvRsUgNBS8BS+Ke9oZjRFVOo976eTm55jX8xKPvGaEJnBQRdqTricfeAxS4e6Rj5CvFo7Do
X-Received: by 2002:a92:c568:0:b0:3a0:9050:702a with SMTP id e9e14a558f8ab-3a365964acamr40335255ab.17.1727906994411;
        Wed, 02 Oct 2024 15:09:54 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4db5596c732sm883173.27.2024.10.02.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 15:09:54 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6688D34088E;
	Wed,  2 Oct 2024 16:09:52 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 515EFE407EC; Wed,  2 Oct 2024 16:09:51 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/5] ublk: check recovery flags for validity
Date: Wed,  2 Oct 2024 16:09:45 -0600
Message-Id: <20241002220949.3087902-2-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002220949.3087902-1-ushankar@purestorage.com>
References: <20241002220949.3087902-1-ushankar@purestorage.com>
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

