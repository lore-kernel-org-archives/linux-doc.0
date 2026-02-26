Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604C3A1D13
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118228; cv=none; b=l3hMQEE+1Wtukz1DqeMFJM1n2yZuyzaG89lu5XRnl4HBgEb1sMLbHR0gJLDscOo8cBypMg5AUgUgU/wAs3rmrzFNV4EQYxvkXRdAJhwzMMLKMgF9PkmCHoP4jO5H6sP4r7n7503Z/4EAm+yRaTnpmzwxNpKbiJhgO9potdvOf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118228; c=relaxed/simple;
	bh=uWGTAgDkfFzDF3tXt0jhGG9aVGDM99S2dXiFj5vGffc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1jyzTKopexP4JKK5lEH4xTP/xS4piBAR6FoLiIlmOnsNTZnroBNanpFTrStJ6eihMaxP3EsTHrN3GCHtkvP/BfNQM/ihEjxg1n3j6nhs1HL5Q3FOO8TDzWQ4he1WMhEY+vG4tF4BYKjp4nvkcGCThm06MS2HEXyZeZYHvcj2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2WyMJsi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2WyMJsi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48375f10628so6865825e9.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772118226; x=1772723026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWGTAgDkfFzDF3tXt0jhGG9aVGDM99S2dXiFj5vGffc=;
        b=h2WyMJsieyur+MmwL8iYJPZ9f9vteC/QxE35OMb1TtYTYoz68fMns6v9/eMPiow/A9
         fx5NccAMOsgoahWlEaYJ7+CY+9H0KqgBTm88wk7fvSOeb7wYX+JM26OXXALvAtmK8nMR
         /+nN0INa/kBywYZuKa7elESaxIR/mr/AyFEFsZ2sWhvRiijZh0bh+MXmrRcLEu18B7CZ
         MZJmf8Yy/mdYNoo+lemc5luFVuy2UAHjv/toES8hk/sXiOb9NiCspHFI/5O9xwJOIGrl
         38EA83Qnx6zYs81rc/3D3i6J/ogX/nci3BQn63gGFvF98WclyXYernwVtVsy3ayGM9KP
         ZxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118226; x=1772723026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWGTAgDkfFzDF3tXt0jhGG9aVGDM99S2dXiFj5vGffc=;
        b=GkmTPmWykkDs4rhiDyT7lZ1C0C8dQoACSz9xFBTS/YfWKf24BkdjQMyf6RJnBGtwq9
         0JeN5rI+e/C/TIBMla5iFDPEINCHSQ7YF+mqmSvYZ2z//Pp2ZM7eY0C5KeRMdcyFdNhQ
         OYCIgIho9kZkMurXekWvHGReO00q31aYu6K/tLiT362TeJM9HJnArUsyJ2tF97YWoM57
         VC2bIMh9Mg9JfnCYx+TkjfmSD4wReuwXKG4fesuciXUvd6OaRbWDc7Z52G1AOGWwYeJg
         Ti5OsG6Z78wx/alzr+RrDtnD+/jLNhqgW9fHyEsANhAgiiPs+pXyDMfyoo94bO47x16/
         Fx7g==
X-Forwarded-Encrypted: i=1; AJvYcCWQQv396LiNffuCYRMsJTTpgGtL+j/Rb2li32i4OUAGQQyPvC4Kwm9oA1kj+TKzYdN66frje+ok6C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9Cy/IxYRb3YyjOiT8hjG/s0mhKgJTF3gaW31PVszBlcj4W+s
	PYjVPSOCNYT2KSnLuo/x6MbptwXD3eqEtqbulHF+YbVHG8026r1hTN4V
X-Gm-Gg: ATEYQzwAWyEMNCTciCSbB70mcuH+CX1+0cPY9s3I9QM5XDR4/RyS6FrSiqHpNnTtTyW
	oy50lPsziLD4tuCkDFHHcp/PHD8Qiku1bjiGAPA/f9bHyD+ocpVNqoCT/ZrEjegf3uZRDiBfbiJ
	Vb3btRxfa1aVPpvdLEGf2zN1zt0z+uxBCyJqwNOwXJHoO41fzbxojo1z+972MVyr1d0jpwJpS+Y
	APM/2BIF3lTjGe7Hqm/zLQ3rCxCdIG6FuWNiUushE+B4ToVMDu0rPchRYmQ/Oe+UxoB3w80iSTe
	T7Qv08UFIdh7BbomAIhRUmn9QvKuZNyu3PlWj7UGMcRZuYDsaJ7PLrs9Ikn3bg9gqJbe/QaC1lp
	LrwANqhbZR7xJUu0XgtZR7BYjIjBcqimZLkl3TlZZ59S7saAWJn8WqBevo2U3t33bLl5UVkL76V
	lTfezAO9ELeJNXI2JG1B8cQDRU28j9ukZLTcXDKVkEftcbGJCw/OCuLKRkqJNhmQ==
X-Received: by 2002:a05:600c:1d0e:b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-483a95bd940mr346655635e9.12.1772118201768;
        Thu, 26 Feb 2026 07:03:21 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm163504135e9.9.2026.02.26.07.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:03:21 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	dlechner@baylibre.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 3/5] iio: accel: adxl345: Expose IIO_EV_INFO_VALUE for double tap
Date: Thu, 26 Feb 2026 15:03:18 +0000
Message-ID: <20260226150318.21168-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aZ29vjil1d7NF5su@smile.fi.intel.com>
References: <aZ29vjil1d7NF5su@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

Thanks for the reviews.

Regarding the bouncing email: it is an archive address for the Linux
Foundation Kernel Mentorship Program. The guidelines recommend CCing
it for the program application to help with the selection process.
However, since it's bouncing, I've dropped it from my CC list, sorry
for the spam.

I will send out v6 shortly.

Thanks,
Taha
