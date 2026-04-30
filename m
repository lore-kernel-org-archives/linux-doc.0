Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99E47A0B5
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571828; cv=none; b=nF5Y3CfqutXuaI0kM6J4pC37sQVfFZvw8ee9Iu2ozkoet6yNusWkWtBaZ7x3eQz9BwKT/n454LKzzAFwmb58Vm9V+7HLxBZmqTL1VqlakvVRSqLkO/p4JGEQeYxpmDiR9MDlQ2mMuJjt2kk3r49SsGT/MkH7tsIkoHcRJ7j9TVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571828; c=relaxed/simple;
	bh=Si9XWxBGvLrdQNvQasBTMwVASAqKP5AP7jxdKns8/7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjMbVs1SqyBURBfM2oIBjbxbPfAVONmqD0341Sr7da/ycTr08G0tVb6vj9MZ+qU0HuCU279Dgm7ZONC50gLDy7aOritdlgy3LWPUzbR8CVkAzyUZB+uUWzGFX0fCUeCe3jAdvp+5U8TnwSdPHrAdV/cigBgr1ww2KGMfzUHTGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPXEaH/V; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPXEaH/V"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-364d72f2986so631617a91.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571827; x=1778176627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=MPXEaH/V99vtTc3b1/l6LE0n7HTJ88FoNds75dnveCXV7w2Wm9v4NwPPHuNiEd+aaf
         FTl7uoNFS/bQJo6E2lMkoRvmvsj/SNqEmO7yjovhFqt7IgZlYIXV7KwfCtTcE+l7rQFf
         lPqdvBk8hsJEvwoAJ79xqqWRYPr7VXieWn8QfA62xmWUSDAfWtccXGRymFnFY4Lip3Ff
         TPk3KoXhTQE81GOUU4lb64PK3vvXfFvQe0yKdXLUinwr57BJVVofmJJF5qpK5+HCO2WN
         SNi6+eYfzqok2jMTxWfzno74OCxJIWduEaiBEESi9luCw3/jgkwln440og4QrDks7+kk
         eccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571827; x=1778176627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=nnWAGhT23vO1uRXJP8PBOHKR2uMoq8eWi3xf2ktaX00u/9FY29Z+b3MtUJJQrlMcyK
         GUf/VZGagZsagg2MnhPT1pMIzya4HsjMIi/sJXg5pheaqqfggwGqTqN9CQCxK8Ou+A27
         bowItalNwq2B4NB1WO7S2SokcZwSaJfgoC66Vewh9TR5pDWbGU/6uVHcRDrMBLqO2aRI
         s9zYO0Gzkdu9vGvSq45dEnjvBeqfsO8kCzd8pP6Uf+YWHs3pDEDoQX0vLlhTc3Q5Q9zq
         RR5ZrzJrbhgyzL455MYbxTFQNMlWabXXvgDU6uIVNXKXAk1fKLBf4XCQKAArs1Ykp1r0
         5/5w==
X-Forwarded-Encrypted: i=1; AFNElJ9kFDva603ckzn5SSiDl7zDsOJ64M99rflFg30ijyu+Sip7LcYnSX3uyyTo7XpQuubV8zWsZ0+CIQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx7Tno81Bsh3mB9fYzRMBfV35MVdtBcFEOaFrYWAJlOMpQkzuM
	sXf/nRqXn/WMt9DJv8Gyuh/uzEh/3GoeXUsOKJttP/ANghTDakg9L2t4
X-Gm-Gg: AeBDiesFfS6o25FKMG755bZa+ytuRT3kmBTASk3eg8Z6LxaXV8d1Ml7aAY7d93KfUjm
	vMl09RWLBdvQ9dsUzYt7/97COWoEBUC9dIr183YOP1vlSE/eMlpsJibhxUU1IJ5dxxSDjY2OxmC
	NFP9xYKdU/N+yQ4eb8BbX8/Jw1gyaGxLsFKPx5CdmdKjiqNmVmNiv0SiLVkgf//JpBDKTyrfNKM
	Fqhz8QgjX5SmbL38RFiKlbqNBNo2md90xWdud+Acrfuw2vUpfxdYc2Ehwpjw0PjDPz+qcdv4vWo
	SLVxSvF1ezn3lVM7RR3E7XjYrMm/9Cft3D1G4iaxf3jvTbI7WpzQoHq6djGSXNNNWrW0J035HOz
	qPM58UL0MhlIpzGxDDMfdVbZy3MPcNX8c/EIfoTAlzwl7HKotiK/wWSSkhfwXKOnugt0OLHWy+n
	fPs5UdoCIImDKl5nNuXvg7/G2m+vgzWq+pmCORyVvo+Ze1sBo=
X-Received: by 2002:a17:90a:d444:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-364c2f8bf3dmr4137344a91.7.1777571826829;
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00a280sm53136a91.10.2026.04.30.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:57:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: sergiomelas@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Message-ID: <30d60aab-911a-4009-a8ad-393591baec58@roeck-us.net>
References: <20260417191411.713958-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417191411.713958-1-ninadnaik07@gmail.com>

On Sat, Apr 18, 2026 at 12:44:11AM +0530, Ninad Naik wrote:
> The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
> directory. Updating the GitHub link to the correct path.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Applied.

Thanks,
Guenter
