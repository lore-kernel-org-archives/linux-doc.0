Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1232D73B5
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990490; cv=none; b=uYuVd6T+ky31FY6aQ0rAQk9dclcu/jIxW0+bJCFLg+VyQPMeF/Sp5CZKfaNxbU71wkX0YVpoAZvmZbYj/l8pgNB0rX6pCGL+/zxYkSX1u9hnhzLeHoN12E557zLU8TUEXjoXs6HsxDZBgRw4EqduWoImg/Hu1C/Qa9d9Ywvljz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990490; c=relaxed/simple;
	bh=xYbBu2fMf0do2Y8PFkgmZ44ePl1qKHbhlD2bXGI6s6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZXAYk0s1wyPB95V+5ameuJlfSumaEHzTfbaVtuI2qkXZghCAlrDev+2FahsWjEX+3TrGUyWdS8+yoRK6nBgSSOszeH//YAg6sf01j5tSWu+nKmo6eB75C9h/cgC51y4BA5YlfQr9L0CTnqWlEggu1x20z99yti3U3xuz+VRB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2fT6k+o; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2fT6k+o"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso213029a91.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761990487; x=1762595287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDAfAMTS/DdBYBQoTuWYXo0/wYkGq/INrH1coTZQ7c0=;
        b=g2fT6k+oZRO33cDif/qtBO0hUpagFP88NJv7YeIcoz6wEmPQC8Fkz5Xh//Jf/BsZpD
         yjKMc5EOBrLPG1TtvBWSEtYMUMJ33HQpbsoXyR6Oco+3eDzZRVGyzZiSnCHe1mWdSwdq
         TGPnWj7YZ1ZfFNy+zRGfNK6ZZteKZ5CvG0wkrLhxfhMB3hQDtYHPAhqGhBV9iyVGJODQ
         q2mYkbMORflXRV5F0YdyMXrMv17VGVj9lWOzIfzl1O2ARTVYdzWqLs2ipqmTsU6Isqu+
         UhBmkjOXq5TJhLmexmpRsniCMkH5VLh5H1VfcvVKbaFtvdqM8w5QeT/DW70lEI9x1rpR
         DUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761990487; x=1762595287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDAfAMTS/DdBYBQoTuWYXo0/wYkGq/INrH1coTZQ7c0=;
        b=E3Gjcy5h6hB4gYjJHtDzecOaE1QSw0UdHl4SAB9/O6vdaAsgzNiGpBsVygO0ysmSKW
         knwNUVO8xTg9hQiXyv/0aoC3UH5Ucxs4dqEotKWkHIQ3/PERQ1xFefReSj93JSVIxgjp
         StgKJnNqI6hduAK4RlqRXetsgT49plifKomjMJTOvaqBffgLJjMrwvV6WGZ2AgMzYDSR
         r9PL6LzSEbYhwGTjF2yvBVdmw7kSk37Z3yvBvMbNVa4wvDF5ndWTgZJTlnkXoiNZ52Zb
         SC1ZDFdHiXYtZw+XBx91QneGKxYFIipTwtsWhw27VW5usc1mMzYs0Iq5mNGT9o1viVPC
         vnqg==
X-Forwarded-Encrypted: i=1; AJvYcCWsW4uyspwwgQL5nk3J7gg3BBFPg8iKNnnIOzMvJgQKZVEnHJ5RcA7qlbiEbUj292g4fYCmbh7zXf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4d7jnJdgODGen08BxTCbWJnsqY+bz868xJOAnslb/6kzu9iE
	/WWNAv+VDBIXTtiti/H+rHRT8xjIl09o1eUkpUnwt7PY7KMul0WwNl4d
X-Gm-Gg: ASbGncv86j/hBbeQe9fvY1McJQY+4efXwimMEF1nIt9bQYJftpbaxX45h+wRH2Sg7oP
	/ojiDL8XsuWp83H61nWnFYMOsm81dvcPeCU+SEr0L45T3i2YeJU0QaowPSuF9tH5s57MTEANvSP
	h0A9GHFrdo41iA2C0lXGws7svKN5fXFkI+z3ku+NBJ5pBTUJu9dPDIpkNPtcOeZ5ctGPHktczNP
	SNW/X05OFLTDEqLIHoJqQt7YxVJyMvFgbEUUNFkOGc9/hkHe0Fy0lUP/5YHQM32hfFP7kV1qwQj
	GnbGbuALLD1Vi2QxUrZpRznoi4/0ptGe03B89Ig43q9V9ezdM2TVqDRK4x8ebdgIGu7yL2GG63P
	0iYAnFMKBGtou4uQ9+1J+b1EXjp8rL4TaJtD0YcyCHJFhhL1uaCGLqVZzmHOTb8UNCIusbXkH1r
	w24JyjU7L6s5U=
X-Google-Smtp-Source: AGHT+IGy1cfZoCwULFLYqE6Bb4moe4uWpY+1tqcKqVLgBJzC6ePt7PtJtSMS5a4wl0/9ag5xmaq1CA==
X-Received: by 2002:a17:90b:388e:b0:340:7f2b:3e33 with SMTP id 98e67ed59e1d1-34082fd9d6amr9568347a91.16.1761990487435;
        Sat, 01 Nov 2025 02:48:07 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f28fe27sm2913985a91.5.2025.11.01.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:48:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 028DE42229A6; Sat, 01 Nov 2025 16:47:57 +0700 (WIB)
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
Subject: [PATCH net-next v2 8/8] MAINTAINERS: Add entry for XFRM documentation
Date: Sat,  1 Nov 2025 16:47:44 +0700
Message-ID: <20251101094744.46932-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251101094744.46932-1-bagasdotme@gmail.com>
References: <20251101094744.46932-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=bagasdotme@gmail.com; h=from:subject; bh=xYbBu2fMf0do2Y8PFkgmZ44ePl1qKHbhlD2bXGI6s6k=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms1/IS30YlyQdeeefsdyyyIUi2ScFp/n2boy4bDJ++c vDY4XW1o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABMp12NkOLTuH3cC+9Ic75nq nhmql56nLqmPn1HWynJ4ub6j0vfsOoZ/VgUsHxc1P1ooG1Cg077nzM21FZmbzMoq8//pTp++/OZ pRgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

XFRM patches are supposed to be sent to maintainers under "NETWORKING
[IPSEC]" heading, but it doesn't cover XFRM docs yet. Add the entry.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ab7e87462993b..6d2906b2600376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18051,6 +18051,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git
+F:	Documentation/networking/xfrm/
 F:	include/net/xfrm.h
 F:	include/uapi/linux/xfrm.h
 F:	net/ipv4/ah4.c
-- 
An old man doll... just what I always wanted! - Clara

