Received: from eastern.birch.relay.mailchannels.net (eastern.birch.relay.mailchannels.net [23.83.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB620B3D
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708008780; cv=pass; b=NHLkbmL3xJNJUtNzn1RcW+pKG/LjGld3894EahJozX17DaArYT/m8yQRb0F39D2VWqRoO+S9c+5BwGGbLwyQ6NY+JoP0qoDbwzdnUA+ofxuMz8yDJoJcfdykBaLCMCNPTypZfUrguJOwvwdicwyCqH17xXHn70FMG1uKdB3DMLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708008780; c=relaxed/simple;
	bh=SCu1j3Obem6LNJ/Xer6MTTr5+qHPF9ABl1ytvK7ClnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gVTT1cdz5UV9NPkRzXhDUK1oIp0wN4lXSIfurU2KcSJkfwOglKL5xF3/fNwco7cHxCw/EKES0Rd85HGH3NwGXrt1o61ZpQnvWduGbTSkjvHXOXT351SFgrxiZSpLgZrNLKzNtMK4XWnyZ88VBJyoWc2WfhdyWCX73zOFgZKPYOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com; spf=none smtp.mailfrom=okanakyuz.com; dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b=GOdGEoF2; arc=pass smtp.client-ip=23.83.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b="GOdGEoF2"
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 37EC8362482
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 14:44:00 +0000 (UTC)
Received: from fr-int-smtpout5.hostinger.io (unknown [127.0.0.6])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DC1353628E4
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 14:43:58 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1708008239; a=rsa-sha256;
	cv=none;
	b=jGv2rlfAZxx0cGUU8EKT1ktiJo5nDZrADBH3KUJ1y3Rp98CBk1yd1jelAvHS37yGqBvO4h
	SGMFWR8QKN1jt+7WFEJyRygO/EZALPv/kbV2WDRcMJCtPwrgAsg2+yUCfG1kHoU8385np6
	rG2wldyyGsd8MGWDZgONgnslI1SbLH4ktJPUOSiiXVxKu6uZXmWYExi8CiZ6N9wEFUpjWB
	UM3d0JqvfYVjWd4mkv29KJrFj8vEoRo92B8smdiFQwffDE/T4Xk1AOkEpYp69rBduNPCsK
	76cImIs2X7KI+UTf588GHmEnKR/Djo4tomU9S91u8Gtd+xAo482GvgX9qGnhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1708008239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ZsVL3roLn5ZzHljGj+vaAjti80VZi5B763mXyyAuLe4=;
	b=vWIb4OLp/vhkrgZFpv5tu5dUxykePFR0I8aVNyr5p6LdzMqgeEsnY3iRiWv8gZPTiDYvsE
	co+yMqwNgC5hwi9wh5yfxZaUaaQcFmEEztuce7/t4duU/YAU8pxS+7iJ++d0ufOQDAdeGR
	1OOGPsIwBLXCDbHG73yzB8XjgWE31cYOew3FnXkRyLk47nUydPI58a8UNNYD0KhI8Dz1Q5
	Ht5yaDSTVwDNjYNjqmosgZtlsGK+erU8phZQl7l98FJ7Qf1cI0aS2Gqqy6cvK4dmFATH6e
	N2r9h3iCGfsQz89qeBxZqDfSJyuqNYnGLL9k/H2q0ECjSY++CIuRcM/hVFq8fg==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-wrlld;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=okanakyuz@okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MailChannels-Auth-Id: hostingeremail
X-Stop-Trouble: 67bfa2d9339aaa4a_1708008239900_3056963694
X-MC-Loop-Signature: 1708008239900:2722775206
X-MC-Ingress-Time: 1708008239900
Received: from fr-int-smtpout5.hostinger.io ([UNAVAILABLE]. [89.116.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.119.136 (trex/6.9.2);
	Thu, 15 Feb 2024 14:43:59 +0000
From: Okan Akyuz <okanakyuz@okanakyuz.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okanakyuz.com;
	s=hostingermail-a; t=1708008236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZsVL3roLn5ZzHljGj+vaAjti80VZi5B763mXyyAuLe4=;
	b=GOdGEoF2PAzBMzmVx2LNMV0Uxji2RIF6W4v7AVjozPEQ8r7dzBT94+9wrz1EFoC9uFN4ML
	9hlBkJw6U7ChNXe1wQQEZueCePOHDJzvqors5mWC4r3yTGKLJ3fhAqZ59PgJ8mwpmzdqUN
	/rokLMaGQ8bQJJWbiBEtjbJ8Ec8MfxNSqmNXzPzIOjdP5evLGAfvh7srSHaWduSzSPuYwr
	yerE8YUJHYHM6szHVJmy5VoRopnvKaYecs3SzgHKV+rVE6hdBuFtjm1MG2QSSRSJG/KR2P
	aNa3U6ifklI7Mx1uU2NmO9hzi9D0/K/IC1fHl4EuUK2rM6s76upLqbAY0DxxSw==
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	okanakyuz@okanakyuz.com
Subject: [PATCH 3/3] The URL of the datasheet seems to have changed.
Date: Thu, 15 Feb 2024 17:34:29 +0300
Message-ID: <20240215143429.18069-1-okanakyuz@okanakyuz.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-Envelope: MS4xfFCZA+rTQrfGErnwysmhRW6ed8HufZhBIM676TCDWVRFXQk79/rxWi59It2M+bjzYO1BJgtXKqfX6DOha4l/9Qi96QmcLwZLNYs6+Mcu03DfpPqX05g4 V/h3e2DAXlImoqGNG18wuuRrwLebg5pDbvHokrGypFyCCFj5Wr8VDVQ3JpjFYwIQx2e6Gg5oC8jptgFrC+Qo2ZQQY3rNeX4O+VfnWehGzUW9YzwcDfD97tmg mbW06qhT5CT4l1H6MviK7t5ykFZiN6LhPtMSZMi3SHZm/z2Ne2eN57aQfjGyPwvZRuEYeXjF4SIXFAMLGm9ZYhl4tRivyW1F+JJCzN5IapXlXqLB6642BOtn FFnhNJiBi6CMsETPQn/pF5G9V/y3NQQyToSpuQnSeIm06CbF2/X2oBKskHAWbC4ZJHiFMMGw7mTpvA1aHfU1T6vBcGdKLA==
X-CM-Analysis: v=2.4 cv=apu0CzZV c=1 sm=1 tr=0 ts=65ce232c a=geHYaF3j5ifCImHjKwHHfg==:117 a=geHYaF3j5ifCImHjKwHHfg==:17 a=TiQ8hZ4ATvU4YVTt:21 a=-tA9vPf7AAAA:8 a=UXzzSC1OAAAA:8 a=gAnH3GRIAAAA:8 a=ODGrRrS54UuryLqHn6gA:9 a=vtdtr2SZiqPAgdHKmkdM:22 a=NXyddzfXndtU_1loVILY:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-AuthUser: okanakyuz@okanakyuz.com

The datasheet is not reachable. Therefore, I replaced it with another
one from the manufacturer's website.

Signed-off-by: Okan Akyuz <okanakyuz@okanakyuz.com>
---
 Documentation/hwmon/max6620.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
index 84c1c44d3de4..d70173bf0242 100644
--- a/Documentation/hwmon/max6620.rst
+++ b/Documentation/hwmon/max6620.rst
@@ -11,7 +11,7 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
 
 Authors:
     - L\. Grunenberg <contact@lgrunenberg.de>
-- 
2.43.0

