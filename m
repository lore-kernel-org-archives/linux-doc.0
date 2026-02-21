Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13452877CF
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771694491; cv=none; b=PFuPqGoQpqzRZpZ05LVIgpgLtLcbh/YsXXvrUNWWpP1Wi6NDt3dAMtBXy6bsfPPcCoNMYz1SVBFkWbf4O3ZzSwHwaJFhNQoOvNJWikL7woBuQ5m23lcaLTeN/thWns1RvUltvsRCvh5T93TuCC/Kw5lVlMhzbYER2pvIATjD1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771694491; c=relaxed/simple;
	bh=MWGoq0D+Wj3dmGxH/U1RNB0L9/ZrR5Fqx8GX3kwl/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xh+p+kmRqBLRd6Q9OuQ9joGxUCVOHqVq3KBL00+A0YZHDzxW1P0O4gpbmhuAgRXhU6MCRPF7uClMfy7X+XpAembKrpPUqkcbiTe4Nj4nK0H3zInyfvpoPR/6T8ORRDxyP+9Kr4OdDpGNgKLveTNxpZKgIOL8hDLC6GAtHMm1c+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEQoevrl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEQoevrl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso25879215e9.2
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 09:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771694487; x=1772299287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWGoq0D+Wj3dmGxH/U1RNB0L9/ZrR5Fqx8GX3kwl/zk=;
        b=HEQoevrlnhmFbf1iLFViks1znYvYZDtIrHHIVauKY83iAmaAPpH/zTz8JDNLkopKiJ
         1XRxxQ1u1U4iNam316T0xZNQp+7MT4RTnth46vQNkK4+Oum9bsFbYvTXDGNLXIZW26UZ
         W302X3dOLeS2/WTIf+MuNVMzS5UJZuDLU82Q9onRpynfuCnd9btfDeT0/m7y554PWHlN
         DnUWmlIkxgqJfR6Sr7DpD+1ZJDdhkOlNq+Xu/KrHxFaZZnSDTn9Kk9V3Z5KpDGa7MTRY
         Wns5WCDOsLHhaLPfX8QSnd2k7RNOV8UGc0m9bTFlbh/7yjnb3R2ZzaXbdAHdpt/FMBUu
         Gbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771694487; x=1772299287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MWGoq0D+Wj3dmGxH/U1RNB0L9/ZrR5Fqx8GX3kwl/zk=;
        b=qWIhwuwmzjfIVQ1y81pO9syKY7XszOw3duLQMDx1HW1UB4ARXJzckdFZVd0S5RLjjW
         Vzj4efa91E3MJiI9wxJJYUSAlJFuZ8UvyIcO0Hy0lZfkB/zydq/F7UxnfMhP+iZjHTR7
         S0m6j4hrYmy/mbw7tWf2gy7a25nrzbtaBufJSsPgP5S/XKaIgqyoPIS33dXaiLFvSfj5
         YNKrY16vQxL5aaAbl7fMLUHfWRFd2/qhK3te0z2Q+S82dzwDU8jxZ7UZsKKvj748DD+X
         R+7k86VECPNTNTI4UD/yfaGe1xee3B47JOOVpjCv7PCOgP9VJz9v1QzsGSoIv+0vjrXs
         I8JA==
X-Forwarded-Encrypted: i=1; AJvYcCX3s+bLHC0t+lldH2EUe0lUFx5iJwSs4QQm0eqaDNmb26K8uZ0d9hVP5hxUZHu1GrY9/E+Vv1xiMBc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5dFkN0oMgq1t90dUb/4rDU1UNi4OEzzskoHCAI+PJ9aLJ9Mm
	od6VJhDkziylUkyBR3aroaVzoq8NccfdmWKDfXrJeGr5pQ3vYZhikV4d
X-Gm-Gg: AZuq6aKPhMF0ncCZF1aU+DzSHt5r10M7tz61Sd0GzjHg3lsDndzdnscphuRUoU88USq
	v6Cyomohc03n/BKAnjbSKJg+tA++un3Zal6dQL5T3DkgdrB8tGrojO/VSb42EM1UVADVFevTxnh
	IhFur6aa3AxDM9E/7MeuE5KVGNOus3JE+q9GVzNPT24R8I/veo7nfTiJz/FgPORv2AoNsx56C1A
	ppjokyQW3rP98gEoEtVM/ekyikwV0LccAzm3mMWTOU1WA/Q4lItFI4QKB2s2tsFDpSRno3gC5bF
	Jp38Q5XuIBJVY3upwOH2kPmGcWgAme63KvSIJ2YhobUug+SNmpHiyIN03hn49fMprP3bcv8scJT
	GjuPRo0iTzMTdTX9X28nSrhLjcS5gxOueLd8yOBzndld6cuIy/CmwyQsqIctnOvDoNZjEHKii1l
	30/AfB51UKvYkOFenXvXZi66w+90ITpeienD27O/fdiJmOZC/iinZyPvEZyCZluQ==
X-Received: by 2002:a05:600c:6217:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-483a95eb550mr51020795e9.3.1771694486784;
        Sat, 21 Feb 2026 09:21:26 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm63610955e9.13.2026.02.21.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 09:21:26 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: dlechner@baylibre.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 3/4] iio: accel: adxl345: Implement event scaling for ABI compliance
Date: Sat, 21 Feb 2026 17:21:23 +0000
Message-ID: <20260221172123.57134-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <e2c74e7f-d851-457f-88f8-d80a8d17c51f@baylibre.com>
References: <e2c74e7f-d851-457f-88f8-d80a8d17c51f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I did go over the datasheet and found the hardware uses a single
register for both tap thresholds, so I assume the VALUE was intentionally
omitted from DOUBLETAP to avoid duplicate sysfs attributes.

I mechanically added the scale attribute without realizing this. I will
drop BIT(IIO_EV_INFO_SCALE) for double tap and update the docs in v5.

I'll wait a couple of days for any other feedback before sending the
next version.
