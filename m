Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431787;
	b=hSXGw53O4vDFn/Ir4mVhpGJZMJusJSrb3XT4Khz5fhqSYZDQcuIUiUgrI37sRoMK8qIP
	 VC6lg5NZ39wQY78oAhynWzRFnJx0qK5IAgr8adQR4OqpTPmkdvGssOawnvUX8uzswz+tD
	 KTWsYOuBzxSUayndyqhatBidKIL/93F0hsIb3F6M7hJqQ7LD+qzCjN+TujGwCgmU/F+QP
	 bdQBoLq4iRuAzhT5NDQqCXdDR2rRbT8/MzoTUpmFxN7nodq3lx+SwmqzzzWtaZfFI8lGm
	 fxqnS5TSPeEM9lYI0f/5jS2y6Pp4fUTtQobdSSJr1HcsUdryPsEJiPCvLmYcro5JC7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
	b=ugC6ApuDD5SE3N71fFEAyhaYHogDqrAl5Ty58mRlb/nzY6CXn5hOOq/NiVK5aRl7UtyW
	 nU4XPTHkIeRU6Pl0Dz3o9XD1OPernleOC7pl1qh1FJVb6fd7HK7sqJmvGLUX5ZTkfmF7e
	 M1hmOLEuhsuTJ+zCyck+Vl9RaZyJBx128vuCHH8aA3pzryhjTeKD0d8nsSnFewol1Gx/h
	 lC2wBng1BuQKwsbFcnMpSUSBEm465cHilknw70XKmqiYO/IsqJKlQQ3NSmjeN64i+BROw
	 wC/yWy2fEzAdWnYkC5XVj/SX6rgbUJxj4Cm9tWL74vuiEqNi5gSNa5Q7ajb1og/zq7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1Sr1R9x;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DF606A33F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019DF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1Sr1R9x
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f083477981so362815ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431786; x=1796036586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=x1Sr1R9xbejeMEj13TlW3oO+uSBWuHxU3cdIB26jmBpjP+7CzfqZP2aF5LtuQajGpt
         i0dhMcUrjbMo/zh0t7P4n/cLOcALR2ifURe/Zfe2sgfR0OtV4T3FdqxKxSpN9YlYqMCa
         lo6aRkO8bSmKfgYw/B5CVaLut+okbAK1rTtsM9yreX6xrnNrZM8vHmX4n5DX2pp9XxU3
         dY/mxY6bgWnWRYTzzI9yZzNPZ5Kot0pHhW1lYvJz/J5tbBMGjGBXA7D2+YBIuGX94RXL
         l10DOGLvD8JtjUDV3xGXdIMW2DncyjMCdk765DezgwTdrF1cUaLAHKyfxyLK23stxSce
         2z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431786; x=1796036586;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=NhJoQA5BTJmThkmWqJTsyuydcMCfpq7olnw/lOhGHZgKZLNiDnE7tKDGlIgRBC7Mco
         E1+lfEklJye2MoacXQxkBU65VTmuqsyXa90U0Vu2JaJyY5H/OIZcu+M0/bBl5lkRq0rY
         pzrMTEhF0IPPixOiMBD2gGKsmISoTw5tdcePMWWufpHL7SXTXzoUfYU7eXWysWl+6FKl
         WAP4iHQ01PAKdOBH42H3gDPJwBK9zHZzylDsI9P4QUkTlRCp4AgIbmnZiwxaTn7pQNAm
         qA7Q/ZH4JkyCjHhkep5W5SBN22Hntpn4voxFsvIhkJWyjSiMvDz4jrpzjB0stzZcTrir
         JX8Q==
X-Forwarded-Encrypted: i=1; AL+hErGzyK5/C1E5tgXBtOOYI7tA3uaZtOR0OPJJGT4Q0KwbSao1J3175Vs/p5fMdAVqAvyn+uJKD6fId24=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e+388Rt2PT176FKZVXIiT/ZyluuDriFYHRhMSHR3yZcEb1nqR
	CPJpAmKt5FP/buNdxH6Nbj+EzJts4Brz7lEYJVeonYpOV/l9fPU7qqaU
X-Gm-Gg: AZFdTZcnPu1C60/bU+nla12sxXfd+vOtfx1czlMbeNdayE5+JsN1nKb7LC8FTp7JEmd
	vEn1xOqNUIcWrnCakTMCPTMx+kSjo8+DkvEGVJ/ICLX0pYu8fSsFasY2/hBFjd6ouGFifys+dHw
	oXE0F5miN4Zc1jIf9bVYmki8NIJJ+nXTfFbEEkBfHHP3Lbwd6nptrD86FYr4XOd8Qap6mM2LEPv
	XpWNORC81i8w0Ip/t1ux2c4+GELisQr2Vt422JgXbbuljpQkS18Bfe8IQOwjECCQeQXu6xF05H3
	105+1Elq0NCDeRvOlWTlwGUTaMJLOZRd2MLXpIy7F1o4F1u568t7iSfPdR4nBW7iRy1INS0Itkd
	5W76ib61dmVTDu26HR9uNXlAR/OTT11wkAVuAcnfSn53IvIph6Knrt5PIs+y/L1l+7WGBdLvyLa
	rjLa8LPWF7jn5EH6O7AyWEeYWmPGpTo3rmevzyJ2542zdsy7Q69iuMGsfg98rLcR9kr5vZjEibs
	ln5w5pqIZ3U+L1nYtQfGbftk+mQ4Vc1SOyMgfJSAkTWQYJuSazSdhF6lR2JBHRukHOxH5WnA9f1
	bnMKP3onEqME6ghaXYWOwK88WWNAzXpmh1vG+lL//GNWKduG984/dahbUF6TF2yIOBYW9feTWfy
	NPTzg1DeiCO8qO/8LhAloZH7+
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2f03f0c2295mr177433535ad.1.1795431786344;
        Mon, 23 Nov 2026 03:03:06 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:03:05 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
Date: Mon, 23 Nov 2026 19:02:04 +0800
Message-ID: <20261123110217.170025-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  A comparison
against the current English text shows the content is complete: the
signer list matches all 177 names, including Aaro Koskinen from
commit b13267ba579d ("documentation: add my name to kernel driver
statement"), and the process_statement_driver label from
commit edba5eecfd6e ("doc:it_IT: add some process/* translations") is
referenced. The prose, however, was converted from zh_CN and still reads
in mainland terminology:

- localize terminology (內核→核心, 模塊→模組, 驅動程序→驅動程式,
  用戶→使用者, 社區→社群, 代碼→程式碼, 支持→支援, 靈活性→彈性,
  封閉源→閉源, 爲→為)
- render "adopt a policy of supporting their customers" as a policy
  rather than "taking measures", and make "We speak only for
  ourselves" read naturally
- wrap the :Original: line to stay within 80 columns

update to commit edba5eecfd6e ("doc:it_IT: add some process/*
translations")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/kernel-driver-statement.rst | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 34bcb6f164cb..11de92a7bcf3 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -4,22 +4,24 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
+:Original: :ref:`Documentation/process/kernel-driver-statement.rst
+           <process_statement_driver>`
 
-內核驅動聲明
-------------
+核心驅動程式聲明
+----------------
 
-關於Linux內核模塊的立場聲明
+關於Linux核心模組的立場聲明
 ===========================
 
-我們，以下署名的Linux內核開發人員，認爲任何封閉源Linux內核模塊或驅動程序都是
-有害的和不可取的。我們已經一再發現它們對Linux用戶，企業和更大的Linux生態系統
-有害。這樣的模塊否定了Linux開發模型的開放性，穩定性，靈活性和可維護性，並使
-他們的用戶無法使用Linux社區的專業知識。提供閉源內核模塊的供應商迫使其客戶
-放棄Linux的主要優勢或選擇新的供應商。因此，爲了充分利用開源所提供的成本節省和
-共享支持優勢，我們敦促供應商採取措施，以開源內核代碼在Linux上爲其客戶提供支持。
+我們，以下署名的Linux核心開發人員，認為任何閉源的Linux核心模組或驅動程式都是
+有害且不可取的。我們一再發現它們對Linux使用者、企業以及更廣大的Linux生態系統
+有害。這樣的模組否定了Linux開發模式的開放性、穩定性、彈性和可維護性，並使
+其使用者無法獲得Linux社群的專業知識。提供閉源核心模組的供應商迫使其客戶
+放棄Linux的關鍵優勢，或是另選新的供應商。因此，為了充分享有開源所帶來的成本
+節省與共享支援的好處，我們敦促供應商採取以開源核心程式碼在Linux上支援其客戶的
+政策。
 
-我們只爲自己說話，而不是我們今天可能會爲之工作，過去或將來會爲之工作的任何公司。
+我們僅代表自己發言，而非代表我們目前、過去或將來可能任職的任何公司。
 
  - Dave Airlie
  - Nick Andrew
-- 
2.43.0

