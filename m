Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6D3368BB;
	Thu, 26 Mar 2026 02:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492769; cv=pass; b=UMPm01sllpap2g2mtrv2cxRtu/oRUwX2/fJt6TzvJ/BpJ7yN/XVRerxMICQ/iFtipj2QKFdPuoE8mNcXPwaHvNSU7ucH0s0A/5769fHaNVPQoLa0PewzF06K31ECzGkU2LQaFgykPQ5dzOoeteplCH5HKbSr1nRvOe/zxwbFJPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492769; c=relaxed/simple;
	bh=e9mknAsaOOMVn7oaFGvJAUqbRFTMid7OklhaasBMRhg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=LG4AX5TKDHGC/Q2ak6HyPIHq4jV5RQAeOQE5NJPf/czbvUze4v+jkSIdPK9PlABAuP3cIWabyd9AeuOzHuLa6B46R0lDWGzqg8LZBCBh1FtSCp8ie80u0hID0bEYGeRCV+iJsg+ExXGBCbWXHPRwaCZ2NVISrGD8XkHtODsM37I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=PqSi3J+j; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="PqSi3J+j"
ARC-Seal: i=1; a=rsa-sha256; t=1774492738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kHFOfXs0bd44YeL/vIa+1qCWJbo5NQFmf9zNxP4qF5K0Rmr/WkHo/+p4gS5/9AfOHgysEL4b+yxkqB9p0bPnMaSivSmdW1dPy9KGqb2G5cm60CxXpEtrvl7h/ngknoU1NL+VxkVepuqUWT8l9gWzS3AEUUxChlW1ZK+BTnAAq5A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774492738; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e9mknAsaOOMVn7oaFGvJAUqbRFTMid7OklhaasBMRhg=; 
	b=HviQXpqulmQ3E6XEEsk5D2MQEuWELTWLnXodCXgceOGgJ94e2YJvFh/SzcNPThRpydMfsF2EKCT5NmBRBezJrOeMzr9YXI2tskTMiXSAp/qwVr/96wxpQc3L9m0jG3wuG6KzpUazwTrwUZGm6wFFx1/uQ7VBTfzOE4YkX86dlFI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774492738;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=e9mknAsaOOMVn7oaFGvJAUqbRFTMid7OklhaasBMRhg=;
	b=PqSi3J+jEI7MicTbC2Aqi1IKkeaphM02SLL4xO1+Pwq9JLqUyenewTujpwalmVsK
	XCYDzd9AEJ7g55QbXxovI9nmHx8YlNGbd6zbk89M0n0Jpvn5sazXoB27s35g07i7VVI
	M0T+pAvMI8vROuH766P269Vs+TqxjDAQlZ20vtjQ=
Received: by mx.zohomail.com with SMTPS id 1774492736160358.5188065979188;
	Wed, 25 Mar 2026 19:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 22:38:53 -0400
Message-Id: <DHCD6BWJTLTB.VJWKPRWC2GHZ@ritovision.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3] docs: wrap generated tables to contain small-screen
 overflow
X-Mailer: aerc 0.21.0
References: <20260321133811.17854-1-rito@ritovision.com>
 <20260323153723.34735-1-rito@ritovision.com>
 <87mrzvg2qx.fsf@trenco.lwn.net>
In-Reply-To: <87mrzvg2qx.fsf@trenco.lwn.net>
X-ZohoMailClient: External

> So this CSS perhaps makes sense, but..
> But why do you need to inject another <div>, creating a whole
> new extension to do so, rather than just applying the CSS
> directly to the <table> elements? I just gave that a try, and
> it would appear to work just fine.

I did try applying it directly to the <table> elements.

That works on some pages, but in my testing it introduces
regressions on others that do not happen with the wrapper
approach.

For example, on `/bpf/standardization/instruction-set.html` at
400px viewport width, applying CSS scrollability directly to
the table creates an extra outer border with an awkward gap and,
more importantly, causes cell content to wrap much more
aggressively as the viewport narrows. Instead of letting the
table remain a readable horizontally scrollable unit, the text
gets squeezed into very narrow stacked lines that are harder
to read.

Screenshots:
Double border with gap issue highlighted -
https://github.com/user-attachments/assets/0ddacc4e-edce-4c14-b129-0940e801=
4d3f
Text wrapping issue highlighted -
https://github.com/user-attachments/assets/c172e126-7a4c-4b3c-a01c-fd4c8f08=
bda6

On `/arch/arc/features.html`, the wrapping issue is not present
and it scrolls fine, but I still see the double-border issue
there. In that case there is no gap, so it mainly looks like a
thicker border.

The reason for the wrapper is that it gives one consistent
overflow treatment across the existing table cases without
changing the table element's layout behavior directly. In my
testing, applying the scrollability to the <table> itself
works for some pages but regresses others, while the wrapper
approach avoids needing targeted CSS rules for different
rendered table cases.

If helpful, you're welcome to add any screenshots as a
comment on this GitHub issue:
https://github.com/ritovision/linux-kernel-docs/issues/1

Rito
