Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB71ACEB5
	for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568660; cv=none; b=jakr3lxBKpd5sDA3iIHQ6nTltBkiJxIrJ4rgX2UnYEN5aR2VxDDlCRwYth+HVBn7PzW86EP9IxzFHBH3ptyy1jkTgFNkgkZlhhAKsngkzD7jdbig99zUHkJf8ZhJnzrfkOg+qFolbZkqIqMjhNvbuccoBmbHZVanrbfnDTtCun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568660; c=relaxed/simple;
	bh=7H5NeV/Cd9MbRtA6mmk+DcOGx5EEmgZqhra692U74/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unCfk7AWjiQ39zNM5SG+RXSkdUVTBrfNTjEG4Mf8NnLBAbW/o1jk8sZRBp2x+mI1ceMyD0OaGfG9DMxmStcUCgiNKCpk5V3sRAdNMXFdQzTKm+lENHvZ8IxlcdQywemJEYgU7NqX3rt0SXbCWerTZ3vfp7lIHnWijGuYmakyi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F2pCbso4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F2pCbso4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so12329878a12.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 06:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735568656; x=1736173456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxGAZwLqgzTlNCxgVSyrh1FCKX+2hwF4QSuh41Pzwn4=;
        b=F2pCbso4fTKJut25cIsUett+6uVsD+w3MBBrUy0O+asB+40+PjgPxWc/8y6pZa5zou
         3NToNpgOP4avrnCCxSRTiLFAid/L7CaeFSvtx6VdB4eBNuec35LAHEkBPdx/cGIHdH35
         IE58uw6RX78S+CpbavIUHKZl6iLhUb5R3CE7XJ0RF3FhBnA04BZdJ4D76BuuknTWiaYS
         EjBxPvBvq7hFfDk33DtxXskgJgtyTkbiSGWsawsH+8dSr0n9IcK2jG9PNUPp81PdR7Vm
         738HCrfX0/BHoXZCnbQbDVsgpcRs/Xeln+NNgRPCk35lvwYW43tooUpRGNtVAyPIBwkz
         sXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568656; x=1736173456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxGAZwLqgzTlNCxgVSyrh1FCKX+2hwF4QSuh41Pzwn4=;
        b=IqqaAsgHpJczzKo18ewI0vB3fOK/opeUcprNDI5bCS8ckXWTnsnZ8ljZiObNvTidrb
         qgkg/9sW8rd2BnxzdhQR6oMNNmMm6hoQz1ycCCobnmK6tYOLpuLKBsAIUXmiyHVfNlnc
         8zi+ejjnIazcd6+txlfyDy45XNMYjoZBqWCm2v1R2Kc8E8FKJvrqw+q7dDcq99t5bCOE
         N3BLjv1UsHj3ekLNE6IsM/5JcZ1iW5cK4kWsvAev3Zyy5Lv1MgDEeZVk/4MGow7fhbxa
         pXsVzxrVg6J6/pipE3kAlbZqV+q4qYhfuXCLtTKyHQD+gISUpK3GBvbkyJEp2OC+j/4z
         agGw==
X-Forwarded-Encrypted: i=1; AJvYcCV0sJ3UVSApqGV1IpzwZHrTbs1mo+PRnjF+BPNetPWz3LBkORm3EIJOOgnViPix/MnSUjRRkTQ5rdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfSIX9zOwdd+tVDnkPhe9fsPI0D5OQiF8Q6W642n3pZdSQsIQ
	w3MvPW2PrL1c1l+geTyg2VoME3svxwypPSQs0zQ3k8fyxuCqg/fkWAjR+eh2GjA=
X-Gm-Gg: ASbGncvbLisKVa7ZJRwfu49P1ifYkYZc/+84SzqFGYkCdP4hQZhpNoJmSp60hGes+tO
	Mgj/NH2h7KeKfOyTusm/kTD2VP4g44/73d9pN52VBxUHFxO1k+JzxuGBaa9eFYEDt9ERSqL9Tfg
	NHBHq/wQX8ULWF2jP/kSe8sEZ3b17CDDLAYK/I77gLj0kgYNN+yU5RKQSNoHwkKkkG7liRJlRjP
	4FAPl/Nt4lSGCD3Lm6CaHRg+v84EPfqqM77j57eO9RxZg2mODLUMxHDYIk2Y2TTsGIW/mP2MD6V
	H5w8HSHerQ==
X-Google-Smtp-Source: AGHT+IFXCO7/R+hV99Zloto/k//1v9ZXKgxYxFO5PKomrRxzwp7CGxOMNf+XNgwBH6mUUdnCkmU/VQ==
X-Received: by 2002:a05:6402:358f:b0:5d3:e63c:7d71 with SMTP id 4fb4d7f45d1cf-5d81dd90636mr28573490a12.11.1735568656369;
        Mon, 30 Dec 2024 06:24:16 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c94csm14729504a12.85.2024.12.30.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:24:16 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] doc: module: DEFAULT_SYMBOL_NAMESPACE must be defined before #includes
Date: Mon, 30 Dec 2024 15:24:00 +0100
Message-ID: <20241230142357.3203913-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
References: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=7H5NeV/Cd9MbRtA6mmk+DcOGx5EEmgZqhra692U74/Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBncq0DEyW5r15ek2cUo+yeDb7/RlHgMR5AkHUWU /nJw3CnZ+CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ3KtAwAKCRCPgPtYfRL+ TnvaB/wIr0tyALQw7nPSOaKZnX7O3LLCFd9mtrabBuY7wS9And9XNgH74alto5gS7I1ZSvTktb4 oI1EpQ41YpUA3Bc9kS1ix6uH8QMfaR5gjrRfSOp0rgdpwc+ae82+5kHm4OwTGEBHXxnFZ4tEuGK tXk4j8WHsv0OtQLWwvnbUyoscqzB2diKy2zPLiO1SAdTyjbFO4qq1QY+4SoMfTphoswNcyX0zjL efD2eUHciVlWMdiD4ZfEg9ejnvUiT+EUVBfR4TUVaVP35G/bd/xDBKe8ER9b6Y4yefmENMU3TIU cp9jmHeOOZy5dbrXdYC8zW7D2/K6FTDRle6kbBP2mje4p09e
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The definition of EXPORT_SYMBOL et al depends on
DEFAULT_SYMBOL_NAMESPACE. So DEFAULT_SYMBOL_NAMESPACE must already be
available when <linux/export.h> is parsed.

Also when defined that early there is no need for an #undef, so drop
that from the usage example.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/linux-i2c/Z09bp9uMzwXRLXuF@smile.fi.intel.com/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org
---
 Documentation/core-api/symbol-namespaces.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 473d025657fd..06f766a6aab2 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -78,11 +78,10 @@ as this argument has preference over a default symbol namespace.
 A second option to define the default namespace is directly in the compilation
 unit as preprocessor statement. The above example would then read::
 
-	#undef  DEFAULT_SYMBOL_NAMESPACE
 	#define DEFAULT_SYMBOL_NAMESPACE "USB_COMMON"
 
-within the corresponding compilation unit before any EXPORT_SYMBOL macro is
-used.
+within the corresponding compilation unit before the #include for
+<linux/export.h>. Typically it's placed before the first #include statement.
 
 3. How to use Symbols exported in Namespaces
 ============================================
-- 
2.45.2

