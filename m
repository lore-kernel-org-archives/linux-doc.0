Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350B224CC
	for <linux-doc@vger.kernel.org>; Fri,  8 Mar 2024 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709863308; cv=none; b=FGHK4Pij4OCD3+bI8+BD5E7Q5qPT1zoznKSyLCzrZ1MZQT7i0TiLXVLrvaTXUytGfI5opziSUkbuen1iQwQG5nmODZCkOD51ReT8UruCpLg3EiTO9osXre6lFOewcgisIk6DuQhZ0GYC/h3W53ZMFr/+JjESCUhaKNORyvEdyzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709863308; c=relaxed/simple;
	bh=F7I3HdsW44kwqagxk+2YKkBBy0apmcboI8dXuBmiWJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnryClwn5i4yYfCqV1p+vFNtpHv40ycux51mr1GxEgAlEYs+a4kxfBgdA58yqd8B+BK0khyFs3fwADrKKgdBXqseIabDgGv3EnmdD9uH0FmVA2G8l1E4C1xE7eO/kLODSpC/jHV243/si6ufQuT+r0uTNDf6/40mSqzWoOyr8nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nNnh4f5P; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nNnh4f5P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hyM2qSh5XPizIsNS7DPgFDH/2aYodUixQsNDNJ/TUVQ=; b=nNnh4f5Pbr8SOFp35U2Hvxsfzn
	uUo0me5CYp4nd3tnF4Z3Y/G/T+OtbRuWWO0Y3YDSXOTD4bLDRygh2QHaCabpcAROJZK8RL/6/IzQg
	hBBw3DC0kwkmGexl1xLdwlkZ83Vk5TQvOZChRrOpsIfPmlnf/oiNPKWgkf3enH5llGcQYKCpah2Je
	co7wmiXzw5EZ7l3r+XtJ2ps4/KZGUGa0PzbIqBwUiLMk3hOwO9kcWEiqJ9TkzJdFQzCU9QjUZrSqy
	/dqSgPdZqnPraXnOFEpG35DyZilyaI9ZuubF3nYTqo7QaPD1jgeD0vYfC3nniQ7WuEazNmzkZr2fu
	K/x4pdUA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riPYL-0000000ATS1-1WXt;
	Fri, 08 Mar 2024 02:01:41 +0000
Date: Fri, 8 Mar 2024 02:01:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Breno Leitao <leitao@debian.org>
Subject: Re: "make htmldocs" fails on v6.8-rc1
Message-ID: <ZepxhedWhIew6kOT@casper.infradead.org>
References: <ZepmLrvGC2fXA6vC@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZepmLrvGC2fXA6vC@agluck-desk3>

On Thu, Mar 07, 2024 at 05:13:18PM -0800, Tony Luck wrote:
> I can build htmldocs for v6.7 kernel sources. But not with v6.8-rc1.
> 
> Error comes from /home/agluck/GIT/mywork/tools/net/ynl/ynl-gen-rst.py 
> which fails to include "yaml".
> 
> I'm running Fedora39. I have the python3-pyyaml-6.0.1-11.fc39.x86_64
> installed. I also tried "pip install yaml". But still get the error.
> 
> What package(s) to I need to install to get this "yaml" python module?

https://lore.kernel.org/linux-doc/20240208205550.984-1-thorsten.blum@toblux.com/
> 
