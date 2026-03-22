Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461574C14;
	Sun, 22 Mar 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207768; cv=none; b=hNfX6DsRnE3Toigx2yvePzi1vg4G9PVNMpoUpNIhbpdbo4GQviwoM1qMJz/qV/bsesg2dRP6AKj7dGt4vH9UUXipvXZAf0aWB7/fCgt4z3zNRZISmBnnkFWuoXDF4CzCsR4P7J7LIItwmIM4JbwZhVtFh4Buuw7mB11cUj2SLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207768; c=relaxed/simple;
	bh=rljp0LrhW6QeJNeEXwnga10UDShCpJ5wGuhC5OeNub4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFhrdeUcw/leDdXdmwp7sTDgGr04LXkxGVw1Kxw3kYxt3h1FDe+aaHKqXYb5h8pXsai61HE/oOUSYLo+4MaJi+5Njf9gF47SoPXL+R9MUQfzp5YbG/7YiW1dYFMaePl4MwfGQjcNWi6y2kFadZ8gOKPEiGcb28ZPIwwNE4wsTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1zAEh18z; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1zAEh18z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wg3s8CcDc+GWO/7nh9UrpaSaa2nAf0tYpKp5lq1R4Ek=; b=1zAEh18zMnns9MHzX7P0l7QqRI
	gNrJL7GZYxiMGmemzNtqLhel/Ej3+iq8r7yJ9F1mBE1JLECk6CYq7ZPmxEx2Zgd9fCOEzluNpxnpZ
	ufjjxTqn0m3RGckED4ea98hvHok1ouPR7LBUTltK67YWHk37xMbYe06uyvYA0SMMNpshZ0Y/S2Fdw
	Q39Jjbr4g0LEu8TFnBAVi2LDneXFUqLRHJpB/v6PivrSgbZtEAtiwvcyCsN5vG2mpAZuV4zdPh4kw
	DjOBblXgEWQfZ08StglGDSS5bFjMQ7jm/z1871MDecX+sq52JbP+IIdxV9XBeFL/MsbHVOejWwwdj
	ARTNqTrQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4OU8-0000000FbQx-4BB0;
	Sun, 22 Mar 2026 19:29:17 +0000
Message-ID: <ac4d4ec8-90d5-48df-96d4-38de535a6a9a@infradead.org>
Date: Sun, 22 Mar 2026 12:29:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] docs: examples of pages affected by heading overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321144855.30429-1-rito@ritovision.com>
 <f81edf19-9b33-4935-904e-636afa4dad79@infradead.org>
 <DH9AX5UKDIXH.Q8NWGNIUI82X@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DH9AX5UKDIXH.Q8NWGNIUI82X@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the explanations.


On 3/22/26 5:14 AM, Rito Rhymes wrote:
> Thanks for testing things out and for asking about the logic behind the
> implementation choices.
> 
> Is there consistency in the solutions chosen?
> 
> Those 4 patches are not a single series for a reason. They are targeted
> fixes for distinct contexts and use cases where one solution may be
> preferable to the other, i.e. wrapping vs. contained horizontal scroll
> overflow. They are logically consistent in that the reasons for the
> chosen solution do not directly contradict each other across these
> contexts, but they should not all be treated as requiring the same
> generic behavior, such as wrapping everywhere or contained horizontal
> scrolling everywhere. I also did not submit them as a single patch
> series because I did not want each patch to have to justify itself
> against every other patch as a single thematic unit, because the cases
> are very different even if they share an underlying symptom (page-wide
> horizontal scroll overflow).

OK.

>> docs: allow long unbroken headings to wrap and prevent overflow
> 
> Why prefer wrapping?
> 
> You found an unfortunate edge case, but the core regression this fix
> addresses is headings pushing past the right page margin and creating
> page-wide horizontal scroll overflow that breaks the page layout
> instead of wrapping.

Yes, I understand that. And in general the patch is a good idea,
even though I observed that edge case.

> The edge case being:
> 
> GPIO_V2_LINE_GET_VALUES_IOCTL
> 
> Modern browsers do not treat underscores as natural word-break points.
> That whole string is a long unbroken token without a natural breakpoint,
> so without the added wrapping behavior it will create page-wide
> horizontal overflow on small enough screen sizes, as you can test on the
> live site.
> 
> So semantically, it looks like a regression to see
> 
> GPIO_V2_LINE_GET_VALUES_IOCT
> L
> 
> instead of:
> 
> GPIO_V2_LINE_GET_VALUES_
> IOCTL
> 
> But that is still the expected browser behavior. It only looks
> semantically incorrect because the string has internal structure that
> the browser does not understand for wrapping purposes. It is equivalent
> to taking a long unbroken string like:
> 
> GPIOV2LINEGETVALUESIOCTL
> 
> and getting:
> 
> GPIOV2LINEGETVALUESIOCT
> L
> 
> There may be semantically parseable words in there, but regular browser
> wrapping does not know that.
> 
> So this solution does come with a trade-off.

Yes, I wasn't trying to suggest using underscore as a break character.

> Long unbroken strings that have semantic shape but no natural
> breakpoint, including code-style names, will wrap unnaturally.
> 
> But for the majority of headings, wrapping produces clean shapes where
> the semantic structure is preserved because there is spacing or a `-`
> somewhere in the heading.

OK.

> For headings, having everything immediately visible without requiring
> horizontal scrolling is the preferred trade-off. It is tolerable for
> headings to wrap differently across screen sizes, whether that means 1
> line, 2 lines, or 3 lines. In most cases, however many lines the
> heading wraps to, it remains readable and semantically preserved. I do
> not think it would be a reasonable trade-off to introduce contained
> horizontal scrolling for headings just to avoid the edge cases
> involving long unbroken code-style strings.
> 
> Thus, wrapping is the appropriate choice here.

OK, sounds reasonable.

> With that said, we could go a step further and add JavaScript to help
> treat underscores as wrap points, but I do not think that is ideal. It
> would be client-side post-processing, and I do not see similar
> non-Sphinx-native JavaScript being used here for this kind of text
> shaping. I am open to that if people think it is worth it, but it would
> be a new precedent here and not a standard web approach.

nah.

>> docs: contain horizontal overflow in C API descriptions
> 
> Why prefer contained horizontal scroll overflow?
> 
> For this patch, contained horizontal scrolling is preferred because
> code fidelity is the priority. The code is isolated from the rest of the
> page in a dedicated block and presented in a form that is intended to
> remain representative of the code itself. Wrapping distorts spacing and
> line structure, which affects fidelity, creates misleading renderings,
> and reduces readability. Therefore, wrapping is not a good trade-off
> here.

I see.

>> docs: allow inline literals in paragraphs to wrap to prevent overflow
> 
> Why prefer wrapping?
> 
> If preserving code fidelity were the priority here, the code would not
> be embedded inside explanatory prose. The purpose in this context is to
> read a paragraph that includes code as part of the explanation, and it
> would be distracting and hurt readability if the user needed to scroll
> horizontally mid-paragraph just to continue reading. In that context, we
> treat it like any other `<span>` inside of a `<p>`.
> 
>> docs: wrap generated tables to contain small-screen overflow
> 
> Why prefer contained horizontal scroll overflow?
> 
> Wrapping is generally not practical here.
> 
> Many of these tables, often under a `*/features.html*`, exceed at least
> double the viewport width of a mobile screen size. Wrapping the cell
> content enough to fit within a small viewport would often create
> unreadable vertical stacks of wrapped text. Having the rows or columns
> reorganize themselves in some way to fit the viewport would
> fundamentally change the table structure and how it is intended to be
> navigated, which defeats the simplicity of keeping a single table
> structure for many purposes.

Sounds messy.

> The simplest solution is to respect the width the generated table
> creates and allow horizontal scrolling within the table container,
> without allowing the entire page width to expand.

I see that Jon asked about provenance of these patches.
I meant to do that as well but got wrapped up in Advanced Search
testing.

-- 
~Randy

