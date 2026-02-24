Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154B274B2B
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909181; cv=none; b=sKpw16HN4WcJjrFg3S46bYYMWOFLFiZUuRXlzYSRyQb77d3Ibf12RM0Mr/PrDhe9eBq3EKHROzjHdkrsIMl0Km3iFJurEuUyj4moDnt1W7rB+RbjBsEwvtj/xfufKb3jup/OBN2lRmNOwYO0ThLx7jyFFGkR+SS2h//S01Rg0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909181; c=relaxed/simple;
	bh=rE0TBHNJixGKZKIFaF96afDMgE9SMyZXjEUDiBPIHsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dK0Tg18HMgHW6bYuuYTN6TIPynj5jZV6633My1tKgwplGbc8IQS0oey9Xkjs+IhNsPB2L0gS/3oQ/VROXT5XRt+E8ctIRwVJpyf6iff4FSPy3+AC0QHmlR4jXtAx867w5Vj6UQ1RriBuDrkUXjYKZBxOejDzNG5F66mvio1NUXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+Crj3Cj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+Crj3Cj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf43014d0so35136485ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 20:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909179; x=1772513979; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ou4URiguCEIHQD6BF6MkSWLcHXyR9MfBfXSYfwsYE5A=;
        b=P+Crj3CjW5ASrD0mBXuTMalxMzHe1J+bxuLTog2nxKZWVWWuv/GxaRn1IfJdHxQe4w
         MY8KrBqhJgFzc/W2vQPh4MFbUdMiTk2saMlgUYbVruK0cFF6ffRQ3lGv30cGJKnT5QHF
         /I8w/xJBVlBsG0rpKPA8++YQTbhO99QA0y/9NplbQA2jm7uDU0UKxzmhC51cfHCB05NB
         RjhXw5Pdi2UL1+1FswFkBFPinCBjPZfkYm80NTLz18Jy7hRjp4J9L3mRcD+bv0MdR3CX
         Hcp+dcbrE2tI1TXlrhXTi6aOA5yXuprJMgMbJO4YUpX/3cjW4NEfyM8t6Bvfk+VYdA/q
         XzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909179; x=1772513979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou4URiguCEIHQD6BF6MkSWLcHXyR9MfBfXSYfwsYE5A=;
        b=Q4h9ImsRhO5rqEsZPX616OYI/htoCC5m0Diex7NedhjYQd165+Dwv0L9c6FkUq0D3Z
         78t5paWhSQ6MSjVyhLpi4a6qfd9WWgSzrAJ1qiISx92nBzg6eCgzDQt5yDSt4aRsIWxv
         Q2LaNsiV7R1UnkkhZipD8ITVJqTWYJlnphllhUc+YsRwZpdrhJV9Rr3gum2/m77dx1IJ
         aPdZS7GQ14RvWDwh9Ll4QbZuMmifxKnLnNIlP3YohJ8RgnRcepRp8YzLmJiPF9kISTBO
         4fplEk/eFo0Eh3m6ZzwiNVxWp7VgeK5vmxrR0+Hh33xuC3APeBF5Jh4w+8BhG03L+zR2
         ZoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiUG7vY+xnXoFfbRnVDGZKm44aggOGZRSuDD/hh89kFM+9RV+qbM3WyydX/hWe408vQIlZdoRJIAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgm4dUi4JkRvDyiHAOrxNnAao4mhqxE9SOlhDSQjPaZN1Of7+q
	80LtZ4AzsjxOyR6taXi820bMjvOccm4oUzQNGHpW+iWa9o6GgcovjVwD
X-Gm-Gg: ATEYQzwfsxdAw1sXk7XZX0g8Ri+9oa3J3nwnVS0bJPf+41RtE7zNSLrbt+NRVXwJ7jZ
	fqZjut9SAVCy0P8lX3SYJ0E6XzNU0FvCGbMQ0FLu+N2Ds7D9Eri35XR9yjzWhl5DVb5tNZHSX/J
	T5OmkPJdiF2ZBh63hNib+mzw1kc2bXw+GQ3riOXsGXinD0LClsiZgkVixvvgxqWGiNpu2OEfU+7
	cj0rYsoi2CLteMPuU3RLjiHXMh689Q7qUb0/QOX+kYgvQlqrp55epWzFqREQMU7wkEygnGJ6/7n
	DJY/Ccnh47TGL9FQYXBMijwmbV5l9WE8ZITd0Oy+jAmxWYTfV//lM8JhKlFUblXs2unXRfJNSSj
	CB5vkQ1wBhRH6OvhS8BzO0DkvfVQs911Qd6X/tY7LnTUkFF177wHVwFq5CfEQRACsSLTosQ4w3t
	mt1ZvawMYIP0VYsAD7kuIZJ4i181uXWlW3ax1XZM8K7llN7AaHicwe4Yz8vmZkTeq4irne
X-Received: by 2002:a17:903:37cc:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ad744683e8mr101466305ad.25.1771909179489;
        Mon, 23 Feb 2026 20:59:39 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.77.1.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad9f1d4b03sm7780005ad.29.2026.02.23.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:59:39 -0800 (PST)
Date: Tue, 24 Feb 2026 10:29:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZ0vxHY9MGndIDPQ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>

On Mon, Feb 23, 2026 at 04:31:36PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > I think, disabling altivec, fpu and vsx with compiler flag will work.
> >
> > What are your opinion on this?
> 
> It is really up to upstream Rust -- for us, i.e. the kernel, it
> usually doesn't really matter much how things like that are
> accomplished: whether via flags, a built-in target, a custom target,
> etc. However, we need to know what the path to stability is.
> 
> My understanding (but I may be wrong) is that upstream Rust prefer we
> use built-in targets for softfloat instead of disabling via
> `-Ctarget-feature` (and that the other options may go away soon and/or
> will never be stable) -- at least for some cases. For instance, for
> arm64, please this recent change kernel-side regarding `neon` as an
> entry point:
> 
>   446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> 
Aah, that makes it clearer.
> So please ask upstream Rust (probably in their Zulip, e.g. in
> t-compiler or rust-for-linux channels) what you should do for powerpc.
> They will likely be happy with a PR adding the target (or whatever
> they decide) as Alice mentions. And until we reach that minimum
> version (in a year or more), we can use something else meanwhile. But
> at least we will have a way towards the end goal, if that makes sense.
> 
Yeah makes sense. Will work towards this.

Regards,
Mukesh

> In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> involved in some of that discussion in the past, plus the compiler
> leads.
> 
> Cheers,
> Miguel
