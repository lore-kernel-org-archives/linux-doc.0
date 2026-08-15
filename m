Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5911E5207
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786757587; cv=none; b=dYhuZ6JS1KUKNHy57dUdkOS5nxSDIUW9UWYEoMya91p9B8bgeMguQwyQMH23Lf/gnQeWsbDhd7bd/L5DmhWnXAUpSkztXGTWt0L48WroV3Dzw0A/N+SbDojhTXNXIzlnw4oB5fF4FjswJMzLKkvs+s8QqSh/Mv+1nFbUJp2AQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786757587; c=relaxed/simple;
	bh=k5v9YMbjNbSDDOOGUT/GdP8HfTxzzdlrDdwtaQ4IVr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqymKb7MEztSR7PA+dXopbX6y2SsKb7Ik/x7BbtKyxk1jSgvg4Cc+U7kQEIE4qVj9l6l/QQncRNmjMeeSeXm9iAE7ZATsBKf+Vj7NO9uXPygSC1sEEftt/5T1rZ5GU/AAH25AidVraU/n22R2dXho7hlJuCrY3XZDluEHVKxWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knRa3gu4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knRa3gu4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso19452935e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786757584; x=1787362384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIGYB4s+r27dzXsvVBxWuaiKhOOlGAnsc8iJP12SM18=;
        b=knRa3gu4IJLqvEV49+J/h2US2KsqLW68pQepMRpFuoL2Fz+9QI0FxWl0uBxIzIEzZ6
         9S/eH3KfZrYTxjW8vO99ieK4D7J+0xj4e9PlZgawwOtsM+i7QbWD37z92cVJ06DiGpwQ
         hDrntog23N/4o/51/LEqRArElEKfCou5316daAS8yDD0MoA30heWyO0swlz4SiqWGCoa
         +HLBaKTwfxa4qe79Ns4aBS3bt9AtaOl+hmXuaAYQRa/7zOqI40bUS7nYmjWbWCbooPbV
         MIvpfFD8+ZJqt3jVzX3QIy/CX2JrgX0WdnYT+K3OEKQngrMUy2w3CK8BP5/rELyd526/
         h3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786757584; x=1787362384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIGYB4s+r27dzXsvVBxWuaiKhOOlGAnsc8iJP12SM18=;
        b=siZCU2zycbS7tyFrFqwpEUUvg6sd9Va0qeKBqwjy1IHEOeivmVOPR/GJJn0GENh/0p
         kLnPvasSIKqMVnrnLUlsuzdJ8MBPEvpzijc4yRpOXD+5Kw4QmLmIAYEd22nM94SmEW9A
         Vi8J1gZXc+eh4wSkw0mcxNqrXJhPiPX0v9LXFFekT8NXLicro8AJG7PW0ReK4GvnW8kF
         J8fA6CkQb5k4NyL9Hbl+0tmcB6PCtKGH1WMu7sMtHe8hFoKJ3unGMCsZOavxe0G3oK9V
         3O2w2stfPHJsA2fnT+IP5bosipCzkst6n29JhkDpxKXP5lRjeV9QHx6k40clFa9FcE73
         155A==
X-Forwarded-Encrypted: i=1; AHgh+RpUvUwD0k3d8bPI/tFu0KBlw2+rCS0TjuvseG4D/Bgt060wDEDuCjbFrPiUKdQA/wsN5CCCmLYO9yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuR84VWSkXaYjOp8J0ECvoHhUomik8riXR1gYqldanFhQVOIYt
	YmbpJxegcIYxUfb4nP/bdM8k8JpU5rBRJxjzRiIR9Hd1H6ktPDPf1ov9
X-Gm-Gg: AR+sD10tPZFZcMtWZHrguHc76sW7Cdhb1DCPKjUP7SRjKu1pRwsQyVvcZoHs9BY1oxI
	RVvGf9Bdr4CAiMWZnyx4+AdzZuU5iwKq77m+c1uzPmA8FNZBzKrURlR9ZH3NpZjH4Gxc69Izf+i
	Ef4GhnNTSnCtMqXtcEfGGF88qCy+DWIj2J0V7ebfbtsJ4ehj8jyAlHRzSNmamzQe1ngdUdPXE7A
	MDXk5TiRxki5cutAUlj4GdnHbM7E2WjT3/Aw5ej0AOi1i4U1YtJJ9Aua3kh4lOlXvMPjWHfCsaN
	zS9kaXVE4eT6E/Nfod9jDz2ApZySVOakxdyFPiU93xctJ0RZHGiPzvwXBm9It+dneoHrl1ZRYEd
	L2HVFeZGyqzx7xB14N+YZGKnu5yZVCP3SpYit2iUf8WmAzkBl1KUhGHbi6Wq0NcSf87JEURaP24
	9yu3SWyNlpDGfOvndrMGtUpfYT7Z7ogNjDNLDyDiLAc4ixvgXOd7V8qX2m5lTeaR1CitzP4t6ws
	A69SLFzU54wrfTejAFrpcFNE9mPIRpsnFFVyQNt68DLVvGJO1d1X9zA9oc1zPYK5Gchqv6y5LRn
	uVDGOIOeJQIMxgrpefB0vzXTYn6MFex5qvF57PisS0gjAcHtY06fydyIGPibt4FXR3Tg
X-Received: by 2002:a05:600c:b99:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-49987929903mr135321985e9.2.1786757584407;
        Fri, 14 Aug 2026 18:33:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d7d-f301-9495-44ec-73e6-1be7.310.pool.telefonica.de. [2a02:3100:9d7d:f301:9495:44ec:73e6:1be7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b1a31esm110672885e9.2.2026.08.14.18.33.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 18:33:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net_shaper: fix kernel-doc list indentation
Date: Sat, 15 Aug 2026 03:32:28 +0200
Message-Id: <64f428350ec1450adcd0607f54f30d27a42f129c.1786751700.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1786751700.git.kmehltretter@gmail.com>
References: <cover.1786751700.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Docutils 0.22.4 reports:

  Documentation/networking/kapi:107:
  ../include/net/net_shaper.h:82:
  ERROR: Unexpected indentation.

Add the required blank line and correct the list indentation.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/net/net_shaper.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/net/net_shaper.h b/include/net/net_shaper.h
index 05cb625b0fe54..330517a1cb5c2 100644
--- a/include/net/net_shaper.h
+++ b/include/net/net_shaper.h
@@ -80,10 +80,11 @@ struct net_shaper {
  * disallowed at the uAPI level will never be made at the driver level.
  * The shaper core performs automatic reparenting and cleanup, generating
  * additional calls. Notably:
- *  - @group calls in the driver facing API may have nodes as leaves (user is
- *    only allowed to construct groups with queues as leaves)
- *  - @group calls may update leaf's parent if the parent is about
- *    to be removed (re-parenting nodes explicitly is not supported in the uAPI)
+ *
+ * - @group calls in the driver facing API may have nodes as leaves (user is
+ *   only allowed to construct groups with queues as leaves)
+ * - @group calls may update leaf's parent if the parent is about
+ *   to be removed (re-parenting nodes explicitly is not supported in the uAPI)
  *
  * Implicit creation
  * -----------------
-- 
2.53.0
