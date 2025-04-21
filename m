Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC513D503
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245858; cv=none; b=uTRw8OMTEYgRyhOoDaRXwoXgaG4heW7j7n5C8euxZEpV+OD0Y5x43wRfSkLE55RW+IbfmpoP/SKJewuJ3HrjYuQPRfFwr7WhbzyQcqll7b+HpTMAPY7KNQCai0xcWNBVPcX4iRd8k+8sSB+3ash8KElX9Lu7f6FbVldtcuQ2VGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245858; c=relaxed/simple;
	bh=GhE+7yJlZPXfDXcKbz8rIU+n/bOKRUbbW8k0nBGxPcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KvvSFzdpYTkuXfc+lTjkvfkqGDi+fqpNy1MxqVdLm33dmJqqaLO2XLKCxs8tkKDfy1XsGNr+dAbtUwuLII6ZTbqK63QBsTVJz7gfNlWz38Qcd4U4rcLJTcJD687IPWeUz1xpeCkhvrrjGcNz+kqg4oLlteiciS7WRp8N2Pr1Ut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=PVB98+6o; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="PVB98+6o"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745245843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qsv9H0ash+njBouLPA0/pRo+0GrFRby9AbDJsN0GOKE=;
	b=PVB98+6oxX50Q9XW+Za3dp/6aoF6QIsk+GkQG+RhwgAuqCO/PRha/bOC32n/j4OBZ2Vp5l
	fj5ukLpZ9H+rapRiCP5KjSosPe2nVRabrAJJSHJwKEIXCN4UK+uS8J+ghdAdvV4jg9S4e2
	CxoRLNJNJm/OrHZWBTn0zEdDROUIwv06M8rN+lHSNNb0uwvhL9qM3lLyrKX3o/ryPZFwWT
	8FT3DAjMxF7MrDxL8cFiXiDx1lrHCr8ZN9RnZsDc4eNxY6heu9v5jy6Yg7lMS8gof37QZ2
	MzD1LcaBxhJid07mg0m6tHJLgIqQEKNj2tEMr3UFqGv1DiXsGU/ioB/KoLyOHA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Petr Mladek <pmladek@suse.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, 
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com, 
 Aditya Garg <gargaditya08@live.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-Id: <174524583908.462870.16724111514713149267.b4-ty@rosenzweig.io>
Date: Mon, 21 Apr 2025 10:30:39 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Tue, 08 Apr 2025 12:17:13 +0530, Aditya Garg wrote:
> The vsprint patch was originally being sent as a seperate patch [1], and
> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> them via DRM.
> 
> v2:
> Remove printf tests, will merge later through Kees' tree
> 
> [...]

Applied, thanks!

[1/3] lib/vsprintf: Add support for generic FourCCs by extending %p4cc
      commit: 1938479b2720ebc05aab349c7dc0a53921ff7c87
[2/3] printf: add tests for generic FourCCs
      commit: 403ff8fd2dbf5066128af4d1fde76c35a800369d
[3/3] drm/appletbdrm: use %p4cl instead of %p4cc
      commit: a49ce9cc85a82d5c5d65186f5a8fda0ebfcff571

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

