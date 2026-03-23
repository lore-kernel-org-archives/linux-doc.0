Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDC25393B;
	Mon, 23 Mar 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289012; cv=pass; b=ufJ+HpzDC4/g2uZ3SQiRNHgvTSj0x2vqMRs1UJqW92qNBES/f5EWqB5VXNaR0XnE6/GHtqEx1PAoN9DOQDonlacRR+HAK3QPnnCkSpeHS7oVblPT5eqSUw7k7TP5MXOkESwuGcOizXQQx/UvgC7JAWEwX8zcYqSRe5nKAdataC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289012; c=relaxed/simple;
	bh=ai+EoesyTdHXfmhbMzIXr70494VGURvNP8mgwK/M71Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=VikI9oHu47c92anBom+IZdZizWxICJhi0fmrFSxvcKFVUewbnr8hWTEPyk/Mw5e2BgqV+CDKs0Pi4jmglg9PpRT6KIPug42OfPUs5V9WPFvDGXg+rRlI+qOu3UTDhxnMb1/gLzTdCBipnmfwhoDhId2yCa8mqIba6PHz5WDtLS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=i2sfRzay; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="i2sfRzay"
ARC-Seal: i=1; a=rsa-sha256; t=1774289007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A0JrKVw93g8HHkU8Vi7mwO7U9vIAHJKxmex37K906VZHHOgkU4q7wJKaEgQGKH+o11uDZi18rkLFIsWWQKS+YO3pJruXlSpXcTRASA3vtv4M/SvAO5uRzx8tAEnJ/rW5cLzcyMr5yaCzD/jdWb6/f5l3fXWFQDKELiDyzfAxfIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774289007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ai+EoesyTdHXfmhbMzIXr70494VGURvNP8mgwK/M71Y=; 
	b=g8eWwsefXWfyIoM5JmTIGi95zpIZdB0ytbDu0Zc/0U4ideOC2R0K/V1j0ffI2bLyWqYR/XRSdBjYokpVOV9Lt/n1Kop818P2lgut9y4MtM/1B+/hHLFQwM2cVdenfE4FHNR7o7DmsLK8QaIN7sgKAnaToS/6ZHXapjyefFSCEFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774289007;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=ai+EoesyTdHXfmhbMzIXr70494VGURvNP8mgwK/M71Y=;
	b=i2sfRzayAPRA8pcdecP3dipm6d2WuaRVbJBL89Tqirs1zxod6HELbewdfQe+Z3sR
	cVjGcktWad6lJfPs+gYpVuEQgx9B9N6b1L4D2Hg0q52cdH71dTWK/vnoCN5GmHxDh/O
	GBNEURWZabmsJLEtQ/ZAsCr1Y9wtdEFvFd24IiXI=
Received: by mx.zohomail.com with SMTPS id 1774289005287120.87340766694092;
	Mon, 23 Mar 2026 11:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 14:03:23 -0400
Message-Id: <DHACYJK8P7RN.MUHEBN0UC0LK@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321124907.8524-1-rito@ritovision.com>
 <87zf3zd2cs.fsf@trenco.lwn.net>
In-Reply-To: <87zf3zd2cs.fsf@trenco.lwn.net>
X-ZohoMailClient: External

This is about protecting source authority in indexed search results,
which Linux kernel documentation very much exists in already.

Linux protects its trademarks, uses official marks and domains to
distinguish the project=E2=80=99s identity from copies and forks, and uses
provenance mechanisms such as sigstore for verifying the origin and
authenticity of software artifacts. A canonical URL is a different
angle to cover.

Indexed search results are an important distribution surface for
documentation, and it is also a hostile environment. For a
project like the Linux kernel, where its material is widely
copied, mirrored, archived, rehosted, and referenced across many
alternate paths and contexts, the stakes are higher and
protecting source authority matters more. Given the other ways
Linux already protects project identity, canonical URLs are a
small low-cost measure that supports its source authority for
indexing providers by indicating the preferred official URL for
a given resource.

The documentation site appears agnostic toward search engine
indexing because it neither opts out of indexed search for
compliant crawlers nor explicitly adds directives aimed at
optimizing for it. By being on the open web and not opting out,
it by default participates in the indexed web as a valid and standard
distribution surface for documentation. In that context, if
the site is part of the indexed web whether or not it actively
courts it, then using a low-cost standard signal like a canonical
URL is simply part of managing that reality responsibly.


> ...and how does it help all of the people who do their
> own docs builds?

You accepted the favicon fix earlier but you could argue something
similar about it:

"After someone downloads the Linux repo and runs the documentation
site locally, how does having the little logo visible in the browser
help them? Without it, will they not know they are viewing the Linux
documentation site?"

They are clearly different but what's in common is that they're
low-cost signals supporting the Linux identity on the web.

Rito
