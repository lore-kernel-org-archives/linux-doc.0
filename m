Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D41AF0CB
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860785; cv=none; b=Rwld/wsFXl8YxoXar7UudP6lniAOjoVFQAvR4ZV5FNhgQVxmQhMVB4YgnVWjT9nblAC5GLA8Dkk/u8ygazAodsaj/YWxGlxIch7I63yQ9yjc7wu20ESBx3KVhyy34Lf5RBHZhvOiFfZfMs1N5xNtKd6USP/Z78UKJ/dAUj208QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860785; c=relaxed/simple;
	bh=pq9XdkVHFWADXdg25ubbggSQQDOAfo+Tvl8ihs4y+2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jml7f5QHlDCK6cBRmNHX2lSqCj9ZEY1jcUixsCrG+uHKDk/eHRgzawIJo9Ab69Ph69Tw0xjg30p6ilX1G8tlRRbtMMlEC/GCBJJsTvS8Ry2UYRSKycFLVVqAFAq2OAq1QVQqHjrWvRP6Pg8+4npKpa43j2xvG/a+NXMIGsQLGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJ5R1AVS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJ5R1AVS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc3a14f6fbso4350352a91.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 22:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739860783; x=1740465583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T354DsH5/UXQWaU1+Y3gowYWo5275UrIfb+yzWEs+hM=;
        b=RJ5R1AVSIuopst5ExBm0794pfuVhLxoU+YUb9bXGWUZHAOJx1xfiWTkf+nMYpJcDJN
         r0uYbsE2CBQlYmR+ZybHEYATgGLTAansp9Far4hIQx7OBe+kDZ2QQYa7UtCk30ijaNYY
         TkCi1zDWUKqKb10Iwkv5O5ilhF83Ub3+eUiLVfHGC69wdQOtm7g+bhTceXeH5Smgn6qk
         JxF5VFpesEmMihld2BoAgynM72L5GNGiXpCd4WsoEl5LmyCPRtrXCWnfm238WmWJtsJj
         GMUN8a14S+lnDy3i37Tn7Od8HyTdhvb+RUElxHFQbhk1YkF6z7cBgEnyl93n7w12VAqM
         2NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739860783; x=1740465583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T354DsH5/UXQWaU1+Y3gowYWo5275UrIfb+yzWEs+hM=;
        b=vfc7sFL14jbATpdZeciI8QDhOQkefF26NMfT5aMZ0Hf1HykD4a9RMXkhjRX8Ws4jY/
         NSHph15KFGvz19khjI6WwWOO/KEhoWsVRV1mHbGXd1cwbatTvvVQ6EhYgpSiLFIkdg8J
         EvzCSV/DqSdIS6LUltmb9cd2ZthUflGlheS1/Z+iaSx/yN9Rqj+v/rhgT4xPa2KO8tZI
         6oiqHoaxyx2zDbR7Ina3MImGCuvKPVHFXoVK6PXhYDGMOvHsTtpepSKgN8k62CVrdbt/
         H6EtJG05seuZrIVQ+UlDqmbM8lVaQsIienzBqcXDCOMQGBGEGJjYFpNfG/6HsHa+XXXk
         bbQg==
X-Gm-Message-State: AOJu0YwPiBrvFY4b89xTsUlifmEekuastUts7vXWY6Dp3BH9V0uhAp+x
	Hy3JQ8YN9fz3vFZpL8fQyBFM6/s323WSu3U/yrUBBALr5NnbGOaSTQLoFA==
X-Gm-Gg: ASbGncven9tJ1T11c7grCGKmZYKQut/OU5/6QXUv1+puowB4Jobs4EnsrNoieblmJ1h
	Vgmpe7w/4tISApVWNToLlTKzQMc+c+fLnPNEafftv1OQXk7szmC3gvDSDf7Qf/uf8UT9/8y8NnI
	C5HXG0pnNM0q4eMXD/6byilAaaXGwhdKrq/Cu7ysS/UHWVKtmBKSTQglZEUJ3BEagvMCw+zAH8J
	P6O6V4QW9EzNmFEQ/r5mFbkhf3l0O+DAlUsgQ3D4sqq/QRWmcU+bDWD+AgXam+xoZY+OriwejID
	lHlokw/qKOz5tNAeMHDQFfnG5fV3WSHpDz9Y8y9vDkSlJV6NnJwX
X-Google-Smtp-Source: AGHT+IHzYODcMjGCvN37A6kRUe84pQGiqbTkGi7hzYma7bqARxdX35D6FAJyynQb3JAD4eYkUaghRg==
X-Received: by 2002:a17:90b:3886:b0:2ea:5e0c:2847 with SMTP id 98e67ed59e1d1-2fc41044fb0mr15668477a91.22.1739860783256;
        Mon, 17 Feb 2025 22:39:43 -0800 (PST)
Received: from shankari-IdeaPad.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ba61f1sm9181376a91.42.2025.02.17.22.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 22:39:42 -0800 (PST)
From: Shankari02 <shankari.ak0208@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Shankari02 <shankari.ak0208@gmail.com>
Subject: [PATCH] doc: Fix grammatical errors and highlight code funcs
Date: Tue, 18 Feb 2025 12:09:29 +0530
Message-Id: <20250218063929.5110-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves few sentences by correcting their grammatical formation. Some code functions have been highlighted for better readability.

Signed-off-by: Shankari <shankari.ak0208@gmail.com>
---
 Documentation/driver-api/fpga/fpga-mgr.rst | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-mgr.rst b/Documentation/driver-api/fpga/fpga-mgr.rst
index 8d2b79f696c1..a53775399bbd 100644
--- a/Documentation/driver-api/fpga/fpga-mgr.rst
+++ b/Documentation/driver-api/fpga/fpga-mgr.rst
@@ -76,7 +76,7 @@ parameter syntax is the same, but the call to ``fpga_mgr_unregister()`` should b
 removed. In the above example, the ``socfpga_fpga_remove()`` function would not be
 required.
 
-The ops will implement whatever device specific register writes are needed to
+The ops will implement whatever device-specific register writes are needed to
 do the programming sequence for this particular FPGA.  These ops return 0 for
 success or negative error codes otherwise.
 
@@ -86,34 +86,34 @@ The programming sequence is::
  3. .write or .write_sg (may be called once or multiple times)
  4. .write_complete
 
-The .parse_header function will set header_size and data_size to
+The **.parse_header** function will set header_size and data_size to
 struct fpga_image_info. Before parse_header call, header_size is initialized
 with initial_header_size. If flag skip_header of fpga_manager_ops is true,
 .write function will get image buffer starting at header_size offset from the
 beginning. If data_size is set, .write function will get data_size bytes of
-the image buffer, otherwise .write will get data up to the end of image buffer.
-This will not affect .write_sg, .write_sg will still get whole image in
-sg_table form. If FPGA image is already mapped as a single contiguous buffer,
+the image buffer; otherwise .write will get data up to the end of image buffer.
+This will not affect .write_sg, .write_sg will still get the whole image in
+sg_table form. If FPGA image is already mapped as a single contiguous buffer, the
 whole buffer will be passed into .parse_header. If image is in scatter-gather
 form, core code will buffer up at least .initial_header_size before the first
-call of .parse_header, if it is not enough, .parse_header should set desired
-size into info->header_size and return -EAGAIN, then it will be called again
+call of .parse_header, if it is not enough, .parse_header should set the desired
+size into info->header_size and return ``-EAGAIN``, then it will be called again
 with greater part of image buffer on the input.
 
-The .write_init function will prepare the FPGA to receive the image data. The
+The **.write_init** function will prepare the FPGA to receive the image data. The
 buffer passed into .write_init will be at least info->header_size bytes long;
 if the whole bitstream is not immediately available then the core code will
 buffer up at least this much before starting.
 
-The .write function writes a buffer to the FPGA. The buffer may be contain the
+The **.write** function writes a buffer to the FPGA. The buffer may contain the
 whole FPGA image or may be a smaller chunk of an FPGA image.  In the latter
 case, this function is called multiple times for successive chunks. This interface
 is suitable for drivers which use PIO.
 
-The .write_sg version behaves the same as .write except the input is a sg_table
-scatter list. This interface is suitable for drivers which use DMA.
+The **.write_sg** version behaves the same as .write except the input is a sg_table
+scatter list. This interface is suitable for drivers that use DMA.
 
-The .write_complete function is called after all the image has been written
+The **.write_complete** function is called after all the image has been written
 to put the FPGA into operating mode.
 
 The ops include a .state function which will determine the state the FPGA is in
@@ -126,7 +126,7 @@ API for implementing a new FPGA Manager driver
 * ``fpga_mgr_states`` -  Values for :c:expr:`fpga_manager->state`.
 * struct fpga_manager -  the FPGA manager struct
 * struct fpga_manager_ops -  Low level FPGA manager driver ops
-* struct fpga_manager_info -  Parameter structure for fpga_mgr_register_full()
+* struct fpga_manager_info -  Parameter structure for ``fpga_mgr_register_full()``
 * __fpga_mgr_register_full() -  Create and register an FPGA manager using the
   fpga_mgr_info structure to provide the full flexibility of options
 * __fpga_mgr_register() -  Create and register an FPGA manager using standard
-- 
2.34.1

