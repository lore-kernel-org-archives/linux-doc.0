Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF42F745E
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971775; cv=none; b=giPLEvpYQBJxlDYjxj4CUmUK+zsc+wOTqyr6qcEjX/3tSN1bEWpk0yTj6baQxehvKhGRm3YLZBQoisLXB53bPCLNJ4zSlHIMj3bVVyZ7B7NGNQYTJEodeYVjFW/6hXsTp+5Z/V/W1lP0C7jlED2L7HPM6K0g8AUx9fE8SgyDm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971775; c=relaxed/simple;
	bh=Av7zdXtF5p+HCOVJjCyLfUZtlenj5pfNAd3NkcXK6dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul9RSpT6AMVIemCPlDMLLtuHXLHVsmBwq0Yf0i4l0fL7EFjGNTt7E7PJxLzZZiBB0jdsGi0usyCRnB/xgKkZFFARNNCXOuwJu+zxHk319xzZqx7nAJnlBjdD4SzI5tuaLQbKyGtQu+c8GWbKa9FwIkjjNZ2nuUMlBTKHBxaBw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmVxudE9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmVxudE9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b941cd869cso5938785ad.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971774; x=1779576574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFDwTIfJFm85RBJSX/LdGicgX3hVihekpmSwBzvMduI=;
        b=WmVxudE9ZG/YYx89tkEPrhRHhJ3ArWY9ZJ7x8Fb1Cai593Wkxbh7kSKNHgLcgmWeil
         KfDpI+YdhbHVJdWjApl3oow5WPWmRaNXxrWKKPHpwifqn/LhCxpuRpWEi/41KVuhOZMD
         3xcBqFKikCCPjh4ys21wfzlTV8uggxYEbZU3DBMzFPMxgV4ejk25LY/tSuGveYcNCQQd
         BoW8vmnF6+jN6UEywBvJLdD7bsi5kw1qFfe/O9XXblD26pjpMInt4M9gx43gOY2i/LJd
         dC53sQOVdmUYq6zLfgmbuPk8+TnW8ICVY+SPs3weQ1Aa7Pf5b7C3tO6qQicfz9+z2gw8
         c+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971774; x=1779576574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KFDwTIfJFm85RBJSX/LdGicgX3hVihekpmSwBzvMduI=;
        b=pmqG4a0Js/4M0TXox6IKdrtLXskVERRGl60daW9vBGKxpRO+WZx96Uo/FFGdzPUi8r
         Fk9l2Hp0qqH4DtX5fNUagiMO4rV7zKXtFuh8bxIT04JOyD3JMbXswmAGyUEcoxmeaIlR
         lprZzB2gqnHs6dXjFF00Nr9Nhd4PdD2fFyKASFHFyLLopJNYIf6oulQ+kkx66hh/ZP1Y
         XS7W1yC0KsIcC98/NWP2rCHBfwVm5ysmuMG1moHhTVWHGZQhuk/xue4746Iq5How46GI
         BK/jWB2xSk0nyLAhkEf1asLhfYzyKGfr0HWfWhfHwOS0CNtrAqkGTxBRORmWrnAhfByl
         2N7w==
X-Forwarded-Encrypted: i=1; AFNElJ/wreApTitXYj7eb49WCd37Okxqw0tKjevErBHfQw6Vnjwr4/H2/AFrSaBHoEIojPDAPbOXZrBf8CY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pVrmvO62FmZj6vzfQee2Xci5jjp6YK9EJ/yNJVHKAVh71p8d
	ust+ISWAGX8mQbF5tGPFCi+jiSn57aDRkDWGQHvppG1VscryAKUU7YL0mYZx9H27
X-Gm-Gg: Acq92OEoebt4/5D9avoCcIAzHTkZ29GG2rK1v8aa/Jdf/tADsOGLZ0cpOGsmIzs87KA
	QQcxlkHepfCSqvIEW5n0eBb4WZVQ9kaPr0lgW+NcGVQgVqvb7ha+a1bCFoxZNCMxEgCHIN2hAkS
	bDdiXd3mDsZ7Ws8YmEwzA+2NEaok1BWXgFyNp6ivz5XNcLg+12Fmmt6tSolqyxb5bu+9Q84KIYf
	DuyQnPBgai1EM8RAFQaGrwshuKTTjNIW9ttF6HQ0YEMj62MbLbfzJe4rp3mQoWGJ9ER4NnLeTXg
	5sERrM9SNqlUxy4gsvkA+mKvijw2TXKDtr5h6RQpomMTOGCpv4dPwEZVbPXCekrwTwPeYyFqulr
	r1sjgvbPZ7eVN/cd/SrmvnTakiNnYNPFE1r7ucm4OeLTeW4VtOZY7qNxN4UeOXj8z/SIAwJbf68
	NL1xqWY8cyeQ0Eh1j8lBcJ8LA6PeHxIHUN2z0y
X-Received: by 2002:a17:902:f647:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2bd7e9e2622mr101161715ad.38.1778971773598;
        Sat, 16 May 2026 15:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b11sm77330475ad.18.2026.05.16.15.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:49:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 15:49:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hassan Maazu <maazudev@proton.me>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH RESEND 2] Documentation: hwmon: fix typo in heading for
 max31730
Message-ID: <4044c5d9-b0ac-4411-a669-ed0f876d5587@roeck-us.net>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
 <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
 <6-vpIVJnccYzmznZMj4zfXmOKnHhtaXdeyJqyqTm3KJwLIEj3iSiWzBVxHnBhkNZHZ8E3KfHn7pYQSt3xrfQOQeN5RCJNnBVwmgyJcaw_zM=@proton.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-vpIVJnccYzmznZMj4zfXmOKnHhtaXdeyJqyqTm3KJwLIEj3iSiWzBVxHnBhkNZHZ8E3KfHn7pYQSt3xrfQOQeN5RCJNnBVwmgyJcaw_zM=@proton.me>

On Sat, May 16, 2026 at 10:09:26PM +0000, Hassan Maazu wrote:
> Generated heading & link to driver doc for max31730 wrongly named
> max31790 under hwmon docs. This patch fixes typo so link to max31730
> is easily identifiable without confusion with max31790.
> 
> Signed-off-by: Hassan Maazu <maazudev@proton.me>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
