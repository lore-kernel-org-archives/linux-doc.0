Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514906;
	b=YtptNLNWqCEaa8+vwG2j2Bd3L1PzAfb8Uqe9aCorNzEBuzwR8sp4JntO+RvXQ1aBHEEf
	 q5qUP7q0c63JAUA73yXrw75lyefTvJDSAtuZphk9e1ckFxjU1OtKeUklVuU95ii0s4Cay
	 YVwz7VzgEa8hnR99zJtASyYfDI5nBDLbei6e50VUqoSTNXaFZYHXhmD9h6WhgkX9oJTzA
	 Y7XAWqnTJovYiGNNU6XDP2ZIi/5vZIfuotdoZpGxbTJDkumSsGG+3EMUb3GOsR0wM9Vdl
	 ABaSuZpHZqMRPTPRCuqlzecY2bnhuxj+vE9BgGH5UD98hH626GEuhBMtT7NMsKnsLaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
	b=RnhrwBjGBSsudwegCZLzoMKIWZpY1rEx3BT8hnp2IRkTUKwf78HBPIjdfa9Ne1m8vwjq
	 c3+xyUYmFqVOqP/5kCu+Q45oUyV+1SZyMXYUbezL/wXfoaZyVElYirDtOo2SZwVkkQUGI
	 aD4w6rZawz3i0QBpEzkST6CdpWEDc50GGkoZQD+4OqmYjcPZ2k5t22JQhG51ljoupTpK1
	 2tz7ACynnf/39vj4B4DG4u7I0Atpdo3kpaKIidNqvx5oYhRQqIIlamgh7yFKaDttvyahB
	 oAv5VdVARvEDSgIuilhlY4znLoyq38z0J84UojS3RFdsFqSdclFcc5tSTL9gXrs7Uuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahtDac9C;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D03606D55B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D03606D55B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahtDac9C
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so9399374eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514900; x=1793119700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
        b=ahtDac9CHUSxRL7+z1pjX5mHMQsG3IqJhQNDbywepmFruOBZaHhIty5aKl2TT0jPtR
         xCeXkr1tzId484XnjPCSA/dlO7jDV5zCYNgGFJqlvAOyc3aF5IRa1LXa/uobHiffc4HG
         boMX8p2YzSothEVZHsJTSc4dVZU3E7qbj9jMTqYgEnAvfBEQDxl/mPKSbiiAF7+efaj3
         z9ZTDhfA0x5JBY3XrrY0vrQTcKOk2JwQJ75B5ErZAtI3o358ubA6cTZpY/budEjQSWSY
         AxqSVu/Ntin1PTFypJqHX/C+j38zYFueS3kDnrkzgREATC2UqeJ7BtmC5yt8bVTZ3X3Y
         DRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514900; x=1793119700;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
        b=NLBkzDAFDJSLtmNXoEi0VJGMv3jQkCqnc7L6d9wSqPHJKYMsgQBYs0Sdoayb/4Gt2z
         FsP2Kyd1DtWhj0yFe72pc98cTmXOVcFnVXsHkenjIaRb4b9ylRwuSQn/Yk1QttvZRuRv
         UBrzdH/+WrEQzIF0FcR7aWUBZGUHAyQJib9dI//jp9EhWEtdvrxIvXOicg5djVHX6M9I
         5O5Zb0HasRqCYWgUAH3phpKXUjg/n1WWZmWsyHe6g1zFAWC6TbCkaB2EoD6ZRzeIpZik
         DrmDvH/n+JYMidTLg5bBAh/VaO7DSDGmB1CekND8rFBCvUuGYCZVazwFt+XiYlMNbKGy
         eCvw==
X-Forwarded-Encrypted: i=1; AKwUvBw8cIwWldjVeyhqsJo6FCr4ZQVAC6LslSfNTWy9l8W6szm+mnyqHqCfpS7skEN6OwjDA3VmrCaQn8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt4GOT5gqYQ5i7N0wOurHxca5kAS4znIalEvPEBnXzzPal3FVP
	CW3im/ZV6HhKXz+dQI0cRqfx0wo1+OEJ7VijNrYR+SydWd7vtaOlfsSui3r+LUDfx9Y=
X-Gm-Gg: AYBFou3/mMRArKBvW+x5RMlPuzjNyE4sp6EdHc15hmKgb4+i9cH3Ly8ZtKY2dcAyNBZ
	MtURKIwINvcKFLNqqn6nXl8DpOcBcelugvnjgGweoAzwa0gAjCzfnKZPG+qoMdlnas7wRuymVSK
	5ziFNUuIDWbGvwXl+xCYGv05m25rkqP6Kasi6ubtZ4p8vZJ3hbNsG3UHxK7mXBQzCMkzviYb81j
	UmpV59yydxam5aBMz7bLf9dVQmW5oc+amKDyKqAXb/FeWt64ZU/CbSQBdkgUzr5/yVxKcD1MK2a
	zJbWhL7Deb2kC9OXRVc4rowcMwLXCE/F3yeLjIrccU8+rv32+bP3/mh59BRPnL1+3R2Hilj1cRu
	IRC9PeifOHjsYBUHy3a0rB0/wRef3JoMPIle31hKP7/Y+SAbPBmp6vkPJswc6UVNvui0iLxE9Pn
	P47sMIkdNWhGRU+fGXJ9N/GzBBWx7Z8eGLbBqozcPDDTtoFoglE4YEl53PNPqkhrPB
X-Received: by 2002:a05:701b:455a:10b0:14f:8d59:edcc with SMTP id a92af1059eb24-185118ee7a8mr14806448c88.12.1792514900124;
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:18 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH v2 0/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Date: Tue, 20 Oct 2026 16:48:13 +0000
Message-Id: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAE2b12oC/zWNyw6CMBBFf4XM2po+pDxW/odhUdtBxgUlLRIM6
 b9LMSxPcu65G0QMhBHaYoOAC0Xy4w7yUoAdzPhCRm5nkFxqwYVmfRSaKybLW61sic6WFezyFLC
 n9Qg9uj/Hz/ONds7rbAwUZx++x9MisndGmzO6CMZZbVzfVFLV2or7iOs8+OlqCLqU0g+3Ivn1r
 wAAAA==
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=2267;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=TmexrB/e+yDGFaQYIRq2EcohKA5uumYiY8TxKQsJMD8=;
 b=HyHG4fub9f+7mteV1J6ZcNTUVBd6j1q0kR165BImyYn7mkcgPYy3PXzV0oQgtxeKqUKqCTVyx
 Osg/cC61t1yD8VITmmzHx4rfG3g96duwaI8xsGkZwESC6Y2fI+3QVW7
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
Changes in v2:
- hwmon: Scale in1_crit by the feedback divider ratio measured at probe.
  Further testing after v1 found that on boards that raise the rail with a
  feedback divider, as the FS1606-0600 is used, VOUT_SET holds the 0.6 V
  feedback target while VOUT reports the rail, so v1 reported the
  feedback-pin trip point (about 0.72 V) as in1_crit on every such rail.
- hwmon: Use named initializers in fs1603_id[] (Sashiko).
- Link to v1: https://patch.msgid.link/20261019-fs1603-v1-0-8adf972386c1@nexthop.ai

---
Kevin Jia (3):
      dt-bindings: vendor-prefixes: Add TDK
      dt-bindings: trivial-devices: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/trivial-devices.yaml       |  14 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1603.rst                     |  78 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 540 +++++++++++++++++++++
 8 files changed, 654 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>

