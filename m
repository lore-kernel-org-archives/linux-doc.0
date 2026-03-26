Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46F34846E
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566290; cv=none; b=OmHpOrnKnmHgxL532s62tWbbV+4uaTC5kMtzVckX3QlvsaGJQKr3oAL5Og8edo3Q6wUSKBRp6KPsUrkgbheDjioLM9GFCU6RVKgy6lYHbeXpPV+bcdqHI5o3ITp+SyN1aCKXWkQzUWxe1EsXkoEMJHgsiHFhVJLI2iaDLLwGTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566290; c=relaxed/simple;
	bh=8r9B0vRE6EiA181w2hcVDUmzOkvpGi+aSHWukcy3ilo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY3dkubRpogQzdmwV3gmbmUMteplDK+JdZftBNB2Gand2dkQ//2uE2C/seb1bLjhyGoOJ+bS8wBKeYAGinWADKd8F+fYf9xjODyHL2d+/fu0kFItP6FtegCVmpDrnUfauZK7o0X++R185R9mO3Dfi/i9D7LkSNRVew/KD4ilmxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrWfkGcX; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrWfkGcX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2134688eec.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 16:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566288; x=1775171088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjHv67kGh2JehAb4kr7vwaSeF2kQTBFbihDLeYV9JV0=;
        b=UrWfkGcXPSJQhe6AJNX00VaAd/aw8R9wjyJEzxetOtmEU4+fwfAGAiwBX2YAOdGpYQ
         aCwB9iclNA7erB5nGbNSxXpEC6ygu6eQlHrXs/+YTmb2pd/iQuLeJ++HJERR0OmsfMV/
         PTyvHORznojKkOOgJeOTMm9Bp1Z9W0tpBwaXpbUoIcK115pR/TojWQPKsAr/RaD8YnT5
         uDWoPzeMHc68LqibBoUhGbHYoJQApeJZiqvToNjYZik6W/K238Ui1npP5AW3FYfcXKCf
         dtPMdATqcaNaPc5lYpNZhOjsk4EFBa3krxtN5N3b1Q0da9hbhH/Pw75stFA9nlSPWy0p
         AeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566288; x=1775171088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjHv67kGh2JehAb4kr7vwaSeF2kQTBFbihDLeYV9JV0=;
        b=hzggU84zOAoYvm6yTqn9UvxsG3h0vZtziP2Bf4QZITMNpbgQKFKoeYnihtNamz8vOj
         Qht6muaHfHCTpGoxrzS6NRYpsauBrPzuareFPUFP/WyLZaS1cbiWVO18GJkaj/MMXFtU
         jJA2b/8fzvWVlR3+G/Ef5ZNaHqd+O0DnJyTjNaD2/YY/uSBiZHXzOYHTVg6HZKg/rg8l
         RSdyrbtThlr1QukkCYu6UovuBgj6K7apHAmYjz9Lq6s4vIF/nojKH87G585wGJQpA+PL
         DSBfgHv7hMIOnKRAKF4iCWKngN4ltP4G3RSflOXzVZCNol+EYq173hmP2nuWjy8n+weQ
         NI1g==
X-Forwarded-Encrypted: i=1; AJvYcCVg7+dH9vYbmFrG+qIFpc3wbJT9ORLdv4dpf8UX90825bHeCO7CSbXiHDkM4wXPdNiHsf1+k7cO5Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwewxzZXEHs6NsKiZYSQ3K9uD0oPDHDgY2ojsfPMFE0Mx56toqw
	RqT5miBW9SymaDd7vfYDh28WyhG7u6eVH4G3+kbYnsm+hmtk3N0fYPng
X-Gm-Gg: ATEYQzyOsKH5HLKZW8ED0/bgHfvcS2+NSlIe98Jhbf3l72gi6k9d6+OyIAn8MzwEujt
	KvTdZqX3iKOWXfYBsF5Iq5RpDd5SqXUEuy5mYqbKPiB9lN2fIsbREEUMRtGhrQOptcNd6rYZBUW
	O/1nNZ2+nToXURS+nU4wRxONnD4+gaFK2b+MiJCKc8DEk5kgXBIisvwJWCxqJ9MyvwX+PW1Slps
	RcrAAhi3rHCsF5Uw4IjNXOQ+vT8HApNSFMooRFBBpuwwlevIwImtR57iToOgNSK1PzgKdriVoIH
	lAAltk2M9uq4Cbz4A/AY0iHda6LPwhqUYrlPcG4YzQxXw0cjULOhiZuS++5uC3wxi41zufANeJ+
	sAEgb2YPuDmyMsWcTVzAU/jR9ESdqHbyzp16My/jQPvYGu5blljRypEUIa4NFM81JuWgIxj1w1c
	J31wnE5s8zb0YMY2weD07OdnP0HcxkGrML5EOCyEhTa3sc9sxS6wicUb8SHA9sQHEPigMpW1u/2
	Ow=
X-Received: by 2002:a05:693c:2c0c:b0:2c0:d04c:a6a6 with SMTP id 5a478bee46e88-2c185cdd1e9mr294650eec.6.1774566288057;
        Thu, 26 Mar 2026 16:04:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c497:6d9d:a11e:c553])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee01674sm4167539eec.27.2026.03.26.16.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:04:47 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:04:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acW6Iar6XOzO9IfN@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
 <acWnbG3nGjfYeYXh@google.com>
 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>

On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> On Thu, 2026-03-26 at 14:42 -0700, Dmitry Torokhov wrote:
> > > > Because when I am editing a file I am not saving it all that often. I
> > > > want to have buffer diagnostic updated when I leave insert mode in vim.
> > > 
> > > I believe you are able to keep your own version of checkpatch.
> > 
> > As well as my version of the kernel, gcc, clang, editor, git and so on.
> > 
> > Do you have any constructive feedback?
> 
> I gave you feedback.  You elided it.

Could you please point me to it? All I saw is "just save it" and "keep
your own copy". Neither of this suggestions are particularly useful.

> 
> > Right now checkpatch is broken
> > when using "-f" with stdin and I offer a fix. If you have a better way
> > in mind by all means share it.
> 
> Note the name.  Feed it a patch.  It works fine.  It's not broken.

This option is a bug then and should be removed:

"-f, --file                 treat FILE as regular source file"

right?

In all seriousness, if you will not make use of this mode it's fine. But
it allows keeping the source cleaner as one makes edits, so why not
enable this?

-- 
Dmitry
