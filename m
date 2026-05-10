Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA322425B
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387717; cv=none; b=hXzgGKBhTBO/qi5iCiCjdK3d9KoG/IZ1KuNjRw+Mj07CA+v8OjkGJBDR9jIhYM5c3pXHVeERZT+vNBMx3uRlyombY98w2SlhMaacHP8qaACyfsdwkz1I3p6ZceaweOcvZhqPjVyKifobtXW50CpHSB03Df1+BhOUNZ4WXCAEkaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387717; c=relaxed/simple;
	bh=78Nf458slPacJvpnRvOG1Bl9fYQHdqC4ktR3gfPaiD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYX9QDSvrormAAu4ZQ1RxX7eoV4iGkNgyRKYkwOWu/w8yzZStQPISSx6Wm7OfLf1IL1BcgMFAeiv9T5LUleuF7iteIEmgLc3/zJOxS3qVblaWj9K8xts3Di5Aj1PIIoIGjDYPA7N9LlY0M64XyJy5ZVZUEzObeNiIdDPucfJvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khEv1kRF; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khEv1kRF"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f0ad52830cso4863279eec.1
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 21:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387716; x=1778992516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlEoy4DZ4SH4fgpH5599ViWFjoBhWI0C/WiEDfJBN0A=;
        b=khEv1kRF149B5Ck/39XN2llLsIPz+lT2bwyWaQxtnsISQrm8bABQAsDJD3y6jYlB0J
         lJe6mlHK2Rw2PZFlAIqnZ7VSTjkhfnz8yr5qoRHkjVqYICQyg84la6nQo86CJw860qz3
         7ppjfOqCtQj2SsPe7CZzfZg3ANifsNk6AN4O6vcn+7inH/8RSWUzp3n/V73KQg1xvMXc
         MWDgjTkijb9Yltjp/sWi7hQI1+scA6Q/aSIilGJTMHmFoAF0eRc2ZiU3kRa3fvS6X8Vb
         1z6FQy5Y+hql/vuO53F0T1umdmuFe89c/wVXdv9y4vz4C/Hx08Y5th/jTVCOKbzRmjSV
         bF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387716; x=1778992516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlEoy4DZ4SH4fgpH5599ViWFjoBhWI0C/WiEDfJBN0A=;
        b=XlqCscjFxUyIhDGrNaWtKonQPbfzHOXwgi7DFx/FQuf1TzJqL0++iP+O/JCF8KaWGj
         JHaih5DgcxNgyXDtfoDuxoDHX8aQX70kQuigJzO1OUQfHlAQ6PBRxgXnoNH54x8D/DYz
         IhTUebGpR10+6Wzy8HbG08QMHVJ0j2CpiwF2l5zb9taJtirIL5hpchZYs2M7siXLg8yj
         nIAkX3aIaoYogD4ObHxKI3aRKhbn74KTXLca5F4hI40KHZ15STkYzsRRsFzEk1fyJUuP
         bWseAUOEHTJ3pbA5qvlx4e4hD7BuRstsaitWm5/OHmBFvYzkilVw1C3BGFDugGX01qS1
         xC8w==
X-Forwarded-Encrypted: i=1; AFNElJ/oD42VeOaNnrUzO648IUjMiLEhYYZ4uzgdDjQNqYQwkcG20p1771j5npG1be7i2iERZgn7IaCZI7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlviQVHlQkfuBywkAOZhvJJJl173ky3Qt9880TIuJG7XzxaDx/
	j4b0b0EAGsG38f4N9jCLRvohKhJIHDcwIHyhYA/kLpVxrE+sobeRbiEdY+gDRQ==
X-Gm-Gg: Acq92OEjg/H0d3Di36vEgc1O7dk592+t1/wGAt+7pkJ0ZTIfsSZIle10edIyUYzbwHI
	gEww6Kk81womYJOAq8O0h+VKZ3wCx7/GIekmHS6+4NQV+8StENTgEfrV+NoIGmCUCXNnX2LWQw6
	omojyj1df1QS6RpUSg1zAqyKmswmW2x/4VqdqNBTVuawK7niqn/TEh6LaqYxMkK9q/eCAwcU9XW
	mNx/g/sW2TEoOpcA75tsQSLM2ZhU0Mmo9kZcd6UEkodRGhj+lNljD/vVipIZaA+wF/wGYwBil+2
	empYx49Tf5jAcIxZ9Jb2EcMt0hr711d6h+vrLhA4NOZ8C7OF2RX3W4/NtAJtywnXpWoUuCAiz4Y
	voppH3NbjOzAMJ7iwrc2BNEshBSYb30bPSveawI1V2xCn2KPpAMjhypp4YdUrSdX0dcXtkyVJFV
	yQZ9VSxz906rYlMTPUgfFcliC7rndujcBNB3Gsf/Fef85OumlEi94qnUO88bLCWWVQdYOyw75m3
	VZCJVxmO8AuuaQ=
X-Received: by 2002:a05:7301:1010:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2fb4e04199fmr1601148eec.26.1778387715632;
        Sat, 09 May 2026 21:35:15 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm8667953eec.22.2026.05.09.21.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:35:15 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add MSI Claw HID Configuration Driver
Date: Sun, 10 May 2026 04:35:06 +0000
Message-ID: <20260510043510.442807-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds and HID Configuration driver for the MSI Claw line of
Handheld Gaming PC's. The MSI Claw HID interface provides multiple
features, such as the ability to switch between xinput, dinput, and a
desktop mode, RGB control, rumble intensity, and mapping of the rear "M"
keys. There are additional gamepad modes that are not included in this
driver as they appear to be used in assembly line testing or are
incomplete in the firmware. During my testing I found them to be unstable.

The initial version of this driver was written by Denis Benato, which
contained the initial reverse-engineering and implementation for the
gamepad mode switching. This work was later expanded by Zhouwang Huang
to include more gamepad modes and additional features. Finally, I
refactored the entire driver, fixed multiple bugs, and refined the overall
format to conform to kernel driver best practices and style guide.

Claude was used initially by Zhouwang Huang to quickly parse HID captures
during the reverse-engineering of some of the features. Since Claude had
already been used, as a test of its capabilities I had it implement the
rumble intensity attribute after I had already rewritten most of the
driver, which I then manually edited to fix some mistakes. I also used
Claude to review the driver and these patches for any mistakes and bugs.

Assisted-by: Claude:claude-sonnet-4-6
Co-developed-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Co-developed-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (4):
  HID: hid-msi-claw: Add MSI Claw configuration driver
  HID: hid-msi-claw: Add M-key mapping attributes
  HID: hid-msi-claw: Add RGB control interface
  HID: hid-msi-claw: Add Rumble Intensity Attributes

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   12 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    6 +
 drivers/hid/hid-msi-claw.c | 1577 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1602 insertions(+)
 create mode 100644 drivers/hid/hid-msi-claw.c

-- 
2.53.0

