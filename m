Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33161DD889
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771683193; cv=none; b=EpuhDG0W/rirPbtC8s9TFKyN+dCwlbpdwpCTJihVqqwW7OUs4al+C1sWbJ4cbUPJovOnoP6y3Z27HF/cu9recNHzGhJEYAcB2b/Vt0gRaBYt+FK3gs8Ewp0hsh+ayJGyzu+z3T3YUS71dqGjmNSphDe0Ato99V3TilFiHtg9wBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771683193; c=relaxed/simple;
	bh=9/7QTpM9w9CetgDRp3W/v439sqmC/gELVsuHbq2pmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdPVA7eQnznQhhghLNFeHc9MUGAx+o4fu/lGxvs/9Qzn7VujatVSN9t/dBpuH4XU0xaxYLpJ6U5qnUrLqfF2UtOkiNAz3VgsrNv1A1OeQ8JQ14KsgM9pnnzm/W8RLXLTu9yMGLrN6K96t7kjMRGWg2LucM1/sziOZiEaMU32/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsjNUa9y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsjNUa9y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362197d174so1890931f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771683190; x=1772287990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=DsjNUa9yuLHsE0W9ueq4IambVxlVhi59Ff5uXyEoe6zTigob0cRUsBUoZ6j5bVof+V
         pYaGouhxYZp221b1KviPOKtGHrlP+nCFu9jMz9UcZ4CbiXX4KmKCOj8vVJAPN+ltP4LB
         AAz63wRk+p9RHzxSljPoFWCbcNFRZBE/5xg09vcaNawRgY4z+xK93juGUeSlbkLlmF4T
         8uhpf5Cv3exltuK/dQdCVPJgKltl11Blf0xNvaaE0TVr2wnPmK6Gnqpno7N03sD1xBiH
         BBkYHQuyCkLMNKGUmoiHHKcccZbJCoapumt74ZggisoAGDZq4FMvgSisBlCG+GtHWUlT
         RBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771683190; x=1772287990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=wgPrtme2cReylCtkyDDoffWS3ix+8uzsnHM+qEwMxWMAnkHmCbWTuZHulk2XL/p7DE
         2C7s2Vmkr1zF+Ttm1rd77zVY5FG+eqjtQ4bP/1zh+qESz15WdE/zYJqKrTFWnin59ItI
         lTInAu/Z6kSEqwnJBrl3fWfIWBCDMyJ4mm921QhjBxHUSCFaBmUM8T7YcftieGLsZTQB
         MXgR/WiGtMRGTBdGCIEEYl2wL6ctZ5ibI25cb73l9QYkBHzTwzT2I1T18pzBANULInbs
         ItEpXo5Ky/XTebGYysCfbZ/NnxJ8d5gbZVtskXjgYwr6ASUfT/s0Xn4ImepHG4LXndd3
         H2tg==
X-Forwarded-Encrypted: i=1; AJvYcCUTYMHw4SGBzVMRNeJQggMtUa/6ncm5Mj7EylO61qHKXKGsXsn0I5OF4kC1SRxe2TT/AZLmuH3eifQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgmCYK5oAWT3jbHPHaXvU1ui6ffqNxmkq0UxJqdApGbXKlS33
	LeVIa2v0Ek5YQscqqp+6tbFbLrJfi7uNyqrPRXHY7K307XXXecvMdnyR
X-Gm-Gg: AZuq6aIVz3oftDZw0GGSyfHs9f1R9GPg8+ZgT2G6D9PwT9ZglFTGHGj6bo5IYeUjYJG
	d//abGZqf9kVsyYg60n0FpPhKa5o2aVeTr47xbXqDq9hNIhwMEq3K40LeXYXgaueknA9XB0iiNy
	yee1UQPI9ZepXUEzmLJUhDMdp8hDk+BtvD48aqQIbhQ0biSk2nt0PQlHaYicv/HaaE65qRYLoiU
	odQfPB+OZX7fCeDOENFb7XaVREa6DgTzKBJnXDSsdlG7Y5uf1iad9S+xDjKYIkryAHeqi3HStG0
	KuxUdQE671F7UwrvH/la+k8dsykg4Ogjn5DkDlPewbdPJvHPEF9spD70JNLZvaVMh8d8T9O2e1r
	6peX6l2H3pwrgeAe2LccRqH9t+7aJnPPmhc7GUmMS/3+DRfGOEPv73SuT/jhc6a4mpfSRKYIOZ+
	vKskp0I62HJRbOPFGByEkBPqiRqZD91F4vGwz4Y8xrczEKBg+j3vSGuy3+s8nx/NQ9WMiwfoqH
X-Received: by 2002:a05:600c:3508:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483a95bf3d0mr58953795e9.15.1771683190057;
        Sat, 21 Feb 2026 06:13:10 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e01c27sm50169825e9.9.2026.02.21.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 06:13:09 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v4 2/4] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Sat, 21 Feb 2026 14:12:45 +0000
Message-ID: <20260221141251.34855-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260221141251.34855-1-0rayn.dev@gmail.com>
References: <20260221141251.34855-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support for IIO_EV_INFO_SCALE in the internal enum
iio_event_info to allow proper ABI compliance.

This allows drivers (like the ADXL345) to expose event scale
attributes using the standard IIO ABI rather than manual
device attributes.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/industrialio-event.c | 1 +
 include/linux/iio/types.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-event.c b/drivers/iio/industrialio-event.c
index 06295cfc2da8..5096baf233f0 100644
--- a/drivers/iio/industrialio-event.c
+++ b/drivers/iio/industrialio-event.c
@@ -256,6 +256,7 @@ static const char * const iio_ev_info_text[] = {
 	[IIO_EV_INFO_TAP2_MIN_DELAY] = "tap2_min_delay",
 	[IIO_EV_INFO_RUNNING_PERIOD] = "runningperiod",
 	[IIO_EV_INFO_RUNNING_COUNT] = "runningcount",
+	[IIO_EV_INFO_SCALE] = "scale",
 };
 
 static enum iio_event_direction iio_ev_attr_dir(struct iio_dev_attr *attr)
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index 34eebad12d2c..4e3099defc1d 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -21,6 +21,7 @@ enum iio_event_info {
 	IIO_EV_INFO_TAP2_MIN_DELAY,
 	IIO_EV_INFO_RUNNING_PERIOD,
 	IIO_EV_INFO_RUNNING_COUNT,
+	IIO_EV_INFO_SCALE,
 };
 
 #define IIO_VAL_INT 1
-- 
2.47.3

