Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3439E6F9;
	Tue, 24 Feb 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944552; cv=none; b=gcgG5C7qkaaDjpQXZDnKORRvwylBL/ZyC7UXj3Kda3WTvTKXautoHeMVwHLNY+xtCltANwccF2S/XorrN5TUUpdzAMOOyzytNbexfYGbow4fgCENBEgHZ6sc3vbNMgjoyKVQSPfPU2n8dABCCaJfWkCcfabGDZNCTgEPgsODZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944552; c=relaxed/simple;
	bh=Cj0h/WoE6OyXbWTR4iUy9JiRQBOkVFvuoUjZgQw5j7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OaNYDgotK98BSDa99SsbewhgPEt9aeyXt+SI1ov1fSgBbWmO4WwSud+iIwDqt8TvPQ5RCUH3VmMulpzeVlREj6XQ2M1fzPC0tGn9mup0ezE7/RQ/3cXtMWiaQ9dDRZvRDS/KMpeV33atqdwP4MwHexIMRyh6YsgroNkoSjOOqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=W8mDDxIh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="W8mDDxIh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 447FC40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771944550; bh=bq9B5ENJEH7dowPGCsGtps8bC8xL1zii0jUg00zaClQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W8mDDxIhU0irhGgJNicUqrl+qQFUpA/Aqhk7fY5iPm4LiuKQc5xtdNmaSwYlqHTP8
	 dPCl87QHuFsxxLFDrHYVRqqKKVGbOOa51nw1ptOkqo2wAC/11M9inI+Xce4AgOVon6
	 Ohzkf1XFWW321ODYmFDhuF6cVix1TbXw7UFI1ns9fxDqIp/M8HdHqCTIbXnpwEf8wx
	 cMhUR9/qstQhtE8y+SlcvCP4dtWMhP40u3t/iop5DLhJyEwT195sloSefT+dibHbQf
	 REvGnRajquLAbCe1KyGTCw+AqBKiM4PDhO78DZtUVQ3bs/FfGmjwbkOqNdAizuOpjq
	 JHhElZTL7J2ew==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 447FC40423;
	Tue, 24 Feb 2026 14:49:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haowen Hu <srcres258@furdevs.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_TW: update personal information
In-Reply-To: <201bfa5f-2826-4a31-a4e6-a4cbe4dc884e@furdevs.cn>
References: <20260220160201.41149-1-srcres258@furdevs.cn>
 <87a4wz3z89.fsf@trenco.lwn.net>
 <201bfa5f-2826-4a31-a4e6-a4cbe4dc884e@furdevs.cn>
Date: Tue, 24 Feb 2026 07:49:09 -0700
Message-ID: <87pl5u19ju.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Haowen Hu <srcres258@furdevs.cn> writes:

>> And two of the handful of changes you made that year were ... changing
>> your email address in all of those files.
>
> Sure. Just want to keep things synced as exactly as possible, and so
> does the patch mean to be.

I will repeat what I was saying: all of those continually changing email
addresses are a maintenance pain.  I would really rather see a patch
removing them, leaving credit at the top-level index.rst, as I said
before. 

>> I don't think that all this churn this is reasonable, especially for a
>> translation that appears to have been abandoned.  So I don't really want
>> to apply this.  I would suggest you send me an alternative *removing*
>> that information from those files, optionally leaving a credit for past
>> work done in Documentation/translations/zh_TW/index.rst.  The question
>> of when this translation becomes too old and should just be removed can
>> be left for another day.
>
> OK, so do you mean this translation (zh_TW) is planned to be removed
> from the entire documentation?

There are no such plans at the moment, no.  But there does come a point
where a translation is so obsolete that it does more harm than good and
there are no prospects of it being updated.  

> I'm working on the update job currently
> for the translation to become modern, and you can have a review of my
> rework when this is done and the patch is sent. I really want these
> texts to be kept in the kernel documentation and they are able to
> receive a thorough update to be suitable toward the kernel nowadays.

If you are working to update them, I am glad to hear that.  Please do it
incrementally, rather than with one big patch, though.  When you have a
file updated, go ahead and send your work.

Thanks,

jon
