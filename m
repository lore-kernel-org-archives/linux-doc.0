Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8AD1DDA36
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971990; cv=none; b=QiJk6zKykEPpHD5ayZIZ70lL0AGkbjj3gNqApJeSgNyroeI231zoy98fCewlO5b0HKPiK7+thI0PDJM0G4zcM7cgnPeCICl4IrCQJhztYu5GajFc3joqjOZl7pIXUjoU5LJlVuCUeQQjLaQItNCfzKfJ2Wx7c1xXMFZR4zOcpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971990; c=relaxed/simple;
	bh=cjD26/2UAwFHsgSeZprQTMz/5m3GY77SlSgA4q9tIqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUyiX0RV3hcBHzfecWCz20vXZ1vd1efwd2WVmlYEirzYxOfy3OkcHwuV3QjZDj1blEYQ37KBetsuFipxbKwGNwLMN4S98cMUr2HJggZVP+eIWw3fd6ox8CxUCpBGVQfu/cw/j6dqSvtm5GLNg9APPG8fPK9lef+bKu9cgIFhuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ZFUF70SD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZFUF70SD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso5498495e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739971987; x=1740576787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
        b=ZFUF70SDBKdB1mZKTYT3kAmtiT1kiO7UWJhEXoMZ5KxCqrF7ZuZOMjOVYYtDq+wZlf
         zbimSHfo6HO6VfC+0PVKYmmrO/AnXcple9aJBiw8v2mBloqhVtSDwfJD4yhPdo7ARHcl
         Bh2GFpm/TXev1P5l0SICUY1+zNgR3D1nkFgio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971987; x=1740576787;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
        b=Kq+ypj3LRXaebtJzQx3z7ALB6kBSQXSuFQbIyAJdSHzESjtkYd2JS4JxXIo/FZVcDh
         D4zsomVE6/xhS01QfF+EIIRJ1rE4gH+Rdxcew8/AJbf+MG+ZeCcqGOgf8UbqX7jXzENf
         8AVXRD3mIXse39VOez3nWiR/N1JJTjlMzTqmb2iiukdbnZJB+6blKYdUUmCPym3ls4bJ
         FPMJETXH79mus+qVscpMw2b5euFmYCKZF/Ub0KNW7jG4bQLYvduJTgGjcTtcpeI7JQfR
         e6ztPcluH/IvqkHENnHy/Gv2CqyIesQNT65scKBlyQHBCdKrUoVxdoFH6jVNA1EtEF1a
         yJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVuA2LVWyAt2HE3GOW54NDwWugMZvGW+wTDXcMJnmoTW8PU2GcDfb1AvNxkkQih62R3I/LhYgqXdrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFb4KfcfFRQMuce4YuXQCY3UhHzSNgZS7PJPAJhPpQeNUD0Su
	PTjBHk0CsWCSjohkUAZP7auiNGY0mGxyvPQVbzrO0KjPpyGPf/UKmZpBat/dpIk=
X-Gm-Gg: ASbGncuN6utVrKNsJ9GiSFx5d57hmZ1L7aZ+yvrJj5IkrL+nOLdg7x9a9pjhO+KXbFY
	FIVOiVipc2Zm7Q62Kki6w9t0u0C2lGCN7o/h/j8hIIEFGtpDkX11SZCY1KmnnAWbcj+GMXTcrY8
	2oo+hXRWt870CEtjK4LaG2+kaj3lP+SAK5lwv2zbqrjST8tOIKuRuzh55PctweyhHqpMyGDGagJ
	4VUYSZitUZ/Oz+8HUIYpBXxd/baKFrUuwCt/Q9EMTozcnP8h4+fZpE12PWdEedrE9Dz6H4lE849
	6IJ9mvYBumFlMzZ4J5+AR0nHM7w=
X-Google-Smtp-Source: AGHT+IEfr4282QBqEmzNfVUxfuk6xB0RBCkHqhW01JOw3jzUDHaoP/nFjPNWk6Jdq6rqr+AuCCpqyA==
X-Received: by 2002:a05:600c:19ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-43999b44505mr33869735e9.10.1739971987073;
        Wed, 19 Feb 2025 05:33:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f208sm211702665e9.6.2025.02.19.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:33:06 -0800 (PST)
Date: Wed, 19 Feb 2025 14:33:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Pranav Tyagi <pranav.tyagi03@gmail.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
 <Z7WOym9fl8GNPJiO@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7WOym9fl8GNPJiO@archie.me>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Feb 19, 2025 at 02:56:58PM +0700, Bagas Sanjaya wrote:
> On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> > Hi,
> > 
> > Just a gentle follow-up on this patch. It has been reviewed but hasn't
> > been applied yet.
> 
> You may need to resend the patch, but with scripts/get_maintainer.pl
> output Cc'ed so that DRM maintainers can be notified on the patch.

I don't have the patch since it wasn't cc'ed to dri-devel. Can you please
resend with r-b tag included?

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
