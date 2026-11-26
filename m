Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=MWNKhawIhuhUopqYYygit9oLVfDKrVMsDSvzppVT4kYP/rQcIwsuw7NHfGnw2yzvLcbI
	 ZQJxbreQLjo4WpCYxu8w0o3czMRjpT4hNcsZ8t+curZ9YVMHAO4SyO+1c8hU3Mp3chVCW
	 iSZ5BMOF+Iq+zG415SLa7Lp4e4TjJvqVvVWgSU+hsVq3Y1+tGxhqEi4vC6ALw6+pZw3Cl
	 oEgNbBkkq3DVvN6PbIqGeeiQVoImsuEWak3ffYyoPNbZ+VOZ784iKAHFRnSyxYqT3eE4t
	 oNwTx8bR0teaMij1iXVvi0B1vh1kB1vb1eDbYqEJIUVvMe8HQP1MLPspyUgrXXQQjZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
	b=l5LUfxTfJD3QTERxuCf6CeCiCsmPenRG6l86pcLb/3Re/f9GCv4Bg/aqNih38KIQrEC4
	 BWNZVBzYRtEVXp+x9EAb5G5vF+EXnME+s/fh0N3CnhyAxy7h3XVqQkuhBEtX52csoE7PD
	 riG5V96E06kgX8inFk+NigNQpK8VkDsflceKc3xcT8TWoy1W/R4G2MOspRNB0h8fKy9Ut
	 HBxHCQRVUEkUDTiX6juyboj+UmijndeHX+XI/6GGpNZIucyJ53LG1hWC3/4obkSZbfE9j
	 7B7O2oHjpW2hTjPohXjj+U06HBUpuir7tRZA+63XqQ/2r+YnZdzEIUc+uLwTBvGxzzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/peqbeB";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C155606A32A
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C155606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/peqbeB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5852440f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698227; x=1796303027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=x/peqbeB55gWorimKoGuMgAbuxLB1FWa7z+7d4eQogwmahuKJakcftf5bsdqvOo57W
         Wif8V+dxneKbL5i4KouqalEX27nZgNu89OYqK+98mECwaBB46a36REDDDfYjRJ7z6WPj
         TkcvJv8EjfXJmlvxD5iMIKZeDHwEDEIXdk0b+JAUDoYglwKmXwcYTGzPB+xtA/m5lKx0
         jDV+cgDOO9g/pCSzZHYvdw4Eo9toRZajnHXObw3eCrfV5jfJvAAmsVO+yNpd4Bgc2yUT
         HY6wIfaIhK1N3K6DRvSXWa2fK9IWJ9PmAN2G7lWLDF28Jh9IizYVKEABwbziyzvokTVA
         vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698227; x=1796303027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=jC+QA4nmI+byTKYKaRBhlSvREX6VpUw6Chm+kDchYZ1YzUdkMzWYSHjy/MKEYVLQ2q
         I8QTfi+hrHlas2pJaoDLSTfDipxziM/UfPkqlyRdCD9gRlbs7ikAJV1e2llBLY4ehOMu
         7rSooqs0LpoKeQP7oNrOPJkAZiO+3Cvhmc5+uswt2eH1Qzykj4gu42Dh3tF+QMoAaTN3
         baJZNkiZ1E6xW5jHlb0gVFvgy4KOOMBHzUaH7AXgNoZzUjP0lr9TP2S552IViWT820k9
         8pKbPc2HpsDeh4sy+PGRtO79qImP1P4e4BE1sL4NTOouDOaG1Rb9Nh6jzSgaee42nWr3
         5y+g==
X-Forwarded-Encrypted: i=1; AL+hErEAMccbblKqEIcoJ54MAZ02wIDI0gmsLGP67ziSINZyerBftkPM39g0RqVN5DR0HRDC0is9RKHE7i0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bSQp2Fv6V7Mi4azL6M1ikHITJYHA3kFLhAa8gLpNCIW/T50Hs
	QzjAwWQ1UseJ1G9jGem3lvsph+s8OemucT/Nnl2+vgfJ7HVgkadriweO
X-Gm-Gg: AZFdTZctpmmQxpPSjALJN1bQSHmToV1j+/10Cu//BgK3LpRtQE/wBNIDnW4JKRN2uVU
	oRFLpPMWNOfVo8pe9bJbQfVwxoi7SEgjFOz+vvvcDhrZN9bc5CGEQDCv8BnUKemsx9U62oaR2tu
	Qen882cHIZJgWbJZvQnbTzkl/soRCtMW5BDmhb7HCmaYlY2r8ltib0tD3OWC3ZDvn0F7WGT0Hqu
	cxXdJtaPHDbiPldRnTrwt2nScV1Bd+qwAmz+Itsm8QdzAhq34+NtHjuLSv0CDRPbcgQglOMHHVN
	lv2eGTDNUYUCiSy52xE+ReYAnhgtSZOf/jVb7ZiiIaVY0EE/Tq5Jlg8Pv1F5NlpsV7CybKPcAWa
	t7y6oEhtzMo9LARPNnB+tMLRccnSs3mTwQsYwsWnXvD4zj9U6tGlP1CLl07Esl57EI2vuI3F/eA
	RqBQFUdjq7th0Mcn8sOXp354O9yyrwotYjYg+mQjH3bsd2kXFMCieSXMtA1VKevG8kAIFbZlxG+
	dG0j1dG5fkaCEEuOSEgHPTb4ohn6BZnT5US9ywgbclBpMuHYU09lp7yHlyS6Zv/rGjIIn8dFImp
	WoWlncLwpmkrjwx3F8x0iK+NbgfCvq7NKKDSrYB5U7AlPtdH43qEtpit63Z0Zk53bpN7P8KS3YL
	9NwQ7iqjKZ1iIbXM=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr39049675f8f.16.1795698226719;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:29 +0100
Subject: [PATCH v5 1/3] soc: bcm2835: raspberrypi-firmware: Add PMIC ADC
 property tag
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-hwmon-da9091-v5-1-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/iUxca9FTu0bgiQQeq8SBVCAGFP6lu621MvCErbuE0Y=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xNEx4B4+w47Y6KIxfaxL7O51qs8bnihmov
 1fup0sxu1eJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z+MiD/46w5hTMfyhn4m39PvQETjkM33y7fxz8RsI96szfIvy31g1+2HfYzpr/qavjjnOw75LoKd
 XlkZVtPWoZ2D0h6fQKjCxfAc4faI2Jcaw76XaZuJCT95fLzAFeXPHZHp/KawJaoNQcQj/av+zoE
 h7gQfnhRTLPYQIXFz6oazBY+MzPmBoUZ/MW/XPl9o8nIpveCXi5//Qu/iG7PE3B8KqDpGjBRrxT
 ulKKDu7ga5hj3gR+GFwGd4z9oJhVXsfXVM9TOjMrrx3LwHhZviUe5H+uIf6H6tcedKHbXGo9udo
 EI3dP3yFy0NFJjUy2zONdxKU01sec/XYelCLf8W+auYJZvSatkpnawQbYiF+wpQ40Av/tKZacVC
 te9+fmlU0kKwLq/6ASwljDjKomGFulcwaS/5CimW8G5jY8N0vVVMB41N9l2TrVkD+g+s0sOc2lo
 xqeb29TF7WbUZiaB77bWifC6k5NoT6MMnpTDPjyktDaKd4bK9fhOB59Mos7wVKSogOsdTx6+IVz
 cIn1KmqP1qtRmLueWZ+LmSSsnyguANaEaOjc71jOaur1sr+xZdtqxO6/+4gFEvuY9DSwPQelNaG
 oZuPQpRKiUAABqOS0Cbi8MtYXOWAYLnNqTJGPYRlg+CcynVEAU5dsjAryEun5MdFMdwnpmzsfJv
 DsbZ8j75xwgtE5g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add RPI_FIRMWARE_GET_PMIC_ADC (0x0003009f) to the firmware property
tag enum.

Recent Raspberry Pi firmware exposes a structured mailbox property
that returns PMIC ADC readings (voltages, currents and temperatures)
in binary form[1]. This is required by the upcoming hwmon driver for the
DA9091 PMIC on Raspberry Pi 5.

[1] https://forums.raspberrypi.com/viewtopic.php?p=2391319
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1

