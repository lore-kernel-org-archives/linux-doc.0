Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ACD37A494
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121693; cv=none; b=AcPfXiIanMRt/9cUkTRx/h0cyQ4RTNGevoMNTLPXcEMvdo0TMrhumJhOYjSk9bxKNSac+MUMhNWj/GN3rfS0qGFeSjWC+drraLZGKGHlj6PvIBTALXof6gDC2XwN9NS16CkTOL3bJC1MOEEhsmZCnYGp1926di/hHwXZs0fhMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121693; c=relaxed/simple;
	bh=s1LkY4RG/HBml6jhtGQ2WI6dyTLJTlmZW5O0MgLl3uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gip2XfwNJ7jJbFqazmybmS14R1Z8Ih9vjriF4G8J8ksSKFjAv+p6nrR23myrXw6AbkFkiP3iQozv5C2Ldk4gHU71Cd3UvtHOQ3dSrWYNVIGC1jHsrPKpksHDbIb9WzKZDcU4C6UtcCf9SqVdqbz7DtiyxVc9adDhQQ8abn4Jfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHmgnSKe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHmgnSKe"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a337552604so7977257e87.2
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121690; x=1777726490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cle9rd5kldHX8L+jS2LOdlUtcsTtC25NJ0LIkE2xZTk=;
        b=QHmgnSKe0EB8bgS6ZPnKR3TXX3oUwUAO3w7pAWZRiuWW7g8AK67EEAUIKB4QiUc6ej
         9XWJC9NDPxM0YWwqFbKqL17nEzKDyBeWNb1qMuNxrG6dDfHheFDfnXoKbrg5jqXZAWbc
         DiNZDZdyECuw3X86ATuvjkJM8+hRBpwj36YXhLlx44N8oUabybdi0ZKZNDXvnrdmvuqQ
         iBapytdTsUX5oarkJLsvgTF3moEQbCLrix5UmIDszxihvsA4t+u/QVn9Fyat7iFgHOPm
         lVeowKPB7wNe65QY86zIiDE6ROmIb7bvSt0gkz7s1F/RygnzbElcI5g+uyRWC5sshAL0
         KH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121690; x=1777726490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cle9rd5kldHX8L+jS2LOdlUtcsTtC25NJ0LIkE2xZTk=;
        b=ewEGJ9DUx87mZFbt/cOY0nlyGTBx39STHEFuGtBRRB0qjCIfzPIl0frkZsWmiBsikh
         WqA4TlA3RUPE0V1HvdV+0Fj81fBehm81hQeHogcHg4c0w7XBPD/PvuFXbHbFvPRQprld
         c2BdreC0RdyoAq7lO16aVxjK5yYBdcgxNer5CoXCkIvs5sHV0FYJTHb5JFYbDg/COauy
         eXlBcpv4aRKeuo9Im5fEwz46mmanFwQlWGs/IlzYw67XR6y4+k+q/H9J/q9fXpO+fTyJ
         yy4ebIRqdlqfX+16jQ9q3hZQnM1/JKom8vP7IS4MLLxU9trm6jnnh1/MKFv/mPXbfT9P
         4quA==
X-Forwarded-Encrypted: i=1; AFNElJ8ejQ4qpAkOGITO4BzkQxy51Y5adYGFmrwPFNTQl4UBLewfJPTUDSl6+ybZoYa7s+BjtR17gan0g6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIaeaWi+iWQOmIfhpfGbYiwtUxzmJjggXmCdKXw6g6QBFikNt
	lzrqwzd1+zbFXeT717evMSCfEuyC2lp4W1VXrRdVTgpKXV6Aw9pjBQfe
X-Gm-Gg: AeBDievB5yous6RGif+Qe9DmHtG3izR8bGs3ifrJ5L/5kQbYK4xXqjAqjLRoO5jEvgj
	KmQPD04/mjgpVzRkyjmJzkPcoT5oC7Q4+MhrcshUa/joMvscqO3NgihukiJYuYSDRnLPOK/MVK3
	yBEH3SaBjqfO4uT1jBoVbIfiMLdX+KFTxK//fWuD1gMv033yZjDIHTsQ+x/Y4gs0Sm3gmPXvLH8
	QqsH/ugtWwKGjk2XVEGOakOIJOzIQIsvG/MO+JdeCSVdcShKwjaImyRPcjJnZ+SEXS2CcnyfRpc
	pNRuRidPMMU9e3HKPOfxECuS7uWfs+Sf8Swzejouy2qV19EFZsarGtjXJiC4vWC5MTCNA/yDB9l
	a9R1rHqxte6UC4b630+XHfhhFwIoZPS5MLGFsK8O155Zyx10aXdRBAACs896sATKlhn9OHAFx1B
	djsXv8sUNXjA0B8u52w6G4ZU0=
X-Received: by 2002:ac2:50b2:0:b0:5a4:18cb:884f with SMTP id 2adb3069b0e04-5a418cb88d1mr8643626e87.24.1777121690073;
        Sat, 25 Apr 2026 05:54:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity sensor
Date: Sat, 25 Apr 2026 15:54:27 +0300
Message-ID: <20260425125429.65154-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425125429.65154-1-clamor95@gmail.com>
References: <20260425125429.65154-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Avago APDS-9900/9901 combined ALS/IR-LED/Proximity sensor.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/iio/light/tsl2772.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
index d81229857944..9921ccaa64a0 100644
--- a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
+++ b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
@@ -26,6 +26,8 @@ properties:
       - amstaos,tmd2672
       - amstaos,tsl2772
       - amstaos,tmd2772
+      - avago,apds9900
+      - avago,apds9901
       - avago,apds9930
 
   reg:
-- 
2.51.0

