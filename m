Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1902257827
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771813575; cv=none; b=FyzEg6BIGVdXSk+fl22MNMYGjPp7S7NsZE08Ho3TX7Hm0J8DkRzNFF+8Ra9/xz3KAIpCoLh/yb4M8f13xLSCOC10Fqbx71Tm4DqiG+0iArRhZ/v8vKs1JH6PH04uYLAfOeidqziNamLki68tMrhD4o8ynPmvThV2XOA5uTGenTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771813575; c=relaxed/simple;
	bh=G4GFV+QxWjJyU8uodbcIN5Iy4j/891a6vm3BsnJgJU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOcxRDJ+8TJRuchQTwbAA2q//lNNHJcHjRzvUNZxBuB3xc8dur5ctjE+cJtRjfEqmCwphOj2g4vPeJxXSEda/KY6wyC9lU7pCo9sIlUWektsQyHbGEyXAaf6GXA7BxJR6UVWmQI8hXyc/L91A6stJ0DYrtQsY9YArg5VqPURtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXx5I7iv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXx5I7iv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824484dba4dso2731578b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 18:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813573; x=1772418373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=aXx5I7ivYAKRoNVB/CR6rsab0rvunJlRY1rf3nWDigqoXSX/hnvnaeGjDwRTetZeZc
         ANAvJf6wRCywTf9LPNCYqmoRb1j+04xGbOVbV/5U7TujUQ/MLylKLfUWfMp7SslCNeFV
         yCaPmUaHXAgXdwH1I+hDkjzdcodcbUHcXR6McDRkXFPsZVfOkFw+GzPlINFxd84HjqtV
         Of9SSuFwBUnln+ZAMmGBuX4Dpe9c+PjcCujp5Nc5pxIoeQ3J5OmJ0z7QQ4/vNOEHt0/W
         r6uNSbtRHc8HVz2GcneZMrOhLB6ec5xmkizsPYoBlrrldJtxi7GowPKe6UfkZExlFUJZ
         PtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813573; x=1772418373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=F4j95GP9FewNmi+sIKt9uJ1O7uRGoOmT4TFUG5Ei8sWrZFbdJqndFgj4cLATBB6Z58
         J6TcKOQwmBZpDVkzDCUZ0HDqWW5viDsdofEmRYBPUd18iZideZqdkcJ22+0v8B/LSHi+
         vvO3CKfHNQOg+uNcJpNtMOh5IQS9F6tjuz0Q/ZrJGcxH/UHaZs3pP2nYnFhcGWZ9h98U
         gdtbQM9L4ooKWo062kPUMjpFo8A3XESkeoN/jQUfegpMZNaYBYhMpox5ki7QOBy3Io9i
         2unxKX0vOr/m+o5A9yz25zn6H/NO1kHKzZi7U94DSTLA1s6pW9Avw5NNnuLUXiwU5fvC
         UVQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrdMGWvhUAJzbOAHn49wvyzsXqR3DicBuB7/X8I4dlLvWybxwuYhMIHoa9hv3d0YLx2poDPnTvWig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrjudIGVDqAz7GhHMxLowCNu6kPf0O7Jm92+BL5977aljyWmxi
	WSss6+3tloc2qtZAkhc/DtEf38mJQMlUnh4pxQLy0tucPLd6CMjhYjbL
X-Gm-Gg: AZuq6aJmOMM4FjZ+rc4RQiTwRQt0/ptUZMpWZSQYFU4tTrLbXa8yl5GMkTEQACByMi5
	logJU8hCR8wy5WLX99DNiP4bLsAuWyQUMuWrQbpBnyDPx/RzKzRdk1GDNKNGCnHXtwJO+TgCAki
	uKw1WVFNYgeaQtFBeblQxSNxD+cE7fDjvixppUEv6OAdA7faOjSUZQ3fUS+xxjIOKtRGgyc4e8H
	nDdb8gBBT43eHFktIieTD8hkebQ/8HpQ0zyxiA0zDzsl1VRdN2GZ9BMXhD/P3tCWnp1yuu04ozQ
	Q14Juoe9wznx+4EiGArZBnM8RAmdrir3Ok6c/2kFhhwD0JedNIHCrZjdjrwbJY3LxPxdqxpsxWa
	x+I7yfZ9w4wQquTs89Pq3q/GTmRZNIIeyTWsVX8vtf7Sqxgi/habuNRu0bDVAIVfshwo6gbJ4ep
	y3IyO2arerwHXu7cdD/Zi0TFBmz9ACq6tO2hA98ywdG7uXCzk5Way5nvkq4BBojKNKFQ3fYA==
X-Received: by 2002:a05:6a00:3696:b0:824:a635:4181 with SMTP id d2e1a72fcca58-826da8ee305mr6643441b3a.15.1771813573069;
        Sun, 22 Feb 2026 18:26:13 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.163.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bc6e8sm5846159b3a.49.2026.02.22.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:26:12 -0800 (PST)
Date: Mon, 23 Feb 2026 07:56:02 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>

On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 22, 2026 at 8:07 PM Link Mauve <linkmauve@linkmauve.fr> wrote:
> >
> > Should we come back to describing the target like I did in my first
> > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > is there a better third solution I’m not thinking of?
> 
> We are trying to stop using the custom target specs, so we should ask
> upstream to give you a built-in target you can use (or equivalently, a
> flag to do what you need, but I think the idea is to not have such a
> flag).
> 
> i.e. even if you used the custom target JSON, we would still need to
> ask, since the goal is to remove that script entirely.
> 
> Thanks!
> 
> Cheers,
> Miguel

Sorry for the spam, my earlier message got rejected.

I think, disabling altivec, fpu and vsx with compiler flag will work.

What are your opinion on this?

Regards,
Mukesh
