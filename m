Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB7E555
	for <linux-doc@vger.kernel.org>; Sun, 29 Dec 2024 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735446999; cv=none; b=pZ0Pw7wzsLilo+kVR24mqeVPNwZZt634Q6isz8/CrNOgvFLDOaaSAPU+Ec+rE6QiHJgjVles2wRJ1L8c98ai3SYEzQ9zT66ufPIJXw3xM31Gvky1ScR5mjEoc10ZV+lzaxeztdRpPSgvcP9/PYAuu4Vd7VXvcDbNy0zjR82dC44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735446999; c=relaxed/simple;
	bh=aAaZQqYeN3sjoM1eXfGHf+ajogSmodIMUH4IMJ+Y418=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkg7ndCbQEMTEtqcKEMS9YOjnyE0CiLOMgqlNhtS6/0oHfM1tlIEy0lRoaTUSKJyp/GT2Ky7L0eHtjMrpDgcM5AU6K0Od5brTQQGJ0pN2diNKXi84239QyAe1k6K02HTJ8LztqCZ/TK6Fnwebk/+fhCOoxcatuqVJVFsxeLoacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HP04pfGl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HP04pfGl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163bd70069so2066485ad.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Dec 2024 20:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735446998; x=1736051798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhoHuIrviDm79Rzafn1HMCTRe/3wZ+RwEGuu44Leo7Q=;
        b=HP04pfGlNByW4e0sZIAklzx8nKFBswHI/pfHumrJuJr9rXX4m/dbthS0NkMoJaUgAA
         mVIolMwbbMys9dqsUSZBWr8Ptvye3XhOsYU4ydibH6AWvUWCbmnd++ybY1unaA/L9Hmz
         k7umEDjXY/mVMFhQhox1SNtyq3FC5weRJ2Wno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735446998; x=1736051798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhoHuIrviDm79Rzafn1HMCTRe/3wZ+RwEGuu44Leo7Q=;
        b=iCdT8bg7DUhAToXTTEBUDkU87w5kTVAUeFRjSFVo8Ax0ZfAm5iEpjQJuiZTjwOgqJh
         bkGCLPYnimN+WCt7RrujwUUWJn9RBDp9rV617fvKBjxYKMyEv86A2bUhF+CEHrf2mNJN
         7Jv2xBQvn4MvMf2tG85j+S4u3rRntk84ms0Nx6+6qZ+8KzS9ZhUXMpGhwu7XqzQtt62F
         wT99Z4CLY80Y8sQnf+cIZO4cD3m2FcD8gJO/vf1zR0XzaTJGvEx5Ahb7ZUvhWEuvtd/w
         tyLRwJ9riQscPDdOEFgNNZU5DvEv5ructw3YRnjuRY2VPJ7OcP76PsY0IXJTQPmqcNBU
         l8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUub45HUKnGNVZimDvOnzV5RLAZtK+5g9Fe67LfTh2sodYvoZA1amJe75U3sTW7soOTknb/ibvwFWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmruAKS2q5in30ysLaksvGG6giCkcbid8p6nhSTr73Jb14lwzz
	FxNliBLuvwHHzhoJ4PA4Skng28NcdwpLpuWduePukFrPUJUcYRjfdbnSDnI0cg==
X-Gm-Gg: ASbGnctvQJNk7B2N7DcF9VpINawHpKmYlb42cTpzoavcmdOAy9VYWVyV2vA6mvOk0MU
	N4lD37Q6XWbABCJEB+JG5wx08ljiIu+xR5jtR1JRRR7z6p5E0+/LgmyYLZh0ldyTFwAoMmVOwHQ
	nQasgrxU0I5JODUc+N1XfP9hAGvyXtoWVMw+zIPy8RDmGfTRBYnG/ihV7LPXUYaud9JCBEh8nVw
	0N+r/vawcElIb6AbZWJHmgufJpBgstGNMNitA2qb38fUy+CB2XK4El43tYE
X-Google-Smtp-Source: AGHT+IHpB4lxQ3b1Hl94BfQscEhfLXiF9jx+bFESscdD3vO0Ynb7abuDXS6s97RIhF1oNJF0e1F9lg==
X-Received: by 2002:a17:903:944:b0:215:6e01:ad19 with SMTP id d9443c01a7336-219e6ebc9f5mr525797245ad.29.1735446997900;
        Sat, 28 Dec 2024 20:36:37 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:76a8:6d89:3321:5163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964b1fsm156534505ad.37.2024.12.28.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:36:37 -0800 (PST)
Date: Sun, 29 Dec 2024 13:36:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Shi Xinhe <shixinhe6@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, 
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation zram: fix description about huge page
 writeback example
Message-ID: <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
References: <20241229042758.163842-1-shixinhe6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229042758.163842-1-shixinhe6@gmail.com>

On (24/12/29 04:27), Shi Xinhe wrote:
> 
> Corrected the description to accurately reflect that huge page writeback example.

But what is the correction?  In zram huge page is incompressible page.
