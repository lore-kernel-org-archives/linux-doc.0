Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4C349B19
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768420423; cv=none; b=qorWzPwRSgcJsCdWErHpay/rvqhUAqRYGzpD62Wl5nHhYjvixTD7cmdwrZjPlrpMEQBFS/vFjtqy3OsERcGvaHEGUe7u8utEELH8b2/UthhLy6x0vkTTuSMGthrySyE1KwkeuQvJYeRX3f4EVQk7Y/3cgHrA8O9ZwAum/XXEn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768420423; c=relaxed/simple;
	bh=sJy5YAcpCgL6PoAvNZpyoZyW90SwlLtnJjGXiepq2es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Al7UeYBC9ZKOIEOF12mjtkH9IG9Uc/R4YdKPm6Kdd+gQkgrxkU7Ck6ynRHIeIa5RdFmBgviQs6K1SnGl9ShSN6wiplRdnQGLMV3KYgIuOZcT3desdrYHWBf8Jh+354LPvbLYiWr4UCDG9zbS7pBO2u7qAN6xHLvweEX5JNhBufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEemp2vW; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEemp2vW"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso2130355e9.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 11:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768420421; x=1769025221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV78VZLvMrGdkCRnVLeuCSmqvtvshC2nV6ovYsX09Xc=;
        b=SEemp2vWI8NBvFbbNDfyEVDAQx10V1FXG7ds+GCe3Tiw+JmvwPUZYnX295lJXpPuxL
         9BP6a3mKDb1DxjqrzYDXc7arFpls7BAJcsRhyoAHpwi61kKHfZTrslyg8iebSTDNcAXY
         VaeVgOJQhs1/TWHY9RiLDAC9CHDpMiGSErcJE3hyr2v8l1Crm/NS5xf65d3/LIKkwHAo
         cB/LSRryKPxViXXWYt/1gSkzBu//8zTEkV2k6hhNRI3EzrpaTmcOKUBNyCn67o54u0Th
         Ok5Drbszj/YnV2szi5rPelvMdPmXYihKGzqVm24PYwUmOSTEmt6aKVNqCJ0N+Foi3soe
         JfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768420421; x=1769025221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nV78VZLvMrGdkCRnVLeuCSmqvtvshC2nV6ovYsX09Xc=;
        b=GyRuyJBzBAEWmLwyHIOav0z76Hskbc8romCeLt2V5MW/nT4hxtxO23M9YgzdLJt/yo
         5qOdmXxmZswOwn8pWtZ4Uzcw8uIY/5MpBJwndmVMUCRlifF/s9lug8XGqJ5SsAjkFxS1
         +T/vmK72bI97gae1WlrUopY/Pf/i9KTBlDBf/ht2r6ZUDiVveEPlkja8l/aT1oGnulBa
         rD09hXTSF3F/ZvhIDvHmVR2ggROqUgPEFq0jmjrwAQ5QP21xSl7CkyGgihE3hJXhF9yI
         rM+IJJgI+FfMDCDwo6LhngkAaEveZvorZ3WajdMpDoeV4gLWV6xHIvQGc2nFEVh7HTTm
         JkIA==
X-Forwarded-Encrypted: i=1; AJvYcCWG5cOywEwn/776L9+bzoYJ84yjNV3UYi7cpKHlE5n7cmRn3kq8MZERn1B//nXemMoPL8l4w6g2O9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTHIOOuzvsYxXot5croeHhueg6z3kJPsWh5P0QAz8rs93tlue
	Jpu1ltHOvgyEJwf6hPp6N2q+ftUWoe9IJ/67ZiYEbt3Irtc16tCpau1i
X-Gm-Gg: AY/fxX6w2QZDiVsyJPvhauPGnMB8XBCT5WevQzkc3PSbc3V2qnAOoofHCP4h3YGoAbU
	LJn4y20A0eU0j+4+YWElqBLwg+KNFZyVXU1X4Omh9rIbudaZBwvgRuZy8Rm1ZsxCuHLEX3LF1gr
	34xoxDsdFKuw/WrH5qx4OM9mRDJmyombKz0GXPq1jhA0U0Afop3SWUEbkUUNP2mpUoyB54oneDH
	lIaSK+sz49quxMnVWXcc7GLUUNjHu9sOFUAzSYNMmYm6PtzbMClGL1V20shBL8etX98Z3Gidcyq
	ikDMZAi75ID6Lgf16R5UTe9OJ36sk0kmEHkwyy/xeh/WJhAqa/1+Q7Z+aRDUjcQIiAvhzWjgy3W
	stuJ1AtVDppuiQ5YpWAEP98/E6Yu9tnP9oNwWnEWBTOCIT36rBQffXDVIf0LnAqbh4BifO9TIfF
	tx711svITbuMzXqsrd8w==
X-Received: by 2002:a05:600c:870b:b0:477:7b72:bf9a with SMTP id 5b1f17b1804b1-47ee338a737mr45490905e9.28.1768420420565;
        Wed, 14 Jan 2026 11:53:40 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee2864601sm25255185e9.19.2026.01.14.11.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:53:40 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: alx@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	man-pages@man7.org,
	mtk@man7.org,
	pvorel@suse.cz
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Date: Wed, 14 Jan 2026 22:53:34 +0300
Message-ID: <20260114195334.3958694-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aWFnRcjl5SogBakq@devuan>
References: <aWFnRcjl5SogBakq@devuan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alejandro Colomar <alx@kernel.org>:
> FWIW, Michael has been following recent releases of the project quite
> promptly (faster than distros), so it's reasonable to use it.

I don't think so. There is still no open_tree(2) on man7.org .

I suggest using https://manpages.debian.org/unstable/ instead.

-- 
Askar Safin
