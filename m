Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF936A37A
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238010; cv=none; b=RrGua412bTo6ScdDLdZf3a+49dSBmVT8VTMq4qb4EPkYSpo4yeUal1gb5j/L5I4TMTcnR4iChE6aitvLz8QFkqW3XJPKezPlGW1u8u7AalmxpvlWuYAYX+JsR/nZjTPJeemW9TKwtIqDzzBhxKYBMJcpLzvtoZ4V6XextoqouTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238010; c=relaxed/simple;
	bh=fFt5H/vWiCtTQAYyQ96ZY4dZJbxj1cRaOyYCVfaS3d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXbPG1bmKhJMYh5eF5A+lr67X9KURXUf7jn/S2iRZh9cMKiRISFLuT6dGJHhYEkunSKsddSfB7nyb7CXexTBTE5JD3582NcwMHK0rkhTbO2uGd+AZZ/NYPnsWGUT70n9zSWv8qJ5GLfWCXSY70Mbc+xlxBrwVXiLUMG9EMtS6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=JpbaEGSN; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="JpbaEGSN"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260820145957334d20a506000207ea
        for <linux-doc@vger.kernel.org>;
        Thu, 20 Aug 2026 16:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ei2eh9mRhWE0wThFaoRZu+a1n8eCN+REJC5RtmCgjY8=;
 b=JpbaEGSNaKqQxSGyqOUI+/UZkVQPKFwPjbH9K63t0F7NDyna8zlrgVZKaDGYlwbywLksIl
 bOQofCX5cYtI934X8AB37P0NTXHVHMrVqIojldQGtcaZz0Qo3U39RBrLL1SGA9UpxJcG9fEG
 tG5A2R3NYuWjts7VE4XnkO1rjPKaPlCIao20XUjyZ09Za5kaBFSSk3TDsmG3FngFWfZEz2PX
 tly2MjWnXb/8GNTeEQmmVm5DCqKvUJP4SO8Kyt8YkTJw9sy+augc7cdKNYs2QOSZvNpCUIHU
 XD/8h/cJltdF6LWpEQb4PGem+/UkgEWuYl/FAlSS7BDiUMmAErB+T27g==;
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
Subject: [PATCH 0/2] hwmon: Add Sensirion STS4x temperature sensor support
Date: Thu, 20 Aug 2026 16:59:44 +0200
Message-ID: <20260820145946.35468-1-alessandro.zini@siemens.com>
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

Alessandro Zini (2):
  dt-bindings: trivial-devices: Add Sensirion STS4x series
  hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/sht4x.rst                 | 17 +++++-
 drivers/hwmon/sht4x.c                         | 56 ++++++++++++++-----
 3 files changed, 57 insertions(+), 18 deletions(-)

-- 
2.55.0

