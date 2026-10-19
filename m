Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426557;
	b=d0uBkeYVSKp7uGlvzCeVy6M2Lbcy6ASzCtUoIV2FnBN8Zrg/WDVqEGewtszlYYnuTZlI
	 Z5OWOVvtkZGWlXIWuA7Lnem+K9NqPr7tU7jlzsVxZ19evsBhgOIcDpTc8wU77pYgoC7Zm
	 sPG8sFonozcIuL0TPLNdllmxkSklhFHv/aRDB/cHvuqKLERDWYld4O/vlq6Gd96Ie2Sby
	 zWN0nYfGAC6zrYn/9Xhy4qhQLVDibyVQFEx478XthzzKYbHXqbcye3ubB/+OiLNEwemwo
	 SRb2klTrdYFs3o+2GfUoATgx0IjEW+b/yhSyHyYdtxmnyXWE1B9S+1WSp+UzSgfeXsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426557;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=2Bw7FYZLS/xDM1ggWnLBxU4eZrOtjBRHvBgAUHbBCZCBZllWvwmUbj8VpXb5VUgKFwmT
	 eU27xI05kp6M6KPDfDTW7CuQXRJzjwHxl2ybeGVwAQgil4tu5Cf29xBwaIkPVpRhL0Nxs
	 wnk3XleaqcIQXo2IlDLYB4YRnrzV6+Z215WWh2LqEapIXXuutG1/TJR4jIuMGVR9EryFS
	 mf5S1jfjTWAskJLIJEfQyqTQpEZfw74kx+VbwmkNNVwEOWZwL6jafxpLo4K+DNKLNKGN1
	 TN+yNG0Xk9PjOukdTX1Xgycgg3taP3lyy5aMz7ow0NMjM2SfiGL0UMw61KJMJ9p6iAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dz9J9N9B;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDD606A31F
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FDD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dz9J9N9B;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792426555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=Dz9J9N9BQ/IpGRuad+OzQWpExzQ2qUXSjxOIBmKE3NwTluR3yoqul50RcHLT6rMCqHvIIN
	JfltOHFzEhkrhaxKfwS4G4JLExxVkxfppoB7hwjfJIqjcG1wBIe7SH2FZAJBe7LhUAHN+7
	+7sOeJH3XejKEWAaxImoZG6PCTEfwCQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-ipFLZ7z4Ppeoxr8uX3X3Pg-1; Mon, 19 Oct 2026 16:15:53 +0000
X-MC-Unique: ipFLZ7z4Ppeoxr8uX3X3Pg-1
X-Mimecast-MFC-AGG-ID: ipFLZ7z4Ppeoxr8uX3X3Pg_1792426553
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-847e2926d94so3323628a34.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792426553; x=1793031353; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=m6V++kXF+0jMuveqDKrirlDPJaYAuVm24hJJTa2PdUmC9iVitkhjayI3wkB+HDMomN
         0+NsRJ2bY03K3ZhUiG0FZt+KsOeTqzHKsMG0zitwXybfGMehs5aSv3CjfsYRDlW/eOZR
         qw1H9Om3FsgE6n6VYxMl5eWkT3GRO7nRJkqXLtM1czfuVCNk+JzI7uq+mSAUcUgAxt6W
         GoE5C/CoiYJ40pzz6gPDe4rRC2coDFrAxdjhcTwz4us8XMRovdwhWrc0Qt/nB9IHeQd9
         XmkVn4Va1RW+ntMOAuW5KJFZ7PC2D9NKx/ogShcRRxTLw1uh5W1djvhAjG2Fio4SdVed
         Xx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426553; x=1793031353;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=ialeItPOVN27RFvHCyQ8tFi4HTUO6frzXhgAwk2lGM2aGTdzKrsYyNUucdr+97k2B2
         /kTlhzZcQYyhnXJlKZK3cC9OzOEWcZSgRpl5L7z0zqbu340EhhkfjfxyCKUDdC555qx4
         /tAEvItyOA2P0X1Jc0ddcN2+j4ZIH3kLXm9RDSl4tm6YmSHO9czk+ctN2eD+qz7qTgOZ
         81OXaDL22+w7kXQhe1KFd3rIkSiin3Sqv7F8/lb0F6GehFAY68JO/ME92TLC2AUW1UjQ
         LHF1Adu/NkF9GUwOufnth9OTlgLtPFndnAFNfWrHdpuZTFmEMsdonLHu67ZwUBAbdIjC
         NEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXpI7OILGzqEcTbMQ0fCnc58R6YAW/dBoXskFXslFawgErXkBpO6W6DeFbk2PijOckFwvfhXya5Jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtzJenXG13GSg0XvNLwniW8wQZbqT8YoaHEHTs3McCHQJM+Pub
	xqnX7BqC162O9+MJUvnHed3fSIoHWoHoVxpb9FkMY/E+QcMGH3qggRqCA1AIuN/T4/D3IO8IeLK
	D0n1w4tTAEJ+sdrvG2iPbCkmzxDWgVKp0LbiZ77ugUdZqQFlWN/e2QZbN9FGuWEf2+RLJ7g==
X-Gm-Gg: AYBFou3GGeBw70YBkPfVpyfRo/T2im/s/2oUKkaqyCPV/znjVWWG84bsNqENUF+6/QI
	7StOOWOlnuvR+D1c/3IC4fNvHlhooqMMJ34p/Fb894mR+zjJO3TqjX4RJ/7Uxt1IzGW0i6HLvcW
	d+hke6XUBgdSyiSOypxEm5RNUfuplkXhQicK2VWP3RDVzBhand2zTafGWTntCuetmmSLsTHY/rc
	ERjVFH5/3omT2Mh15XGObvwNxmrJM3LJxnfKMLrCXpXRUDwg5g7t6CHvNsEKqKLjFS55UUWDwaZ
	MrgyZl6qSbK7UaNDH3AoAhsQXWsO+ydJbg/7wFzQ5tu33wc39ZyDDmAjH4tgkw6siQ48+oc=
X-Received: by 2002:a05:6820:8597:20b0:6d9:277d:79dd with SMTP id 006d021491bc7-7035709d74emr4079163eaf.58.1792426552844;
        Mon, 19 Oct 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a05:6214:5683:b0:91b:81ee:a847 with SMTP id 6a1803df08f44-91bdf06366fmr143746986d6.30.1792426541314;
        Mon, 19 Oct 2026 09:15:41 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c6d2csm102278596d6.4.2026.10.19.09.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:15:39 -0700 (PDT)
Message-ID: <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 12:15:38 -0400
In-Reply-To: <as4gLo_6acb_zZu0@daedalus>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
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

On Tue, 2026-10-13 at 14:28 +0200, Jori Koolstra wrote:
> On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > The Maintainers Summit reached consensus to deprecate the Assiste=
d-by
> > > > > tag. Remove the documentation requiring it.
> > > > >=20
> > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > >=20
> > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > >=20
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > >=20
> > > and for those of us who don't know details about the discussion,
> > > how is it redundant?
> >=20
> > No, I mean I use an LLM constantly for almost all aspects of my
> > development work, in multiple dimensions, so if the old tag requirement
> > held, my email body template would just put "Assisted-by: LLM" in there
> > because at the very least, it drove the build and test stage. It was
> > redundant in the sense of "yeah, of course I used an LLM at some point
> > for this patch". ("This tag means nothing *from* me")
> >=20
> > > Do you assume that everyone now uses it (LLM), just as everyone
> > > uses an editor?
> >=20
> > I don't make that assumption, but I always held the position that the
> > tag was meaningless because it's the human wielding it that matters:
> > they either sent a good patch or a bad patch, and if it was mangled by
> > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to=
*
> > me")
>=20
> I think the tag did have a genuine purpose for a while. Now we have just
> decided to implicitly attach it to every new submitter (because
> basically that is the case.) The point was that a patch that was

I know plenty of people who would love to contribute to the kernel who
haven't before, who do not want to be involved or use LLM tools in
their own development. Considering how much LLMs lower the bar for
people to be able to submit fixes, I think it's also worth pointing out
that just because you've sent a patch doesn't mean you're a contributor
who is going to actually come back or is actually interested in trying
to get a patch to the finish line. I've even ran into 'contributors'
who wouldn't even avoid using an LLM to respond to review feedback
which makes it nearly impossible for them to actually retain any of the
critique they've received on their work.

> obviously LLM generated could be rejected for not carrying the tag, and
> a patch that carried the tag could be asked to explain further (if they
> had not done so.) Or at least, that is how I felt and have understood
> Greg, for instance :)
>=20
> Essentially, the way I read it, is that Linus said we don't need this
> roundabout way because we can just reject effortless LLM generated
> patches outright. This is good and an improvement.
>=20
> What do you think about requiring people to explain how they used an LLM
> for code generation? I don't care if someone uses it for review, or
> brainstorming, or whatever, and I have never understood the tag to be
> required for that. But if the code is LLM generated, it would be nice to
> know for instance what prompts you used. We should have some way to not
> devolve into the maze that Jonathan Corbet has sketched, where no one
> really knows what's going on.

Prompts aren't deterministic, and this also expects that everyone is
using LLMs (most of the contributors I work with do not actually use
LLMs, and most of the ones who do stop short of actually generating
code outside of large tree-wide changes with it). There are also
already drivers in the kernel which have adopted their own no-LLM
policies.

I have wanted better tagging for a while, because I do agree Assisted-
by: isn't great, but just going "well you can reject slop :)" makes it
dramatically more difficult for me to tell the difference between a new
contributor who just doesn't know how to structure their patches
correctly, and one that just let their LLM take the wheel and barely
understands what they sent to me.

Something that would be dramatically better, and I really hope would be
considered over the nuclear option of just dropping this patch:

Co-authored-by: LLM
Reported-by: LLM

>=20
> Best,
> Jori.
>=20
> >=20
> > -Kees
> >=20
> > -- Kees Cook

