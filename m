Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659822DA0B
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759479010; cv=none; b=lz5qu1D121R86XxIG3q9dPdWlTwRs5UaSsbeGZLFx4L3DkQ1Uney1pbu/jZfLJgCy7oY1jEQttG/OWQM+5Swbd//oH3Upz6rQV+H57yNsylhff4i6bTdyEfaybbw/N9SMABxXJ01XHzzkLatG0USYt/Jy03fSNOQUS6sTl5J3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759479010; c=relaxed/simple;
	bh=FzgDnW0LHkuoqjWLgilY6g+m63WHYz7SU/ljq6issTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bR6QkYzqXpTHu7XujR6zZ/sl8hN+OUpAN5qi0uI3iDEHwFStzt1akXA4QGKTw8eeKE7DN4V0RgpE/5/JTqXD4x9DRaMZB0SXskrsdgbtalacXNGPZPoaNcDYTDOMOfWxN5aVPGq5/CmZvo6T9b089DmxHk24k/xU27zKllon9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/tNuh+z; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/tNuh+z"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso2880160a12.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759479007; x=1760083807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEZw1xZN8Gwz84nw3aSSSOJI7RYFRhNHk+gh+sXEEnk=;
        b=e/tNuh+zsDEAlX6VcApxZnX2nGROEwZmiXTgoGJ8MmyHM158Wzl6IWPyec/OEycfXU
         vYpDdAEkAdDhnychZVxgog7e9Z8HibCv3cWXKc7tpVZ+orVL8r/mz3Slk1kjSe842tpF
         Av/1r9wUH5z0uzNl8SBbb1PWgIYTBUuAk6x7Zlll8FrkemyQoFX0K2Mpv9QX7dcG9/JJ
         EL4Z8NK+x41YBfbV5FVxwtkC6+PBCvpOb0Ugf8YpzYP6zrWZI9+RpnGBDLR7XHKKBUiE
         C5+/WVfgd3OqHw9PHozZOAn/PCuIWjJLqQab62zLZPp5fkljy4AXDLcqUvKV2GMCRtm9
         JdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759479007; x=1760083807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEZw1xZN8Gwz84nw3aSSSOJI7RYFRhNHk+gh+sXEEnk=;
        b=OWMTP2f1VdvsR+cDWpRvegPwwT97xoZzwgEx1ROhgAnziwrEwlfIEv4qSDtmXNBdyC
         BKQKGuNPcmjy1bm1fRVau8YR8lB14/RvhoXcj1WPZTRy8dikpN4d8k/hhZtefH5YHJaU
         ifqxLTp5jdAsJ2vsArUYWgcmZC6S2gE5wn2ShIq/islQm3b3bz8q1TIVqj12i8iSmSI6
         Gy3VWCHCazUOs6qfCQ4MhXcTsSuScmoLI/prMWKvJEu/gi4BgEv8OgGPBGfF/TgDkbdt
         P0Q+BVs5RhS+FlwcyOSMQeqwEZ35g7qr8YzTZE/J8yKg2GvVGHYY581TcGzhq53Hk4bf
         mB+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTvEFPXMynAU/avndVtzkH//ai6oD3Ucsn5V7C0GawkBMieqbaSEoyPZWUOlmnfh2pXVbKM8TsxoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mIYVcPjhLzdmw9kqWZM/WVQ5YNlb2oAOZnnmcAHjbLHWI8yP
	FDHkvdaoQXUjerYRGtb3QtpMXlS+cPaUp3STgh3J3Og+F/FUaaMdgFhY
X-Gm-Gg: ASbGnctLWwnNQTOme+VEMFtGV/nv7f2ZLvkVmbYGvlGl92gpd5gw/u4W2tfTiR+iril
	tq4UwB51pMSOP32mpsWGi4HLfcxXjAW4U9BYs1jqnEheF8hYa4mRXS2aBw5KaXqHn+xayb3gKqH
	NccPBQuBgoqcx8mq6Iu5vYKjZUXx5JDPToITL2XHlLB91l3RmTxstMJncEXKjeJ3RSDyKFq1/bI
	pVlk+1RyqEJ8evQc+4sI56QslVAxJYBKbroalHL6A0y7IQgBzmwm0B3JkZ0N55zYDnT5//ErSmj
	E4Iif6mNoiZlYMiEBulKljuk22HbMd8gsHKiR6tgl8x+fd8PUN589GGnJMDjFjdlTjknqVfKi86
	rZqKuzV13CawgsU2WS3LjKhe6Ha2cJ0V/z0LacAGiSb1Qrr9SOTj1+nWyUSculNioCUrlJpSreq
	AWgQ==
X-Google-Smtp-Source: AGHT+IFPgJfqYIt3xEwZNIT1Msc5qVT7rxz+HOc3PPade29V+DzSAFRYs26WIggmAMRkNOXQP5q9JA==
X-Received: by 2002:a05:6402:2110:b0:637:e2b8:605b with SMTP id 4fb4d7f45d1cf-639346c7b36mr1995788a12.5.1759479007333;
        Fri, 03 Oct 2025 01:10:07 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637ef848199sm1990301a12.21.2025.10.03.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:10:06 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] (asus-ec-sensors) add two more boards
Date: Fri,  3 Oct 2025 10:07:55 +0200
Message-ID: <20251003081002.1013313-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add two more boards, Pro WS TRX50-SAGE WIFI
and ROG STRIX X870E-H GAMING WIFI7.

Maximilian Luz (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X870E-H GAMING WIFI7

Paul Heneghan (1):
  hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.51.0

