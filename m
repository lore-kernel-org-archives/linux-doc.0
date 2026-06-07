Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE138D6BD
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830452; cv=none; b=NSEaNFEX9px6Np4+CEwOIz9UB409zbQqJxwzK2MBfcCKqrt3cz0cUQ3w2AnaiZjeT1RWNWty1kAROrj/ECEkxp6V7LbBvRAKXDBLghN+DKyUlH7GxGhxEk66EFZAO7A7Ds0K/LsRPxvbgL7/Pvtquxfwx/dPKJNwHKDKr9fN6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830452; c=relaxed/simple;
	bh=/509ma9uJjQImh7MAmr2vK4ZiNM3E3oHQUKMx6o/3qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMOOW/ksjCzw9QX3mJwBJOzzWbgwRZROGnox96eJIKZCIRa4mm1h19Jh4WzeAB8QwLgxsItq2rFmIPW6TD98EjcXvhDFsNHpE6Cgso55j6V+kAI3pHNUmFF/TZUsNwVU9c99X2Vp7Pp1uLiz/PJYX1ZfCiQ5EiAGwJ+RpPlytr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn/9crz2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn/9crz2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49068493267so24215205e9.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830448; x=1781435248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqaMDee4iIfK/VCno6YF52TUij0QQIt1FuKyUdUvXL8=;
        b=Gn/9crz2YL2GyMdeyutkIl/5NfAfsxOsrk7BkWkWNZvzygmUl7epa4JIVkvhh74pLI
         ANGCAkqFyrJeRoVjKVcHvMN/nEVyCsh0DIC1sb/jA8gt7ir5GGXkNEWbZoZ5qTLbgC5O
         z39xnINCmDK3DieY9+/YH1hrs0gvspz94Q6F8EHNmtgyZjswdFTB5NB8GbC5gD15IltR
         zPAuZaIZGYtAY4DIy3FeptVhCwNliTWOIU8b6IvNHQpPkf4RbfhULGJsUS9SLjjkwLXX
         Xd+dIQUQHPcu3zguzBF3Re0RoKO88a0+WlTbAn3cMo0C5lar2VPBhF0tKz1Nljd18lV4
         tb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830448; x=1781435248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqaMDee4iIfK/VCno6YF52TUij0QQIt1FuKyUdUvXL8=;
        b=XXLjWbEt8Sf8Of+OBI84uu7HsaP9WfyYkIkzjeHublAK/XxEaTtVEKzhOlTdbcBoV2
         z9wVAZiXfm7Vl02z/IKThgpJCYUSUVtqq5CTeEUi3/Q97RAhUl6yvCRLL8B8+uki2LY1
         gRlN55CkMhQMQ9UEbnwFFuym8m6vfoFSbrV7EgvtIbKZrK+mxjlLlY+H09cdKfUUY3tj
         u14N6O4nLUPZzAsR7iOKtEUdyCFNJXX/3yIfAicjtMmhuEgliwk6fy75I7gP24fWzs0a
         yYIfcv4kIibK7qvdURZFitGbnnreaqEcV28oYxKMAOzxAh+Gm5aQcqYIOx2Lr7zDKmph
         1UZg==
X-Forwarded-Encrypted: i=1; AFNElJ/Lxx1BdtCjVqJuAId5GxPOytJCSn1U/0IqZOg/RlrlJ8tfmcERwd3fbT0Fdp2Oy9Cc7BnfIqTJUfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdktkuAOn06Wpe0+fODXxrFXOmaNB1DXlArOb9NeXcSw84574E
	D8hFAPBlclEqvnvdZqMQ2BJQdJqxYq30lyMEMqiqvzf+32rfohTvb5ga
X-Gm-Gg: Acq92OGpKGC7ztP5dZ9j6QMNo6gwoYGkL48/z165yW4nV6Vrc5cwEHtRcwaJBeCgHzF
	Kn6WeJz5ZxwS6IayciNnNVWDqS7mYx6c07zzd2UtZdAPSspseAULKHfGeOAJyOoHO946un2dlsQ
	u0OKn5Crjk2Dkk3t2Bv/4qqrMUoP5EHXxsaHaWe1lmOkpv6mwVIlG0FNXz/UNVOP2GD6CQAoKdC
	F3owOG4fLgfBH88v7iIvthEYRnyhSgMvZY9dVbqcdq9pnR6Qlsx2fpp+pJm/4CWCCw7jRHZEWsW
	yLyYl2Vm3hge+DfIjJonDit6Cy8ZH0NeTC4Sncy1MfDYhMmiE7C9O46XcnH08n1A7niqi852Kck
	S//7+czwriPkvgtHl7n2peNhqDtLE8jAv998ndtZA8k0IqLV/+bUiVzn7LfMWhjDJ5IgUq39QNa
	irv5GTIOAMQhM0qR1A0L1h4mbI1k7g68JGzhLkQZR9lIz6aj58Uox0GuM/YMfObWE=
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-490c2508a5emr209136175e9.0.1780830447648;
        Sun, 07 Jun 2026 04:07:27 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm41711527f8f.18.2026.06.07.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:07:27 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] add ROG STRIX B650E-E GAMING WIFI
Date: Sun,  7 Jun 2026 13:06:09 +0200
Message-ID: <20260607110702.84599-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 1 of the patch contained a mistake, where the board definition
referred to a sensor, unavailable for its family. Veronika, the original
submitter, has not responded to clarification request. Another owner of
this board model took over and corrected the board definition, and the
result of that is submitted as version 2.

Veronika Kossmann (1):
  hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI

 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.54.0

