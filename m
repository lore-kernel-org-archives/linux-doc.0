Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BE267F69
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107622; cv=none; b=fO3pGtxouYg15q9LMdbx0T+tCyWnu/JetxUQS7lvvKgGqeTLPortrQH/NlgXWhKNR7ZNMyLKabxUwEYUy+xSxON/qhVRpZkROYPLJW96Z3KaYr4u/AoSn9ozkHx3g8ycggaTB59GfAb/osRH9fxeImk4b080xdVkzSS6iqW9OD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107622; c=relaxed/simple;
	bh=4KSeXmCw6z9Bh/u/zmCWqVRpCXcjpLPI9k+ZizbF7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRBJQ24qtnjfCINlih5FYhIy5lsJa5B/6XZQvyBIG8aLmnD+wb/w8JL7GG6S+B6dtu6FOlP15aUMv387qsm0mBJLwoQcZgmhqG5V/9/UdJt0aFVKObwpLbEY8RJC29cLBrF7xi31e9C8KqYCa9PgQ2qYOxyHF2fnxlrNh9OqCoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l6lTGonG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l6lTGonG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39727fe912cso2342522f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107618; x=1744712418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgEWndJtLeto4lW/nFUn4b5LOfScisxB+yrfREee8i4=;
        b=l6lTGonGg0nC9X6Xxx3f/4LV1cqXKJxTJpwd8S7JCgCPT/Skyf75UNHI3kDkjk8oMR
         znpD/CTuzPQOkiJXlljomK4kTmC4UktuJSVDAXAqMwm4S2pKipOwlrhJ67yp7sJ4HlWI
         lm/K6hqzjRjcxLgeCLH+ue8bmUWq3AIfNaaCME2MCGYkfj/BbrXzd6kzztWTqfVG4Pu1
         GT/I6sTXFKHLlGzbPRVHfVCVWrcGoFq3nCF8sK2F2PrJE6KjfY7Zo0g/JCkKuSrNMm0s
         31pFMqEIGolT+IuEccXYuwe4WFhdddq9aW53OSCVzOODqocQ//EfTVKQPRagCXCFeEVT
         Nowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107618; x=1744712418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgEWndJtLeto4lW/nFUn4b5LOfScisxB+yrfREee8i4=;
        b=qOJio8uiVK2FnCdFBQN9jtWA3aNXxIywQUSpZiAxSAT/e6SPK51Wt3+Riwu96C+fPp
         kHaVmaVVmleb/9j25J2dQ0kmniIdFPDDXa//AkCRNN7aaVEWUn+A5ZFSaKNxoBt4JApL
         2fXysV3vVnfnqLVzh14kHQvTeZ4BDGEeLO2gMQcRWHzfEOPajNtfgWt41fmb4oIj7Qhu
         2gwShjYLdXZ5eEQybaPh2p8xWdGIKrQeqyoEcuETQtbRibeQMmyTRYxfHWWg7JLGCO1c
         3gxT03/E56LNPo4EdAeCh9x6Q1gNKke4F+KguW6UJ9Q4Ax85OWBNVbQVOnTU7O6lnUh7
         cgTw==
X-Forwarded-Encrypted: i=1; AJvYcCXy+XwAYXqOmZSgzhpgLghANRbM+Xx/eSwHMeC4hDHU2XcKv1o9nYLfS7XAOCiFXpzsacbpplPRWro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnznXAoUy3XrlB+m7DvsctOX31svpG9etx0qTl0xLg3uJMZaJ
	aMEzjk9ps0Khmrtcqu7iHn4dBZq3jwclY7UXj3vtUbG01j6SfRfjQzpMLViwDl5k4YkRQfEwn+3
	y
X-Gm-Gg: ASbGncvrzY9JbGixhn0Ajevf+geTdiQTUspS3CPg7K5aTU8sMw5/V09JFKe8R2XyVQP
	qcBqZb7urgOeZXvpQ2RnQxDA//KRVqt4pHCcq6GuK6uiRb1VOOe0B+y0Rek/uviZrxDQo7/3g3m
	hKOzsMgd5JPAD5zll9Z20RPtBRKVnqAipV/0yZZ8F2GkesTzcLIR+/qMkjOUVEKjcTud/Y/4e2k
	3/pF7Idrm3HTHrwx6eGpytuBg2m0dF/CbIhaOu6S7UtzHTFyrbxO2Q2ujg3kp7hosZTW6x2SRFF
	ws0U31nIQur1xRLCuXqb1CiuzqfV+xftt8p2IrmNXuw1dFXWVGfwE62UMagB+D+SwGMtr2nt+B5
	VIvVpE75sQfC6I5hnfXuilg==
X-Google-Smtp-Source: AGHT+IE16kQdWoaOdUZSc0jBccGORe0Is3ES1Dz4BnnxEo5oDNDU3iW4GWjTfYWewqM5Ap/v54mENQ==
X-Received: by 2002:a05:6000:2506:b0:38f:3073:708 with SMTP id ffacd0b85a97d-39d6fc00b6dmr11042622f8f.3.1744107618605;
        Tue, 08 Apr 2025 03:20:18 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 12:18:54 +0200
Subject: [PATCH v4 4/5] iio: dac: adi-axi-dac: add data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-4-b33c0264bd78@baylibre.com>
References: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
In-Reply-To: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=FaVSbpu5wfHy4/JtVk4ww5/ACGVgPb27AkggQGWKjsw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kPoXUeeXGnOJ/bX/wLaZ3wKazikPO9QrOur+xoFe
 rFW94rtOkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEzEewHD/xQWS2GeqF9fWFNv
 9k9rUXicWCSiKCdbVOrUUqhiF3OageGfbYPH46sFOabyF7PvHVG61P1W312xafaLfW9mt9487l7
 BAwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add data source getter.

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index f86acb98b0cffb09bf4d4626f932bf1edc911e2b..8ed5ad1fa24cef649056bc5f4ca80abbf28b9323 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -536,6 +536,35 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 	}
 }
 
+static int axi_dac_data_source_get(struct iio_backend *back, unsigned int chan,
+				   enum iio_backend_data_source *data)
+{
+	struct axi_dac_state *st = iio_backend_get_priv(back);
+	int ret;
+	u32 val;
+
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
+	ret = regmap_read(st->regmap, AXI_DAC_CHAN_CNTRL_7_REG(chan), &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case AXI_DAC_DATA_INTERNAL_TONE:
+		*data = IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE;
+		return 0;
+	case AXI_DAC_DATA_DMA:
+		*data = IIO_BACKEND_EXTERNAL;
+		return 0;
+	case AXI_DAC_DATA_INTERNAL_RAMP_16BIT:
+		*data = IIO_BACKEND_INTERNAL_RAMP_16BIT;
+		return 0;
+	default:
+		return -EIO;
+	}
+}
+
 static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 				   u64 sample_rate)
 {
@@ -818,6 +847,7 @@ static const struct iio_backend_ops axi_ad3552r_ops = {
 	.request_buffer = axi_dac_request_buffer,
 	.free_buffer = axi_dac_free_buffer,
 	.data_source_set = axi_dac_data_source_set,
+	.data_source_get = axi_dac_data_source_get,
 	.ddr_enable = axi_dac_ddr_enable,
 	.ddr_disable = axi_dac_ddr_disable,
 	.data_stream_enable = axi_dac_data_stream_enable,

-- 
2.49.0

