Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5E1A9FB5
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441207; cv=none; b=ahDCz3+6KaNhuLONVmKpt1DRBg/f+f6i7eOyKbsBan6SvUhKFesUDm35Z9SuAiQdvmDZA1eegn8XpgtVtvZd9E5y9x4T3+6UG1AfNbDsdDyAlHnzo1P+DmHCCoy96ZysZi+1/HTSRu1vVXNJD9/WeMMndjPy2TE528rA3TYZrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441207; c=relaxed/simple;
	bh=QZyjVm+9qlTscaf/2GM3pYF3vTllD4oGUQoj5iijRD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEi/3pOK7SCB91s/P6GiTiUJXonFEh0lN5Lb2nkfcmCUyMCDndkyM21yFT/431u6U1QmsNeT4y0je2OExmQE+vB1G/Q77g1g65IlY1zbJLvXAAQdVc80zda2xtKekR9QXpOPUcSaR6WJ8zO0+wVL4nD3vurkBfKc074ZAVxXvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7lplOoU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7lplOoU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78115430134so1127895b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441206; x=1760046006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzvSx/NUfO5A/sP8Sid74JR7vLvHKqFXwTADDrDwvwI=;
        b=B7lplOoU32NtZnBaEcAoUDF7zee/6T7oDovCbzrgfIf+jFb/adJ5olMT9BTv8dO4Q7
         7+ZjsnEtQcdo+5nCblClYC4eaDBXfLIWqtMtkREa1T6WPuHcwitFgWKu7BQ6eNBaGEso
         goXogGxuv4pxjcCI5vBK9gqduy6bkiIFAWw19ClYLUnfBJ+lsVYBYRi644jOV37VOvOC
         NOxYG6ZU5a3WKaR7s2FETmKUvaCBoEeL0juweza6J/hiXRR4KIl1Z6quWy6C7sEsm6d2
         UZgjBiGfmr9C0i23givvd2PNfa+f0zwUxeTSBad5IJfQdGhKuinX1QYDgryvbb517z2u
         aWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441206; x=1760046006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzvSx/NUfO5A/sP8Sid74JR7vLvHKqFXwTADDrDwvwI=;
        b=cqb5mPZmNJCBKD+fEWE5RGU6EaAy57HNebmLHGCRCFrYPE4xOwZND4wWKGXzX7TMzL
         IwD4bTYPoyTNArG37wyoIIEKeCcnkJ/kvgay9hagpPtkhL0bGskWNzD9S0kN0NUWGVLR
         64v2w3Q/hl+UvbCwNIw/q0kWHCumJrIytCHbggNeMlAY8IMZgIj420HbwaKMB3CJGpsI
         fztkyQFVGrws7u3bZhta92t4tSFRDGez1MO6ZAWhyvJxnI7DQRpFKZIJS7o9WTspc3R1
         iY0H1rfJRs2+IRjVEwGbunjmCU0nMvOQH030qBjps3S7cUd0boF6S242ZSUUxP2OoqLF
         CdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0mehdleEOetjWBfPCTsbejFOtR+2pQg2swx6v8PNAl9LRMSOhq0dXE9yvzcx4oUJOPzXmQqsO4gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpZn2u8Db0rsnxKt2qLNhhGmbdn8s5k8id5jEY9sbQVI9IAt7
	BbhO1EXUDbo3E/BvQEJ0UuRqsBrVscmOjf/8AornqIP7bogPyxkNZN5V
X-Gm-Gg: ASbGncuKNBy/F99uR/3sLh/VDwnLqCpOQq8ffajRx7C7TzN8iXCu8J7BOCbBWnbKfQW
	zKe3D4wAVE8Ms7PRrHudFLbb25OD2SOED9ipe3NEjhzbPQtXvthdqyABkei2sNVLoEQ/mRCyhxL
	kobB7UFF0+MV0QhK2h1EEA1tngrgriqUtmMXhQBftCq8FzxK4fVRqLKYsPA/ptDegxzlKdBovSZ
	SzoJET/eAHNVBMS6dgq3FkAEM7HPUtuMsCDT/1V8iHq4PV1sStYM/m21MNEGRidgjj0ovP3LWIk
	ya6T9/nLN+QpOh/J17gEDxDOGrF8jp8GFSzC15pFBTbMKJS+xz4CuCWIOpxQruxnlbeabVHVXOS
	7K40LbNrykCRwYjIUzzqhA+91LruZSPw/YvXhc9qjd6K9CcsuF8SVpB5S9dA=
X-Google-Smtp-Source: AGHT+IGk4gvP/gENOkVT6kjl47nctt4XhJQnUfoV6K+YzmVcO1xaHw+ws/N6KwZw6NEFY3MPioctVg==
X-Received: by 2002:a05:6a00:3d16:b0:77e:7302:dbe7 with SMTP id d2e1a72fcca58-78c98cc299fmr1139185b3a.27.1759441205632;
        Thu, 02 Oct 2025 14:40:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b77sm3004309b3a.43.2025.10.02.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:40:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:40:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max34440): add support adpm12200
Message-ID: <c6ec8937-91ae-4e0b-a0dd-183c5b150b2e@roeck-us.net>
References: <20251001-hwmon-next-v1-0-f8ca6a648203@analog.com>
 <20251001-hwmon-next-v1-2-f8ca6a648203@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-hwmon-next-v1-2-f8ca6a648203@analog.com>

On Wed, Oct 01, 2025 at 08:37:08AM +0800, Alexis Czezar Torreno wrote:
> ADPM12200 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2000W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied to hwmon-next.

Thanks,
Guenter
