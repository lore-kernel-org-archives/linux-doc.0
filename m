Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55E1E3775
	for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828369; cv=none; b=TYp2InCXxlZdysoAy5abdnVpbr2xVfPVC31JaBHRkdElv+/YltYj64vTepjUYDiL+2YkolkfGuGLnAKdAVrppvTT0Jafc6p6qSZD6xjVuZ8Dr0yEri+1RkBnIeQytfLt+ajcuT9dJJ/W7laEPrJLaMRI2QmDuRaNOGHzeI3KaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828369; c=relaxed/simple;
	bh=4e0gp9uIV7MyzxlvTTu7qZW9G/t1tf1C48sZL1Ybazo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lUmlikJAzolxXPvT9mJ0YLSoLUljPd4qF0HRgbqR0/1chycCLSpZuiJYWkfylS0JrbnEOSvtP/9PpHL6bNkHtHeLH6M/E4OtL8UfhOTNObdk+cfkcFrTDZZm7rqnHm02MuZjGpP0YXnbb5VnZBJl+cTsEjWzWNMakXiYDn9wdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IT+zgK9t; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IT+zgK9t"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86d1131551eso66582339f.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749828366; x=1750433166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJyEx9SEtMoT9W574jcNh5RLLtb5eK5nBGN8Lv2U/V8=;
        b=IT+zgK9tshirZFdcjv95do9YnxYi+asmrxVUqSX9K3SiLvuXrg/csjG2Lz2iD4WDrD
         KGpO+RL09zdoGwAA7pn2wTseKl563bEVBiO5D6DWo+1E3LcdmIewF5rFEuaW3bC1hFXh
         fu9l0iN/iKGsoGvuvAGr3/imrSfjAdbj8Yn9ov37jukVDRVnrSIL7p1HxhIFIizE+Agn
         XBHgbrENP9pWBPGEMK+AKSzl59y9akCH0JyXU0pOJmcTp4G4wdyFZY5KIx9aTeYGx8rK
         VfI+6GIEjBh9H5fPc2FPvCWdYLGV5Q/o+OqO+DBldp270/TiWNGbLGPnWcwp9zCVKiub
         vIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828366; x=1750433166;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJyEx9SEtMoT9W574jcNh5RLLtb5eK5nBGN8Lv2U/V8=;
        b=Utn+1r+oFJ/ZTxBNHh9utp9mzyQI4Edub8wwfTRJMlwphnB3fjeU55HhHaYmUNhI4w
         hQYmr9+8AkfUPG8M743VELEJAA1n1t+XWlDfSbEWPpTPoqFvyKECKRmT3wEV5aXzXFmg
         U85ZFN6eS6gJfDwC77yHCi1M1cmpe0urMYyjuh92vD1kjSl+hcKzKgL9ugYmrhIqEEgb
         Cwk7szuM4L8yXpByeGmk7I7cZMifIGbv5R/UGZrNqL0krGTb9JMJMmdu18C3iEdz1WST
         s/ePVR4KH5oO4zPueSffMwVZI9oP160cSFwqClHQ7ALZNNrEKc4w1r/XQZZicRVWNpVP
         QrYw==
X-Forwarded-Encrypted: i=1; AJvYcCVWh5sIvpfKNbvXliklL8NKbIkyOb9bmwcq91ARUwauzieQcgAUH4YHj98tiSufmqUfip2eB1GE22E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZC6teSby9t2v1Q+KR+crKsEACLWmmbfVr9ApF/abUrbluXdzY
	NuXWd0ylOVLukOJDUhfuKci0PY70kQRp8aKRCslez21T2coss5ZBXtnxNu/GkKcUy9w=
X-Gm-Gg: ASbGncs1gxy13bcUD5riKfPKBCwY5YAAYO5KKnK6yDz1piemldR835mnQauzJ6/05sT
	6pWLxCcyuW/JuxkP7lqTEB4VGkMLASOUSNwnv5LdHSrTXhErDrvAU4OoFL38yq2rg0KY0Pmw+cv
	P8pM1hAJ6MMrBtmI6XM6IFEbd4wsllh44CNENd5alMGqECt8jexQhySpflo873v0jJDbQAagtVV
	ufOq2nJUTpLcvn4W/9KBIIIXQ21Ju+8n+s2aqFqk8Thi4jXPJOwTYr+hSLTDfM59FMkVY/bQ0q0
	wnseuwoXWwtrVDEnIsJccNKI76tpHBNpPf50pc/sy7hL/mYCfHU4
X-Google-Smtp-Source: AGHT+IGYvJK3/OvP02MLHyARtWzj0lGmzWqmFxziBjJCVW+F8NXt7Xn4uM0PaH6+Trrm9TNdqvfACg==
X-Received: by 2002:a05:6602:7504:b0:866:217f:80a with SMTP id ca18e2360f4ac-875d3c88149mr444305339f.7.1749828366385;
        Fri, 13 Jun 2025 08:26:06 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d570f54fsm32817239f.10.2025.06.13.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:26:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux Block Devices <linux-block@vger.kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Ming Lei <ming.lei@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20250613023857.15971-1-bagasdotme@gmail.com>
References: <20250613023857.15971-1-bagasdotme@gmail.com>
Subject: Re: [PATCH] Documentation: ublk: Separate UBLK_F_AUTO_BUF_REG
 fallback behavior sublists
Message-Id: <174982836505.723307.4689076506739660480.b4-ty@kernel.dk>
Date: Fri, 13 Jun 2025 09:26:05 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Fri, 13 Jun 2025 09:38:57 +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning on ublk docs:
> 
> Documentation/block/ublk.rst:414: ERROR: Unexpected indentation. [docutils]
> 
> Fix the warning by separating sublists of auto buffer registration
> fallback behavior from their appropriate parent list item.
> 
> [...]

Applied, thanks!

[1/1] Documentation: ublk: Separate UBLK_F_AUTO_BUF_REG fallback behavior sublists
      commit: db3dfae1a2f662e69d535827703bcdbb04b8d72b

Best regards,
-- 
Jens Axboe



