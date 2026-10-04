Received: from out-2uec-a106.jellyfish.systems (out-2uec-a106.jellyfish.systems [63.250.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40882370D7C
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128051; cv=none; b=cwrQclUSRoyzqih4iz+ETjjO8eiQMTpuWb0fTKikv38knggLqSbNUFRjIg/FSXP8rpuT2KKJuyxg8x4qXoVuq2ychs8Pf2GH2SIOiTyfksSeXZ3XaLbJDMRG4LHVJUVa6IvHZUHFXVAWZ2FzfFKKE2j0cX6h5GaU47tx0US9roU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128051; c=relaxed/simple;
	bh=l7nmUuWJjOffCPJDMvHFvCPTSGs2wiisRvGHPT+sZF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPfBKfCRnCqJFYnnXtqj7/rlEcuT1WPVGS/hMCetuHdHWCgX1QyqDRvT77UB3WJmCXSW3MSlvKOK1qHQntvFXQpdbsLLFDoscfsVsJU45rC9buSocmfeVzxq4AWYf3py853LxFzl3sVfdhGPmqSLE59Mee6ys016sapq8eW8P84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com; spf=pass smtp.mailfrom=effective-light.com; arc=none smtp.client-ip=63.250.43.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=effective-light.com
Received: from mail.privateemail.com (unknown [174.89.145.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyRPt75f1zyNV;
	Sun, 04 Oct 2026 15:33:54 +0000 (UTC)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH 0/2] hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R
Date: Sun,  4 Oct 2026 11:32:48 -0400
Message-ID: <20261004153250.516730-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: someguy@effective-light.com

Recent MSI boards (customer ID 0x20d) use an NCT6687D-R, whose fan
control registers differ from the ones used on Mitac boards, the only
boards for which the driver supports fan control so far. In addition,
the system fans of these boards are connected to channels 10-15, whose
duty cycle the driver does not report.

This series adds fan control support for these boards, based on the
register map reverse engineered by the LibreHardwareMonitor project [1],
which uses it on MSI 800-series boards.

Patch 1 reports the duty cycle of the system fans, and patch 2 adds fan
control support for the CPU, pump and system fan headers. 

Tested on an MSI PRO B850-P WIFI (MS-7E56, BIOS 2.A93, NCT6687D EC
firmware version 0.0 build 04/18/25), on top of kernel v7.3-rc5. Fan
control is available on pwm1, pwm2 and pwm13 to pwm16 on this board.

[1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/pull/2294

Hamza Mahfooz (2):
  hwmon: (nct6683) Report the duty cycle of NCT6687D-R system fans
  hwmon: (nct6683) Add fan control support for MSI boards with
    NCT6687D-R

 Documentation/hwmon/nct6683.rst |  17 +++
 drivers/hwmon/nct6683.c         | 233 +++++++++++++++++++++++++++++++-
 2 files changed, 244 insertions(+), 6 deletions(-)

-- 
2.56.0

