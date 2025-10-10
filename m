Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33012F5485
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105953; cv=none; b=FUUIjqVhVr1bb/np7c5OzTdaLjIsngKxGTgNOyu/Gy3+VOkmvOtwh+A0IGhkyrptSEAmNmo0sGw2PjIMFXrdNCIOqvZWs+NUGcHlrTqqy0tHYbvdndTBW5PQCymH4D3P9eY27y3Fy7jZJRnAeccKHuBs0DZjYJMY4fbeAVeL3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105953; c=relaxed/simple;
	bh=SPOylD0UaKBQHbCUfCQBcubUCMyJuC+tLQSqqrzYCcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PmHi+EtzO7FAw8d+XwPbFomn+GoTE+IkIF5EdaIW5IUNb5twrmmB38qlU9b9NFqzbCwxTN5YADrCLnEk+pKTh4UAyjpyFfW+JM50GX2x2LOZnAyacBCH68cFciAt/lcnoLvw59tuEC4lyTzj1/LEtZjmncH1dtePnJkQ2dHSVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=Wgvuotc1; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="Wgvuotc1"
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-46e610dc064so1182915e9.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1760105950; x=1760710750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlWb4+txxu6x/nhjmhQpYHjb0oHA17miMwJw2TwxCuk=;
        b=Wgvuotc15Dz5yUNfqyyPgV3yi/zz3l6XIPB8g2bhzMPTp/Rbq54YEoBbs005vIM5VI
         gJ6tfpgN5EHQCJ5OZiTA1zjnVlNNQJu9YWxsmIX/+RlgaFvz6TzKZq4KiO+D0AmpAVlO
         uMr8fMWFOVPcwits6q4WJB2n41tl970bXP+9i7yYzsvyhyrojzvyERabES5aUfKLB5u/
         LoJu26pDqe4S3zaLeiEdcpck12DLiqCBCXNHH2U+WlsenxcJ+CYNgWu9Av5Qg3V88z89
         S5mySEic40xjcDpxA8AaepByEHmWemt0FxIScNemgowHxjiacYoGhhK8jbfeWKhmHhaz
         HN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105950; x=1760710750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlWb4+txxu6x/nhjmhQpYHjb0oHA17miMwJw2TwxCuk=;
        b=WcGllkKZXy3LlxYZNvl7REbKu1AtqtEl3fhQXj83sBkIwbZSP/PFjqMyZ0KDaIpGPe
         Qx0cU2Qnh4bjkM03Anp2JlGmUdkooiPv8/MPE3q4VrgZQ6Mct+t7OS3DQwbnBCVX02ju
         BXWRQxHUorZsq6iQfu/aTpcpMGDgat7zGB8RULJFZCVtxezbzRLqXgsTCEMVGAv+mV6V
         ElyNWPh5b6edaO+/hn8d7n1tfpvHd0sk4ccfv3tqoj8nkVtiHtUq+xjzJi/53H8P1XjO
         HindKBRq8CDQt/EllQ+GCSOfSXiHx7beK3QZ0xVeLkIhtBPZupoRvjdjsJZ3IB4lhy9S
         hm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUV3ONbDKKsW2rHD3l45692gQ+/4QetJTVh3euNjkVQJ4AJFcEqyWC/+7ZSONkVMkrv/kyfiPNDtkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwyLR3qjY1dChG4p2BgLbXdNwEGE1TeHp+um3/N00Qhql9SAo
	hopSPTZujl2+eZc5WsJNXy+AxAGd+JjUc0HArYEVfAU7GQS8zaktrcRNPGro6O0Jjp0nCrEtkSd
	2Mm5GB+OtU0sh5NU5IqhLkn03u93FsicINK7U
X-Gm-Gg: ASbGncvs/JIttSWDNvcNJa/8VJn/vzo2Xo7iNhbdYIeRrKVOHAtZAjBT0J0WCmzlNUY
	DQHhzEmNQ7lSlouz/JhWdT7JHbxqIZxAV0B3vjbo3rQIGQEWdBOK3vV4SWJynw2a4+3TZqBNK2K
	dnaXUzDQcaYgaMXGcDyVv8EpTKI3IrBueolj2gMMyiWliuilHTcigKr/ZqM1SEqszTsNo/+6lx7
	ofUB+ot4a9J2rekh60hY8XL/1N95I3L/a4yB8MvUaJibZ88F1bcqpfB+37RusLP+qiWD56Uabl+
	KzLKmQIPaSnpll0EeyDtx+9sr90iPLAsL++CutklgERq/JIP2N2dIQaemylEi72uwwVTvAWOQYl
	1X+d70+AZw540uueQazc=
X-Google-Smtp-Source: AGHT+IHFkN/mvg6HC0PK3GEKH0ek9Vxj+iNl6q/UUX0WE9TzVDELhe6EQ0mza6QcbGYKUX3sZEPDBOMPW+i1
X-Received: by 2002:a05:600c:4745:b0:46e:36f9:c57e with SMTP id 5b1f17b1804b1-46fa9b07766mr45525825e9.5.1760105949909;
        Fri, 10 Oct 2025 07:19:09 -0700 (PDT)
Received: from smtpservice.6wind.com ([185.13.181.2])
        by smtp-relay.gmail.com with ESMTP id ffacd0b85a97d-426ce5c9bb2sm169351f8f.26.2025.10.10.07.19.09;
        Fri, 10 Oct 2025 07:19:09 -0700 (PDT)
X-Relaying-Domain: 6wind.com
Received: from bretzel (bretzel.dev.6wind.com [10.17.1.57])
	by smtpservice.6wind.com (Postfix) with ESMTPS id ABE5A13EBF;
	Fri, 10 Oct 2025 16:19:09 +0200 (CEST)
Received: from dichtel by bretzel with local (Exim 4.94.2)
	(envelope-from <nicolas.dichtel@6wind.com>)
	id 1v7Dxd-00Fhou-EK; Fri, 10 Oct 2025 16:19:09 +0200
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
To: David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Philippe Guibert <philippe.guibert@6wind.com>
Subject: [PATCH net] doc: fix seg6_flowlabel path
Date: Fri, 10 Oct 2025 16:18:59 +0200
Message-ID: <20251010141859.3743353-1-nicolas.dichtel@6wind.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sysctl is not per interface; it's global per netns.

Fixes: 292ecd9f5a94 ("doc: move seg6_flowlabel to seg6-sysctl.rst")
Reported-by: Philippe Guibert <philippe.guibert@6wind.com>
Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/networking/seg6-sysctl.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/networking/seg6-sysctl.rst b/Documentation/networking/seg6-sysctl.rst
index 07c20e470baf..1b6af4779be1 100644
--- a/Documentation/networking/seg6-sysctl.rst
+++ b/Documentation/networking/seg6-sysctl.rst
@@ -25,6 +25,9 @@ seg6_require_hmac - INTEGER
 
 	Default is 0.
 
+/proc/sys/net/ipv6/seg6_* variables:
+====================================
+
 seg6_flowlabel - INTEGER
 	Controls the behaviour of computing the flowlabel of outer
 	IPv6 header in case of SR T.encaps
-- 
2.47.1

