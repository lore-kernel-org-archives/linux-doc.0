Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC038B9AF
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849694; cv=none; b=q6lzet6ki3o4Yz1U1XIjEtv/2T8KpJOK6uOekaqgGrx7e6rH/SfhdJ/eOSqlBjaQrfihx70wsdjy8iC/S3CRR+UsR6/yad3aLGDsmg0RYNLn2WgiwGPoSrySI2gXb6cBPXcS490aP+DXiOifonKAzw/I6xGBPbWFKMm1U0dCMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849694; c=relaxed/simple;
	bh=qfpFdkLsBGgGANgj9kVGeqqpnQlEiiVtS8yzlZ97yaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHObg+LDIhk9mYv9WlaD4tUPrnti/C6V6HPg+Zv5N5238yKzGpFQX473c+ofQRj66axdXgOZdfdVIccTFiqt0JZJYZGHv6CP/V59nTIWR/2zJV9sGpcmPaZ+P+HotZYrk2cC6nGQiVV5TdW5C+tW0he4R6nRf21l8Pr3in3uvEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuCrCjvX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuCrCjvX"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-652fec696c9so8233210a12.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 11:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849691; x=1769454491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ML1udjI5WsKTlsN81qTjNJ9Oi94uiir2ybxpHYc2O3U=;
        b=HuCrCjvXgxQVAys9CwNo2hJL7E0gkBRzr19p8/s5EgzsYwjqUeKzaJ7VuH4QRi75t+
         TbVwtt1UJXhVwWn2v38ZkgGiO0jVLDJkeKgN7UMcvbrf2LqECRIXGmFnTUYGw+Pfposi
         1as+kWnZGe0GRArBoXVQo/8W6v6CIbKhLiAYMaZAvsIA+fiY81xdQ1wwYak9VwUB93ia
         jjXpTR+/+9sYl4xnTzWvguiWqp+GbkTwVKz9jaBLYvVTvBz/8p9oln8nXDNR+ouLifO6
         VK08SWaLYDuI4YSWPLq1q/3sCP3as5YgG7Cyx6YBqSKVN3asPemvE/kzLyduTZzSZnJm
         w3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849691; x=1769454491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML1udjI5WsKTlsN81qTjNJ9Oi94uiir2ybxpHYc2O3U=;
        b=En+dMJTO08wfUJShQAI5DZUUFSmd5pTSXfxQu/Q3V/mpzlpwGIjLb5q0m4OYCA1Qh+
         NmaaFUDmZt0itJktT/t6GxQcmhmh9Qd+ieqaN2G2z6yZDnM92hSuK3ZaCfN7y7hE5gF1
         VP+8d75JsOp8p1YNw+JNVGcJYYfTNsZ7rGNy8z8T7sSKTE95WqnklRd0B4n6zEQFszGx
         GEFkBdvPd8ApUZUq7A7d54bB0t0gPyFJouN+/ZEyBxZK/Mjs0YVTmdHWL7AzsO1aM2xb
         4NP69HMjcIqz6LCiHiARuWDzSyC1BQ5JnQqDdv4e6HR0TNjTOT+B3dCwH+0lyqgyno9s
         nFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYBczrba6Sb9Ti44Zd67lD54nf19IXYk9QeTS/3NEl/0YclXhyzH9sp7dqoDY1fZDi0BBOb0dxM0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVC6whlNo5jaKiSJskW1lPyYez7vyBTEH11ptX8A1t9zkC6Aiv
	Jyff+8vh0jgnyx03iSzdA3hFYEmt9BOhLNFGZyTBJD0kiYXYgFt2M+NB
X-Gm-Gg: AY/fxX5/0YoIHpIEaVFTniTJTiMD3jqPgntwWCSgjDulPv+GBWAQese7UT48IgspH+U
	th6gUne0w4Eu0sUKjNkfwu+j/+PwWp6uTkNH18f8bM2zkJwpdpceAog6PXCxzLZJOGWEX6xguVb
	N5tc3gA97gExVFbQVVafeUWGPxunKjcbvfyW09zmEx2/5P7p47ueaMHt/OfIalI71sYsD22eeFc
	UDuX2euTS0mt0hbMVAkR+e9cewTjENX84VdXrRbgc37P1185oIqKQgWSpyxIQDIa2bfOPUj+wrf
	RFMQBdirmDtvX/pVKptKRP8T+/kqHzewbu4gSJB0e9J6OMIPPBsxHCXR8jkcw5Rpj6ppAxD81Ga
	f0bAIRuYPXrNUJ9hym1Zc297pJ7xIoL94oaF9SG6GpPVFaegfYX4v98QCZPACmQEodOGT9m0Cs9
	e/AsJloYM7uKyfI6V7XDMHue4=
X-Received: by 2002:a17:907:da16:b0:b87:6:3727 with SMTP id a640c23a62f3a-b8792fc4039mr1177830366b.48.1768849690452;
        Mon, 19 Jan 2026 11:08:10 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:a4c5:86fc:3b16:bc0a])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1193767366b.41.2026.01.19.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:08:10 -0800 (PST)
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
Subject: [PATCH v2 0/2] Add support for HiTRON HAC300S PSU
Date: Mon, 19 Jan 2026 20:08:04 +0100
Message-ID: <20260119190806.35276-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Changes in v2:
--------------

Patch 1/2:
	- fixed type
	- Added Ack-By

Patch 2/2:
	- removed if statement for VOUT_MODE reg
	- device specific read_word_data function reads only affected
	  registers and returns -ENODATA
	- fixed typos

v1:
---

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
The exponent part of the VOUT_* registers is being cleard in order to
return the mantissa to the pmbus core.

Vasileios Amoiridis (2):
  dt-bindings: trivial-devices: Add hitron,hac300s
  hwmon: Add support for HiTRON HAC300S PSU

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/hac300s.rst               |  37 +++++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/hac300s.c                 | 132 ++++++++++++++++++
 8 files changed, 191 insertions(+)
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c

-- 
2.47.3

