Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7B33A9FC
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583773; cv=none; b=pfAoGoyDb1pNGJWdMN0TDk8XY1FFz8OTxe/gw16JpBjQ8tqIPWkRSvEvB0uqcreQkMxvUeDFIwiANmOX2dmtiqx2bpqX5lSbhaTxiPuF3uhAsoQyu1gg9X0YrPduPt3tW/l9zHk/K0OrG0zf9ZXYgdeNmvVrTLgYpcoTDKTS9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583773; c=relaxed/simple;
	bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KT7356HDRUd9AudsLC4S1xAgJkwJKZUdZZT7Al7WsNK8WBpjbXjJiOV4XqboiuvlLMPjKb32QDezPxqhiYeNyr26jp2RaDVGgoJq7B847zzxmVVdGjQ9ZKmqXISmOckSz3CjLoShQMI0oVl6MGeecowrhYWGdNmseZDUS+1ipfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGnCjbUm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGnCjbUm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a3e76d0f64so17075785ad.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768583771; x=1769188571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
        b=IGnCjbUmV5eQsLNtDqTDFEreU9QOfihBhTL+i5J0wM6pyNs082CrretcvjuKgZOs+6
         TpcRGJzW0OgHSMnJmhC4xtGUuvfFa2IziCAunc6QisPZ3Jm3PR3SXQvMtkxW/ITgCNO+
         3A7fYpJEjaeBTpL80to6Jl+0G1DqLhIyae6oq9GV3AYlg4ItyCRaE6LjNnN60h0NgvSw
         o9cbVkNdpbJFpbdNwqiaMmJqpFuUNt1JWQ9wbd8BiVWsZhF1zTyg3PcEHHvZjtx74d7/
         1qehiZIxDdEZ0Hzw4ACCHaRIhVw76WbSAeOkgkeMhro4vGtW7hYvjT47l/JoWZsb6agZ
         ckGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768583771; x=1769188571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
        b=fvg2c1PY0FT4cKpDTDTEuYfupwgJR2BMFAi0SQTP32dXr/Jx34vgQ1ejMabzQnf+MD
         UzKuz/iEZCi2G3+7SpgJoEOg4xbRN1YnsrmI12P2YsHNW7OeKqNvd3rC3qOpFMc346KA
         iTxqleg2LEmCadb6r6IEiMl0w04M1512UAlJjxPwKz5otUszkKY53D4EDvcSQ7uEEe8O
         vkeQZ3xfWWfFQguoMMWAj/ZixJ+3U33HncsRElFaw4jhosdcKGxCvt1op9Zdjv2Nqa4U
         OSJ66nhoa7tTWnN13BM69b5pO9B00lhbHRBvdN/7PUC9xV2KGBHYFlwIkYhRUkjqXvST
         YFZA==
X-Forwarded-Encrypted: i=1; AJvYcCXFART1D8eLwHdX+Kd6X4E39V/zHiVdalBARuIVBA42zzmSmtbGEU38kIOkPhkwwj2fox6M2ZtOyTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzemtuLKTnGRTOqXc9y7276ScFzVvXbzGZXEIqg6J37U2/HVa
	SnrtbXz0E/u6VYYlug6vw1sySmmIDizKueE/40Qzjr6O1aHJOiAwOvRf
X-Gm-Gg: AY/fxX7eXmj928OPBp0pA+xFqzGhwgAL4eqqIrMyJSuCkSOb/jWEjDXY7C6hvGYICzr
	IxFk1HNaTV12uSUBY3eIOfoqzsOF+3G3gTDZHxJsRbGinZJpRekNeC46k1JyhdMicH7rJXRF/+0
	fGxVQrULE+r4z8Wzjo5FEfyyJ8gijcahdQvPZtf17wxRG2LuC8AMcfu7/Z87LnStcrG+hhV/eDc
	4FpV1hQVFuntuhQCDbbuaNNQN4x5J6tU7+ewdKnqdkBTKFovTdFELnqjYp3n/fZBf8p7zjy9qOK
	vEAYLWIvpoyivt//WPd7sBgoBRY5q8gfqZEr1wFb0ASkWdjxmpA8k21zZmg8hfqUaDpm4JTxNUs
	0kBAvFq/pfoVb/vKvEdtL7mYSFH62rhLGRaF9qwylDP+SLarsivnbjQewAejOTHivBFRi90cRNt
	UbSh/F6X0=
X-Received: by 2002:a17:903:2407:b0:2a0:a05d:d4a2 with SMTP id d9443c01a7336-2a700a37c8bmr65178465ad.23.1768583771236;
        Fri, 16 Jan 2026 09:16:11 -0800 (PST)
Received: from fedora ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dc83dsm26270535ad.50.2026.01.16.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:16:10 -0800 (PST)
Date: Sat, 17 Jan 2026 02:16:04 +0900
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kunit: add bash completion
Message-ID: <aWpuYs0Mw6fR4rLO@fedora>
References: <20260115-kunit-completion-v1-1-4de6564962c4@gmail.com>
 <44b770121202e9f41648da5abaf9a87d5b8811c6@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44b770121202e9f41648da5abaf9a87d5b8811c6@intel.com>

Hi Jani,
Thank you for the suggestion regarding shtab.

On Fri, Jan 16, 2026 at 12:10:27PM +0200, Jani Nikula wrote:
> The alternative would be to make the tool more friendly to existing
> completion tools such as shtab [1]. Since the kernel as a project is
> really averse to adding external dependencies, you could take shtab's
> CLI approach, and commit the completion script in the repo. Only
> whoever's updating the completions would have to install and run shtab.

I understand your point about avoiding homebrew solutions, however, a main
benefit of this approach is that the completion script does not need to be
regenerated or updated manually.

Using shtab would introduce a new dependency and maintenance where the
static completion script could easily get out of sync.

So I would like to proceed with the current approach.

> And the whole thing could be taken a step further, adding, say,
> tools/completions/{bash,zsh,tcsh,...} directories for all the kernel
> tool completions instead of spreading them around.

I agree that centralizing completions is a good idea. So it would be better
handled as a separate future effort because it is a tree-wide
reorganization.

Regards,
Ryota Sakamoto
