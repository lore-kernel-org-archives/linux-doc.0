Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D60387347;
	Mon, 23 Mar 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259869; cv=pass; b=NrP3Ps7mhdAiCjaqPZD0JhQcYWtljWRR0r2Xp0QDx3j/rsklCJXpLh1P40s+GEk9tkx1FTAYFCdYyDRqy7XN1fzkkx4Jtj3lxhr+OPa2y22PHYe13R7P7zK2N0VYKTqwZbvlXIMZJKdlZR56QjYTLjjYfbAuJXd6+vSLaJj+z7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259869; c=relaxed/simple;
	bh=hJUxfGUSHiaElRZYzXglO2jCav3ZlOnkwh4WOSBrvcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=HDJ05vpfouEsdnjqekaiDhQ4CBI5o6Eov0Q84mpBg09xTtnIuJarTrp3U+Cr4ObPuZD3Cf59NE7wEGQ/eqJcER1k10f4J5QI3qyqbH4/7BpBjKWJ/dy7CcHpzqir3G+xCC7a6qTq24y6iz9ejp+w5+3OM/07Rr3PRY8asBQQEkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=kshbpdY0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="kshbpdY0"
ARC-Seal: i=1; a=rsa-sha256; t=1774259848; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GF9uO5Bl6leTD0NiT4z2qVunlCAEFAIZDN+2dg+kOZinGOU1eR7aNi7Ur8W6V7v3zyUX5XszLmfugA/b7/ncJ7EyEpaDM9Bn3+Yu3gt89AvMEXFbF1mcEHN4M3rSrjmFrRXq8G+zoF3luDkWif5CNefv0A6XtBPvwveV0LFIDbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774259848; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hJUxfGUSHiaElRZYzXglO2jCav3ZlOnkwh4WOSBrvcA=; 
	b=h5kkoq8xUIQu39H8Ss+jvKEEO03qgAWl3JvkKUyZM2tCOWm4Kkk/pZZzXrNB8kP6Ubvmj71NWUxyDnz1+h3ep7fboNx17jKzHyYiY3svOteYwbI/vdAkqyOLFCqUd4WpxoY0QL8hyNNPJXOFWVCA3i1CDua84aQ9IW+geXKegPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774259848;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=hJUxfGUSHiaElRZYzXglO2jCav3ZlOnkwh4WOSBrvcA=;
	b=kshbpdY0KeValy1cofO/sSYhF0yN88feMcvoKbeM35VMejdDTMP95w7wG243lbp0
	piH4FNklN1CfCfbyztE0yNnxgQcwHXmSXpNe1kOsLmOpIXLT7YFkyvm3gt+lixK+hEz
	8p8RaA/HbFPSCwWPD/QOwoN+s64AX6A3ezVl5Tsw=
Received: by mx.zohomail.com with SMTPS id 1774259846072979.4009215937739;
	Mon, 23 Mar 2026 02:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 05:57:23 -0400
Message-Id: <DHA2MFSL71FH.1Z930JBKI8AOE@ritovision.com>
Subject: Re: [PATCH v2 0/1] docs: examples of pages affected by C API
 signature overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260322193740.68784-1-rito@ritovision.com>
 <874im7eh6e.fsf@trenco.lwn.net>
In-Reply-To: <874im7eh6e.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Thank you for the feedback.

I'll put some examples in the changelogs with versioned URLs and
reroll them without a cover letter.

> The cover letter tells reviewers what the series as a whole does

Admittedly, I knew including a cover letter for a single patch was
non-standard. Given the quantity of examples I aimed to include,
I didn't think it acceptable to include it all in the changelog, but I
knew having the examples was important for testing, so I repurposed the
cover letter as the vehicle for including them. I'll lay off that.

> In this case, some examples of the problem being solved are certainly
> warranted, though perhaps not so many as given here.

I'll scale it down to just a few for the rerolls in the patchlogs.

FWIW my rationale was clear:

"Is this issue a significant enough pattern to justify the risk of
regressions and the review bandwidth required to address it?"

^ I thought it was important to preempt that question given the size
of this repo, assuming layout issues aren't exactly top of mind and
that the potential changes may have systemic effects to consider.

I did an audit for each of the layout fixes and resolved that if I
couldn't find 10 instances of an issue, it would not be worthwhile or
defensible to push. As a first-time contributor here, I figured showing
a concrete list of examples I found was preferable to a take-my-word-
for-it description of each issue's scale while showing only 1 or 2
examples.

> The names of HTML files are perhaps not ideal; since you're
> talking about docs.kernel.org in particular, you could give URLs
> that people could view directly.
> So for example
>
> https://docs.kernel.org/6.19/core-api/genalloc.html
>
> Note the explicit version so that the problem will be findable in the
> distant future, even after the fix is applied.

Yeah that approach makes more sense; the versioning anchors the fix
well for future. I had used neutral HTML file names with local user
testing in mind where the canonical domain wouldn't be used now or in
post-fix source trees.

Rito
