Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90660217647
	for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 19:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447848; cv=none; b=IrFcfmVL9JZ1Jg955+8NTeWmjB2c7sxap45p7oIutw+p/9TwjBWi/GAGf2siIeY+Lnp41aLJg9ePoIZYBhCssob2hG5zJZL+FUcK9OVhAWb8U4ucTK2URmnxFbrNT1OVWvPnJCBDu184eftmuho49qy5Y720YLmcQCSclWiHoEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447848; c=relaxed/simple;
	bh=KCzCQK5KfTNTXVj3QAb70ZvZJIWC5xLub+VrbQLHf60=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PNSlpPXVUO6dAgykgGjNPE+qv2yJbnqDiFZQg09wi+yGwjjdx6bTJhUuH9ELHmSYULsJxFGidxzfgR/QawSNIJBqfm5rLvNYVG0l+CmPgNa5ooUJrqFPp3sVxBnLd1o5IOOgPy3efhlb22EAGmT+4N168x7txphkgE4VpukvRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WsMJjIcM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WsMJjIcM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so971505666b.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 12:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447842; x=1744052642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3EOzlYlRNAiJ4+uUWCt9BJ21v6gCuzJhG6mflO89SQ=;
        b=WsMJjIcMQuHGuqHk7oPK0lSDmr4KCRyTZ1ew2THFefYrrYbQZwLwNLDvjGOXgyNrmg
         PsHT7FRCZvh5qgG04/7QuHs+kJfm70JJXrTcsQhE/q7OvrudMujMkFcVEDfXlLu6N0Ol
         t+K+swTplZqslhFFmNNI8gDDdujtQfETFxizLghs1aCFF59UIj8bDiHT7hJpwIC55P6G
         qpf6rBdyfFvF7Nu1ABwZkvDaFcD7XjbAzi9ax5aJ4SDToKhJ1WRIuq6dgH/gSowJ0o1Y
         75RzZU+IrNUkneoeKy46SaSnJT30NFkccTR7V+n8a87lMUA/WnAvvdNR5pMSQYXcAhgn
         Vykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447842; x=1744052642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3EOzlYlRNAiJ4+uUWCt9BJ21v6gCuzJhG6mflO89SQ=;
        b=cM1W8KeCz0mMICqThbyOYOPp06bqWTaOf7zC0BJM4/uPjzj0H7884CwU2vAKnPa9oX
         4rNA86DYkUqFTQ226Cv5G/XMbIbiOQ4n4AqA5Zbb06+lNxjg7ZM+prAymyskondKFU5e
         USWevrHz5Nl5spyZI3j8ZyrZXf7Vx3jncbI+4jGlpwE4MFnKudP40MIEVVLmmPxWRkmV
         WCljhF0qbxZf8jlKgREEolLzXAnNTEnEZCh+hKWxTOoan2B7BZHoVO1YaD4yRepeZnfz
         gfhYTeZ0EsZmxZgY79mW+qr/SdYRBksYUMzgpK23/24gTYQUi2hZ1yEYiYpIo9xLEOHf
         X5vA==
X-Forwarded-Encrypted: i=1; AJvYcCUxpDp8MhJhfWXCzjo3Ec+ItfH/aCy2Ez9t+8A90fMhCI0E3Mn0UJecaxhHWB218wisz9iNHWFppII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgQxYYSqXbJISSy4HwxnfWn3dJwIua/xTKAk3yEcEg5mlCWaX
	CSLEflO3Ta/w6OIRNWJPYFlgLhHV39KwUt4BVFqOuEnBo1f8JEHAgJZoAKA5/TQ=
X-Gm-Gg: ASbGncuEs+GqyTmqm/erGnGeEgzUwMbSKj3QHTgyf4o/OFQW1553GsJDmdAtcaAHQ8v
	LF1qL8JSjuxiCTIzxK2lncEicnuiORpQXPsfJE/fmZTMYflN/5r44VhEGsufWftmJUyljvWFSKm
	XdB8fUdjLWAYTNovOo7zOW+52wj+pnaFmayyVrHBeevSOaXiQPlceEmkw0hikBIuVwPi/FjeREQ
	g8wxaCXae3NzTd8Wy6V1seNJSQmhh07QXo5eiHgl/HaVWrxFSJtmBW6mWTpDjsU7bPLElJwfMPS
	Zn+b0SmjlqxoENi2vjILYG4ZL5Ct6r1nKF0z0SJ/G7/oOv/Wa/nZm6IVxvVOttuwr4BHLOUpSg+
	+agsOWopISI34l1UOsPfJ/A7bIY+I
X-Google-Smtp-Source: AGHT+IG6x2cQV9rQNT/dNa4oIVCMlwksMuE5agsbtSttDyBJNmy1EbpQYwO/1wjMinTPo+R7D0RWPQ==
X-Received: by 2002:a17:907:9629:b0:ac3:991:a631 with SMTP id a640c23a62f3a-ac738a9a6b5mr822914366b.34.1743447841909;
        Mon, 31 Mar 2025 12:04:01 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:01 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v2 0/5] iio: ad3552r-hs: add support for internal ramp
 generator
Date: Mon, 31 Mar 2025 21:02:43 +0200
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPm6mcC/4WNTQ6CMBCFr0Jm7Zj+orjyHoZFaUeZBClpDUoId
 7dyAZffe/neWyFTYspwqVZINHPmOBZQhwp878YHIYfCoISyQiuJb56wG9AFba1KeOcPZTROn+v
 GGC9PAoo6JdqLYt7awj3nV0zL/jLLX/pncJYoUHvpnDJNkLW+dm4ZuEt09PEJ7bZtX+MWp0O7A
 AAA
X-Change-ID: 20250321-wip-bl-ad3552r-fixes-4a386944c170
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=KCzCQK5KfTNTXVj3QAb70ZvZJIWC5xLub+VrbQLHf60=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9eyWU/Z71/OsNwqv/Pr96d4JyZ5sriPHzypasbepZ
 y7cvcRuekcpC4MYF4OsmCJLXWKESejtUCnlBYyzYeawMoEMYeDiFICJCAUzMrQuvPeQ5cHJ+rOV
 z7Wf3du46qlbcTH79+JFLkr7L3e2X3jB8N9P09Elmu+SYvWKqkkKv79LPp15dNnd92YB7I7HdpQ
 JPuMBAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Add support to enable the HDL IP core internal ramp generator,
actually managed by the adi-axi-dac backend. 

It works this way:

/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage0_en 
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage1_en                                           
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/enable 

Activating ramp generator:

/sys/kernel/debug/iio/iio:device0# echo -n backend-ramp-generator > data_source

Deactivating:

/sys/kernel/debug/iio/iio:device0# echo -n iio-buffer > data_source

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- doc, add few words for generic spi driver version,
- axi-dac, add a separate patch to check cntrl chan validity,
- axi-dac, return EIO on a wrong source on get, 
- add a lock on debugfs file access,
- use const strings and strlen on file access.
- Link to v1: https://lore.kernel.org/r/20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com

---
Angelo Dureghello (5):
      iio: dac: adi-axi-dac: add cntrl chan check
      docs: iio: add documentation for ad3552r driver
      iio: backend: add support for data source get
      iio: dac: adi-axi-dac: add data source get
      iio: dac: ad3552r-hs: add support for internal ramp

 Documentation/iio/ad3552r.rst      |  72 ++++++++++++++++++++++
 Documentation/iio/index.rst        |   1 +
 MAINTAINERS                        |   1 +
 drivers/iio/dac/ad3552r-hs.c       | 122 +++++++++++++++++++++++++++++++++++--
 drivers/iio/dac/adi-axi-dac.c      |  54 ++++++++++++++++
 drivers/iio/industrialio-backend.c |  28 +++++++++
 include/linux/iio/backend.h        |   5 ++
 7 files changed, 277 insertions(+), 6 deletions(-)
---
base-commit: eb870a5af7db1e5ca59330875125230b28e630f9
change-id: 20250321-wip-bl-ad3552r-fixes-4a386944c170

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

