Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA532ED2F
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715441; cv=none; b=XMXNjKZxdWvClRGzbB5GI7+zPbS/ccwSbtSCX2xoQdok3PY1XbOZ0+RgmDc40swzzqFxMzXAgyBuGsHD5/gnLepV7eFGt1AG7Rz0G9i5b2hc4fbgUAj5qQfXHzd6bekQTdcLlfAhiVYtRBnwBxJ4b+EWoo5xMONvIOrpz+bPfK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715441; c=relaxed/simple;
	bh=I0zxWpz+WdShjD2pMGdi2UhhCOsQ+dRFjOiqpqzQPZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTKNHKuBlQOWpj4YJfoTbns/bFq2BftXfeUhw8aC2u3e6iElIX6WGG3QgYWR3f57gadR9TXN/A4E5M6yOW5cAAcMp9Rm3KmnMme1F0mE9tcACLZAcaRYlNwBy1pNyy8vaZsG8392i30+0liD5QKYPD0O6XDH0rxim1zrWIfa768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCSE8S4+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCSE8S4+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so1503972a12.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715437; x=1768320237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQLRuTGhgEXwZ/IQ+OAx9oAMT59BlPYHzpxFvRzsfUI=;
        b=LCSE8S4+eEHrVAnO0r2lzGjyQpbtK442V+TeNU99Wa20rlhNlYGSD2LTSfB5m8yoZu
         FYUruRloUCXLa1qPEaFaal+7wb/F5xGb8rqyewAjLGnzhmlacM7aYgt7Ng0CRoBqtaTo
         3iWc/l0DFgDyr3OKk0bPve/mTCvHem0FKU0ACiLQK6tt3rCnsoBSPtmHHHzNpNEyDcmk
         yk3wwooefoomD+bjTTb5YatyggNm8HUyREmfOMBy/8EDofER+cXJXfqCr5GJXnJHHrkh
         Lj+B8vSNOcC6wbd+y2YPvJodJSqxfELz3QuIFXAGuWA4NGShbM6EhVEq9aPzQTW8yeHV
         arhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715437; x=1768320237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQLRuTGhgEXwZ/IQ+OAx9oAMT59BlPYHzpxFvRzsfUI=;
        b=HU5ZjwmWL0oL9FCd7nQlAY+qJqkP5l+lpafWruCukLp80YTuwJ/msTb4UwfI7+1SYJ
         ZdlCLR1UPm2BEXo2jZycDnkaNYGa0oZER42xQpJ9DFhoTfuihveLBE6JRupaayvbvZKV
         80P/Ln7+8B6PNjpV31jf7nJqzjsHnUlYulV/Xf9aOmcpy+8EOcR4KH7+XNmU1oxA6rD9
         2h2VQ2Wjna5toarOd8irDNJA0WsAnmq4wnuCNz+0T2pMylu2/S9Q0xrzgh6dO6TFhokq
         t0llZnEvofyxTRJ8JsZBNAH8tZVqKzjWnLKyzbLO+aPQVwxjJKqFEa4NcYR+iSuQ8haA
         CQLA==
X-Forwarded-Encrypted: i=1; AJvYcCWb2kMITFvbi2J6vziVwbtvuZabthx/dvfL+VKtz6in0nvh5RueZs7j0BhQaFAM67LoXlY0ubiv8vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOS7fWOjcSPPsN+d0yX9R28SlM1+IzeuePf7LPsY0kIrnLtMg4
	ELvafPN3mOwphFDbNQ/HdyWx+e9STgABmvaLmuBz93uncLXIuUr6+YGs
X-Gm-Gg: AY/fxX6TUQ7MF1bl6LLJzIKSU4q5RBnrav+sP30oK1bNY3D+VYEZt4K4FAwbR37qL8R
	OghMMdLuluRapQTxU+Rx6ydypqjmUUn+1x+m9HuLkVuYDckgouiI6urqTNvfkZKoKPAJFbJRG3B
	DcrR/kGcJs9As8A7DIxf34ZsxXYjLqNmLDjNkYvyn2Lm8jzXdRk8QC5TUARiRCToAXgT5zgM+xH
	gHCRxW9gzcbwnWKEU08y7FVG/47l651KblvKpyQtWEmvijSrES5+tkdpMTbmnZnJ5xNB1fhJLS6
	tHzDf+onCO8ry56Ffgex/Xb8CKa5ClRE1AiKiVZlfTlJE/PHfxV1CrLrS59YtDQoK6jXkwNKDSf
	f4SqF4YCl6RWat9u1usXnESXyqJqySen8+1NtxERw0z7Jka8HA5knU/zXzKfWIQt24tIwoScjoW
	zKVmkhSlx3yi2JhAaZsYz1FYk=
X-Google-Smtp-Source: AGHT+IHmXCVGX+Kat7e6+urgJ0JLM+ij8FS1Zj4byI1uScqqDLQYyO7sz0Nhw6oxtw/w3yBCbK2uyg==
X-Received: by 2002:a05:6402:2356:b0:649:aa69:dc07 with SMTP id 4fb4d7f45d1cf-65079321af6mr3038310a12.12.1767715436346;
        Tue, 06 Jan 2026 08:03:56 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:80f9:d6dd:93b5:e2ef])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm2474912a12.24.2026.01.06.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:03:55 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: [PATCH v1 0/2] Add support for HiTRON HAC300S PSU
Date: Tue,  6 Jan 2026 17:03:51 +0100
Message-ID: <20260106160353.14023-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add support for the HiTRON HAC300S AC/DC switching power supply in
compact PCI format, with a 300W rating. This is a simple PMBUS
compatible device.

There is a small caveat with the internal registers of the device and
more specifically with the PMBUS_VOUT_MODE. As it is already described
in the driver, the device does not support the PMBUS_VOUT_MODE register
and at the same time, it returns the voltage output values in Linear11
which is not adhering to the PMBus specification (PMBus Specification
Part II, Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register
is being faked and returns the exponent value of the READ_VOUT register.
The exponent part of the VOUT_* registers is being cleared in order to
return the mantissa to the pmbus core.

Vasileios Amoiridis (2):
  dt-bindings: trivial-devices: Add hitron,hac300s
  hwmon: Add support for HiTRON HAC300S PSU

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/hac300s.rst               |  37 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/hac300s.c                 | 152 ++++++++++++++++++
 7 files changed, 210 insertions(+)
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c

-- 
2.47.3

