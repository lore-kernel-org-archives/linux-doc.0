Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431721;
	b=rtAVtExHFZJnTn79bzepKA09QDeWVlLV8nP6fa5XgEX5mUPutP57P47WjO3sj7+v/fmN
	 r/0w+p8dtH6mfHnJ/uWeYvXH4aQ9mDOq0Yr2PXUOyKmT+eyR8noLLn4pqLDIiHlDPr+iF
	 fUth7M1O7qIj/QIzvB6OOOlKrjsvNoTNQKKZP92nUN/pgBbde/Aj4StV7t3Vip40atvvA
	 R5xi2AUyj5Rb85V/Qm2Lj5xSw5mkadlH9idVpR+ES0ThFkIKHiIiDSYaIFqZVKA6K3ny/
	 LOYMY8Iwe7q4HASuPi1GjNvfq/OrASM0RNOhUBCuo8RD5fj72O2sHpERZFneVFQF9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431721;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
	b=iv8GuOQa+8z9IuYGmcPirT/kcFl51I+roRg+7pQjnfw0n2ysCMsPLXPFV3tPUlrA6qqZ
	 cYZvu7knQKpVG/+JN4iPwPHpzBrMhc/3BW7i9IN7JyWd8qE/yDIfxquX6PPOJtXcy0WnJ
	 kXEPAL6eiUx1X6tGWD026NhKBhzXnwIfitk1w7fDnp2MFWY2mWPkUkBuQOqeR/5FTXvrT
	 TwSof5kBQt5Cj0y4kgMUlDyO1F4BxNt2NL9uIFuZtvFaTvndt6luTHN0pdmbOgzPYM+cD
	 HBvRKV9N6o+VGOjSlcp1A+3oK35p1lhrTs8T4iTYIWr4d7H9d9c/3vXJPd1a7yhbp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QbvffP8x;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UxoZbMTm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891A606A31B
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 17:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1891A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QbvffP8x;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UxoZbMTm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792431720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
	b=QbvffP8xxOhGbaHBOpUeAELu0Gias/LLjHlCsnO5QHQuY1cNgXv6uH05lW50Qs05FodOab
	JYNBGPNDdZ6vAAL45vrdbPpAzswt8ls3FathOeM+dCEy09McDiqUBOO31tyzrSc229vOzN
	Iq9j6SY72X4W1I2mlrkPJYt5rG5dn0Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-DuIIufCBNcu6rCPkC8CTgg-1; Mon, 19 Oct 2026 17:41:58 +0000
X-MC-Unique: DuIIufCBNcu6rCPkC8CTgg-1
X-Mimecast-MFC-AGG-ID: DuIIufCBNcu6rCPkC8CTgg_1792431718
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so406755585a.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792431718; x=1793036518; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
        b=UxoZbMTm+oOpWM4UEUqClYt+u2lMBHAkrD3m+LliSj4gaivLwRnANv/w/0a8F5jrU3
         e8ecdk7jyl1NXRdedIUG3+Ayr5/Mq5KWWe7TBJf/YJ3UmEUccn5AdK8FoCXtPZ2shgCL
         BjLzpiAcX+aijvF7jFFAmRqD2X+4y18QYaEobYWh0B1BTOiXEQwDWLQRVplfqeoVeDpk
         JShV+i8JBmEv6mO28OUv77Y2IeoQMc1Ko3C9Bjn7oAi/Nz2LRBDEg9QdDdfU3tYAjMHC
         8oNOUK3/9/i3/AsIzXKXRBbBkDERG5/q9ln6UkiL8WrZ4Vf7vhkXucqiKKvb5qk6Nj8R
         BR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431718; x=1793036518;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
        b=y245nFQplOVkgLKrraB82sBg/3gnGUSs6fXVtNQ9HnYXGyLPnlDfO6zaK8pROVpHXg
         TYcuR13m1gntZvXqFc9yoT/KEsRxpqg+PsaI4G7I9GtGxHkQzkt5/cx2Cqzjd8MG4XOv
         IqFiWJhSZ+UcsWxcZamaf/Sw/OsOLTW2ySBneVYaqt1Dtl3LH5lhvizKgGC4eEV3UPVS
         LEKTfriQgXLQOpwkZcs4hbrhCcmiLnx+Cb6zONMZjSLnTrHgHe62HjvJLGGwpj3CvL4G
         b0NtYiC+1F/E4MUqURhUo6JV1MH/8JVIl3u16Gl3qkA/Ymb5wCRDQqA40Q5BWE/Yinzz
         Grsg==
X-Forwarded-Encrypted: i=1; AKwUvBwTgiMEIb2Iv1lNSE0Em+d8B4KA9bwxVfn3m5BEKv5IrSVYDYzDr4h+pGqYUeXCDLf4eCZzBKwsNpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvGsKOdXNj3M1RxAKOUCmYjKYxgnJXUwitfxCKKoxrOTr8ffCv
	1KTkPG4JMszEB3CGD6F4SEiyN59HS85BNpNAUbIrx3JUE5kNY5SrXKrLUonKfZmeu9S9Xknl58G
	UO8pW99t019nThxKXjiBsjE2MO6WMPW43ObqhLbmKd3F+QbNUSd9Tb7l0pA2jvA==
X-Gm-Gg: AYBFou35dFdv3pBpKDsYSpRIkPXcOUZv6JIG2t/H5j60fElR96oSpV+mq3zBPtZAGxQ
	7V079GflGQZEvhiNwGay+jDAFP7nah0Zj2QJVtzWsaweqBYKxjenacg+lzA4B92amDB9wQUi9ju
	326pqkOufPJSep/5t9kCe+mqmo+KKJQTqp69v0tJ6T11aeidq4TKr7bajOkr+0KQoxo+8svxkNA
	c3X/Ll41tWHegp0TJ5lToBzWXWAdnYd5lbgmwHj2uLiV88kfaE9AvtklPQRKx/a7J3C32Qy6hO3
	RtjKAnkGsMC/1V5udsnBpyhg5d8oqCfmcFyaHx4GkiSiy18Y+Ajw+ZznmUzqRDlbBUxzzac=
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1386468785a.28.1792431718227;
        Mon, 19 Oct 2026 10:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1386462085a.28.1792431717358;
        Mon, 19 Oct 2026 10:41:57 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c4c2sm1555996d6.20.2026.10.19.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:41:56 -0700 (PDT)
Message-ID: <b2b0296aaef22f8c4db2ab06ac7a708f8321a313.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
 "Lorenzo Stoakes (ARM)"	 <ljs@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin	 <sashal@kernel.org>, corbet@lwn.net,
 skhan@linuxfoundation.org, 	rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, apw@canonical.com, 	joe@perches.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,  Brian
 Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David
 Disseldorp <ddiss@suse.de>,  Mark Brown <broonie@kernel.org>, Jani Nikula
 <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,  "David Hildenbrand
 (Arm)"	 <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Christian
 Brauner (Amutable)" <brauner@kernel.org>
Date: Mon, 19 Oct 2026 13:41:55 -0400
In-Reply-To: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
References: <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin>
	 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
	 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
	 <202610131000.43AB316FBC@keescook>
	 <20261013174243.GC178151@killaraus.ideasonboard.com>
	 <202610131216.C841415F01@keescook>
	 <20261013201628.GO4214@killaraus.ideasonboard.com>
	 <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 13:45 -0700, Linus Torvalds wrote:
>=20
> I don't understand this whole idiotic concept of "don't use AI for
> X".
>=20
> Here's a new rule just for you: don't use compilers for any of your
> kernel submissions.
>=20
> Because if you can't show that you really understand what the machine
> is actually doing by writing your code in assembler, then I don't
> want
> to see your code contribution. You clearly aren't competent if you
> can't write it that way.

I don't think this is a honest comparison when there has been a very
clear shift in the kind of janitor patches I have received over the
last 3 years. It used to be only occasional I got patches from people
that they managed to write and build, but didn't understand. It is
incredibly frequent now, and there is a very noticeable trend of what
kind of tools are used for generating those patches. At the dawn of
programming languages, sure, people could keep throwing things at the
wall without understanding what they were doing. They could do it
somewhat faster then before. But it still took time, it was not
instant.

I've spent most of my career trying to push for new tooling, I pushed
pretty hard in regards to pushing rust in the kernel. I've pushed for
gitlab, I've pushed for new build systems, I literally believe that
change is a part of what makes a developer good at their job. If you
can't accept change happening anywhere around you, you blind yourself
to new solutions that could make your work better. I even have started
using LLM review bots like Sashiko, despite the fact that personally I
wish these things never existed.

And even I am not going to go out and try to say "it's just a new
tool", because that's incredibly short sighted and just false.
Usefulness doesn't change the fact we do not have the same social
contracts we did before LLMs were around. And when a "new tool" changes
the de-facto social contracts that a project has had, that seems quite
a bit different then introducing a static analysis tool, a new API, a
new programming language, etc. into the kernel. Rust helps attract new
contributors, but it's never fundamentally changed the way that I've
handled reviewing people's work or handle working with new
contributors. It's perhaps saved me some time, but it's never
fundamentally changed the expectations I had when a new contributor
appeared. LLMs absolutely have changed that.

This is the distinction between LLMs and other tooling, and it is a
large enough one that at the very least it should be addressed with
stronger arguments and a higher level of respect then "You just hate
new tools don't you?".

Frankly - that's part of why you don't understand "Don't use AI for X".
You keep trying to look at this like someone introduced a simple new
tool, and now people are just being luddites. If that's the only way
you can approach these discussions then yes, you're never going to
actually understand what's going on.

