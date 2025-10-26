Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2851CAA7B
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761461462; cv=none; b=FU7y6pq8u0bVimA1E1e+eXtY0B2j1CoqedOhsZt+4qbclwsIVptooupUvs7tGQDmpxwP0jITFwmFhU+3dF4JftifgzfaijFYrqiytntN+ch+wceJK8QRrA2QgtSLNSqbSBDmk48yLHZKup8T6KWpxdvzSTa8Xvrzu7/O2PChn5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761461462; c=relaxed/simple;
	bh=e85NXa0sI3f3w+CETu20WN8BTa5YzlfYtevVbUSsSsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0RCWthFgGaUI7/wpTnRnXvR15Qy3iGLudwA+plEip51VY3ngH07lDlo1yAPDK+T4RglK4XIA925aVd56Y1h8zNlHsSfQVSevXtkzV58PZa0wpSoDBBCwCPp7n3Z+3jdQYkVr52hGEppTHwQeyrW8TMF2hIISgDnRCLGqaneHqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=Vj2KtX/u; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="Vj2KtX/u"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26e68904f0eso38317605ad.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761461460; x=1762066260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwm3y2MubzEk+9BE7WJDp/oVxvmkQrQjbNwGQzPi+1s=;
        b=Vj2KtX/u4thXrq5QECAa6wwlWAFxoOJL4e+8dQANybSDZyxF8tqut2Ll68/tq05ada
         R25Zz0uZ1+FA7DUHnbtH7iDCanDndbAuOxlJeTl/hXXUSLGDBmeMexJLoJO4Z72zVd1f
         HlLylcmKUHnESEurYB0enXyXFOZ38SVd+X0VjF8FihCAFbO44BYsUH8XKXOpOiM2pN+m
         Ej+PrIQrdn/JPnq2NXp8Bk5kYVUqx2S3mQo4YqRK5/GUw+LqZHIX24xk96caMLQPVRMF
         Ip4ie9D9bK3fz7sxQVEwhATVrwQx8WQgiZH86/1+SoOC2NW1NqX3Nyo4j6LdFJiKG5pU
         57sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761461460; x=1762066260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwm3y2MubzEk+9BE7WJDp/oVxvmkQrQjbNwGQzPi+1s=;
        b=miVdeRCT80jTX3mdqgFCbVTahN4rwtvUEbff/aZvlG8s4ivcJFc0XAPNIdDKtFUgmI
         TcqZfDsXq7VV7Y/FCyiAe799odJOYjp6hl5n/M6zpoblLTsIYWMLanx6XTv64PZ2+TxY
         jmOfIr1GP5gz2gLjP+q+/YTImhkwxvo5fIDZgfCG1CFYseUwUnsuV3xM6Ht/pVkDNuV6
         NAWjBTEd23VzHPFO1VdlKAFh08I9lJvI0qwA7G6Ub2C2YGA/rPi7YbosQiqhjwX7IFuf
         LCIAIGF37HIrfBuvL5YcpGZEowHGFQ56E4CYVcUYNYCDPtETmUW7lQoo7VF/jQ6Jgt1y
         072w==
X-Forwarded-Encrypted: i=1; AJvYcCXdEp2nm0j+6hQesiYpdZXyX7mrvyzL9VWynYL4zrBBSnLIXwnt1lCU8Dz3qv4tqV2f4iCKWZ41xLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXLSNLzGLnPT3B/hzD2bWIwsvki0DVaAM3rj2NufMv/9B3alr
	GmBP2SjZzyQ69kGxLALkoa7pU0lfBBApTBvfHkNdyP4B0cF927LX/ghI4nYncyCD/KMhZAB5jFl
	qLZxyGCo=
X-Gm-Gg: ASbGncs/GPCHiMU/abvIgIeQLEuRYI7guHbq2Tmmr/wsRWYHzzGj1y+eQgFXqIVAfR9
	qDhStCt5FrTTqgHshtAiYCmtoLEKXf9rCyonFyW7JYIlQMma/tFSKpIGoBROj0G+5zuzJCZe7zG
	Js+JJbSHNjscrE9JaIQC9/+mrUPMvsJ6S8qQ+BznUDnGFds3v26wsdW46W/Kav0uwlBxei8yklA
	LfkTqFF1JfBHoOhhD3q8EENDztAKla1cduqRoACXzKqR9diTb0RjkogHrCV/+GIr4toDjc/fSzq
	FuNl7zUzcskAf5tjekbQFe/NqfmYSV3EimCtgPptmPxijxEw+/DUnn5PXIeijMbThLldwZ/jkpU
	qGUr8j987t3EC3HdgHQiWI0V+PFfQrsMBcJSV1EPMFPCsZQVli/vU9zoyCKuol+Yo8CJ2fKDblC
	QQ7DVGPA==
X-Google-Smtp-Source: AGHT+IFk7R96YXUE2AFHweAhNJTfel5qnttPqZd813Q6RU73D4Bpa+BM9FjFwisJbKplCLyC3elWYg==
X-Received: by 2002:a17:902:db0b:b0:290:b53b:7459 with SMTP id d9443c01a7336-290cb65dc2amr403459295ad.56.1761461460154;
        Sat, 25 Oct 2025 23:51:00 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:640c:95e5:94c3:cc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4288asm43184905ad.84.2025.10.25.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:50:59 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux-hwmon@vger.kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 0/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Sat, 25 Oct 2025 23:50:55 -0700
Message-ID: <20251026065057.627276-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the ST Microelectronics TSC1641
I2C power monitor. The TSC1641 provides bus voltage, current, power,
and temperature measurements via the hwmon subsystem. The driver 
supports optional ALERT pin polarity configuration and exposes the
shunt resistor value and update interval via sysfs.

Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.

Changes in v2:
- Fixed devicetree binding name and formatting issues
- Alert limits are handled in a standard way
- Clamped alert limit values, constrained valid shunt values
- Cleaned up includes, fixed various style issues
- Expanded documentation

Igor Reznichenko (2):
  dt-bindings: hwmon: Add support for ST TSC1641 power monitor
  hwmon: Add TSC1641 I2C power monitor driver

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  59 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  84 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 703 ++++++++++++++++++
 6 files changed, 860 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

