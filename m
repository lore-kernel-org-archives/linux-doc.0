Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F063A8749;
	Thu,  9 Apr 2026 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725506; cv=pass; b=k0u97FLbQuTkmLdaCqcaQaI6RjA4lx8OktiNgtTQVB3SHNXqA4vsK7uv1psAvdRbsaXLa5q21TA60vJmXHzPuPkjjmQhtfEHJMcsXtk3tfUu5qeOGUQlYyxhGkGBHJvXJTNIdf8SCR/7m0Kz7kSv0LALXNVShSX0w0nUYd1vV0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725506; c=relaxed/simple;
	bh=RclaI04mZqN6Aico8uzYWJHmyPKQA2XEwBonjPiZ7bM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=GjT3pe/s0Y0/3k0vZBkRzptLrELm38KPwde+ah3gkVjFe3g1FYdpuc+SbZyOuB33al+K7XxFNEPI5rU7AzEILfJOH5aKXvQNRo7rkNFUGCZLTCcSycqCDMO9I4kzWlpw/KJRXswweVU44EQqQKGAQ5nv71yiFfBhj3gy619wqPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=a4Xlhilo; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="a4Xlhilo"
ARC-Seal: i=1; a=rsa-sha256; t=1775725489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kfWZQT0QYTp++8iel8iYkRkx5Vp7myby49GoTAAdfdnMmkA6/rPLoZ5rvWtW7Xx7VAoyFEXaR6vwFn7qpBEfFth97HYkUHRWgo+pnkS+EWphME8R9PpXGkaADeCu9WlJm9/cxg9BRMkw/1aPNL/Xn1XpVzvHbYCYF83pwLHTn3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775725489; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RclaI04mZqN6Aico8uzYWJHmyPKQA2XEwBonjPiZ7bM=; 
	b=EOTkpFEkZn22fNHtVoexKsgx0CAlOFF0wnwTjtQdQ6tC5Govf2x8cDHLMnuS3UmDoagt3siVo8I4a88ehEq+sSGpeWDyiiseUkOQ25aI5v9QwWYGmf/blAnuFKTfSk4Kw+gPHmZDzTgZfuTxY/ekAI3lIyVkBl3iaFBS5ziHyKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775725489;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:Cc:Cc:From:From:References:In-Reply-To:Reply-To;
	bh=RclaI04mZqN6Aico8uzYWJHmyPKQA2XEwBonjPiZ7bM=;
	b=a4XlhilozGgU60RPzq5BTVzOerVdVoArQtTOHr5jvqV/jSTeyBKTAs03a/pkplWT
	jv3jKRGWLSYZ2wVLcfMZSx+ha2+N9voCIIy9oUBu/xoDYfTeOv6ey4+OKZMHrBIZrtK
	X/HIla0SVFIgTr0nCPglJmr0YP0wDm1RJ99IgDHc=
Received: by mx.zohomail.com with SMTPS id 1775725487257646.3152450524256;
	Thu, 9 Apr 2026 02:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 05:04:44 -0400
Message-Id: <DHOI5DYYBXEN.3MWP1RMB6ECES@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>
Subject: Re: [PATCH v3 0/2] docs: advanced search with benchmark harness
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <DHK7FY79AOJW.AC6LHU703AIR@ritovision.com>
 <b3c87ef0-5faf-4bda-90e4-e6b24419e0c0@infradead.org>
In-Reply-To: <b3c87ef0-5faf-4bda-90e4-e6b24419e0c0@infradead.org>
X-ZohoMailClient: External

> I like it. I think it's useful -- the old search could give a bit too
> much output. The search result tabs (groups) are helpful.

Thanks for taking the time to test it out again and give feedback.
I'm glad you see potential utility for it.

> I mostly use 'grep' for searching Documentation/ and I expect lots
> of other developers also do that (if they bother to look).

That's definitely what I expect kernel hackers to default to.

I'd like to get a clearer sense of your perspective, it may represent
others too, and I can weigh it against my own assumptions here.

So my question framed for you is:

You know a particular concept you want to look up, but you do not know
the exact file, and related words repeat a lot across the source.

Could you imagine yourself going through grep results, not quickly
finding what you need, burning mental bandwidth and then deciding:
"let me just go on docs.kernel.org real quick, hit the advanced search,
and see what I find"?

Is that something you could actually see ever happening?

Maybe even, in that type of situation, eventually defaulting to that
mode first to avoid spending time scanning through noisy grep results.

Or is grep and staying in the terminal a comfortable enough place to
remain even when the results are not very fruitful and the time spent
there is not especially efficient?

Or does that situation just not come up often enough to justify a
separate mental workflow for it outside the grep norm?

> I do notice under the Pages tab that all of the pages listed say
> "Summary unavailable." I don't know what should be there instead of
> that message.

It's supposed to be populated with an excerpt from the page related
to the search criterion; 2-3 lines of text or so.

I encountered that same issue after an incremental rebuild, doing a
full rebuild fixed it.

Could you please confirm if it works after a full rebuild?

Rito
