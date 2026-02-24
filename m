Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765739C62A
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941847; cv=none; b=SnsyzQZ7i+yA823tt+1xMVPSOsfAUS2cc9pTyFeuDh2fKx2aRNFWKNg8X0qnWW9bTuCvqtvvlZJIkxSZqJ78Mc4MDhNMHs1hJqfUaiDGcB14qeRFYVvbqIF7A3Kb2uO515uDHxDYRjdpacZrWehyFO8i59ZAc0OJButfjMgRGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941847; c=relaxed/simple;
	bh=9/7QTpM9w9CetgDRp3W/v439sqmC/gELVsuHbq2pmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBUAy0tSmKArRhnxrgITIxH3CjpJnn3JOomEvYfiRQJwQlbYGAc8VdQ9i4VHATlHK5c8geZIXq+jU2Rmh6w7wdFdE80BwSMXkqCOaqNrcbSj8hlPwEvpEMbXSaoUbR3zlfl7mw7LlKtJDbiPVBlO8k+vxchdVYyTN2mVvXlk05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC81deql; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC81deql"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-436e8758b91so3840825f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771941844; x=1772546644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=eC81deqlDrSuOuJTNTb4+E+xrQRt0V/yN3broUd32Cgm6vKXc/6nPdyn97cmcdVYRR
         2mhNqaoKrOL47Sz0VpERzLG1RxsgZd5LOulGVEM7ZSGjm5oC289VmmRs24V+blE3QNP1
         qToc1IYf8/qZ2CNdb3VxDFOYYahTxTXAQQlZrZy1sfDjg7Fp1aVIuc1l7PDqTR3BcTnY
         a8EcnlOb06hPLBcHnzDCL+uWbGowf2J//IPHq/p5IXHgwUtalUliq24KbgpwJPc6Zfh3
         Y4HC7DhrbrpkqWBI1reJfOUuD5Eso5HHCZn+HncS8TVYL2Z8AIisUojFoGOWm5J1h8hX
         0rcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771941844; x=1772546644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=XWU1OQLNbk05TjMhBgFaH158kQBhWmsOxpf0HgfkKkqH8Db22jQZJ7MXaW19wlVi7y
         0SZL+xYp9qjxjErEtzgj4D1qw6e+BdQko2lIcDDCcuzC3V8Kz2tBw2jrY4AfgY4cDX/U
         4mUWmMHjOoSrg+fkzyqWeeB3cHjEh+nJhaLDqiRwAv5qjMR6FuQpYUJXZCRiGGf5JXfC
         bQXFUBMv1WCfH1KpIgFj9b4qvzR4xz+YjLPFPYCf/KzZGksp6NXN4p2hwfNSfWnFsvAS
         3kg251t0k+QxvSIzIB66PbaJQXxHQulla1qpkyAiceD5zBYtaSOSjVzUhdBVxLeH0E0d
         yS/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0lkDKjKWvGQ8ah/J3DGIrR+PINhAlXmAoZb8jHizYA+CE4kIhCZPzFqnNY77X7ZcOLqUK9fNYqN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00yDWzRBcawwXIg7ZW8tk0u05qQ4++5RMM5gbbmpGCHM8QCiv
	UVUhbK/SX5h9tRnE46507Quk9NcIxQiEF15GxAhZKWGd36KC5fWrDu7J
X-Gm-Gg: AZuq6aJAQqlWGEBOVVCevsC4sBDTlUJHW5PnXN/Iig2R+U/0P/LtU3xvQMfUza4wCE9
	NcNwc12sGmc056Vy1nr3DmjGtEUCL4AJZZneXgnDyfhFYashGECUrxO7NPL3gFsFhz6AfOAikVH
	jZpRXyz5bm2aIYIBMYfkbzPKGwG4qM52ukU7a3f8gWgGCLyyJLhpxBFXB4/+Ipe2ERzfCY70NS4
	o/rblGfclDzklXqIkHLUECOWSI98cth4lgdFj0N08DROX/yMdGUWVmXQP9pjB6Wb1/egoqmOulO
	5/ki+wdXVzKzWLqSNPFx7WrVPuimdGLKR1rcNLFcqEIjlnRKkiLtZ4a1gwF/096KfQ3EIwaG8Le
	pfozoiNh9G5dVv0K8X4DZvTij1FN3rKybzqt3gUhGJxk/v/L94du/XeA7v9WCNh4AhnN63NZSMp
	kSbgupHixX+PIyqXJXHFkrCuwTmdo/cKhyF9ZVaFoy6+1N+Ab3hi9oSO4IEpxE8hiTJKL4GfyF
X-Received: by 2002:a05:600c:820e:b0:482:e5d4:b7ca with SMTP id 5b1f17b1804b1-483a95f7d94mr187018185e9.8.1771941843952;
        Tue, 24 Feb 2026 06:04:03 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7010a0sm1043505e9.5.2026.02.24.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:04:03 -0800 (PST)
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
Subject: [PATCH v5 2/5] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Tue, 24 Feb 2026 14:03:45 +0000
Message-ID: <20260224140351.27288-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224140351.27288-1-0rayn.dev@gmail.com>
References: <20260224140351.27288-1-0rayn.dev@gmail.com>
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

