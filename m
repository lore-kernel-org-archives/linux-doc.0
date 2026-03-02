Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8937FF62
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430960; cv=none; b=s/hUAji4rUkX6zUetAkeFfnYTtfyaN18CLRl77jsSWRFracdCfFhJI7x4xJYgDwtkjrUF9zdtl+aMyKw0A/D7rNLHknih2cOlcvkeN45u7U050o+sty+qsSVwzIvXDh6Ayiz7IJKDCk9Qh8m1Ftx1TkMCpwNmqc2u/o8kF33n6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430960; c=relaxed/simple;
	bh=T9vF3OMJTb4zP0n+PnC1NLELNKgx2s4uAe1AZmq6Z3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/DKUIA0OJJc+YvQzfs9Wq/fcZkkWoGJm1uKephLVT4jvk7BGWsYI9xLMbJlZXSbgEXCeYVAsPxO/qSigqkQ7UdZVz5/uSQ+ZyB5PRu7kL0RTXxf3uQiqlhcDc3Tf1bjEgacoAHQ/1xDSUCruiMwZGbUm8Z+yK8a4EYSPv/QbNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hT8JNpyk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hT8JNpyk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad4d639db3so18218215ad.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772430952; x=1773035752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=hT8JNpykw7ROPnz9LzSdCKAf+V0lv9juBin709wv1qWOR6y4hTPBEiQF5p6NyjsaUX
         CRuJRtYqxIesHH33nk9eWgOEquPMjQ7Uiop9FWLQ2ngz5G8Q1P+C84y8S5e2WYJBddU0
         kKlEC4f+YtsKe3mZ82jCQiF4M6mzmO9ZDeNRrDqloUNVu7aWeO3dIGe+Z6ho/HeolAS/
         36oRuShga27WzEDf7MLeYWmg0CYdIuEdjojctUxXwjZvlZ061Z21vUKotTmzVXC0Yxdi
         PL6d7NfBWZvU+JntkLxLk+BJkJQzmIYMmlX1E3EV/nXduy+cnKcFH8+H4PBnDKJGwjtw
         1V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772430952; x=1773035752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=QTc7cRkIRqtYHw1nizaQwd6iyO9MQMcqyN2oeSpnX5vFtNtgYE4gyyqKEaAwd+sbs3
         hA3kj4mo1dhYcW60o+mBN8xwn/bfvSgios9Y6j7oJGIOpW2dJcMPstEe3OEhs6lbRlv6
         IFggeGTgGY3qiFkBbXD4JDTsCLNcZxDRERDlXxk7XPLYtlsSy3qVdxhyhlGNWhxmPOdH
         UbmNkIUSLF21e3Slrf45+YhuYNgTXqlPWxoDKaoQqOOrDQXwMAPCoR5JA/iPLlfRBkPR
         oRWXOLaFkDVNp7gW8Tdkg/SuParEHn2IutqFII7v5vTmiCQbTf8c+Gg32DTfJsdwl8bf
         BUTg==
X-Forwarded-Encrypted: i=1; AJvYcCWGIEmnF9r0KsIgch0KCU/AuN6CxKQm9mgY9G3UKjpWHv5+9zmN5yt4A3Z2lnjBEbvhi9T8/64rSvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTswppQxgs7K6lkhxQNp7kYA8StZDsuNGLNT3GMb6kbQLML4Yt
	4CAusw1nc6dshKIpksXAQBRMxibsTbgh6xaooNM1A2R0/Bu/g8QiSBj0
X-Gm-Gg: ATEYQzzBvozJZO2NKnDAQfR5jlIiCMgMqfIeKgmw8qpYm2joRWJk4nU/e89fenKavYl
	MlNT1SaUHihD3qDoyD2HEe/RmYiGnK9figYOc3K+mllLa5O/N/jsc97YsCMaUDo+KztKLWOCbAQ
	/tJBBM9MbAFvdPMsLQ49iyZZzAvhb2MOIqYq6WAe77t2XrEawDZg4t/xiu1hxS1AZdQdjtYQism
	sD6rEUaLGBa+lBIpN3g2JaZmLOlFaVOWf+30Ghq89qWA9Raqe5dxNVNnClGENdy81DVClYjmbU2
	kAPwyCVaI2U9tk7+nJv+34H8ZqXdoDE6ujP7FCT/yZGSvinpU5r5ENfWShO7sgDQc4W+is5suIC
	INcWs5xs4Z1An8bSSJHjwjvTx+c1Hxtpt/Kc656lVgjdH10njgOlDRfX646YH7lEScd1xWJZ5UU
	K8y827dm3WfgCq0sHLkTr0jQm0LofURSA2yCnhVLDX9lH+AFiwErrgT0khheoOkBzZ9T+AgcxP
X-Received: by 2002:a17:903:1786:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ae2e4e1e73mr98276195ad.51.1772430951599;
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.219.228.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c2e4bsm179629825ad.32.2026.03.01.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Date: Mon, 2 Mar 2026 11:25:54 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ralf Jung <post@ralfj.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>

On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> Hi all,
> 
> On 23.02.26 16:31, Miguel Ojeda wrote:
> > On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > > 
> > > I think, disabling altivec, fpu and vsx with compiler flag will work.
> > > 
> > > What are your opinion on this?
> > 
> > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > usually doesn't really matter much how things like that are
> > accomplished: whether via flags, a built-in target, a custom target,
> > etc. However, we need to know what the path to stability is.
> > 
> > My understanding (but I may be wrong) is that upstream Rust prefer we
> > use built-in targets for softfloat instead of disabling via
> > `-Ctarget-feature` (and that the other options may go away soon and/or
> > will never be stable) -- at least for some cases. For instance, for
> > arm64, please this recent change kernel-side regarding `neon` as an
> > entry point:
> > 
> >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> > 
> > So please ask upstream Rust (probably in their Zulip, e.g. in
> > t-compiler or rust-for-linux channels) what you should do for powerpc.
> > They will likely be happy with a PR adding the target (or whatever
> > they decide) as Alice mentions. And until we reach that minimum
> > version (in a year or more), we can use something else meanwhile. But
> > at least we will have a way towards the end goal, if that makes sense.
> > 
> > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > involved in some of that discussion in the past, plus the compiler
> > leads.
> 
> Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> built-in Rust target; we can work with you on adding a new target if that is
> needed.
> The kernel currently uses a custom JSON target on x86 and that's quite the
> headache for compiler development: JSON targets are highly unstable and
> directly expose low-level details of how the compiler internally represents
> targets. When we change that representation, we update all built-in targets,
> but of course we cannot update JSON targets. So whenever possible we'd like
> to move towards reducing the number of JSON targets used by the kernel, not
> increase it. :)
> 
> Kind regards,
> Ralf
> 
Hey,

Sorry for delayed response. I was out of network zone.

I am not sure about the process of how to get this in rust toolchain.
Should I raise an issue of github for this?

Regards,
Mukesh
