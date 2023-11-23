Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7Zri+G3"
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435261701
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:27 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso137741466b.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700755645; x=1701360445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+HLaQ4LBn/sUNR9G8JbWf1oEDH+SCWwSR/AdZg4c2Y=;
        b=W7Zri+G3aiK6XVTpfVwlxAq+BWwbYCHIT1ossIXHWaainEBIyS8vASvwJSpuDzB6jg
         y+AwoWcsKRKiiJ33LPst+wzvSqDViqy9imxAkEvhrnl7pmCQzZGDYxrYcBFkpvtl1HxB
         jCKSAR2KgJ8sEEDiTgn9+NWK5dV7bqk1+fpzdl9Ld5XC/Oy4QGey1g+yVgBU+jSjstP5
         +TPOmFaxX34G/dtjD8nwxjDCZtoRHWP35ye9R1JqPIPzBKTBe/Rh/MfHACCzDZ7Y9WSC
         xKOCuC145YUudpiYpnOPXqM4ubQEU8N4oDN5clogXOYIjrTv/HUdbJo5qs15r7bUiyHp
         l/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755645; x=1701360445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+HLaQ4LBn/sUNR9G8JbWf1oEDH+SCWwSR/AdZg4c2Y=;
        b=WGk/P/ztcX2VGEhYZojpq10xNUxd9Rz8lKIiWmJlbosD8GiVkOUWRd7GRa/eXGrMUF
         UBlAO//P1WcR51Ae/rKKhQXDaDK64VK3YXlpyWGapYHxA46O0tgeVBuglUqW0e32LXP0
         F/AZvn24e5pv9XVBNbyyE+LTvYP5O0XGOHy+QD1GlJIDcmSri/RtO83KDroZoRYrt3Vk
         k0I1DQFEKO49Nrr8qaxcWf2tqy1MBfvVa5rq1Oxeo2m6QsktRgv6/30xm14awVMyvXUt
         H67R9DAdt9yr3/Lm9iM8aXX+I1Ey1A1Be4fJc2uDTbQc1UZV+US4vhRODoV4Qa4kRcsq
         b7hQ==
X-Gm-Message-State: AOJu0YyXAdBkoSDwH+1YUbTATC7rlRmo/O90tn6JYKeh8WsRtLhPlIIb
	2Rot1eSKbHxZtmC1fHbtt9YXyw==
X-Google-Smtp-Source: AGHT+IFQndvSZg4w3rJtAcl353aA4kMN8cLIKAAKZ1SYxXym9WFmaRRbVMUT8K1eNEDWBPB5R6KVdw==
X-Received: by 2002:a17:906:19:b0:9e6:1dc9:9807 with SMTP id 25-20020a170906001900b009e61dc99807mr2768988eja.77.1700755645627;
        Thu, 23 Nov 2023 08:07:25 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709070b1500b00a0180de2797sm941490ejl.74.2023.11.23.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:07:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Thu, 23 Nov 2023 18:07:19 +0200
Message-Id: <20231123160721.64561-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=626; i=tudor.ambarus@linaro.org; h=from:subject; bh=RUUGrpTnn+dK3J0RLE96RVqrRMkZ9QBsAMu5cYh/kLM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlX3i4B51az5Zp+f+mQkihPnjD3/FOh65ZfsOfe LO5hsaU/3CJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZV94uAAKCRBLVU9HpY0U 6dgvB/4jv9Tw8sjK0Hr3+ZlkwR6ZRSeTFWb4Sqnu8Mu9jjD4Vj2mesXCjLdT/uVvUlAS0NEFfJQ POEmupH6KVbZ1uCcquSiT7+1b7toRJgCRKNGoV/1lmjX+9sg/2jjyWm4Q98S+qJKKmuogY1gFfh CHSG+ExydRc8n87+Tj4IjSrLdSaZGk7gj7gEdgC7MG1B5zFzyXSjhDvr43s6Pn/1GcBbeyFw4Jx H89+OrQceFSqVhgoNyb1jV85H2z66DrgXpctb+Jgoku//MRltAAdBhF91R+TCzSFW3z4h2qGEF9 MzX8jBpS5XtL60zmNynrExjwpTnGHI57xiz3gzXbUfuFXQ4h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

Introduce guide about when to propose a new flash addition and what are
the minimum test requirements. Dropped the old documentation as it no
longer applies to the current SPI NOR framework state.

Generate the htmldoc by using ``make htmldocs`` and then find the
SPI NOR documentation at
``Documentation/output/driver-api/mtd/spi-nor.html``

Tudor Ambarus (2):
  docs: mtd: spi-nor: add sections about flash additions and testing
  docs: mtd: spi-nor: drop obsolete info

 Documentation/driver-api/mtd/spi-nor.rst | 249 +++++++++++++++++------
 1 file changed, 188 insertions(+), 61 deletions(-)

-- 
2.34.1

