Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04F3ADBB4
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735767; cv=none; b=Qsz5pQj18kfztOmH6hHVM5qteF7fFEEk/QmI6amq/Nqm1tT468vUIvEHjJUEGmp7gTQcXftzNhCnE2xbIsBezEKynrgn0JH7udYp9upSQNzagiY+RDYi4Lbu/H+k/JNSdrnnhCyPvD/f9ia3uBGXQk72ARQyKPlN271Ljb5pSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735767; c=relaxed/simple;
	bh=rtw1I6+ZQwIhsJ1KAJ7coYMuQ5TqGSxTCkqUoPJfohw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=narjmO/S3LSp5s3tKPJfm/y3dWtYlkXzz3RMq0M+wGjYeyKO9Jf7IKwtALN0d1hO5jLLvTJtJGcT5CoczidXgSm3MZ8jZ/GR4HyttcNmsHkSyseJnUJBcYLWxaYqOWTwq2XkkFDB/Z0ivSEe6jG6cgASUKKTCRRTHzhqsjAjMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7xeKATe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7xeKATe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso897155e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735762; x=1787340562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPlwGzMzreFTOH2oIaycDj0Xnl8STIJ81ul4wFBoks0=;
        b=h7xeKATeduxjxa8W2gweEPuq3pMFlG9BxUDMfX0sUlvjmDtNFCN18BsIoA72bX8kKw
         pM8wDLMk7wwCtXYWEL9BU5Z9YQ0Ka2oP64jUSGaggt/7AxZClS/KdD5R3NyPR9h6Y9LQ
         My0KQWuP9RGHXiqQGlkqsBF0uZdCgmIJm7ahHFgXsVDmrG5LxXBAunl4DFbRkcWWSBXp
         AKcssnYaEYpXNkVtDOdpmdyLqV8ta8q4lpMo5RMW5c+UjXMeE0KTZY6mmdpJX7ucYbcE
         q4Nwde21YOkGHzFBrGGchSTgK/0Xj/wvkE8ORUUbADmyV2CNRHdWPCvK/QQYpzAlopv0
         WV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735762; x=1787340562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPlwGzMzreFTOH2oIaycDj0Xnl8STIJ81ul4wFBoks0=;
        b=J9LN2pTWQmH91phkyFA1lgGEStKWwlySbfgnWQzmaYtUAQJWgYGV2+tuF4MbnbyZYj
         vBQoaKLxzrmAbAEIj7lb24KAH0anH/U2R0iT6j8S+WwKQBHsICKa1JjNOWmh8DsjUWMZ
         SheYQch/LEXrOyU7kViAZBf091Tot6UF52jlLd7R7EkRCcCgEc3brWt8/h2hXprrrri+
         YM/lQamk06WUv+9XLSyy6K/PN+MPbkRRZ2NCQ34hxKj00WZM85x0Rcojot3RLhA144Tm
         52BudY22aVMzQ1OxfesmOAarx68TNyfBpTTyBa5WbwZR9uQ5I1tlwmBm7dRPx9ynTjN/
         nDNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq896m053Z3QFs7OXUEwsKOTM3ebSpHy7oPIAxSo3H/bXBphK13aCVUPfui11W4JLS26Lyuix2sZNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygm5Fw/FTqjFBHp89csn/79IMDA2gixjA2feoYLoJpHLwmiWVa
	W7qoG8lArjt3K3aS7P4VxhNwQxKkIOmXdy4ofFIZcikDTA7+Rv50WA9Ft62HzOx1rVr4RQ==
X-Gm-Gg: AR+sD12XuGJx71aESA2SPCeUND+myeCrpHShi8zgtvjqSql7mGIoA1Ayip+eVhzItp1
	CUi4xtnodfLSfHj1gscxeWqJx9bi036MzZD4UhFhiGMY/dH9VBqREfnlEalPlPIRx4quDBS/tHu
	TWgSCo7dcUu0IUix/S9BLDo431iML7r4z7Gsd8cXOprYBmG6bjtt8R0PdnLFNqwiCtd1XFx8+Rx
	P+DcZwd3ee7Q0kyPg7ktDG5rzC21JlBwVhVH0Me6o4vitPBn1JuSyRmvA0b8D5QCMGBDErjE6Df
	rsJOSxHyX8FOS8CCwy24j9yhfvHvlNF6BD1ZGTiLK73lNUn5Og4756752Yd5lvH5dGVjQdaWbne
	cGTYyCr9InYsfzOtEWO9qn0cDXV3jX3on8Ftjq1RSs4eRoj+bCsj7uVKB6dl2a+OQc0CguxgFsY
	4WTTedl0ttjjyp2mLJgo4a9aqEjJ4qaHUKcgD3l4h/NNK/PkgO090gSQ==
X-Received: by 2002:a05:600c:1395:b0:499:77de:78ba with SMTP id 5b1f17b1804b1-499879826b2mr57167795e9.2.1786735761874;
        Fri, 14 Aug 2026 12:29:21 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:391e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b2a87dsm67293475e9.15.2026.08.14.12.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:29:21 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 14 Aug 2026 20:28:52 +0100
Subject: [PATCH net-next v3 1/7] netconsole: add an address family to
 struct inet_addr
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-netcons_ipv6-v3-1-bc0915e8c75f@gmail.com>
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

netconsole_target stores a single 'bool ipv6' to denote the target's
address family. This makes it hard to detect conditions like "no address
set" or ipv4/ipv6 mixup between local_ip and remote_ip.

Add a 'family' field to inet_addr so each address stores its own address
family: AF_UNSPEC while unset, else AF_INET or AF_INET6.

Nothing reads the new field yet. The next patch switches the users over
and removes the bool. No functional change.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 24 +++++++++++++++---------
 include/linux/netpoll.h  | 10 +++++++---
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index b358e5c36735..432b66cf111a 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -225,7 +225,7 @@ struct netconsole_target {
 	bool			extended;
 	bool			release;
 	struct netpoll		np;
-	union inet_addr		local_ip, remote_ip;
+	struct inet_addr	local_ip, remote_ip;
 	bool			ipv6;
 	u16			local_port, remote_port;
 	u8			remote_mac[ETH_ALEN];
@@ -428,6 +428,7 @@ static int netcons_take_ipv6(struct netconsole_target *nt,
 				continue;
 			/* Got the IP, let's return */
 			nt->local_ip.in6 = ifp->addr;
+			nt->local_ip.family = AF_INET6;
 			err = 0;
 			break;
 		}
@@ -469,6 +470,7 @@ static int netcons_take_ipv4(struct netconsole_target *nt,
 	}
 
 	nt->local_ip.ip = ifa->ifa_local;
+	nt->local_ip.family = AF_INET;
 	np_info(np, "local IP %pI4\n", &nt->local_ip.ip);
 
 	return 0;
@@ -741,10 +743,10 @@ static void netconsole_print_banner(struct netconsole_target *nt)
 	np_info(np, "remote ethernet address %pM\n", nt->remote_mac);
 }
 
-/* Parse the string and populate the `inet_addr` union. Return 0 if IPv4 is
+/* Parse the string and populate the `inet_addr` struct. Return 0 if IPv4 is
  * populated, 1 if IPv6 is populated, and -1 upon failure.
  */
-static int netpoll_parse_ip_addr(const char *str, union inet_addr *addr)
+static int netpoll_parse_ip_addr(const char *str, struct inet_addr *addr)
 {
 	const char *end = NULL;
 	int len;
@@ -756,14 +758,18 @@ static int netpoll_parse_ip_addr(const char *str, union inet_addr *addr)
 	if (str[len - 1] == '\n')
 		len -= 1;
 
-	if (in4_pton(str, len, (void *)addr, -1, &end) > 0 &&
-	    (!end || *end == 0 || *end == '\n'))
+	if (in4_pton(str, len, (void *)&addr->ip, -1, &end) > 0 &&
+	    (!end || *end == 0 || *end == '\n')) {
+		addr->family = AF_INET;
 		return 0;
+	}
 
 	if (IS_ENABLED(CONFIG_IPV6) &&
-	    in6_pton(str, len, (void *)addr, -1, &end) > 0 &&
-	    (!end || *end == 0 || *end == '\n'))
+	    in6_pton(str, len, (void *)&addr->in6, -1, &end) > 0 &&
+	    (!end || *end == 0 || *end == '\n')) {
+		addr->family = AF_INET6;
 		return 1;
+	}
 
 	return -1;
 }
@@ -871,7 +877,7 @@ static ssize_t local_ip_show(struct config_item *item, char *buf)
 	if (nt->ipv6)
 		return sysfs_emit(buf, "%pI6c\n", &nt->local_ip.in6);
 	else
-		return sysfs_emit(buf, "%pI4\n", &nt->local_ip);
+		return sysfs_emit(buf, "%pI4\n", &nt->local_ip.ip);
 }
 
 static ssize_t remote_ip_show(struct config_item *item, char *buf)
@@ -881,7 +887,7 @@ static ssize_t remote_ip_show(struct config_item *item, char *buf)
 	if (nt->ipv6)
 		return sysfs_emit(buf, "%pI6c\n", &nt->remote_ip.in6);
 	else
-		return sysfs_emit(buf, "%pI4\n", &nt->remote_ip);
+		return sysfs_emit(buf, "%pI4\n", &nt->remote_ip.ip);
 }
 
 static ssize_t local_mac_show(struct config_item *item, char *buf)
diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index 1c6b1eec5efd..de97f001a0f9 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -16,9 +16,13 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
-union inet_addr {
-	__be32		ip;
-	struct in6_addr	in6;
+struct inet_addr {
+	/* Address family: AF_UNSPEC when unset, else AF_INET or AF_INET6 */
+	u8			family;
+	union {
+		__be32		ip;
+		struct in6_addr	in6;
+	};
 };
 
 struct netpoll {

-- 
2.55.0

