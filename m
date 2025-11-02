Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EFA34D39C
	for <linux-doc@vger.kernel.org>; Sun,  2 Nov 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110603; cv=none; b=ir05YLNSoh7yrBChXRQNN20s0Ozhdf8EZVVULwQ/KH+RFVQIu/NA2LyrcmW0R8URfYe7JeO3p2NOlRhGUNIe3lmrMw2MnkNSH8Y8Ct+SKp4XznEpb8HMKDU0usXa6IgSinYyQjoF6u9I/KsaPnEoYbjCKJ3ISqPSUUG+noBxvUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110603; c=relaxed/simple;
	bh=8Znko5NuDnyx+OGakH3V/EstaaQ2BsRjlAmgoLRxMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3ClW3RhcT4h9NXzRWIvPlO/N50qSKPVkUwzeKio5xukAkNp142uM1qqiHkcWE5dhL4ko13Ytvsm8Ib+D/75H2Eg/2WIYWPH4KEdl1q7k12nIXoUnus+Cvx9NUbGPmDrxGF1P8ODiiT3JrHjuoOWRG4LaVeVkHBtVqklqakyTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1AUc7mZ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1AUc7mZ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso3379765a12.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110601; x=1762715401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgLvpaYQ9gRjsmHaaMXfyMMelQArREAHVTBvb+wL2M0=;
        b=K1AUc7mZKJfyCW9y3IENaRrKjRNtD+U9+P1s6wdOZIfV1vD4Nvk1npp1ueCBLsWlZY
         rGzUYf6p560NtFFpvCyGspHknzsH+/X2UiHpqebpY2RXLjdXgz+X9XAlyjPdzGwT9T5W
         WwxAGfi7+p+Tl8D8MDjUUpYnu2L3re0HkDCTedANxmXSdLs7sigukivrnwcs7AyTi8sh
         Qj70NaextcpeTsDx3vAXBTrSrAqtF8Zlv5z1XDFQJRHYLGn6j6sy3c2TWweP+zSl7h90
         cHwZHGM8dnvg2wtDCSGrtMNF4LBIXkynoWopds42QAytj2jD7FjrXNEmdwPANizQpBQk
         Ab1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110601; x=1762715401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgLvpaYQ9gRjsmHaaMXfyMMelQArREAHVTBvb+wL2M0=;
        b=Zb94c/VWksx++6wkf1vlZx8SDmjim59GAmWXZAVtinOauHJwscqlPBWlpffRIBPbaZ
         eEs+t+h+Cp9gqp+Iaud459jzpklF3En8ozzIvdg2QYl2M5H4BpC7/YYJJSpUBFJd895D
         UlEVsZyTuqcTvQTJcdnKQlzcfPbVoSF72+g03JO1xfAiaqT3TZgmGSJ7edStyHoDyCBB
         bqn2Wv/4Pm627F1CSRy9om67dvbo3BlNmebCxsXCDWE3HqS1WuNkChdpPyVGlFlSv5XW
         S4gqTzXc1yy+vUko0QCutUBN1ecH/b3ydYPLfUfP9H5l2QjEnx3ucgupJ5jHUBCXXoTy
         HScg==
X-Forwarded-Encrypted: i=1; AJvYcCXjE8vI8V/fWKfHHfpLYEdsJiBkoEOUycQpizOObJD1lgfOlE1StbuZFmF4Wgm9sovwF1Ll+nC2JGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15ItW35B4aSV1j4MBdNH/Ss21PRxzRPzrvOwhP5G9uvxj4lMQ
	e1nb6k8HlPfxiob7bR8ZTBKlEeOywa21soK+qJy/ZxQukgXnGUQc+a7ERCiH3A==
X-Gm-Gg: ASbGnct87j8QlIHH5SyI0H7vumHgSWdrqip7YL9L2jCyMwWWNh1xbdLv9y8y3umc+wH
	lVa6+jMqaPZM5Mkp9xALAV22JwCMqtlYHlW0DWtYPV7H4FrAuLHi7xZftSG+xiVhCVZOl35b97S
	Kq2iyxMaJAVp/BlqwgpHVjpOrOsW+KEaM3VZOD0yHk+BJp6szeDPDg/IE69CyfZGjsIMvoWFAbV
	52uguJcxiSD71jfBaULVlUiZMcLz37M0e11aNeBqLra/UNw2MD/IhMq9yYQdN8F7fcIEYYfU99K
	ZWz5MW5rtw4Iw5ljmXUqky6Y2iFAiVq0Wp7ujYMWtezZgiNNnfAHGkQxhdMcAhrx6EQ2B0AE3wt
	Rxn//1vPPiwsqS/BYf+YC19DxuwIFgUdhMkm/01+qYsgsOgANIxPNmd/AO/ai0NpZUH0KSXa0hE
	r3eFKI/Owp+eJa
X-Google-Smtp-Source: AGHT+IHkMIAYpUU2qCDVKXaSXXcsZFHQC4KsbEqB40ybOnj25k8W9KwHb++brJJza1y8FVB8EDMWqg==
X-Received: by 2002:a05:6a21:99aa:b0:33e:eb7a:447d with SMTP id adf61e73a8af0-348ca75c0ccmr13766035637.17.1762110601545;
        Sun, 02 Nov 2025 11:10:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34092d2df47sm8433792a91.12.2025.11.02.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:10:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:10:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: akemnade@kernel.org
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sy7636a: Fix sensor description
Message-ID: <d8befd43-5398-4659-a6a2-afe46fb5a541@roeck-us.net>
References: <20251027202847.119707-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027202847.119707-1-akemnade@kernel.org>

On Mon, Oct 27, 2025 at 09:28:47PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <akemnade@kernel.org>
> 
> The temperature is not from the die itself but from an NTC. That was
> verified with an IR camera. Fix that.
> 
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Applied.

Thanks,
Guenter
