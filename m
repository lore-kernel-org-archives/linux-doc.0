Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D0343D91
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776059496; cv=none; b=ezkpVBz/h2hG8V6A8HCetVLa62EFF7shO3nvjIYdssHqdtCeZZvqOOo7YQygTuZSK+tMuLU/A8ADiqRSO8UZilM05u+XMCt3jcHq7dctswz8NJlyHHQmmq3v7YGz1NFi7KPhCxkJ2geLAoiKjfBSAHNudonVIcqfjRWv3l7QSBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776059496; c=relaxed/simple;
	bh=eAlm22D/FTYm2yDyKa3B/r3DUVpjjOkJvimiyG+ILkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIZtML+buiP82uyrGGUPuFMlZfIwXvtSoL8hxKGTZTD0ii5ambWxjRo1z39rQeg1sVLXsnggGnMZ681ALLOxXdjCx+fDC6YPfbLrMOD4rn7uLibktA/CTUb0Vrz4tcqH+5BkuDVpQ+jbjiUpR6DnLXIkQVXr293LaOkf2Z//V0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUyhGEPT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUyhGEPT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad617d5b80so21614405ad.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776059494; x=1776664294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeQDQeBvQZOlrZs1SM9OmJqEmhvxKZeUuqXZlJxsEYw=;
        b=xUyhGEPT7y0qLZrcpWWnS73NON0qitxsYLvEI7JuRD64mXkOgz5HdC0125Mh43jSh/
         L31q9RrZFgiHNki9vR7H3feOjY71kTiLylZ6qW0DNj+/E6Zb3zVQ6BsnBil+XWtQqOvn
         um68yupybLfptFIqojY7DFz5Y8OowEMvu7LvcGfemClkPLzfKWXl4DZ3jNrnmEz/WzsR
         nwFgk0/ST49yqFGyOgjWeNVY3+WAu1/DfDZ7L0QBNXpgqPNQKoVlQtyCYR1lz5T+sgcl
         VrZdlpoUmVXuDG/STx/KbOE1nWPv9iYqcLw1lJ2zlaEOa2Jc/eC83OxW93ZS13FMpDgf
         5qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059494; x=1776664294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeQDQeBvQZOlrZs1SM9OmJqEmhvxKZeUuqXZlJxsEYw=;
        b=Cj4Lt/wCMXyrHVHoBpMj35rXXnnRLaUI/bDkVrQBlcTnN3cI4dHjv7YOoKjzCNJaJv
         lrZ4iJgKoD6feibRaiR5kzCrU+SLpEhWBr1epY4vN9asUvEnuwJXXYfke//U2nTWlUXQ
         gdrGkw9OqUg+agdeqOdEIO2S5w/4lYt890KbAsHzNQX2E/huH0MU+ityrBvNV++RhY6m
         xJKseEPr0ms2K9ZI5A18kf5DoQALrcMa2HSKchhzzgE4kDl39HX8JS5w2OmuplRsDhT6
         ob0iz/BkIjN2xs6ZczeVUFaRb2/UtPxZR/+yHGImfR3seBQo/fbWCBRyG54s6IG42QBw
         R74w==
X-Forwarded-Encrypted: i=1; AFNElJ8aJXwabC4AIBK9zdYBREgG5yF9AjDXSxJGHqcYaygemYuNqoeco/7p5v2BF0ubRC5W7qclr4z3W+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFgHF1jg38gZu5H59VhfRcNaQsh25DQUaK7sfsNueetytG/P+
	1PxEz3F3HHXRXCHw0NCj4QuhWOemH2ovT3dX5qk+Fd8DemJySi/APe6cqtziaWq0d7g=
X-Gm-Gg: AeBDies9hJ9eY6r1dB/7FvCx0E47LpWsM6qx4+WCgrMoD+tgjB2HMENX3MRbVo0XbRT
	lE036k9NuY6Osa9YzEzhIcu0n70ii9E5WPKT+1n29YOBMXyXslmqXOZ2XtR3LCzi+8R0yoG8ob0
	bnaMDEQvhpcZ6n6d3smRhyW81I6nOnU3/DI+5IiPpmZwW3bT3cvkF/N3WakNUvw/AYn7QQWwokk
	0waO+Q5q9unV5Cdg2U5xtCASSWNvRVNAH8ZlNwZUpr1wnGt0gd3wDfQXjVnfUQhhIJOSGxaCw6y
	7XNQtWb8FrXrHIPB0pkYNe4rKvGp+/VYGo2E9nQ7JUHYf3CiSCuF7Ex/wvFRT8ijpKlI2ISJd8e
	xBsli0Go73ZfhbjJ5Fs7XAxxwsWlIUNNSqgspyy1EPyZ2SYvNvg1JjnseNkvypuzd5vvZrbGFPT
	Ck5U6h2h0SVzRAPJ0dLqP2a7Mm
X-Received: by 2002:a17:902:cf4b:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2b45b82b920mr33230225ad.24.1776059494437;
        Sun, 12 Apr 2026 22:51:34 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm108579865ad.66.2026.04.12.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:51:33 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:21:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, zhenglifeng1@huawei.com, 
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, ionela.voinescu@arm.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, zhanjie9@hisilicon.com, corbet@lwn.net, 
	mochs@nvidia.com, skhan@linuxfoundation.org, bbasu@nvidia.com, 
	rdunlap@infradead.org, linux-pm@vger.kernel.org, mario.limonciello@amd.com, 
	rafael@kernel.org
Subject: Re: [PATCH] cpufreq: CPPC: add autonomous mode boot parameter support
Message-ID: <zfoorh6tza4taswyr5zhxqn4rhcqzq4rtvz46eigoy25muxfls@tlbuypuwocvm>
References: <20260317151053.2361475-1-sumitg@nvidia.com>
 <4b1f100b-e699-43c1-a06b-5545056d174c@arm.com>
 <b8debb30-67a5-4d2b-8c08-8fd287f7258e@nvidia.com>
 <208360b1-36a5-419d-80f4-431914407f61@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208360b1-36a5-419d-80f4-431914407f61@arm.com>

On 10-04-26, 15:47, Pierre Gondois wrote:
> I need to ping Viresh to check if this is still relevant.

I think its okay to clear the min/max state in the kernel once and for all if
you think it is not done nicely. As discussed earlier, try that in a fresh
series which only does that part.

-- 
viresh
