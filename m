Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B881936E463;
	Fri, 16 Jan 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562291; cv=none; b=N7WBY44EkGDk9FdxxNH9ysXawdzGlalzyv3GmQDZcPA5KGh4zkbXI0KPRsTzwpw5Djj4ksgKWtOA/3uhMWRfbqHm5F7xbx6o61xbNkY9nMfhRCmgGs2dLqhGw3EhyexCYTwQbf6jSRN+MJZyzPUoBtzrRBDH5c8R/mvlo+MXZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562291; c=relaxed/simple;
	bh=+Bp+C0v4usTN3x/GNfiWt6SuENixdBx2A2TD4F7KhR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B23DMQmpgEe57AeNeoMtL2Bj3v2fzq0Lk25zY4KSsVxrymcss1IubyICMivzeO8UxKTE60G7dcaYZvg/MONK6+WkvC6WFSOJwvh/yyYxtwmayFpGbrSUN3q3AIM2hZVVSY1Itli+iUwhsFERJ1P9uKXPWOIur6Bvx3jC3F0Muds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q2j5OPST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q2j5OPST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC066C116C6;
	Fri, 16 Jan 2026 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768562291;
	bh=+Bp+C0v4usTN3x/GNfiWt6SuENixdBx2A2TD4F7KhR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2j5OPST/otdx8ON1Vc5lFuVBY3+Dd756bT3Ck2yXGkWHcNhq/67MA8VXvX1v1duQ
	 sJ77mc7c28D2wnwP8igHVXlCiq3Pcz1fMoFKQ3BGYQnP6IK114MjbxjOqzdtZgAV7n
	 k28d6q1pC/BGP2igInKM/O6FLzE3mUUDyMMEkbXo=
Date: Fri, 16 Jan 2026 12:18:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver-core: improve driver binding documentation
Message-ID: <2026011654-activism-encroach-3580@gregkh>
References: <20260115215718.6405-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115215718.6405-1-dakr@kernel.org>

On Thu, Jan 15, 2026 at 10:56:57PM +0100, Danilo Krummrich wrote:
> The driver binding documentation (still) mentions that "When a driver is
> attached to a device, the device is inserted into the driver's list of
> devices.".
> 
> While it is true that the driver-core keeps track of all the devices
> that are attached to a driver, this is purely for internal purposes
> (i.e. it is an implementation detail) and has no relevance for user
> facing documentation.
> 
> In fact, it is even misleading, since it could be read as if it were
> valid for driver implementations to keep track of all the devices bound
> to it.
> 
> Instead, drivers operate on a per-device basis, with a separate
> per-device instance created when the driver is bound to a device.
> 
> Hence, remove the mention of a driver's list of devices and instead add
> some documentation of the relationship between drivers and devices.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  Documentation/driver-api/driver-model/binding.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/binding.rst b/Documentation/driver-api/driver-model/binding.rst
> index 7ea1d7a41e1d..d1d311a4011f 100644
> --- a/Documentation/driver-api/driver-model/binding.rst
> +++ b/Documentation/driver-api/driver-model/binding.rst
> @@ -53,9 +53,12 @@ class's register_dev callback.
>  Driver
>  ~~~~~~
>  
> -When a driver is attached to a device, the device is inserted into the
> -driver's list of devices.
> -
> +When a driver is attached to a device, the driver's probe() function is
> +called. Within probe(), the driver initializes the device and allocates
> +and initializes per-device data structures. This per-device state is
> +associated with the device object for as long as the driver remains bound
> +to it. Conceptually, this per-device data together with the binding to
> +the device can be thought of as an instance of the driver.
>  
>  sysfs
>  ~~~~~
> -- 
> 2.52.0
> 

Wow that was written a long time ago, thanks for updating it.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

