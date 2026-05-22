Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC73BB11C
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442648; cv=none; b=GEp7JKhPRVA0cR2d0lu//0qj3vPf350HsqGJ1rJ2mVfr8IqOskwAKvFLkw6fnjG/L7KK9oGgMtL1wH2cU52WIZICTQpHHHb7H2iEpySdddKT0LhE1AUKy7JI35zAIZJ7BGgq6YWIjsMTzsf1S+KxbHhFqakalhdk8upZiGvaZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442648; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQ+18qjg1CrmeDF1mLblapiSynf9RC3Iw2gCYJLllMBZYq0hOGpTRz9ecp6b+ck41IZ/zmnYpJTtEOIWIJKWeMTMTOisrxjkeyLIt105XNM7bquS4w9T/la3puRzaYv90iNILrJfhplCYTL5k1YVA26iMpzv0d1FvXQd604LAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2iOGuPr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2iOGuPr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so5082545e9.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779442646; x=1780047446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=j2iOGuPrQ9dJfNkbKDZbJHYZBDsPpGbQxgG5SZwJ73aQefWo2i9q0SC6a6e8MkBh5m
         CUJiLItqV9dPYLLiaqtK3s0EQIjkACaCErha2qDUdkXfzNI6dbJ62CxyY4caHS+dbX04
         57xuN6SZz9F0RG1SF5DBC1rfhL1XPkx0gF1HCeA86wHASwWrzGy+vsTxSTgYcY+XYLqU
         l4gni8p1iHrZKcnPE+0UtS3jz+RHqSXA8AZmf8ORmQamstPrtEjInSKtWsuQ6NI2mvs3
         qSkj6HT6Z4Odwuee86eO/daUfQmrXtR1nvsgyuwn7DR9LKnxiyYtt6UlUwTTnt29mj5r
         dBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442646; x=1780047446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=Hy62mIANSBP+eltotH9eunDLouol+37AFryow6HFolzVtlUf3ZXpbLDTh85XjqNHyE
         yT+K8+8D7JgtME7noMDk4Y8RXYgYUIoJyFjieAsrkoZY8z40jRT913rEt8aHUBvTlQDl
         E8uXHoF3j+Q2m1yOM44uJcNrDt+epobBexSey8EjQemA67ozdId5h9EcgiU+DBr5z+N7
         55t6sTllpNJupb7tKlA3zwWdGgRS3Bw1ZDmSiNo0ikaHkY3qxmPtcZ1/C2FbY6v/WKp1
         PVD/7qWIb0VyMEddkgEyIXLD8flVxcmsNRKlC98Xom3zEWdE7bmyJkFkJkI44mXGJ/q6
         HtPA==
X-Forwarded-Encrypted: i=1; AFNElJ9CunTGvXWta9HEiHZkoxq1ZOAZfz6zT3pzNcAKRXHO/CIXY7G31qTdI9+Di4/gVd7ndptvwHxNV+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw936N/dtbh6IenHZY+9IsSrd5WIx5Tl0AIdxlOfO0IzQuA90HE
	uh3vOu6WmSUMWNzBogUdoFHi/CE9Zc/4ucNSq/nFPaycztswbQKgF4IGzxeo5Si0d5PDf9hfKc9
	jOt2s
X-Gm-Gg: Acq92OHzptNcYkO6PY6dTBo9JWZO+MTOy+0KpZHk4uFyu9gzHGqFbpLP/2daYMYyfEb
	ivzoeNqJaNTJ4CN9Kh1C9S4EL+znGTTcfrWWt0pfDWbZF8faNYZIbum7GQOD1yyJOYMhzhnsGJe
	1u8IdCWo+NorNmOUjl6dsx+NZpaN8rcN8VENhm7s0XVRP9PafVW2/Mm/T/Kht5VVSrGAkHqQ2Wg
	C8QxGNYAb0ZaQkiAkp415H1XZTC6QeXvYzMN8OtKCoVgCobsCMhmBIaCCiYnzyAPMcNfbaClTcf
	Ule0I+iFPPgDIPH3412eNAc/QFHYl5/IYjJN1MIEoOX3xLF/P6JwFnGAEqLLY/qDN/IFXqz/dly
	JLcqaKiFtOSGZLLtnvxPlN7xp0wWDhRmB/bpPArRcnZnsWVWs2YP8n6XmdSsDPFX4CS7XduQzDJ
	LwoFAOcLgSKYIVFe7pwnLMistxCj3gQ3SbwM9VcHWgVQ==
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id 5b1f17b1804b1-4904717984dmr22094235e9.14.1779442645761;
        Fri, 22 May 2026 02:37:25 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm30570835e9.12.2026.05.22.02.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:37:25 -0700 (PDT)
Message-ID: <0ec636a1-5e12-46b8-a172-1b3537968fe6@linaro.org>
Date: Fri, 22 May 2026 12:37:16 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/28] mtd: spi-nor: swp: Rename a mask
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-12-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-12-93453e1a9597@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
