Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RM35Msc3"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FDA1980
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:33 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a04196fc957so144900666b.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700755652; x=1701360452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoI3lRlk1siP5XEqEA8VbXVQlXNyy2eE79v15BctaEA=;
        b=RM35Msc3C0sgh5U5dpqtPFA7zoPwcsZZuFe+QpfBRt1W8O1rZrkH6i/21z/H6eIv+5
         nDHjUjBcrOdRBZB2v4MNo/OOaXomU+VzUzzoe8PPFZTT4+yCbZUnO9dtTvlX5CSVMKCI
         4VWP9H/wWpuhCsZSs/Aq1PlAVVcSxCnBUcpVn158Pegrzi/0n5vw/RZLp6QUwMPlg9w3
         H0Os6IMo+YY+MCUL2IbSmPXWoQpV2cKaCBx4+Sh8ru+i1zlLm/OUSMQajHLWjojVS6ow
         bXbioq/8SJkOKtUrxUdCrGeLGiFBy7RJyeFa8oLnHdLu2dgQg4xY51mV3wuj4YFSACOg
         79yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755652; x=1701360452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoI3lRlk1siP5XEqEA8VbXVQlXNyy2eE79v15BctaEA=;
        b=mwhddYoLXfuYjS4XhIbGtuSTulshea4Hl6QEpwSvOfakWZZyvdZBGOiMzcBaLSpYc2
         7M9mUplkCtMM3mVRyhTdINcXqCN9MJyEm5VSzyuR/rgPnxseSW1iwXU8khjw/Y8JNuPY
         09Lkf5f72S4UKsLvU/qlrRabcBq0Sqm2sO2F/2ayGsO7DOcsOvXJm/VNrW79MeSPnIgr
         lMpgTesnn1DMV2ulGTgAx8At6M+acwaxAs/6HUVfZ70G0A1YSoKZ2lLZK4JC8ngf/yo5
         PSEwsI88RYCn3n8YP0jXS/nafBQAl5USeZRQ/UjtYpiiRlnW5rL4G0CjXVC6SHM5/aly
         xiTA==
X-Gm-Message-State: AOJu0Yz0fMn/zxBvAzbMYePvKEX3IO4vonRFW1Z7TZNFq4+UU3EEIu32
	7LXtolZaiI4I3CiplVeX/4fEKQ==
X-Google-Smtp-Source: AGHT+IGHrjV7KWZCoEyhk3LUDeDpJK+b8DsMP8V/SftnXg8kdd6A2uqtPufVt+RamQUhVxFmLniHLA==
X-Received: by 2002:a17:907:d38a:b0:9e2:af56:c380 with SMTP id vh10-20020a170907d38a00b009e2af56c380mr5454059ejc.6.1700755651692;
        Thu, 23 Nov 2023 08:07:31 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709070b1500b00a0180de2797sm941490ejl.74.2023.11.23.08.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:07:30 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
Date: Thu, 23 Nov 2023 18:07:21 +0200
Message-Id: <20231123160721.64561-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123160721.64561-1-tudor.ambarus@linaro.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053; i=tudor.ambarus@linaro.org; h=from:subject; bh=25OPubX9uzUyfM/XTP0zGdZT9n+Quh1N4wccoUHj8ic=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlX3i5QFJr2OKH8EvKa+v/4w+Lmao2JCr0Mw7oV /lLZU7/wzqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZV94uQAKCRBLVU9HpY0U 6QCbCAC4SngJRGZ0qeFbmpZ6hInfmNRUbhAEQHkQxqBDDtkD+zPfaHPtRDnzLTVp4wl9ZW+pv50 Uov8OIk5qS4gbc4Z4bJEqhsWZmOSpEV6Vlb7Se2LnRTeY7q0MPjA+Q4XkScUAnFB0EszN0POp5w 3gfs2paYIdVQbg3Nie3Dxomp8hpxgIjDEsjtP91bvES+Taajqgx4JQvOFebwksgWbrOp7r9iMrX s2wMu7w8QDSh9bODQfv8sDI1E3Ou+DKbos9OBejAD7lFPfLLpRsvZ1bKQSAMA5H/PVXrwOBXlmz CZt0aHdVmp+6qwMi1p03b9uGe7yE2Y3dTr2W9ZurmmhwLp22
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

The architecture description is obsolete, it no longer applies to
the current SPI NOR framework state, remove it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 62 ------------------------
 1 file changed, 62 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index cc8e81e09544..7a8737fe181d 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -2,68 +2,6 @@
 SPI NOR framework
 =================
 
-Part I - Why do we need this framework?
----------------------------------------
-
-SPI bus controllers (drivers/spi/) only deal with streams of bytes; the bus
-controller operates agnostic of the specific device attached. However, some
-controllers (such as Freescale's QuadSPI controller) cannot easily handle
-arbitrary streams of bytes, but rather are designed specifically for SPI NOR.
-
-In particular, Freescale's QuadSPI controller must know the NOR commands to
-find the right LUT sequence. Unfortunately, the SPI subsystem has no notion of
-opcodes, addresses, or data payloads; a SPI controller simply knows to send or
-receive bytes (Tx and Rx). Therefore, we must define a new layering scheme under
-which the controller driver is aware of the opcodes, addressing, and other
-details of the SPI NOR protocol.
-
-Part II - How does the framework work?
---------------------------------------
-
-This framework just adds a new layer between the MTD and the SPI bus driver.
-With this new layer, the SPI NOR controller driver does not depend on the
-m25p80 code anymore.
-
-Before this framework, the layer is like::
-
-                   MTD
-         ------------------------
-                  m25p80
-         ------------------------
-	       SPI bus driver
-         ------------------------
-	        SPI NOR chip
-
-After this framework, the layer is like::
-
-                   MTD
-         ------------------------
-              SPI NOR framework
-         ------------------------
-                  m25p80
-         ------------------------
-	       SPI bus driver
-         ------------------------
-	       SPI NOR chip
-
-With the SPI NOR controller driver (Freescale QuadSPI), it looks like::
-
-                   MTD
-         ------------------------
-              SPI NOR framework
-         ------------------------
-                fsl-quadSPI
-         ------------------------
-	       SPI NOR chip
-
-Part III - How can drivers use the framework?
----------------------------------------------
-
-The main API is spi_nor_scan(). Before you call the hook, a driver should
-initialize the necessary fields for spi_nor{}. Please see
-drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
-when you want to write a new driver for a SPI NOR controller.
-
 How to propose a new flash addition
 -----------------------------------
 
-- 
2.34.1

