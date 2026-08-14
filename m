Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862E3ACA7C
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735775; cv=none; b=MIFdGUwVN35tb0XYOtPIfNBWCiYHBLTnj2jq2IUDHs9TjG1cH1wpwVfFEmFUShGNPJeQLViU6TYRnHNCG1uhjQNbzH3OlXVvwMkc10hqWI8jXK44rnz3NTAoAM8zxkzjCd3vuf5d+I8pMvTBYrO6ZUa9TAP9HhWDb7b2qEYdbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735775; c=relaxed/simple;
	bh=9YHOe5z+ssvaM23jtJhGeLvjomXezj8HIDuK2w3BBE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8myHYVC7MQGjlAAxwGdU44c+801PL/JsPHZEXaBgtvT1r9C3rBWyW7HqeTyMNQmK/y8YBbM9KWq/9EnzvnBgvbSWW6OvBu26/UzHOu+69BnpkkIO2cHrAJVKA+6K7F8kkkDVOV2MeUG24iL/TUr5fELi5c0L9ReP3O2fk1VWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLHc3i+w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLHc3i+w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495773ee3edso1077335e9.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735768; x=1787340568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SznL2xfveGEa7B/Oh0KOrdfcfg8AH0BShY6f4yHqRwo=;
        b=VLHc3i+w6NJiqacf5goLpgq1+cCY/8CeUcOKIrSxWFKiZ/Jxe1C0x1d/bpVclsJN6E
         En1h6CdPIK+Xh4X1fV6yBW3g6Kkg/zlUEX4aAO9FpxWFVA0J9/UhjgOIOPL8w2hwgfA9
         NvagfUIcKdJT9vJQQL/pLDoCD+uvqlgMM7FpsCcvDt4LpVz+tZstYPTCoriTQYy2Ohnm
         5kxkxQyyfVa7qZJ4ToHIUOJVgm51JCpgsqmVLiwMReVKz42orah/QP3jGltyWYJlyQUq
         JHRFNQxryco1rX5vG4RWuhjLIGwyQEgU9+NgSRT4FDhPsTbQYcgG41kNOKT0qvqjdJQi
         f1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735768; x=1787340568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SznL2xfveGEa7B/Oh0KOrdfcfg8AH0BShY6f4yHqRwo=;
        b=lrAcolIWufVkaidt+VPq069mX3mg0+tHsX2BJ82lJRTJR8zBKKWmYOOO71G/qLobnX
         /Sbo6gkbV77gFsfNau1hmFvaEhJWN2ji8cIz39TR5mH39XcemUg1gVSCxaK2K6e1zTww
         Zt4ntPBnoRdywsJjRsTO0SaIFe3DqY2gwmvacnQQdkfGNsEJ7wGWbWkWxFYkCFmuDUQP
         oGiX7EBLYr7gKhWRckrLjDGlWDoy43q3s8bTX1EXPndmlCELCNCsIzI3BIhjSitag2uh
         6NpaNy613KGW2lAicy1uFzlrlzeTd8pjpgttuGwtHtEMNqBlU2G4fTHLiDh2Wio4aAvP
         dqZg==
X-Forwarded-Encrypted: i=1; AHgh+RpcaApMSfydWMvwSH9NV6Wj2hcp6xZo6JkcNLhk98e/BCYn0w1vXBhQ2N/4t6WCP4w1SJDrodFwcOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSKS9Xadex0KLI265eOxRReCc11FQfmACLD7m7HET09hhlYdw
	zWImC8L+waZSkG4M0+fwjskY6rB1Umr9E/LurtdlSmCnpcMiLdXQokN/y4z69IOFiOYjcQ==
X-Gm-Gg: AR+sD12+pJesLMTJYburUxoIoEKIDoACk7j2bJhzSYj8S8FpVwCMwrrITOxdmR/nrb4
	sR/K0xW1FffchRaE9n84AoZ25iOhcpm20xCJ4qWiunlngvpVhBtwEGpys6vuZJbfJwxISUyK63P
	z9soU4XltWynkhqEP65V9gxSZHaqm+GdqfNU1Y2s4yOdRFCFO9yXhUwcw74sxMuvxR+V7AgZgO4
	XJDEsvCeoxQCoUaS84Ft3hzPB0ua4eaiiEl6xnZMoYddxcoGC38vuqTZDL04hPgpysuWXT/tf9+
	UgILywo+8F95YGaz7UaQUnOrxY+QfSj1IFgt6vsT7qULZppEiLnMvyAnKTwZUTJayICqPoOFciE
	jWbsu9GaR/P/iq+9mIju5nAMts6ZSHGHJWTlyuEHFsBwkjo8fL6mg97Z9tRdzgp22goCfJupZJ4
	CtXI5xr+K+J5rYOO27qQeIODlqUIrqLWtmHoE2ZE4YII6KKOhAKec0Wg==
X-Received: by 2002:a05:600c:6206:b0:495:4126:1e55 with SMTP id 5b1f17b1804b1-499879543c7mr54502765e9.2.1786735767744;
        Fri, 14 Aug 2026 12:29:27 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:391e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b203cfsm68508525e9.3.2026.08.14.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:29:27 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 14 Aug 2026 20:28:57 +0100
Subject: [PATCH net-next v3 6/7] netconsole: move struct inet_addr into
 netconsole.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-netcons_ipv6-v3-6-bc0915e8c75f@gmail.com>
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

The struct inet_addr lives in netpoll.h, but since commit a1116396476f
("netconsole: move local_ip/remote_ip/ipv6 to netconsole_target") the
only user is netconsole. Move the definition into netconsole.c

Suggested-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 9 +++++++++
 include/linux/netpoll.h  | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 1f18d0a7d2dd..267254f046de 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -151,6 +151,15 @@ enum target_state {
 	STATE_DEACTIVATED,
 };
 
+struct inet_addr {
+	/* Address family: AF_UNSPEC when unset, else AF_INET or AF_INET6 */
+	u8			family;
+	union {
+		__be32		ip;
+		struct in6_addr	in6;
+	};
+};
+
 /**
  * struct netcons_userdata - Formatted userdata payload of a target.
  * @rcu:	Used to free the payload after a grace period.
diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index de97f001a0f9..ec0821a5b02d 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -16,15 +16,6 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
-struct inet_addr {
-	/* Address family: AF_UNSPEC when unset, else AF_INET or AF_INET6 */
-	u8			family;
-	union {
-		__be32		ip;
-		struct in6_addr	in6;
-	};
-};
-
 struct netpoll {
 	struct net_device *dev;
 	netdevice_tracker dev_tracker;

-- 
2.55.0

