Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDBD305E1F;
	Mon, 23 Mar 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292988; cv=pass; b=KjQrViYyAhMBrb7ZXiIwxq+/kMD9Oj9H9W0nhRkJY/xfzV2iYof7UvBbvVihHwcJG0UAvpF/mBPM7cAB6n+W2DF8043gQal8BK6wQJPkooZZWHlmWJzyFiQoEQzMdVet1xX9Cu/8jgQQaPuBm3YXDpjQcNyugE7Q6cob8AKvZsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292988; c=relaxed/simple;
	bh=xnqiJY8jCt5r9gJpU+RZ9AegwC6CiQZUa0mc4DIZe6U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=qBoZa+HucbCrHXvSBG49c+hchh1VdOXezXR/b9lV8SATZRudBGylnQrYswvV+eBa9G733wDGZ94LnwxQSi+gCPmpgMh2Bd4RMMVRy7NrOjiv8sEH17s9L1SevPvYVCq21qqr/94w+etH0zRfiq4ijltVqsYSi83Y5pKzQ74tlhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ImtjVocU; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ImtjVocU"
ARC-Seal: i=1; a=rsa-sha256; t=1774292982; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PsFwEyPww+nWRHWhz+0ndTu3UoPRpRFrty5QWV2kUHlZRp3bDmhaYAQ0sUvPwU8XK5fqyquMcTSbfLIifK9wZIXxSqpiog/eWZhiEjYxi9YAqhXCByB0CCpfMOtfgecJqeppi8ksPv3bhChlf36sJrPOqfiZOgLnaG8AO0s33YI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774292982; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QZ9NoNwNm4dcWlAekUM1kjLVxNu7vmFAcaQZ1mipPf4=; 
	b=b44yGRbm4FUyfDfQt9JdGxTTUkH0zlisJ1lVsiRKi6xdLbpNkwLUvfcH/i86qcw8tflNYL+yBIk3XEdA5ISmvMwgrmr9QA6I0HlPx441zJaz72xvaVL3TINEQjmfP5cAwVyHOcDSCvA6Xxn3wRI+cRcn1nqZiQPsVd2Iw5L6+FU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774292982;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=QZ9NoNwNm4dcWlAekUM1kjLVxNu7vmFAcaQZ1mipPf4=;
	b=ImtjVocUyUHp6VF4flPD/A39dzDxHzz42EqVXc6vSzmAP/qLJUVg1llAar3JpzMA
	kxM3IqwUgfc0m07dOJEsYE7sYhzeVOC9m/laYrprVrY8VMKPn4YSuvLARGzUeEOoKZE
	QvJqI9nxigwXMYzqmmfdSP/8pWWD4hRWdDq2Wb5o=
Received: by mx.zohomail.com with SMTPS id 177429298088229.697962065363413;
	Mon, 23 Mar 2026 12:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:09:38 -0400
Message-Id: <DHAED9XZZLVM.2GT0BOHIXJ7MA@ritovision.com>
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321124907.8524-1-rito@ritovision.com>
 <87zf3zd2cs.fsf@trenco.lwn.net> <DHACYJK8P7RN.MUHEBN0UC0LK@ritovision.com>
 <87y0ji9zbz.fsf@trenco.lwn.net>
In-Reply-To: <87y0ji9zbz.fsf@trenco.lwn.net>
X-ZohoMailClient: External

To be clear:

canonical URL + local build =3D useless

canonical URL set by env var + official published build =3D source
authority support

hardcoded canonical URL in the source tree + mirror deployments =3D

1. Benign mirror benefit
    Mirrors inherit a source-authority-supporting default without
    needing to think about it or configure anything themselves.

2. Adversarial / careless mirror mitigation
    Anyone who does not want to preserve that signal must take an
    extra step to remove or override it, adding at least some
    friction to careless or hostile reuse.=20

Hardcoding it is simpler, safer and more effective because it makes
preservation of the preferred source the path of least resistance,
requires any departure from it to be explicit, and costs local builds
very little without side effects.

Rito
