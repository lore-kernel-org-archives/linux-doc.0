Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83B1A76AB
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936842; cv=none; b=imYV796tX97Ngq4u1pwJE698EektXKc1W0mujLcCNRWUT2Dhgin4xG7OTsCzoYAdskvs5vy8IjOioTOZ91dYFge9A+MFltiXnnBTIcFZ5VPjUsvwABAi07ui0RItGhxzkdTlssN4BCTgoHWFDfuD5QEhyIdJ4cnDLNLX38q5rJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936842; c=relaxed/simple;
	bh=vhpdpTfvOWpq4BkpAeiQWNqUpz5BcVonWLnhkaxRaQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqMLDOa53C0LJF2G+We/c9TFBdMOFFSYftNjsAUks2H2xEr6+MDglJa/xXmzfoA4+T3Q5rHhGmAoLPKQsMvOpW/DEnP5BmaOxk87yipwpEITs54qliHTeVi5WYft2UL1bHDEx072rLxknbIp37EWP5K2We/r61k0bYtNvGOi1rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=JukeghlL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="JukeghlL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-533521cd1c3so745277e87.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724936839; x=1725541639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0TbsUu6WIFtUI0I/cmrO4B5vqQGbNpEnL8oQNR8OvE=;
        b=JukeghlLBK/lzpMdmTmuX0QRHVNvXFFbvE1U9X4DdctwndIWNfKsPJ7RcRRXTm1fFQ
         9zSqUWJuIoiQTWXn69t1NvhjTYIEmq1LYIDAiObJuQRerDSCPXsoprl3E8i5G5UZSR4l
         pNkcrCCVehg+uobEn5JdIjRNz0c/vb5CAOcfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724936839; x=1725541639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0TbsUu6WIFtUI0I/cmrO4B5vqQGbNpEnL8oQNR8OvE=;
        b=VzFwZdU5mNfIEQk+mdYNd6usjzVfo0xU+LAEtAT3Q0v9eLSqq7UxkRMEKZQ/MuYNKF
         bs0pJypXFbzlErk5fKCgxei/aPCa6nBa/+lX6W1Ny0PMHUYHfCPqV8wj6EyX3shTMkOU
         0q+dfM1odhFdKPTgbRsIlXrtsxxqs9gBiD97m77pAQyALIFb1mxDM+14NkLGaUqfSYZc
         AEyrIAz/F9guBJ6YSqiN7IpE/y8CxvCvVhQKiH0Fyj3VMGTXX5VAuHA+MUOfP7M02oQY
         kyiY44FH2vdMc+yZVM2QJ9ffe+DixDornl84/aSe+mRY6JWNnMyh3vd6GeM0XXYXij1e
         FjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5llO+PpT5fWZXW3oHoKq9b3h1gw2vhZUUapaN2mUJeaolBwUvyUNr+MtFhFwPcTcsOdvLUBX88Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFO3VXf8+OiN6JIE9Y/22ZlCkJ5K4unp7e3Izifxb8ENfA57dL
	DgJLRNSobeVy3pdTELfMY6In0K8TRdg+jimE2o0ZtnFR/FP7dFBt8zXzVKt9dtXd1k0SZFCkw2m
	nFq2PMhnjGcrrvRJZ22P6qAqhBKEpbOkB89BXJP7nyWpmZfhqEog=
X-Google-Smtp-Source: AGHT+IGSRqyXut7tytiqq+Fv/FSdxZOLBx6kvkri+Nl7nKT6LJzc0hkeK3IT0QDDU6jjqcTAQkTG+kIWkupBmiQV4tM=
X-Received: by 2002:a05:6512:4003:b0:533:4620:ebec with SMTP id
 2adb3069b0e04-5353e543459mr2692053e87.3.1724936838878; Thu, 29 Aug 2024
 06:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709111918.31233-1-hreitz@redhat.com> <CAJfpegv6T_5fFCEMcHWgLQy5xT8Dp-O5KVOXiKsh2Gd-AJHwcg@mail.gmail.com>
 <19017a78-b14a-4998-8ebb-f3ffdbfae5b8@redhat.com>
In-Reply-To: <19017a78-b14a-4998-8ebb-f3ffdbfae5b8@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 29 Aug 2024 15:07:05 +0200
Message-ID: <CAJfpegs0Y3bmsw3jThaV+PboQEsWWoQYBLZwkqx9sLMAdqCa6Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Hanna Czenczek <hreitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, German Maglione <gmaglione@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Aug 2024 at 14:37, Hanna Czenczek <hreitz@redhat.com> wrote:

> I honestly have no idea how to go about it on a technical level,
> though.  Na=C3=AFvely, I think we=E2=80=99d need to split off the tail of
> fuse_fill_super_common() (everything starting from the
> fuse_get_root_inode() call) into a separate function, which in case of
> virtio-fs we=E2=80=99d call once we get the FUSE_INIT reply.  (For
> non-virtio-fs, we could just call it immediately after
> fuse_fill_super_common().)

Yes, except I'm not sure it needs to be split, that depends on whether
sending a request relies on any initialization in that function or
not.

> But we can=E2=80=99t return from fuse_fill_super() until that root node i=
s set
> up, can we?  If so, we=E2=80=98d need to await that FUSE_INIT reply in th=
at
> function.  Can we do that?

Sure, just need to send FUSE_INIT with fuse_simple_request() instead
of fuse_simple_background().

Thanks,
Miklos
