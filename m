Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244A4EE84E
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452806; cv=none; b=mSlrK5nJtQXAE//w4MjEepJKhnUYGvfaz4kNM6JI2WR46oMWBOqW95HPiBzinOxA7jlh976XfaCSRgB9kGNUb+9RFrg/HDHTPVdBPCJXrv9HOYM3/CTyVgf+AeYTUxI5G9OwrUSEj90vUioq6pQpB2qxXAzGFFEJHWgXtSDUuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452806; c=relaxed/simple;
	bh=kBJzSyEmLjLakSZnZLouxVwEm6diqgBCu9rGJL6ISg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBD11mM7LZpMshFwPqblmwBxhL1tBPMrw14lyiqTBxXygRrfTEHHnLVNHIAqaLXlUYYHmhsrePs8b59jBRJBQ+DKP77opm3VLO1RI6cz3Bzbx4Ozqpr9ln4XeODwN6RRgSTbTuHcrfB2OozIoKWUjMNEPASBeqI84v/z4sVc+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc7f/p4y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc7f/p4y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so112965e9.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452801; x=1789057601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=oc7f/p4ycYSeJZq/ApumBgE94t7ct3L0XjrCjVMppIHcm89knibG5pK0VWGDJ1a1WD
         MPshdCY++DaqNmWPA2EeizgXe4g+DGOeuTZovng2txpZbwNVtu0/sPkZjCr1c44wy5km
         dzuCR7U8+w87ioiFRromnGegYQZRFoLFTMA01loem4IGUh6RqI1UnhZ9+xl8P5f5i0jW
         nJ0AfUANKGm7tle/3Glct18N6uffOo03ZnIQG8SRsQFv4OVsVqn2kxOcg1WCyOGBMbwW
         a9xcAM9P+zKvYNNP0uk7kmalu/Z9lcmlXr6l/uUcbF4TIobO4n1TvEQU7Borev6drPAx
         LS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452801; x=1789057601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsNoDHPNAuzZJbO+idLSbliILF62YDBTYT8M6gLpDM=;
        b=k1quNSVu8CEXYa0YpZoDgtk88/I6O76y0+nIr2x/tG7J9TQo8neKfKWl9kvwusWMV0
         ArYUJ/OpHz/3cbTwaC8cFrQkDQYO7rT+gKTXrXnZAwDNRBv89nQ0ouFpIoEkyOJDHPIw
         02CvJx2HdtN5Bgx4qpgwr9R3v6oH0c/2k5NDXl/YeWWuun/ArMSlIB7glif/B4ODMvKh
         jensPrwb854AT34gRCyiuQDyPHL5cjOgypj4y3a6TCUb9kwnPpG1CxlWm4/X/nrnRwIA
         rhetMFeroFRtfMNT4lk7bmIbAs4OiutQqK+ZBK3wgEe5wy9xBUhQJ31/Myll7n5dE5rU
         R7Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxqFoDy1ii0tGHqauE6PQTJeMuJfUpkwXmKwb5FNv8/xPczcVHfgf++9g+8WhQikv6zMel9Em0OsWo=@vger.kernel.org
X-Gm-Message-State: AFuF++kfHeFbvrCiAM4dqdajoXWfuGckkkyK7BClwVxCM3K3Rde3xiwf
	6O/sh0kfC0+KHu/vCeCIXK48GXHEjjz55WJN+dsDjc8sY/lA3WBr48kl
X-Gm-Gg: AYBFou1wfRjfiN2JwH2phvHOypERn8bW2K6VAnfUPnLWafSf6nJIfxvwRbhMSXt0L9N
	CER2eHTU1JNmUyf6RShU9BKy6yg/hP6fZ1ZOtLr6Q2eTSQrPe5WVALBDZXabIbHlXO5JiLLSnKo
	n9k+TfY0DZ3+sF71tHl+H4eWDzCn4DsKExIO4JIaQpJ2sokTxKJiY8ZKj+1HjXLf4xvbhEgJ3Xr
	0fgV65O2msd/wQ7hEwzZ9Os/ZOb5k7bJc1UE8IRFmO0TuGEEnsdjbKfuZ60zE2l6261aSY0Ut+7
	5J5bmaGLuGtoGoCWhRkxgxHpw2zywgLM9zuVkhJLpPEh8hLnGuCHW2IjGKb6aV87JUtQ4st8gx0
	Wtq9va6q3R8eOrvxnXFYtNTZHPG061od9hJ7bueA+xfgrKfXJjZfR0e4BBCNFMNWHnrce+6qLLd
	wP1kFa+ewb6lBT86tfzsa39kDQtDT7YhvWWSek7wutAjw=
X-Received: by 2002:a05:600c:83c4:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49ce580365emr108669425e9.1.1788452800655;
        Thu, 03 Sep 2026 09:26:40 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm57273715e9.7.2026.09.03.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:39 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 03 Sep 2026 17:26:03 +0100
Subject: [PATCH net-next v4 4/7] netconsole: reject a target mixing IPv4
 and IPv6 addresses
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-netcons_ipv6-v4-4-bdd183c844d3@gmail.com>
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

