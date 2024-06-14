Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FDB17C20F
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718383109; cv=none; b=JWqE5RUR7XMLpNzCvGqviWTJqa8hHFcuN+Og0t2aXpArhNFhoQCpBKUy8R4rdQ8AIXOJiG/7IOHgGGYDNAXsHuJlXZV8GDhnF/BMTykrpA4qn0DU3bdeUzuYiyKtDbfR4mC4X27h2mWn83+iK9NT2gLgzgKtcwlpmk91c7K8v+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718383109; c=relaxed/simple;
	bh=qRZkqwezz/GloK+YJ39q4wkQN51nK5crFVA3T7Ku3KQ=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=TwOk0yA+2JuAxgAWLxIjBOZIbS4Ce1pmmA7LzfBE0JutGTyvffT3PpWPLP3klodpEp+I1YAKyNLe3a7k+2YBVl7DyZ91AJFJ8b+Yf6rnPHjE7DaKddVVXSUIO1a3UihS4/iBnfrBLdGqvC//o9Pkwl+gOt9cRSgr8sFJzLFxEOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=qA74QeVK; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="qA74QeVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718383100; x=1718642300;
	bh=qRZkqwezz/GloK+YJ39q4wkQN51nK5crFVA3T7Ku3KQ=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qA74QeVKupIjc4OTX0UZJXMuRibA2IGRLw5w44AUArWvK5bbxoi3J7CrhnARGEYeV
	 bzNGx3slS1qjY8YMXb0AdFwvh8NHCkWdkOf8CJgSJhxRFPgTBa/66wGxnKhmP4CLUl
	 s7VM9nQLpk7h012IzWNIn+ljbLypNwUaLUqrAl9OcuVB6NL5SVHYsthQfPCCh7yQtr
	 QXHiawBlnCnmg0Nnu4QEbKAAn7wgyWbXCNKKiCmHMFvEwRikKZhvwB6lHLJXUU/63V
	 IiCQn9NH9Aq6b6NitDfqygUeN9jzBlU/2beoMbMIsAIkJOZ0PwE3vMP5luabXZtQlY
	 KIrR+YhjIK/6g==
Date: Fri, 14 Jun 2024 16:38:16 +0000
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: Matic Urbanija <maticurbanija@protonmail.com>
Subject: Re: Translation of kernel documentation
Message-ID: <nsxoOqrCQ4-K8OjCxC6b-Ln3ZWyhM9w_R3J_Hjap5ERAkiTldY7U96QemhwTwuCvgpC3gOmMUZ-doU9lpx9W2JSQDbALD_-U-TwjB19CwF8=@protonmail.com>
Feedback-ID: 816150:user:proton
X-Pm-Message-ID: 97fe12bf3bb5bce1f6fe4de7a00047b1409df35e
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

Thank you all for your advice.

I'll start with Documentation/process, as Jonathan suggested. After=20
that doc-guide and translations, especially Chinese (I read
Chinese) and Japanese (currently learning Japanese).

(Are there any other documents that I should read?)

I think this will be enough reading until the beginning of September
when new school year starts.

I talked with one of our English teachers today and she was very
enthusiastic about my plan to involve our students in the translation
of a kernel documentation.

Of course, I intend to maintain Slovenian translation.

The helpdesk was helpdesk@kernel.org=20

Best regards,

Matic Urbanija

---------------------------------------------------------------
From: Jonathan Corbet <corbet@lwn.net>
To: Matic Urbanija <maticurbanija@protonmail.com>,
=09"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>


Matic Urbanija <maticurbanija@protonmail.com> writes:

> first of all, I'm terribly sorry if this isn't the right place to ask
> about translation. I sent an email to helpdesk but so far no answer
> from them.
As has already been said, this is the right place.

Out of curiosity, which "helpdesk" did you send email to?

> My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary
> School of Electrical and Computer Engineering and Technical Gymnasium
> Ljubljana, Slovenia (https://www.vegova.si/about-us-vegova/).
>
> I would like to translate kernel documentation into Slovenian
> language. Maybe some of my students would also like to participate.
>
> Are there some special requirements or procedures which have to be
> fulfilled before starting translation project? What is the proper or
> recommend way to start to translate the kernel documentation?
Best is to look at how the other languages are handled. =C2=A0I would
recommend starting with the stuff in Documentation/process/ as being of
the most general interest.

If you can recruit somebody else to help with review of translation
patches, that would be most helpful. =C2=A0On my own, I'm not qualified to
know what's a good translation and what isn't.

I do have to ask one question: is it your intent to maintain this
translation once it has gone upstream? =C2=A0Documentation evolves over tim=
e;
having a bunch of out-of-date translations in the tree is not
particularly useful. =C2=A0I'll be a lot happier about accepting a new
translation if I have some assurance that it will not end up in that
state.

Thanks,

jon
