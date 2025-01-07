Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778AA1E0084
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736286090; cv=none; b=TlT0M5WiXN/vHXSglDWqZrtsTePQnH5cDih8BjvbpwyvgZ5BDmGnv0Sbs5QAnNIPtXNSnsblPTRVpnPA8NVu12v6Dk3C6aknydZ05cpK1LAz0YaG3OmG247nObojKhQbtGD2geVsTNBumgPEYo76o2GAHhdAA6bnTYdC8ypOgns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736286090; c=relaxed/simple;
	bh=lpWKviEZo4bxM8FXJ8znVcvZY1r1EUP8KwYPFjPwLkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qfv5cuTbfkbWlBTTQ1aEQUPpywI4jwAezc0jXMHYkmI3eUeyY5Ou0UwP5S4e/c6t8mn5hp89RNdsjZhr5BgrZBie8BDKVBGehLyRnPxLolgcgRg/6NlC7UKaGxqGpLKmnBq1gRUSIKYpMgQ90EAAqXYPy12VomdHa6IZCOkLxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rJKqu2bQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rJKqu2bQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215740b7fb8so39885ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736286089; x=1736890889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unXEBPo8awHZ2Z1rF9jBBJWiHGlrbX40mqZQQ+A6Pko=;
        b=rJKqu2bQcea7guTbC2FPbTVj9vl7Z3T9HB6kDwRdZKmW+kRcuM6s+EPqNkETQfNZTC
         OICOgzg9L7NWOiMGE0AY5AqWgw02vSjz3YNRZJSagIxo/yKFQ0TGDjyEmUTSlc0Gza9A
         vrcMD4pzlGRLS9tZfp7JxJrx4FZUZwkGFIA4kUJgykw82p0/Y51UrqWLrO9cweULhQOv
         D7xay0ikT0Y8lbTIcubMdjad84oGj8wEo0Ie56+DWxwXP+j9ZeOw0ZCrCpyUEJSK2Wgv
         u17tyOkwZ5XrKw8ouzRHbqGurmd4+ecneGnoEeckw2qbTBTO0q3/3cwi4DaiFma57+eY
         /j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736286089; x=1736890889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unXEBPo8awHZ2Z1rF9jBBJWiHGlrbX40mqZQQ+A6Pko=;
        b=WXbJVX8ui9KpPxWqFwg8ZtJiPkVD4RVa34VLkHVUND/sGt2oILAn2buXZhfTtJa44a
         V3rY3rPzdeU93ryYFYNdnfUcZe6ZQMswGCu+xoK3mN+x+kOHI1s+a+G11CWafl09kvuk
         IQa4zvZDl4FCUA/nvOP7xbxPaQ94gE+gXJo5G+8DfW0e4gDrYy1/VWJVr8j62qSREDWm
         YFxFrhJ5PFiiuH/LSit8TWhWNZLVvBnHiICQxlN++P8/YlbkTuwOvMI590rAh418OYNx
         xdbXaUcSuBQjzfWfL1FrrIcL3H2af9O8jKF62TDBlEuVsDbZn5kNwPiKZn6/pPE0KCLw
         NX5g==
X-Forwarded-Encrypted: i=1; AJvYcCU5QiOoD03FuvM+6Uz6D6ddJtLFCbrabV5ZP0AwbjjpLl2YldsaMg/BOW+ztdRMaEbT+kBzxdJejUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8IvdDHVHCi6VusEh0LtSLqgp3FPdT2U+3PrKqj7zH78wVzwi
	tjJgprGTKrIpQam5RAzN27KHkWKN6MoaP5r2oZf1W/CNGtZ47YmDATKJouG15A==
X-Gm-Gg: ASbGnctZdLM8l1vSk2qjEHB3/tqgyuU81WkgdInIniIGfraYEr9peQCBc3YUu2nUGAn
	uJUUmk/RkPhOGbUBts2kOFmjjPLNDDdqGACfiCWYHfrg/Uga/0Co9T7HSvWzvxaePMHkFXWkGcf
	59kMrxP0kIeOw4ws6DycLA3WfxYWjxD4row9xiUWiGjdmgKPgSPm79H5/bs5gNVT99l8YtxbflI
	RIYFNXMpv48CxbyvQVvT68svqTMcZKFNGT0Q2XJc5IEmI/tq5w5ZSMKlKOAhK16mLKRaLoJ8gkt
	pKadrz8OiDjH9+0P5YY=
X-Google-Smtp-Source: AGHT+IG3hEhfXeKWewYxbqr5NVyNbPqv0I027EJ/i4H/5/AUmYmTqt4fR8mqPv9GpwTbRhwaYzCZDw==
X-Received: by 2002:a17:902:fa4f:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-21a84189e0emr559145ad.22.1736286088554;
        Tue, 07 Jan 2025 13:41:28 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc963103sm316291215ad.52.2025.01.07.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 13:41:28 -0800 (PST)
Date: Tue, 7 Jan 2025 21:41:24 +0000
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
Message-ID: <Z32fhN6yq673YwmO@google.com>
References: <20241218203740.4081865-1-dualli@chromium.org>
 <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z32cpF4tkP5hUbgv@google.com>

On Tue, Jan 07, 2025 at 09:29:08PM +0000, Carlos Llamas wrote:
> On Wed, Dec 18, 2024 at 12:37:40PM -0800, Li Li wrote:
> > From: Li Li <dualli@google.com>
> 
> > @@ -6137,6 +6264,11 @@ static int binder_release(struct inode *nodp, struct file *filp)
> >  
> >  	binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
> >  
> > +	if (proc->pid == proc->context->report_portid) {
> > +		proc->context->report_portid = 0;
> > +		proc->context->report_flags = 0;
> 
> Isn't ->portid the pid from the netlink report manager? How is this ever
> going to match a certain proc->pid here? Is this manager supposed to
> _also_ open a regular binder fd?
> 
> It seems we are tying the cleanup of the netlink interface to the exit
> of the regular binder device, correct? This seems unfortunate as using
> the netlink interface should be independent.
> 
> I was playing around with this patch with my own PoC and now I'm stuck:
>   root@debian:~# ./binder-netlink
>   ./binder-netlink: nlmsgerr No permission to set flags from 1301: Unknown error -1
> 
> Is there a different way to reset the protid?
> 

Furthermore, this seems to be a problem when the report manager exits
without a binder instance, we still think the report is enabled:

[  202.821346] binder: Failed to send binder netlink message to 597: -111
[  202.821421] binder: Failed to send binder netlink message to 597: -111
[  202.821304] binder: Failed to send binder netlink message to 597: -111
[  202.821306] binder: Failed to send binder netlink message to 597: -111
[  202.821387] binder: Failed to send binder netlink message to 597: -111
[  202.821464] binder: Failed to send binder netlink message to 597: -111
[  202.821467] binder: Failed to send binder netlink message to 597: -111
[  202.821344] binder: Failed to send binder netlink message to 597: -111
[  202.822513] binder: Failed to send binder netlink message to 597: -111
[  202.822152] binder: Failed to send binder netlink message to 597: -111
[  202.822683] binder: Failed to send binder netlink message to 597: -111
[  202.822629] binder: Failed to send binder netlink message to 597: -111
