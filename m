Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508E2609D4
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293803; cv=none; b=EplhQNMmzs+th2EgY8FaiPR7e+P2lN9lDIMKQ6nJh8TVz6I4jpiaJBAP86z0aeOtQA6clsZ6wCTTWGxo762gRHbyU507hVcLIIuEo2Fl3hzFGDo1SwqjCZ0ET8PgAFwDUmD0+FqYqOC4UHiGYQ7bU44zlNkVoV9MBdvTLJcUDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293803; c=relaxed/simple;
	bh=RWdGPNS1iDQpL3AYAMrng6/fsuBkytsPx/WEa5J21x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXKX7WdnFBVbYXs8rrV+0tRqxby+6Hx2DbEOwIHXk0fdAK2GrcRKiHO0UzopKqmQwyOdl3A4NCdh3DQHnoqvgb8/5THfUwK6T62lVXlqujnjWi7zwett+uD2p6DDkHDYoHQWefR8ZcTVzCvOr5zvmwUpSk31hhVz81FwUQHw70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=V9KvNY0k; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="V9KvNY0k"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1158320f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1761293800; x=1761898600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5cjUqGbM0RrW05do79zm+nugfOI5OuKl18rgtRfqvY=;
        b=V9KvNY0kI67U/PdaJYXieop8BZiy4MZiedSzwXjemnFqsCbENvl/lA7gCz6OcHQIzL
         eiJWHzZxk7urBdwxlCv2X5tYbJD7YsYQ5zYjkdYOEmi6YSf+hQWxb/rcX2AwZb3LpzR1
         nkQmvDmsq0WaQZ7Ffc1NFdMOQwNW19vXZXIh5yNE1CxGKjBgy3rhCCbKLpfwTvDW4xDO
         6N0M2i/BaAT8lGP58ZNoDGGIinx6LvhTr1kaOKWif3GriTPFo99fcKHMmRJ0pQwsStc6
         cJRUvn3fOj2g+6FujJ6mOHKhfWTmLnTdJ86cisoxKz2rpTdtjHhqQFBvtbRLSiM0+FXr
         kXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293800; x=1761898600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5cjUqGbM0RrW05do79zm+nugfOI5OuKl18rgtRfqvY=;
        b=mfIkr78gjoGw68kxttMzCzsRE5tKGEG6PRtyudL/edhGThWiomfBPY7NjKWcehvbl/
         gB8IZnxacgFOupOr2WuNfCeQ2OUnlaFRn0GRNadDUmbUAQ7um45nebYVY+aQ+BYrofpA
         kSqALlNlGYu9U/OHmdSnidrFDKF/XOFkMQzPn4Lf69d8Yb0ZZ0nuQPWWGrs9JhOfDUNF
         O3gk2NJZi1VHkhu32GtywPemdBCbVX4Te70tJvQuIu1LAXtnguWjyBHShnGyS0wmp7M/
         g3jaDukY1aM6xZ/XVtVhaHfh6daVpbiT2mId13xgPHc/OMK0VfirmocL7/QZDzkmyGzW
         KVng==
X-Forwarded-Encrypted: i=1; AJvYcCWroH2BUlAIlfcf8E4OQMUpmjCPMdwlbM32V2KCcE/hEUf5rEhlIA8pCnxDbgfM91nMm6XVZuiZ/iU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqXZvHGLqpb3E7B1cSA6uQIiMiybFzY9b+qb8MUa/Gu/VKFLn
	rHupsZYPv8OlRyIB7wii6CtqwQIC4jIOFykBE1m+m7Wk/mjzwnKYo9rWATLiQfUEl0U=
X-Gm-Gg: ASbGncvrdWsWOhQGH2p3nD5wImT8Ut8uoPR29HOqblGxv4t5KPrKROCNZoVvX6j+lVj
	WC3eLsYNn4TkUaNzur66+ls0MFfahIY/k9dHAllvAqIjr3epGRgEwsXd2gT0WqmqCxKunq8DHTJ
	Ac8ME7IKTirHExsFfBKIu+S8e3mDARRr94PV2V8ac+qxjGGGjOGbsjFXaxUZV5/sK7tAUjtQ89a
	Ma/2flfFvyuThmf6elvYzFE43N6cowA65FlyiORJ12N4xna40H3uvTJ/nOn5NfKDCl3iQP6u1Qo
	HvKEJByxYLYTZ5EAYGWAyaokmrxaDZ7FtqvXqt3ZdMvcyCm1iVPzr4/ibdf1n1TWuEEmVe93uir
	m9FzPp5MGg4YBJaTMbPdVcXj+3mw8jY+JOfSABIvY114WdHN8IPaPahgpCrBu/gdaenzjvWAfp5
	9lt882ZAm9EdS1ceZO7HFMX9x1g822IticuDw0oA==
X-Google-Smtp-Source: AGHT+IEjgDbqn3z5tjHECw3913ThgDrQE5n6C5KutSqEORLETt+ny0gQGMO4mUMda0NT2ai8gi8/9Q==
X-Received: by 2002:a05:6000:2203:b0:428:5659:81d6 with SMTP id ffacd0b85a97d-4298a0a9200mr3119153f8f.37.1761293799579;
        Fri, 24 Oct 2025 01:16:39 -0700 (PDT)
Received: from jiri-mlt.client.nvidia.com ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4298d4a49ffsm4043496f8f.13.2025.10.24.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:16:39 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:16:36 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Vlad Dumitrescu <vdumitrescu@nvidia.com>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next] net/mlx5: Implement swp_l4_csum_mode via
 devlink params
Message-ID: <uez74rl75ner76kl3i5ps4huyxmzerrhananjw4vyo74tvev64@nk2lwjivr6ho>
References: <20251022190932.1073898-1-daniel.zahka@gmail.com>
 <uqbng3vzz2ybmrrhdcocsfjtfxitck2rs76hcrsk7aiddjssp2@haqcnmzrljws>
 <20251023063805.5635e50e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023063805.5635e50e@kernel.org>

Thu, Oct 23, 2025 at 03:38:05PM +0200, kuba@kernel.org wrote:
>On Thu, 23 Oct 2025 14:18:20 +0200 Jiri Pirko wrote:
>> >+	DEVLINK_PARAM_DRIVER(MLX5_DEVLINK_PARAM_ID_SWP_L4_CSUM_MODE,  
>> 
>> Why this is driver specific? Isn't this something other drivers might
>> eventually implement as well?
>
>Seems highly unlikely, TBH.

Well even unlikely, looks like a generic param, not something
driver-specific. That is my point.
