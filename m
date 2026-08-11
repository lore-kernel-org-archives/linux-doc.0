Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614E43BDD3
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491602; cv=none; b=RE9Cr0sO54r9X1tg4ypDv025sBBrw0hFwYQctVVrIKbry+2/USxAanFd34dNzQbGv4SNgJE3QnzCtXoyLxeAu/XFmYzRpps080ISL4soIqC63A8YqSSPeJwYewiCJ1QP+8PLZRxlzIDtNhGq29YdWK+uD69LhofUY8hATij/4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491602; c=relaxed/simple;
	bh=Y2tQ2LAFOFELFWmsRwpsf2BupcNmLOLP9gT8fTAeJFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3argyumgwNqVvdy/6weifdbqEm2MndeOTVlEzSQ2/MzIETVxyurXD/5upVxIY/L/JB/RgAZi0fIG1xUqPSJtw9HUFaHamurJC05tfqdK6bFmnwYhU3Opejsathz5WWaNIUs815GDnETMJ/2cjowvxVNODOW6bkRg1m7Tzuy6sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=IIIWkKU0; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="IIIWkKU0"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c4436d02cso3205591cf.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491600; x=1787096400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1MCsG0t2IBPjIoESimgRCobkxCGoq4GsTF16kiHXqA=;
        b=IIIWkKU04upV6ORd6gyrv4lqjoqmFEaJznbykpnr6Xoh3MCKtyEq6ei8gkgzVD5ZDM
         Nn1Y67UeBG/Jjf3Z6kV8tt9uQwqBY0lhc3Y0/XauucZKk4WCYQ0MCvoo/WDwsUbgeAqG
         HtOcZHgBp54RNC3hpkZ6vckVnEG5kweldarvVtK0p9B8DguMB80E7T3bxVMRBAJ/6qCZ
         YBwTlOB1IMNoZIlbNhIzMtOQrq1q7G2UuwMfq4hrTb0K5yAnYty0vlqOfa92LVdsQ/rW
         7rfQ4nBiiXUlzh/QCiFhzZ9bLNPwF4Da7w4s4aQrlLsgudW1hgAMCsyyrrUf/3c6168A
         8kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491600; x=1787096400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1MCsG0t2IBPjIoESimgRCobkxCGoq4GsTF16kiHXqA=;
        b=DUMN4wM2WYThEgMxRcZuloZjwQQY+WHJm5lJZj3u/otwSQTAvt7e9EcDkMhxQwtKSj
         JL6gnPbBskZ6shGqZBBe7F2jCMjMzcgtBshEeuKfk3nHIqRn2kt81tORnikvAqG0fpIE
         pwCqWzggikPs8PymVJGxqH54XeaD159GuwDLp9g6rjUDazHCsihoqnqu/R6Whvl8BapQ
         +HH5AfsCrB8EfDuVG84/5EWznlFlDsG/+J5XMykI8+QffVxZ+1k7anJwdea2I0dZZ0WD
         aJst0KRU5Sdl+U1bPLu5zSoH60fnKhCUGw2ahykED3z7jsDZ0b+2ZtwQxwLCtCMeRV+1
         zQOw==
X-Forwarded-Encrypted: i=1; AHgh+RpkVvA4cwJqu5yLYEQmMRp7Jl83FY8wviv925NZpQqkDviPmZ1keKKXI6AVBS2mh4AAkyWtVL29dpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJG5Q2huSodjh4mqPPOvaHaTvpjcJX97+mYcdw7MEQ9Y8hanok
	7Ec4FIF8a8MFTg2MX71g4PFftmHjIY6weuIwNAiClCr6n6bs7rdRPJ1xy7xkT22Ksbs=
X-Gm-Gg: AR+sD12/g6urwhoMSnHED0ofpGzFcTo5vFQkf5tPOlMA4OBDznMl5xqDCTOSf2T7t8g
	eQZIhtiguuCM9OVlaySKAp2+hlsuYUk5+bjiZwLYyhCKTmjixU9SNplTf7L6i3zs/a/JKWHqUcu
	Loxu1lNLFqteea4qxKlLfQt/Ch6E2PLtcuYmCM06xZurvGsmgLjYy9EiwO+p2NWxIOpl+mFvu9d
	fPLjxPNNruU/apIhD/gFDtwLd5zTIb0KyarJtoN/EAxVErGDtG+HWslAmSv7+SgLE1dt8kunjKA
	6+OmJEI7QbvDnSPP469Knp6Bfox1gAAHJiCn71yEPsW/KAnt/U+a7MRQqM/MV4wF1jSSHzcYFuj
	urO8FBT/VlMfTDVc7Y/e4gVqfretbPVPLn1jqMqJH7NTkZPSrgjDOM4PSj4qqXQHlrB/3mxJLmj
	tauzEBZD9xVEz/HpUfc2DdsKSwm643FlcHkL0VH72OMw7YQ3wgsFoaZfg3s6kg7ZslWLCFnQSdw
	9Yw3G8F5e3i5nP+4qcZ5q9FTZOm0C1030Y=
X-Received: by 2002:a05:622a:2d5:b0:51c:44c:6ad with SMTP id d75a77b69052e-52d647a38f0mr8792311cf.21.1786491600264;
        Tue, 11 Aug 2026 16:40:00 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:59 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v2 4/4] hwmon: (asus_rog_ryujin) Handle missing driver data
Date: Tue, 11 Aug 2026 19:39:43 -0400
Message-ID: <20260811233943.319729-5-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handles an issue reported by Sashiko where an id could
be missing driver_data.

Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 9b34c6e06bf7..702edb831394 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -506,6 +506,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	struct rog_ryujin_data *priv;
 	int ret;
 
+	if (!id->driver_data)
+		return -EINVAL;
+
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.55.0

