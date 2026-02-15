Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F81FF1B4
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168683; cv=none; b=T6re2XK+tZopMJ5RHGUCb1BI+FJVo2LJ7N5AeOS3Eoz+pCU9uGXOuqSKCE4+9gY44s7JS6YbV0ApkZY/j3fes/r9qndiM6oCaJJRqErwz2iNNUEZQ+1mR8iPV55NKTG2fpCzXyqhEFwzJNjhEXGrGTSGW4tXHseLwVk3uAh6T64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168683; c=relaxed/simple;
	bh=2t9Sx+hEy1MQQIjH8POIruIdemvvg7gZoGHUwS/RAZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpZ5Lw2diJ/CdB86GKsRVhxyRcrFVwLpqod+YwmI6mPYdErclZrs0DNuVe8xiXpnixKxYvTshQmB/KWSbkk6zmfQtJ5R1ypN9DT50vL7cE/7vxbFehBMPKKl1xzrNeaNVEKcYaCOZbvwi19SraqpfD9wZXCHGL5hqM89dITZ7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sf2kwaDt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sf2kwaDt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48068127f00so25416105e9.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 07:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168681; x=1771773481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4f0oW5QT4Uco2RXUao1ZgJsTO+wE8vwc/uuU08K7h4=;
        b=Sf2kwaDtoTB39ZLTosH2odZbO40q7Z6fgeyo9CBcffJO8Wk7OC5uFirU+SrScA5mrU
         GDm03O7bco/WEfK7xZlVY4q6aYwjzyvZPCjio0dZLCliCX3ho4rKeBmfKxgawQMaKf8b
         BjZgbJG6/VRFSz5jvatCB0HGiX1lZ+aE4QFBvjK0ukms5gmys9TimIr+YM83dSfqp0h1
         Ct9opuP0GBgUWPHFbZBy5aAIOp6o7eqrJGBq0cHAUFGiZsrrTaExg2gOvpfjWK9Lx7eX
         dNBzNMY+Gy30Jq4QOZY8hi+lHaEAHgE5I/t6FxRjG8nHlHi+l92Ol5t7D/dil4Hl3t24
         ILew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168681; x=1771773481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4f0oW5QT4Uco2RXUao1ZgJsTO+wE8vwc/uuU08K7h4=;
        b=BVNtVCdMJWinsW9oU204muOVBEMUI+nywWUvgvFRpUw/NlZNMDEVPKJw8h2Vj3+uBf
         bHvcNw/ULM10jFAMIQ7JUGFuKNLaSdV/qnBaMy2KNnkxf+zm2opbClE8ZfSX7THDJ5eR
         X0pCQdRY06Opdxq0qbcFIN7IRYofFj3JxJTqfxSkXsCPlalw8kup3ikaPzr9qosfmoVP
         iihCUihEaEZa99gj6XMHptpr9VAGUmyUkfCiyN0HEeB9hUDRuQcfaAUhTuM8FjPNOLjA
         bZXIOOepF+U6AMGPoYyrTY2P5XWeC+J998fOdx0pfDFYdaNDzi/hjtXiKMCSXf4ec2+W
         7cXg==
X-Forwarded-Encrypted: i=1; AJvYcCVLlqlR/poWXzUHyYBgI0l0+6WdVibOYwagRfzgoEUXpgnPEBYq8MHyzPpicVBOes3TwM8AK/IC3/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwpSHtW3WK03B1VCbhZP7o8ZBzz79d8mBkn1ueeLF/30RNhxwt
	qkZPO1e7oB3/D0WhxyQlNRmkO8o4mTtNjXQ6uW/V5Vox6ncNKDDu+MHc
X-Gm-Gg: AZuq6aIUfX5NPYSuH/S9MLX0etaFVi78JvX4zPQDj78a3sLyyYemvt1zIdWSalCU+7R
	gD/+ET+QcbvW2vIQttV8C3K3s1+8YbKN7FOn1Xc4eJGE6hq+XI0UVTZPYGx1b9LspE4sqDEAEnf
	BZXfIC25rJD5IxudP45aENpimfZr73bIWub58PJ1YpXTusFWqZc94dl6ZL2QgvyFVhjYm4AkysU
	Q47g1MOzsREP0k5fPT0oSE4CM3bwUE5XK25mcLi1Emmgew6W2CbU5W7iCgYcXAqRHZ24wHqhSMT
	4EX3dduUYrubKtFIf4pHbYMGS1Z/YirCvUwaHYPA8YknO1t5dcNkh3/PblWMbqPLsW5JH/D/525
	Dqiv3UF/MkOeU4KHatMKBI2lCZyR4V+psY0+RHuzVm3ekveu+Ot1I+4kisGdPaAU1WbA8TtFHB2
	v5uTok2zSPn2LEVXDElgalogt4uENkYtfqAw6iKXIexA==
X-Received: by 2002:a05:600c:5299:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-48373a7a0dfmr105217585e9.36.1771168680867;
        Sun, 15 Feb 2026 07:18:00 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:00 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add ROG CROSSHAIR X670E EXTREME and ROG STRIX X470-F GAMING
Date: Sun, 15 Feb 2026 16:16:17 +0100
Message-ID: <20260215151743.20138-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215151743.20138-1-eugene.shalygin@gmail.com>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for two more boards.

Timothy C. Sweeney-Fanelli (1):
  hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E EXTREME

Varasina Farmadani (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.53.0

