Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EE27C84E
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134673; cv=none; b=EamXLp569XqfIGIhm2M+FMEPNouia5LA8It2dkC8/OoefJ20gznmkrFr/k1kiYvkHqRamLVeiQtYmjISXN3prq52dmV9yyEXEmx7l+UrXs0ce+Gt4ZQ6C72Awceg1VIjD3SCQMlU8SuQZ1Dt34U5qeuuvudeYUNQMCU9FvWInWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134673; c=relaxed/simple;
	bh=sfgU5y2QPjvrAXbG+U0LiiWgUg/Fuf6oZn2j1UBM6ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wd5ELSMBsvxrkZriCrDzxpps9kRBxsIlk9jt/pMwccL7bN+64zZbUC0fRgnsFYi2pYZb0S6JzREiJ4Zu84CFYjAEISvmv5CyfXgQUGomk2IosXjaHK+T0MFejchV+7EPN0Lfiu34Znz6hFa4j5Pxy8A19tr9vfIZMZP/WZluT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lES07R3Y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lES07R3Y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-294fe7c2e69so33817465ad.0
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 17:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762134670; x=1762739470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0sO15jizAVsKQGPETfERnCJBpOXGRp0v1lRQCXQwiw=;
        b=lES07R3YbE8ojmo+4SEozXLt2VsYvvanu32C1uE5lWszukD4GmT9gbkr4XHUGTTB+q
         oTHYwj0IYh3UglEzdTrMq3L0aKtGZoRhnlhDnJZ+jogu6GZzIUTCdTUNn2Tc9iN0P4vN
         +EskWGSSTJr+HUYkAu7b0HJlmV63schH2kUfn0bO+mJo0dGtc6lZWhd3N5NsqPQcn/XH
         mhTOOGdKiE2BqxCuRcs3t3U3r9jkSGiQGS6evh3/cav4cGfd2ieTK5I+xqMhvm55z7JV
         deM4VuvjWLGzTzR6WLaXul0hOkl804lXBhy+K/tYE3dtosvn6pZJ+NNg2T34i9HKaylm
         tvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762134670; x=1762739470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0sO15jizAVsKQGPETfERnCJBpOXGRp0v1lRQCXQwiw=;
        b=f5yjt8SOsoRrndkdPoWpiorL0MVHo04QMyCCJJyzJYLdrNOaC5XP6oTneHsosryXfa
         9QA7WU/j2zBe2PJPR/TIS33fTgcQpk4E3gnW81WdTXNIJHDRoCCfzweM5VTcqYFrsBpN
         0CPG/Vk2ntDLfWny2l3bt2/dmzxpXq+V4QL/+FeO6d4MANbANpno392BDQ32T/J/9VKh
         N0G3R0FBHzVAInoqBnUjWZk1ATUUIc3lxFBgnqaVe7hudoXEWfmUjbxxHhvoL+Ob8pqR
         RAlAixOmw9fhqnPxuAW1ZdQUFI421PGnV1MId3V7bdo9J3Pipr5MfGAntq8OT5OJBitq
         MCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKmIEVbNX1ZPcXGmF/Wa9PiMrA6uXKRLJBTVTsI60NliVlldUQad98sTLFTYxwdYIiCf42vGhL1wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcuRnLUSIGDEYDDMrHf1Fjj1VH+3bBleB6qYXcdJDSBYm2QRs9
	PXtignJYKhTM4cf2q+H/YwFGNmeBDNqYMiyGFq7BJMUf7Kscd4xw4IkT
X-Gm-Gg: ASbGncsKxP6ZpRwZxBdY1sIrEzY4wELOG6eshsRE7uGU8lZ0uW8hqep63gIIGDRYnAJ
	w+ycV44xhFi2bH2pLgSYerGnFgKKYhR29XhrbLiRpWApBWUnBwqjp2W4pcFpBsW2tQ4MdnMoaty
	a/4656KYIt6EZcQ3jDclZuug1879YB8QUVU0OTBlc33eyk7gOVl0wwUYntcSR2FXL7lSRGRpx24
	N5tKG8km50oedvj0+GuxwutUyS/MlY5RHRFDKq/KVeHxItqKEezYmnUoHjgaNZeZCGS+bbHNc+4
	f/3bkaUerBf1Har1ozJ4IkzjiGtsfpafe6DB4OTlqAvEQr63SCKZ3gXsPWM8/L0lw9HRcC3+Ejf
	UsEgaFnUWzZViXU//3v2KltMci6YvVGuCZh9PvfsPLWcBmSpnpSZy8wWxd0pt/S54LDS90tG9Yg
	uztS3Fm3Lx/f5i365rX5lmaw==
X-Google-Smtp-Source: AGHT+IGnO7VQHFBrQJzosLohIa8HzbwgIqW4t6VCicsh6dui2sLEi2qdtR2544cc3QnT7CIjAJoUOA==
X-Received: by 2002:a17:902:d492:b0:295:b490:94bb with SMTP id d9443c01a7336-295b49094fdmr18206025ad.50.1762134669825;
        Sun, 02 Nov 2025 17:51:09 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa2a7bsm8311062a12.12.2025.11.02.17.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 17:51:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 45B99426D9CE; Mon, 03 Nov 2025 08:50:59 +0700 (WIB)
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
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v3 6/9] Documentation: xfrm_sysctl: Trim trailing colon in section heading
Date: Mon,  3 Nov 2025 08:50:27 +0700
Message-ID: <20251103015029.17018-8-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103015029.17018-2-bagasdotme@gmail.com>
References: <20251103015029.17018-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=bagasdotme@gmail.com; h=from:subject; bh=sfgU5y2QPjvrAXbG+U0LiiWgUg/Fuf6oZn2j1UBM6ow=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkcnJUHzKNE3jJLCJxdMFPJ4sHmd2mL7svNrNyrf9eyr zapjkG/o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP5VsbI8E3ba7Huh0sHTE+U 9LpIdE589K2XoXLy342sni8WCen7NjH8L6qftth175q1P6Zbr+gLEWg/3clvWCgurPhy6pyeigX X2AE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

The sole section heading ("/proc/sys/net/core/xfrm_* Variables") has
trailing colon. Trim it.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_sysctl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/xfrm_sysctl.rst b/Documentation/networking/xfrm_sysctl.rst
index 47b9bbdd017977..7d0c4b17c0bdf1 100644
--- a/Documentation/networking/xfrm_sysctl.rst
+++ b/Documentation/networking/xfrm_sysctl.rst
@@ -4,8 +4,8 @@
 XFRM Syscall
 ============
 
-/proc/sys/net/core/xfrm_* Variables:
-====================================
+/proc/sys/net/core/xfrm_* Variables
+===================================
 
 xfrm_acq_expires - INTEGER
 	default 30 - hard timeout in seconds for acquire requests
-- 
An old man doll... just what I always wanted! - Clara

