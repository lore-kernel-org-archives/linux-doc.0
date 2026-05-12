Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E77396D1A
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625958; cv=none; b=BuuRTWzdheiPSbvO02hrNY8e/ZotiEndHwIX87MCzi7MYyKFDBEe5p9o6cOUZdpiHUfSEr64GJ1RfnELN4MZphT0qQoYprX4oI5kZpW6AHwglf567nBFvqjs/SSNCfEfUdADL721nBrTD0xJOuRJbxrYx0YA/KTQZ+i2If2TjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625958; c=relaxed/simple;
	bh=07huJZfdVDsVDdyzp6gIWeNC9PLalNwQMidkkW1mhKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=URwXhBnW0ZgR7PypjbafbLwE7fL9EA4DjpXVycwvQJ5iNUmJ9vVoWMlN5GwUbWD9KL256OnwTHN9Atki8cXqlWESt9tl7WD8n/7CwciW6LIkU+LrSeC2+E/84Ggg86SjiRUsgeGToeV7DMZtfMWcCwD/UrIAqbE4zYX0EytPSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=LgAQAhqY; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="LgAQAhqY"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13246950f3cso8008493c88.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778625956; x=1779230756; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dud5LLCGSTK8F+2vzRewAKWi1MtN7/zLbCDo25xb8E=;
        b=LgAQAhqYOo64joSIh0Uh6OwA8IVx+lopDrocPu4pJXlb/sbem8FLCOQCE9V/ciCgpJ
         qGnya/KCQUeRDHmQSl9GiSWqZFwFes5HPnn3xfxiVjO+KoVhftCGl4+WYfTyRNtfkCM3
         1no3h+SvfyeGK2tGbA0YpB3vRNGijIChHyOvc4+yv1TfgZzJhStk5exw0Pc8Zwj5nHJv
         XubEz3AYb5tEtrUHXYh2xWMFMqL0JcCU2w0vGCaMKi5Df1CFCm9fztUgFE+gd8L6YAxQ
         qSEFxhNl3Zvw7klrauqb3LyPnntDTIwLLiHaf1AKl8F5Uypp2quUZkbkix1ZmLcVgwVn
         Cojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625956; x=1779230756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dud5LLCGSTK8F+2vzRewAKWi1MtN7/zLbCDo25xb8E=;
        b=osNI5ZKEemfvxvSy8FwiQI7u4wvgsYNLZUaKy86JjzUJjjbUM4z1qNAc+MDWmYwFE7
         FWDO96p5HJROxRpjoVMXE+cm49k3EppjyiClH03CFoqYuTG5ZnhEbXHKoWUn1VeXdbVN
         JUts9tInBOLkorKKBVq4z0P7KrQwCgmuABt2gdn3dBg8A65LPZdvt7udtrzAxKIAw6mY
         CEz4tRsXyrAX6U4EpOAgV0jRQGw4SngrIl9gjf2QAtDSz90wOpZQcIKZwwsMPnODZtat
         evf4fdNaUihPqroApZpgA5EZfjgwyqodGBOa/hNhChOl82Z5nzS661geqzwUdbHnih7J
         SZ6g==
X-Forwarded-Encrypted: i=1; AFNElJ8odFkCvim3mjUq4KJxQUSD+XJxir+q82qTsMZfyu449MTh124d962r9L12tlQqDcXZopmzAr2db/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAzKLYKgTqPhrSdz80Aiyu8O9zkCaXLNA2/rCb6VgcIeT4c+9
	ZEsgJEa5t+jMJrdm3uh97+c4f+AQSYAnWXl8rDBJjKVtYdOtkL51bEtPM1SqBI6Mgvo=
X-Gm-Gg: Acq92OF49aGskrXi32tW0xgWdwCrkBLw/FSTnpCFW5tEPf1yM5eThlSmAs3nhdmR1hO
	3HIwip718QGlNobWqvAY9kdd5D68vxsR9WBleXVg8N9cNTtM1wZAv0ZI+1vRZdrCYSSt2OMATt9
	2C/Z+Stx/1WU6qQUKnZ5x/3TehVetnhwsTF1GAxlJ0hYf1TNM8IP4hXkVlIJJSLOT2N/917Bryj
	8lmuCdLv8y0p+V93V/02MJub7WtKYATebZYrr6CvSnxEm/9mMMrvM5EgEQRVcK+00XyuyDhvAYm
	K570m2ZBhUCsKIXrWM0kPrSUe3v1j7/VMQt3J+uW9sKC64k/gR7WYb6VKC+m2cleayYu4JY301/
	3yVsqGf5ElKY+S77opY5TBzQ2sTAds6xnE5EuA6xkjunSJLuRIiinaVZMKhez+cpMVmM48RcK8x
	jMOxTJW1cfiI6OLnvdMtP714BRuw==
X-Received: by 2002:a05:7023:b0b:b0:12d:c039:6599 with SMTP id a92af1059eb24-1343699b63emr519999c88.22.1778625955810;
        Tue, 12 May 2026 15:45:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm25351543c88.8.2026.05.12.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:45:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/2] hwmon: Add Murata D1U74T-W PSU driver
Date: Tue, 12 May 2026 15:45:51 -0700
Message-Id: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+tA2oC/2WNQQ6CMBBFr0JmbU2nLWhccQ/DogyDjAsgbSEYw
 t0FXLp8yfvvrxA5CEd4ZCsEniXK0O9gLhlQ5/sXK2l2BqNNoXNE1eB0c0mRptrfWyTrHOzyGLi
 V5Qw9qx/HqX4zpWN9GJ3ENITP+TTj4f1FZ1RaFcaSqQlza3zZ85K6Ybx6gWrbti+Abc84rwAAA
 A==
X-Change-ID: 20260511-d1u74t-c0cba8f1c344
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778625955; l=2625;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=07huJZfdVDsVDdyzp6gIWeNC9PLalNwQMidkkW1mhKg=;
 b=N1fpvSwaSXM2bYj2h/Cp7iEyB5yRVXj4TFN3Mk5qbmea2/1zdOfxg2ofP+VdhbU7FOELd6FQL
 lIz2Gg9DmysB5Ukq/XreAGxunZhzuCyPdf+cAqvlA0hI0mQHaw0peoL
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This series adds a PMBus driver for the Murata D1U74T-W AC/DC power
supply unit, used in some Open Compute Project platforms.

The PSU is PMBus-compliant and uses the linear data format. The driver
exposes:

  - input/output voltage, current and power telemetry,
  - three temperature sensors,
  - dual fan tachometer monitoring,

through the standard hwmon/pmbus sysfs interface. Probe verifies the
PMBUS_MFR_ID and PMBUS_MFR_MODEL fields before binding so the driver
only attaches to actual D1U74T-W hardware.

Patch 1 adds the compatible string to trivial-devices.yaml. The
binding declares only compatible and reg (no regulators, no supplies),
so a standalone binding file is not warranted.

Patch 2 adds the driver, hwmon documentation, Kconfig/Makefile entries
and MAINTAINERS section.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Patch 1: move the binding into trivial-devices.yaml rather than
  carrying a standalone murata,d1u74t.yaml. The device only declares
  compatible and reg, with no regulators or supplies, so the
  standalone binding was not warranted (Conor Dooley review).
- Patch 2: fix the d1u74t.rst title underline (was 18 '=' chars under
  a 20-char title, docutils warning from the kernel test robot).
- Link to v1: https://patch.msgid.link/20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (2):
      dt-bindings: trivial-devices: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

 .../devicetree/bindings/trivial-devices.yaml       |  2 +
 Documentation/hwmon/d1u74t.rst                     | 97 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 MAINTAINERS                                        |  7 ++
 drivers/hwmon/pmbus/Kconfig                        |  9 ++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/d1u74t.c                       | 85 +++++++++++++++++++
 7 files changed, 202 insertions(+)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-d1u74t-c0cba8f1c344

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

