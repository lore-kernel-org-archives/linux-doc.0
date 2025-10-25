Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541481DB12C
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351950; cv=none; b=UfWKyBCe8IdjWZXxFek3rbGWYJJTwRqKqCwfE/fhKiriNBnpYkXB1vqHHSjcZ4fpIgbYmZnslIQry+VlWIqN66DldtXSBO5yCaXcLXj2VM7Td99gNRpA9iQnDNFbJ5X1FDep7DC9YjgKixG2wtNmxj9rRQ88hceFoshs8q/B4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351950; c=relaxed/simple;
	bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYOvPmugHZ3TCSP++cRNCtm+ncf6RLgkBQO5JPbz3iqAqDiVvvdvqz8CvRqzd1EGfJurLF7Z/R5+BUnBAn5ljcXiNS8JeN/0H0dEXdwvUYpCfrGXIxP7bZkVsRsKW5BQ9hb/7efuTZj5K5eFfJ499/6hVfsqhky6TUOgGgawkOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr1KreK6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr1KreK6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29292eca5dbso34907185ad.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351947; x=1761956747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=nr1KreK6axEXyVC73WTwFJTGtK33UrYo4xZYW/eqhFqFnUxcVxba/IEtJO+g1pEmIh
         ak3NIV1pVy+Yqz+osd1NxfvDcnqKTb2CFelydd2ET3xabHuRXLbAsNI07EPMt4bfpBkE
         2jkENDtCc7zlF4zMNqokX+l7Rt8UEke433ts1qKPTvYjHqHIC3lilN9WXJXvu1ahhF4s
         ZkN1SYR7BibKOhbK32kYuyuJ7HM7L+T7rrcDfj0FjKGstYwRO00mMYjT+RsWGCdIbTyR
         MUyeT6chfa/9b6AbQu6nyycgB89rCNNfSZ6vPMj31FVr2S4+vdm8hd7MCx3Tuylt9Ysx
         Va9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351947; x=1761956747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=beJrEjhc9y52XdBPK3sx9vHuD3Hlm9Wsv2Ox7FO9MbsI36rzmHzf9yftFdvHVvw2rr
         rb6/8YvFwlfnJdBnJKw6hD7qFz6CXb1mDsc6d/AWTbsx6kCgofIt4oDo1G5SIdkE+2sv
         yTyhNR/fyozvHiiZ/VhdHgyKr98tXWOgF3i1F5kOvv8ycM1wU7J6DXEyfVeuv2P7a63U
         FI/+KYEoa3IALhZdhnjCMR8NLR2ngab61BzQlhMfcBHChbm5DWQOuVMDp3TET+DHyc0i
         pV4679Mq3xKO4qXvfgVn/Ll66Elz/Ge36m21LKKdxNAmBek2/UquYfWN27gGVssSmaTg
         W7nw==
X-Forwarded-Encrypted: i=1; AJvYcCVROL50D4LxjwuiFicYe9tUL6uHKZ5BO3QH7J5pNtDUm96hN3UL9ZKGLKIgsDQGoc8ZPG6cKohq2TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBdqV/dgR1a+JiU52ANn7Wfw1ghOHtbgL86dkmNoTK18wjX5s
	iM752YNqauiN+54kVch9EHYu9eZNQWpko66VVL4LK4dg64ttx+amQpXB
X-Gm-Gg: ASbGnctdkJSXeGdeYSY1CzSpfh5TsRkAdIVDWabd/RdnLwGRPULmVUbYB14Ce6sUoFf
	JOprrKnlGla/30Cj1/DyKuBXjl/jt1UVB7JMJrOolzNwH1iIHwSuWPcI3Lz+TeNRmf05jl1ftBG
	v0oOxPPUJXdz3n/32RvVbof+knuaO9mXlr9Qx7H1IjJcRZFLZFkCQTFttORcHAJLyKn9EQqG8qA
	edG0YUz7OIznZmGT9GZaunAc7Q7s0BUnQWPHyuSoRLc4J1OlKSdB6hZCJgVOQyiJQ2zlWx8EUOn
	M2a3f7ngVywgqKUyDZOkpTTP/7swm/4lNG/rpwPBGC54Jf5Kk8EN+/7wfVnGylWCmK2BahXeAxB
	mzhUSL5Uo+tnG7dK6L+jBgVLl2m28wqyngIoRXyhqg7IEbZubkzkdbEr9t729G9e0VcN9Q/0s+w
	FC24klWm63i11jg/6P6F8VllrlLt0vs8hVfPxY/bOAHkzGUxWE9IBW3AaGs7WTU5XIiNAT8ndHg
	KxNygin2R/+SmNKm3GIq/TCCgQHpoOJtUwv0FWIcjGzMpXi1Vtel54fl9xc/SGN
X-Google-Smtp-Source: AGHT+IE7b7WlJg8PMfCez4BRWP01L89M03XHDqmXIAUdqR0o0INVIyz4n2FlGNeMHwcTEVAj8jvj0A==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-290c9c93abbmr330781785ad.2.1761351947512;
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:38 +1000
Subject: [PATCH v4 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-7-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7tvHxyY2mQfvkOj2Ou1b+lL5wt2qeuPnvBRX51B
 rNbl1QLOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNdv5aR4VLggrKHBVUNC5VEVaVC98ZfZxOt6Jh45+IVmwlNsr23dRj+Z+7eV7D
 x+NRGVakE1ehjKc+n716bd2HBjQL/Jt/QqBk9XAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0

