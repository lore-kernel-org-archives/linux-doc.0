Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C421B6CE9;
	Tue, 21 Jan 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451171; cv=none; b=bw7lj5s3g2XJJziBc47zTCKkrrYuoiua1AHzj43fyJTWOdBbA5mzzVL9/JOrZbenlX6BacGePdfGv/Dqy6/AFho5++Gwgn7zN16B1HbQ6/IDUHNJE7l/hTKer7AxmsQJkz7c4XjuUqhorfh7Nj7E56TRosUH6Fb6hv97AOmZ96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451171; c=relaxed/simple;
	bh=4or9mCMAkvG98AWZ9qL6deZsW30v4tXFZXm8ywfU/WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeBa0DEWrRDCU7sg+u2jdn058S7DEBOFU/S9rTBccCH5YS9gdVPv6lY/VBSSYzo1iN5NmvvcsJ9leZX4VWHRm1u2lOO96AICT2R2gbt1IxwYMkvtdqCTylcagzF7MVrnXdgSX+nmbAFHbvFNZ/MBCX6Uq+TawhCDHXNY614ugRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaXAtnJs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaXAtnJs"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso6959632a91.1;
        Tue, 21 Jan 2025 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737451169; x=1738055969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=VaXAtnJs0x51MQkGGil7+WOewlovsOFWpGZpkoRf45dhgP3T+abcLWT0RnL9p/fMd7
         MdR9hdvf6RKlaYIXXrx4SkNQ9cR0+KAXkbsZdibgTMtK3luAB5b3RYwmX5j6iYgZlDgw
         ScSqiKCjNT8qxnTjF++1AvsES/NDfxYJ176uT8WdMC45PJGQFBy4lv1S+Ak/pCyzUlHe
         /m8oCvuBFio+OMuw01V+X8+F5aHrz2A+VvYUrNOPoW+jjgBZjsWhhEiEAZESganLoZKa
         IT+hsejiDFZTXcjiVDPn6PUNCUDyjW0j/x4NfWzG/3ssRHiKdqX6rhhdqRi9QNijn6p5
         oeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451169; x=1738055969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=f/sQIHwwitIw3rre1QgAnBWVqUCxyrK3pbqrJDWZ0L1hkzg/7ki1miyayunecHMo+F
         ZHTRz9GKV1WWQhZUxK+5uQjLh2mWYe4UNiDEiOmyIL6B9REi8naz/4QFU2N2L5y3gLTT
         +PQnbInBhiAiPoXcWfR7VcLMm+4eva0MXdl+4jLhlN1cGOGPWw8YeBuNCOUDMiYY4HQ8
         kRojdKqc9peizR3xZWyPaLHrC0oe5LYg6jke2gEKrO5HP4l9YGKMhQheVLalwvfwVEni
         KHXdXeD31wbDmjjNOioXTkSS77DadXaWnVP4kQhWuIIOVKhCxX/aibzL9wCtVPe68Cr/
         nqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUKbzLxqyMooVAgyWPF2+vlzBXcSx9rRh3D2mDdi/LgQ+C96sWr2zG09q8mO816J3StedEp+cuiJMhntpes@vger.kernel.org, AJvYcCVK5PmQVfCdYXcWDq5hUb2jyJ4zL89t7MBJWNXuObksqu1xGxpLDfW6ZojbBzIaW6q9Tto+jAgYHkyv@vger.kernel.org, AJvYcCWon6bRljlvvHsKpICMdWJ5+GqbRW74eddXraDOusRWlBiIkzatDk34z1pNr4ZFP0mZlguZuuPYOHeG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2VNCZQFhHx2rnVgwVH/CtGOWGVFXQ4OEcdou3u0Mg6ItZ/dIy
	HByXKMr33FWcCk4ejfLmYC8JMRLAuyZTIlAx9TCxMrkEtbcYcNuRPqV82rIAIuXkZN3NAxHY4r0
	GPbK/Hm0txmNg9kyt6OtEURJ+jPI=
X-Gm-Gg: ASbGncuKyY3ZGh6+WW0lXb/AtjfzflQv/54BLrGAkfLIFixVFaFlOIdsCCd6swBJEJn
	cA8r0b7+KoU5Q9An+8bbf/FtFN+19YiemMFbydQP7dFH6jjPoa1rJrjcrz5ScHrrxcg==
X-Google-Smtp-Source: AGHT+IHGWqxvT9gpiCi2M50sC7hANpRZHJI/Fb/4ZsNlfTW4QBH+d6oGf9mhsqDy2J8HXKVAlymqclIkcRr0VJ3gbc8=
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f782d4f168mr22914331a91.25.1737451168941; Tue, 21 Jan 2025
 01:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
In-Reply-To: <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 21 Jan 2025 10:19:15 +0100
X-Gm-Features: AbW1kvYMf3N-mBfPacW0Bl83nBf5PXk-cPJ5NgOebdXSbVXyMxjWfW3gWa_3_g4
Message-ID: <CADo9pHhNbq-i9r8QwkCCdzmMf6L8QNiiKmzP=sr=M8=YfsJcBA@mail.gmail.com>
Subject: Re: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Luna Jernberg <droidbittin@gmail.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"

That was what happened to me on Gmail, was wondering what this was
about, thanks for the explanation

Den tis 21 jan. 2025 kl 10:17 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>
> Hello Pankaj,
>
> On 20.01.25 10:26, Pankaj Gupta wrote:
> > Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave".
>
> AFAIK, recall is an outlook-specific feature and most readers on LKMLs
> will just get an email like quoted and thus recalling the message only
> adds noise.
>
> A single reply to the cover letter that this was sent out by mistake
> is enough.
>
> Cheers,
> Ahmad
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>
