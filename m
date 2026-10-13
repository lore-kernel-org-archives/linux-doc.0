Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509D387346
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924756; cv=none; b=fWz1JS9CUTeEC2WSJgR61aZ5sk+wHsyEfNJ9ncX4MU7bXTHY3Ks05L6Kkg7EzW3nOqT0O2a83GSMwMnTiS2D703na1qMUE6B2kdCIaBtJG6l+0PnYEtS5zHvm0LR9cp1j04zseN3cWQzPt0t8LWc1Cos7HRoSUUhWI6qX8G1G/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924756; c=relaxed/simple;
	bh=yf4RMSnfEunnWk24XKCESjvLCRcSQ8/3hZrlo8LL1ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucqZzhnEBscdj+kkvstAr+k/FToTBqYbIKfv6syCl2LHrvqonMbWi647Rhxa5ksUjNzcpUZm17kbeBCY1QxtewKc5cVcXNTpSekNu/umlXREiYuu1LkC+QYK/EPFT5Kjbm6T8pxE3sTJu6V84rRNKyzMuisW1pTfch4RwM1mD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DmPlucQ9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DmPlucQ9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c31745ad205so890449466b.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791924752; x=1792529552; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=DmPlucQ9V1WhTo8RDFtSvzu1CYWyRIkbo+IxvaUQkR1KXujA1uvNOtvOiFOvogXkKo
         lWxobY9E6DdyJPCL7oZKpNNplbUG89lruEi6gmwNhfqRsoC2bPjqdiR/xbdXrNgRft1j
         qTYFe0i4kGXoPXmBV9VXcGqdEcQASgijR2WEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924752; x=1792529552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=xkiesNUpJ+uDCGrrcb1Bi4KugBWddQkFteSif+IYQVXyblFrqGnyY1l1r0jxONXLHb
         RN1NnJhQfjS5biqQkANG/9LIv0esbnLVTivXJ87LOmW6HvQ/2HfMHX83IzKM+g/Zz593
         VZo4TCA/EcUGrQx3FoLsCBcQMQqhHqAUqlBaWbILNJ+X5R6tr4TxWZoHRHgyD4rSfx36
         q4jsw5Gk8p/z5t5VQX2Pr2WDYQH5OKvsfHg342H+/SBdvQ58AfH9nnlkJbhthmxq/SKH
         2dgguWfSiFB8w6+rYMQNYWdccdLgA9nuZhe+ZCGLZiGteSsf6q6qyS0AcgcUzVNjuHVI
         EdJA==
X-Forwarded-Encrypted: i=1; AKwUvBwgC6dhkfDfhvGw4wxpHKSVZELAZeSlkCKKkilGZTqiGfVtT/UcYccRPHCLqBTGT3RCerwWfQ+wkSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJEQwXedfVLAjuNG79Nwp+BELjIcb8oWKLH4n2iN2wZO19pQ9
	IJC8ygL9FTj4ol9DFzx/Gd5mq6ynp+O0FNf+K7RhO1mPxDkvRv632oaulfAxypJK/rtkjozNUBw
	XeK6kDKc=
X-Gm-Gg: AYBFou3CEUCQ+KYrEJC/qtoJT37th78B3FiQE3PQEgq39D7c7kvCXkHeKfjnqSU7619
	O6s3HUfHFd4DlCVQE48IW9BqR8eEn9GhWJZWq57RavRbgHtUqUXEAgIpXYz2VymoPgzm+CXVX8R
	luyUlBq8oeACC6MNDQhkNYZByD/IxwTp/ZNrZ8DknY740lgdzFk9bSmbr/HLXhkXXSG2NokP4L/
	9Hc6qknRAfcdDA9yPIoQ5xvTEwiisZYzrun1PEZnQ+GadMgCh/0U+GCQs7ehBoj5TbE0zSM29GC
	qnOk4NzL2V1pWq48lpWmvgC6aTA20x371ldEjBlwyTGR1Pgb3KfmN+8OjZaME1d+v6jdimgI6qD
	J/xVjsOuVak5ye9wuvn3Gk495IxvgubhVl4+DOOMN66bQl0Jg21WCg4MKzNjYHJAHN0EhF/LGpE
	F6Qr+IiwFGTcScMBJCXSayYoIt9Vie8Fnp43RHfq4uH5DN5EHMyOIY8ET1FB7AB7flVYe1863Cs
	2qojpyvle9H++sydSTf3ErlpIsdICoSjl5K4aaA2Gij/TeM
X-Received: by 2002:a17:906:730f:b0:c2d:d4dd:8b5 with SMTP id a640c23a62f3a-c31a9fc0b88mr1317243166b.19.1791924752001;
        Tue, 13 Oct 2026 13:52:32 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae32sm634772566b.28.2026.10.13.13.52.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:52:31 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso3481598a12.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:52:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFeyyBHwtLCYMiAEHu5+Xcv6N/+U1DPUM7CIP86oim1SAZu6SD92vF7MMKApJ5numBMdW4oh0wP2k=@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:c2d:cc6b:27bd with SMTP id
 a640c23a62f3a-c31aa0096d6mr1387682466b.23.1791924325873; Tue, 13 Oct 2026
 13:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl> <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com> <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
In-Reply-To: <20261013201628.GO4214@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 13:45:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
X-Gm-Features: AclHuK_onBbZH1In8K4ATjQxippesrsP-1df32iL1wjxMZwsoKfFWUOiqALbMNk
Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 13:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> What this is about is setting our expectations, telling what we want and
> what we don't want.

No. What you are about is something entirely different. It has nothing
to do with "expectations", and it has everything to do with your
hangups.

I don't understand this whole idiotic concept of "don't use AI for X".

Here's a new rule just for you: don't use compilers for any of your
kernel submissions.

Because if you can't show that you really understand what the machine
is actually doing by writing your code in assembler, then I don't want
to see your code contribution. You clearly aren't competent if you
can't write it that way.

And btw, you had better not use an editor to write that commit message either.

Because I need you to show me that you can actually write a good
commit message without using tools that make it easy to backspace and
hide the mistakes you made while typing.

Ok?

Because otherwise those tool-assisted commits of yours clearly aren't
showing that you know what you are doing.

Do you not see how UTTERLY STUPID those kinds of rules would be?

So no. We're not going to make stupid rules that say "you can't use
tools for X".

The kind of expectations *I* have is that people do their best and I
expect people to understand what they are doing.

But that understanding has very little to do with what tools they use.

And quite honestly, in my experience, the people I respect and call
intelligent are not the ones that shy away from using new and
interesting tools.

                   Linus
