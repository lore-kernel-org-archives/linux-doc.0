Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B162F60AD
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535044; cv=none; b=VwQURsSY0u2t2H1IPWI98s/oRKUsT2N4Susc4eop6I73POF/+ec6fy24yLms54DAaFvNKQsFRDrlvxXzUU4AO4p9NXxSroOo9QHuNehfA5cL0P1MX9JPdFYQmAxeSNKiUzTPXl1PhBC/KE5sZF33V232QC5qs3st/P1TU8Sc97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535044; c=relaxed/simple;
	bh=kmQ+U8Enw1LU4PehAdujiEV2CtRVJfOvPpSqaxAbVhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJITUVcmLO8S9aectIL/v9rR95vSiqLnsavPdIDYMTwwQO/N13aokMX4Rz7Yq5gyqPESfMVNijA9iJ5pDffYMKCNceOHVW4cm3uz071IkKXj5DB51wGgIX8GtPvU0Jp0sjVeOS114dlZd911t8402ScgBOiG1SIjPu0TVu6FiUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG6vfFvI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG6vfFvI"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b54a2ab01ffso2917735a12.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535042; x=1759139842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeB3FT7O6G7iODwiTHw497b3MyFZuWsXQP1LvFOC/Bk=;
        b=dG6vfFvIE1MRHIvxLMW0PTtStGICfLiXpkzT/CjoaD8ZLOAJ6AHleyaQ0u828lW9+g
         Jf1ulaz7C8QUM0+VE7b+j2S+wYlsfro5/sp0cZlwczfBMN0T1bTpDM804XkvpUdZ8g2M
         X50S0R1v+TUOxmjQYxTuQpbLRMDd+PnU21VTGu0AKUc9Z3p57TaIXiBGp8sn4126UzFk
         HUqBzXJPSlBHjQUMrn8PDw7ZmwQwK/+k1hd4MFIoUHqSFatQFbGtiZhfZN/exi1/piTg
         w0eoXX260LF3tQHWZl+jFPhwwpD891yVvbW2PEWYvIMw4GEE8P36Qpw0MOXCj5C/Ekv8
         rWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535042; x=1759139842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeB3FT7O6G7iODwiTHw497b3MyFZuWsXQP1LvFOC/Bk=;
        b=KRm7AnqYh+yWIOKX3eatByH6MfuP89GkTbhWugVc2taLk6u0S5EXOzYNTxRTaFJFsi
         zKI3+IQAfB32XIKA5hbehBJYNKVOYHzWhFdI3AEFk/NbElir9t/gsURjiCaLV4yBfZg4
         2RQjPy3ogVdIuAeEHaF4cnBlk7HSsYmjfUmHuu/OdsasvxIlwDw539d9HjGdmHPycEta
         tG9LqmP3GiTrBiLYYrEoNlea1l69PBM0QK/8wXvSnksvhanXmrRciZnZF/t+3aDUQkP5
         wvOiTsOmHUtqhIGxqNbbaBnsGEHtx+ur7PvCgDtCDTRCNPkCk9L0g5tt+Sge23fy05oA
         78mA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ARXGxW64q43H1qu1ytg9FZzRprVpuMJgtrcqOQyAn2c8he1hSxBVn531lUi6EVOL0mk3t9XTKIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3MyXdfWHdM32f2vuaYLSbkCAgMmhX4QXHhSySwZicMOxI1mE
	cV/ev+AJhan3PIZPxqRzoZC3rfCgy6ZElGogqnHtpQQFxbPHPJfv0KXo
X-Gm-Gg: ASbGncvOc7dh0WEfYpkFfkHUfzG/F23Ad3AIWBeHJvB8sqELnfllLnsGYZLfQUXouKa
	8p+ZX9zDRZ4C+Gm66Ki7E/DPTijqElFyLW6NzpfHbhYZ3NepRlhGIHSPh3WnRlNoPFFN6Lrre6K
	M65mVtQEAwAKUxv7SKneRD3vq81RmVNZDzfAVTzuYhamusP0O8I5s34Adc62r+mOlYrZQqUltet
	gylNpLf2iVsIgf7utbgNvP4aMkHMZWj65COL1I6TDHYEXW4C5n7f6NqSMcGUjSIlALru9PEvuEL
	VwruZPOoDrtPLOd5YedzNCNiARb74vXA3m8Q8APzNDjY8wDT8Yed8KtN/Y08ZCN+ff/LV9M0ddO
	nxR9LDW+UfiXzOTsrLgV3Zg==
X-Google-Smtp-Source: AGHT+IEoygJmzEYO44daSPyeFaTBpaCMbE2ZfuMa7RzKKwvhLfvLaCA1dISw2KFcv2rO+bW3GUDBuw==
X-Received: by 2002:a17:90b:3888:b0:32b:c9fc:8aa2 with SMTP id 98e67ed59e1d1-3309834c048mr15642705a91.20.1758535042341;
        Mon, 22 Sep 2025 02:57:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306db47817sm6030258a91.4.2025.09.22.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:57:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C0AAF41A2EDE; Mon, 22 Sep 2025 16:57:15 +0700 (WIB)
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
Subject: [PATCH net-next 1/3] net: dns_resolver: Use reST bullet list for features list
Date: Mon, 22 Sep 2025 16:56:46 +0700
Message-ID: <20250922095647.38390-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922095647.38390-2-bagasdotme@gmail.com>
References: <20250922095647.38390-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=bagasdotme@gmail.com; h=from:subject; bh=kmQ+U8Enw1LU4PehAdujiEV2CtRVJfOvPpSqaxAbVhE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkXZbb+nzixgEMs8fhJifu7PA9GTpZYkve3Sq1e+PPhp LifCgyPOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRJeqMDP+ro2fO17gVnPi0 cOlZm9xHHPOWui84fJ5Tfs9BKbZ2BxuG/yXLjHJv5bzO1o5f92za1Wlfb296waOufrCSt2Fe2xK 242wA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Features overview list uses an asterisk in parentheses (``(*)``)
as bullet list marker, which isn't supported by Sphinx as proper
bullet. Replace it with just asterisk.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/dns_resolver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index c0364f7070af84..5cec37bedf9950 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -25,11 +25,11 @@ These routines must be supported by userspace tools dns.upcall, cifs.upcall and
 request-key.  It is under development and does not yet provide the full feature
 set.  The features it does support include:
 
- (*) Implements the dns_resolver key_type to contact userspace.
+ * Implements the dns_resolver key_type to contact userspace.
 
 It does not yet support the following AFS features:
 
- (*) Dns query support for AFSDB resource record.
+ * DNS query support for AFSDB resource record.
 
 This code is extracted from the CIFS filesystem.
 
-- 
An old man doll... just what I always wanted! - Clara

