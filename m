Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2E38F249
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375148; cv=none; b=G8TuCyFEK1OFVtxzhHfjiIsg/Ipea3+5vkm0SW0H7G5aEZxtqCuBsiQO75HxzygsB3OV4hCWYwzqqnroFGeOo7VxD/LpMiCAhmfNT0gWoKE0vQm35U1ZuSpJ01ldhSWHHVOpX3NHOKrTR+Osr3eNx5l8MrnpFqQBGLpCw8sp9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375148; c=relaxed/simple;
	bh=6o6KR7nghgzkDxl1nkVVieT0SH1rzwovWzzo4qPtUjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSfkkS/UaTyGfOxIOzm0EXwL7F77T2Qn2SeIA7gsMHkTPjsgDbsd479rfbf9Z6klT/qCLiaSYRxihCt2zLIbv8x31/vnS6hmGQVzNWDEPaVHC9cb4E7ZoJCOE+Hq8ztob+bWxeZ+opkQGddIQx/s3akaH5j+YgQYqL37kIUTQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=NpQSTGU/; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="NpQSTGU/"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359249bbacso1881536f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 02:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770375145; x=1770979945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWdOoqfAHgDZZ2fSkAIYLWT6yGlK8Y5I4AE6a0ezGSY=;
        b=NpQSTGU/G3clR2EbpmRJmkTCCpS/1EhKXyVpKv7apmUyI7pZbkNSn/FLx4XhAy7ZqX
         16X8g94P7ER8FuvfRazlY7efGyO4+O4CI4b3UHbR47DLAUaxKcwtsRw6stF5jonpNNH8
         08QfgGyrIxTN722H7fPdljbtwkpTL5163eSwa2+gDjXr6630o1xvutBDkFmAICmjWMkd
         CnspGzLOzlF9Qn8txDr9rMiV/AoqXmq8k+xXsxHzC8PGpP7bo+vtNq1MEKNoG48b3rBL
         jazS8l9F7cGTzkPuSXmkec0mw6ULBOQd4UHMuQe5pIf+FG0PI7t6LUIGFXZ1Pmn8wuRF
         2mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375145; x=1770979945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWdOoqfAHgDZZ2fSkAIYLWT6yGlK8Y5I4AE6a0ezGSY=;
        b=wuvFU1whfkL9vuALLVLSA202UNuCe04x9fNM/UoDMig5+hi1Tn+ZlbRRQDdTgm9uOQ
         rHc0ra+HNlzdf4RAFk1U829MuEYIqr+pe4GO2oHiN8X7YbkBykIBIF+O+ctDE9HJ5bVg
         AbbUsTtihXZo5lJVisKffjcjFMTqrM922YzttTszYDpeNVIwhWivrPBo4ALHsJ9pdxmT
         Q9P2sdhfYP8OOTxrgB5LCuj//eSfTDQfDNBIkC9pgUdVJCYrdqm1WCcYHuZ8198+8+k3
         Qbg9I+77ULOLlMERGNfZHYY0FMAVnRRIzzXqchdNIRPLWtq0qo9/voVPiFdRTM+0b8g5
         nQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVkPhW+Hham38VhMww+AbmWGYXkUy8U4NmmY1mZWQ/q70939uNlKV7yuO4uTYnuRamXQCkr8rxkvGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFECGRo/fzfC2hmv3NeZJE6BDLDbLW9YImn16Ab7sAh7xiMOQ
	Bk+WlyDT2ZnjNQNLjTbLroVTNDdwuThQa2KertFWoW3H8Dr2WzQZMlyDm55Rw/Pkd8g=
X-Gm-Gg: AZuq6aIL9H+kxXEpg5LaNAD8+WrUG0YwHkDoXCo/0t2Eh+UB/d984dgtbujYF2ZLFFU
	NNOQbaV1Ga6UWiNSHYXflu0D0KH1cr/jRQ1Q2SfCzbelELLJtniYZOl9Rq7DotVLK94oPptYkSa
	nUYPdMO79iLb9nFDikkEnYSsuAGl6Flv/mV0era5KuOOnCn8O13hXNLQjYfpzpT/JUXtUv4Jux2
	bnlB/J8bqN8SDn0dmcpjbfwWwlnr+HxZVE22QwjRlWij7+enBG2iZZeKWgwq3HwlXHkJW201Vmk
	IO9TyWb0dFTGyYt7w1HXDVCg53habhdmKOBHH7/yGboi5uFYj3v5vJ5FHZiyCh3/afWkogSajax
	RHcKjVdywGDd5x1AJ+I9UM0YTJJjViwvFIAnt4fkwn/kpIJN7tS09pMr8MqkiK41BxwhQxTOclm
	bH43F6E9wPscRNG5dSEDI=
X-Received: by 2002:a05:6000:18a4:b0:432:dcb1:68bc with SMTP id ffacd0b85a97d-436209c9896mr10061860f8f.23.1770375145422;
        Fri, 06 Feb 2026 02:52:25 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972faaasm4698415f8f.27.2026.02.06.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:52:24 -0800 (PST)
Date: Fri, 6 Feb 2026 11:52:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Simon Horman <horms@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH net-next V7 01/14] documentation: networking: add shared
 devlink documentation
Message-ID: <khee3ri33uvtp4ssaqu7a6vy4mkbrp2zq6nghpbmyyc5pup6rq@hyryulfrhfl6>
References: <20260128112544.1661250-1-tariqt@nvidia.com>
 <20260128112544.1661250-2-tariqt@nvidia.com>
 <20260202194023.412bb454@kernel.org>
 <u7uicnxkcirhacpzjimss2pqsuhbngg4ticqrz45iqchkk2ha2@t3eem6w6hhur>
 <20260203190105.2cc28e71@kernel.org>
 <3edheaanzxgutuyryorfzlfjvizlorpj4y3ard5js7mp44hfii@4a36de6wazfd>
 <20260204180256.1476f537@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204180256.1476f537@kernel.org>

Thu, Feb 05, 2026 at 03:02:56AM +0100, kuba@kernel.org wrote:
>On Wed, 4 Feb 2026 08:12:00 +0100 Jiri Pirko wrote:
>> Wed, Feb 04, 2026 at 04:01:05AM +0100, kuba@kernel.org wrote:
>> >On Tue, 3 Feb 2026 10:18:22 +0100 Jiri Pirko wrote:  
>> >> How exactly you can have a single devlink instance for multiple PFs of a
>> >> same device? I don't really understand how that could work, considering
>> >> dynamic binds/unbinds of the PFs within single host and/or multiple VMs
>> >> passing PFs to.  
>> >
>> >The same way you currently gather up the devlink instances to create
>> >the shared instance.  
>> 
>> What's the backing device / handle (busname/devname)? Best would be to
>> draw a picture, as always :)
>
>Either the bus/dev that shows up first or we go back to index.

That may be tricky in case you bind/unbind the PFs randomly. You may and
up with devlink handle of PF1 with only member PF2. Confusing at least.
You need to expose the members to the user anyway somehow. That is
exactly the list of nested instances these patchset is adding.


>(My main point being that the single instance is strictly better
>than shared, ie. no problem exists in single instance multi func
>which does not exist in multi instance + extra instance multi func.
>But some problems do exist in multi instance which do not in single
>like the locking)

I think that my shared and your shared are basically the same as far as
the nested PF instances are not really used for anything except the
modelling purposes. That should be up to the driver how he wants to play
it, shouldn't it?


>
>> >> Okay. I originally wanted to use an id, similar to what we have in
>> >> the dpll. However I was forced by community to tie the instance to
>> >> bus/device. It is how it is, any idea how to relax this bond?  
>> >
>> >Interesting! I was curious to research how we ended up here, found this:
>> >https://lore.kernel.org/netdev/20160225225803.GA2191@nanopsycho.orion/
>> >My reading is that Hannes was arguing against the _NAME attribute but
>> >both _NAME and _INDEX were deleted? I think there's nothing wrong with
>> >an index.  
>> 
>> He argues for "stable topology indentifiers", which randomly assigned
>> index is not.
>
>Agreed, I love me a stable identifier myself! :) That does not mean 
>we can't have ID _as well_ as the identifiers. Which lets us add
>more stable identifiers and/or making some optional.

Got it.

>
>I think I was trying to sell you on "more stable identifiers" 
>as a alternative to ALT_NAMEs for netdevs at some point ;)

I don't recall that. Anyway, everyone loves ALT_NAMEs at this point :)



>Maybe I'm projecting that conversation onto what Hannes said.
>
>> >FWIW using devlink day to day, the bus/device is not at all useful as
>> >an identifier. Most of code touching devlink at Meta either matches
>> >on devlink dev info or assumes there's one instance on the system.  
>> 
>> Okay, what's your suggestion going foreward then?
>
>Add the ID back, make bus/dev optional, forgo the faux dev?
>Would that work? Would exiting CLI become very unhappy? :S

Ha, that would break so many things, everything is based on
bus/dev on UAPI level :/

I was thinking about having some sort of *special-bus-name* for indexes,
like:

none/1
none/2
or
devlink_id/1
devlink_id/2
or something like that.

But it would be either that or original bus/dev, not both :/

Perhaps we can add ID attr as optional/alternative handle? Then legacy
userspace can use existing bus/dev handle and new can use the ID attr?
Then the example output would look something like:

$ devlink dev
pci/0000:08:00.0: id 1
  nested_devlink:
    auxiliary/mlx5_core.eth.0
devlink_id/2: id 2
  nested_devlink:
    pci/0000:08:00.0
    pci/0000:08:00.1
auxiliary/mlx5_core.eth.0: id 3
pci/0000:08:00.1: id 4
  nested_devlink:
    auxiliary/mlx5_core.eth.1
auxiliary/mlx5_core.eth.1: id 5

Makes sense?
