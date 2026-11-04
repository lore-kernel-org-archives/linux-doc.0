Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780061;
	b=yTNpNa70RlbyIGQN9igUThTU8pYHnWC5T+QTVt1ffE+9Q0arUQEh93oEWzMt41dqgkRw
	 Z6++ISLQ02idojA0/HUr3gqkINmNDTkDynQSM3J8plvTZUpq/bh3mGLfTZREIZ0stYl4T
	 fYHf0WAJuw9Z1rwLi0sLn3r2gjTWo8kNelvxKkHVk7NddYYKJD1Tdzn/oZrD6y+jKeWxR
	 YmziYjNaXvlck4Tc1RW6Zv4AGfbVUhYXE+hBC4giT1IzKdQ8cLbZfCkyVbGrcYCsvn4mR
	 sT0jU8vVfgLUerzooEo12ojt3OAZzNYvp5W3hTLoscNXyRr5rDvRgoB7HlpBOxZAhzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780061;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u0mvGpqtlZfjINxokBP1apiF5s2E5H2P+33Mg4nhuuU=;
	b=WshBX1kkmpcG7BKbWJRM37+XdP9bvEEOj0VQVuuAUqeO+EbGhr36GRyN7xpCLOMzBb0X
	 VoIfx4aO90rmOF7PdONnEANMYQkvaj4Y4PgdJfHbBA4Kf6RkPD+7Gh4yjU7cN3ATOalws
	 DxvuTex49Rt/+RQDNFahV7Wq0N7dlbjtBtIWZEKx4fYlu8LVfyxhLFnE2Pn39OSZvKp6/
	 PvATPeJDqAslNZFQfLX4khFgXMxvmkhwDp7+0+cm5g1AwqFISmwkK5ug8i9IS9GGG3P6i
	 LvT012XkBWE+WZP4YaWGpbvMGnb0U8bzbHI6HXn68Je7rRDV2elkvERvF+kgoK0yzaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=qYJ1xFAn;
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92159606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 08:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92159606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=qYJ1xFAn
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MRcHoX4dU+DYPgRvfaDTMzQP1NWT0V4zukTujIDg3DY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793780057; v=1; x=1794384857;
 b=qYJ1xFAnsK72RQHQN77urdzv+mfzfWmIcdNYff/qxrwfaM4m934Pfcj7ZaHRBFpQ7hVBBfD6
 ZI/5iycOuZzES0SsATx5zaHHyizV+uf4HXH4PTv6zmgL/k7BL1GvChVr9zb/G3Ve0HwrAJaPaLv
 JVjqbimDyZ/S/ewnU2dtExvQZ2v0nHJmR0f1+R17DkM70iYFUSVa1hKU5pmS34P+lujbyFMmHoZ
 iuzg23OS5viiddw0TT7SueeDQJg3cOrlKXZDpUFPUA4E3KJZpOntKGVsbldB//8217T3ll6um9g
 V7duFzw1D5xMY+kPSf+NVJohIvzP2ci3peXpDvKhwKHZQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e16cbf5b501e931;
	Wed, 04 Nov 2026 08:14:17 +0000
X-Mizu-Trace-ID: 4e16cbf5b501e931
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 16:14:10 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <kernel@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: How to attempt to gradually eliminate the compilation output?
Message-ID: <aurpUltnbwWw3eyx@wyuan.org>
References: <aurU4uKyIUBl9-CJ@wyuan.org>
 <87y0b99i6p.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0b99i6p.fsf@trenco.lwn.net>

Jonathan Corbet <corbet@lwn.net> writes:

> Weijie Yuan <kernel@wyuan.org> writes:
> 
> > Recently I've sent several patches to fix warnings.  But since I am not
> > familiar with the actual codes of theirs, I'm not confident enough to
> > touch some parts, but only the most obvious ones.
> >
> > Since this is a goal that Jon has spent years for, I'm wondering if it's
> > possible to periodically send out some email notifications, which will
> > use the file paths from the compiled output to find the recipients and
> > kindly ask them to to deal with these annoying outputs? Perhaps we could
> > use a script to do this.?
> 
> I think that nagging others to fix warnings is not going to make anybody
> happy.

That's sure and that wasn't what I intended. 

I'd be happy to do the work, but putting myself in their shoes, I worry
they might think, "Someone from nowhere, who isn't familiar with our
development process/workflow, is sending patches and just adding noise.
It would be quicker and easier if they simply pointed out the problems
and let us fix them ourselves."

For example, last week I was about to send a small patch when,
fortunately, I searched lore one more time and found that an equivalent
patch had already been posted to their list, but hadn't been merged yet.

These warnings span many subsystems, and I worry that sending patches
before I understand their respective workflows might come across as a
bit impolite: "We already have this fix in our development tree; you
should have checked first."

> The best we can do in that regard is to try to prevent the
> addition of new ones.

I haven't looked into this in detail yet, but I suspect some new
warnings crop up after each merge window from other subsystems' trees
without our side noticing. So could we be fixing roughly as many
warnings as we gain each cycle? :)

> Beyond that, it is far better to send a patch than a request for
> somebody else to make one.  If nothing else, an incorrect patch is
> usually the best way to get somebody else to create a correct one :)

Ah yes, true. ;-) So please bear with my poor patches then, low-quality
patch is unintentional but inevitable. ;)

Thanks!
