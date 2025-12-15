Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37E33D6CC
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808265; cv=none; b=HrKLUeFWB0sZPVHLZzeXGIj2pea0zHTf0KQ+oF5LNZrH40bQYNwpUM2K5jKnGdivlv5dFvD05iDgUHQs8NhnHG97wGbb9Tfl4BH5JMurCEEwOckk/BQ9aliLa7VtenqhcxF14K7HUupaz1/USBoB3sHvO/tF09r6MkQkxWcv/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808265; c=relaxed/simple;
	bh=qgIeskizQ6k5pCTS+tBJjIOrZYKzKB9RZLZ3eLktzMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ/RAwYEtciA4RIJ1ZFSmZDA+yjU/kkCJp3oS6hOkYJKS5pgU+vPet0JN1NU3gBY/3d5Ap8Igp8+RIiBr/Q6TEuJmE6XFPKFB91W4KD8BCiwOImPUX5NQm7+MOi4v0LbvFVACfzho9V3vHz2qA66umpGG5C6HfIgQtunk8MZMZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I4EcfV1U; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I4EcfV1U"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b73161849e1so789452666b.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808259; x=1766413059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkiTD4px65dM2skIdFl/J9dVCQORv+uwK+yX/RVP6Rc=;
        b=I4EcfV1UH3TlEF5NOgpOKvGnh+tYNSa+w3PpwRY481Lv4F+s/kDUwHNOxwlgguD2HC
         zkJDEW1JzIXWFoUC7ah6g1W/y5/+FmktIuO3Rs63eOiAxAmOdPgEY9YdXjxdp9pZ3j7i
         C2RqPD8Am8bV9OLfm15TqejYjgq3+D8Lc6B8+2j5JW079QAVNrRzRVVfgw1k/JuTiKIe
         bfe9gYz6U3L8lwgph6rwbtUYZAghW/9z/iLcfJIxHxrWwFxxe259sZUJHhhNavF+U1W7
         pk/LHRLowB0ayMHfmJXIimkcz99yGlOMDfuO0OvPhxwwSjM7pDOYZ/TvT/vICuzm83al
         PZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808259; x=1766413059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkiTD4px65dM2skIdFl/J9dVCQORv+uwK+yX/RVP6Rc=;
        b=oYj0sNw8VfH4lQFTVSLGNWOmZX4HBBkedjKpJGotjAmh4XDwf9Df2nyl9Qz+nkrIb4
         ru/ygjtjjnu12PXL7Wf8laAwgyf4g1B4LK0gV4IpOWtsBpsfFMHOyHkiq4SkJcxInkmO
         MG9AC5GBvuKq6Dd0J9VppPqn0rfOBiJOrD1e6uKv6klaeyp6Eeolv5m725mYd8UlKOl8
         X250AWwkHXa5OB2jUz3b4t2nmAXEp8f3WQGAN4mKSAIVwRaqKTQSBnuExWckBrTXIGYP
         mNEoD01zwHHqFpPDzz4z35jQ7nN1xrQlVxiC4riVfhNjlyXYfDsO74s5JIzwhYqEciYx
         7dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXcjmql7JEyVNV/N9SSjmswQqKJRRAZO2WisNbo6mHreAepEF7KT9RB0J/vGJ2qxYeGrUqq/MaCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ktwfh8h+BHxIL2GVelONS1ZP2bDBjSizL4QPbZc9n/9N0gro
	gOqV/NT3PP8SWTH96L6b4LCsuzwVHM8NSQn2eJGjpNrZBPywTNjQzBjsAmPO3sr4gDA=
X-Gm-Gg: AY/fxX6hHc3ktgirtWT2wwWJ19LkCIQ0gNu+gGQRgFtX81Y57Rw4L6LlTD0LAU6hE20
	DDpDZY42oekp4VM7B0bIXjpeh0oUxCnXR/hsasuCYepZi+diM4JpclBHLmHhOQBOEXA1SDGbHxo
	V8hPo5w/RV+EV7Eh92wShCO7+Eni7htLAybLwgWmg8SytZuwyOcvDtXOZTQ8DW+9Qtgls7BsEoe
	NAswmjZC2MvAtVERxaesUaeo5YhjZRLNLQmIXtRfayn0VwXTSd1rFhZNXhBk7fslORvXOs+W/5z
	kZJu1+iByeZrD3+qVEpTWaJvIbtMAm3F8kFePylE0RibKoYNL7scF8R6JNJpRTSRZbMLXb8mPc/
	uMoBRZ9WfHqE4XEJTSncpAM6inSmHYW/G7mRn4vAKZHblmjJPmc7wUvkCBaXssx21ARcE0LqgaA
	26jo8hu5H0X6Ug2sLyGN0UHbt+id2+2xsPRKaD5Ufda98FNc8boc/cvVUoXA==
X-Google-Smtp-Source: AGHT+IHKV4igaHwn7+K2vwYBtyQFxVpzIQraC3kpQm7Azogd0RTCY38G5wp3SBzUcJ46GS6qptq6qA==
X-Received: by 2002:a17:907:db03:b0:b73:1634:6d71 with SMTP id a640c23a62f3a-b7d23693326mr1093680166b.26.1765808259567;
        Mon, 15 Dec 2025 06:17:39 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa5c9d22sm1435302666b.61.2025.12.15.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:39 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 03/17] tee: Adapt documentation to cover recent additions
Date: Mon, 15 Dec 2025 15:16:33 +0100
Message-ID:  <5aeee7a827cf928f1d68b7f680a59685117948df.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qgIeskizQ6k5pCTS+tBJjIOrZYKzKB9RZLZ3eLktzMA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhS0WoEn4Bdownd57bRxYSl7t13OvpmqNRXW GkJNk6vgCSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYUgAKCRCPgPtYfRL+ TvinB/9EIDFgtID3fmVhXXlk4A/3oeXKOggta0tcV5pJkVVqettorkuMukUos3F64qUG9dfUwdm hIAyJTKLPIyTNxWnxUfuucogoLAJ3adnn3KWUoVgBCcNMsvM5nkve7In9cZ9PJp9TI3b+o+72NC GZD+0Fr35s/FNjF+oZ8Gv0XaxQUoHoX420dzXrvQmpY79p1jcRwnzxtxLBA7GX0zQnMJJotNITC wpv2OVKb2sCXd6sqH8iA3gIECJDYegN1d5JRblp9d7dNDN5lcHd0nh9Oj2USgmDBirXlzgUCczl cOYapG0cgNTwNeI76zy4BsN/x06W6+Noq/qCs+A6WiicD4kt
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The previous commits introduced some helpers to reduce boilerplate
and bus specific callbacks for probe and remove.

Adapt the reference example to make use of these.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/driver-api/tee.rst | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/tee.rst b/Documentation/driver-api/tee.rst
index 5eaeb8103988..4d58ac0712c1 100644
--- a/Documentation/driver-api/tee.rst
+++ b/Documentation/driver-api/tee.rst
@@ -43,24 +43,12 @@ snippet would look like::
 	MODULE_DEVICE_TABLE(tee, client_id_table);
 
 	static struct tee_client_driver client_driver = {
+		.probe		= client_probe,
+		.remove		= client_remove,
 		.id_table	= client_id_table,
 		.driver		= {
 			.name		= DRIVER_NAME,
-			.bus		= &tee_bus_type,
-			.probe		= client_probe,
-			.remove		= client_remove,
 		},
 	};
 
-	static int __init client_init(void)
-	{
-		return driver_register(&client_driver.driver);
-	}
-
-	static void __exit client_exit(void)
-	{
-		driver_unregister(&client_driver.driver);
-	}
-
-	module_init(client_init);
-	module_exit(client_exit);
+	module_tee_client_driver(client_driver);
-- 
2.47.3

