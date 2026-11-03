Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705832;
	b=bSTq2MQLa6tXTuANQnaj4ZwGZtkWb46GP4dR9G9KhUrAsVWVwXbJ2FCoUytXEbp1xAcC
	 UjHBPjll/BWs4EFnDMF/9TwJKxsmA1qeggUB69LnTYCu7SxMZD0PMGC64bTOHGESHQIxZ
	 RwNRV+xztI1sP6noQnFcPkzU2/U6ApQsuI6A5mH485EuFShPraf17MeKuNsHxuwP6FKTE
	 oS6eS/4yRus3vLD3FdseIKyjD7efeCDddK9zuSQAI/YoP7IB80ryCue39Mny2Ue8DWNcf
	 kWu8rTAiEh53gHPOX64Y1UwvxNcPwXcYboglTruqQ2pNpcZ+2NJBO/4JBevsSEuXpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705832;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kTRoHbntaqnndGjH129vXretNlBYX8gFbRCMh4VaxMs=;
	b=MOdUbc5WJqT0O3fJFNqyW1WrskJcGKLHmpjKcVAauiB+Ea9lavekTSEtmLKilSh5W0bY
	 cpwOfb8YzEqYi2gsV8lZH/OfosoCGX6ZCSi9JtgR/JiV200HbmgpYV7ofPOpIEiFk2SDB
	 86VW1b3T76dUEcbX33MX3Pi+DA0jdVbL3WL/U+2YoHy4NRp0rBFT8wMAac/n+NikCVIoy
	 E+ttUBzmMu8GiDOnO4ZAcpiNE8L/vGYfOuAd3gPSz71OyfxD0K8djvuPfujnBzCfha5ZD
	 p90quZ5qhKuhpMbFBgryHmAYyUp8yrkaNbsJJQu+xi+g3zi3dj3ar7j+reCbsxVDsHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=UXK+OYFm;
	arc=none smtp.remote-ip=95.215.58.3
Received: from mta1.migadu.com (out-3.mta1.migadu.com [95.215.58.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BD606EEAC
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 11:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08BD606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=UXK+OYFm
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p4HR613kc1KeED90M+lkiRrn86yWtAiyyB8MCLzTTh0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793705827; v=1; x=1794310627;
 b=UXK+OYFmOuW9ikpRuskEzdEe3TJyvY+wvrL8+OseutW6eib6VCMYwRjnNkhI2TA/mjToHDG/
 HtAmPkfP0VpTbfbzQZD+KXq29XTaXEyGN7g+4cgP+5fjypmrr4iq7v8iCPJaxf+E8clokpIYaqz
 6u6mm4/9gXLkGWZwznbXWm/t4LE5tj09iM3TyKXlF9SuPgc8vpfNyDwfUWpTqPvNRuYI+3qdeqJ
 AIqUC/YjHESmVgMz2JAPyuSLxzVUEZTxfww+nzR0F1PUvXl3zKDlTLs9+Qi7vtMYWKIKd34XzUr
 WRA7v1EyYEF5uNG4ToCANi6PG8kE7MSjqfOlqi7r7n2BQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06a3a3eea0a52372;
	Tue, 03 Nov 2026 11:37:07 +0000
X-Mizu-Trace-ID: 06a3a3eea0a52372
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 19:37:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yan Zhu <zhuyan2015@qq.com>
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
	mic@digikod.net
Subject: Re: [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
Message-ID: <aunHXtl-L__1isgc@wyuan.org>
References: <tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com>
 <tencent_7F10C2E7BB9C4B842554D6E95DE5D1DBD806@qq.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7F10C2E7BB9C4B842554D6E95DE5D1DBD806@qq.com>

Yan Zhu <zhuyan2015@qq.com> writes:

> Ping
> 
> On 6/12/2026 11:58 PM, Yan Zhu wrote:
> > This patch series adds the Chinese translation for the Linux Security Module
> > (LSM) admin-guide documentation, including the main index and all ten
> > sub-pages: apparmor, LoadPin, SELinux, Smack, tomoyo, Yama, SafeSetID,
> > ipe, and landlock.  The admin-guide toctree is also updated to list the
> > newly translated LSM/index.
> > 
> > The original English documentation was restructured into reStructuredText
> > by Kees Cook in commit 504f231cda56 ("doc: ReSTify and split LSM.txt"),
> > and each sub-page has been kept up-to-date with subsequent mainline changes.
> > 
> > 
> > base: https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
> > 
> > 
> > 
> > Yan Zhu (10):
> >    docs/zh_CN: add LSM/index Chinese translation
> >    docs/zh_CN: add LSM/apparmor Chinese translation
> >    docs/zh_CN: add LSM/LoadPin Chinese translation
> >    docs/zh_CN: add LSM/SELinux Chinese translation
> >    docs/zh_CN: add LSM/Smack Chinese translation
> >    docs/zh_CN: add LSM/tomoyo Chinese translation
> >    docs/zh_CN: add LSM/Yama Chinese translation
> >    docs/zh_CN: add LSM/SafeSetID Chinese translation
> >    docs/zh_CN: add LSM/ipe Chinese translation
> >    docs/zh_CN: add LSM/landlock Chinese translation

Hi,

I suspect that your series was long since buried in maintainers' inbox,
because your actual patches are not "In-Reply-To" this cover letter.

And I do remember I mentioned it elsewhere that it may has something to
do with your QQ email server.  I suggest resending this serie after
fixing email stuffs.

Thanks.



