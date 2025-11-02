Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2DF2C859
	for <linux-doc@vger.kernel.org>; Sun,  2 Nov 2025 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110262; cv=none; b=VDBIC3XlV3K8zBZSwz/pwJxkGEdHzZuuyZxaCp/hPjWBSZ7gd7SOebzCxmrsw+OrntrNpV/Os2cF5K55Wo5PgGBuECywJ2jyYCiVbYsd9Mg5jVX1xeWIHWgDGhi+sLTh3NumXqe9H9nOm8lHiU2evDipMwNJxa3FWPIocbLeaR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110262; c=relaxed/simple;
	bh=dOs4gbMporl3UZegOSJ19pjsXgAASYDpHErFCO/+SmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFYHqxNjMgoYH09mF3OeW8S8r0b6aOpWAj3m4OXsSXG/0H1SCDCb+VMWRW62ThZT7t1CuG4JzhAa0JBc2JQhaa5M6lpZb7ssEqkKF628IE+P5cuKtRC6T3IXXKCv0jR0iJ2xJesT/+0l1qbA7FqbFCHHjiyDAi/pdG6NFnAdc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTgFnqAn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTgFnqAn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aace33b75bso341274b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110260; x=1762715060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bEBvdKdcxlFX6ebzJy0mu/otoDYrSmrnQYrDh7FFC4=;
        b=HTgFnqAncVjVs6lSmEALM1+/VUzNFbxXQfdjfbVPq6JsQWxDFBPPWUj4f08MnQe7vt
         5aQUVjDGohvPIIra4fhdKlPd+iFvyD+AmBVopIliShP9tmw+07LCo8eCWhON/AlfBSde
         GTHLpOPqToHQEuHfrSPuAPPBCVr68yMOdVPhStEpWAsmnrOJ4DwSLhBW1/aSJl1EF8lB
         0KJ09NUWZuisv69mbYsWSG0mI6W77mJYRcP/t1mSo6NFba6v/am8PpJ+AdY5ToJNUP7C
         2bWHofTULE//fKgdyxHLjYZO5e8c5IMvInYjXx+IKbUWsa5KkcX54wyLc3ZCgNsv+Gan
         c+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110260; x=1762715060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bEBvdKdcxlFX6ebzJy0mu/otoDYrSmrnQYrDh7FFC4=;
        b=K8R8b8jkcoFIs2PreVp1OhjSEaJeO1sU7px1MpO7AIo6jehAEEerM6fO2L5liJ6giQ
         HdJID750vwYycHvKv3IplVKsyh6D7osZGteE23lHeQV1cg9DaDEkbkKwOWYS3xj68DKh
         OnT3nIckzCxOMyM3afrDFTRofPQVzr2Plkpx+kBX2RH/5kmXB8PnQTNP6xtPHVwpDFBO
         zdiDYpqnkhwv6CTd+0hcEd+4t5nIyXqx2Ev1Iff71/aLk8P53ZTwOkijYQOg+McnRh7A
         gXdf5cg1OeRT1zuhovcqEyOPU2XBV9AAEZZop8JGSQMk7zmVrdxNifS9mirJN0nLDJkh
         t7lg==
X-Forwarded-Encrypted: i=1; AJvYcCVy+w9gOwZUq2S9yd5dySMVJkclMi5PfOQJ9Ujlkvzo9vbrHvgmy3h4QByD5lgYohj2W5XAXtdF5LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWNG0pgs6c7WQCjGXavFpvgBNYVnWElDU99GKq+54cpaXR5qdP
	DM1y3t+qkfpqL0izSwV2Lckm/r9+s5CVTZW5ZS/UEngBEAcBZ/mwVxTd9nevtw==
X-Gm-Gg: ASbGncvQYgoSbiyhhyUuEouspPTH6o5tojwrSY+kXqmB+7mLMkRWaTtwtO52PiHCvt5
	dnNBHViX5BnMtYwVUd2Vm++p21xR1WFVn8rYDPYmtyr/fRdHbhPqwuRg7Q2KYbol5Xgpg2x+w4q
	k74dTjIKQX4pA4ZSeBIKSQuYhcP/jGT/5oRveYpDuXcRbwDHrG0zrhaQE8DksipPqCU6HZlC7fA
	jK71AgQmNo/kw7S/YQkwo8eylw2Z3bD6CVrjVqXrX1NLU/MB1/nOkRqMpwiqMzdz7AC5EIeYK24
	5PetKFZcdz3zIkNZ/DTB7vvJZgoaLXMxE2srOmpe2IGEER5hraLCjhtITpbQjKu5lF1Ii5qP9Cb
	WRls3rYFWjG7VJOCd0VysgBIsBfaPnVYZ/8blyJBzFhbqWBXBpHVSlOR8jiAtzOGdNVo0mMk3n2
	CgfCUV2Cj6FEc3FNJYugqHNsE=
X-Google-Smtp-Source: AGHT+IHBepnSh/nJMIs+AM56HkBo2+XztwsCngVj9gWh9ekQI9mRoHgowgr7zRoiZ6RUf6OT40Hilw==
X-Received: by 2002:a05:6a21:99aa:b0:2e5:655c:7f93 with SMTP id adf61e73a8af0-348cbeaae49mr13919906637.33.1762110260311;
        Sun, 02 Nov 2025 11:04:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b99801b0e6csm2864275a12.24.2025.11.02.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:04:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:04:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X870-F GAMING WIFI
Message-ID: <daa6640b-9044-4586-a981-13eea7fbcd3e@roeck-us.net>
References: <20251102114038.283396-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102114038.283396-1-eugene.shalygin@gmail.com>

On Sun, Nov 02, 2025 at 12:40:28PM +0100, Eugene Shalygin wrote:
> Add support for the ROG STRIX X870-F GAMING WIFI board.
> Testing done by the board owner [1].
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
