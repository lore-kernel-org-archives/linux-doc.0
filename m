Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8435A95A;
	Mon, 13 Apr 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095949; cv=none; b=Wor06ha/gE/UrdX7DzZs++LukMgL3R4arS6S9CAAlbGdfbEuU2Vl3FHwr4d0IxkxhWBYUIrIJHCQ3vCsagBIW4LzijX4c5CO7VJq3Y5E72H95tN7Gzb/NijOanDUzECHOeTBGPeyvMA8iU3gIz/uGtxPJmsn3Ko75nnfeaJ4t94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095949; c=relaxed/simple;
	bh=LICMOFJMaBQxTMa7PxHOlSEgw7uRmn1TfzDb7KLWFQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpYmBflqwS77adQibg2MOohcUHv7C+YO8EKfrwWgVMWktZxPmFzSKdZfe2ceoHzFCImsNZ6Pqb9Jd7dbwiWFoW8YpCqthwoUQRKnB44fnQC6NU16zAsYzmFSB0w1dmilHJUDLPEKUm0SBF/p4K3jp1PJyeh10jLhjmKRW4+WzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sOruRdYD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J50vHQ3c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sOruRdYD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J50vHQ3c"
Date: Mon, 13 Apr 2026 17:59:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776095947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LICMOFJMaBQxTMa7PxHOlSEgw7uRmn1TfzDb7KLWFQY=;
	b=sOruRdYDh/XdfJWfoEeYkGhi3L5g0xZ3XVECZhIGRuj+uo5xXQQRlG7zQ9oqxaUPIiXZ7J
	j+eUxc8mfhL60fSo1kIgmHyEL6geAW2eBBh4ZfUJCiY/fuiRnnSzDm/UeEYk5s8OwtfePG
	Bm3F1C3qkatyjoDxs9yGJKbhCj5vD17xszh7lVMeGAhIPkTEDGl69hY6QQkFzgwsPxTB+U
	i9bqkb0iNk4qFi07Z+UiJC0w8ClO5eMeYht7tGNCWdRyiz8ih3Lm9DBxK12U7Iyhnc8qfu
	Z2qaRQcOsEfk7g07MVLPW2PukAlYxn51AgYjm98BvOsnaBNS/5HwZ1IPqnKaLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776095947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LICMOFJMaBQxTMa7PxHOlSEgw7uRmn1TfzDb7KLWFQY=;
	b=J50vHQ3cTn4BZAMFJG1rfZmlsgCRdWyFzjHai/h3XrxL5wht8hokGGoXX5a4g0Syz5X+ed
	z7J9UQunp2VWYeBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Aaron Tomlin <atomlin@atomlin.com>,
	Christoph Hellwig <hch@lst.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>,
	Ming Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <20260413155905.HDUSHL1q@linutronix.de>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <87zf37f3xl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zf37f3xl.fsf@jogness.linutronix.de>

On 2026-04-13 14:25:34 [+0206], John Ogness wrote:
> If that is the case, then the deprecation notice should explicitly
> target the "domain" flag. Also note that "domain" is the default if no

I am going to submit a patch removing that deprecation note. Frederic
was pro and I did not collect a single argument why removing it would be
a good thing.

> John Ogness

Sebastian
