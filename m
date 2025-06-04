Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FE433B3
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022632; cv=none; b=pc7mhmc71VXzpSYSvJONA0XH2VYvm+XsZEs4o+7ZuUmcEPbM9PUXufIyCbtoIf9bglobehrHJ8SwYmRVclU08HHgF9DROxSGN8fULJa1dTGC6qaNovsuOz4crG2DUIRKhJZ8vnkVRNqGLsf6ZX6/Jw1MnSSaIl+SSGI+W4XLcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022632; c=relaxed/simple;
	bh=gstVCz0JDa01YzM6EiKSmQkKSFdPNGQcNH55ui8DreI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pye8WKWwfvB0Wmbusvjm1y58+bOvCUrto4mYCXeQfaoaebjgCCUDT0k/VLYlnj2/WdU3L9ZBGREk6kTErdXuM2+lDn6W9WvAOoo104p3PUA6MV/KMVzO6o3iKT9nb5YYiZLhFMk+XtxxKliA1op0d1rlGBxte+OU9iFPlCnqelw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yal7WFAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yal7WFAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DA1C4CEE7;
	Wed,  4 Jun 2025 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022631;
	bh=gstVCz0JDa01YzM6EiKSmQkKSFdPNGQcNH55ui8DreI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yal7WFAQIyK5mSaDSjHpLgujEuZAAYYk0BOWA2FmY3rP9+ozhzqMn9XjG5y7Gn2N7
	 Phk7pcLSnIdr2Loxljd8Cx2Xs9llNSOgRYqV3M9BLPL8EAQWBWsCRkNzty6ew8myKW
	 UvrVp8arDgvfqZsgj7qoZwmzIDDRFmA4JIzX2BI/s5/BhSdSp3ZxJfYsYasPafoksm
	 KyAOPcv2RXTyWbspTSaflKWRew51yN+UNf3G7XRaAeUpZSKcDFu8Gqb7MMqszhtoAF
	 vMDB0ucl/udi7VCE3yFYH78aR5pDm50k6NMhrC2Xh/yrhjSgyumAriiEVd75H9tPhn
	 bX8PxiRLxTRYA==
Date: Wed, 4 Jun 2025 09:37:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
Message-ID: <20250604093653.7e2b88e5@foz.lan>
In-Reply-To: <87iklcjul5.fsf@trenco.lwn.net>
References: <87cybklp2n.fsf@trenco.lwn.net>
	<74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
	<87zfeojzr0.fsf@trenco.lwn.net>
	<e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
	<87r000jvcl.fsf@trenco.lwn.net>
	<87iklcjul5.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 03 Jun 2025 17:04:06 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Jonathan Corbet <corbet@lwn.net> writes:
> 
> > I wonder why they used a border rather than the text-decoration that is
> > there for exactly that purpose?  I'm inclined to change the CSS to get
> > reliable underlining for everybody.  
> 
> Having played with this a bit, I'm guessing they went with the border
> because the text-decoration underline gets mixed up with underscores in
> function names, while the border sits below the underscore.
> 
> Assuming we want to preserve that behavior, tossing in a line like:
> 
>   border-bottom-width: 2px;
> 
> makes those underlines (that I never even knew existed :) visible.  So
> maybe that's the approach to take?

What I suspect is that this could be related to your monitor's DPI,
and eventually to WM scaling. When you used a larger size, it became
visible.

I would override CSS and replace a.reference to disable border and
enable text decoration, as this is probably more portable.

Still, I think it is worth to have separate CSS classes for xref
and broken xref, as if one wants to do a different decoration,
that would be possible.

> 
> Thanks,
> 
> jon



Thanks,
Mauro
