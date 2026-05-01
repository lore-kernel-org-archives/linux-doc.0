Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429B37D10A
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626416; cv=none; b=gAElEt59S2i9hYqlqFbPp2NeBY3YEgY+v/uo+MVyfbrJ+ijQV28fCQtCAyNrF9v3AWJAisKAHJYiODHDkXdaGJXYas1FeO4x9mnG3h6BYUn8lwW2ChS8zub+7x2Lk/dWemOYdcTi0fXcB73nvAXsqcQxwBvikuaEfH3p2eC9TkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626416; c=relaxed/simple;
	bh=5bpykIlYFSbI7ZN81EUe3sk1JDZNyJ+jgkYUxfGVYIk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dvEk3EGE2wOinOvFi2IelCl3PSP47nNnfBCu80qvE2yJ7A1ad+kGYzz5LE8+WH2Fwvw+3XoQ4HoV+QducasfS8+bXGdTQcHRWnxjQYkqZxbxVuMgQiY8theusu+QS85QeG8pibyCtLjvegC2RQu0F4RgglEhM8W5i9FG+zioPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aZsTTAWV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aZsTTAWV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5643140C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777626413; bh=D0DJSAzD7GxvPxASWC7ptINlipt3HDSrHwDvZPd/bco=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=aZsTTAWVj2pJzL7Nj0Ky1Bq0wjbS2tXEoq2lte6y4SxDtxCX3pQWCBdIPwNKibcEu
	 7pba8EKMYD4+UYCxeGwtB/Di0mNdhbv7hdqFIvO/D8o+oBUwx/DPDfaGJpVm94NKWu
	 Vxmv3IfnuQnvTqPjdyz09e2YEWe6dHFjOB7XgsNWrgAFnQ0OdwptR8D1qFJVQNnsEk
	 6qHCt4jhGIfdnqIhW2jqBC8/d5uJMU8yvia4ZaOAQpcBBoUhdxGkiWFNdGSdrAmFxr
	 CEiL5pttOo59+XJycBk+pomP9bsfIGl0uOKBg+Haa2ueI4S3r1vQeP6j2q0Wv/CbM5
	 UkG/V+xMtNxag==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5643140C79;
	Fri,  1 May 2026 09:06:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dewey <thawentha4@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC] Interest in contributing to Linux Kernel documentation
 (French translation)
In-Reply-To: <CADWiQPK3kC5ymXsdYT6tc7qH47THfY=LpBSW3=dcGNO2Fi_p_A@mail.gmail.com>
References: <CADWiQPK3kC5ymXsdYT6tc7qH47THfY=LpBSW3=dcGNO2Fi_p_A@mail.gmail.com>
Date: Fri, 01 May 2026 03:06:50 -0600
Message-ID: <87cxzffqhh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dewey <thawentha4@gmail.com> writes:

> Hello everyone,
> My name is Dewey, I am a software enthusiast with an interest in the
> Linux kernel. I am reaching out to the list to see if there is any
> interest or an established process for improving the documentation by
> adding or maintaining translations, specifically for French.
> I understand that the official documentation is maintained in English
> and that keeping translations in sync is a significant challenge.
> However, I would like to offer my time to help, whether it involves
> translating specific sections or helping with the automation of
> documentation generation.
> Could you let me know if there are any current initiatives regarding
> translations, or if there is a preferred way to contribute in this
> area?

There are a number of active translation efforts; you can find them all
under Documentation/translations/.  There is currently no French
translation, though.

Starting a new translation is not a small effort; it requires a
significant commitment of time to keep up as the documentation evolves.
This is generally not a project that a single person can be expected to
sustain over a long period.  I do not want to discourage you too
severely, but I do want you to be aware that this would not be a
drive-by project.

"Automation of documentation generation" is a bit of a worrisome phrase
here.  Kernel documentation is for humans, and I don't see much value in
shoveling a lot of LLM output into the kernel tree.  If your plan is to
upstream a bunch of machine-generated translations, I would suggest
looking for another project.

Thanks,

jon
