Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AE1E5724
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351966; cv=none; b=VynEf9sT6wXonjuO3qDfZN34e2vtdk3KaNFUrWbmoKkAmvr68+nMBwk3SAAICEJuNYbuPDSmvQFuYqryL0Cp+4PIcs2z6NS8XZt3StVYB89Gm9JUR90gSlxw6iMxtXPhg8F6UdKYjacz3Rz7YDgwMhno8qmiumUCAgO7gh8MrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351966; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtgndZEgcckmpeNB10n71qriRSkFFKrKFEN0AX+KZiccJpjawUTEQLgR52+NOlfXJYFHKcBvCVfTQLg5sK11ENLNaUrxdSgk93mcuHhiXiUT1emqk2oFLS7zv5EOX08C0QBbAye6ubxc4r7jOAhxdaZHVP2IxEiFHmGlJN59SX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4nrRPYA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4nrRPYA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2698d47e776so21891895ad.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351963; x=1761956763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=m4nrRPYAqpvCSL3yZqRfzxNRxGeBAaJ2TXYKZDbuT43XN5SXQI/ymCC9VrLWsE9nDH
         MsiBtK+gZrxEDoXb1NTsXjdoqa1b0mQvN5kF1oCn5pdlJJIO7zxG/JAZdz2bd55le83R
         5Xc8ESFPlC7704BHUb0JgT8nnZACn3r5ElSTk0cCATWSK6sjDTYbw61tUNxqAznyzVWJ
         eJuB+uTmLwwMh7nQGpPbxDgd9aWtAPGiz6d6tetmS/Y0NFXqNElfro9V+L/xnl83FAwv
         4rhx2ipnVzXGxl+Slmk3vPa4n/jFUwMK2uTxYFNZu4CbaZ5cloh3SBR99Rh+jkv99Tav
         2wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351963; x=1761956763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=VNlanpQQN4SPsM6CAyqeBQcyHHTyMc0Drt++VI8QueFMyfE0bNOHjRfRZhjRNX8GIz
         cayNs8RFzQQD92ObknKaw+otB9SRoKA0E0dXJEf1+ReBvY4kELNU5FH+cNZjAjk1BrGd
         gQLxP2uaHxwvsvcH+hgULXPQ+gbiQKJ543yk0jDfkDiXiOu4f6FMJpGJUMfcjYeyNwun
         2YSw7EYky7KAD+6gUwBYIoqmVS9JrVfwLvCc9e0liQwBrMj0tY4KzCBNLUayJ9a9Merc
         HducWPDiE/GjCeVxZHBzp2SSq2Uliw0EWyvdJIbUwc79s66R8xM7//gpxd4lwb8iMDFp
         95rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc+Qfq6Wp6mBarOGsBhV/X4Qu+EbzspL0oGz3x/r1mnhevbKKjm6aF/d0CRcfS0qoOfHFM36Nc2x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcvgjLsYJQdf6pm8xgwbH4sXhl2L7KVY8LXsyUe2/Ga9F4yPS
	w4Jj44dA4FjsTPywk9zfiTVP7vayd4mGec/0eJslQhgOUS5Qv12/B/HC
X-Gm-Gg: ASbGnctLlCfE9fhUt11S77gyMucT9TRFzro0Oev/+K+XEOuDUST/PaqJnE7Zz/m5Elf
	6bHuOCsUVS+tcVb8Pk7YsELQvtyRYpTjBXIunP7FL6gaYlg/9Eybm+2vvbDqYud2G9B3s4iBn4U
	YkVHcWQD2LSSbqmzVBXN5gEWl3Ep0q5KpT0U3IRd/mSNCewX+DjMo9UZsDPV6UgIUcSVRBUNyuY
	9FIBAlaaoITdiQusZ2qW4lYC/4teYqefWA+W0cL7avE9SRC/g9BjIidduQns2/IbSl/KfiZCWn6
	0W3rbXa774LoUi/otkqQo6+JnWMr21FaJ//JUq8XG0vPjbgwPCdG9AWQjS9grzL+Da+GzD2zKF2
	mgovCDcNw9+e19iFotVTRYmYr3SBAkD1OmzXLDGBVdxwqbu7IB3/IliRlY3G7wQf1IZUcF7icSO
	Jboi9qkmfsbWyB8xLP+i5tKVgorevSrJQpNoY2kdtH4q/fd5YQJKrT199xSs2JxUc6rEOGs+NLO
	EHlvyPZH/y9TECc12AmP3Oiemjy2UE7p2RZt3QTlynM9nmtfcuVdw==
X-Google-Smtp-Source: AGHT+IHSa7MdO+RyudQ13l7ZBDW5YjuDQoXfBKNGzygwW/8ijBbpH54bUrATc3DfIp5eGwuXkgv2HQ==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr387774495ad.12.1761351962920;
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:40 +1000
Subject: [PATCH v4 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-9-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4d3hJqcNPewfPwlleiK7fkXZLhtVltl2i2UGbKY
 wMxq6iQjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFQ32DP8D1tQvEl5SoUQr3Tpeel9LQEufdveGjjeWpK55erOQgadQ4wMBy1+6wZ
 LhiSptYttjWV5voFZ8fr10xZCNt+PsEww+B/ACgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0

