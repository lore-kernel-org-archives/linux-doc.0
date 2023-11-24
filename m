Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTCsoIR5"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAAA2684
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 10:49:09 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ff26d7c0a6so317320866b.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700851748; x=1701456548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBdjGgp5kspN/gTg/5L8/r1olrDflqhJ6eCRhlHgGxo=;
        b=xTCsoIR56qH9sKV1pAOlkzSNhUBKq4qZU6VH3GnYRJAUgbdJvzApihreQ7DZEtAXt1
         v7CFbWLMCb6B9jtK3tMIHw9xwtBUxCt25+7NflC+tTCtAwCAeuLDVjenKtOLmFfgrBRJ
         5IdskGY6c/qcrDUDTbz9vHH1INU+6qvAmI5uWqsCu1qjEjEJjmznd+vXavrqPWrJBAkb
         sKO/NSIZCOEVeMhAzdLNVb3xQo8q5ZjLoahIB6v7THa8pnvq4VwiOTHS2/PH1KXlY/6/
         /pMoqFQhPx3PNbQ8U2whERo08ZZ4gMiKwfCzCz3ap1gJIvefgkGtsIcONSl9anRDOrNE
         SIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700851748; x=1701456548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBdjGgp5kspN/gTg/5L8/r1olrDflqhJ6eCRhlHgGxo=;
        b=bWFJqDrTOFFw4ztK0uPr2riENMKJ6Jmi6DCdAYvJDB/nDClYSb5LZ+MEsb1K61NZR2
         XAxm6l1ZE1DA1LR1m6dgzQ/o9djIXIEEvC3J+kXN0NjsiTPu96a/Z7Clv8lzxy7cukUb
         5wUI4VBiEZI5VWashI7QOgYtWBfCG4NJQjY7Y8AOHB96BAFRQHC8Ir2qtBK8U8DAjH1U
         0PQX4ps66Qok5VaYEL0OoIVz0uJijhlXvmWKhAGP05K57omP64D0C5i7735w5zWWvUN2
         CiXUMg2c6hbhZEjl/y+wHirIGRVcHqFRnwxzW2wd15Yi4dFXgF4ODIyr08X+Lmo/jebT
         XbLA==
X-Gm-Message-State: AOJu0YwO1PEwnEtpxBtYzKwVrDjZmV8he86hW6hqQ1xVWXGaACoV6P2p
	eIc6sfm1nnbOj9+Zcr2W8XAbhQ==
X-Google-Smtp-Source: AGHT+IFtMayisNzoJBbemLuOPI7edYsKAeRO/+QbOkbbj3iWGPQpIpJx5J0Nrzut4lWJ2YFx0hTjfA==
X-Received: by 2002:a17:906:fcce:b0:9f8:2b44:7b7f with SMTP id qx14-20020a170906fcce00b009f82b447b7fmr3104870ejb.70.1700851748307;
        Fri, 24 Nov 2023 10:49:08 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lb16-20020a170907785000b009fda665860csm2376405ejc.22.2023.11.24.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:49:07 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	bagasdotme@gmail.com
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Fri, 24 Nov 2023 20:49:00 +0200
Message-Id: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=tudor.ambarus@linaro.org; h=from:subject; bh=b+NYwpA6daCzuWR90IFNBg+e5G7bQ/pnSbmqUOhVPYY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYPAdzQe/vFEYJVzlCJZ5Y6GZNFvYonuk1Br2I 3hs//QOzWmJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWDwHQAKCRBLVU9HpY0U 6djmB/9E21e/4XBmcLtfvMqdO7x8KNFcVK5kxA5xcfQ7dsFHXaDdRPXke74QAR46lH8IdMfNEcZ rgyrr86phHTvxE8KQlo5vy8OhXM/TW3isiiNa0mBLf053jM+BbAZDazxNeccZ5G45EWRyHUztmK drBffO/3eJNc8FiJ3mu8b9voX+umRDkWi+3SBkdEX5xvYuMdFmkN/x8BCdjrxJ1+/3TdjcHc2Hp UzF0IX3n7jIZ01cSlWHI2zxOpigalnIsdtXz8M0CShzDN5oNl0eEio+G5omgEi4yPpfbNYDKoG9 C7LM2jmuMHIVVNCgGCj4zfbRG8GbQm5+Ht2n2EQZHTp0kO1n
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

v2:
- specify that we prefer to dump the SFDP data with ``xxd -p`` (Michael)
- update the mtd-utils tests (Pratyush)
- fix formatting (Bagas)

Introduce guide about when to propose a new flash addition and what are
the minimum testing requirements. Dropped the old documentation as it
no longer applies to the current SPI NOR framework state.

Generate the htmldoc by using ``make htmldocs`` and then find the
SPI NOR documentation at
``Documentation/output/driver-api/mtd/spi-nor.html``

Tudor Ambarus (2):
  docs: mtd: spi-nor: add sections about flash additions and testing
  docs: mtd: spi-nor: drop obsolete info

 Documentation/driver-api/mtd/spi-nor.rst | 247 +++++++++++++++++------
 1 file changed, 186 insertions(+), 61 deletions(-)

-- 
2.34.1

