Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068A2FC87E
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535043; cv=none; b=IPGR6w4KnU2AWYZMo8KtE/beUf6+8w9AuKB0QZ0zl011qSKRlTxCRpqPk0S/llNQ3R9YgLsMNZZ1KNPD/5obYhxaUvxOXiblZ/QRMGDNMqVZ81jJgoTsPljWVSg6w5Lo1a5X3fUEdA0GrLzSW1az1K9n2uvCJBj1uzhI7g2ybh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535043; c=relaxed/simple;
	bh=j+SwZchskS+hgocwMFiIRa8Uxuzs2JM1eZi5LFBUCrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIpLxSZXBMq+64pFT8HGEBx/UmTo+YBdJd42Tu7DkpqGjJtt9akRYcb4lfMfk++BVAdI7+IE/e0zwCPJsIIiT2lRTbFLKpw7uL8jb4IgBlpMEpkstNB6yLb6oALqz9NSHSG7AMrcE4H1IqIW9hVKRKHnQQeRd6hUpijFKSdPLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmu1dtDt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmu1dtDt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24457f581aeso41236675ad.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535040; x=1759139840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IkhyO4d7SmeNeYV0oRf0k44lMRfG/ikZaQ44KxKsTA=;
        b=Tmu1dtDtiWTlG0mIkf4/SJo0hm7L4R/iW1WJwcHBOq2eCy9e/L5HS+QV7LvFcfDwFh
         JUAdxrTmRpwmbQhyey3is0CfODlgZ8dHVYh/WdMMHdNp0LwCKex07eSD9XxEfYF9lkGt
         hAeUs7ErAgcoPMdPU0qcyg/0m/2IjW2rGYKd5X1K4yLbq9vN0vw+SGKVebaH5HYbrVOy
         QRxGUOLQQItZ56bsjD/ZftIoGffo8uaY3oi8UbsmJzEAqg2mNAV9xFdPeWqISue89TXL
         1+bF/NntDGo2Kx1jKJ/bnIEZrvOAkqljjp7Cq+6XU9g0kqiLK5uuydW+phLA+cGFAgUH
         J62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535040; x=1759139840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IkhyO4d7SmeNeYV0oRf0k44lMRfG/ikZaQ44KxKsTA=;
        b=wAUJXPXTNuyBS/e3uiXwv2v5ZFKOraC7FcSmsqJK5mfzL4xKLkq5tj9Q6qP3sbPwo0
         td8C0ymTkh4CJmwYFCt0fupRpk2dYWN26lU5hpVpx0fJrrSWhS9X7ye9HEq8Pb9+wlP9
         luWrFdN570EgtxjsEg4JBc/BcgdKt7oshsRRj9DY/WdMhVWX30VVRPLlDTozdKpMeoTd
         gZW30fg+CT6C0YXsMvOaM1RrvIj8n8cHpnI2pMK8qMG++NOlt/MQUaPNtUgnef+umgCy
         wmFcL1vl0ETP0ZRPk83PdpLXtXHalI/JCpXUSaMcz6BxOmSMaZAPTsN2qqbnQMz6OF+A
         m+qg==
X-Forwarded-Encrypted: i=1; AJvYcCVp1xJZk1rRDSZGFObxJyaPhSyqfocO2F8C9Rh5Jl3ps42uFjgklIaJM9emCbp2IgdC3ufMEwNv5jA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7UbTMQpmCfQNxXhMsTA9LdG7otfLv7zDuhGh9YzKL1mXZMLD
	TUOMS+vDAHfAWAQY8LXQeIocwSMelAqvjO2HBtddb9eioZkMvMYxLtIv
X-Gm-Gg: ASbGncuuvBRzLRDgZgIgo9BCl1TDu+BMp5a6xeeUR7n6tBq2+zBSlHRP1UhXbOn6Etn
	t4Zo3WzX+8R9LXsuoPcD+olBdZxAUooiSQyMVdXQhwIy6u3ni8wwMZbL7PS24/6YZ/6MpGEC1ui
	EqHjlus4yE6E8Ja1UDrWL/GVGrHRlwG7YhcRevAbJWqz7evHd2zdz1VeIwtZco4UDRMnPsCiHXM
	E0valzaigcfclHqfeAFWddFlHnqMSShGw6ZtzMAoQQJkrxr/IVpHVygjvEPXRaAnt5FRqtZ8la6
	QggLNLYhDQo1qgmnDHOO9bn5yx9tFM5xqFQw8FqAVEMtlrMyWRWfu79P4K6MZPUZ2rRRf2LkmWs
	eSJ7Xhje+3PA7sr3zSfCmPQ==
X-Google-Smtp-Source: AGHT+IE0L4SYOwQ/uM3LnAmOPCX9ygYee8Po6u3FqQ5+SV8o4TZTjmsp+YGsJEqc2WdyRLMWJne3sA==
X-Received: by 2002:a17:903:3d10:b0:269:4759:904b with SMTP id d9443c01a7336-269ba57eeecmr157896775ad.58.1758535040355;
        Mon, 22 Sep 2025 02:57:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bf96sm125292965ad.38.2025.09.22.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:57:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8F7E14220596; Mon, 22 Sep 2025 16:57:15 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 0/3] dns_resolver docs formatting cleanup
Date: Mon, 22 Sep 2025 16:56:45 +0700
Message-ID: <20250922095647.38390-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=580; i=bagasdotme@gmail.com; h=from:subject; bh=j+SwZchskS+hgocwMFiIRa8Uxuzs2JM1eZi5LFBUCrA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkXZdan7t05UVlVevWN9WlrEldqvZDpXhGh/1X6ea3vZ NY9zN0dHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIozeMDLuKDj3YpXowoPzW 1ScGoVL33lR+VWfjX/M/szb1nImL41eGf5o7f7qFlb+Jbt/ooxlwSV8ln+2T+mxlJbG6hRcYnlY acwEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are reST cleanups for DNS Resolver Module documentation. The shortlog
below should be self-explanatory.

Enjoy!

Bagas Sanjaya (3):
  net: dns_resolver: Use reST bullet list for features list
  net: dns_resolver: Move dns_query() explanation out of code block
  net: dns_resolver: Fix request-key cross-reference

 Documentation/networking/dns_resolver.rst | 53 +++++++++++------------
 1 file changed, 26 insertions(+), 27 deletions(-)


base-commit: 312e6f7676e63bbb9b81e5c68e580a9f776cc6f0
-- 
An old man doll... just what I always wanted! - Clara

