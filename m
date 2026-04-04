Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5F28DB54;
	Sat,  4 Apr 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290759; cv=pass; b=FfXNtWB6D+aC+echGZcKUOcf8aAZ++aqaJAigaQCqrKScLv9ZYf0LWvwlG6KgiAB2oieBE67a0dxRoJH8Os3pa30KVCwt1pGr8WnI4yO6F1wBxwSYqwh3HpoUFEUfrwdEmIKPBu/7eYP++E0Mhi4hPeYJswsjSpqN6oPeGahchY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290759; c=relaxed/simple;
	bh=SaKfIjW8vX3Q/engn20cXzwO8cfm6GGUAaqtrFaxgWs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=C2GjOausukgOMW589LKjY7a0+zopoYaazR5a+GnNbkcAW/BI1/7ky6a34eM4HKVJEWiG5ZCECc+3ZGoIwsK+yxD87vK4dJf0hWfI3LQk67PsM/8UvsUXQ9iLOeuO2NwPWSOCT912OZLPXmWywloH+etMrCHC8+kcxzqCA21h9Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=e6AyQ3PZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="e6AyQ3PZ"
ARC-Seal: i=1; a=rsa-sha256; t=1775290745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DyrDeVz+7vLMBdrCIEjoFdNg5hInQt086O5A6HTMcZXSST6hFaLGHZyppYN1v+Cje2TJrIWkNQ3VgtjcorfW612rv1P6B9u3iz7CU9NakqkD12PRyu/CxEKSK0S5AHomFFMw/8+ieETerzRf3jrOPkvL1zw0MlEasRo2v+8eTsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775290745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SaKfIjW8vX3Q/engn20cXzwO8cfm6GGUAaqtrFaxgWs=; 
	b=LEq5YdSkz1y3847Ed6lr8K+seNU+onDK0EBCyw3THCEy7zNouLpAQMjes+DgMCkc8ClvcLHP3pcTbqwbzY34dN6xPEXPG44wAP+JGP5kIg6e4qMo9amFCdfYhWQDYNRIUinbFBxRTxAfTPazTjSJULWWUi6fnYHnSJtEq2GoRUw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775290745;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=SaKfIjW8vX3Q/engn20cXzwO8cfm6GGUAaqtrFaxgWs=;
	b=e6AyQ3PZylLac45GAuDI/4Y1e4mha95/Pr4QDpSPEkfVvxHUGkZwlMiIkcCgXKC2
	UPfLyr19Cq7Bk74T2RRcEFVpyI5ABjRMAKLXVoA5rmMlwJY+S0v+/Rdqgvz+SvJCUG9
	D5eg8P+sQ3r5RMSRxQCqzhmebvyRNqjS9IdiNhEA=
Received: by mx.zohomail.com with SMTPS id 177529074235535.514879746591305;
	Sat, 4 Apr 2026 01:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 04:19:00 -0400
Message-Id: <DHK81N93K4TR.1V7UIZW75JMI0@ritovision.com>
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
 <87h5q3g288.fsf@trenco.lwn.net>
In-Reply-To: <87h5q3g288.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Jon,

Following up on this point:

> I do not see the problem you are referring to here; headings wrap just
> fine for me using both Firefox and Chrome. (Firefox arguably does a
> little better since it wraps at "/", but that is what also make it turn
> "I/O into "I/
> O."

In my previous reply I sent a catalog of the environments I tested, with
per-environment screenshots for both slash-delimited and
underscore-delimited cases.

Does that breakdown help explain why we may be seeing different results,
or help you reproduce the issue in the environments where it occurs?

Thanks,
Rito
