Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B45242255
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937003; cv=none; b=jJcBQ86uRRG4qYIa/EyCZDDxu9Atem8IT+ns5T+wGtPaHZ332tVDhgH/4IG/BC+RU55Bx/qoTXl941/3ESWbjMwGesCNGrUDiCmvvoderCQ5NBKpcKgGCFHxgiXpFfQQgCTi1JJ9RgW0AVCCEWc/I4v8t5ynVoEXO5sT81iZwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937003; c=relaxed/simple;
	bh=AuS/iv6kct3xwW/JT6RfpDdtL/kYEb8lhYq9bZGCAcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Do6IFpULkiqcwtWvXiuxKCt1wy1uFhdu8rm48LFI0wayOZ0OKdfecRH2RM6KdSCkdjgzDoBYNBxyEL/flfVLDz+NIViQNjO4B/d+dix6BmWMA5MQVneOfi+g60zZejpD0ygfwZhw2wpjFajF/BOws+IWTR3wbaVI+1wGw8ufdR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lR0fSQdi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lR0fSQdi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so96952615ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736937001; x=1737541801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhgcFiioBCTJrsBu7R7SWfvrloYa7MHsggVE4kmGhcU=;
        b=lR0fSQdiE04ikti+5xq8WaDFxzwVQeHg00rN11k+au+7HPHtKuWQWs9Thgfz8tmALw
         5vfNFj8uLCMz2/Ok7bzr6zbU4Am+zfIpirMWAuu3ZDrCMaoMmN+dQzeF1BMXQD+k+wsJ
         gsj0vAL3byHY9P59YTMwJtwOK8brJh897vO3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937001; x=1737541801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhgcFiioBCTJrsBu7R7SWfvrloYa7MHsggVE4kmGhcU=;
        b=JiqgdnuqkGBJe0EVPcUkUs82lytyOxPHvWJ6G9FkQ3jHv6UzczKmf9KS/uVeylQUMo
         uglq8YGxelCjrsKckwC8jg8Y6AvQu3ajII7yQTnptKi6TLg0O3ddAuTW0/68q3I7h1w4
         W2uuXItkPWQpJk7rwMZuN2WuFScK0BzMKN+P5zW46XFluyuxmYcUREHyTdh5UPPQpjUK
         HIL/CQKYJtuG8wPPzP6cibWyxuQFJKLDvc2B1WyUfZr/Wj9CF4ATnRDaIOUXytY3jh2X
         bs1VYy/I1abiYwr0hRJtWINt9UwIcn6lAonfQjwxIa4ugcQ9ra5AaDK1fg5FEuEFkwKT
         FeKA==
X-Forwarded-Encrypted: i=1; AJvYcCUnovrDoxWVqUDnvXDvzpkIaV3GcP8GssbuAOKGzhixh5m3A4KrmbXqRTsK5DiUQe1cDYb0CgU1czQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6EqAwdHmwb8qbBdoWZSpIEX1l9S33PL6zcEh0IJgrJg0LPuhv
	Wxgd0JQ4QbghB6JiV6vHz9YpslHjGbEQIistejtD363IJk1qzMM5W0omriL76Q==
X-Gm-Gg: ASbGncv3yF7vIsAdP8BO+Nc37z3BoryRJS5uYS7X3AI1XL1Pkaxi0bHVq8Xgy0QUDmi
	7rRgayBJIHe3dCR7cuhC+5H8IAtKfyN1o6gF5jm8enVOMw30zwxhllpIlAb6OqPppVMlvBqXVRk
	LyCldTmHQZYqe50UYklH/45daIVsKNwMQcNAGIOUoFFCjgHnTQSDlwLrNfndY7qnxMFBs5REz0Q
	ec110H6S6KfczF2A/aVCGjNKJ+gHJBzcxiyKIEuujmPmD1hwek0BEXUKnzgnPIZ/LSpd+cA2NFK
	mC1IaDP27AM4+cYhUgVEW9kPhoqVGXFRLTnFwbZPeDQ7QA==
X-Google-Smtp-Source: AGHT+IHLfLGJgEZ5SLuPyAwiMbZYFQ09flUH9NUqIb9U6+ujP8obt/r8pocQNQyqRrN/HC41+DPhzg==
X-Received: by 2002:a05:6a00:9a7:b0:725:ebab:bb2e with SMTP id d2e1a72fcca58-72d21f64e2amr37892682b3a.11.1736937001568;
        Wed, 15 Jan 2025 02:30:01 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (134.90.125.34.bc.googleusercontent.com. [34.125.90.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e591sm8835195b3a.126.2025.01.15.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:30:01 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH v13 2/3] netdev-genl: run ynl-regen to fix CFI failure
Date: Wed, 15 Jan 2025 02:29:49 -0800
Message-ID: <20250115102950.563615-3-dualli@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250115102950.563615-1-dualli@chromium.org>
References: <20250115102950.563615-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

The ynl-gen tool has been updated to generate trampolines for sock-priv
to fix the CFI failure. Run ynl-regen to apply the fix to netdev-genl.

Signed-off-by: Li Li <dualli@google.com>
---
 net/core/netdev-genl-gen.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index a89cbd8d87c3..996ac6a449eb 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -197,6 +197,16 @@ static const struct genl_multicast_group netdev_nl_mcgrps[] = {
 	[NETDEV_NLGRP_PAGE_POOL] = { "page-pool", },
 };
 
+static void __netdev_nl_sock_priv_init(void *priv)
+{
+	netdev_nl_sock_priv_init(priv);
+}
+
+static void __netdev_nl_sock_priv_destroy(void *priv)
+{
+	netdev_nl_sock_priv_destroy(priv);
+}
+
 struct genl_family netdev_nl_family __ro_after_init = {
 	.name		= NETDEV_FAMILY_NAME,
 	.version	= NETDEV_FAMILY_VERSION,
@@ -208,6 +218,6 @@ struct genl_family netdev_nl_family __ro_after_init = {
 	.mcgrps		= netdev_nl_mcgrps,
 	.n_mcgrps	= ARRAY_SIZE(netdev_nl_mcgrps),
 	.sock_priv_size	= sizeof(struct list_head),
-	.sock_priv_init	= (void *)netdev_nl_sock_priv_init,
-	.sock_priv_destroy = (void *)netdev_nl_sock_priv_destroy,
+	.sock_priv_init	= __netdev_nl_sock_priv_init,
+	.sock_priv_destroy = __netdev_nl_sock_priv_destroy,
 };
-- 
2.48.0.rc2.279.g1de40edade-goog

