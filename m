Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AAF33F363
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 18:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761762867; cv=none; b=Y8WRogYtKdS0rh03QQSJ5aM/EfLHwfXdhWKWAvGVBGOzxevR53+bozL7rlxA4GQDFHYnrY7qzfzok+wWPUUnJA/lAi8+mhgsWIgO4TZEShJL0QStQ56rf5hQ6G1+8oQ+Bj3CLQ/BgNVW28n+KPNa5yH58/KN1opVz+BuIUYcCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761762867; c=relaxed/simple;
	bh=CTWegixHFEa5eJOgjs271DCyYwGiTYFeBEQBky5Cs5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyWXta5wL5qNs2F+dbBVmMHgINvOchhInRREdvjKi/Dv7W/6XdGJhYqqlVazcRIUrhuZ6r1hNFOYBt9TKJquA9U9qMO505QOEQDQcb/6mUk0fM0i+ungz7fFTfFujOKvvnXQ/HXoqhglrRheoIBfdgjRgphYUJ9tmWJ+5+BomrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoorhfRj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoorhfRj"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b8aa14e5ed9so92824a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 11:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761762865; x=1762367665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ogeoHQ0O1BVIxTR+8ZrFN7NDholX1XeAgqEssh3smo=;
        b=aoorhfRjrfo2xVbmWP4+R92Lxv95ViIUjXT3CnDE5dyVRwihzvRpHjnIcrgIbrd25k
         0T7TRRZI1C2anRVGtQlWcjw5R2ejT5ZlzUd0VsPfIMA6bsIx3p10o9j3JuSLPuW3dIKJ
         zUTVWKt49kLDmLvB8ria0EZ96iBe0e6UJMGchL+pUVs4tWY8RWUIowRxv+W7v5+h/2NC
         JnCVBfkqDr6WGpJ1m1bfCzsD+fqvf+yWsUwCst9FL2jGZhONCTi/0qIIOaMys9vgS3fa
         wBZNwbl8HM2m5GNeVoimc14BwmmUiqsgTXfeGfG4xaptRUXLHvbXRLCMjU2EqezrfmXa
         crDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761762865; x=1762367665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ogeoHQ0O1BVIxTR+8ZrFN7NDholX1XeAgqEssh3smo=;
        b=Lpc7T1uqD5H6UlMHv9ABU//xBvjC2adW0Ud4Hksfsr7pSYgD0lKP5+uva73DYgcMfP
         kV4FqDbKkzvwgs8Tle3wSldttXJBqmr96DTwbstfdSqp3DScBKlGfplrS7JaoD6cNSkZ
         h/CZxVexL0vQLMRM0ROC1ssRj0HrKVPRkq40orfYEkAmia5ftl88rOzWeRqkZykYeTGc
         xnDOteRJt+pYs8NHpA02LbTdvb78OvXApQRxdloxO8EQ/RPS6V+hE9iEZ6AM0JC58SZC
         fGDIMxmgjLNN0KXihalfq36sqht+P39ROV/xe9OvhSczoaBd18QZy3qoiT0fdZD2TJZ6
         MzsA==
X-Forwarded-Encrypted: i=1; AJvYcCVeemhmmXRQCcFRKMIhbsl1TFQiORcF6w3nnUgVz+gZ3gxRPusHpsP9HMEvaUDP2C/ZuNAtgJ1s4jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEOxtawF71tZq2x0S0QAnj62z0lzHRimlp34sCCao+KkPaKQs
	HuvVVa0JLV75p8VTIfa5Kt9x9TM8SM0mCoHZ2XZLrjD3fN84VTSwSoeA
X-Gm-Gg: ASbGncvqFHsSqQoCb4tYtgNDKsQMRIquSdl5CKyxDkpGuZvNk7RuUEW76cYsbukhyTX
	U0txsJzkRHTRlRU3eXu8C29E2sP3md8cTMiVqhzG34qfCqe9OUKqDKmPxoDWLWqDnoxYszrCF8C
	SVKecAmib3GlbWwyFkUAZEUBqk9bw+8454PDTrRq/y5EpHR7bLqrnQZSbNFifJcMe/Wo5nE3IYq
	5LPrVGMrDZNYmPUw5qVCNgtA1e6ZMVHb3YSfsrkUdEFy+DDZqlSPSScrVC1nwN9oQfUgzPUOjDo
	5fxj9rK90PFfmdQKDL1kjzx2W4toF0ssdSPPW5L/p4k63NA1Eu0kfrmhicuKjHx43Noey57yG9h
	dav/iZDJ3Ti+eTkK82WfEhIl6OY8dwdeV6VBcKxhT1TIe3sSozNZDtgz71PnvTx7HxPEz2iOIx5
	gw+J5iAWY=
X-Google-Smtp-Source: AGHT+IEEht2FlqLLG0Ynfa5FSTjLG86LfIAz4K2RirDJOlW5Gbt1L9iZ3dBFembId9gkTaOOHsrmdA==
X-Received: by 2002:a17:902:d512:b0:294:ccc6:cd2c with SMTP id d9443c01a7336-294dee491f3mr44845335ad.22.1761762865379;
        Wed, 29 Oct 2025 11:34:25 -0700 (PDT)
Received: from LilGuy ([2409:40c2:1057:4837:724a:2122:38a7:2755])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498e42afdsm156921855ad.99.2025.10.29.11.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 11:34:24 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: bagasdotme@gmail.com
Cc: corbet@lwn.net,
	david.hunter.linux@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	rafael@kernel.org,
	skhan@linuxfoundation.org,
	swarajgaikwad1925@gmail.com,
	viresh.kumar@linaro.org
Subject: Re: [PATCH] Documentation: pm: fix duplicate hyperlink target errors
Date: Thu, 30 Oct 2025 00:04:08 +0000
Message-ID: <20251030000408.44745-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <aQHyhU78m-9RPQ8q@archie.me>
References: <aQHyhU78m-9RPQ8q@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bagas,

Thanks for reviewing!

Here are the versions from my environment where the warnings appear:

  sphinx-build 8.2.3
  Docutils 0.22.2, Python 3.13.7, on linux)

So it seems the issue shows up with docutils 0.22.2 but not with 0.21.2.

Thanks again for confirming the diff looks good!

Best regards,
Swaraj

