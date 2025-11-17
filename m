Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABEA25333F
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405102; cv=none; b=VGs+0N/dnZrzWn5iTZHpfr0DqwDjic/YguyU/YZD5SMBoAKI143fgaGzpRJoRe/c/osSkYq2tvLFJPYylpR7iAcnd1aAdJuf51REPYp9Z4/gO7ez7Mog8lMDB4WXl0ndBLcDcL592q+t3+sQAWQGjRSdhX8gLHmxT7dcEyczXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405102; c=relaxed/simple;
	bh=hAi+lAeCBat0jDK/dx9mOVuVIoBkzbW2jrUtEFrxD7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW7eNs/Dr7+DSsq4+WWmMn8DOkCzad+siVfqRfefaxehH1PKaPVwte+9Bsk6wi0eFNT+nvTDjv8dDbLFApH3O54ntqzHk4ryShDARfn1W4foujEykDe2NYfbhAXMNknUveFGTCEbgYXa3bTPxK0X7nycXU4K0KxpnikVGKSFHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiBk9HCn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiBk9HCn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5186818b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763405100; x=1764009900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66CqLzIZKKTr9jd9KPhG4EFQybLJIMny/rbtdLS1jIo=;
        b=DiBk9HCnQbBLY7g8qFYPPSUJVX+bLHzPb40MItdfcAcAh3R4UwgAKk2V1sWwRVh8zz
         En1CoNrL38/nn1n995Q8Wwv4dP1qoWX7el/wB6plYjpq3g6/S3rSMir1PE1LODYEPKdx
         QpiGRyplj0/lTX6qwIAfQ44y5QL8l4wSnc6igEEt2oRX9kbh776gZwf96jjpYQroT7lU
         3ZVer5siwnIPsbSCCm58mcxszZwULqUO5wlcNz0hr2CWk9ynRbaZk8qewMJKvN1X8xW6
         01fFyDDGUESLFq0KuQWdfeONy+cqRodNUBZ1mimCOSuyE7UE6T5g0k76pLilUY616RyQ
         S6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405100; x=1764009900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66CqLzIZKKTr9jd9KPhG4EFQybLJIMny/rbtdLS1jIo=;
        b=n6vVWr90oR/rvje129W2IzCek+GFbGOgIh2DiSrEWR6JIj/DU1SNT+bTLfTt7d1Tk3
         MrFaVOOrzqkwrWdkOkNglRBFuj2zWHpC9uKvd5jD+ZfZeeFjABo4QKw/nhaRCwqa/JZn
         hc9wyx8v/r5gEpAq2zaOig5lW6ByrAF3DyeDTjPmHg/YysPIYpJZPhs+raSUZJxZS3ZS
         cFNleTT7olrgIj2ZQfG1IEJ20x20FBnStqd4Zx3CuXSuT32D6YID5/mC03B3IRwTQ25q
         umH+iamWsRvXUket5eB9i9yu5xY+9l26eOq8CIWS+Q0tQiZznzeSKEovga752QhKQygJ
         HmDg==
X-Forwarded-Encrypted: i=1; AJvYcCV6aTP32DFehrWrxqUcBTOXrd18H28Gb3Cv8IUiNRPrMPTQfNn1Vg21H4EytSFtssxH3RMANA83XyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3C6FNkJvzTBJa+vrLQzzPdQdIyJUI2zGyc+kR3mQ5sOeu7Be
	w5xbuqY7RoZLGuERk3cYakMZpDh8Pc9DnVIVWpeyBOK4ZqqctT7XKCgj
X-Gm-Gg: ASbGncvB+za2j6GN57RGRu5gSWlEOfHIMI1FFq5AfeSd1MAeVr6I4oLeEHygc5j4JeT
	g+pHyHaH6vq2nXEvj3BZy1PsFCWxm25afq4tBuQ09ZYN+nm+a09wMuq3mEG6xWVYdmjSVBgUAew
	mjoUnExggeqSawJcTRVDpkyVQOTPgBXuRRYpFK/HelV5RTChg9T297RXisFdIiWTts+dYpXXecF
	m+x4A7t5w42lGgh6xcnuMschYLAxZBTqvaDXaa4XKMbPSUZULbZSvTseVkbAH0oV3gG8BWFOB8c
	gCNC02VSre20QdrIWgBImw8VbJ0z1s0JRIAB2iOl+W3c83gIvg7qfIw17epGp4wf/0Pof3IWqw9
	EVztbQrZLCAnAmeYIObAqsTHEE546jUuJDH/621BTzA6kqQ3v4J5POgun8xKB82Yt4p5Uu76l0J
	Em4gUDFmyvvigN
X-Google-Smtp-Source: AGHT+IFxntdZk8l+drXp0KlOPVi8KM94l3CKdRhaImzgVlDL0y6X2WUiCZdBdC2xqt39Ly+bciduNg==
X-Received: by 2002:a05:7022:ff48:b0:119:e569:fbb3 with SMTP id a92af1059eb24-11b41202561mr8666793c88.34.1763405099907;
        Mon, 17 Nov 2025 10:44:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm34401377c88.9.2025.11.17.10.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:44:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 10:44:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/hwmon: Fix broken datasheet links for
 zl6100
Message-ID: <7f2d0d77-5335-4639-8db9-7982eeeb5bf9@roeck-us.net>
References: <20251115182908.1357793-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115182908.1357793-1-igor@reznichenko.net>

On Sat, Nov 15, 2025 at 10:29:08AM -0800, Igor Reznichenko wrote:
> Some of the datasheet links contained .pdf suffix which resulted in 404.
> This patch updates the links to the correct URLs on Renesas website.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Applied.

Thanks,
Guenter
