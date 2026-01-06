Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C82BEC27
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726548; cv=none; b=I2U2GBaQNtwzfg5Sv87+d2YR/Eb2kA2JKKjaVf42hqp27zzDxzv4H3NBn0qKRA+RdY8WvfhzspqWTY7/k7CUs052Q7+GlfGzHEZIkKYpmK0MDbFufe7Isc9Q6PwqwDB7RSBB0cCkXCF6/2QkOuaLrm83Z9dlgoPm+IXrY0/x71Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726548; c=relaxed/simple;
	bh=Orp9GT4FzsRolBRRVQnvsDkdLTThrRs5gYaL14IJ5rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Padmuh2Iwnw5O0tBLTlZla7HmDJFf5dCUIwp+NaOiE9oDSXKjGNgjHOBLhoMH3j+aM5uH/AOMiXUtQ2hfYmFs9cSDsrEUZ3zqV+MCIQppH8kYGMISLgRR74ym1gTTe6alOy72oaMRyQfP267npVkQvFIqKo8q+k9UO2srwN+y8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BF8QxnRe; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BF8QxnRe"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29f2676bb21so13485185ad.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726546; x=1768331346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=BF8QxnRe7dPGmwIMAOg0slqBndJ58B6b/AHBb0SodAI8y9OKUT/Srz7+IZKjP8Z731
         lEu8K7w1UkZYylsGB7CNyuxt5vmIj4hOmeUQiQrlLEXAg8tGFkeSj9nWm3PcPGgPepV+
         wmBWcmJYm6EQVYpL/Luax9Q1z8kP1kGgKFCMVh+YG3UYjm/h+MYcPFJyPe0In20iUse4
         8H4ESfrJGrIt5HwD1OyMikI7M0LUABpM3VkVrHd1xvcWCT95dOtLvNs1l+0lNGgcB0Ft
         1Dg6lRwkH1JITOCgG7v3tWkpa940w/JQ/qO3C6RtKDz9Mh9uY1OnTa5WCQbu/iytysK2
         sQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726546; x=1768331346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=YM7nreQy3vfGHx3WDm+VO208VJk0DsOsUn/blE/Z0r8USPhoCQK410q9h8rpxS1QAq
         7QN/cDgeGBSeoY9uHZ5n+CAWb4GD3wxJldzfJ0vsxv426S2gJLLPVe+43hMWerJ4LO6E
         UN+h0cgo1kvVBqykE+qEK/tYsy6JxFawtfzsPLj3zXeca5N73ovpVgYW7hAgGJyxdK53
         roAFYmNNtBHTPUAP3piy/PYTQ8NxGNNgGwXfrWA5j660HCbwN8ww4LjsHS7bJQ165H72
         GSA8UHZKTsMQXksDb7iSip6Ly0HBbUsZ4vqdIcVBpeKdl9e1WyRcn2trtN2vZYbgqfFL
         CawA==
X-Forwarded-Encrypted: i=1; AJvYcCXvUo+IRMjEmRNHSB0p+OIZxTsNgkhDZTeNaN1kMxcC9SbGwH9y+iYI6/Y76XoNSS8ajWZkYvs8+gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykC/wv0r6LaHgSx0hEUfLv8Y6L/AySjguU37Vd3QthMp0QB6/6
	hITiIxVwFov8ukJ2bPoHnhmJ6TMy0huSPMmp3r2DnmJ19ZNZp5Laox6j
X-Gm-Gg: AY/fxX5lvEIAiAaOWOSCUH9pltMwAN+oVovZ+eKoJAUNIjzoRcWwE5Dtw6nz4pzZD8T
	ezHfJjpcmohSoVoLuvx4uQBGUizBjBDxtuco+noOYtU6C5DN1/W7DrWdHTGuSn4VlzrZiaKgkks
	ici3LUORF3jWdInnuBijq4LYVY6CmgU+qi7wWaJG12K4BirEfR8axNxa1hLyEp+Jik3/bbnegyb
	agGdfahCiRTdhV36xjhxxqi+mh07+4MMPOGNgYSnByPA6jlqAXErk3xi1xjwFYBwQ31piIDxEXH
	CN8rGVUqa2mn9T9VSQqD1qdIYAK+bCT84ODJ72qv695snr0Pv+KBMN0JocGdXDoZqeok982iiqi
	8NDy1OrP84RcVwwlwWK59PrTAclIdMQY6MFLz4+pvIEDcn1Z5h9dquv4C4RA6D8Cgt65gYpPg0w
	qsAUVH53ORE9+SlprAqA==
X-Google-Smtp-Source: AGHT+IHzNi2QQ6a6YY1+BH+FZtHb24yA4doMuZNruN/8XQ2zpvmyGpEfI/vMxw9xDkIfGB9AU9JdUQ==
X-Received: by 2002:a17:903:1208:b0:2a0:be59:10cc with SMTP id d9443c01a7336-2a3e2df52a1mr36627905ad.32.1767726546276;
        Tue, 06 Jan 2026 11:09:06 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:05 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 0/3] scripts: coccicheck: document debug log handling
Date: Wed,  7 Jan 2026 00:38:33 +0530
Message-ID: <20260106190836.36630-1-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently coccicheck prints debug logs to stdout unless a debug file has been
set. This makes it hard to read coccinelle's suggested changes, especially for
someone new to coccicheck.

This patchset documents this behaviour in both the coccicheck script as well as
in the dev-tools documentation. Additionally, it simplifies some of the logic
for handling debug files.

Benjamin Philip (3):
  scripts: coccicheck: simplify debug file handling
  scripts: coccicheck: warn on unset debug file
  Documentation: Coccinelle: document debug log handling

 Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
 scripts/coccicheck                     | 21 +++++++++++++--------
 2 files changed, 29 insertions(+), 13 deletions(-)

-- 
2.52.0

