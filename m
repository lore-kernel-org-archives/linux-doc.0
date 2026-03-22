Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73CF33F5AB;
	Sun, 22 Mar 2026 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774181710; cv=pass; b=J3KCEZ/RDHsnPzrddrm5F6i3Fd6UF7/zHLu5XCce2JgFZL7TVcXY742y2kAJ9jfosv94ji4FzlgqyaJfC2vm58+7me+MUbVl544WHcHBu9+R+zUyyAckbf+55fN4TJePTi3mPJ93FgfLoBAAe8REALLO7Ds0bwCSQXJtjeSOLfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774181710; c=relaxed/simple;
	bh=3/qwMXxO7JUHqwLSoct/KqoIk9oiwHlkPAuEd8p73a8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=JGjl0y2pk62Wp816T7rAwhYNMqNObEe4+GKV/OR8+kK50rW4/EDc5PZfV+z9hDNdpyifreHEKiEekyTOSBysguY+YPWLQ7rI2zEkrEyR43qRFUh3QF3hv5Sb7ttsSa/5xkskn2Ismbh4z5R3WEy5zeyAe/DiTbEShuKkeKMfE8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=HtyM7t8L; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="HtyM7t8L"
ARC-Seal: i=1; a=rsa-sha256; t=1774181697; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ar47Ijmc5/11vdyGfW4dz4EM+K70ktFAcL0cTfCFisbuP5zWZ3reb1cN7xZWi0My4LHQcFb47tTvrZSlqaqCVRVe63mMvFL233eQNjsKc5K0fsVIs0TwcjjBNsKbaWoqkb99BfXdolCvPGHkX1sD+F5x1jUI7mzAQ6rF/5c1Tv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774181697; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3/qwMXxO7JUHqwLSoct/KqoIk9oiwHlkPAuEd8p73a8=; 
	b=moZiBO15jSu4mCFFQH3nJwRTupmweEJBy8LqFljEYvz4+BMHsMIAkxwkPV6cAOovMwCmr7XkAhczEn6J1DnFAstY/gdCr2yPC6fWyrulv/80TA8H/FMcfN8ibWOMn0wlmO31hEKApBBfYX3YuNtoEiPm8tColi1zoQbkBUCZ97I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774181697;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=3/qwMXxO7JUHqwLSoct/KqoIk9oiwHlkPAuEd8p73a8=;
	b=HtyM7t8LdT0Hdtn6NlMDarwQhIgC8bR7JhM1dGdB8ffGF9QM2HyzdEYTPAYVkhpQ
	i6ASOrRYJbD1fpzz6T5VkoFP7Q5jSs+rs8CWvGyEDiAa2UA6UgiET1fDu3t5JEl/mrr
	Qc7CMJhyK0Fz/BFqH9wbCTZEkMpfLPOxwSwBh/S8=
Received: by mx.zohomail.com with SMTPS id 1774181695372209.37175484687805;
	Sun, 22 Mar 2026 05:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 08:14:52 -0400
Message-Id: <DH9AX5UKDIXH.Q8NWGNIUI82X@ritovision.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/1] docs: examples of pages affected by heading
 overflow
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <f81edf19-9b33-4935-904e-636afa4dad79@infradead.org>
In-Reply-To: <f81edf19-9b33-4935-904e-636afa4dad79@infradead.org>
X-ZohoMailClient: External

Thanks for testing things out and for asking about the logic behind the
implementation choices.

Is there consistency in the solutions chosen?

Those 4 patches are not a single series for a reason. They are targeted
fixes for distinct contexts and use cases where one solution may be
preferable to the other, i.e. wrapping vs. contained horizontal scroll
overflow. They are logically consistent in that the reasons for the
chosen solution do not directly contradict each other across these
contexts, but they should not all be treated as requiring the same
generic behavior, such as wrapping everywhere or contained horizontal
scrolling everywhere. I also did not submit them as a single patch
series because I did not want each patch to have to justify itself
against every other patch as a single thematic unit, because the cases
are very different even if they share an underlying symptom (page-wide
horizontal scroll overflow).

> docs: allow long unbroken headings to wrap and prevent overflow

Why prefer wrapping?

You found an unfortunate edge case, but the core regression this fix
addresses is headings pushing past the right page margin and creating
page-wide horizontal scroll overflow that breaks the page layout
instead of wrapping.

The edge case being:

GPIO_V2_LINE_GET_VALUES_IOCTL

Modern browsers do not treat underscores as natural word-break points.
That whole string is a long unbroken token without a natural breakpoint,
so without the added wrapping behavior it will create page-wide
horizontal overflow on small enough screen sizes, as you can test on the
live site.

So semantically, it looks like a regression to see

GPIO_V2_LINE_GET_VALUES_IOCT
L

instead of:

GPIO_V2_LINE_GET_VALUES_
IOCTL

But that is still the expected browser behavior. It only looks
semantically incorrect because the string has internal structure that
the browser does not understand for wrapping purposes. It is equivalent
to taking a long unbroken string like:

GPIOV2LINEGETVALUESIOCTL

and getting:

GPIOV2LINEGETVALUESIOCT
L

There may be semantically parseable words in there, but regular browser
wrapping does not know that.

So this solution does come with a trade-off.

Long unbroken strings that have semantic shape but no natural
breakpoint, including code-style names, will wrap unnaturally.

But for the majority of headings, wrapping produces clean shapes where
the semantic structure is preserved because there is spacing or a `-`
somewhere in the heading.

For headings, having everything immediately visible without requiring
horizontal scrolling is the preferred trade-off. It is tolerable for
headings to wrap differently across screen sizes, whether that means 1
line, 2 lines, or 3 lines. In most cases, however many lines the
heading wraps to, it remains readable and semantically preserved. I do
not think it would be a reasonable trade-off to introduce contained
horizontal scrolling for headings just to avoid the edge cases
involving long unbroken code-style strings.

Thus, wrapping is the appropriate choice here.

With that said, we could go a step further and add JavaScript to help
treat underscores as wrap points, but I do not think that is ideal. It
would be client-side post-processing, and I do not see similar
non-Sphinx-native JavaScript being used here for this kind of text
shaping. I am open to that if people think it is worth it, but it would
be a new precedent here and not a standard web approach.

> docs: contain horizontal overflow in C API descriptions

Why prefer contained horizontal scroll overflow?

For this patch, contained horizontal scrolling is preferred because
code fidelity is the priority. The code is isolated from the rest of the
page in a dedicated block and presented in a form that is intended to
remain representative of the code itself. Wrapping distorts spacing and
line structure, which affects fidelity, creates misleading renderings,
and reduces readability. Therefore, wrapping is not a good trade-off
here.

> docs: allow inline literals in paragraphs to wrap to prevent overflow

Why prefer wrapping?

If preserving code fidelity were the priority here, the code would not
be embedded inside explanatory prose. The purpose in this context is to
read a paragraph that includes code as part of the explanation, and it
would be distracting and hurt readability if the user needed to scroll
horizontally mid-paragraph just to continue reading. In that context, we
treat it like any other `<span>` inside of a `<p>`.

> docs: wrap generated tables to contain small-screen overflow

Why prefer contained horizontal scroll overflow?

Wrapping is generally not practical here.

Many of these tables, often under a `*/features.html*`, exceed at least
double the viewport width of a mobile screen size. Wrapping the cell
content enough to fit within a small viewport would often create
unreadable vertical stacks of wrapped text. Having the rows or columns
reorganize themselves in some way to fit the viewport would
fundamentally change the table structure and how it is intended to be
navigated, which defeats the simplicity of keeping a single table
structure for many purposes.

The simplest solution is to respect the width the generated table
creates and allow horizontal scrolling within the table container,
without allowing the entire page width to expand.
