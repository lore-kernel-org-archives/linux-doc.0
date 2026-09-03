Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5C4EC672
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452803; cv=none; b=N7ktbASt6KkYRQ1c41a2rXW95jPi1VKqnIjzGvqdUYJuuyhtgWuFYKrlyVepuxN9GwPY/wU/JQ3DthGyg6Gr85KAna7tKlxpQ4dXDzaMBN6RYUaIbRPJ/sYrlPiGT38hCRxfSu0Oc1hBTU6YPXCowL0nvDPZ5oK0m/FnWkUnu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452803; c=relaxed/simple;
	bh=DYUlMEbqUsURMwexmCD/xyIYznB1QWbXqfysKMihGio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C89uIFqjVo7qIIewsM06u4nwHdbPFcIOVgOyGEU6L5p/IFCWxlIjK54RigNl1muP6wG5S3S+OPwIdLdciNnWzHHvIeV0U+T1JQfaf0cRmUDf0n83glYCDLGlM+4jlznGCyX6IIgfCo7Mh2Z5fhyY8SFkh2MVHpiavp5Sdo4/fKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1eDp+c9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1eDp+c9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484369c7233so5961f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452799; x=1789057599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij1m4fx/1NIyn8kVtLRSbyCjXHfqmQiafcPU+9XENi0=;
        b=X1eDp+c9LpDb+C4jG83P/0woUIRxrOoJ9wSMOy+kTPzIJu8/cXVJ84N1znE1xOs1ks
         WSMuA+YFAkcGI+jI8LXj/L44QLwE2cM5kHygRL6nS2VQLqA6k4zftwT54E5PAVUoFitU
         YGAt5YNIoUuS6Rd9zQN2BYMzN9pw+yyTfLGjae7xEN/hPMQRjxCbn9kq6mhwLhClU6lX
         qZMW1FHf1SJvfi1ZZwuLWXGmckXWLs1btW359NYOWnt72zxudytk8YeAhrJrwUf2A9H4
         W5HDE1D1bSIynoYTj5ftph2jxpetrTbl3p8NmX+iT+HP25YxS6MCmoSXDVc/FVrQQnMs
         GMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452799; x=1789057599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij1m4fx/1NIyn8kVtLRSbyCjXHfqmQiafcPU+9XENi0=;
        b=i15NTQTYdcLVcaMHKBfVBAr9wGCMhy27n+EuUG/+IEQO5qHAQeIrT5+0FZFk0XwSJC
         2rnNuraLH7j5ZSi7h+V4bmX7Bp/UlFmI4ugBhQQYnZ+EoQVcGTGc1jN/pdLHBL+1aCBK
         21a+E3GgeqJOOQYLcuY6wqqrlzszCwg08VnZnJ0O9h3z6sImP1fx7cU0nZivNCgw74G4
         DC9ZkyFHKiDNJ4Hg/NfHOaSmCwc+WvP4aia6Kb6dFykYqNISsLgYNF9jDFwxc8yprLaH
         7zUsUQPgljQekErOGgGnrMuRA0w8AYAmHNDg7cmT6ws4Ld1/punpnTw1/+sHEqa8yBu/
         MbYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6/MDO/Dk3xULNxfPaBKOhl1J4ZVgRpZQEssObpqN8vHGKM1Nxllv+cUdq8rqZcUmE0d3ik5/MaA=@vger.kernel.org
X-Gm-Message-State: AFuF++l8jgJ6wSsV8Ad9kvuPMSpaXn4juXVbwWnX/cvKcGAj15PqepZl
	MqVTMmXwM60ipO1z6W3aZUwC3I1f/DhTHCNhYUCDa2L7PbbalsHS0CW+
X-Gm-Gg: AYBFou3L6NJsMdvBPzSLBDUI+4gioeYi7uaXiF6crRaqxazpGY1LW3MUQdfPIJysyPb
	x7UuQdLY31hTwuHQF+9/xxqfpLHHQ8N9biHaqSuR/YZLwmp2PW1HXdZDGZPh1rmMxUv/h66Eb1N
	qS0VKeYH0ec5b5js4L2DC3dluCLBWog2bMuV9hhW9YATQ1OQMFPMYO1sVG7WMAaZXtlZdhbZkHn
	0SFNriETaNVQZVyPWgADklyh0sxiHUZh2wmMSiSwQOATWnn9SUHtKmBlS+cO9Vjuocd7jB/lO6W
	JTBLbARFIx++BB/T+VvykDeEYEgiBykzoh6BV/qk7e0B0EkOn8BZaOMofukL2OgacIGPMTQtAPu
	mYS6i3TiQgpmXO+eN5K2MFcQokFlXv0aBeNuU41pSopm09SQvpfWi6V4+EDREriVOatP4c38GNy
	NaTKB9joIVQBQj45lfG1Xkp1VrQHYC6xG8xJKLgjUCi4GLnLNrF1bmJA==
X-Received: by 2002:a05:6000:41c7:b0:46d:ff8a:c8e6 with SMTP id ffacd0b85a97d-4858707c531mr165606f8f.1.1788452798868;
        Thu, 03 Sep 2026 09:26:38 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm14672574f8f.16.2026.09.03.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:38 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 03 Sep 2026 17:26:02 +0100
Subject: [PATCH net-next v4 3/7] netconsole: reject enabling a target with
 no remote IP address
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-netcons_ipv6-v4-3-bdd183c844d3@gmail.com>
References: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
In-Reply-To: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The command-line path already requires a remote address, but if a user
creates a dynamic target and enables it without setting a remote
address, we currently try sending netconsole traffic to "0.0.0.0".

Refuse to enable a target if the remote address is unset.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 351754d53cf9..4af4f3039d4c 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -483,6 +483,11 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 	bool ip_overwritten = false;
 	int err;
 
+	if (nt->remote_ip.family == AF_UNSPEC) {
+		np_err(np, "remote IP address not configured, aborting\n");
+		return -EDESTADDRREQ;
+	}
+
 	rtnl_lock();
 	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);

-- 
2.55.0

