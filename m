Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C328FA8E
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043173; cv=none; b=TnbhWuDcwk0yt8mfmF5Yk9uE+nviup7gAauhyv7BB12lNwEBG5Ggvzav+2KK5gJ5cxXlwahz9kccMdYaIHOiZ8c+nVy9Ex7m/TR1iUsCiGYd2vrXVHzfnrYzB9nh1oiD8tTF+kyZQZa6lVAoxTY4/QFnMwNobyEkCkOZbQidfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043173; c=relaxed/simple;
	bh=dpkWeeCoCPcmiuZp/7gNExS3hiCrSbsGB93juibpMoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsZiQpbr0bsD/0hsgrFokpgCpVBAEZth4tKoPzsG9vJlR9HM4DlfgFs03a43VmTZKlxForkoCRZ9xnI5vEiPVf+5r2XRGq62H72aDDYR3HfXFNTGti+NGvoN3Vcryk4G4ahxognfvOJ919X62a9Zsj5Osf+ehE2orWV/hdTL/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kUsufBal; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kUsufBal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749043169;
	bh=dpkWeeCoCPcmiuZp/7gNExS3hiCrSbsGB93juibpMoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUsufBalM1ScGm4eApR+QXr0wuF5zOETVjA6zsxa2/MhBxOpfW6J69K87hx46vdSU
	 YFOc4gk1lv3hxmjHBdxjetM+2QkMvIf9QnFj3BAhwVvE/QX4LYX4VjByzzJgTEkJqW
	 tJW8E68ocqU2NGGGAhQnoYGfsLW5LF9ohZFRupQTy3o0nIjRG3O7e66ZDCwamJUx1X
	 aClCTfS6AQXXevXw28EWSTFma1ZkvY4lN7pVaZeSh2oapPkonVd0BnVVC2ScX3SIqo
	 EWomLvCNv8EoNtV7pZgKIn+AzJGid40Q0HNsHPbKsr/TPjke/RWimLV2+qH9FLmjjk
	 9Oc9e+FTeHKoQ==
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D85D817E0B72;
	Wed,  4 Jun 2025 15:19:27 +0200 (CEST)
Date: Wed, 4 Jun 2025 09:19:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
Message-ID: <76dd6fd8-1f6b-4c4c-9c0c-2458f4709ace@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
 <87zfeojzr0.fsf@trenco.lwn.net>
 <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
 <87r000jvcl.fsf@trenco.lwn.net>
 <87iklcjul5.fsf@trenco.lwn.net>
 <20250604093653.7e2b88e5@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604093653.7e2b88e5@foz.lan>

On Wed, Jun 04, 2025 at 09:37:07AM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 03 Jun 2025 17:04:06 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > Jonathan Corbet <corbet@lwn.net> writes:
> > 
> > > I wonder why they used a border rather than the text-decoration that is
> > > there for exactly that purpose?  I'm inclined to change the CSS to get
> > > reliable underlining for everybody.  
> > 
> > Having played with this a bit, I'm guessing they went with the border
> > because the text-decoration underline gets mixed up with underscores in
> > function names, while the border sits below the underscore.

FWIW, I haven't tested it, but it looks like there's a text-underline-offset CSS
property that could be used if you do want to use text-decoration for
better semantics/portability but prevent it from clashing with the underlines
which would impact legibility.

> > 
> > Assuming we want to preserve that behavior, tossing in a line like:
> > 
> >   border-bottom-width: 2px;
> > 
> > makes those underlines (that I never even knew existed :) visible.  So
> > maybe that's the approach to take?
> 
> What I suspect is that this could be related to your monitor's DPI,
> and eventually to WM scaling. When you used a larger size, it became
> visible.
> 
> I would override CSS and replace a.reference to disable border and
> enable text decoration, as this is probably more portable.

Assuming the offset property I mentioned above works this sounds sensible to me.
I just wouldn't want legibility to be degraded.

> 
> Still, I think it is worth to have separate CSS classes for xref
> and broken xref, as if one wants to do a different decoration,
> that would be possible.

Yeah, makes sense, no drawback in having it really.

Thanks,
Nícolas
