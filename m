Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C33AE195
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735771; cv=none; b=QuRK16D241f3FAtAF6MENunLZKnR1KiOBsfPrKPoW1203rILn3SuRS5O56VkL6wbeH+GRyZUO1otDwZAde5tNGAytEUrUmaGDBvmqjgzTniE5Aeu7vjpHI2bIlUz+t1nDB3IG6Qf0dK1cuoVWCqKHfuSOFuXm/sTpXJ3Y05ABLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735771; c=relaxed/simple;
	bh=kBJzSyEmLjLakSZnZLouxVwEm6diqgBCu9rGJL6ISg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCtipfhu7EqSlLKkaJ9VfHdpCXs4Vt9gJLZtge6QkKJVW6BFrmg9s97F/AXps2nAxvzZHx5/ZuwUF5WyPEgDjh9tKfBe5Rj2XUnnyLqHZkxpiqhT9KZAjClhrY1Yp5vWjtUgSdZb4XKtXcFi4icam0f+4etoWi34Mb8HRjUiBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQhQxQAj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQhQxQAj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495773ee3edso1077245e9.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735765; x=1787340565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=nQhQxQAj50QDlXwfugOusoaVSejLKu6fNoRQzRtgxmd5GBBAK0FsIVgRETaqN/zLWK
         7oqRAwe/gvQ4OkYBTTtykW0aLKWg0p/N7amG6BQ/nWfT8Zg7du0/5Jnw2P5HE9kW6HUQ
         O7VUnIdniG5AAF07J+sIUvBcFrCJzUUMDmGz6QgRKErtfPuoKb0cLqxzEtrtN5NBmcjV
         5MveECq/tFUyEqL9lvlr5xBcNPS1Wpy6b3u9ya3He8GfZu75E/pR1zcXuD0iWLz7OR7H
         maq2jbbbGdxdW5BW+AAsaSdswVk96kF5KDoHd8mOCXjjLVLjYogrnPxQXBYrtkzEiIvf
         uD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735765; x=1787340565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=BuCezAfceSvib+Ztxv0NacCvREfEddgIBgkLyqhJKfYBUlOE8B62r8OYbAcxqfyz+T
         iNrBrZZfRmf9H8c/0C3kR5zZFfi9+AwfjWIILNPcxsMltzdcs2zL2BCnT4VCUAT2Y47A
         wRqFYcY4bqBFwDMHmDxM4J0LAkQpd3OR1mkKb8YyjvgGrfVnNkZXeHArs3e3WQUe8zL+
         ydUz3UytkeUD6DayPJuv/PjzNkr6Ssoc+poAgR3+GWFWPIzD2h8KkiJ0ZGVw96ICItxZ
         QcXsG0nIiIU6MkN73fh4k5c8y+J1KO47b2/lvFKO7kFDkC6Fy80uTpKQOvJVJ3K4ozJ1
         YVFg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7glLHqGG2nZW7uOZTaLUGmU2qq5y/YWV1q8UzCDuWJd3FNRvRvwBNmmPZ30bW/e+Q2gPjzhvW5wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0T01DAW5io2l+DkMrGRy+wcA0zxH6ubeUlq9Dgz7eI1GEx9E0
	dzM44iTv1EkubcjuOd6NNu+8kgpg67wPeURv5yPTB7Lai+EZcPooVSBOZ3hlEBxSAekonw==
X-Gm-Gg: AR+sD11gairUm8X/1OD6sAEgZswmaFwBsqjr47B445E3PBP4dbAmfrVI3vMNyU1caGF
	y3SVk5m+sqeXZIQl9nZkvpSLThulN0S3vLZpAvQGGhsp++omEj41fLPGVCpKUfMnm2UfNXBHHfN
	ocCw5fyDzEL7AXPgMzcGkr1XXK9mspCLCmaEIYl1+wvH0ttsdeptVJZ7yZITljX0dRm+kOaAYkJ
	O8W+16gId0/ZYzOjGL7hKIGmkasqmUi5+VpLfOWKwhg+g0CgPsJglPjE53vVBjoFtfFhSp0XHyG
	w0aoL/+wZTtWuIaVAC8ZNxIjQG+1hx+r96od4/rneewKw877eg/Sd8DIvEVZaTcK/mRneEUensx
	/A5EeH40UgKljtOlplaq+44RIkXYfuFrbX2fGTFB47oS2/k8wBcUataEuLeMxXlpDCT4e0fz4Rl
	EF4Tp2jWu/qGLaDg6r0tA3ppApmtcibupRDVk78bn8mtk=
X-Received: by 2002:a05:600c:6206:b0:495:4126:1e55 with SMTP id 5b1f17b1804b1-499879543c7mr54501795e9.2.1786735765464;
        Fri, 14 Aug 2026 12:29:25 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:391e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b1d9fasm81666015e9.9.2026.08.14.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:29:25 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 14 Aug 2026 20:28:55 +0100
Subject: [PATCH net-next v3 4/7] netconsole: reject a target mixing IPv4
 and IPv6 addresses
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-netcons_ipv6-v3-4-bc0915e8c75f@gmail.com>
References: <20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com>
In-Reply-To: <20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The local_ip and remote_ip configfs attributes are written independently
and nothing stops a user from mixing ipv4 and ipv6. This leads to an
ipv4 address being zero-extended into an ipv6 header or an ipv6 address
being truncated to its first 4 bytes for an ipv4 header.

The command-line parser already refuses such a mismatch. This adds a
similar check when a dynamic target is being enabled.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 4af4f3039d4c..abcc8515ddd2 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -488,6 +488,12 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 		return -EDESTADDRREQ;
 	}
 
+	if (nt->local_ip.family != AF_UNSPEC &&
+	    nt->local_ip.family != nt->remote_ip.family) {
+		np_err(np, "local and remote IP address families differ, aborting\n");
+		return -EINVAL;
+	}
+
 	rtnl_lock();
 	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);

-- 
2.55.0

