Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE594446EE
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911918; cv=none; b=eFmgZ4FqSzUsEiu1+eLRjkw0jg1S7E6c7kGJIYTTgeijWUxSDqKhaPsw0eARcaUTOUCChP53JcvsprB2DSinV4Yd3g+/r1NB/3qtWygf7e06qSnYo/iXUBdT23ftWd0+Prm3/LrxgM2NS1QyKVxJNDEJiVY7C8MzlOwPTcWxxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911918; c=relaxed/simple;
	bh=t8Ji/sVdLJdsE072Vnuy/Ml12Q6VvXWCvIgrXAbVoaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8VbhD8Dh5yHID6NYrjT7d9SHqfjOQh1q+tSESsq422eU4btpLkFjDvO3YTnXGlOehzX3O4p/w6pAidFMihx13blBSj33OjkyWY8u/XaQWyDydqxzxfldSyvmQ9611TFPhcMEUA4MO1m/z0DK5ZKOA7kor9wd3pSb5gFcsdnSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCU2ThHw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCU2ThHw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso817492b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911916; x=1785516716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=oCU2ThHwYL/MkTUbAn6KHIkbjPvEClzn2q+6b5rondZn90LD5tLrml8dFyPVl4TcPG
         HG+jGN/fFyztDOtiEzMSHYtiKyosax43c7b5qwPFiuTg4bh5wMYgrE+rmcZXPl/6+ijy
         qjsLC3g1xoRKz8xm2rwb8QJyZbNc5YpGxrOZmwjutnahPvFaThWPv4eQnesPeLvcYQAz
         /bQsUeKs4Vrrfio8qHgq8xKN+l4cZ7fM8z+huwg8MxA3sKhZx23qC8ao5/aKsLodyJHz
         02mYSy5bTZIrAYoxAWMKhbAvXTo57a/dTl2YgylY/gouoOfo0tIf9L9L53MVPgfBuXYn
         vZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911916; x=1785516716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=nCNKvipzBDTQeWx8QZOeP0R8yLR/GeFwTsgMnWttoKx9BmstC/B3S4Gv4dE3S5xWxg
         dFOYf0gTKc8lhhGDay1QkdaYRb6Z9J50knGHvQUTxMmvGr7rGHTZ3cWr1ZUbJaWTcNlJ
         GMn0RfydNayG4GDGH6vA3oouE3eJGPgx86WeUBBlr41zd9ZtAb8dCgVAUIIY7QXSX+QG
         yK9hiUGufDAWs6Gd/GaCjxe987TR+V2R9fdsFHgykwwNb3H1Cyv6qCWYNrVvr1ewk0DH
         g7jN1UJgh7n/t16G1L9iERra6g7YnsoHGbFuBbPatiej8eQyCJFNkieLEXnEovr3n7lk
         HArw==
X-Forwarded-Encrypted: i=1; AHgh+RqJ+qBUolmgyawU0Nyb+Xbct3hiT1GaCMk6KrCwXHtirpjYOp6ZJz57W0fvRHtl9O7ZM+nEc4RY6vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHpc9B9QfOR/IToXaXxC2ZZNsQzlp/bYKb/j1exDGI6egAD84t
	AGIlnaPMdpUswn6QDozoQm0dj95S1TzelfNqWvAJJ4uS3HDo26cgWElz
X-Gm-Gg: AR+sD11JYQqz05TJJVmyrsXkZU2oLyN9l66d445wpsEYbxH2M7z4Pns82PTChazJ2Zf
	tLc/Ujj72apmyW6fmAU6nrjpDRPG+/rmo2y0MMJ8SucZGIEJOI4qiC9eqvmaPr9f6AUpWXlNv+H
	WCw6MHqluFumNqJzmDyeHbcUMzBJSMx6SD04widTuG51qX0Op3LfFh2BLzjEMpuwXsOeVCvEXuf
	tqV3/QIOXps3/o6znK5+ILiecCw+WTI061v1/dpdpX3td+l5uAHonUodeT0hVGSpraW/1ktAJfO
	ndkr7Nz1iUCUWpYhRxlUT5u4TTkyVBde9+xWykq0DLTf6KhCFt6gKwB4+a7UJJ5b3+tJ9tY8/Ks
	EzDs8gZiIH0DkwSAHvPRud61pvLlqe8il3vpIu7nRDmD0IDchf9Wr3ic/yY3zhTSCpaHo5mJUp2
	K70W8liJNBde+pF9E=
X-Received: by 2002:a05:6a00:b93:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-84e2bbfc88dmr8648923b3a.63.1784911916103;
        Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341e69esm165061b3a.43.2026.07.24.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:51:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:51:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <2b71e6e3-d831-4d56-92c6-a4de72d7a3a3@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

(waiting for DT patch review)

Thanks,
Guenter
