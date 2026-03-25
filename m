Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9A30EF84;
	Wed, 25 Mar 2026 20:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471838; cv=pass; b=LQV8Um3AhxsduaneDPzRTZuFYLETSxWPsWnJmmJmYGZY3/2WtXs8RAvTRD+vwC0mkmQqTkY4cHwHIGdFLoXzy4n+dR7Sy2Jtm+oMo/pWZW24Akl7IXcztbxPRhHpsvJvlZU8PuEpP8/9uTCGMh+m+AyANFvF9L6f55C6RgyZHgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471838; c=relaxed/simple;
	bh=jw2f76LEULJHsBTbW8cPw8kHugh1af9Ypx8Qd3Wrz9A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=aObrmmvMyAJxnesivxe9b6Ll6FrbULclFASO4ti3Xjeooxc81RFEj57ZuU/aCP34r3pKMa4w7mSsYCdWK6e4yXdYa16mBowFi9sSI1RNUKPwKm6XPAlgsDeDMlXBtPPDd5Kus59GW/qNufQe78pKNTYuBqA1ohnS4rnRlXFTux4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=OCQy3SWz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="OCQy3SWz"
ARC-Seal: i=1; a=rsa-sha256; t=1774471816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R9Py274hmWgR6hRL7wXf6MSgDsqD6PfIKZmzNYX5wfaPzCTH3gxGW29T8C1pohzJst07EI05PyFln7DWk5eCpO0ee7b7b/bRhFTNUX4R7DHv4lAUrvopFjPAGURbmOocu6oeEdG+MGvIGVXDZaTQLHHNe8hjUtsDZc/ON5ynRuY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774471816; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jw2f76LEULJHsBTbW8cPw8kHugh1af9Ypx8Qd3Wrz9A=; 
	b=e9ydFCqwsLjoFfWD7WUqnvitzDdrvDg63CWIuNPB04Yp2fOqWotrBi/1E9jOSUngcbsgxURu06PSIwRKI8HsI5MjmNbX7F8hiH+gT611d0YkqqMQp9zkWgezkwWoa5Xb/NE1m2ZJXk2q/RCwv9AFKK9Izll0FEGV4SWERtbnyeU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774471816;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=jw2f76LEULJHsBTbW8cPw8kHugh1af9Ypx8Qd3Wrz9A=;
	b=OCQy3SWz7PDerAyZuPsHz58CBT4BIKenIrxUgTCSBwUAS6iLMJQ+HtinzHqtlVDo
	qIImnOFGqiDbVmvr1KxhPU68KK0OLXq31YwetkFPTWi4gJM8U8E+hNPXglZ/xsP2dvd
	N6ej7XkOUIYwIew+K2BI7xOsOLJTsCpXzLtmHGVY=
Received: by mx.zohomail.com with SMTPS id 177447181340818.914452169873357;
	Wed, 25 Mar 2026 13:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 16:50:10 -0400
Message-Id: <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
Subject: Re: [PATCH v3] docs: contain horizontal overflow in C API
 descriptions
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260323153342.33447-1-rito@ritovision.com>
 <87jyuzg2fi.fsf@trenco.lwn.net>
In-Reply-To: <87jyuzg2fi.fsf@trenco.lwn.net>
X-ZohoMailClient: External

If you could imagine an optimal solution, what would it look like?
Can you describe the layout and/or behavior?

Maybe I can implement it.

Rito
