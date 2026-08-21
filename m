Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B19F46AEF1
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303990; cv=none; b=iWUv2XjN1zK2iqgV0NLeXJczaXk0Ucx/qQ5RqDunQnueN0A2P8PqfrIbYJRCrXEI+W9VY9yFTnNd4xjj+GGEgFQYz62nTTmEs3qxRS/n6Lx7sAosrdEEAmmxMjvtlANYnyawOVM9u40Y0NEAut4A0LKoQPfN1jqVirl8HRf3ncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303990; c=relaxed/simple;
	bh=IgyD80E3r1o+lHNGYgNi4ZRJnf5sFLYMqMgHhVpqaEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEAydCwinFemsEIjUAAv5shLxlfPLuBsvnLjVfl5N8D/YFdSS85KClyyNZha+B+6OrS6A9WQLKrc0UqRiLiNiaKsi/TkrEbKdr4BxK09L/gr6sVgV/N6cP0In5YMevZ4sHNpzZrTGdST9B3rdop6z4+0gmkI3GYVPYR3/d2nVMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=OQHIUvMM; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="OQHIUvMM"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260821091934c0e588cd050002078c
        for <linux-doc@vger.kernel.org>;
        Fri, 21 Aug 2026 11:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gAQDAmU2Ugttf6taa7vK6ZUTaqexcgWtzklNQFpvJMk=;
 b=OQHIUvMM8raa5qQB8Pxe1PPCrhw/oSvXVYYCE0AkgZ9b559dgf4o6jcz84e0N64z68l0hG
 y77i7odhm+ja75WNZ6PuxXPPcUfCpgBc8EMsBtS6MlzxXEitu9YyIQSf1EtjvMWgDPfvQNEw
 NEDU/Y4mLjhsncKme1tiiAzpOCYthEYdmgM/MdDNZPNxuyf8zmzBQmPOqOxljUz3Zv75JJ8S
 UQiFfp3Jgs0U35z3qWB6AaXMMn2dZE1/Upss6WT9Lx3W2k/JNE1zI5ax+CJc/XYkpUXTVfnC
 WPEaQ0vGTtlF2uW3j4/M+uRdiqvk+ZSZk5yuXHMDixVryXmTEkpvzY8Q==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH v2 0/2] hwmon: Add Sensirion STS4x temperature sensor support
Date: Fri, 21 Aug 2026 11:19:22 +0200
Message-ID: <20260821091924.18975-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

This patch series adds support for the Sensirion STS4x family of digital
temperature sensors by extending the existing sht4x driver and adding
the "sensirion,sts40" compatible string to trivial-devices.

The STS4x series shares the same I2C commands, conversion formulas,
CRC-8 checksum, and measurement timings with the SHT4x humidity and
temperature sensors, but returns 3 bytes of temperature data instead
of 6 bytes.

Changes in v2:
- Fixed heating_complete initialization in probe to prevent msleep
  delays on boot.
- Bypassed heater delay checks in sht4x_read_values() for STS4x.

Alessandro Zini (2):
  dt-bindings: trivial-devices: Add Sensirion STS4x series
  hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/sht4x.rst                 | 17 ++++-
 drivers/hwmon/sht4x.c                         | 62 ++++++++++++++-----
 3 files changed, 61 insertions(+), 20 deletions(-)

-- 
2.55.0

