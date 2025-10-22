Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCB2D73A5
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 04:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108433; cv=none; b=PpJ+srhlUv6Ej7h259d6SZoCULK4gzC+RofPZxVhdZN1QBAzLtQAFBxZUwwZ9SX3Ff4EJpxE0wAUrVx3IckUPztLljCVWRl4VAEhZlmi0+tNm+j/iUpohbuS9s3zO8i0I4UHmGvXTzTnX5RLBtyMBphXRPJXoa9JzKrKbLh1Z4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108433; c=relaxed/simple;
	bh=DWS7b0OXi35GUhqaHArR2mIysKoute9ykjs7q/LnTyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXOX+ZnSi/Fp02wEhRtJrBgy2E59p+AV6zd0Qz+T3AXEkK/L0XVb3fC8OxvCMXZvY6b46DHyEBEjckU+Sb5yB3E10f0qPR9lhEK7wrFeh8zGfXVgy5za4oInOB2IMmxYjlUYFU6n6CRDUGYZGZDsmdIb+la2PmdGRPnC5nlr62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=G7JBiS9L; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="G7JBiS9L"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269639879c3so60484715ad.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 21:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108430; x=1761713230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBuTemYA/SGUaF+DBF41ycHM+zeDM425yx/z5PlZWVc=;
        b=G7JBiS9L+3GrHf4wseXIOFIEvK+EEblLVdX4IdLaVMl0KvPb+gWbsg5C2sdCX9cS4J
         MUOlVR8FexBqW2BMo8wMzqCSP/4GKhYw9ryofYizqLgk8oeJGKBTSDLNtJgSkYl9dmEv
         GZQZzmhp3v/AzLb+g8Vt/CdQBxf8mt4zgqByQNOLsIi3C9WOrL5Ig2MKrPGmeZ5xiYhk
         6z2IDXfqpBcxAQqCtUKpCVFMjehAfpMJhqzpTLr+J2oxyl+GlDsbHEhLQfwoV79mVJQd
         tG239J3aCJOCs6sYiNfDFINEEMsYQcLJ0ZkDKyTYm4T8wMHdZiyGWQzmW6aV04+OiU9C
         JHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108430; x=1761713230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBuTemYA/SGUaF+DBF41ycHM+zeDM425yx/z5PlZWVc=;
        b=VS99puOrkD5kyd66IWEt+R+l9VJDdF7wym2DL6A9SMh+GtakRbT1JyLHb920PoINiD
         V/s7SS97iLpol2NflphfdZZ6ojgsF+ZNeON82VA2evL0O6tcSwRtIW9Ia/Q3wY4psRIQ
         U7zMnqPi3UzqtCdwxpqEtrXjRUp2DxuJLEYyMo2FWqVhqrwo2bJ0oUUL3r5UWSYiLP/p
         pbiIZnFdG/lJ+MVABlyCV+nh/geIoSB7EvCxGpb/feg1M52uTx4a0hdHXvt3y863bCFI
         llEeb/Rmbv5dMac9kgVNNRwGkLd2eXBDUWpI0RmFVapEFAyLN+ElzRDKI/i8Evi49i+G
         AUmw==
X-Forwarded-Encrypted: i=1; AJvYcCXwJgMRBupU8eKZzdbRnI65IqDWB7EhoViJBiY1JH1p+WD3A1X3W2GxRlMyFdSRpfO65fhBfMqMB8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxnTHV89cVnS7mRyIMF2xqkB7UxM+3RMogRc1PbuGyUEn/sQjE
	R5ajF/ahpv1CnauddlAC2ZHhEpGW0iNwSkdXbi4W4viwAndY6k6ZWYiYXPFBL+myh4wQkv0/yBW
	NgRvyh9w=
X-Gm-Gg: ASbGncuGGhARPMPGak+aX//8KXqY+EmSPK56AXqTjZcjTlUAbIUGSaxVyLKPq2V52mQ
	SmdQB6B8ceIjBkscaJzjB3KYLqaN4UGNb1NLmWgNiLFdJ22S75G+84j1YtbTkUfSClawCN4QKU8
	QvXERs+hYstWdsoGOGNs4yxEKTG7XDGepR2WkfJi07FCQoFPSgKOEUZFLKJulndb6MB3BtUwg9H
	8O2oL0XS8tUX253ACAO8zkRGfO/Kwj4qjP4K9VGoOpDohQMIn2I+nND/uEL52sE8TvCTwEIEq1z
	qk0DgARtWBNHD34WtZkRpJH6Fh9ttq6qbvEgS+sabHdFEHIdTpMUtkt0pfbGqSkyuvrY4oE+H1t
	HNtsFEswjxRu1gezIatBNrFI9q1KOV9Qapqa1t9eRAKrH3LiGw72YLDlPINInWrbU9EIwVZtqyX
	3EWJonLh4zaNdmPH4=
X-Google-Smtp-Source: AGHT+IHMzyYghXKArrXF4a3abFsvEWo0yK9xR3k3Ts3BFNdVJw1LghdAf673yg3EmO+eQ2pXjMB9AQ==
X-Received: by 2002:a17:902:ce8d:b0:272:a900:c42e with SMTP id d9443c01a7336-290caf850b1mr243342655ad.35.1761108429966;
        Tue, 21 Oct 2025 21:47:09 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:09 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/5] hwmon: Add TSC1641 I2C power monitor driver
Date: Tue, 21 Oct 2025 21:47:03 -0700
Message-ID: <20251022044708.314287-1-igor@reznichenko.net>
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
shunt resistor value and raw shunt voltage via sysfs.

Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.

Igor Reznichenko (5):
  drivers/hwmon: Add TSC1641 I2C power monitor driver
  drivers/hwmon: Add Kconfig entry for TSC1641
  drivers/hwmon: Add TSC1641 module to Makefile
  Documentation/hwmon: Add TSC1641 driver documentation
  Documentation/devicetree/bindings/hwmon: Add TSC1641 binding

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  54 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  73 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 801 ++++++++++++++++++
 6 files changed, 942 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

