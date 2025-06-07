Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243F1A841F
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749336484; cv=none; b=JwhSh+y1z8ncXLq6J5R0OHwme4F5prF0fPd3r9Xltp2cKANBBFzXEaLpz5tOeGMS+fNAMaizS2gYhsjuy4q+71wxXjCmn9f5dUSVSY/Od+7XFn04Y5lARDJT6zXmQvzKJDyNXQ4b6QuGcaPC/V2+n9vVgQ1WY0nLjFlxj0K81MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749336484; c=relaxed/simple;
	bh=/Fy/nW9OiVtT8uxbpQbL+4fFCzKa95apeIKmTE7VAFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dEhIcslUknS4vCsjxTP77NrQyCJZTMJ+8kj/MzLNrKt6A50EbPguda/z3Cqot+RT4J4Ipoz1/fJx9amx/dwkXodbM1lmt2UXDOqxgPCzkNZbOXTIqdiZYpc0whJESQm6ADRMu64I+aCRlxfCiNHok9Kka5JMxt8enPgWXfuUnSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cCozPKiy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cCozPKiy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade30256175so286851866b.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749336478; x=1749941278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qczp5FmoFG1M1v3fyvNDLe4WYftbg83lfesrzOgMfXc=;
        b=cCozPKiyCXucrne2Lqxp3Gak+wQxB4XsPGMBctEwiGUsQUlKVEJQO3aZKoVmPRS6Tq
         A1/JS8B1jpD7GQljY76yFxigutGmLbbj7QP2UMTe8l2v44EySqyGpntjkUdxkK5EkITE
         ynAFj/GCovyv998yA5TX7xFHGHCxhfC7iNUcssjbsN5TcZ/vkoiKIF8gm43xMo7TAAxt
         8IKwpXRYbEN2gRqFIQKxKXLXQvhSejuLkMLxLKU/pocQZsMdUZXQLYX3tx2PQ4wAeNjG
         pRoyfQFKYyR+YnXCDSA5XVEE5dnkO4PZNgHzZJqVvigL7TUE+6x946BCz89syuOMRzU8
         9P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749336478; x=1749941278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qczp5FmoFG1M1v3fyvNDLe4WYftbg83lfesrzOgMfXc=;
        b=lH2IJe/BK7/Huz9b0DDy2ewpmzqajol5HvhxhBOYZ26v62H4rgy4t85PO8T6ezTSRw
         pXJ4BUdJkbOdAfQk03hGT1N/YfkctaZnzkm6ND8QTe53/XbqziVS0q1J02t5oB2gRQDq
         3nrq0QPOA4N+3UAvzuf7037eik2M+e/85h/Mzigm15Appm/qb+dPrg2XYfSasTOQ4LjH
         gMI5iJ16ykrpA4FGHp8GIauTrpsx1TfDPVQz29qNh/QShIZENbQMipzFkguQ+KTtJmr0
         dGz2sryayCwX9J2w13V2YEnzWRY4jnwllumv4lUj1tSgzFRIg+DkR/cV1mE+aHHJxZ4X
         2iYg==
X-Forwarded-Encrypted: i=1; AJvYcCUR+Rrbeh1xIH77Pn8VIDaPWqUTz1vxJxWl7MulhSDggqfIBeUGx9F0z6jiAH1x8D86C/7BDWlgIQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+uN1gmh8NWwrizCiz1LuViEHZnZ+Mbb2NgRNLgwJd4VVFP7w9
	W4Lx83koUvtVL56KYC53yEudtTu8oGAEvdW6fmJbDKrWD0zKzDa/babVPsIEWjx15pg=
X-Gm-Gg: ASbGncv8Q/DHE7rz5fEfRpT4jebG/lynzbaOkFkjBC6AAOpTN7KISUlNHC4WwEVjAVn
	80zbn1EabyNpYqcXVt2a+r8etRnZ/y8p9W8PSy9R1lZMSSBLcvj00Hvg6ym2b1CWHl3WM0Qw7KT
	aV9NHVnC22a/JYp5xTCGdVhjowEQrHIrqTZ8RxC7uGRi0uzKKPiuRE5Qvh4FxPZFa9Nal+sKCPq
	E5SlD+1tyJD2RW7zwylVloiqwhETkmMaYSMz9methpKhBbnXbZ+BjAecQXTfWbs+wAhOGzRuhBC
	wGEfHp/N4uWdEfEzeVs6GTL00ImTNjIBenj/nOF6q/I998mLnCTs5bP30nglCpiU5X4=
X-Google-Smtp-Source: AGHT+IGdpeCCT321N9wG/RSugGN7S6TZ/72B+qWT65PFz5F7Yefdeo3cKVuD06LOdUQW/F61eYyxDw==
X-Received: by 2002:a17:907:7248:b0:ad8:8529:4f9b with SMTP id a640c23a62f3a-ade1aa07b54mr732528866b.38.1749336478063;
        Sat, 07 Jun 2025 15:47:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ade1d7542bcsm327160066b.32.2025.06.07.15.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 15:47:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: usb: gadget: Reindent numbered list
Date: Sun,  8 Jun 2025 00:47:46 +0200
Message-ID: <20250607224747.3653041-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=/Fy/nW9OiVtT8uxbpQbL+4fFCzKa95apeIKmTE7VAFk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoRMGUT6SBRf3qEsfPeMbxAcrKfNAhOeXCsHIlT LIgpGGkxqKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaETBlAAKCRCPgPtYfRL+ TjpaCACV9rC0Aku7EgtA57HF8WYiAIG8ViZ3FwD5Gh/pPLnVV11e63Wd2nvMB7Yk55hhGzzwO/9 Etekyst31SJj0vBdIIP5MTYbue8wP/w+MWmuZq6ClnFD1PwuLaP7HU4lwWnfTMw629GYQT8f0Cv s05sfqtru6JHsMJ2JHpyWbdCSY5yQGCzhq0r/fsrDLVyn/wGmbc6Qy6KF7Prezxm4SJepsmm281 2STYLIOvye4XPZO2+56/Y+O3bEBsDeV8Eh30f6EIyKOixbOIXhjSREyEdBY4Pp5XLkxUbPVszeW Wtx3qfEqzLsD94dIBmtiJxm1/Ylof0Vc0HVwD4b4XlaTyObW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Paragraphs that are part of a numbered list must be indented to render
correctly in html. Do that right here. There are only whitespace changes
in this patch.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

not sure this is worth to be backported, so I didn't add a Fixes: line.
If you really want, the commit that should have fixed that is probably
d80b5005c5dd ("docs: usb: convert documents to ReST").

To see the wrong rendering, look at the numbered list at the end of
https://docs.kernel.org/usb/gadget_configfs.html before this patch is
applied. There only the paragraphs numbered 3 and 5 are
ordered lists (with one item each 🙄).

Best regards
Uwe

 Documentation/usb/gadget_configfs.rst | 35 +++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/gadget_configfs.rst
index 868e118a2644..f069d2a0d092 100644
--- a/Documentation/usb/gadget_configfs.rst
+++ b/Documentation/usb/gadget_configfs.rst
@@ -369,18 +369,18 @@ For more information on configfs please see
 The concepts described above translate to USB gadgets like this:
 
 1. A gadget has its config group, which has some attributes (idVendor,
-idProduct etc) and default sub-groups (configs, functions, strings).
-Writing to the attributes causes the information to be stored in
-appropriate locations. In the configs, functions and strings sub-groups
-a user can create their sub-groups to represent configurations, functions,
-and groups of strings in a given language.
+   idProduct etc) and default sub-groups (configs, functions, strings).
+   Writing to the attributes causes the information to be stored in appropriate
+   locations. In the configs, functions and strings sub-groups a user can
+   create their sub-groups to represent configurations, functions, and groups
+   of strings in a given language.
 
 2. The user creates configurations and functions, in the configurations
-creates symbolic links to functions. This information is used when the
-gadget's UDC attribute is written to, which means binding the gadget
-to the UDC. The code in drivers/usb/gadget/configfs.c iterates over
-all configurations, and in each configuration it iterates over all
-functions and binds them. This way the whole gadget is bound.
+   creates symbolic links to functions. This information is used when the
+   gadget's UDC attribute is written to, which means binding the gadget to the
+   UDC. The code in drivers/usb/gadget/configfs.c iterates over all
+   configurations, and in each configuration it iterates over all functions and
+   binds them. This way the whole gadget is bound.
 
 3. The file drivers/usb/gadget/configfs.c contains code for
 
@@ -388,13 +388,12 @@ functions and binds them. This way the whole gadget is bound.
 	- gadget's default groups (configs, functions, strings)
 	- associating functions with configurations (symlinks)
 
-4. Each USB function naturally has its own view of what it wants
-configured, so config_groups for particular functions are defined
-in the functions implementation files drivers/usb/gadget/f_*.c.
+4. Each USB function naturally has its own view of what it wants configured, so
+   config_groups for particular functions are defined in the functions
+   implementation files drivers/usb/gadget/f_*.c.
 
 5. Function's code is written in such a way that it uses
-
-usb_get_function_instance(), which, in turn, calls request_module.
-So, provided that modprobe works, modules for particular functions
-are loaded automatically. Please note that the converse is not true:
-after a gadget is disabled and torn down, the modules remain loaded.
+   usb_get_function_instance(), which, in turn, calls request_module.  So,
+   provided that modprobe works, modules for particular functions are loaded
+   automatically. Please note that the converse is not true: after a gadget is
+   disabled and torn down, the modules remain loaded.

base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
-- 
2.47.2

