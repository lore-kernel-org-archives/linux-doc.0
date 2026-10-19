Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435549;
	b=Fv/Z6lF2yHcOqYyhCB3aWC9KovGVpGRZGdLmTinJEtIAq2PmC98E/XuABOfRwTTPfRjN
	 Dc2ZnaHVBNKmZ9iw0W0cmGJkc/mL/w3TtVmMh+hhh2Tbink9F0YFm8Exf9W1m3REtqZCI
	 qbEdNPEGBi7M0JTAnFaajUFK3erdEWRmXMZq6PaLiY1ON8hRAiKe1RG/Rv/ADToekTLaz
	 VdYIZ4BexREQA9ZOFooyHQOshOSKKGzXW/Y6cV6SvscCUgtiIOKfR/RkVweTqwsxiZ6ch
	 /ryaEoCT7ouNHFHEh/1TBsAYxU+OVT09sxWtxmb0vAh802IYEqTKzMaSCJNRCcw9WGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
	b=bp3Z8+lKkw89JPvBgC+YSqRoKtj8n7WZdZFyDTObAgzsaf+7Z2yVkdw1Ld0h6fzrTUxt
	 13sjJ/W4ZMIjXkLu+e3ZVKH5UVhg1fdWXvyyThC2z0bf4J2YHCSMZAcI+hAMPOeMQ0PFu
	 R8SMvNJwwK2jxpwoPGyGdvyftGSQRsjve3T6uxZD9pbvboNRqcG0ktqb9QW2pXRrfElyU
	 eji+rZ0ul86NLkTUNNeLZaf1f82LYVKsRz/lBvAyATjzmYW5uwL2lP6BU7eDRw6jfnjRQ
	 joh8Ir6o5593oNDM7UxDrOYeuUeheZLqs+HTlwXAhkmsLDRNr/CWqvBwSEk6jhB6EOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QWyJRPh2;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C1B606A31A
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 18:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QWyJRPh2
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-16079d54c17so5319646c88.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435543; x=1793040343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
        b=QWyJRPh2n2ku6N6JTwzkrzVQW2ZTXtlr6T3k49GkeEBbwXD7g3h4kAF+dDFEoVxE6q
         Z5d5gPs4sj/b1051cXJutZ0bELSBIpaEbYaTzbFUAwqTGIO6+qPw4ZwK4UMMOYRoGLc3
         piOe+IKyO0w4VnXUPrc4ZXJHxpRwZRJzmoM8xsa6VJVNExA/SDykLJCxjfxBy0X1zy4I
         VO4swFm6BYjwoz7bAC0lqGH4s+1285lvWLrI0mQ9I8P1hRpQQye+moxeickxYUUzJr1U
         YlSo+YcSwqeCziNl6ZG6/I1DbcP1qySz+dbwJwqHXIhXH23vkUcTuz9I60RAKjDUt7We
         b6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435543; x=1793040343;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
        b=V3ldkTVDwrt6NAQZbsoTD0GwndTaMqYC0ZwvDk55ZqpONs9lZXmtaJDnisXldT/EHE
         x4cYFUXIo/U1QJddrU5DZLURr7l1GfrNaHFgd7sZ9dHVwU00dWAfDM+NjqjpUuhHs0xn
         i37bHT0EjYoGk/TfW4yGHUmnsGnaHtjt1P4UGvcI1UAZYbktO3FXW0tv8RH6ul9Tf4Aa
         HGA4K9bdBF6QZg5VfXFlY0LBRn3BhnY5J83ayjO7WcUAdn5rN7CwYcdKEXShR5XjNUrk
         42WKBtvjSVk/yPBmTCWV5D11QyElfuRYN6Wr/gNRiw62BxCVagPJDJPj4fgiCGUMvtG2
         D5mA==
X-Forwarded-Encrypted: i=1; AKwUvByrSTAKBYtw4ISVxCcCdnZstVzWaWbBl/lrk5K+XIQrgO64Evl0beNl6CapNf+Uf+bGHcWNCGZ4YOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIykAzTTYq52421F/kZxmO4XpRPUKDpJxEUawvbOxJMhfJYTOxi
	8Nc7Tn42hz3D7Yry+24k8iz0FtHiGaK1CH6gG++ZRpTMOkqh8tJDqZ4IaUZ+C9E0HQM=
X-Gm-Gg: AYBFou072eCMd7EOiU0CDR54LNxavI5WiB/KoxGfS40pMn8kHnSJUh/wzKrsRvAyXkT
	JAmR7bYPMdj5cdjQUmDJSQdH5R7n4JzI3xIgsatWW/hx40GVkOn5jPam3fDEFPk6Vq4+I+T/m1G
	h+q29OvV+hcUATOVFFs5srEduUkloa81RFW8X2DEzn0GnMaxwdU0JxaLPm4uTszrcETLvovDHJx
	2TUVwPzxEeP04xoEmlhEKSpOwtkFih2mG2IqYjHaLN69J3XKZWSUn6tMjEJtH15wYex3Umton9w
	WIdJ0h7F0Jrj2y3IsnsWt5fdckFPo0MuL63j9vD2VG7SeYYCoNAqEafjcIOoW4js8sGYpXvydBz
	Aa+sK04a+iJk0a2n8/t/NnbV+kQjRmP1KpiWRnlkyECfWxga8ycFEf+gWkWzBvMshLnlRtsVt+L
	haX9Rkx105To3SOxaGG6j62jvOYQi/E9M5kY+OIaKL04AtoBH85I3wXKq4xrJ/3NdpMU6G9tOBD
	Ys=
X-Received: by 2002:a05:7022:170d:b0:145:287:ce91 with SMTP id a92af1059eb24-18511ad88b6mr12014693c88.14.1792435543039;
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:42 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH 0/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006
 uPOL converters
Date: Mon, 19 Oct 2026 18:45:13 +0000
Message-Id: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADll1moC/yXMyw5AMBCF4VeRWWvSi5Z4FbGgBmOBdBCJeHfF8
 kv+cy5gDIQMZXJBwIOYljlCpQn4sZkHFNRFg5baKamc6Fk5aYS2WWG8xc7bHGK8Buzp/I6q+jf
 v7YR+e9dw3w9AiUcdagAAAA==
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1736;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=rwFsPUfG4HlTgCqA84oS+NzH6wKBNgI0OdICfG5VybU=;
 b=F8xaV5nqcPt+1FsNz9Z6sqxZTuF1uZu2n+XMdz6Hpg6xhKMLRlHCwAmHtCdonaQIwBmBG4cj7
 5qRHdSKtm7NA6evhUR51D0T3TPOOzoAmlsU9KtpqRAwQ14zNSFWrnvz
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input and output voltage, output
current and temperature over a proprietary I2C register map. They are not
PMBus devices, and their register numbers collide with PMBus command codes.

Patch 1 adds the TDK vendor prefix, patch 2 documents the parts as trivial
devices, and patch 3 adds a read-only hwmon driver. The model cannot be
detected from the part, so it is declared through the I2C device name or
the devicetree compatible. The FS1606-0600 and FS1606-2500 factory presets
scale telemetry differently from the base FS1606, so they have their own
compatibles.

Tested on FS1006-3300, FS1006-5000 and FS1606-0600 parts with the driver
backported to 6.12.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
Kevin Jia (3):
      dt-bindings: vendor-prefixes: Add TDK
      dt-bindings: trivial-devices: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/trivial-devices.yaml       |  14 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1603.rst                     |  75 ++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 480 +++++++++++++++++++++
 8 files changed, 591 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>

