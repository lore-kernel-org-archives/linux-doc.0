Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EEE3985A
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914828; cv=none; b=RrIN2m0w9B78H+1EwpSuI32OIuXebGIHa/UkFpJSKMNyEvI97qUpNtqa4AsmictduXO18xTTrTjt2OAFtlh949oipolDhSC/EAwsmBTf3RJYxJeLfeBAw3tx8ci+02xmAwUJC73vRCPunXgVQPKdQb4Cz7nBdWqF7XofCjLHpk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914828; c=relaxed/simple;
	bh=Muw/ACCv40YRXAtPheo4rhlX6lZbF3TpLGVe8sZ0xFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gatL3UZizLxWVQ8qbUrpKpHkna0gpiFjq4LEhLxDEt5dsh3obVU+LPowcgVJni7fsl8D3cpJH6apRWcuzgl73fTW5m69+A0g+KNcckapsy4K2WnsO8bSXwcA3d7LeaH1hsHWVHpN9bm3vi3JyzD0wFSRU9/M1lnbm9a4PGo8Lgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KlFjXxtK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3iWzB/qB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KlFjXxtK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3iWzB/qB"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705914824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJXPsJFvgUAe10RlMHM/1lq6TXeHN4Z+QzN2R9x8u4=;
	b=KlFjXxtKXc/yYQ3JnkRQDYqTYVG+0Y3TUWB9nLigc8B3Sms6o3Pn688JaBnQgJrYcATedh
	vJ95+znvSJooPebwlT/KfxJZ+ewUQpXsC7RLR8bvkf5ymwcRoZep5T0sTDUANkDy3ve9xN
	NrbgAU3+6RSpuGO/9HLp17ZuZcfn+8PT1iAp3UtSOH0XcKUt6ZSfgxuqllGDrvZ1W0GqkX
	MBbUHteE+PSNcxA7QJAZ5KzBY5Gd/SlxWLruFf4kPJyews5dZlmU0BgxdTXD6Aj6Y8Z8XK
	DvKbNH5f7voYanagA22rxYEsyU/ixkVmWMOVF7YE7sRuK1L/4zfwTiB9Y+103A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705914824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJXPsJFvgUAe10RlMHM/1lq6TXeHN4Z+QzN2R9x8u4=;
	b=3iWzB/qBo36Q1D8j1qacC2COwiF9ycupFeWSqRx8XeaoKYe0PGyfBqFaQQx4ZdONjQ7Z7U
	9BXeO9xDf4EE+TBw==
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 1/2] drm/vram-helper: Fix 'multi-line' kernel-doc
 comments
In-Reply-To: <87frywqrbc.fsf@intel.com>
References: <20240116151456.48238-1-anna-maria@linutronix.de>
 <20240116151456.48238-2-anna-maria@linutronix.de>
 <87frywqrbc.fsf@intel.com>
Date: Mon, 22 Jan 2024 10:13:43 +0100
Message-ID: <875xzlzq60.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Tue, 16 Jan 2024, Anna-Maria Behnsen <anna-maria@linutronix.de> wrote:
>> Reformat lines in kernel-doc comments, which make use of the backslash at
>> the end to suggest it is a multi-line comment. kernel-doc is able to
>> process e.g. the short description of a function properly, even if it is
>> across two lines.
>>
>> No functional change.
>>
>> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
> Should be sent to dri-devel.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the review. As it was a RFC and would only work if the doc
people are fine with the change, I decided not to bother all people in
advance. I'll resend it without RFC also to dri-devel.

Thanks,
        Anna-Maria

