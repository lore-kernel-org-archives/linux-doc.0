Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939222;
	b=P8IGXGEks3JPaBeeFhNJyaDhvxQnPy2leS6XaUhOKS6r9meb90kmRPV6+ZlOmILLmdHK
	 1tnITC1nnYSBWgkbSGXcTPokPjUk8zOCtjI7dehiuRHA848FBqnlz5rD+SwATtOjvQRJV
	 mrf1LBz/ZkT1tqyfX7btbz2QQ5xMR3gllDNb3n1GNjm1CBVDfh4ZAsqQYGG667TwmIaiT
	 nuo8e3U26e4of5M88e53YkgRIcVQeAYLGtQlDNNh56hT5T1ftxPUaVlSKjQytu2U7PG0h
	 9m4yZfIq9Y1tmHA9ClREpXAPRKpA1pbze2WLf1YfykrmvM6CKeGt9EdT8p11V8AiL9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=Pnn3p8o62tQaYYs5wTDqtvH4v2uIW9OVpclgHsdsmtDeRqmMbK2BzbKIdCcZ4M86FZax
	 fXCTYksXJqPAUKjjQ4slSDciPDouV3MH5YoSZ1b04+vE8VQoYcUJEZEEvwAyFl+JxzCK8
	 gcf+AtnRJwon9LzqR37l63jlOSAgABpLh9XGxVX6QekYHDMRAhZ+zzik0wSU4L7M8jp88
	 lw3+Kngu9qsBIA9E4UQpsYRBG/bWMXBHX5mqh+T5ZF1sGcKdt7j0DrduKOaPjfhbxaxm1
	 foZWVlOLKoRjUYPl9j526SwzTnLE5OXGPKx8InJhwJ70ValO7h1aLz+98miHH9cl6Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F5606A8A9
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54F5606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c246c0c60so1303561d50.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939221; x=1795544021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=O+eNLKGizaKvCjcBFEPklrUdI6prwcylupkEF35VptnltgWqNEux7MOuHb+SDkx5jB
         O2YBkx70K56s4/CYCkiUSvGtyup8Lsx6SgYv0nnjy/nYnX15phR4QjgUy+4HIpn192gF
         kJ/5qnLgAvCPteGUvEgMXDzynLfgCneUUtyhyqT9ItC5tbMECcJW5nViiMWWqg5htRsK
         RdPzqrR+FATHhPikVmvkp08iBo2mqzvqGqqnkDbzguZ9r3QlGPxRnttdluSffAKHHH0u
         uvOVPqUyQmHk1gGbq9ONEY4DjkvDKZytgBIF7ddU81D5WDv3kwYq3MVRRANuE4pFuWOG
         FVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939221; x=1795544021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=o1bZE5jnt+eIuQ58ZSxMmQr5CVDOVC/2RoDVIEUIcwD1D6K8xy7DoGgnp25gLUxWip
         WOcBXUB8VjJ4bgYTTDAZ5nC/ui9KwN3U2z/t1XfSTBfp0Nfii0pIpYVemi1E+MgwC4lx
         Qk0Ee65E/rUhe+cZ9Za3uhoEUOvnnEwe57ndjssM3CgigrqSOH0B4ISe5Yy0uaIiRk3s
         xCmWD4gXqEBZMOhiSU/56j4pifUcRgIqy9xdjAsp70lWnVWaGvddXF2flI8vgEY+XHRk
         WFa94FXN9S7ePt1X0LHqImf2HozZbTw0yT1C7yvIFtKSG02DqrUCClcIcS3s1AgHuj6R
         pU5Q==
X-Forwarded-Encrypted: i=1; AL+hErG4/03HcbOaKipLjyDnnqLN9rJjwhsYlsGHwqOhhEo/xB5rFzOxmT7V8aP32xYRhdMG/efuyicZT9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qAzViePAGv1O5wgBPkxSAcaNHnHAGj/pHXyiqFNXg7hn85M/U
	JRF/3BObg2qXWM99ksVkipeF3VCII1FU99/BWUazgFcdT0cSy3oMNhUK
X-Gm-Gg: AZFdTZeNjqi0nSN0xm5clXXDVVbMbC3VB7s0C3baNnViYMp0BVKQVPmIq4OperTCWUa
	Gk/cKFFpGsoAbUtV5WsAOo1DXFIlxoeABs+nh+EsfFRYQ4ujalMYroFtYMKj6QEVj42KV+2YqG8
	a/cW8Ho88EtH8drKONbk/AfICXeSDI2G3Qws+MPeD0XEiXLx6HH+mMFoVut3DHuPHLDc9F9mWGV
	RvlSVBr202MFLjRkA0KKbErb/OTOjevmV5I1aZnTMufnjquLDIzEFyO0rd08ffiLBnmV0XKP6AB
	zhtYHt1JiZZcBY/F2KZK2jTlP26W7nVOM+dzBwGiwvAo63rdP+WKmjIoG4ma/CQhn6Edr2hVxLP
	yc+1koyANQbU0O8x+lhumiXi/hnbVlz02VqqdG48d/m/ZjuzRNG9QhALw+i1UfAHVmOjyLZ4m4p
	/XiKwmsCpbq5IYax8j4T06BuE1ACihXwVAikqwNHMGtVM0G2y4kacJX/7slqZLPiNuTJuM0lG3K
	5iU5ZI49B5wHA08P8exvJWYx9Sg+NEGe8eNoZeHP19mmcyrAeplQVc4A45dNK8L+yppQaQO2sFv
	+DqBSQ+zt3eQtmDJU+T/2lPpxRs/f/R2kcbDjg5pDJzmQyEZwIVviTBL3PW8uiC3EWgigXmPoRn
	W34R7hFu3o5LzxzROdDKzYqSw+3q7VqX1PvzpwdIkrv1z7TPvkiBeWaAdWSUibA4skvSRffQUnF
	925HIbw2IchmQv+fCyEoRl9RvKmM0nhvvPP3auMUU=
X-Received: by 2002:a05:690e:4894:10b0:677:c90f:46bf with SMTP id 956f58d0204a3-67dc7869e78mr1202178d50.17.1794939220704;
        Tue, 17 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3f284bdsm291489d50.3.2026.11.17.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:32 -0500
Subject: [PATCH v3 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPTY//i0pq3747akHGmzgvRFG/gWHTaQnx15YdojP
 tlTJjL/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaQGGGv9Iqi2oDCr
 /0brrgzSkd4LnS+st1+S2qf2cssukOjV95lI3hn9bcpUq5DX4xr3g3SE4tuD9z+bQP/CHXdu4uT
 itTuZdVywAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

