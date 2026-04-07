Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6443B636E
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569969; cv=none; b=SdJSFiNoicCrv6sCGarYipQnKr+TTT4wIox4MxTRgqBN+xsH4Ilsq6wqGZpeBitwNXZ/03BEKbFjYQfJz2GwDw/mnwtQrPYHlbviBPYNetjXYCIiQQkw+B2ZNTG4keRwARtIwbWdk9YLbkkeSEmpgG/Eu8ZerQHvnpdu98z6x8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569969; c=relaxed/simple;
	bh=jFgLrb6d10whalQ8XFPXgXnn6wiGAQpyHMIC7UkCybg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mog1qSM3ZF1UOVygbLVluWnI/Tf8te6aQXjhCcO9JGHQKNLmvn79y8wDmAWfPLN2JDvgLN8vVUbvI4VL9pJC6A87sqfJpTyz1a7SEwI74CXiQLs9KlTmxx0lAafHy0MKRVxGGFiQoZR9XK61U7UO68xKsYPjrDDOLsjAzSG30kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkqV5PM0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkqV5PM0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35c206f0481so4904567a91.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569967; x=1776174767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3u+B1dxGddFJGWsqIxZYs8PEcwoR//wfk2Adfj8h3o=;
        b=LkqV5PM0XKwBYPLDGg+BXoglMsOyVKq9jAIX2JTujOq4GVdp5hL9nsVOptGmYUl2+P
         7+02uqnLYVcfZesqjWxv/gl/CwIHeUF3FYUlO8AUoNWjsIiu+UP2cefMZ46THsnZJjpi
         2PFMiXKxVEqPbQFevClbRMCvagDZDX1fL0YmQf8oqeo8PWEQ2wpI9eCJFyhR+7JrfvpD
         utN69cCdYVFMuRkBnrn9HaMCHj9/2NURMQ7TKf/XuVck22Qy7hGDyIk2LoBVFuBW67TG
         emV4H41QoSntH5zwT8MMV+qvwr5NcAUzlbLkw9yzCcs2Nd1niEUtXQvYi2dFJTeaY1h2
         P1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569967; x=1776174767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3u+B1dxGddFJGWsqIxZYs8PEcwoR//wfk2Adfj8h3o=;
        b=nIkW4L09hM3Jq41fhLM1h+JaK74sEJV7MS69+kYeKPNmjr9JldCnSdp2f38z098Ha+
         LSug5ch322QV4CHNS/HFJx1UYKGQlI3mIN5THIPGWLaTcmH04OH3HrJpvTy011WDBLgC
         5V4VlkZgCffLxfWHp76KS9vJ0qJ72O3HEtu5CJUjhOpmnqV2hmn6PFcivhfrjrXXJBKp
         4EjzMx0JfsrVKY8aZzlM+z7vFxj9X6sdrWNfdxK6Bul6KDOhiB4HyrW61Ma4a3zmeWtv
         sRqJpxPdmkQ0Zwd7OLw6QGO2t/Ivuy3xZJ7Q9XicsvTilquNHrgafSpEOFuqM8Mdc0km
         zr0g==
X-Forwarded-Encrypted: i=1; AJvYcCUUuKscmqM+atgCTajKlboHwriEBM4/tSMKX3HYlabqlPo9GifWVe441m9dtZJzkXSYX6qyWMZeb64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnVDyW7l5JR9GIrRmTH5sZU2npONGlV21COtMTJsFqJgvZyg6
	VMjvw14EdBh2m7yUA85RDpXuZrKDVUeYbEGwxslpnsvcC2VI0Caix/Vw
X-Gm-Gg: AeBDiesEFK2Kx+gXRv6CAM86nsb8wt82fgn0NfCYhpFurV4kdebh1E92Z2+62QCGSqU
	ZdHVdTyIv3AlqiUaNJHF+sx7zCfzls4Hli3b42QU3RVF2kZETDL3O7Ek3OlrpOCTUn4Vcd14RER
	76v7ShwfNKZW9vXsNk2R8FRLgbOhZaSzWwgpVnAVs5LWFMGRuhZfwar9KEUjjQS9KHMoKmQqBLs
	xEvPKTy4y68wQtiraZps2fUlUkNSgwIxWuL25anqBA/yBYedJayes+SE+OjWvVFQcxBYHhTr2Gk
	dBn6b8HuwZFBUXD0+Dhxgs8VUplfr0F34/Y+pJfysxCUUf8sJMmiu8dNATjw/cEWfoACqol982J
	R+kCK5kCAYwTNFbCLllG2unmWTw9zHmw6eM7ncEuDMgAG20hr8wIWnLzzx9lg49vrY1Td4RcyAd
	ONjtYJdcK8WSJwWKC8BYr3fh03IsYLY3GPQwf4
X-Received: by 2002:a17:90b:58f0:b0:35b:9ab6:1d4b with SMTP id 98e67ed59e1d1-35de68f2cbemr16231788a91.20.1775569967421;
        Tue, 07 Apr 2026 06:52:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4959127a91.12.2026.04.07.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:52:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Apr 2026 06:52:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Sergio Melas <sergiomelas@gmail.com>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) various markup improvements
Message-ID: <7752cce3-3362-42c0-becd-96dbc7b17cab@roeck-us.net>
References: <20260407052317.2097791-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407052317.2097791-1-rdunlap@infradead.org>

On Mon, Apr 06, 2026 at 10:23:17PM -0700, Randy Dunlap wrote:
> There are several places in yogafan.rst where it appears that lines
> are meant to be presented on their own but instead they are strung
> together due to the lack of markups. Fix these issues by:
> 
> - using bullets where needed
> - indenting continuation lines of bulleted items
> - using a table where appropriate
> - using a literal block where appropriate
> 
> Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
