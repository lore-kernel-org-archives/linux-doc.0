Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C313DDDA3
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913239; cv=none; b=GSSnlCKsPD6vSWmq4WqwC5H82FRIh6jkngB1j80/GyMGbCnC+wtqZgAvbMIq3yWwwjbVEEhn9jiNLRavnIbuo81kO2qc2bHoCGjFAmJjORZhjrhhiDM5XbVNju2mNaeuE8ZcE7ZWTG3tKfjy7FZqOeZZp8tuzSYpGmOZIkzs4rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913239; c=relaxed/simple;
	bh=5gH94852z0R5p6plHi2l40Xkn51mOuVnoSug1HOnMz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSV2fS5eNCnWblGYrmicJrRvIt7icYyvNCcnbWXuz0Pc+WmfdUsx2vyFqkujktKLHnYsUQ1Od5LGlzDQXXZee4kGvOLUFbVhmw7IM8piiz5zbfjyXErRK4ag4kkqKn9k+qCO74pJnT5Y2pOLWX6iu89qXxEAdrE2D2igXQGuU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=d4wRCA0Z; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="d4wRCA0Z"
Date: Wed, 5 Aug 2026 15:00:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785913234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GYOh1tJXjXrL/DeRcVIxqpCZHIs5smRsPoUzpES6Yc=;
	b=d4wRCA0ZYBqw3vdWD+HBeQCCvF3dFKAxv7TXRexxupi02TIVCOykVoQKnoh71ihorCU+zc
	7qRt0ytjS+ykgL0CW00iGylLexUO10FGHQQwXhJ8yAvnFRdDwyqGyRTKXWqn0/tchDvClq
	srBHstV3quH/nkTLnWBCLetQ2JmMC6LDP01srx2uPNyl4IbwYc18R+b/xLRAW5rMuUvE7g
	jo29x8dxBS8cS9PfQeXhmHGG4oFD+L/1HyCa2mBBzqbUi+tkI24s50HYA5h8OS5gyjzXdx
	6cwMMxwJ3secV8nF9WwJzC+wJRruqI02gaycagJ8Y012feiWnM/1gEDCBRdPUA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/16] docs/zh_TW: process: localize terminology in
 submitting-patches.rst
Message-ID: <anLfiibgvpzMmRz_@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-14-chenyou910331@gmail.com>
 <amNHU60OL_HjMWbX@wyuan.org>
 <CAKspUh+vAyHt+qQfZrNnkk0cKOks1nrRGtDapXp3Tzas4WT7=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+vAyHt+qQfZrNnkk0cKOks1nrRGtDapXp3Tzas4WT7=g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT


Ah, somehow I forgot to reply this email... Sorry


On Sat, Jul 25, 2026 at 08:36:26AM +0800, 葉宸佑 wrote:
> On Fri, Jul 24, 2026 at 07:06:59PM +0800, Weijie Yuan wrote:
> > For the translation of DCO, I have the same concern with Akira:
> >   https://lore.kernel.org/linux-doc/c8c36d99-9c0a-4767-8a4e-a5ad28093530@gmail.com/
> > Could it be better if adding a sentence like:
> >     "The translation is for reference only and has no legal
> >     effect. Please refer to the original text."
> 
> This is a fair concern, and I think you and Akira are right. The DCO is
> a legal statement that contributors certify with their Signed-off-by,
> so a reader who only reads the translation should be told explicitly
> that the English text is the authoritative one.
> 
> The existing disclaimer-zh_TW.rst included at the top of each file only
> warns that a translation may be out of date; it says nothing about
> legal effect. So a dedicated note next to the DCO section would add
> something the current disclaimer does not cover.
> 
> Two thoughts on how to do it:
> 
>   - This affects every locale that translates submitting-patches.rst,
>     not just zh_TW, so it would be better to have the same wording
>     everywhere rather than each locale inventing its own. If the docs
>     maintainers prefer, the note could even live in the English
>     original as guidance for translators.
>   - Since it is a policy question rather than a terminology fix, I
>     would rather not slip it into this series. I am happy to send it
>     as a separate patch once we agree on the wording, or to follow
>     whatever the zh_CN side decides so the two stay aligned.
> 
> The GNU page you linked is a good model; their point that only the
> original is legally valid, with translations provided to aid
> understanding, is exactly the framing we need. Let me know if you
> would like me to draft the wording.

Agreed. A separate patch (series) is obviously a proper solution. (So
yeah the same, I was just "thinking aloud", to prevent my thoughts from
being submerged in the sea of patches)

After this patch series is completed, let's deal with these issues.

> > As far as I know, it seems that there would be a final decision in LPC
> > 2026 soon (Oct.5-7), so let's mark this into our TODO notebook for later
> > potential changes.
> 
> Noted, I will keep the Assisted-by: section on the TODO list and
> revisit it after LPC. And you are right that translating
> coding-assistants.rst first would make more sense than churning the
> reference to it.

Yes and nice.

Thanks.
