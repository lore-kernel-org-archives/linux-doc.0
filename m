Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4E3E16B7
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934575; cv=none; b=buSbST4zdb2dOssH7rTLqmzzPkrWP4/k1Pgz1XNGHsYM6JIfCxHXRyg50OWFjR1Rfkk1UbGihCPjF5Hdkm7vTq7RxY9dP+6un40mNP/nv+5tcrAvIcrkLDi38aDUKsxXrTSXn5pJuohrqtoGizq6CW3+Uqi35vS+7acKipzV8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934575; c=relaxed/simple;
	bh=1rX+FKhKupeqz5h2OPMmrXiIUNApyN55JDPyZD51/sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJTzp4z7SYxS87nTeZuiPjF1HIWIwXlB206sKZWwtY3uHYgeYb9zi52teVmyQaDAicTLvjwppiDb/F1gok7hReryEMmwRvNYu6QBJ4oPo6o3AEfVIj04jm9sxBMJhU1EmLg27CmpFaYFXa5lwmF22gbVnXDuQ2avJsGpwR3BpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4iXEQ9l; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4iXEQ9l"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-132830d8281so3508972c88.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778934573; x=1779539373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=503Th2kxYcv3cJvOPkWJW0XIgs4g5oDkF5q5qp/92ac=;
        b=T4iXEQ9ls+0Ib6Csae8zTFs6wB1r2LuDLGe2OouFl4Syrhxk4rGKTSS0qPQL8dkv4o
         mu78T+mR1U6KKHY//iwbFkJIUFufJBYqpjWuFSW7HZ+H2ocR12hKg5ogcS9TREKzki4k
         gyZaq8PRUNE8ycztWy7wVKpQ5tsx3Klld2o2nuvdBFlak21CGbDQB5D3FRBTSeJ6jc3s
         L8NGrTnHcm43HrNNmnl2s9+WfYo66ZmhFuyoDNnGqyVWcmvHtMjauPO6avxL/9z7fE4+
         X608qDaxVtYSdCLPFfXDbWtgPDMhO0vcWQLgsxed7fkM0ADHS1dZ6Q6MWQ+1pkHebLZZ
         pmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934574; x=1779539374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=503Th2kxYcv3cJvOPkWJW0XIgs4g5oDkF5q5qp/92ac=;
        b=a7T8Pz5BgT/zmS7VavjkIXD1fo4grM6JtZUNX8SS/4kK/TM81AQdLQbQzHecofxLN4
         VpwXxKSkqeHpKmP+a45rQUSkC1VzTAsz6SHz13XAOL7j29E2BxWFf1a7qW1a6eBJWOMM
         yt1JJRAE6IwVWlJTbHcK5V/JuM+Hg0LjyWjQOSpxBjXBQdSUDkreJuZA93+Zi3/XcQ9K
         g+Rx7p9iXN7FIkrp5HeEZwW6asktahCCA3ZKAZUiaoFAW6eMd7S+NQQ2Aglf2FE9srH/
         0gONuY5onguHFkc2I9vpbzAJBODcMHREETRYZlON2ZqI9CBxoQOvhCisiBD44EhR8Cmh
         J2GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kGQXtvhd5xniQZ4cYvT2AUGxwT9wsh/YHgY+x1vmqGV6fqHQ87SwhrGYPryTmnhZUn0LLb+QtxAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzio/FAYXTKDsqIT5N7XrJ1RakqhJTniIHwdoRDiE+RXFhG1Ve9
	ypgyRepWxwjePb5eyF2KrorhjnUmyVChHizibbIImhQDI+ykGQ44rV7E
X-Gm-Gg: Acq92OFEzs351pMM73gamdLh8cGuj2rEGaN7lApgNpLa5BgNkFd9lxU24ZuUUJkE0dZ
	bHh4A25XClXO4g+CItMxstdnb1SA+p6ylrm1GaXk4CwH/FNU/Qv5moc5oEVbYjMb1btfwY2dqwz
	gtUPTHd4/cw2aAEbUS7W4nIWgVkNKc5wIjuy6J7iDQRk+tCMpMMHfVJlG9AeTS6LcWVZQQ4Zntg
	KgMjOguf5xfv20Et1wczzK2MvbcZH2Vqfv9E2KZO65PFaMBTKQ7e5WcqvZLl/12terBQrzRGng4
	yztxNJAevL0DS3wJ6ovlPcRyjuhX1W51naqfC6gn/olxbK2rvBQd1t60O36Q0myCNoV1/u8tO0A
	VCo36cABcB/HqjoDNgOOEvvhYAKzfxIdVbfmbiDfW7C+BbKAVwirStteQ0FJeZGW3co8jKhvm0y
	a3Yjl5XwrilotbyjRjew4Qqv+KZGheGczQorap
X-Received: by 2002:a05:7022:688d:b0:128:d4be:7438 with SMTP id a92af1059eb24-1350552c64cmr3517301c88.30.1778934573614;
        Sat, 16 May 2026 05:29:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm14539548c88.11.2026.05.16.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:29:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:29:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hassan Maazu <maazudev@proton.me>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] Documentation: fix typo in heading for max31730
Message-ID: <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>

On Sat, May 16, 2026 at 06:00:01AM +0000, Hassan Maazu wrote:
> Wrong device name used in heading.
> 

That is not a proper commit description.

> Signed-off-by: Hassan Maazu <maazudev@proton.me>

... and you dropped an Acked-by:.

Guenter

> ---
>  Documentation/hwmon/max31730.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --
> 2.54.0
> 
> diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max31730.rst
> index 1c5a32b64187..0936ba2eac24 100644
> --- a/Documentation/hwmon/max31730.rst
> +++ b/Documentation/hwmon/max31730.rst
> @@ -1,4 +1,4 @@
> -Kernel driver max31790
> +Kernel driver max31730
>  ======================
> 
>  Supported chips:
