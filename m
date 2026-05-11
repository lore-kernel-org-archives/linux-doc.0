Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A83BAD84
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488988; cv=none; b=d9NYe0Jw9ML559uQCUce1UtVqsBMx8IE4J6i+A2D52vpfpXZ+VbvApgJIlWmke+JbucCsANb/ftDgTz9o428JQFwNEZOfdwgeyE13SxW+km3185aOQAiEaBt8ULdLFjVmwtzuNmCRPWASdOYWZ1BEb/1FhBfa070r6IVczsLgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488988; c=relaxed/simple;
	bh=rnqKyqAfu/h9721iDp30KUlFrz/MOVxVgrsZpGVGphE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFWdWGX+HVF7qntaBxjtKQL6PniFmNt01ekDywytKprXl0l3SvT+2w+dY5oabrt5hIM6n/kO5wBmvuUtE37JWxGAfZL8mNGXq/0i1U5PSV37jU8npmLEgosCdyKC2rUafcBR8O5WCjs+VCKl8A6sBNfYbvECLvzjpyWA5ete/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=ktiQUxXR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="ktiQUxXR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so36082475e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778488982; x=1779093782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrxhiHcULhrhQbh8qYDGvqX3AewbZL83TjIxu3B31co=;
        b=ktiQUxXRaQMwJkSJ9yOuhOtr4p1E49ifu9C3Umkch59rYB+jcqNMi8UUpsR/e6J6G8
         GnAMhiS+fHtuRwwmVgjqu8/U408Wa3GQrLtNGsYdcT5A7ieA3KIWhsjmRaLrsRgfW53D
         +4gNO5+xIPlDZqKCUje6LcmNdafPMVezR9Kruxh5x3gKN1HwL3CG92mGNe11LNctPk5H
         hatc0zIGab7+4DOl0JlzGcvzmQ+h7FBY0LqSYB76WqSt65x6D8OOWj+0/xTqhT/rFsmj
         IulikLBtb2mXjYHLOIluxf576rn4LywXYGZYVeK3SowfbId2BNjs6EKbM5PJIwIX4dKj
         K63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488982; x=1779093782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrxhiHcULhrhQbh8qYDGvqX3AewbZL83TjIxu3B31co=;
        b=e+Ofgd7xdhGVUiCby0lGJfJz8EbfQqyCAnHbi20OaTQepZpqutcytVvbnriRHneNpP
         kdbFDAeYVyPwXxQ9J+A5xd3fZyxsjMuGYsCIMrUCGLpFZfso2dZp6jmqBcfhqH+1LXHx
         e01O31w3xSuHGUOl9dLT88IGGFzrohfRuzyJeEDtvh5dFnJMfUjeDNW3Jmu01QBXPUay
         Vgsk6fU7Da6ouQsjE5B+5/DcjiQJV2ggaFV6Arb/pjZQ2fnL4la3mZCkuN642XH4WYus
         ZRz8cHWXj/6OBL+9Ih6Sx5yBf0ixV1rLG48thmys9vEWFGnyWUhrwgdr6/3s6zlO1TK5
         kz6A==
X-Forwarded-Encrypted: i=1; AFNElJ+PSvh+NBMnMA9GPpxP2AOgsEb7QqSTxA3v/6bb5ZzP4TVxWAD/Od8g62CaVy/E+DKOp05xtYEiunE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZicY9v8AaOVk7pZGbLrBdmC3OQBYCxtjP0hDze9q9EMolKMe+
	CNDmMmSLRk6X3MziavHIhKJDPzFYYhWPMSQBeJMscSUASKlWQWHOpfUvUupA83M9t40=
X-Gm-Gg: Acq92OEkS8uvwimolWbqH8ylt3LKksS9/A1xJKCI+1buBy78qNGKRO5JwWsshDBdG4r
	VfMMJcH17E+BuhdEdatPGy9AOx+76G8jVlBM+sjVRXZmcus/UXafZD5DRd7qNa/Wn09MjZA8PCs
	uhPDgqFFuNvgmKIcKo05w/3mcUa8HyU+BJSI75Qj6UMzjgCdUlTNLQXV+UQu7lzVsgo9ym5j7n4
	FuDpNnglUZtuIkjU7yzw3U8w0UhgQ/GS3vXoKGXluSKmK7doFO+1C27Q0fgNgtit+ikatbOZoQb
	fOIF0FtU4FdcLS+xTiBIuvkXoT2iByZ852zAdP9zR4zTQb2k7rWlJCQKNvs9Sl09JcPdh9JwJ3a
	H3A193IV1WW8RaN2xM5loxpbkgAPzBaVdVStiPXq/RZV1wofggE1bmDrgTQaD18dDhGA19wc013
	IvDeoJIVP/v3+6TOLFiMto4Aj4uSGmWah/uzE=
X-Received: by 2002:a05:600c:3548:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48e51e097a2mr361132135e9.1.1778488981777;
        Mon, 11 May 2026 01:43:01 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8f6fa0sm59170405e9.16.2026.05.11.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:43:01 -0700 (PDT)
Date: Mon, 11 May 2026 10:42:56 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Christian Brauner <brauner@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Eric Biggers <ebiggers@kernel.org>, Li RongQing <lirongqing@baidu.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [RFC net-next 0/4] devlink: Add boot-time defaults
Message-ID: <agGOeqeNwJGJ_-2A@FV6GYCPJ69>
References: <20260506123739.1959770-1-mbloch@nvidia.com>
 <aftaW-irGmkfA7FS@FV6GYCPJ69>
 <3f9215c4-7c84-46d9-ba74-30dabe24db09@nvidia.com>
 <afxvzOjqw-vxUAED@FV6GYCPJ69>
 <b6a9b568-dd09-4414-be57-6b9cd282a43c@nvidia.com>
 <af4lBIJdCuN5VKq_@FV6GYCPJ69>
 <20260508175213.1952097f@kernel.org>
 <af7Y4AYv-XDCbK_8@FV6GYCPJ69>
 <20260510093732.6ba47e54@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510093732.6ba47e54@kernel.org>

Sun, May 10, 2026 at 06:37:32PM +0200, kuba@kernel.org wrote:
>On Sat, 9 May 2026 09:01:23 +0200 Jiri Pirko wrote:
>> Sat, May 09, 2026 at 02:52:13AM +0200, kuba@kernel.org wrote:
>> >On Fri, 8 May 2026 20:07:44 +0200 Jiri Pirko wrote:  
>> >legacy vs switchdev only describes the eswitch configuration.
>> >As a non-SR-IOV user I really don't want to see the extra representors
>> >hanging around my systems, confusing all daemons. IIRC mlx5 had some
>> >limitations around the uplink representor. Maybe that's the disconnect.
>> >But for a real, fully featured switchdev eswitches having the
>> >PHY and PF representors on boot, always, will not make sense.  
>> 
>> As "a non-SR-IOV user", what extra representors you talk about? When you
>> have pfs only, you don't have anything extra. Just 1 netdev per-pf, one
>> devlink port per-pf. What's extra about it? When you don't have VFs/SFs.
>> Everyhing is the same:
>
>Some devices have separate uplink ports and PF representors.
>As I said, what you're proposing isn't going to work for all drivers.

Well, the point is, mlx5 appears to the the one needing this, not other
drivers. What I'm trying to point at, mlx5 should not need this.
It makes things compicated, adding a ugly knob for no good reason.
Legacy/switchdev mode, in both, the non-sriov/eswitch user should not
see different behaviour. The mode is an eswitch attribute.

   devlink dev eswitch set - sets devlink device eswitch attributes
       mode { legacy | switchdev }
              Set eswitch mode

              legacy - Legacy SRIOV

              switchdev - SRIOV switchdev offloads


Briefly looking over other drivers, looks like ice, bnxt, octeon, sfc,
there is no new entity created in case of switching to switchdev mode.
The only driver that creates separate pf entities seems to be nfp,
but the mode seems to be determined by the app being run (loaded
firmware).

Am I missing something?


>
>> >> Well, as any other nv config, it persists across kernels/hosts.
>> >> Think about it as "unbreak-my-not-legacy-device" bit.  
>> >
>> >For most devices the switchdev mode does not change anything
>> >substantial about the device. It's purely a kernel / driver config. 
>> >It changes what objects and default rules kernel / driver installs. 
>> >So I don't get why it would make sense to flash into the device
>> >nvmem a Linux SW stack specific config.  
>> 
>> I look at it from the perspective that from some CX generation,
>> switchdev mode should be default. So that is a device-based decision.
>> I believe as such it can optionally be permanenty configured (nv config)
>> on older device. Why not?
>
>Feels a bit arbitrary and won't cover all cases. The question should be

What cases it does not cover? I don't follow.


>why you are nacking a more reasonable solution. Keeping Linux config in
>Linux params.

What's reasonable about adding basically a module option (kernel cmdline
is pretty much the same) for no reason?

