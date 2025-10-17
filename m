Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D04354AFE
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760742999; cv=none; b=sD5VLeWSUvDhJM7HRQBNo3ywEnr3sfgS6cEdJTbBhNkD3KNP0nI2jAi9Wa/tASIRWS43RzEjTe++v95G31JHW2V7KFa+/XDq4+iYcoBZyDEUM/bHxuI4nWuUVEgHRcsV/binvGJtcq9pgK33BHqk1mQ4wbG3O1c7BJ+dqiuuyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760742999; c=relaxed/simple;
	bh=mU8HygAOxChrrKnPhU5CLpDqdDkIg+qK7UyzyIgFzfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nvr/vGpN6H95F48wakCvJuLKx68qpqe15W5RCFE+4Qc2P90mNey9VJj9xtTv/Y3lTcvx9HYN+1caUxXVoiuFR5ok38qw8oxGCyXPkPS1L1oJfyx+sjzhHduFlUAMyulvPHEPyiHff/tDlpw0Xx4Fhy8+NooxmuG07HYGetgXBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GESQHoIV; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GESQHoIV"
Date: Sat, 18 Oct 2025 07:16:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760742982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zsaCSTBkvCC8AZjJASYTIRHzYsmkdKNpjDrvCtAP2Hw=;
	b=GESQHoIVyedanmBwuZ7ctgJkg1XEoI6zWGDLNRjOqqKnN6oZKbkH71WVzY/Mjq219JIcMP
	U5onFQHRhL5r7aBfNOc9jYNW6DBb5XAMiJrBDkiNXpxJuujAnfUWt9sDHDf8xBHRBf+Yzg
	60vDdu4AJA4J0yCW1P6lXCMHNwRQA5c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: GangYan <gang.yan@linux.dev>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	David Disseldorp <ddiss@suse.de>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, Gang Yan <yangang@kylinos.cn>
Subject: Re: [PATCH, v2] kbuild: doc: improve KBUILD_BUILD_TIMESTAMP
 documentation
Message-ID: <aPLOPnTQeh0VUlni@thinkbook16p>
References: <20251017021209.6586-1-gang.yan@linux.dev>
 <aPKe5KGR27robyc5@levanger>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPKe5KGR27robyc5@levanger>
X-Migadu-Flow: FLOW_OUT

> On Fri, Oct 17, 2025 at 09:54:12PM +0200, Nicolas Schier wrote:
> On Fri, Oct 17, 2025 at 10:12:09AM +0800, Gang Yan wrote:
> > From: Gang Yan <yangang@kylinos.cn>
> > 
> > This patch adds an example of how to set KBUILD_BUILD_TIMESTAMP to a
> > specific date. Also, note that the provided timestamp is used for
> > initramfs mtime fields, which are 32-bit and thus limited to dates
> > between the Unix epoch and 2106-02-07 06:28:15 UTC. Dates outside this
> > range will cause errors.
> > 
> > Suggested-by: David Disseldorp <ddiss@suse.de>
> > Signed-off-by: Gang Yan <yangang@kylinos.cn>
> > Reviewed-by: David Disseldorp <ddiss@suse.de>
> > ---
> > Changelog:
> >  v2:
> >   - Replace the invalid example with a valid one.
> >   - Apply David's suggestions.
> > ---
> >  Documentation/kbuild/kbuild.rst | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> 
> Thanks to both of you!
> 
> I have only found a tiny nit-pick, see below.
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> 
> > diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> > index 3388a10f2dcc..881189ecd0ca 100644
> > --- a/Documentation/kbuild/kbuild.rst
> > +++ b/Documentation/kbuild/kbuild.rst
> > @@ -328,8 +328,14 @@ KBUILD_BUILD_TIMESTAMP
> >  ----------------------
> >  Setting this to a date string overrides the timestamp used in the
> >  UTS_VERSION definition (uname -v in the running kernel). The value has to
> > -be a string that can be passed to date -d. The default value
> > -is the output of the date command at one point during build.
> > +be a string that can be passed to date -d. E.g.::
> > +
> > +$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
> 
> Other code blocks in kbuild.rst are indented by four spaces (and
> accidentally five in one line).
> 
> I can add these when applying the patch for kbuild-next, if that is ok
> for you.
Sure, Thanks alot.
> 
> Kind regards
> Nicolas

Cherrs,
Gang
