Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04859245005
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454642; cv=none; b=qRJOzabsO84gUhW4R31GwDL23w2kbc8b7KcOa2Qm8QVlT7Oa8c5djn6CplhCJuXI9ryIHX3kLMahgFtJttGr724Ni9Oq2NvDEwEl9SEK7IwMNT4b+M2+sz7/HUmNrprfSDErdETebPV6aaIfM+895j0Oh/7OsvTAMRQ9UUDpLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454642; c=relaxed/simple;
	bh=q0MXU2V4yXyG9Dt8boTEYRc02KHOaBnXIrWKxjNu/rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XJIHY8z7sK27BuSqtoc9CrasrZlMS4MaaTlCJUkhwKdNnjw/8du6mF+iENz5hL2+MZb08RxaMduD6FtTo8HyAzIjmiur6FThHs0X3LhO8v8MxfDOObVGlx0B99Y4tQXErbpaUm2TszbY5cR2yNNFxMQ0Hkta1cgQV7KGP5wOGpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax1IsyRM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax1IsyRM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0834769f0so44978985ad.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766454639; x=1767059439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xscG6RZGK6mPQrxphjn8rTShXaTt3nErGk5YzbghIBo=;
        b=Ax1IsyRMESMAzOm7/biofvpHE/ScxEpJ4shxHE01jD3fUEiW2Qow75LyGfIc4Y/Qhf
         0y0Uov3K3cTHLoVlIdpIq3JGkFMSWSAgOCQGGYl1mgJ9T4F5mgvNlGQ5tL/uDACG5Jbr
         HTVsciZc4iCOBZ1gxdbgtpYq+JWdxBzoOAITPljkzZ7NWS9/5+faDu09/PwJm3Q3Ikkm
         Eycn73c/9n7+XK4Dcx5NPYT/IlNMLrsam+G4g7rZXYYNW2Rp8pINNiYGJFtua5f7mDvI
         EyjVTn+fsYkbtwE3slvsLxlumQM76B/DYPVwK5ECTeYbbjPVr8xtsOSQIuFoeOjP+OFt
         dbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454639; x=1767059439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xscG6RZGK6mPQrxphjn8rTShXaTt3nErGk5YzbghIBo=;
        b=xMOdX/psb4woIOjD7YFVyad3ryChREgXXNwerjJbx38r/A6Rb4a3I3oLdyowDOClqg
         r/swMH1R79VSmZBW2tzqOXvk/JhY/8OvrhCJIflHe9AigHDfmn02wXmnS5FHvEj+wJbk
         ij3SzUjRLWXHJUDNzUFhXU//GzDafxc37BNpnPXsmalMO6o7Z82n1K9c80wErXi4MbWX
         9ig/cimwM3ypep7h3Lv4hSZPlqcfv/izCsxF3te6sTIvLM5BcD9lbhjqktN5bp8TFv8o
         iLukpG+t6MWl4Fk6TcPlIAkML7XiSAJ87YM+N0+nkbpONsJ//h9g1kvPuTRTpk/L2Z5a
         A8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm6kqYy3upAQgM3DG8T2tw7PrDGONFydmWfZNTePhqMF3b0l06WumvXolojs0UvGd+IiVKmzXzcRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzrv6DK57uW3Irriq2Z6iDpCzOcPRLhDYohwznzZw3uE+A1GlR
	r2ekF7svOR1WOaZFHNQbam/FIbKrS/3Q/SyJwZjlGXpF2xUAO/Nu75y6
X-Gm-Gg: AY/fxX7HLRjnuQSjGqsKPcqyqCxlgX0yO2NoitWh2m+hSq1CxpbysquRobEhDFWAci1
	gecOCah1XCld216W+cEVwA897vADdph7z/Eips9fxD+u4iayfBT3kr5Lis5cNn5XOR1ymnbapso
	lVScOF19L+H2qgFG4BEFhzNNiVjnctRfh02iun/K0beUruxr9OoRuDUHdTd/JeT/PQTReXwVkgB
	ejPyO/XfqYh7pKR0wGinJUZoydJ/GJDwB6TgfZPWqPHtuT2viKftVmpgrkr+Ju8S/GyRI+TMMcP
	Am5FMsKu0C+3zFh3wFL4UX5zo3MsO8DCvwNHEDvIwPI7UOEcL29R3cR1q86sgoH5V4k1ZMHLp7K
	RkoFRu4CXrQADvCVCESTDQo02PjQlhz22EgYxbhK7KYZNW4cXhCZY/irbvU5X1Si6b1ucfBtE3C
	6amYNwlc9FO9HmM5cCuet+T11eBUFFONff885e0WCIC4WTod9eqhS2hp02imGeE9mEp8VkLcO5Y
	WTnwF0PBmvd9XMvS8+bz8EJpc/aNfQ=
X-Google-Smtp-Source: AGHT+IEUcD+B/8rPGyakTek4aNTU9jw6ozofbVuGAW/e6r2m680KkKenDeJ2iflpi617B8bEK2YU3Q==
X-Received: by 2002:a17:902:c943:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a2f2735164mr131611775ad.28.1766454639100;
        Mon, 22 Dec 2025 17:50:39 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66834sm107316205ad.9.2025.12.22.17.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 17:50:38 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v3 0/2] move STEF48H28 to pmbus YAML
Date: Tue, 23 Dec 2025 09:48:30 +0800
Message-Id: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- This patch series moves the STEF48H28 device tree binding
  from trivial-devices.yaml to pmbus/STEF48H28.yaml.

Changes in v2:
- Fix the entry added to trivial-devices.yaml by correcting the
  comment and compatible string ordering.

Charles Hsu (2):
  dt-bindings: hwmon: add STEF48H28
  hwmon: pmbus: add support for STEF48H28

 .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 46 +++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/stef48h28.rst             | 73 ++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 drivers/hwmon/pmbus/Kconfig                   |  9 +++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/stef48h28.c               | 76 +++++++++++++++++++
 7 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

-- 
2.34.1

