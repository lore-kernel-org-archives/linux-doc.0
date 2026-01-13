Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7782C241690;
	Tue, 13 Jan 2026 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342241; cv=none; b=T+oZdWeFm946ShggHiRuxtUuxadICsspkSqrG0RZ8c8Eu2tFSKOSa4WOpRrJ+1/6lZS8TbG00jZrBmn68U4lyBWwG/E+4E8iAGbQiGVDdcdZAHKHft4zdh2Od70RsGcVkfbZ/cP4DOEPumI2Pwbm02ai4kuGhFl3kWwrsVB7W5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342241; c=relaxed/simple;
	bh=x/cY1en+jbTWnP0WHB3Y30BIf+4E6M3H1MYJX4CpAQo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYnahblTbxbZb82DxhXiR9aWAhILCk/xXl1IAl9PkvA/qonvB5bXRekJKNgFyzC/gliSW98Azx0d89iNEwLP5KToO56XlDSbnbXKOekDQC+hAfWSsDT8W0Oct7mQd1I+aoT0iUqZ8HETk8OejvuHIctibhN9wcJ6lYI3dlpt+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCO62U5Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCO62U5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99929C116C6;
	Tue, 13 Jan 2026 22:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342241;
	bh=x/cY1en+jbTWnP0WHB3Y30BIf+4E6M3H1MYJX4CpAQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HCO62U5QzNICgpRCqXcX9a45Ytrt05ixidPUDt9Y6yx5qjpo/CW6EBCYeTuzUokxC
	 5kjT6F2nYMo7wG70lfTFoONj/fLIgXZWc92ojoj+i/huXH/A8sF8AblUotQDPJT7Kw
	 thAJ3kELZDtqr9gxSWiAFk9Yd9pjPYHcq/l4UKlFArE01v45JFrYimktlKinhF182i
	 WNgqeEsuFXyDDnfJ9aPKAr6XiOE9M5tSgCdP49Klqci1C//z52t9BgrIStJc4V36By
	 u+JY0l13OKfmUN7AY4vT5Id81b2Z5T5qTypvni6C4ThWrpdurnVSfmhA47G0sX2+Yu
	 sxzFnZC5k0vWw==
Date: Tue, 13 Jan 2026 23:10:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc
 comments
Message-ID: <20260113231036.0b10f4a9@foz.lan>
In-Reply-To: <20260113224943.3e8b014c@foz.lan>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
	<434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
	<87sec9w7ux.fsf@trenco.lwn.net>
	<20260113224943.3e8b014c@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 13 Jan 2026 22:49:43 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 13 Jan 2026 13:55:18 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>=20
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >  =20

> > "flowers"?  Did the LLM put that out too? :) =20

Heh, asking it to be funny and use figures of speech gave a funny
yet precise description:

<llm>
	There are hidden gremlins and linguistic shadows lurking in the
	kernel=E2=80=91doc.py comments.
	Summon them with the aid of an LLM (gpt=E2=80=91oss 14B), executed locally
	like a sorcerer=E2=80=99s spell, using this incantation:

	    review English grammar and syntax at the comments on the code below:
	    <cat scripts/kernel-doc.py>

	The oracle did not yield a bouquet of roses; instead, it revealed
	a handful of wilted blossoms. Gather the radiant ones, and toss
	the withered ones into the abyss.
</llm>

If you ever see a patch description like that from my side, you can=20
be certain that it was a LLM-generated one ;-)


Thanks,
Mauro
