Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7ED259CB3
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 07:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183246; cv=none; b=m+NbvlJ9OOipAD2hbsx1oceFjqzRg1rkBNlAmYILMl6dPkljxaMKGjGYSm077wte2p+kwANF2jbPxK/2OaFzQ9hEQ0aMzga4gAihbHDL8fKRNAqWZOo/lJMJ/RM8/GtXrtcFpLzBMacCZuOjsdVo1dSpiwF9a/ISf3IQ0ylfJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183246; c=relaxed/simple;
	bh=hscdu0Dgz2LbZkUxkm9t+OeWU0K2cN/gANelvthj6rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9S9sVdpSOvTf4H6JtISp2VJWLtybcwHkYMlZj0yhG0m0ECMF6HQGtACEWxG0loiBdfn2fVdM/DD7rmMxEyvYWa2v1iZAJRfWmBtJI/ekEQIXMetLkLHjqTuBq3ydZqY3dRBj2ol9TOQCA4s8JLyN02Z9oO5gXCtcQCrdSromgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=RPJsrqw6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eQU1ly1u; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="RPJsrqw6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eQU1ly1u"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8811E254029E;
	Wed,  9 Apr 2025 03:20:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 09 Apr 2025 03:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1744183242; x=
	1744269642; bh=rEMv1Rb0dDdu94LHkhT4LttV2bkwFU/dexXKJDcKyMM=; b=R
	PJsrqw6Czg8E0pGLD8q2UNvID/hjV7aXmUlO2TTM0bUAKcf+5+ZIAyL0JbDZSFyF
	CmTQCtYrKs51/xOy5nya0n89Z7QQXVIX9jLp6Lss0UGkhoI0jfjvJ4JyEud0VHqr
	34ytsF4kDGxtReMRsy2F7eVscEK9j33n/8ZDpRrkBTARpxckeN0apFfRBsb5NLZ6
	5053WCdBNKKPmsCcQY1R7kAMfzX3945AjM24i/qxchtKVzDU3Op3INT4cG1K/tN+
	ut6C3UQIAXHBg95Ip58fXULsyVrXXzeCUdLQ36WOTyOXIvrjWzw6Dq899vfKPH6B
	1TspS7C6TS/RGTVwMYE/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744183242; x=1744269642; bh=rEMv1Rb0dDdu94LHkhT4LttV2bkwFU/dexX
	KJDcKyMM=; b=eQU1ly1ucDIYVnusyxp5l+LSnZPwEctFGizRXGXP0ZHEfIBPIWW
	bN4LGM2ueHzlKlh4s0JWENC6rhAPia2a5K0KcY4QEeS8hgN7L1wz84e9dWgXFBdt
	teoTAOCn7fMt5pagdF7e2yt+cBZnB3bNNmXr0tmXV/A+ib6gQzOmtb6fv6xjw0se
	+7k9EQ6z3I/Ea2DbPREqUGoso2J0iQ1icT3mPCMxn/KusAM0QSJ3qXypalqH9BY+
	w1OgffzQhTuHyx8gv/SzGIWcBGAjrOrlKjmvSi+EBHy69nJ2j7eYxxdvY14kZnwt
	sgD1YgVdMr60gLmPwI7Qr36T3BpdO569c4w==
X-ME-Sender: <xms:yh_2ZzHM0s8hQeME5yTu4dw0dkARAIZ2flBzGTYWXpu4EkgqRxo-Ag>
    <xme:yh_2ZwUTV-NEzL6MTK8xPti_Wtk3_wDTm9bcuKTigAdvcAkOEyBQ-DNxYA5qQ37W3
    K7JJq6PHeIITSHJKLY>
X-ME-Received: <xmr:yh_2Z1LvJd2HvOk6tBgFJEsYPdAFxSrZJslIenFpznrAcZDHiOzAANuDK2RciBIIiU0xww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeduledvgeehhffh
    tefhveduhfelgedvtefggefhfeeifeetfeeliedtheevfeeukeenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhphhhorhhonhhigidrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhhoshdrrghlshgrrgguhiduieduleesghhmrghilhdrtghomhdprhgtphhtthhope
    hlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yh_2ZxH-pT4QkNn3OnZi-2ly6KVHkXeJWMRfFOZWOZSOfchi95uEhA>
    <xmx:yh_2Z5U34AB-YZYLPgHN4-gjnQLgGEARWGOh_vtE0HX8pxisBTjsLQ>
    <xmx:yh_2Z8MkqsXknUMXn0a3cP3DLrs839PIhlTpn_9xyrvm0mRBlxPI2A>
    <xmx:yh_2Z41q2nY3SKMixG0tPQZf5s8XJCrmMkHAvt8fFrdDXi8KLKOaQw>
    <xmx:yh_2Zww9WjyC0xh9C1U3wTVB7TSHH8SzP8P3RI9wL65TBkg4qguP3_yF>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 03:20:40 -0400 (EDT)
Date: Wed, 9 Apr 2025 10:20:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Moumal Al-Saady <mos.alsaady1619@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: X86_64: Obsolete 5 level paging config flag documentation
Message-ID: <utls2ku6cbotugvd5rhsw6apglmlff4wbea7xjrq3lgijwhh2s@uavhfxh7wf6g>
References: <CAJu75abi1gcn78k+srTPNOFRDsyxrgc8_uW9R0EkFxVV3S9Qww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJu75abi1gcn78k+srTPNOFRDsyxrgc8_uW9R0EkFxVV3S9Qww@mail.gmail.com>

On Tue, Apr 08, 2025 at 04:43:29PM +0300, Moumal Al-Saady wrote:
> Hello,
> I was wondering if 29.3.2
> (https://www.kernel.org/doc/html/latest/arch/x86/x86_64/5level-paging.html#enabling-5-level-paging)
> should remain in the documentation, considering that from 21st of June
> (https://lore.kernel.org/lkml/20240621164406.256314-1-kirill.shutemov@linux.intel.com/),
> the config flag was removed, and unconditional 5 level paging support
> was put in (https://www.phoronix.com/news/Linux-Unconditional-5-Level-x86).

Except the patchset was never applied. So there no need in updating the
documentation.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
