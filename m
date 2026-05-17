Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669E3C73E5
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779040601; cv=none; b=pHUqQl6cDusQCZ/9nXtbkod6WjXd6+GcqPi0wnJauMO/asF8KV7AnMO6AWxhvvBOyI/a1fchtUaWimsGCb37a7dL/WT41i/Wb3sTrAcHBvtz27s60zzofd8PPMEWsosQhaa0ARSYH5ZXjdGDbNRf0jOuUjWqO7BOaZ9YY8jSUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779040601; c=relaxed/simple;
	bh=y4u2xMKuFPGkHbz/kg+w/kclRoFx6dy2k+NOP1iG37w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R+0tY4rqBmh33OMjlYt9C75kEAmRohncrQ6ilhGATU/kF3rCCbLRPyVd26KVHSDQRSmVRYOcdhgwr5RNKXA6WozIv+zdrQEUN56P7tzb9OyftjIIvrGXY90No/0+2H/hYjFbOAh51Av7qkebJCRmYY0hsGSndtbn3ECj+MKkz4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eldXHicr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eldXHicr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so2880255e9.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779040599; x=1779645399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4u2xMKuFPGkHbz/kg+w/kclRoFx6dy2k+NOP1iG37w=;
        b=eldXHicr6hqNBPlRr1e/VfexCPm5Emap32degMpyzLEBtosuwstWHBWQMaMe9DLXKR
         iD+Y6B+UO0vYKFm8WZAyKCc+YuH7d/FwO6xa/sIQ1AAWrauWTF3q/90yk140zprVuc1q
         nj7RI4deNfgUryP9lGiDCl/QNV1/QzRdTOo4yXY0M3L0rwNLfONTXZP9PHyDd1C18jLK
         Z7t7MPtzcNvq2unBKXHJWYjU7zr3OhcQXOhnyH6C7zTFfaPuhMwsZP+DqIRVmI0CGrVI
         2WQa8SedF4Ikt8/djUrTCgwZvuX3Nhn5wip6rKrMFrQTjFrk+3MBs16E4tEJ8x3j7eiJ
         WyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040599; x=1779645399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4u2xMKuFPGkHbz/kg+w/kclRoFx6dy2k+NOP1iG37w=;
        b=kCSlZSySOQIlhO2VmHGr6nvcaVEiWtMZWhCrGYZnP8F1NYaiLFXikxzLma1/A6Ss6H
         0MX87HIesb+CZ6hr1BK4RO+O2ae7/R+wnZwHdFzV9KefzU8JG8YT0XdgJACyocf7pA+b
         kszhs+N46onzGRst8Q09siivxWF6ino1FRee/ecSh7vG0apiBpx2klNX35rsTnjyvfcN
         o6gmSfP5IpgyX1laBbiLIQsSBzzBdgK/bwsD0vpgTqsEY3VoGONTY2QQuCrAEs100D5t
         ifxauB/EbLJLip7Sa7d9AjdZ81Wz+jEXXqQoyH8BZ+18RDzR3SvOCNzpziZpIu84Ogd3
         zsQA==
X-Forwarded-Encrypted: i=1; AFNElJ/CqQ1TQYfjP2HUPvSXoJ6qXDGQLpJcoKrMieKmavHHs7HIykn8fS4RVrKrFBKdocc7J7vUfNGftR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMBBYrJuhTDq1d8lPYex0YvDZ1KNYwZQihCOCjIXJuYK6IWjD
	jmulTGAJJi8PgbiTxr8xoHhzRRZEnfx9OokZCc20n3LOKeiz1zOGow51
X-Gm-Gg: Acq92OHJk/kJaOs4RDBVzAz1ghX7XfkUOSMq1hvUzyiuat3ense11p8cPP3UTjqbtkU
	ZLi/IrrWtSUbNrBpBGOAWx+olkBCU05JMPOztxMbaVWngPzIRpHPoqmPSpOc8GrJ6dVzjjiS689
	Rha+4SS7fmvxTrh0Z0LjSLFuPchJBKwRCKAz0Dbeizn8sRCGTitFTpVVPOZHsUCvN2yZQQRNAIR
	POredcGUSpBV/wqjI9qa+bHNu6lYOtqB7B0Lnjc+YNjnys9p2ZV5qUaUw+g5pPnTkQYP6tYUUE+
	L/fZFJ2UJPbsUKkAS0MU5g2Z00Rd/i2PuVfIUJmZ+PCnll2/1Y6+2PNiVZC4I/ZPpFhPhbz1rZ5
	9UoJ8seNwEo+BREXai8jzHtUcVBcKLZmXNhJhYIPHdJaC+uESd8Brlue+577TsbgBqLJ2iFSIUq
	cmlA3sWV2fteAdPjQRwscMKn6JLsOlpoEfsKnFNWhRcyvC
X-Received: by 2002:a05:600c:4fc5:b0:48e:65f3:a950 with SMTP id 5b1f17b1804b1-48fe5fd55cfmr85819885e9.1.1779040598450;
        Sun, 17 May 2026 10:56:38 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm34088259f8f.13.2026.05.17.10.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:56:37 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: dlechner@baylibre.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: Re: [PATCH 2/2] docs: iio: triggered-buffers: use new helpers in example
Date: Sun, 17 May 2026 22:56:24 +0500
Message-Id: <20260517175624.1345-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260517-iio-doc-triggered-buffer-update-helpers-v1-2-7f00d4188f6f@baylibre.com>
References: <20260517-iio-doc-triggered-buffer-update-helpers-v1-2-7f00d4188f6f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, May 17, 2026, David Lechner wrote:
> Update the "typical" triggered buffer example to use various new helpers
> that have been added in the last year or so. This reflects current
> expectations of how similar code should be written.

Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
