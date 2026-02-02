Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455937AA8E
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046214; cv=none; b=bR+acQXcDK5qZc36HeJdyNyGDEopqfC6ZcDvPQFp7Z9IL+SttrrfTIcGf2SAv9r9MJ4m8StL21xiq6WJmooiAdo2T396eDKP966Q+7EK4E4fEmlqtQb9Anibk5AkH3po6dUkg5MjgOcFCfz3dU1q4dk8azfo2X9AnfuhmahtrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046214; c=relaxed/simple;
	bh=2k/8afkIWZSdo5QciZuWLdMGT4c5f0pC782XI+ZtzX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1LFq4rR9ekTjQhHlmUiC6uhp8X2am/aaMV9GpKRQ69tQKOPcT7PvgjUC0JggKG4UQoM4hiWN/ZCx3rSKZxRLYmo8B38qY1Uz5ENxqELCK0NEk28unJA0Z6OgNrafwsh+LEbwbmprHVZ24m+UJE1WnSNPihUC1zxQJzNFsamOF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cqf31olL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqf31olL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48068127f00so39301925e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770046211; x=1770651011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k/8afkIWZSdo5QciZuWLdMGT4c5f0pC782XI+ZtzX0=;
        b=Cqf31olLhPIvPianEIQCbpnC/6hFeOVEgBOcZVobl6/XNsiAiy7iEMNx954WGA1SB7
         jc7UsQT2IXBjAjCvVERBdyWvx+MCQInqiqRH8CCZsIkmFNw8WYOuzW1elrlWFlYz73cM
         0eZYQ+mRKshrcSWkbu0J4f/YXfkY6C+8ljODwRupLIcNhHcywSeSnAT4v/NfdbwL2zMs
         pZNc8TXDBz4T4zKOe5iDy1LTzj1Mn3T7Bc3gJxaEc37XxUVW72jcbfJBHLPV9axR/qS0
         tOH/Ld1SwOTH/XYdxtFTm2RXSGeOvK6c/JsVACgHiiqVGexH8lCDnGHd582Z/Luf5Im7
         jSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046211; x=1770651011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2k/8afkIWZSdo5QciZuWLdMGT4c5f0pC782XI+ZtzX0=;
        b=kx7wnW/2BWec5azerGv2jcpUvcX+idPsafWVu/BCZXam6C6vbYfK75HqlOYapUr6yD
         FGB/rGqs6Kig/ucxXcjsio3gsRO5JENpCwHmbKyzSqQFqi/oEHKWvGwRjFdHBSz9GDQs
         2+cUKcQiRfYBAqrT8GOjl5+++TB79KyuldeGVsTG0as+RbJ72QXsAc7EAtInVFNzsGxD
         vz+uCab7e6GIeRmocmA0jI4lV/Nl3Vw2A9kG63xSLp+70mIXhh8QpsyYJ5yhSgRWxAME
         wjWtPt4RzFmeosYmU4g+F2Xa0jmTjB6pu1llU1xKHjacjHYoehTFmvVrXg2OJHr8P6CX
         MuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUalo/63P/K/Yf43Iiyd9H1CP9E2HrrvB2/IsE68b759dmfG9NRs1PZVIPeWY8LNINJs43nAiUA3PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzijVJr5pqmDgcwtHDTo3MetjR/NgvH+JzVT3aR2cTMzrCtdemm
	FRLJzSjBis50XEazcQHDCo4yd72JLAwXIsDYGrX7YFHn+3WOpXIgmFGn
X-Gm-Gg: AZuq6aIPQExo2v2rKZQNLYzzIF+c32aIVgCimLb+bbC0uyS69imJ63WIrBiSddlJlln
	BUIfHvOwhsDk4N8mJ+HQssjAMzFMyGxgA3PhgIN/VzrFKsIlneFtYH7CGVmrkcYS49PmeVS/vHz
	BoY2Aaczm5Rf0ez3us4iNiVPlxdT0pxE4e/q0Cv0eEBvYeWH4uu47I2KcdQEIn8l3FpMkdBDSD1
	nGHp44NmMHv1aj5PJaAhdKlYUyPKvjMYdLBp3KQffBebDoJcnFA/oX1e2qJH0gFgb/vwq2As3DR
	+pAHmNifmHOcldcJdnlh4r/0NAlflngabwaSQKUPPi9KIetPtwMbforZuEKHqNwBs1swtLjhP6y
	XvfAH6u7Vp1HLE8XCUe10LX9JnlBz34xTlqjwcIMnJcBFW9N9J9EtYjI6jGEzndBQHX7Lbp8Ffo
	ekJBOjxXkRXXKV6YJjNzeKu4lUv+r51goQr88ilWFjwIuA+96Z6sANjxvL
X-Received: by 2002:a05:6000:1861:b0:432:8504:befd with SMTP id ffacd0b85a97d-435f3aa7441mr17364642f8f.32.1770046210971;
        Mon, 02 Feb 2026 07:30:10 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm47269977f8f.38.2026.02.02.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:30:10 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: rdunlap@infradead.org
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	dlechner@baylibre.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	nuno.sa@analog.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/4] docs: iio: adxl345: fix typos and grammar
Date: Mon,  2 Feb 2026 10:30:08 -0500
Message-ID: <20260202153008.16588-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6cee15c9-13d4-44d9-bbb2-4a7a53fe23f2@infradead.org>
References: <6cee15c9-13d4-44d9-bbb2-4a7a53fe23f2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the catch, Randy.

That makes sense; I'll revert that change in v3.

Best, Taha
