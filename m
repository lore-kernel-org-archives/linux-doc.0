Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85742D602
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706387315; cv=none; b=U0+oOVzcaLMuXqHtY4+O7FK9gx4cfYhnyuU2zmWC+oh8w30prDQaRY9jyOwz+OdpcCGgvcv8DTmI+ecJeYmdUdo9uCS2tkQPuNfLBZYet6g+kUoxFlRJ7QtSNh7YjZptnQPuuCWwjhDwZiRftRBBzgT//zNEcqbYGeIP92N+Xak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706387315; c=relaxed/simple;
	bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SWJ4VIu0XRacarVkyF9VyV2qjfhy0ZueFnX4PU/Zyqt5jP8Ft/q1IUwcnltHIqDZA9yrA140ZkWj7YYT1zVeFgfWTK2lqkeRis143vp0RZ4OffEXshRIlWiEtqgG7HkRxaGzVTz3359d/WGtU07K1l6Suc6CKdTp/stRl1Yb9rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=cPiUlOQC; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="cPiUlOQC"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-783bc26b24aso131368585a.0
        for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706387312; x=1706992112; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
        b=cPiUlOQCphIO0s9NPenE2RFlAlyb8S/K+R4BYa5wtGhyJBvb2gRqVjjR8CnNDunySp
         Xbh8vGeIFcowaaGMk7FGDYGfMGysPL9EXx+tCaH8yBW7Utj96SM82gxSduB5Z3B8CUc5
         cjcvlVDGKD1h85A82xGLxgStlA5Srwy6Bs08E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706387312; x=1706992112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
        b=GHA8fZf3xlrUX26l+jZdLGfzAEDZjujtcKbkkrpyKzGT1+a0gpNLwqYy2I03Fl8TYl
         fa+DjxCVZsgEns5FwkIiigJC3HjGwBxiJ7zh1Bk6gLPmLktn/zkHNS15CkrnDQ+9W+rC
         3IuBRJHp+7RsXBn5XixJrFq93hql6wfpBChlhMqVBotGXi4SGUh9HQl62p27KekJtEei
         k2eXrDV1ncVHZHlurdaz4n+zBi8utYR8j0s6wZhXr1125IGo8HzlwzBQKtq8qN5MIv5O
         GR7F1Njvt47GeaUw/8Yk61/0ruNQidoQci2JZWJLD41HFlsVqqD5x4inZh234QRymFXU
         r/aw==
X-Gm-Message-State: AOJu0YyY4v1ciY8/4resPxbDAmu4mWa58fsbVDF4jCFp9MGqWncF4xzZ
	AiKBcry2CB9EX4wFzXAA9L3VCbb0O0Aak06q74B/3EUnaFxEduWg7zdNrzQjDN4=
X-Google-Smtp-Source: AGHT+IG6s/fHhjP8Qd7QpYh+6hTN6Y01lcMsE9p4qdH9PvkO5SB3bp0d/yDNa1i7yrGjeQoZV0xYSQ==
X-Received: by 2002:a05:620a:22c6:b0:783:949f:cbe2 with SMTP id o6-20020a05620a22c600b00783949fcbe2mr2208737qki.150.1706387312664;
        Sat, 27 Jan 2024 12:28:32 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id b7-20020a05620a270700b00783e18e45desm868815qkp.104.2024.01.27.12.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 12:28:32 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: w_armin@gmx.de
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Sat, 27 Jan 2024 15:28:28 -0500
Message-Id: <20240127202828.11140-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <34960bb8-fb85-4cca-8b84-d99596d046e4@gmx.de>
References: <34960bb8-fb85-4cca-8b84-d99596d046e4@gmx.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hello Armin, thank you for your second review.

> maybe you can just return 0 here.
Good idea, that's indeed the only option for ret, so that makes it clearer.

> Maybe use PTR_ERR_OR_ZERO() here?
Definitely, thanks for suggesting this; cleans it up nicely.

~Ivor
