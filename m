Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563342F4A05
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508925; cv=none; b=uHz05IAgnwct7nmSS+xCDb5o8cbGVQjYU4dKwfXecnNCvUWzWEyi2+NgWAlOyXZPzy1PH32K+vbyeaoO1fSnOtChAxJmSyitYGkF2DG97X6Idkr1g9nPpMBsU1HgxrkTn7AXav2cxxCF+DljQMmKxby+26krGUkSRiwhNZxYtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508925; c=relaxed/simple;
	bh=/giPkOM8S749gAdpJ+SHhYNMnuvXU63VwSMR0eGe8mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndp5yeqb7Yht/H7eS0uYgqt1EDapE417qhbpw67qcgtKNkRalaM+cg88IlvPnTxowyoEeBDFrqHMylwBQxuPQgy/TBMdCfgJUQyND0b0+rjIhLtE9Mqi8H5xWNRciNQLMQCtZEZY7lhH9iZLHDq+pTs38s/RtP0HggvMHXU0rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neyRZ/K8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neyRZ/K8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a01933b584so32757025e9.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 18:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508922; x=1792113722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=neyRZ/K8F/csSLhtW6yuUUN1gWUdJjjW67ve13ma/j7gsK16yYdjZjM9xlroasCGU7
         7OzAD4TQ9mauM28tTxHor2CNpbDaRR1eN2jSDP+cVueboMKlrR0vBjR/PkWo1NCMvugR
         sYAbomRpGTBmNDVOx1hzcZbjHHe6J7DySlzvU6Pyl7yd63IihXNKmz4Hq48HKs4y5AaO
         w9VqOfSIBLIZLfFFdiN4/g4/POnxfAGQ/JnzyShixVprclONKPPcAYjkMnem6DfWC5No
         sq+a105hGng8+2C9c9BaPe4/Z6bDYSYsYJ6QbHJFTJ9M2CmW8if15DKamZcffJAApn8j
         c+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508922; x=1792113722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=NLAPMo/ENRv7EyiZ7mcA606Wn/BPpIehjjSPKsK+bRKBBQBGXTCjXfuOv+vjqRtj3J
         xRkusTUD0sTGTzeFYdeO/7DxLM78xczpLT+mI8q3BJBRX3KUBOMTI0g+rU8P9BxfPoBI
         mxUKVthW6mNDamlNUe32v8kfTtzaX/yehzeQmhI7iV7YPhj2sEvjiZRc3484LPy6e4ei
         XxLF8yKqydeXlV9/taTGqzp4lfng6L0U434UPKVoXV+VLtf8EhM6xwZf/71HjDwkPsGi
         E9VOLt5l3fEViOadf69qOT5vWJ4Eot+2lz3DegrdXWpsXdvL5JyQ0JeH5g6/U9FuelM9
         F/MA==
X-Forwarded-Encrypted: i=1; AKwUvBzzN0mJvL0TbPVBx94sQ34bKQ413MQJNLogTDybqpRFDq1l1iCVPIVKz/20RQgE8T79ykJNc7WsVLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mvOUSn7J8l4zZNAQkmGGWnwrkBF9mOpkr9dCf1xVR8IhN43eDf
	PnL6iNJqU05tUfnmJHMY7VfSTzz3V5ONd6+b/a0IJ6vdFyqvuY8tEqXY
X-Gm-Gg: AYBFou0Gipt+Pk3kfw0JI8k2k9ruR7jMCe9L9dSzrQMODCLt/G66CNJnMnjcafrxHbG
	GCXITIA40XQ+Kf3BVVeapE5VUW8kh8eD8fmOiqBdgEGoaoc0Ww/AA+bVAmIoHl8/fzqvfeZNHxT
	t8w3aSE5+cLTLf2bDvDbvd3a4nTX+PPU19WLe5sh3Anhaj6VjJQZse4tTFTOzKhTX6oJ7L/2juH
	rTjXNrxyCf3yzZZ9LxyWrEtZdW0aCslbxuItEHPS94srzslXlfFjdDiQf7DWpklwnyCBP/2obVt
	r3b6O+5InBv6xdyIZvQWoIfIBJjFSXkDNqQOsAiPn/uUKW1xyWfLkVsM8K6iDqBwziCLT3ATaNV
	FnqMSZxQVIpa4pl5vdlGYMSi3cLa4V9UJXSJGb3kc5GH1SdomvI4EGiuZ1VjH4Fw1dJfpC2Rwpg
	VpXg+ph/JA6aTL/FamuTSG+QT35qbh4sVrUKN57VjDeOPNuYriy5+/m3oCshPDtdZwXhYZ9Jns0
	AFKwHix5Fk0x0/ua6MabpNBrr8sSQbnUtUYkHtWIjZ3y4jzxIpBgg6WwBjCSxwayKSAWLBRnf7h
	DRLB8za6pByv8xf7MPfFvQgLFgbp4U7lmBhPbb1DpdS3cxKIYrXRazgPGoRUV0jDOPKMrH60Hjr
	dt6DrLDz2y0vhqpMJkG1zz5CoUM0ozKW/
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr3757845e9.7.1791508922467;
        Thu, 08 Oct 2026 18:22:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm1207925e9.2.2026.10.08.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:22:01 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:21:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Message-ID: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>

On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
> > +=============  ================  ======================================================
> >  Architecture   Level of support  Constraints
> > -=============  ================  ==============================================
> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> > +=============  ================  ======================================================
> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> 
> Can we say "ARMv4T or above" or something similar?
> 

Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
alone would cover too much. It could be

  ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.

That is longer than the list. I can change it if there is a preference
for this form.

Thanks,
Karl
