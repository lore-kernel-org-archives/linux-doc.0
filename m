Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349DC318EF4;
	Mon, 13 Apr 2026 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095586; cv=none; b=eH2a+Nn8jyk7haKEcbbdez1nCIwM3OOuQbRKi+8qWIZWjds5YgBdbgvwkxo3VCPofxB9eaOqUbMvsilyvXt4mqVb8XtEokaaIa1bp6qpR9bW5SOrBp6JBGMqr2hWBxwuBJki44hVfXK9Ji490dN2MzSAG1qdTYBm4w+b1VlQHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095586; c=relaxed/simple;
	bh=Lu287SSROAEmGulyP/b8K9W20gdckq+DD+BMWln+b0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9oevYTD08cCDV8Qb4JAJW+jJiv6KvaMJgU5wpPwLwoiVxsnC8cU6Gr/l+PF6ivbaR9uryGRUKtqtUROSRfaz0sEsuHK/O7UyakH9R2JH0ltZ0NkDsjBYT0Ory46C4STluFU1i4XQoCYeK7O5GYsAsblyQzwRq3nrh9ThzSJG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ljdofcr5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h6Onun9s; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ljdofcr5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h6Onun9s"
Date: Mon, 13 Apr 2026 17:53:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776095583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu287SSROAEmGulyP/b8K9W20gdckq+DD+BMWln+b0Q=;
	b=ljdofcr5q/zVP8Ntb0Jzw5GoTvM4gfl0TCssp1kw4xP5JKUToj/noNwqVKdmtei6bn6S1c
	dyyDW6dnS8BaO6hF++aYH6FpifwtZFYgYcD+KJvBGImg/XahbUYPEK7ngA/8CLd/IT0sxn
	Ky++UAofjTj9JEINvt4QlGKXKT2Hlj4MpDKIa3cDeC28tIzLSr5up83UaZ/OYGImnXAvhK
	pMqISYUbzspQVGkhAkw3k4tr/kjT3Ej2K9XN0cCR0Qg6X8M+q1YdQ3mb+u//XDgteehhHy
	+K3jwgiG8k1vpNpdJ66K7KOsNz/g74JLxv2DeKgB/O6q9vKJp2TRPYlGJWkmyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776095583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu287SSROAEmGulyP/b8K9W20gdckq+DD+BMWln+b0Q=;
	b=h6Onun9s81YC7MiQaD5Mrjw144ydWOhG81GhdVIOcVYck/7z4CAOh1QA7ockW6hE9F61Z3
	ROihFQlsBSo15xCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <20260413155301.yqgpSjX-@linutronix.de>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <CAFj5m9La5S0B8o677FmHoXkD-N+kMVdJL7Gn1YG5noy_4Q_jxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFj5m9La5S0B8o677FmHoXkD-N+kMVdJL7Gn1YG5noy_4Q_jxg@mail.gmail.com>

On 2026-04-11 20:18:17 [+0800], Ming Lei wrote:
> > +CPUs listed in the avoided mask remain part of the interrupt=E2=80=99s=
 affinity mask.
> > +This means that if all non=E2=80=91isolated CPUs go offline while isol=
ated CPUs remain
> > +online, the interrupt will be assigned to one of the isolated CPUs.
>=20
> Maybe you can add:
>=20
> In reality it is fine because IO isn't supposed to submit from isolated C=
PUs.

You can argue both way. And I have some vague memory that block will
schedule kworker and there was some work to use unbound worker instead
of _this_ CPU. I just don't know what happens with interrupt and this is
probably the one thing you can't configure.

Sebastian
