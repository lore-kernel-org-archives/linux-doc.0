Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010A24C06A
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471376; cv=none; b=c33bboLhAa0vrw46cDtYoQH/S8KGvDwKdRyq+jGp/fbL01gcWr6bPsB9yt/AMx6b+Pt7P5/c294jD6USKPXN7KfzM0XyY3Bw4GqvTwdwyyIhondG9bAzNv7MOAkAe6Z4eQ+5qIqWkhahNMN6R9SAKGGLIKiCtN8ijXDYGZ4dppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471376; c=relaxed/simple;
	bh=J1SwDtO6RWLeo7EwdiHCifQe9EbJky+5upvJpx6VUXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfc/4NzqLBren8/T0qi0FNQvlJh5w7hX+yaao3yjmUq81VjfKvyYT4Vt1/89dpquokGdbWFYFqY675mSIjQ65dfPG5yHs24QHRTPFrOOpl60HYgMsokge+21Uz3sqepbHTbX/KfcjhIqYZH34OFU0KMADjegTWslIelWgmhjQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEx17fPT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEx17fPT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad4170e8eso124598935ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471375; x=1785076175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=eEx17fPT9cd4W14v1df6AFC+HIT3b/jsH53ujNLA4I4Dox2yf3eXugX69h4BelabBB
         akCW+jlHZQksbifPUgj4FFq2aP5osTr7ydOp7z833Q1IkfZDmqVwTnnSpafKkZgXEGOf
         v6k4uHV5kht9kyUFh9OkK9q0yTdw8OZSlw4UrlgVoTjXJ8iagSCUvPsazv/LcKzScs+X
         9p0+vJHCRkw4mTxrauE5uwYL1dXZYm8Yd7EmmvPH5rW6q/1A64tom9oS68/TmP5pCmUM
         8iaWFTszfhFLkQGS/GhBdnxOQH08brTvNT2Kg3UmBe3Ndbzv+OmZHBCAzZQwV02IEZAe
         fyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471375; x=1785076175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=l06dUjs2VRC//EDvXVNAqjTvlgXTCA9plESV1QY2lyBX46ZUG9X05LLWoshMBFuAsY
         8ih9xC5ckjCzK+eLfNm3oVIN3R0xC/w5hywnWFXd61lRKslnFs5U06ilwfOZqskuwOq2
         3EbpQOo8p3SkKrIG9PF+LAjVcTVy+ebEKIqbnSkba5yHGF2WdCdwpGnQ+m2QHhQ8AMPo
         SN0jGw+5gV3hhn3LMxEGbiMkFLYbmsdqlVwfuSaYUDNuswO6XOo8BaNwpBgIeZA4IQpR
         ezIuum4fOaPLilUKwB3dwVnLlgmd4Lz8E++bm1JyChk2iPRVe1+s04TwqcOMThrMu8Tv
         Kzvw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+gjlI/nS4aalfd9fTswFi/vA1tWDkbxMn7NXKQ89urGrDXdd4tPN0yE1rzsxKlQWbyO7Qy8wEzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNE7GQSBAE4Nni9iTVZKDZcbFKoXVxIfiHLQJAFsON4ybCnHgN
	9NgClvdp7UeDjQ0PbRKDIxWKEuPIrRoewReikjGYZOLGZiKyEqqt9R9+
X-Gm-Gg: AfdE7ckIwitn1sfrkZdEeGVcgvXfNn3EvmLCixO4Dz+ERhEArr0I3gDatNojlV7xXo0
	h5W+GOnFlTc7hFdm/HDhTu35JamHs40Flh7qvJ/aQswmkOqO4fRKyrMn610WzyyTR3ycwrciYk0
	tsmX/dVhLIi7an6zu7H7u4wL6EVIEJ3eenk8WZTjx5vew/CYqgeCo43ETQlM8FDUwZX6zdZ1jcs
	r/mzmZueUKpEQF5WifByFcLrmbyeugvZwhF4KqCxSX4uOQEFm4k0gccQDE0rTMO6KsgwPsFPOBm
	3e/TljNsl4zYRVNtRQjBvThD4QluKrcvj60Ov0+r7f98cJIFkHg0fzF/dzTR7dXqLbFXR6WNveJ
	FMnQ9V3aNq621b+9zByYRCl4UAzEbSu5JffDvRPRzkCVk8belGAckiBy8Vp7sZY1zc8zuYgzsAf
	F2K9NjcsI1iry445FYFtqubpHg/A==
X-Received: by 2002:a17:902:ef49:b0:2ce:9b49:d4a0 with SMTP id d9443c01a7336-2cf34994db6mr117887555ad.35.1784471374913;
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a6308sm40918175ad.82.2026.07.19.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:29:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MPQ82D00 driver
Message-ID: <f1b1f66e-84cc-49bc-a3f7-19a85ce378eb@roeck-us.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
 <20260704081952.1701914-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-2-wenswang@yeah.net>

On Sat, Jul 04, 2026 at 04:19:52PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mpq82d00 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
