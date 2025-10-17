Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB612D7DF3
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760690881; cv=none; b=apTM67oX7EGBoyOt8ufDLfib7e2V7v7rO/OyLMJNVS6o0ahVrq5wGe6Wfj2+AKIQtkwpJaRno1ZsZM4B1C4pOknYdkvQ9MeK4R9e+CP8KIdvNLIAVhCeA8sa9qMVozRGbkopitSGXbqtPnYXpqv2H1AgsTQVZs0cZRq8dcXhRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760690881; c=relaxed/simple;
	bh=6dFZuxwUBo4KrKKKo8Y7sB5UBL4XV+FeaMKUXkr8gQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfeHuu4Hnuh5vYCK2MsFejxlUeUVzHWL41Od2Vd/zbo44h/bL/W935Wgf/ljBC0F8oWGAnb07rOCPolADyAvYz5XyYuZyblz/dF6F8Nq0IfAWYqpuCqwbK3D2tCFn85pd+T/mw5/3TUHLP50EfUJlUBxNyfho1eg/rtkAj9mwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2kEI130; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2kEI130"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD0CC4CEE7;
	Fri, 17 Oct 2025 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690880;
	bh=6dFZuxwUBo4KrKKKo8Y7sB5UBL4XV+FeaMKUXkr8gQc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D2kEI130LKfVSwfhIuNvnqnoXlipE8cFfs170ug620keyy6fLaqr3IL/y3WGU1yrj
	 YNKb1PMN1/xHNkDGyH/2vB+vYJzbbnNMaiAqv0MiUN2K5Eh7CDvbguNq/O7qeJ7JcR
	 GSjUv44I/GfHmIwP/DerRjouMqR7DdSQ7l3H5+Wz9+LU3ho0yr2G1ldwbjxfrifoUW
	 GXrAqD/UvC6Iz1xtjfgKnodBMxBpyrfpOxJlDts7ONV+QphxsGnzUh2l06Q/eGio6T
	 IV0ndCZv0c6aSA8OkueKN3Vk0N/ZP4CAIGrGyCLaHNH4EjvyoScrClSw3zgVFC8mlX
	 5yeWMYGQNAP/A==
Date: Fri, 17 Oct 2025 05:47:51 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: parse_headers.pl ?
Message-ID: <20251017054731.54fe573a@sal.lan>
In-Reply-To: <87ikge6gts.fsf@trenco.lwn.net>
References: <9391a0f0-7c92-42aa-8190-28255b22e131@infradead.org>
	<87ikge6gts.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 16 Oct 2025 08:50:55 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > Hi,
> >
> > Documentation/doc-guide/parse-headers.rst talks about some
> > parse_headers.pl file but I cannot find such a file.
> >
> > Is there a replacement for this documentation?
> > What should it be?  

Good catch!

> Mauro deleted it in aebcc3009ed5; clearly there's some docs work that
> needs to be done to finish the job.

Yes, it was replaced with:

	tools/docs/parse-headers.py

And its library:
	tools/docs/lib/parse_data_structs.py

The command line options changed a little bit: 
- it doesn't have anymore a --usage
- it gained a --toc option.

While it still does what it is documented there, it received some 
improvements during the conversion, and has gained --toc.

I updated its documentation at the source code on both the library,
with is about the same content of the .rst file.

Some of those changes are on a patch series not merged yet:
	https://lore.kernel.org/linux-doc/cover.1759329363.git.mchehab+huawei@kernel.org/

I'll seek for some time to update parse-headers.rst to reflect such
changes.

Regards,
Mauro
