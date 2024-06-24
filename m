Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00671A01D9
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259851; cv=none; b=mAcPw2kUoQxCYqwqi/3SDd5rKfaLz15njs9YjpwsQvKDDNXb9Usn870E8Se2pYIhoHYKdxAGws2ETDlh4qW8H9id/hw3rLPoP8WW+fjqw689ZOdLBxyhvq/D9D/Pzkjb3UNNOoyvBctvK76FVx/3H7+IuKWP2jjfctzkLEdyB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259851; c=relaxed/simple;
	bh=gwveKsBVtN7JFtmU94y848i/o5pT/Jhq2LKbTqkccp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjSe3odLVr+GSL+3uz6KXkCzD1aBI0FxLdYWHseuNkd/a2dnxKgtIcfGGzEiwFOevnYh8z7O1MnXExYWIgsvU5c/g1LbsybB+LhjhNkY00cW0Jh7dr3ydtnym0KSwcIBG8dpDRZwxxwnGgrOR5fnAycbPFPxiKPUXf+NRUxffR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fkzpX3pd; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fkzpX3pd"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2598f517a33so2564897fac.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719259848; x=1719864648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pynIwSYLtFCFqE/LQh0xYvfYgPBDJkazLg5naxF4gSA=;
        b=fkzpX3pdQsNMGXaaXbgrCM8rgVlEgWID9r2Jw7nTTqnKu3J4VtKfnXp+CRGTMijmvN
         xt+KtfzfapDKixaeOzyaZBxbPARuoxrdtVpjPkj2ED1I6U5iaaoWF6LlFP06XotfCEhp
         b26CvwuJ9XHtbBQMlAAKK3PtQbdg4/wt+ZTOr0m5wN6eP7jM8uBEsZ7bB6pV7A8qptCc
         d/5U5wTN9GRifeOzHQOnk5a3d3r+4WrwT1PyKHZFG95l27UbXhHqsfctbWTrz4g7beCR
         PYJt8w0Fn2WxUeLQ0bhYyZRK3WZB+21FxMAGTUzS6DLT7eKDo3sx4iuLVAU5CEmhNdSq
         FbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719259848; x=1719864648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pynIwSYLtFCFqE/LQh0xYvfYgPBDJkazLg5naxF4gSA=;
        b=Ai1zZFc/21BrxncNuQIyig60wiw55Fuqm/D/yrFP0+5P3t6+ze0zzfmlSPy06H5BK5
         /WrVmCkeoConf9bvrzRF5FCgyWvG2NS+HFFUOhIGSaL/EIayBFOkAN8ENeNPyjMCifXw
         BtK7mSs6UUl/Dqlt3ropKzzgGYxqgE+eGTdMZAjYWHQcuasqY4R2MCqXfu51psIZ6/bF
         2NnEQ80zaBw61Fe263ZxJE/ySJHlv53iexTt3ZFuLTOe4poqfzgxjV40Onvf9iadiHQs
         syefv4bqK6taOpf9QvcDUoT3Y7UM0kfyweASZ9/RaSgTiidjNzGMX/sH015SMB494Kd8
         TU8w==
X-Forwarded-Encrypted: i=1; AJvYcCWTzjwGxnd+lvjkBNq3T5vjP4Z7O8LbP5wu+7UwPw8f+Te6YXUc8vQXD3TeicuEe48pvfkILTlka0sY1xrRLru+3eGdgfDQ2SCH
X-Gm-Message-State: AOJu0YwymAxx/ESutlw5buKvS2eN71ltQHNqVr7YQeEQSNYLgDkBG0iJ
	/v9M7PPM7KF4mTVWAOgxhF8E9fxh1+cG7HyK8+FjLLi6y/I1FBQFwdOq+Q2h1hA=
X-Google-Smtp-Source: AGHT+IHRPUfp+ZBPyKVGnp8PYVSyxPlPBcZpQHC+Oj3KSMk2tSXxZxcaP2yg1g1kDGwwn06PCl+SEA==
X-Received: by 2002:a05:6870:40c8:b0:250:7a8d:1756 with SMTP id 586e51a60fabf-25d0163e8d0mr6380388fac.12.1719259848112;
        Mon, 24 Jun 2024 13:10:48 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd498872csm2056581fac.21.2024.06.24.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:10:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 1/2] spi: add EXPORT_SYMBOL_GPL(devm_spi_optimize_message)
Date: Mon, 24 Jun 2024 15:10:30 -0500
Message-ID: <20240624-devm_spi_optimize_message-v2-1-58155c0180c2@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-devm_spi_optimize_message-v2-0-58155c0180c2@baylibre.com>
References: <20240624-devm_spi_optimize_message-v2-0-58155c0180c2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

devm_spi_optimize_message() is a public function and needs
EXPORT_SYMBOL_GPL.

Reported-by: Jonathan Cameron <jic23@kernel.org>
Closes: https://lore.kernel.org/linux-iio/20240624204424.6a91a5e4@jic23-huawei/
Fixes: 17436001a6bc ("spi: add devm_spi_optimize_message() helper")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 3f953504244b..814d66fc9753 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4384,6 +4384,7 @@ int devm_spi_optimize_message(struct device *dev, struct spi_device *spi,
 
 	return devm_add_action_or_reset(dev, devm_spi_unoptimize_message, msg);
 }
+EXPORT_SYMBOL_GPL(devm_spi_optimize_message);
 
 /**
  * spi_async - asynchronous SPI transfer

-- 
2.45.2

