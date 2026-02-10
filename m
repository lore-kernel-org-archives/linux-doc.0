Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BA532B9AD
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701275; cv=none; b=QxzJrc7iqLi+9dN2lTdxbAbQeT0+LZIMEz1suMFXMpraXaVfwdY5oLFsLu2i62owmJdhDTKqbIE6rnqkiAN8O2mS1ftxgfEGu6cgfjlI7NYfwcQNnztJCfiUHNCin0KnfuRVqYtfVPnoG9V/nqL5a1vnCZ6wbgvffrduDSnb8IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701275; c=relaxed/simple;
	bh=gpfZXIL26yw0eoRgI8npQoF9UhYTLxkdrNdj9WNyQgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiaVygbjsUwmS+biEDfEmeQ4qp1SjDuSnEKvW02U20s6EX3rk9zOhHP0k9OGxrDFazkidHWtxghLsDYOUPXr5ZN/0xtKG5cdYlminz+5nRUOvBwHmgv9Df6NUdpLab/Tm8RMlO4Se8EUdgArSzqHESwm/x6fegkz5WHlPXMEVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3tqk5WT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3tqk5WT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8220bd582ddso271285b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 21:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701273; x=1771306073; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=g3tqk5WTsL5G3YX7Twdf8G2kCrcWSu02cSOL11a+o5To1Lhi96PMJ4yjHHrLV+TDU8
         9Jyv7BE78m8QJI+bZTj7jdL2ii3BPy7vRB2bDr2TpEQ7MaMGTyNeBVaZldB4dXHbNxPp
         SL5zig9zOALSswWU7fIilsL2omxODY9184t/Pob7esLN0VomU0fHWboXYkgFYoumQip+
         /5UaTXaiNtY0lQYNAdFhRwumjpE+94G2274lQycWaDoDhnTAx9LqGSwB4AqCKuw2HUaR
         R2Zb9C9tX0NJMpiCxhEoiEK0TTjOePfuAEHjqsIT24nMG2A0m9KIHX7OjgVHNnBmQqf7
         bRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701273; x=1771306073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=T7DmKljuF2Nf6Pci1TRiZuWmCqT/Gt8QhCZzbnrdABMF0dfyr0IVxNRuRvyb/GXoB0
         C8DWc1gcVuO+VUwgE8LzjMn4DQ0PysMFtDdDqjYimrl874DS4px9HCXBk7CXwJRVSb5i
         r00wvn2kyQdkHJAUjZcqb1t+HtFUxOqxLr34Hn5dpEZBotDNqO8RI8I3rY1RMc0Ex4gd
         KrdxekT/UOEXmIKhcrRiAfM0nwz0TXfJCEgKcvMOT5v95TnDO9xXA+0C/ylnVy3gHzIN
         pZ3XmaXHkr0sQZC8dZIV5ngQl5GZ5f8fhow62Ydn1NgNRCc4OS4euGTHiR3Ml/NzvTyy
         eelg==
X-Forwarded-Encrypted: i=1; AJvYcCUjMnOf+FibsBSLJYy6z01I6j5ERNCpn4/KaamsuEsiD8bZUNJHw2cqokAmhzt7/u0QZzgMJZ983wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB89oX39t1v7ZKahqR40Q15/0kcPKLt7vJNs+XgbnpupjYOD0D
	O4XN1w3EBe6QGiaiGUz96vHsf5sE8XA2IVEjysOsqvkT4L/dIDDH5vS0
X-Gm-Gg: AZuq6aLrP6oSG4y4LpQbip5Px0tTISC/xaPOTlKRsQ2jtxeWjjXYUefUaXSWxRqitO+
	aPrANCGAjoerjRG2l5a7cYV3L2o7qgws3u7qVOlU6At0DkEAO0iHFbaC0LuiCOCqYEz+oyQGg1T
	XvK8pr7YUsqDFcqFjJM9ZW1Nd/y/eLjn+Q77xhYxvqluIszd1wKq2ShyboJIxIVrLC3msJhsni9
	nxdqINXlGRjG00mcnjwBNUXEeXPfFpH+yVIohqNEJVB0lNt05Hd5Tvam9oN9FsmRkOdL2XTISIG
	wk3YNkWkmI2VPOraK661uZgsD0P8C3iXMwdSj+Dl3ZOi2tCK79M5/WuxdCP6z21aQhh9uzhNKyB
	hMG8UErJBuxuOWyXXvxB0wMiwbAscS3V3wcTWvZlbykStqhPKbM6aM7duioftkOzLbUXo1fHpU+
	/ymDh+rEsMXhQQY01uFwLZTH4cXCAm8H10lPeiHYhG1g5iRdG9RFG4b4X7/MnseGwLu5s=
X-Received: by 2002:a05:6a00:2381:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-824416f2b42mr12082799b3a.37.1770701273149;
        Mon, 09 Feb 2026 21:27:53 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244152456asm12794630b3a.0.2026.02.09.21.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:27:52 -0800 (PST)
Date: Tue, 10 Feb 2026 10:57:44 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
 <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>

On Mon, Feb 09, 2026 at 01:48:01PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 1:29 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > As far as I understand the patch is complete, the problem is outside the
> > kernel, it is in the libcore provided by rust or the rust compiler.
> >
> > That libcore seems to call __udivdi3() and __umoddi3() which are not
> > provided by the kernel. Instead if should call the functions do_div()
> > and friends provided by include/asm-generic/div64.h, or provide
> > __udivdi3() and __umoddi3() on its own.
> 
> Yeah, but what I mean is, should we add this if it doesn't link,
> especially without a note or comment of some kind? (Perhaps to your
> tracking issue in GitHub?)
> 
Hey,

I'll put this as a note in out rust support issue on github.


> i.e. if I understand correctly, you prefer to not add the panicking
> intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
> By the way, it would be nice if IBM could join one of the meetings
> with have with upstream Rust to raise this topic again with them.
> 
Sure, i'll try to join the call and bring this up.

> In any case, it is up to you, of course. My only concern on the Rust
> bits is on the docs side, the rest looks fine.
> 
> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh
