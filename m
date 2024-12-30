Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42B1AA1C9
	for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568657; cv=none; b=ue2njfdJ8ZTQ+LTN6iHofCl8E7np3Hkp56ksoTqAolIkdbnZliiHdaUwsm6SXdam+Fxt99k9l8nnHiIV1qDkhP+OvK7zmIGP7rT6FidR+r7CpUd2vH8XYjwdTxqsHZPIrwS/W4UzNqxvPjSDXyDOpgYwDU1wG1BHauOb//S0gHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568657; c=relaxed/simple;
	bh=oiJix/tgmbChwa9na2GrYW7aeE2jDNQ7OEhTDeyXwd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y6AuaFF/ZgAEF+oeRHuK/8VkAVaCVZE8DOZlmaZyt//qflxdlq2vyV4T0ga/QrEF7WAmiLqKttDDKdPDc8YJ75P56OPlrcDYPUdYqrGHOr31tqH2b5silVs5YlTRzexBcyZ81XBOlVZFWiET/hzlL6SrNWuOb929UzcfSJYpbA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F/oYG3Zy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F/oYG3Zy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeecbb7309so823915166b.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 06:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735568653; x=1736173453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uknHr3hp3ezkmFiUp5ZQdm4USPKD1WgCs/kZMmwq0Y=;
        b=F/oYG3ZyskxiqWAxPaBMkBTDZY6+j9ZIt/FX2NdwCg/NKDdS7zu/3dtK6hBFpk6xQ1
         zYWXAHHRcmsdk3i6tEL+rS60mKf+lEX7ulVegag0nvBqoc4/zmf6HVMgVT96K9WDn79p
         aJIRaJOkvNv7B4yP1SQubUYQkPCdFJX9iPsS4aGSUqIYBZv06P90mYQYN0/CCzFQiFET
         HEIkkVTEQlReWKaZwZB8A2IDU84JlYu2bGZhF/c1iwPy0r5nGV/7VoEbjarZjkl4gIga
         mF9AyGZRGXe73HNVItw5Z8g7CVgi694d8QQGKZEM+VJKGz1eLJpztqQiYGavdWhzwyt9
         pVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568653; x=1736173453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uknHr3hp3ezkmFiUp5ZQdm4USPKD1WgCs/kZMmwq0Y=;
        b=B+kfSa/9cGtP6BkSZ4LnmcMAxLnZLA/RCZGdunvCZlRBZFlssg7lI0Jep3Aby1spuR
         rmdvYXyVpkG8TxI6PSGPM1w+EbAXeoAJ/cBQVhHZThRlJVeU7dqW9SbqSbIN1jQDF+Vq
         2j3JRjOxGuM74oNil+ZCB2ShDYMYXWwn1HE3NQ84ByxPL5/2+82vck7Ae5F01n5Fslb1
         8GoxOGBMxlRLuZ9EtbdD5IxipUi8YRymfZWcEjGX8sjcUfucZp3aIk10a1bm0Iq1EIRC
         Q/kNJ43DOPWCq63WhMUxeBGqObgmePUGhqDci8sULUpXC62BByfqDIPkmsabpkKAbOBR
         7SCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+1TSFuFiy4paFeDg6JRUAREPd3SVlWcLPx3rMtIhcLnVGAFERlFnlCZ8po5/R/lwyIcvjHxKcDAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Pes7XJ0v+yOBLmQSoXqDeZzpsL1HiCW7tnAf78rdve8RDwOb
	nykfBHqPft4SLxXbHYtFz+q1wKnTIvktbuBD2mF5X8t+N1SB1dLl0cAhqqPRC4Y=
X-Gm-Gg: ASbGncsk7AgszwSIE01iOzsaKClm5qbPPO+vKcqU9OrY1BiCmEIdCiE0bt8BOnNzkbq
	7Cxh/EReC8lN/xfv7pb07jZOsrbdsUFJd82LHIsmqEF8+5zuBvmQv8TJMbmUlrHCj3UubuWXzN8
	UtBne3DlTHQsDEyq9/L3IcTH+NXLazkxDuX8N9PeGplzA4D3MrKU0PR+W3dYpcs+yUSK1gX8SZT
	KPhCIysYEaofGgFbozLFNIB9RojGXqusTo35fLWcmVHvltIInETzQ4w6Dxd1CSvDvwkx4//W7hV
	BQABTkotqQ==
X-Google-Smtp-Source: AGHT+IG9pX2Jtg59e9IBLaq5/OVGd909T5X3RwfK5IXGJn3jfKtBRqhcpOJ04jHXUGWa5tF/ZPyOYQ==
X-Received: by 2002:a17:907:2ce2:b0:aa6:873b:ed8a with SMTP id a640c23a62f3a-aac33549f8fmr2141327466b.47.1735568653089;
        Mon, 30 Dec 2024 06:24:13 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf5ca700a8sm145001866b.173.2024.12.30.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:24:12 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] doc: module: Two clearifications
Date: Mon, 30 Dec 2024 15:23:58 +0100
Message-ID: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=665; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=oiJix/tgmbChwa9na2GrYW7aeE2jDNQ7OEhTDeyXwd0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBncqz9GxMw5UOKxhNTXaB1LtY99gvY6c1IS7KtJ EA0ZWaIFTuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ3Ks/QAKCRCPgPtYfRL+ Tt2xB/4r/UmH1FwIemDs/k++CG3lEuTHuCyIBxqoC5ICms9EE70LL1YC0CT4Ylya5YSuRZ15Oaj s/s0yHMvtqUO6+z7xWU7wiD2gVWALMXlMSVkAfLhmOR6mfG/L/NemnNzmj5buJzTXzprYkbHLZK PcWAd6sAtkPHrzUPrNS+Lznv91WUG0LNzZYkr19WCrgpUtNqHPQbPEzXnHdXh4k0nXaEfckO03/ re9J7EfxjyRHrnMlwCHoJFePAtDRfysqO/ZxBMKtNmAsztGgaEo2pRRWo4e5GsefHLMiO01YGtg Q1PG/Y+eO2dnagHMI1SFQ9/VJsu+kchK8bWyDZRLxn7owTUn
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

Changes since (implicit) v1, available at
https://lore.kernel.org/linux-kernel/cover.1733305665.git.ukleinek@kernel.org:

 - Use "string constant" instead of "C-string" in patch #1
 - Drop #undef
 - Mention that before all #include statements is a usual place for the
   definition of DEFAULT_SYMBOL_NAMESPACE.

Uwe Kleine-König (2):
  doc: module: Fix documented type of namespace
  doc: module: DEFAULT_SYMBOL_NAMESPACE must be defined before #includes

 Documentation/core-api/symbol-namespaces.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)


base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
-- 
2.45.2

