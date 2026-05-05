Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71033F36D
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986728; cv=none; b=Xq/JiqMqqe/xPtM8LrBvClf3NBCk8a8QL42ekW7HjsAYgjJCJSEMJ4z/pWDdoRuLm/AwPH1OkFwGZQ4haJkANtpfgRYQq0SHorLaBo09+8HqPJ46RJW5kF7W7mOZf5Oztr6EvusWkz1UVuk5hvq2FzP0vCSZxzvwS56f6RC87bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986728; c=relaxed/simple;
	bh=/iGBjA/S0S+U8nYvRPVWTfXSFZOo3x77SRoOfbcnGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk51qANQWK45agzt3jCHHZTQLR2DjWgX2OHEA7JZN4Fl/zGtIlL8nQcxRKHeOHfsxbW0jG8RgQKOPf75QHedGgKKaqq4y+1ODjB0UDvJoiT3/5Q9LD9mAj0x5ryKqNpdq1amXLTijU3UkNZYJhBPIY4p+vUyiyeu2aAclWW2gBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWYAC9r4; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWYAC9r4"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5672634eec.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986726; x=1778591526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN8oRMobbZpb1CameJAbz8F1xiPwehhjjhOCQAZYXaM=;
        b=VWYAC9r4uoyytsgGjbWwdQnyAR9RxST2wPWpgdYAU+QeoOEyPjRobEwr8x+0Wi8O4k
         VooGx/2XPrhmM2gCBU2qOcHL8pUpeAnJoSF5magq7kxsO6ZrIhVAw/4uDaqvhqLXASwi
         KiOzFzhp4vXZwReJEoQwoWS5iytx3vw8U7wzJkew4YcrIKKoavT+llVc3VWdJc7twC0X
         VHyM37g6rc2UKspfCxkryC+k0fG6R//Xwr60zetIF3IqRaLIOiPd/Oi/tmpAawcX/mC2
         zsIZPjnXpICsCkyQ/1D/DQwnU78OfAWC8pRDRR/hY/1ZNAE3/v8iMYr0gdhtDt0W3uJn
         tdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986726; x=1778591526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XN8oRMobbZpb1CameJAbz8F1xiPwehhjjhOCQAZYXaM=;
        b=Pp1mOQJ7AVCry+G6fQDs0Zhr5xa4l76pBgNyB9UkEqq+V1G/kbDOcR7iGKR8tBGdMo
         kBqlQd0m7RoCmqBPI015MUIocNLTYgk3V90lkoBrgvRVqo8c8xXtwssICHFevehMbE9b
         m1AkSlLTLpsWLiDMC6EgrJmCRjJIT9O2s7Y9sYiHHY+6CBaaWvcFK8R5u/207CLAfzhB
         Of07d0jzoWyXaomt9RCyOImIMCVEjQs/FKNZBT1YfDNykLSeTz45+BSEco4jvn4NVI0e
         D5qJ9+MllB78qkK26zQ6Dy9mdJ7TXk4NKjyQsC4i6UlW38sYJFhV31q+W5INpltx5UlA
         qlSg==
X-Forwarded-Encrypted: i=1; AFNElJ8c460ZUy8nRJ/quSbwqs2mrSzS2fAakCAt4F3yrGna++kiCMWPvyFOOXaUfhQqljJjzJUMdeBH86M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/q5TrhEpbdiDoZRhAC5+yQqU2IajsWXRM1sN5kW+PmCp933j
	GZRgDqNiAOKOnDcUsHEfPyMpwvMBHXNCsYqRqJ5GOShj1EFglbOxLitv5aRd4A==
X-Gm-Gg: AeBDietLrNTf35Y1PKCuoZ/QHFRu+HjlMJ+II5K7SCiphTdd13IhC3deg6XpvPcfhtP
	N/CTB6BKp0D9oMSgHkNuOjuunax8No9bSbGxTjDoqidF+YZKPV6mLeDfdvJDhkGqM//B5Jd0JSO
	iZKse4fvjBFuVMuxY/x4AXHWkYJKKT0sUuanUJWL5MLL/CU6ZbDUmH43kFBqfY0HiVqNCkIkgVq
	fU7ccHosaGsrZ6jR2Z251Z6/XbxTjiQwX3gRH7fbzKrN80xnlsJgN3sNIF5LAOS0r2uOSlChNAX
	F3aOc4NV6gXyxtHsqnVlXfiZtds/2mKrFeQW+X1PBSUSdX+/2nh1TwNoQLB/ZOVt1JXsZr02N10
	d6l96+lm5zAK9zsiansv1ywWPhM6qt5/xElTjI8Fwf0CSdN50Tb/6K4zMPEcY+WQYMSszFGqcI2
	Bh10lBnWaw4FvpysIzC7/3x6SpUAkBrJns5JeRe7olgQK+Mf8mQEvVlsotrw==
X-Received: by 2002:a05:7300:c86:b0:2e2:9c65:ef6c with SMTP id 5a478bee46e88-2f407856797mr1528228eec.4.1777986726081;
        Tue, 05 May 2026 06:12:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d78391sm27034367eec.7.2026.05.05.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:12:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:12:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philipp Hahn <p.hahn@avm.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Hahn <phahn-oss@avm.de>, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] watchdog: Prefix WDT with ICS for clarity
Message-ID: <5431bc4f-4515-46c1-b121-931b798f951d@roeck-us.net>
References: <cover.1777972790.git.phahn-oss@avm.de>
 <5a71979d8e8ab8e0a30de33f6aa2540b3b5dc1ee.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a71979d8e8ab8e0a30de33f6aa2540b3b5dc1ee.1777972790.git.phahn-oss@avm.de>

On Tue, May 05, 2026 at 11:26:16AM +0200, Philipp Hahn wrote:
> From: Philipp Hahn <phahn-oss@avm.de>
> 
> `wdt.rst` is only about the Watchdog from "Industrial Computer Source"
> (ICS). Change the title and rename the file to better express this.
> 
> Add missing SPDX license identifier `GPL-2.0-or-later` same as code to
> silence `checkpatch`.
> 
> Fix wrong link to sample driver in drivers/watchdog/smsc37b787_wdt.c.
> 
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Applied to my watchdog-next branch.

Thanks,
Guenter
