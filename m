Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA93914F0
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666926; cv=none; b=ec3wwGKn6iKIkESJ0XJkWYI1uaX0ev1vz8jnZyfCvuSBlBGgGnj+ewp+Bvf+2/XIUBCq0Ld8eytHOI4z48+8Ag7yLHRU2r7iGfY8tOdvwDjHUDVMz0+U46VVp22TKa8Eo6+jGGjGjnfQMRRDPQfrT9AMaMwhHT6gfXPat9FNua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666926; c=relaxed/simple;
	bh=BP9Y5imhZt6VwYElQw38JPEeaJUeu8Okg3buEiViLRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EHxNY0ChtNE8h7N/pfzZgHIMqDB0nq6tnoD+LFZRNxBwFlLfKLlzd8lcdhuoS6A4M/1FWq310uC1e5CVJzuvp8zvlFUjuB/2EAEXyDNMbdGHeIMxGY25q8EFZBqRZN0YMPQ5fXPFrjClAPWnk+yeCv+qI18lXVAd6gBf9YVkB40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXdM+jcj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXdM+jcj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e69e60063so5839295e9.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666921; x=1779271721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3pj/SqZbiUAT6znzy+V1YyumfwhBsFna/m8RoWol8M=;
        b=lXdM+jcj6k9y52qmqpFklpYwA20y2jr3C3AEH7rGzHKPquwb4jRe4lyXlZW3NkVmcx
         t1DsySXX0JD7hkIpRhJYyWGFmQB/wCChqDqpZ3ryRfNt96gP6TMr3fyMgjgqPmU7lbyv
         ElrNpyEzkNDEzJWMwBbEwkTW1lYbXrh0ejrpzp9DObnvbAck98XAU23u4q42Rg9ubxXp
         KxyZBDQWjnQ+vHttgd64FA3BRsgNXFDIuyftMb0JYrK1Bt7Ehe87KGHIhXx2G3kbIroO
         LbUTda7vTRyY11x6EmQY5nsgw8y1JQ3McMO8cklW6z/CLJWIQmNosgTpoMc3Ms+Wide8
         MPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666921; x=1779271721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3pj/SqZbiUAT6znzy+V1YyumfwhBsFna/m8RoWol8M=;
        b=V754aLJrNsfDdpDlBLj3O9mIXazaZJ17/lANqcFwxFYpxpzMzKLHg5JMGsudWBP0bT
         XIL9FGW9zQu9yka1wNtbB1Cdif4bUo/Ptd6z1N4d9L0cpTxi4niCw/MDeVWYLCGlq2iv
         Y0shPwuAM1550gkV0GLc+Rvebidvfls1utXF1q9AIwkIMUdbKFvUN98Gs29m5IHlmq8f
         IkM5QLkaaeqXdUFxfucLdiLUv4mRfLbGRX1a9OupFD4804vz3cnXKXO9Fltq3kYiXO4Y
         NS85dcW0g/RiZr+YtybIxcU7oObr+U2TJAuknz1Gp3y3QBv9Ezn4M75s4nVsvQbfeNUf
         7Cbw==
X-Forwarded-Encrypted: i=1; AFNElJ/htg+oLdHlkvcOtt5PRvZEuXqMXEmHYvp3gH3N29gxjjG95w2H/VaE+wakiDSzd3KF/Puubgx/a7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZ2NIv5LvR0L4T2DD/L+wonoDe7A3Khb/npUrlvvnDhtLs8BW
	Sd9icI0witTlogxONbVM2WMVEgIGGkaf8h26iIwnvJM8u1jVj2m74eA1
X-Gm-Gg: Acq92OFNwv+McztQ4Da78SOndM/mj8K/cFU7NaGkeT3uJGDtC/eT/l0j4ujBFFaUWwy
	9o7Mp4hEUsN68HoIgeS92YzOh31wyAGwaDJH8zWSqP5GfGkKQd1UZ+e8F4TH1kZdArhCHiXMvy3
	FX1TUGHYEv8ah6LJdXuC20i5Op0sSKwEIEnBKP5hO27SVncINVxCofb6UALe5dNmpz9JOX85YaN
	rAR/zbOhyNHRHhYUh6+R8WnZxXkZDhp31rReTpoJ3VqlvCDmoPGLtQe2Q6rLNgHKTR/mdsf6sGl
	gAOM6ngUYmWyXzdhcbJYquWq0jy9DitlKV/vhbTsy8maRR9pPoh6dFUmmY08rjmI3/iBcfGRrSr
	OAtyWWrEOlSIIYI/JqkWk8rgYyvAhBY1dxAp01H9znGnkYHBjzPIrWX3wG4eBT/Erwe+6vcihf4
	Zmc27QIjylw5EKnZXDZBhjNiPCSTLVGJjj2bcwGkTNphTWqlNECxRPMLo=
X-Received: by 2002:a05:600c:630e:b0:489:6c28:dbb4 with SMTP id 5b1f17b1804b1-48fc9a3dd2bmr17266015e9.5.1778666920522;
        Wed, 13 May 2026 03:08:40 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm40982619f8f.12.2026.05.13.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:08:39 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] Documentation: iio: make ADXL Y-axis calibbias description consistent
Date: Wed, 13 May 2026 15:07:52 +0500
Message-Id: <20260513100752.8559-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Y-axis calibbias rows in adxl345.rst, adxl313.rst and adxl380.rst
use a different wording than the matching X-axis and Z-axis rows in
the same tables: the X/Z rows say "Calibration offset for the
X/Z-axis accelerometer channel." while the Y row says "Y-axis (or
y-axis) acceleration offset correction".

Make the Y-axis row match the other two so each driver's sysfs
table has consistent capitalisation and wording.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 Documentation/iio/adxl313.rst | 2 +-
 Documentation/iio/adxl345.rst | 2 +-
 Documentation/iio/adxl380.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/iio/adxl313.rst b/Documentation/iio/adxl313.rst
index 966e72c01..b18b54e47 100644
--- a/Documentation/iio/adxl313.rst
+++ b/Documentation/iio/adxl313.rst
@@ -38,7 +38,7 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_x_raw                                    | Raw X-axis accelerometer channel value.                  |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_y_calibbias                              | y-axis acceleration offset correction                    |
+| in_accel_y_calibbias                              | Calibration offset for the Y-axis accelerometer channel. |
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_y_raw                                    | Raw Y-axis accelerometer channel value.                  |
 +---------------------------------------------------+----------------------------------------------------------+
diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index 978f746a8..0aa33a852 100644
--- a/Documentation/iio/adxl345.rst
+++ b/Documentation/iio/adxl345.rst
@@ -47,7 +47,7 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
 +-------------------------------------------+----------------------------------------------------------+
 | in_accel_x_raw                            | Raw X-axis accelerometer channel value.                  |
 +-------------------------------------------+----------------------------------------------------------+
-| in_accel_y_calibbias                      | Y-axis acceleration offset correction                    |
+| in_accel_y_calibbias                      | Calibration offset for the Y-axis accelerometer channel. |
 +-------------------------------------------+----------------------------------------------------------+
 | in_accel_y_raw                            | Raw Y-axis accelerometer channel value.                  |
 +-------------------------------------------+----------------------------------------------------------+
diff --git a/Documentation/iio/adxl380.rst b/Documentation/iio/adxl380.rst
index 61cafa2f9..654d4c0e8 100644
--- a/Documentation/iio/adxl380.rst
+++ b/Documentation/iio/adxl380.rst
@@ -51,7 +51,7 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_x_raw                                    | Raw X-axis accelerometer channel value.                  |
 +---------------------------------------------------+----------------------------------------------------------+
-| in_accel_y_calibbias                              | y-axis acceleration offset correction                    |
+| in_accel_y_calibbias                              | Calibration offset for the Y-axis accelerometer channel. |
 +---------------------------------------------------+----------------------------------------------------------+
 | in_accel_y_raw                                    | Raw Y-axis accelerometer channel value.                  |
 +---------------------------------------------------+----------------------------------------------------------+
-- 
2.43.0

