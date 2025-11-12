Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1830F7EA
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946294; cv=none; b=exF3SM1BhK/KImDTv54eM+41J3sNrGxNcmFqOmANk+cw7Khv3PuIqhcyjBVvpl1SOfXeObNw19XZlniY6E6qrc6Kva/KPaoa5QNgRxNtgMd6HAphZ2HUE5dYI//HAF6Qy7QWjLW6ciupmaz0At5g9/ryzFvuRYxbzCMuE1CKNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946294; c=relaxed/simple;
	bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBoqGxtRJjDAd1ehC0Dn7VyS5kgkZ0zfIb36WLUp4lCvsCoej9JPCmrud57IQUPhDns3g7YwtVxWwrP4E2zkHW8qxqBWRaq17CyZL0x4J+7M0nqgmf3eyVyMkNGfEiR81X5MNDPgMyyBLFG5FBycOcJQU4GfozP46Pry7EpfKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bksxmV7N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bksxmV7N"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e982506fso8448635ad.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946292; x=1763551092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=bksxmV7NhAfJOfVVXpYwCLqkXJZnvmfYJgUt6D3L+x/lVF2MNTVa3I+nR7mDjTu0Sr
         HX/fvD/EGFUr4mR+Q0lHjXky+kUeP00UzTUUThQZMYIo4d+DISeEc0YbAIeIxdMvr6JE
         dBnrnp8KhSUMJoXx26evMA8D1xQVK6qX5PIhhmFE5P1kKrEkdM4O4d4yGQ5LEoyY0Osr
         h1g2nId3CC6R1G06Ak28izvx73+/pSRGaa8EGVRimKd48g2453r/b4i5qV+coCYwVVHP
         qS++CG+Zo2ey46b9VgFSr0pSE3n1jLxx5trbKzPQfZY9nnG2jujo2esNj5aXw1XS8Bz7
         TOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946292; x=1763551092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=dT19pmeFrjaFWLgphhsVY4gwQZeKGAGkBRTD7VFygCORA2g/s6DE6P8ZkFTfp/ee7f
         jXQspQnDFFHOe/YCdSo0KBWqYcarJ3qKMTq8eDLhmCm9W4Fg7IQ9njNKIFHuRvAAMivZ
         IVahO7zz2xP7f4AHZHhnymF4YkhtKRDhq3v0HPk6IZuIkwLDFIoQvkOBb0qFP2VIm4mK
         arV++LeM7worOk3/XrylpDgTsmuZbC4Z/KVfnCTmFGG3J3qEHK5ogCILcc7ehcuHkF+8
         HFTvKaxu3+u8WEsXVoI8UOCYB+ENihAPTj8hpG3fDimjl3P4kqM5ewFxd0jZe/UFU1Od
         UwsA==
X-Forwarded-Encrypted: i=1; AJvYcCV0pHMelxGKeht8zXwJLiuS/z3F4PqHCKvE2Qc3LxTOcK7atbMZI5DP/yLNc1h7PUUvpn35JyP0M64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7mkbjKbv6WAcvKlUppkzK9TKAxYI1rzR0wHNK6zlZZfZGyr7V
	ucI7Kr8ze2L1lzmq1M+5c78l9YT/SHuQcYOZjRlxliMe6H439opbZ76D
X-Gm-Gg: ASbGncvvB8/5zt7kinJwqKZOksJCWYXpk5ravB+sz2w1a2158+KGInYdkixDjchYcsq
	Rx/cW8BkPM/PV+Zkj8LmXVVwZaTC59Rr5I6v0YpoC4RDbND0vxI66iktoXkXwejmhhdfG+QPMkR
	EB6MHHOH5EDhHDFuT/ErH856q6Uw3j5lypZ88RBOTMW+f/6ULgMQ4nZjuSwQPkiogL3ZxPc9+Gs
	KxEekxMryfJ9rmXfWLxYTqr/TPMWSsTNpH1kzwg0UTohG9ggniq+WwDNvU3bJQl0IQuK9JmA6a9
	HQegKxrc1Y7RhaqBTrpAxoCWaaj62o87/CPXnhDbQd3OVWN0E1T4wNEKCExYZxOcuEglARY2RIx
	kQ6TL875GPZyNsWVKkYz8Y7vpSjgrlJ/p7kNPEbS3clVCpH4/75OcIkhj2P6SjgH7H3gff3ehMH
	cJc888AWCogQAPgflDPmTnBHIoUCcdbaiv1XXtCRGZhkWzFu4ISkBSdYoRXQYC4krDsujZn97z8
	Yby2LEkLU8QRwWQH9kXDLTh+oDd4sm53Ei/BEs0S4bJXJ56N+YZ6MU=
X-Google-Smtp-Source: AGHT+IELfcxDjkTjHjE9o1zeO9QJOYdqpFiv0rmTaYc64N3Xo1j3VaCkx7ujy498PmB8+3B+SyLiqw==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr30708195ad.42.1762946292125;
        Wed, 12 Nov 2025 03:18:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:51 +1000
Subject: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUejzpjy/vkkvernsg0f1VocNBsYcmoPfGGcYNvqp
 94524SxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNXqRgz//d6GbizPvxkYE//8vkPl+4R5pvWLTsfJFmx87tjWwd0lx8jQpZzsKay
 ZNaeq6ohQs4Oau4P32Xf26tccFrxZZXi3cwY7AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.2

