Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA423716F
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739822754; cv=none; b=mWItwRROIpfu8w8GLci8QrALMQjxuDv1jHqb3oamDYIgI8WtEkPnXS81B4lIWVgT+jVs+e6n4X0dr0KoGXLtLroUyMY22UEi19EHuvcLINkY3rIc8a1LwywHP9XC6BQZ9v08kCUJ8uL2ZSb9uDGzrbYpplfGRRuYge2r8JlURd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739822754; c=relaxed/simple;
	bh=bz3ghJTQitgH08tvG4NJT/xzUkvUumCORGKU4Mo3sks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CZaJFMbdiT/6vdD4mIR0InHM4A1LjczAJ8d28ZskbLy4eWVn4KAmDh/8N735w66JMfIifPfxNgkr0qYRfUgLxvXU5ncfngQ3PsoelY1t0Ev9DUKtOGJdlpAnrfD6krfQmg71jYXJGJJpMzRTXajIu/x42Qkl1FFhCuEByqgjPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2JVOCl5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2JVOCl5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220e989edb6so89998945ad.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 12:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739822752; x=1740427552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+O9no49fak2pvaQIEBXjpb+RmRdk13oRryIZ0i9Ffo=;
        b=I2JVOCl5BzmHMa1zwJsVaC32JycquQCCObe0f1jcCDHTecPcGxrQ0dIm6K7+m7e/rP
         3+Lfg/Af/cJIqBGVVW03VY7hdgYnIUUODfgMo+85rNsNbsZ+IadFc7FTBUmoVi7mvfZQ
         xr0+FP2F9wLyvD2JKdigC03P3EnWQaf/cpnKN3iAXoSjrJz24CGgfTjr7AHLQTzMQIaI
         qQw/Pr17AX30H8xIQHu0Eogl++h7P4h9phLVpnQQyf5G0squg2Skc4BB+6HuEMJKq0HR
         emb9UR6FfioYs+XgyqIQvCqXIWVlnjT537bnjtSb7TUst8AGuZm3rT/tjZynEcR5koBc
         +O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739822752; x=1740427552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+O9no49fak2pvaQIEBXjpb+RmRdk13oRryIZ0i9Ffo=;
        b=SDurL+l+pMq8kCtXg498n1HWMW7lR6M1nxi4QsEkUfjSQpkhEYpU8a9MyeNimi3ezs
         ZDPNoTHtWv1g3lc9lhjlv/gsmsHU3psaiP69O0DyWI4YqqRk/PiFKF362q4At2y2v/mM
         NUbregJMUxbTr0tCQnOlNjk/YySUFIeGkK51GSf73LFl6aAyQIf9flV5F8TOkFKCQJOr
         2UKRJ+tT3pc7TBEcKqj6UT795zdT3FZ2p50gsSH+qVBiH61ChQk9X7uZj+SpJTUDY8e1
         ivpBwfhYMnXVBbOsalPxNwGiwRAgPEpFFvzvuGC+B722uYosB/7bgErooKj1V7U8C1AJ
         Tj1g==
X-Gm-Message-State: AOJu0YyvTjN1vddBHLZf+lSwjkuzmco9lT09qD5KobOV50Vjm0DySAV2
	Nhv47vzeemFeKtefou5fu35aRMyGPwKPx4+Gek0vuCIIJi3jH9dB8Fp6Vg==
X-Gm-Gg: ASbGncs7EQ2cwiyRZCSAit5KiNKk0KI/LFuny55Ttsr6+yvhl/PgM90cDgcmcKcMDBl
	1CbPTcMQyTjtgDzI7AD83haJ1s0l4SRk1oSp8EeIKm0FDarzR9Ar47TIfW3kQIXWlXi8E2oPVl/
	7PK1WxZHBgCWGw/47+Dlhn3pXWgyUWL9nrV6gCD01kaYjif5rCy9h/ta0B9tXx2v6WLk//I6Nhj
	bQoGyEvATCbCR14lWtfylsx7QzpkdbhT7zKqgEgzX2I9XczxVJmR3r8/uQhTkJaVcHzuLgZfR0M
	CaIGuZ+zk1xagJeXmHVZhrm/t6jG2G2W
X-Google-Smtp-Source: AGHT+IHhSJE9DHS0SPJwxjLUPmyrrRlOU+pBVUM+dda4NFx/z5Y/N0WPOzv9xcHk9A/95U+6u24XVw==
X-Received: by 2002:a17:902:cccc:b0:21f:454:953c with SMTP id d9443c01a7336-221040d6c4bmr176618605ad.52.1739822752176;
        Mon, 17 Feb 2025 12:05:52 -0800 (PST)
Received: from shankari-IdeaPad.. ([49.128.160.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5590770sm74886525ad.231.2025.02.17.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 12:05:51 -0800 (PST)
From: Shankari02 <shankari.ak0208@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Shankari02 <shankari.ak0208@gmail.com>
Subject: [PATCH] doc: Fix grammatical errors and highlight code funcs
Date: Tue, 18 Feb 2025 01:35:42 +0530
Message-Id: <20250217200542.26594-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves few sentences by correcting their grammatical formation. Some code functions have been highlighted for better readability.
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

