Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D1E2D2496;
	Sun, 22 Mar 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774199312; cv=pass; b=QQ3vsGJflv627P/pqm3esd9maerM7wbiEQ24g/j/NtHRcADTz0wrwl3o70glPl1wzZGtGDxYIp9Cz7CjVkJzaIciLVm9COKjmmcwns9yNjN++iOSBI0a5bdXcZ+MkMvezBZ6KVm29QIzt2hGs7G54U+tCcM0duE4qfyRoq8Pt4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774199312; c=relaxed/simple;
	bh=0rZ+VKR4j/UyfrgG8fRIOJB2/i5qvONKu6P2Q/+ET8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=UQAxE4F1XgLTrEmp7yhwod3DPQrxSEPSX/rslpFryGisA7cJAFaT7W9F7rhpwL9fB5LcrrDIDTCX29XyTuf9zcu+rlry1C3tLvwT4hjmTrdoiFAcggiGJ74qKk2z8DtHFR3YsnUVXvWJAf1c2KWsEwP2jQAnkKcQ29Jz2IO8oBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=l9t17HwT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="l9t17HwT"
ARC-Seal: i=1; a=rsa-sha256; t=1774199304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wf5OH80AbH7kRaMUhk02jKONRYgCjomhIB1Zl5PubIcx/qHUphT++98LAZGalvqIgD9DTx04l6OC3MmLAqEMBaxomu3Zz5DybollBxqV8GI5t/4QKnkhoVQ7c3+YsJ5zqjpWrbzsBQayXnM80Uk074jSoGWk4N+SqSJntXlB1Hw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774199304; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0rZ+VKR4j/UyfrgG8fRIOJB2/i5qvONKu6P2Q/+ET8o=; 
	b=SE//CKfCHcg/jRgifoLS3RxTJdY40Ep5Eq1lNFldSGJS1/3QY2uq71XHt7NpSIV33Y7rUB8oPK13htfE+eUsDjSTUFeAKVRtgbpZlMVxGO6YQjePIZfWwQ0NjH7WBEVGIO+NdVNsIatpJWTwkuYxsGy19mfiRiTixTzETtRkOvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774199304;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=0rZ+VKR4j/UyfrgG8fRIOJB2/i5qvONKu6P2Q/+ET8o=;
	b=l9t17HwT44Ily+GGz94+ccg9H993Q08DHfIhjb8V2EwoKe4QJ2kQAwgmGemBeRLI
	xMkpCoBaQi8U3iesVrMOmIC48r31QM855li9dMYYK+w0D5RgCrmVE3+R24jrjw7nQUd
	9vjq5wGm4VIE3uQEPAZDH6iGGmN5DRFtBAd41bNI=
Received: by mx.zohomail.com with SMTPS id 1774199301893514.6267438471627;
	Sun, 22 Mar 2026 10:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 13:08:18 -0400
Message-Id: <DH9H5TPM3W0J.2XCBEY9U8NQF6@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <87cy0vetu7.fsf@trenco.lwn.net>
In-Reply-To: <87cy0vetu7.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Hi Jon

> Documentation/process/coding-assistants.rst

That was my oversight. I failed to include the appropriate
coding-assistant attribution/disclosure, and I will reroll my patches
accordingly.

> I'm curious about where you are going with this in general

I am not contributing as a kernel developer. My background is in
front-end engineering, product/UX, and developer-facing documentation
and platform surfaces, and that is where I believe I can add value here.

Linux is important infrastructure, and I have already been making
related contributions in its ecosystem. In trying to improve
lore.kernel.org, I contributed patches merged upstream to Public Inbox
for small-screen layout behavior and for enabling admin-injected meta
tags in the document head.

After my Git patches for gitweb mobile responsiveness were merged,
I prepared a kernel.org mobile-responsiveness patch series
(current theme is only built for desktop and breaks on small screens).
Since there was not an established mailing-list path for merging that
work, Johannes Schindelin introduced me to Konstantin in an archived
thread, which opened a concrete path for contributing to kernel.org.

More broadly, I have worked on improving developer-facing surfaces,
including documentation and related tooling, in other OSS projects.
That is the kind of value I am aiming to add here: not direct kernel
development, but improving usability, discoverability, and developer
experience around important technical infrastructure.

Rito
