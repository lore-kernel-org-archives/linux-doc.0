Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C73BD65D
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060348; cv=none; b=ELpAu07LeE43K6Eb0tkB7KG1PieDf3yxcWX6Rz1MEukbdrVkj6ZxzM2b95lwBxrfcjwRpdpcGJxZznURraLol50fGOcK4716+2LgSusn2tp0CgsxuyWJpWG/NZcAUKZWuD7NiRY1/J2N6fETDHiSknnydUjvdFWWnCRZtaibNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060348; c=relaxed/simple;
	bh=td9mtcqNyCoWzzi/ND+cgmuQulM++m9brhPZsmPZ8yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHoKgllLl5ZrRuaaagGg/Zk9L6/EanuJ1UKeLeUJzhtXhe+Z1pUhqTfDq0EqY2YfU9vU/YzCm16RLNK3MhoXYZgDRUvTdI8uejX7cT2b1/zr6gAy7h5WWaE3NDk9jTUJs/6CuU1AIzivXWsN5TLgTMDKlrmFn3By8xmcDu6n39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itXUpGGs; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itXUpGGs"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6606292a91.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773060347; x=1773665147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hX/CT0FDleEvdCw/BsUoSYklLMZdXCYL0N1qTX3Ll/E=;
        b=itXUpGGsv9gkMK5Od/uIqOwKN9CbHgTwxmnP/PBX958zH/WAq2nMp6ebnp5pE8szx3
         +aElHs8YABH9BeHLy2QYQnIlDOH3qRtIi6OFTzWQ+SZ7PIDzYoRXRtkwI4MnezoCDy2h
         9gLurKUsdbfsJMpsJqG0pzkWbgsGefRRUKTLqWrmRMSQaBSC1yjcy1RZKgcVXa73ebz0
         YFijarChe+Af3V25z7ENLx+XklQxw/XdEqRx4hPc+4m8j3GWkzyJpMig9FXe67+w0/EC
         y3GT9IJWchX3jcAseGzbhJg4PjSjN039r3eA+3QqDGTsZ5dWcRjSjFgj3VyQmZiouOwP
         uaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060347; x=1773665147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX/CT0FDleEvdCw/BsUoSYklLMZdXCYL0N1qTX3Ll/E=;
        b=NXTAt7Y57ajZeS+QYjob9pb05STjjHGiR4DsFvkIBlNTkKr6OXNQNPqO1VkNTrQGPm
         g6NRgqshgyK24Cv4qyQjACzUPk1Ekqh0xlbhSRo5a/eA4R/aNRDWhZ+ictZbdbWq0tl5
         oH1g2T7RSNSW3Sp1faUTsdZWADSw7k/+sw3+t8gcO6Mwy/j2qI382EW46KvbuwMdoT60
         3by+lnEK/OT6wBtYMaoZdL5vdR1REw+p8OzBgC7KfluHoEW6AKzGoR6nPRhQbeXgwgsx
         YgfgPIFwXw2J/quHajjziwNGRaM9CzTRbmWQFx71ud9fds/f45nmgpvyRVgPea6G8wnX
         CMpw==
X-Forwarded-Encrypted: i=1; AJvYcCU40l++Y7vJgjH00AzNxhluTdGb+8kV6ZAJGDENUPGe2nlO5kTLSjm7jJhf2qKUb5E6XrR8MeRcY1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Tj5/zhCSMOOCelFnHF5nGNWIsvgbwQ2HfLal/stQ0RDsciHK
	WVovZp5qbM15Ik6vllKeLG82rICDXpIBR+xwTOnghtzKbVLN8flsWAAg
X-Gm-Gg: ATEYQzz/rkz86YyiFzR3Q/xiJ1OCJfwyaYkGgLiKlkSdePxEWdZpcLvITcFTz3YyNwh
	muqNtqBqNsqbaU+KUhJvD3vhzm8coLVRomXtIXFU3qOEGb0FqTvIE5qko5wuKvm+OcuU5/qzrLa
	65BA8mhQCi8XsVLoD2IgLSEVbcDNth2E9kmh81bPeKGBzlMerrY4eAmW8pcCyVXZtIEaXggb+1Z
	p3JmPCPKT+OV4V5FM8KfBLJrkap+TD+4BAeRYw3TvB4UP07MpveEImn28+0lqiHlLpwUwASSoYW
	okXpkT8Zqw4lqYeeCGikGP4LRiw9wStQ80ypRxdYuZtWa0CDDH61i+yG3gYS7N0h7ShyLEN8bHE
	ojq1JnWx/2PxyzAIYCSwVh2qtC+fMxXIhCvzEV6m8w7XyoVGrxSaI/K3FWqU+y7zDXAZgvoQcIx
	CRYYmJFUJqgsf4UZHuzGaCy9iAPFUk4LyzDWVuBbIWGcXutIdGtOaWxH7lHnJJ
X-Received: by 2002:a17:90b:3f4d:b0:354:bd08:480c with SMTP id 98e67ed59e1d1-359be376e89mr9615343a91.30.1773060346835;
        Mon, 09 Mar 2026 05:45:46 -0700 (PDT)
Received: from ubuntu24-04.. (120-51-71-230.tokyo.ap.gmo-isp.jp. [120.51.71.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm9178830a12.27.2026.03.09.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:45:46 -0700 (PDT)
From: sawara04.o@gmail.com
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Kyoji Ogasawara <sawara04.o@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 net-next 0/2] smc-sysctl formatting and missing entries
Date: Mon,  9 Mar 2026 21:45:38 +0900
Message-ID: <20260309124541.22723-1-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Hi,

this series updates SMC sysctl documentation in two small steps.

- patch 1 fixes indentation in the smcr_buf_type section
- patch 2 documents missing sysctl parameters limit_smc_hs and hs_ctrl,
  including values/defaults and hs_ctrl usage notes

No code or runtime behavior is changed.

Thanks,
Kyoji

Kyoji Ogasawara (2):
  net/smc: fix indentation in smcr_buf_type section
  net/smc: Add documentation for limit_smc_hs and hs_ctrl

 Documentation/networking/smc-sysctl.rst | 43 ++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 8 deletions(-)

-- 
2.43.0

