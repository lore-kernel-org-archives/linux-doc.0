Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF73B5E07
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484175; cv=none; b=GEV7IE3WEG4JAi6D0rPWI62QxzJ9Q0zO3ph30pmu27E/DgusCXQ/l7k7kxipZSCCN7TwgW5rpDI28BG6F1mDKbjLuDAUk0gEgx6qxd9hTr0ijOzfQNuhOVt+tntWnn7Q8wHtVORS9UDWUTUJs+ilYxWcx+brI8ISgRxlpmdabI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484175; c=relaxed/simple;
	bh=dnPldR/s3N4izjrNbgfjBuwPlcu1I2XTGF8Nxy1JnGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv7MHKrse6SQdCkbVMrVChHdhENfuNilw9afJipn7JpbpqGknD4AYJpPdlU1dixI4ICKnIoYOxLozCAR5OXp7N/DqgNIGPkW30ViY/5ksnxSNucNjGlQPp/YWmT5/nCRZSHVpS9mjduRAAIB/AujcZjQWGZUv6fLiTvSncwf4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=RVaf0v1M; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="RVaf0v1M"
Date: Mon, 20 Jul 2026 02:02:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784484165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnPldR/s3N4izjrNbgfjBuwPlcu1I2XTGF8Nxy1JnGs=;
	b=RVaf0v1MtAJFz98khGnF4YXwVKs/A9DAsfOd55A/tUefwAi6dS+W/L0+rDJ/yL+qvpMNm5
	PJMlgbf1gtF54Og10hondCsB/tAfvUPMKp6PfxQWk8bJhYlg5nCdFW8gTgTUuvVPJVvOjE
	Z1ZLBwRGQ2LQFB/DrAY2zEJiSlZcSAegwcvJnoPPfUnbis5snUXwWlT+RWRBKUD8kndJJj
	boqapzs1+sLRC0Pcw/iuHjfxMm8pUkbCYCYBhOzyRyqofA16tuJbssMDLxkJO64Go4VNl6
	72UA2jWmtxn69m6xSKscXAvvX/aPmpO4GFXgKKO+OUkJ1UmF7vbCysUiXza/gg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yahya Toubali <yahya@yahyatoubali.me>, mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document
 intentional BIOS misspelling
Message-ID: <al0RPx-cL7S6hRbK@wyuan.org>
References: <87v7ab3p2p.fsf@trenco.lwn.net>
 <20260719173710.2367930-1-yahya@yahyatoubali.me>
 <87o6g250ya.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6g250ya.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 19, 2026 at 11:44:13AM -0600, Jonathan Corbet wrote:
> One other question: are you writing these patches yourself, or using
> some sort of LLM to create them?

I'm quite afraid and doubtful that our comments might actually be
transformed into his agent's prompt. ;-)

Thanks.
