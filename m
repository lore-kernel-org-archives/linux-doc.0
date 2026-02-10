Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA32DCC08
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713069; cv=none; b=Rryw+xsIz2dHac7a7eIiTnXEvo4Jm5+Sj1711edkfRkz1WvKxfzn08EOwSoiDO9LFNkIpyHj4dxL8iY4altMsH/q/GZvHMrGb9pSe46A4Dwmt16MffMs7Kupye2tiJK0vR4uAyaemUC7g9BiK53v1y3UdC08YFnlPEmv2xM7mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713069; c=relaxed/simple;
	bh=OUxjBS4Rkr6nocfLv8sYXTRp05YRB0jmAsFlvQZFJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw/5T1i1FfGz3MMgEAkFAGvcYixgZbrdC3vE4KQVTFc/CnxPBubWZs5r5pzgcmzfr4rTmYWoF0vEcD890/EDMKKNzJ8l2C4CWX+JyCqh2ynGyyDDFBYMZv8Q2GCG/1OGgcL3beprphFNPO4niGaUOnPAsGn5Ll4aoPRcTJVozCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfZLeIsn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfZLeIsn"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c61342a69b9so1390327a12.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770713068; x=1771317868; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=YfZLeIsnYfjyFbB8wZJnh0q0XJGubl6cMq5PuX5E7N++4Tc4xniMVFiwcJYAS08Xix
         65ppLjmDJp14R8hfmRvl1OPhbqZ8e6Yxmgi2vGPiW2UHBxW12Mv9UG0AMqtzbxDh9Gy+
         Gr5a0pbAKJyiwKTLfnF0u0BJ8hLtUAWZrFpNpr/u79yXWqTTSSm3EdD+0aQ9g20DSjm7
         GlpeWStofSi0fYsdToxrd6r4/V/rSAU+bK/7mG7/a2hD904lCYAvX42EF58e0c+CNvs3
         Ec5HZz+fvdyoJ8Vi4L1L4/hYG/AU9zOd65p6byOEBe1tfNuR5EJYPmzZdwnt3g8BrRkN
         Nk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713068; x=1771317868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=VY/2e7oM69pRSjtBKEfNEBa8ULnw5nXnrOLdKtUj4yNkQER+Y1mVuuCISTaXZ1dtUB
         knJRnplX0wOyRcLHArRciw2CyyrMYwjLgBatdpg+3Uxyelp8NAQDz/VfgBpcgkm6vhOP
         6a1tEKjjCRZf0bdP+se8KjPhujSCi4BCXYFvbQpxL1fCeZck1iKEoT0nYKbUekanCY+Y
         EJTSEQZDj6f0nA40z93rPvxBuut3Z0hN8sQioN1PUzajKkGYUcecTtEcY9obplC8gK1H
         EeV7bU/qgye5OIs+hRmtGxAybDFMa7k/rjpUy9iu/5NrWEw0ICHe9G2SwMecR+SzpftX
         2JwA==
X-Forwarded-Encrypted: i=1; AJvYcCXVfXP1eE70L5ErtBpUpBpU8cq1szevTB/FkEaM55nfVEvkvBFpMWpVpiBhc0QPSL8T4w8aFGDPvQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+JQKGrXSdGukBJ3B5cLlLY6NZDhHR2NZfRQ/O6u4dVlK+GTv
	RxwWU6frRMSG4IrcBr+PNLLSSLULooE4uEk4N7iJNkPynjohMDGHHCsU
X-Gm-Gg: AZuq6aJUVV5vBaOghP/AQgdqwYpayQukwf+5ID5J0MQHOwqOkj8WnrUKrO+sRaf/yUI
	MbbnDnVuWOjMyk3sVKIpawE4W7UKCKT8/ozS2TAvmCC9TIAv5G+FMIc84Qs1ialfADNldhW1mSh
	uwVbn7zYNzWBq+3Tv0vb/buQzNZAOd2gyZLwclWBUGirah7p6eQeZYkeH6Mxm6u3AqTF1mpe31p
	qEMnBhlp1HfwwnoNONFBgy3V9U5s9i7Vn6SIszYcbh2mHfrbwNTzCr9wKCwxMe/WAXs47tiN+5+
	4A3FOxuz3REHnUah8RdmhwV8BWKa6JhWbTzXLKgbR8Bdtl9tFldvjIC03veT9aKy7VkMbCTUxrL
	+99a1g9txoEw3tmlqIbYZMmEKsonVmWy58rBfo/QypShvJ3dE9Fdxb3is0fndF4I30yQi7GoIdG
	qwgA8SsnqXuYJvn4159nx7eJ9YpqE7+IYSzarGjksyz4Hg81TPSfB14Sc9yUmwDHGcRw0=
X-Received: by 2002:a17:903:1aa7:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2a951633be2mr147756965ad.17.1770713067767;
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm125873775ad.30.2026.02.10.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Date: Tue, 10 Feb 2026 14:14:17 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrvZB0FeiV5NzpD@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
 <20260210053756.2088302-4-mkchauras@gmail.com>
 <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>

On Tue, Feb 10, 2026 at 09:22:36AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 10, 2026 at 8:18 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > -``powerpc``    Experimental      32-bit Big Endian only.
> > +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
> 
> As I mentioned in the previous version, this is not a valid level
> (same in the previous patch).
> 
Ah sorry, 
Will fix this.

Regards,
Mukesh
> Thanks!
> 
> Cheers,
> Miguel
