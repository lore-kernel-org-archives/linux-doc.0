Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F652657B8
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710862573; cv=none; b=P65KukIwDHPL8MeTdrT5FVqwun9PGAfP8Faiu68Ab+0JZjAJPFLM9IxQxm/kfN7Ne5rhDmCtIAI8dhpS+MLKdPY/ftLcGpCV4M/2XwZrNtPSnUzNzXh5e4Y6yqAxPUT0y/Tfy1upUcF5iIka1PWY4Yy5s6JN1s8g4LbbxUxFmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710862573; c=relaxed/simple;
	bh=evXLw/ER1O/WAyPO8SELAcnS1lMZtXHdsbrDNdBK37o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/tzqgMozNXlxXc3jFMtLYVvRSPe1XPBvU4zUC7Vn5ZyZlJ3BhEVZYgdrHzCMceJuJKzwfayEKu8ashCgFjDq8/UQpG2bFz7KSjCUg7tx+hng5pvNiZnM9kKKDCFK1xZuHNrxgosvlgBuxmqqZDNt717+o9jL+MXiQKHrNOgT0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=HSlj6oIm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HSlj6oIm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5586764bd0aso1350525a12.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1710862570; x=1711467370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMRrzjOPzthVrfn6KYAeeCpTeFZ11+LfDjNaDwcFwcY=;
        b=HSlj6oImhLeo1ZDYD3cWCqweHgBg3RcWVApqKG5REuwU5pUfUkcnzUgnj/uQ/cUcHQ
         S7Ols5Gxz1mPpsOCZh89CwNHyyiQHf/QjQqdSoDJaeVae/YMDW/DR2XR6NR1lGKCpuYZ
         se6LinJxWEvFgHvEDIMgWcKroPa3ZtFZEfSOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862570; x=1711467370;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMRrzjOPzthVrfn6KYAeeCpTeFZ11+LfDjNaDwcFwcY=;
        b=MM64ggLHqT5mSTBKg1nceRJJKGau98t7keFuA/VABMnHgswXYUZWd62mUOyClt1dvf
         O2TieWXtKLYGTgYcmUttsyQ3BzRm2/KA8GVO8xmQ5s78dbqdmcyoGakbnGzmL2dvXor8
         MD2gnfPA6IjIc+JmdheGzperxsAUd5jO3ygd9TKxsIAHxBrr/bhpXZvJWDQkZaf6DG2V
         sRR4vLPr+aS42e0g/5XHqvOaRmQfiqoe7uXjmbhojylug9TDZRufyjpsVEY4Z6PMV336
         38SlNv4jFw7Z2f/wGvWoEboOBiLacqIXzRGkq3aufS0oZZtTg2S3XZcTu8rh3gXUPiez
         NVFw==
X-Forwarded-Encrypted: i=1; AJvYcCWkFp94XWKvrLuriIgQXkLI+YR2AiRmyFMqvXxWKwmXDp11LZbk+6rk+Y1FxjyqVrA4nYDI4TJCjpSvgosXfREpB5Mn06OpFmtC
X-Gm-Message-State: AOJu0YylVfJ8aci9/y26lov92dCC+hO+K35yEKrnVwxX2YsJPMU+4sWM
	xDPdxdYHzQY/OjTeojpZwG4tLqQW6qZu+73EemWNIs3QJzbEJ6mDAlgmqiEt+jc=
X-Google-Smtp-Source: AGHT+IGqka02G9xZBUIJYUnMVsGDttJH1Lg5gp0y4iikQkmbEHNnKV4dqr/YUk062oXDQf+NP19rXg==
X-Received: by 2002:a05:6402:388b:b0:568:a65c:7aff with SMTP id fd11-20020a056402388b00b00568a65c7affmr1747003edb.4.1710862569608;
        Tue, 19 Mar 2024 08:36:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906049700b00a3efa4e033asm6220139eja.151.2024.03.19.08.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 08:36:08 -0700 (PDT)
Date: Tue, 19 Mar 2024 16:36:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Document requirements for driver-specific KMS
 props in new drivers
Message-ID: <Zfmw5qjlQmiWRDIV@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311155904.323488-1-sebastian.wick@redhat.com>
 <20240314-portable-pragmatic-weasel-7dd91e@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-portable-pragmatic-weasel-7dd91e@houat>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Thu, Mar 14, 2024 at 11:20:09AM +0100, Maxime Ripard wrote:
> On Mon, Mar 11, 2024 at 04:58:58PM +0100, Sebastian Wick wrote:
> > When extending support for a driver-specific KMS property to additional
> > drivers, we should apply all the requirements for new properties and
> > make sure the semantics are the same and documented.
> > 
> > v2: devs of the driver which introduced property shall help and ack
> > 
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> We probably want to have Dave or Sima ack on that one too

Yeah that's a good idea and defacto how we handled this - additional users
of anything (whether library or uapi or whatever) get to clean up an
existing mess if it's too bad. But for uapi it's good to be really
explicit and document that.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
