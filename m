Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9823ED5C3
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080937; cv=none; b=dv1ubD1Slo1TAc80GkoEWw/sOCrKraAof8/MM8m4vxnP2JCHKMHbHqu5hj8+IPAYkc7NFC6hI/gNpgJzjHiQFpHcexXB7j22DRr9+qZfMEqc4vthQv1vbMo546YhKHhg4pEXG2Pqs6O6Ps3ahcdF/Og3518eoivCE3nDnbbzKpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080937; c=relaxed/simple;
	bh=PZt87gsUS+Wgo4zfaqwWXZGdWegl3vlb2EK9YGH238M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXcyHfqgxvR76n5plEpFNNbuH56/Q+dMqzA6U0FgP6JiqsF6UWRvs5gxnznnaddj0IauUjUTAoljMoAOBxN0r2wtG3HafY8H+BKCe3aiBneBALywa93zxlCgmn1duHYP7FDImWjZrlAT9YXzCxCQHfiB33HniOMD3WnS6NqNtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=q1H8/0zx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="q1H8/0zx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso69525365e9.3
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778080927; x=1778685727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2otLqzL5UIwKJGEw7GU0/viRo2RnqRLXcAGMdCXHaA=;
        b=q1H8/0zxTASA4aBVYQKqHcEePfrxTpKDgm7SM4meO4nF/VtG5mRlWWg769m8cnyJpd
         UKNz0ti95hz5Bp8K+souRyejdRtmHNS5v/W9vE8bUi32krABp1iE1H7lxsuJxUzsBerh
         oiYYHm2yR0nkl5on7Xm/zqLTaXq/J7M0OsyhmbiAMU6UAK/4nKNXeKzltC/Gcb3rVCcJ
         ixD3vYj1DoWgY1/D+fL+q2jPvmAKkFI5J0lxZVxspIWkF2hn2cjNinY4QtKlPcW1SfZ9
         OqzVonpDqa323pF2Cvjpc0hKhy+Q3syiuJD7ZRIqc9mudLk7m7eyDQ8nAyW2eF1t4/pu
         zm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080927; x=1778685727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2otLqzL5UIwKJGEw7GU0/viRo2RnqRLXcAGMdCXHaA=;
        b=M2xEhLKay5UCbDeg4+EEpKiaaNeYzIpA73xfEgYsyIL+ceZTkWctzUXFuuHww3S/QG
         GKrB0zVj3rj5FBWzK2K4yifU1W1dFda76oPEi9Npb4gpPValYygARNBuX2NZPclPhSZI
         kOS5jSZtWlXqwsmsSx1fnVWrBjbHdGCrjTAtig7vqk+1InqBTPfJzGVgR56sU0LK1Gbk
         zKTYGo72QDoUePePVvrMMvvzJbV0aieMMivb1ftya/mSb6DNx3tIx5J84ZM4MQBTshnz
         mDrt7iXpxmtZTM2ZaoYv/rNZw7QUBUStJ2PozCoD6hiL21n57VDckrT9zV31tyc/2Phi
         +K+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Yh9zSj7MyD84jjsn2/pKqIA7iy1r2dOlsD9BClpXwN4lEhPixAXMHNlZXViYtBw6MaSE6Mkd57+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgLtZckGHYPfcWLy6Iq2JZcfQtn5giti9fDAiIEg9EkG0s6/W
	jQ3AwX6jCG+yglkgBW9cC/JosGnIQuf7Lh5hTkEn891SZS2mz+0DwdmUsEqFpFTJdZI=
X-Gm-Gg: AeBDies1P89PvSaHQyjTjU8EN2s2dtJ9t0FO7yIZOFsCi2z0ZiJXQHBE0EucjwyJv/H
	Rdfbpai4xUXqk+xmkoo3RAgO6OoEK19EwcheAsT7DZX0fWFbdnkU83fWVTfAZFwXxOLxDztvQfp
	dcw83A8CtPMqsiZNQBVEh09wzBsxPsS5GflZnNHROB2mlYOTCjPG7IS3/OxN75pWHYY3KHdb4zD
	lqS7abX3hZNBMSxy8jEfe4bzZTzGeiFKO55SWHPLlMO+G07mkTWuycHnM4fx+4pi39zpMigBc/X
	2EdOF0uTrS1YRYf0gbcEJUXriEfe7dQc+Vi9DCjx5E+wDNjyauuD1N1a7ujklsUrOepD2R0RAqq
	Irst7IllFU9CIeFhjn986DkXOQGiyebyNLBjapyL4uICA5DIPBOM8oF5hqaAferhJLy1zM7zBFk
	MeOhjAqI3tB7hMJypQe282oTTrEWSAPABoDBnrw822Z+NjuhbRlrUeig==
X-Received: by 2002:a05:600c:a111:b0:489:19e9:b139 with SMTP id 5b1f17b1804b1-48e51e0bb78mr54150665e9.1.1778080927453;
        Wed, 06 May 2026 08:22:07 -0700 (PDT)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:8c0b:afdd:3d9d:e976])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4504f4857ffsm12838076f8f.0.2026.05.06.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:22:06 -0700 (PDT)
Date: Wed, 6 May 2026 17:22:03 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
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
Message-ID: <aftaW-irGmkfA7FS@FV6GYCPJ69>
References: <20260506123739.1959770-1-mbloch@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506123739.1959770-1-mbloch@nvidia.com>

Wed, May 06, 2026 at 02:37:35PM +0200, mbloch@nvidia.com wrote:
>This series adds a devlink= kernel command line parameter for applying
>selected devlink settings during device initialization.
>
>Following a discussion with Jakub[1], I am sending this RFC to get the
>conversation moving. I started from Jakub's example/request and extended
>it to cover requirements from production systems and configurations that
>customers use.
>
>One important caveat is that the parsing logic in this RFC was written
>with AI assistance. I am also not sure whether the resulting syntax and
>parser are too complex for a kernel command line interface. This is part
>of why I am sending it as an RFC: to understand what direction and level
>of complexity would be acceptable to people.
>
>The implementation is intended to support the following properties:
>
>- A system may have multiple devlink devices that usually need the same
>  configuration. For a configuration such as eswitch mode switchdev, a
>  user should be able to specify multiple devices to which that
>  configuration applies.
>
>- There may be ordering dependencies between options. For example, in
>  mlx5, flow_steering_mode should be set before moving to switchdev.
>  With this in mind, defaults are applied per device in the left-to-right
>  order in which they appear on the command line.
>
>The intent is to let deployments set devlink defaults before normal
>userspace orchestration runs, while still using devlink concepts and

"defaults before normal userspace orchestrarion". I read it as config
before config, which eventually could be skipped.


>driver callbacks rather than adding driver-specific module parameters.
>A default is scoped to one or more devlink handles, for example:
>
>  devlink=[pci/0000:08:00.0]:esw:mode:switchdev
>  devlink=[pci/0000:08:00.0]:param:flow_steering_mode:smfs
>  devlink=[pci/0000:08:00.0,pci/0000:08:00.1]:param:flow_steering_mode:hmfs,[pci/0000:08:00.0,pci/0000:08:00.1]:esw:mode:switchdev

I don't like this. What you do, you are basically introducing user
configuration tool on kernel cmdline.

The same you would achieve with a proper userspace tool/daemon.
I did try to come up with it and push it here:
https://github.com/systemd/systemd/pull/37393
That didn't get merged for unknown reason, but the idea is sound. You
provide configuration files for devlink object and systemd-devlinkd
will apply when they appear. Wouldn't this help your case?

[..]
