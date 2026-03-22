Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671437D101;
	Sun, 22 Mar 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774209548; cv=none; b=OZZe81yEyTlokk5iP+0Dx/eVHhawzL7FRDCjG3lVeVFb5xjQoKDdt87Ld3xi0DrsinjQTQHINarzmYTHCvBRiSEm8vDFdjR9ZGco2oSkrPWbAlABcxfCHvMUqxy2J8eaXjSpzeIyA0ysNznVulj2jDzzebHMUUvDgqonYq9rtK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774209548; c=relaxed/simple;
	bh=/hIIuu1Eg4QqmEWMOlTu93hgTQslVerMvJcv8uodius=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejbbPqhr+XyMKIFBMiSlABQB6b959ht4Ktp5R6bUmL2jOY3RGERr317mXbCIH4XTXUj7FOhOXs2KBJkTscFSZs0H/OTQsZGncfm7YW/1zMzIC7QxI7fmaxTW0pjNRfPh7CnLztfkt84NyU/uGlx/664PORDBfKb8yhjNt60uVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vyhfvJMU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vyhfvJMU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=82O7j1/FjWEHv9L2QiVtFHF5pWhwKr0vUuOC3qBkMgk=; b=vyhfvJMUftk7NViHE6uzk7CQQk
	Xi9uDQAIEIHZM5ApCeawk94WJQNMTowHKiGmMfjgl1z3DBeTTKruGP2XU++Mxr5Kd8R2LjEgSi5N6
	hPZ/UYHzdExZCrGZst8HpCk3Djb2c/ca1LMCi4JlOBVvD8732K8AtSFzitSCAIlY6eX6Njf4L2nl5
	FxblStl646MBF4NtfZY8P8TSEJpVFfNd3baPvZT5QH9gvcz4bePm7KWrOa32oXgDB+66hKN67T4TW
	Mk5P2BwQqfeqbDrEny/CiELxEQ5mtuUbIsYxOg/Xkdtz/a42EpDOucM8ci2bb5nHeyZ7RyC2kwIt2
	VC/MR/kg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Owz-0000000FcQh-0bsp;
	Sun, 22 Mar 2026 19:59:05 +0000
Message-ID: <4620a35c-5293-4973-aa71-49046fae9911@infradead.org>
Date: Sun, 22 Mar 2026 12:59:04 -0700
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
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
 <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
 <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 6:12 PM, Rito Rhymes wrote:
> I was using the in-tree build (`make htmldocs`) before. I just ran
> fresh rebuilds with both in-tree and out-of-tree (`make O=DOCS
> htmldocs`) builds, and I got identical search results of 280 hits for
> "futex" when serving both.
> 
> I ran the builds and served the output on Linux/x86_64, and tested the
> pages in Chrome, Edge, and Firefox on Windows.
> 
> So at this point I have not been able to reproduce the "no output"
> behavior with either build mode, I think we can rule out build mode
> quirks.
> 
> More debugging:
> 
> As a comparison, WITHOUT using my patch, upstream only build, does the
> normal Quick Search work? What results do you get for Futex?

Yes:
Search Results
Search finished, found 225 pages matching the search query.


> WITH my patch, do Quick Search return any results for Futex?

No. Just a search dialog page with no matches listed.


> How are you opening or serving the generated docs? For example, via a
> local web server (`http://...`) or directly from disk (`file://...`)?
> I am serving the generated output over HTTP locally via
> `python -m http.server`.

file://...

> What Sphinx version are you using for the build?
> I built with Sphinx 9.1.0.

8.2.3-4.2 (latest from openSUSE Tumbleweed, rolling updates)

> If possible, could you also check in the browser network tab whether
> `_static/kernel-search.js`, `_static/language_data.js`, and
> `searchindex.js` are all loading successfully?

They appear to be (this is new to me).
They are listed and I don't see any errors associated with them.

-- 
~Randy

