Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C45201258
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363271; cv=none; b=mvKLh7rqtU3ctkQ4A5VtR0NShleHrEYjtwMECZNy/8xs+uh2aSKG6WCnPDMRZhlwA6PW/SjweA6QiFnFHn2NVZ/HOES9YkNPpFWqDbLNJdujIT0NRfl3L8wCnrw32ynD4UehCzleo4vMabsh0LwjEU5elU70hBpbp1umanSieNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363271; c=relaxed/simple;
	bh=vt+AzVIZuw6/ySFiGbX1NpVmbOo90FUgY6oDpC9e6KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poZGMegpL3bhlQ/Stl218devXxebGn6DCzw7mudYVbi6bf/V9U8IHrXCvMC93lXv9uhkGI5EeXJEY7Dr2qeLdJNnjXqYj9UIzXVwt6t7gvKDI/D/RLM7QW7jgVfnuv64sjmdW2GrMsEiYL11mpheNW/dXDs+MDr9TTmL5eCQmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4NQGkMPZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4NQGkMPZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-219f6ca9a81so13355ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736363269; x=1736968069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSL2se5e/t308Q1OEAVUL1lC0F/ZUqtNo7wlxbQIq0k=;
        b=4NQGkMPZsIwc9dmshw1Xr9pofRIp9HbvxhFNsEYMr7hTSzYDPSlfWo5V1P+b3eqCau
         9JlmBS6KdM+4G+ZjuWNQS/wFxpUbPZQJ6VUeyCyyeVOXKJwvhC4Z7Q00ncv9awzCj4Cc
         6e99vHo7xd+TmFAJt7KhdMO3Mu2uMtjzrg3u4F6JbOli1oyFJfayhIOreM0NT1D9XPCu
         DeZbhAbKufw2Mj+PF9MR/SH9csV0HAGxUw6lIPjkqBFFW4yGXFzKr7Crkf+8ARDOJSgg
         taNoyjaSHOL+Vil09lPyJBEphw46f5NUNPx6UJwOK4wb9ptHFPYgKdhNlWh+uauj1pT/
         YIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736363269; x=1736968069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSL2se5e/t308Q1OEAVUL1lC0F/ZUqtNo7wlxbQIq0k=;
        b=PMf+Bq8zcZJUjEajlSd8bzfUI5nCv/8Vsmvsgt/svoYSJRFjWN5yAULHs9iGnjqkKm
         otP/FipzSO11kcNCHUTEKZih96ilcz/mYpwKh6QIHToEHO6MLW1RLRGWFL0o0lJcts55
         Lm6gUK6tjGYtkxc9pLLB6Q74cZf5sHCLX8b0SORN9K4Ruq9V5uiUKBbnlfDbXEQZR1Ch
         gfeok5eXnjR7SAAplADEaGZ0kFJGZxYqSby/qM3L47Xp6AQEaTfBO6PWvGYiY7a9dP00
         dfwAMf+UrwvjZYefkzzaZ/OSGuxxEtC7xPN3Hf2RTCsuGcejJmLd5cmvAlgd9ZxMGbFx
         eYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2270sNFNGpgv19OUlcVjbPzXrVMVrg3dhe0W9cVLQIqst+5r//YVhL3Av/xYY0sp8Hibn9qf/tLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/KXx+JssPFZrkHxR8dUvthKtc+VKvhu5Dymebw4NKQRWRKVR
	8GuIupSa26oDzsSlYI7RJDYzbkhBmhI49r1CapFNvInwQNXoBngg4D3p6Z+9Zg==
X-Gm-Gg: ASbGncteVI4tGH4rZKC5y0CKBUfKPpGfb1mj60d2bfGWDraQbBUq+/358Uz7QFLaA9v
	q+iq310tEVXM8+/zB6K/fequdug3Ho39oGB6ibfrM6loHpCA4Zqky6wsWKTuRXQD4DLahaa8qwn
	w8rbvnaGMfKoRgekVWUNN/H4OQrquwpn4OMyYA/gVkSGsAn14DVhJnTPh0UulOR0hKo2kVbC8fP
	4grL7JrTEIDAKClH3BvMkmWAo0+ik2nGCTLJyQsr2zQuR0ZRh23pTwbShWQaujujl51oi5Obo+h
	FpSvtVl2maOLFOI3Xso=
X-Google-Smtp-Source: AGHT+IEUjmRWZJskunQnwYY6vsI4FMXJpSCHJ5szmBiRQr//+9AoUgKAKktesMA8sfh5f/By14EqNg==
X-Received: by 2002:a17:903:1304:b0:216:25a2:2ed6 with SMTP id d9443c01a7336-21a8eb132e3mr126155ad.14.1736363268609;
        Wed, 08 Jan 2025 11:07:48 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-851b3816e8dsm31601152a12.63.2025.01.08.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:07:48 -0800 (PST)
Date: Wed, 8 Jan 2025 19:07:44 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	hridya@google.com, smoreland@google.com, kernel-team@android.com
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
Message-ID: <Z37NALuyABWOYJUj@google.com>
References: <20241218203740.4081865-1-dualli@chromium.org>
 <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com>
 <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>

On Tue, Jan 07, 2025 at 04:00:39PM -0800, Li Li wrote:
> On Tue, Jan 7, 2025 at 1:41 PM Carlos Llamas <cmllamas@google.com> wrote:
> >
> > On Tue, Jan 07, 2025 at 09:29:08PM +0000, Carlos Llamas wrote:
> > > On Wed, Dec 18, 2024 at 12:37:40PM -0800, Li Li wrote:
> > > > From: Li Li <dualli@google.com>
> > >
> > > > @@ -6137,6 +6264,11 @@ static int binder_release(struct inode *nodp, struct file *filp)
> > > >
> > > >     binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
> > > >
> > > > +   if (proc->pid == proc->context->report_portid) {
> > > > +           proc->context->report_portid = 0;
> > > > +           proc->context->report_flags = 0;
> > >
> > > Isn't ->portid the pid from the netlink report manager? How is this ever
> > > going to match a certain proc->pid here? Is this manager supposed to
> > > _also_ open a regular binder fd?
> > >
> > > It seems we are tying the cleanup of the netlink interface to the exit
> > > of the regular binder device, correct? This seems unfortunate as using
> > > the netlink interface should be independent.
> > >
> > > I was playing around with this patch with my own PoC and now I'm stuck:
> > >   root@debian:~# ./binder-netlink
> > >   ./binder-netlink: nlmsgerr No permission to set flags from 1301: Unknown error -1
> > >
> > > Is there a different way to reset the protid?
> > >
> >
> > Furthermore, this seems to be a problem when the report manager exits
> > without a binder instance, we still think the report is enabled:
> >
> > [  202.821346] binder: Failed to send binder netlink message to 597: -111
> > [  202.821421] binder: Failed to send binder netlink message to 597: -111
> > [  202.821304] binder: Failed to send binder netlink message to 597: -111
> > [  202.821306] binder: Failed to send binder netlink message to 597: -111
> > [  202.821387] binder: Failed to send binder netlink message to 597: -111
> > [  202.821464] binder: Failed to send binder netlink message to 597: -111
> > [  202.821467] binder: Failed to send binder netlink message to 597: -111
> > [  202.821344] binder: Failed to send binder netlink message to 597: -111
> > [  202.822513] binder: Failed to send binder netlink message to 597: -111
> > [  202.822152] binder: Failed to send binder netlink message to 597: -111
> > [  202.822683] binder: Failed to send binder netlink message to 597: -111
> > [  202.822629] binder: Failed to send binder netlink message to 597: -111
> 
> As the file path (linux/drivers/android/binder.c) suggested,
> binder driver is designed to work as the essential IPC in the
> Android OS, where binder is used by all system and user apps.
> 
> So the binder netlink is designed to be used with binder IPC.

Ok, I assume this decision was made because no better alternative was
found. Otherwise it would be best to avoid the dependency. This could
become an issue e.g. if the admin process was to be split in the future
or some other restructuring happens.

That's why I ask of there is a way to cleanup the netlink info without
relying on the binder fd closing. Something cleaner, there might be some
callback we can install on the netlink infra? I could look later into
this.

> The manager service also uses the binder interface to communicate
> to all other processes. When it exits, the binder file is closed,
> where the netlink interface is reset.

Again, communicating with other processes via binder and setting up a
transaction report should be separate functionalities that don't rely on
eachother.

Also, it seems the admin process would have to initially bind() to all
binder contexts preventing other from doing so? Sound like this should
be restricted to certain capability or maybe via selinux (if possible)
instead of relying on the portid. Thoughts?

--
Carlos Llamas
