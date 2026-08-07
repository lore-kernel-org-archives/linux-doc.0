Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F219046E
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 00:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063144; cv=none; b=B27bMnn2De5p3CYr0ACCzu/SUaYW/brnvjUqVuyTo//OtQjgdl7pPc0K7DXhZ01iDlnA3lZRFGIBkdOj1WvbLl1cjqMdL21iw5KnWU4uy1kfanvHriES3JOMpQJOVrffJoQcmGunf5IXc3b66vGCNLqhlo1Z+RdUar3iLk9oinE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063144; c=relaxed/simple;
	bh=MU2abmOKDdlqQTDZ0KTwFE0JehlezfHRedBF7Gs8QG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jhWFkCKG3qKN20kibeWhtkytjY5MnN9o8ivoM4X3U9iLD9WCFcOTfv5B0OzORCZnzGTTs7K57GMsHXoK1Xg1lEvE/FbDl9Z/n9rA1fQU8X3YfCqTF1crBwER61Miu0H/ee90dB0nh1o/CZUMrfR/djSHc8OhDZXmWmYHxznU40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrDnonTF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrDnonTF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d032846c95so35579775ad.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 17:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063143; x=1786667943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNNzbkSM7zlulwZfqDEG8YhrkRb79v1YMNRuwUW0gUk=;
        b=TrDnonTF4VqtD+wlzxQAbD93J2hOCoS37OuetmcwQBMcokD6loIeiaOl+wQaFat+7F
         8YWvkqexeumsj1wRYGnKpi1WBub0ymROm3OG5xyn7rrEQqCsmwlx8wxpAGSJoMrknde7
         Yt9DnLR67CrugP8OuQx3orBPOTqfAUnUt5mkyzEGICPD/+NPQE9a18WIIFCm5yjgnmvp
         Dn80mmbrAQdkFKOh2AmG8CqgKY4r4FGWJCWXBcOnLZ6HN27JBDMWmn7ufwvrvuH/SUmj
         u1xy0TYEkwfCfX9Q8ZwW0r7rgxTfm/xEz3GeaDfJU8jEehH6KQftLLHBNCBX1hrU9vWD
         X7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063143; x=1786667943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gNNzbkSM7zlulwZfqDEG8YhrkRb79v1YMNRuwUW0gUk=;
        b=Lm2bhYZEZgBD4Y42M91jhDwtCd3nfehAt2EUiDpTIzV6bgH7mSrtn56YdQb4CiTeOI
         7KfEdYBDO3Pg2lm8VUXjifBWiecWCrNTWZ3KjwmYxAMrUMCO2UVDAAPg6MupAlCBlA7J
         SvngAK6CPSDqfwU7jbcJTiqK4j7z61aOubr5jQTU8gWZByKImSvBJxM4mXN8dbhBMaq6
         Rk9LQVSAo5PHd/L18iblWbW3pSN78KvYrV2hNR6M5deE0VQeD60DN076QpYs/Sl999Nc
         DICKYH1ARbEmjuA/kacqfCqhTPSOajhehPQw/dmOCWPWztuokV+hR8rjjHPce1svv1gL
         zfhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/LRe8eUV+Czd+607OejMOR1CXC8RpueocfvY4h8jMrrvE/2HKjPgPHKDgYuwv1wjvCFbRd2hIeDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalA6IMQoVjFr+U6lALgijL+m2znVpTlm0Da9JuI0mTyhgP/za
	aKWnB6m3TQ00Hm68fyuNh1H3IDt8w95kdxQGogA2715f1jPl0GRbAaQP
X-Gm-Gg: AR+sD10uTrqOLpzR8WSlSJ3qqdectyIg5SF+E6gOwJXrHHcpOeq+BeDPOw5uSn2TImb
	IMV6p+2ttJBiUfgbqhZlHGR5MeMHD79CWjbqcaHTXL5aK/+bYyCXw8RZucvt7bA02ZecZhyi1ef
	QsnLZDSX1NZBHLPHYxRb96C8TTFL6okatbnpZqNUNVKCRxMAadZJiyVUG06uMYbEo1xasHcdO1V
	TqQXYpuRyNE4DqAD74l5ZCgfWYgqlfOBJcB//m8VP+7qKN9dKpetJ44ko+Lwuw99TBLVHznKFEY
	atgAEZUaNfNpmI+90qkUq8Yi/pFiTxowDOriQkxj7u81gXAnmrVwvykfhRnB6ZUh3K+FgaSIq07
	o8vOMW655+ZHrOz4Tyxqipq9At0Hx1rWsOf1AsdVBMJRxcf9J3rfG0HS479BHHUQzRW/3ZpsfE4
	acnYMhgk6b1ejZApqCWoEJYaCjqZytEQrEXOWI/KlktBVjgYmSkynZnJvV2HvZ
X-Received: by 2002:a17:903:384d:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0ca962498mr227917665ad.19.1786063142739;
        Thu, 06 Aug 2026 17:39:02 -0700 (PDT)
Received: from nixos-minipc ([153.67.181.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebee8d0sm526189eec.24.2026.08.06.17.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:39:02 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Thu,  6 Aug 2026 21:38:41 -0300
Message-ID: <20260807003842.249957-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This RFC adds a board-specific hwmon driver for the embedded controller in
the Minisforum UM780 XTX. It exposes two fan-control temperatures, both fan
tachometers, the two OEM CPU fan profiles, and the configurable system-fan
transition temperatures.

The controller is an ITE IT5571E, but its observable register layout, OEM
commands, and fan-control behavior are defined by machine-specific
firmware. The driver therefore does not attempt to support arbitrary
IT5571E systems and is limited to the exact board revision and BIOS version
on which the interface was reverse engineered and tested.

The firmware reloads its default fan settings several seconds after s2idle
resume. The driver performs one delayed check and restores the last
coherent settings if they changed. It does not poll during normal
operation.

The EC does not expose the currently applied duty cycle, so pwm1 and pwm2
values are not synthesized. Only automatic modes and known curve settings
are exposed.

A research prototype can also report the seven CPU curve boundaries and
modify six while retaining the firmware slopes and fixed 93 C safety
boundary. This is omitted because adjacent bands require paired EC writes
and the visible values do not fully describe firmware interpolation.

I would appreciate feedback on:

  1. Whether direct use of the ACPI EC helpers and placement in hwmon are
     appropriate for this DMI-gated driver.
  2. Whether pwm1_enable values 2 and 3 appropriately represent the two
     firmware-controlled CPU profiles.
  3. Whether the two stepped system-fan transitions are appropriately
     represented as pwm2 automatic curve points.
  4. Whether read-only CPU curve boundaries would be useful in a follow-up,
     and where experimental writes should live.

The driver was tested on the target hardware with concurrent RPM reads,
profile and curve changes, unload/reload stress, and s2idle resume. The
patch passes checkpatch.pl --strict and builds against hwmon-next.

OpenAI Codex assisted with review, editing, test orchestration, and patch
preparation. I reviewed the result and take responsibility for the
submission.

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  79 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 648 ++++++++++++++++++++
 6 files changed, 752 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: f18a46518561205cd6ff775a488a0c9d9d5edbfb
-- 
2.54.0
