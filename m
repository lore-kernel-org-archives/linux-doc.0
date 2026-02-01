Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5E52874E1
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970831; cv=none; b=KT18WN5baHiqgulq9F+j/CXzjxYXt7VzL4yL2JJSj50oeYEb2aNsMVq2QPhaWJbInE5emXWQa0U7qY9rhha9TMjEjskrE6NhMuuFMjyvR34kUaCh/gmlWZ4PYdolYt1gPukateBGJpvoZdy/u/rW91wOKNDOBH2BdQ055+wAR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970831; c=relaxed/simple;
	bh=8s71L5/222QicynAznln9mN/6daQ6Flg3Ya1cwHbxeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGBoVtrlpli6np3BCX0PVQL0or0MJlxBk0K+5aW/LgJxrEngZ2uUqWRCkj41E3WefYsOr8cFqZ3TnSuoBXD1On6v57xs8R0Ns9ivV9RYRtTVP+hoKpXSBe6sU6tP/DDnIAUEjzjAa8XVyby3focUT91IdXbINTK7H69u3LNmu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO0w8p2x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO0w8p2x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2467178f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970828; x=1770575628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=309CH24IybzBmjrd1Z1MDsc4bcv4TEJ+M8kIPobk7aI=;
        b=aO0w8p2x6GjluCr6aSD40DL5zwcJDUrdkJdxw51wvhJTPHfanUShb0xY3ef8A88bHF
         9nwpZDGBqR7iFStPYKtA/0AqcyiliaZ15JonrA6ftdvTbcJZZlcQYkBQos0dfv4B3Bmx
         GAA++ptTLMsfQLG8aVRApZBrBN75Ldd8jQuc+T6gV73CbumCywjSregyHD4028dmsNvF
         A27io7PtX94npGkKZV8PPoxXdQuVHrj5JhdEn8S0wjxwq2/z9Q8vuQLnb9xu27C8FzD7
         uAkqK0oB6Ifh3yty2jbH+3E9JDZcoTkiBPMwdlbbzWgxp7PYbayBCs1s4l4iHgViotul
         /d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970828; x=1770575628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=309CH24IybzBmjrd1Z1MDsc4bcv4TEJ+M8kIPobk7aI=;
        b=KyJnW96yEE9yjEyb3HeN3wXL/ESlqCniJHxC8hgaogiX899n8Uz+rFtgYj1+sov4D0
         ErcdyLVKNfBbW4Fnyw5tE6XnIuY+DlKCNlLZL3klqj/XHqTW4EkDz/yF+vHJE5UrxzjL
         2sGwQqf7p2l0pocoMFHBYjFU6RgBUqvmtekoDx9C4OujxriZlRYoV5tGJxT+sNBXTtR4
         1VK0V5dgyCkDu/3CzcrWmDNwHRD9ESozCa7+ZuURz6OlJVGRSyhxPIFVBhcAL3IVyv66
         8sxlgHpcruQXEPInWfM9Njw1H//pdTdL5e5BzpzQX5j5MzbtAg5Av6jIceCmLiehSfuW
         BJog==
X-Forwarded-Encrypted: i=1; AJvYcCUj0MbmbcmY7sjF0V7rxDkYjN8bohWTtVVPnsbGQo8iliDCdxrp00KXL+jL+1Lv6gXS/e81VoYMXiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxV/QGtbryz3ZICv99McEXEhUvpE2dXahvICoIuZ8HD5J2++F
	7/c5leDyN4EmCd7ZnUYfw+0s02MRaLEOTCvUD17rl5Iu2Ocizz7QcKU1
X-Gm-Gg: AZuq6aKRVvd5lC6h5f+u+aRsfucqdwO2FlLV11/mHyH3LMCp/DWDbKMfLqkLjRrx5C9
	jl5yS7GPjQ8pqi1ngLWTvx/fSff3Pct2SzM2TtW3X6T5L3/effYZRDtelyA9DLM48CD5I0+Wxhn
	02FK/XgkWEYVvYAhmjUF+fvCDt4522C+3Rp9twgMNdbD43Ivmb3mkrdRIcSwIghAkeZ31OHssKQ
	CEuwaxqGSlEN34KBIdhmZceov5t0JS3YSap7uJUvvZz0qbvmET5UTO9feX77eU4pWu3Z7Se/GuB
	Nn7QkfUYdt7AFAyVK4QBNcOwTl5ia++sglRadDNofjqjTaiIiDUT12wzL2VQp9qIREvAnwJNYn3
	uL5CZkBWdi3JR5KFC+Q8snmAlNOSAFhm5NV5WW1ap9qtGI2kvojn9zh6HEAmcHxf76qXLVj/8Bb
	1wyZJ9xsWvjjW8A4WJJvOoO5SdBfXsqmtri6rBu4YXN7zP3w==
X-Received: by 2002:a05:6000:2088:b0:435:b7ca:7521 with SMTP id ffacd0b85a97d-435f3a763dbmr13149181f8f.15.1769970828099;
        Sun, 01 Feb 2026 10:33:48 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm41400084f8f.13.2026.02.01.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:33:47 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v2 2/4] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Sun,  1 Feb 2026 13:33:11 -0500
Message-ID: <20260201183320.27023-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260201183320.27023-1-0rayn.dev@gmail.com>
References: <20260201183320.27023-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While implementing event scaling for the ADXL345 to match
the IIO ABI documentation, I noticed that IIO_EV_INFO_SCALE
was missing from the internal enum iio_event_info.

Add the constant and the "scale" sysfs string
to allow drivers to expose these attributes correctly.

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

