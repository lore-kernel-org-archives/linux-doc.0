Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D97277818
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909056; cv=none; b=TwbAGXvwCScfSXUbS3el7xTz0vv7o/lQ63vBe2PHlwb2hGmrMICXcY5tdP47uYtcLOHxB2Bfx/fBiPZG8HHa6C0SciMzIBIa2ZDp8u4z+nvPprIueW78G9rg8R3Uh8vmD6Cz8TPzfAC64DPCkAO4VW1Pp+hsst4HRC+LIMdI3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909056; c=relaxed/simple;
	bh=TPvTAZ95VA5WUsjH0O2VjKmDh4G0B7XgPgWvlhUCeqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq8slj/guQ4cCCzCQeIyp2CdMytNv5Iff6uTG+MaS5XIyxNH8PeFnlWmXoi7uRwpNbWI3tXcTsAWncH9k0eJMeGQSvzFVSHel3pQwDonI5OCs9N9aXNxAI9pDMoMrncwWl7Tywd9pXUHWocOQ48rMkri3xzwYxZ/2sC7YTCL+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cD2YiIdn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD2YiIdn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a962230847so49811105ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 20:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909054; x=1772513854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SO/dk+j9JcFFZVxUw1AfWihYUjLrsfUxcptuevFkjZs=;
        b=cD2YiIdnVP5ytOhYR9k0o8QDXdQLLRoF4DqRxJxS6ljq0o/9iM9kIKCtQEqJiJk4aC
         I7fHqAuAD64DMsFozrtGQWSVGN5dEVuwMuRcuFAolao5PjiIO+S6iW6ruy6ytMhjcIzw
         E2/WLc+OwKhu3GciTkr7DjXUFbehUpNqt4z8iitdvOpJuIVB0ZmK4BwVPja2aZ/Z+HyJ
         TbAxfJnhvOcCgxFpPtvF4aK7OFy7nLw+6ZxVzGjR7DjDq0vsW3omXMxp6hXGGQIStCAG
         IxRpRoNmKqNgrwk6267EREjDh7feaUUECLt3Sf+UAB3jqNwO6e5+zRde2TXi/mwAUYi7
         OekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909054; x=1772513854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO/dk+j9JcFFZVxUw1AfWihYUjLrsfUxcptuevFkjZs=;
        b=YZWoGzW8yqDcbOrCDza/xuXHr/E+ikL1v+3la1hEgezNvapedi+NcfQAJ7JaTEEsHh
         qWGGai4wg6gnw0XnOmv9rujGExKfNSbdZ/owWkil8oLdGZSDkpBRpKlgZd0DVxHQ3R6C
         BlXPhRa8XNMg5UISJT/YgX3o9uuvy/ZmW+KkdLE0nUxkgbKSA0tT/nfjUxmXffPH2DLR
         mCKHyBzMCU7JvKG/Ccgs8mMx7IhPVZtS/kzwia8SlOxhONtE+8RCBvWJWaApA00MFGs8
         tesk4N1epY98mG+V6d8RwBw61hLi/I5kCLig5ts7T+/n494HsV+WuAWph/ZOJmGd2QHo
         58gA==
X-Forwarded-Encrypted: i=1; AJvYcCVWx4+DcSn7NRORnmYa8o2mNuCkQ0N+IwnGcXvWdSaBheLrK9j03hrjGdM20sDAygIhyVQhD3qOzeA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/x9eXetVFkdigd4WeUb3cPG/1Zqs4Ku19WIkZnI4qVRradehN
	H45hGAaJ7lHf8g9mVx0Q6Eq0ikv/Y+dWjluraLE0VLfTineEWfLCUPJjBAGrGIB4n1k=
X-Gm-Gg: ATEYQzwa1GmvBziS7cTIYmpAwn9+P3ELjqFE+S+dz44qePn+9hk4c+0hpXIJLZFFEeP
	tcuifTdDBBu+1ohzgcK4JLKuqZ8nqHDutbaO4/nGIodBv5Aa1DWZgWFARKm/Od8AZ5FMTGBS6S8
	Zn4dwd98MljVqS94Of/+DEjH2mij1cNt9CNJWcm//+hji8BoRUCR+2DOEpTBPIyE3bCAVfF0gFz
	HTpe+fV0TcK4nMyVp+/fC5aHo3OcRF8DtZKd5SyLbFBymCnaA/sZrFGtCe14XiWNws9Lj3UvhdV
	PwETkg137T5YjyKEFPTbhioGWByFfYg/X/HzkPsjgFbalyRA2so0FAWR5XZEsxL0HqgH7BqLPkO
	JrrGv0bNkVsgWAc6Y9SiJO0oPgAYTyF+IFHkQD2Kho1UBsk0fteq0rJPa8LvFMq2y9eVdv8EhZh
	YzNZw9bXiBYF0PzgPaD9NRdxa2EA2t9gl/kl22vwZjTHlVYlSeEH9cW59Xofte9nwfeUlk
X-Received: by 2002:a17:903:1ac8:b0:2aa:e0bd:1c7 with SMTP id d9443c01a7336-2ad743fb72dmr97466665ad.12.1771909054457;
        Mon, 23 Feb 2026 20:57:34 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.77.1.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7505bf1asm91807365ad.92.2026.02.23.20.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:57:34 -0800 (PST)
Date: Tue, 24 Feb 2026 10:27:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZ0vXT2OAOeZ7AnS@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aZwcWfYkBnivrgNa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZwcWfYkBnivrgNa@google.com>

On Mon, Feb 23, 2026 at 09:22:33AM +0000, Alice Ryhl wrote:
> On Mon, Feb 23, 2026 at 07:56:02AM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> > > On Sun, Feb 22, 2026 at 8:07 PM Link Mauve <linkmauve@linkmauve.fr> wrote:
> > > >
> > > > Should we come back to describing the target like I did in my first
> > > > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > > > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > > > is there a better third solution I’m not thinking of?
> > > 
> > > We are trying to stop using the custom target specs, so we should ask
> > > upstream to give you a built-in target you can use (or equivalently, a
> > > flag to do what you need, but I think the idea is to not have such a
> > > flag).
> > > 
> > > i.e. even if you used the custom target JSON, we would still need to
> > > ask, since the goal is to remove that script entirely.
> > 
> > I think, disabling altivec, fpu and vsx with compiler flag will work.
> > 
> > What are your opinion on this?
> 
> I think you can and should submit a PR to add a softfloat target to
> upstream Rust right now, and I believe there should be no issue in
> accepting that.
> 
> If there's a workaround we can use on existing compiler versions without
> the target, that's great too, but we should get the target in upstream
> asap.
Cool, sounds good.

Regards,
Mukesh
> 
> Alice
