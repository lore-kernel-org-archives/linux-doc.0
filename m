Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754A2BEC4E
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373656; cv=none; b=Xr3Vi4Uz2Aezx9xnp1Z9kRMcuyfzLIKGWttKhcqUoJPL0v4jzFYfR/O97GAGYG/9IrrXJU+ylJ4NKgvk5P97vjEjskhNyjal8TCIc5Da7eAvRSxtdbkaPCOvnwX1AkShbyfxSoNqXL08EJjsWl0rwzb23Uu6r6n+hzW7uFUAAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373656; c=relaxed/simple;
	bh=eQJ0NUzQ4ouuCS/Q0tnfZ0GPptT7scZ1wPDzcolXdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHxG91mwzjrBTDR1d8VbnddPRRfcN043HKxQtcsFzLqlE3NqfRJO+ujY0isKlSfr3qHIn6tnST+oP6v/k8AElHMlT/iGuXvX03bSdeUe4hGhfQefDmu1N7icYiMTT9pGaSO3py0IJWtEmv4VIwQVCKnyNrYzzJvL2UZbzGyzSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=moVWB3Mu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="moVWB3Mu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2956d816c10so3288485ad.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762373654; x=1762978454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUOzNM4gKoG/nRwrmhCZsy6hSW9BT7KDwKYG6RCeAao=;
        b=moVWB3MuAbvIjFgmcK6v7CDE7VVVEnu4lfltQcA6iCLapx376Tccr80VOZQUHEwB2m
         C6w4TsgGxB4i9zdtnEEHq0WD7Xa+8+jePxG+WBg29a/fOZVKoiOAFKPneESrCBOrWKl0
         mNckgFBi1Wn73PTiQ7RWQGts2SVAgwWegkV08+IaOhvizkNfPoOnPvQWWkEHWJsp07Xn
         //MBjKTnNePN+cnDTR4XZA7JirtUtk7ujXrv6nPTYZ+frvQTuSPVRY7gjHe39HGRCiS9
         s5mGGbquwIkBSEsm5BWf1GyH/IaqCg6CPIXkyp9Qs4YACryFghstbcAspPMaq7Q/NKL+
         dolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762373654; x=1762978454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUOzNM4gKoG/nRwrmhCZsy6hSW9BT7KDwKYG6RCeAao=;
        b=YLe/OG5bR/7nrRh3/pJbRRb/OuOW9zLejcHEx83QTmL9cG4B+wQNwPsGWVvz3+grDd
         IleLdM9Xs/EumxSi2gl2RpC9PhD5fNqRk2LbzexdygSWRTg/ssZHUCX6uAR3vn5uR6pY
         WIDqDnBGSnX1eKcFYc8SQyXqkB75s8B+B9l8M7tL0wSAAsHQzpxDjdk14+SMJWkdsomB
         +4N6spYNDf48j+TJRbrNo/mO7o5roXzO6iJEPveO5mUnVubPhxIbPFyVlCGGJ65InE32
         WPzligrG8poJxFmHiVBDRSIosU4bePKlyVp8tsALVW4UYFyFRAdBPWRWsSH/t1Z47N8B
         rU6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1zCROJ8sJCNCCEFl4y9R5WkMkzFT+/NuGNfWaW1M/QUCGuy4U4i0EAMxOnFp9CrBGKpjo7gFMHac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsln+2RM1Np3nq1xz8OIdZbfS9U3Q5X7Q9i8UZ1fPO1DgMsVe
	EXbNIWVb43/dpCJHuindo4DLjXpo/ZtcinMJXFas46GpYq+yYVeAcEa2NNlYOlCJXlc=
X-Gm-Gg: ASbGncua1gzM34x4HMJ5V60vaCNgaMH4iAZfdje3IRyXdl3AljXuXKSY7nhXrgJhOMU
	uf2sPTmuNsKrxjOeZFsvjtc0fP5WCIvLYhXIAkinNl+wJMgCAb3sf6k3jqNGtBDHCLyRQMEfzft
	PQUQsx/TkOuq2ywLR0QVtCN1QwC5Fw5isYI2Ji0NkbNzS9KUp3UhUAjuCuN8QCARhcGw2GR3BjD
	4/ycRWL5mr7OScUs6WCed2AZoaBWduYvnHhpOTF5PLUxvEOQtTVMTkI+v14hAIXGdFBCPc0Llsl
	rqY4KiEPlCICxEN+IpY/QDeCIXRI5GBh1dkNZu5L5kSoCeRR9EGyV5moyYwh5vcX8OcfeQ4Afg5
	9bwa8aFyEXQgWP+azMYreIVXdVxmY1xU66xGywcVs0wYKllcN1esPCx9wILWRrzb3KXnwMgh6bD
	fdvgPhUIU=
X-Google-Smtp-Source: AGHT+IF4VrvhJWTj6Cx0+TOg4nCOWZFwV6Zvxic2/HHaRzt0NXXm/XIrkK1LrIxEIQcrBWb29lht3Q==
X-Received: by 2002:a17:903:1a07:b0:295:395c:ebf9 with SMTP id d9443c01a7336-2962add6154mr64000535ad.55.1762373653983;
        Wed, 05 Nov 2025 12:14:13 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:3099:85d6:dec7:dbe0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8ddsm4039435ad.5.2025.11.05.12.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:14:13 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v4 0/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Wed,  5 Nov 2025 12:14:04 -0800
Message-ID: <20251105201406.1210856-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
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

v3: https://lore.kernel.org/linux-hwmon/20251104003320.1120514-1-igor@reznichenko.net/

Changes in v4:
- Updated devicetree binding example
- Removed unnecessary check for !current_lsb
- Added clamping to current val
- No extra calls to validate_shunt()

Igor Reznichenko (2):
  dt-bindings: hwmon: ST TSC1641 power monitor
  hwmon: Add TSC1641 I2C power monitor driver

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  63 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  87 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 748 ++++++++++++++++++
 6 files changed, 912 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

