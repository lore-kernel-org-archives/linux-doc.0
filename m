Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB0621CC71;
	Sat, 21 Mar 2026 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774133588; cv=none; b=dKR+medL4KSlvr0MxTTjjwBLgFW3emmztY9THMCEkxEArlNitG3eL6YUMidCcq/60cvmQNuAziOCd5PqXzUgumiYlus1Y0a1da+B5uHkk1Ve65a4MyyMFZQC618tkyogQCp6Fwd/mKEwqprIMaSpxhR7evjZHLrE2azO1iHYEhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774133588; c=relaxed/simple;
	bh=BJtAIGvhLfDFpAgMDOuExbC/T0Q9rxlDO11Irdb8oUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/ijh7mHUt1hSxng5Q0j90ZiBe2aP8c6lyah2EG3d81hza6urLSczU2mcaX+BqaOVBQynVu0TpRbQn9F2IjlUOofbaxlE+wnV7oCCnCLWqvBBslLO04dq2x4VD24kYW0aMo2j0NInB69Ye9mrR96cyM0UCLEcQ3WZweBikNQfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r3JS7ocd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r3JS7ocd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9W3u2KmuB9Yt1FX7/S4MOcdfb5b093gBnRij8XERhVs=; b=r3JS7ocdl0cvRoWcVSrI1AZcl/
	I8wkg6zv7FFNBufG1PQukNnC1/BciGpjSsPQ8JvhR3Eq8BAcvU+5UzNKjeQcHRNu+HQThWMCS66ou
	anG4VtO08hYwrRN/7MF/4TPbtEQGC5ZB8WTmaJS0QqIMuHA3TC/H/s/gjIAxL7a5YI/dmi+HETaLs
	ggjjMZ3uYeMOF4RErNJTkeCeXipzmQxmmAtyXmNQAr8PaHma3DpuyGkGt37aRlQwmvMgH2Dnr+DVB
	zWLxFLe8b9SfSGp9nYRyUEBuJCnERfl37U5T3PHkN93kkXHecjBwxrF4zCZUavGJcQxDiu5Mm59P8
	cVPmnIrA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45Bn-0000000Er9H-0K40;
	Sat, 21 Mar 2026 22:53:03 +0000
Message-ID: <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
Date: Sat, 21 Mar 2026 15:53:02 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321181511.11706-1-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321181511.11706-1-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/21/26 11:15 AM, Rito Rhymes wrote:
> Replace the stock Sphinx search page with one that reuses the
> existing searchindex.js while adding structured result grouping,
> filtering, and exact identifier matching.
> 
> Results are grouped into Symbols, Sections, Index entries, and
> Pages, each in a collapsible section with a count. An Advanced
> panel exposes filters for documentation area, object type, result
> kind, and exact match mode. All state is URL-encoded so searches
> remain shareable.

Apparently I need more help/instructions. When I click on Advanced Search
and get that web page, I enter "futex" into the Search Query and click
on [Search]. I am leaving all Advanced Search options at their default
settings.

I get no output. Is this expected?
What am I doing wrong?

thanks.

> Page summary snippets are lazy-loaded via IntersectionObserver to
> avoid fetching every matching page up front.
> 
> The sidebar keeps the existing quick-search box and adds an
> "Advanced search" link below it.
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/sphinx-static/custom.css        | 163 ++++
>  Documentation/sphinx-static/kernel-search.js  | 746 ++++++++++++++++++
>  Documentation/sphinx/templates/search.html    | 106 +++
>  Documentation/sphinx/templates/searchbox.html |  18 +
>  4 files changed, 1033 insertions(+)
>  create mode 100644 Documentation/sphinx-static/kernel-search.js
>  create mode 100644 Documentation/sphinx/templates/search.html
>  create mode 100644 Documentation/sphinx/templates/searchbox.html


-- 
~Randy

