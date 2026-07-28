Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B53AB291
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245955; cv=none; b=nt2do3C7mN95XSfgFjXK1fOPnwphr4OmS+F/1LUB1ufYrak4ECTgwgz9CzKEOmx+rA1xNyWS/ZWnpgVS2BLjnBPMIxcxMyERtPAn3ilY3RTQJLcFzH9VPsZm7lkKD/AuDoyJyGSxi7/WaYwYLdcATCC7y90cYBhyh1pJr7hDHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245955; c=relaxed/simple;
	bh=m1hRgnx9KR+o6rJ46yZExEf2MnNgmZrIfD+GztQKaJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fslCU92yoWr7VQb6dNS/dCJE9VNqkYrz9Xj6a5+ylNrEdpDft7ALSKZg0klzl4brnGP8r7agKqth4bZHixIDMT2qvN/x7NddhEWse0aDRjr/1sAZ1mXcYHYiPQRB90W75SJtw+bApcUnk2mR0qYAV0kkNuyieczfsYc8E1rl0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCTRXEs9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCTRXEs9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso44165535ad.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785245953; x=1785850753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWLSoQUrxbW8ffU1hMIvqVbw2cAnieAmgRFRZP9/rN8=;
        b=QCTRXEs9IyUwJyWWXi8NydHdeEb+oC2X3K+o2u5JupICyfeKwCI4w4WhiAYrlf9keB
         emaW0z9Gvk0p4VyLxlwLf5k0My1IoTp3BDPGT1QnDpHuNwThssRsUQ9UHVQsR3kobV0o
         SCmnS5w+snhLkztBTty4dqMn4l/89FTYDBK94L4NMtlv3VujWwcqtm6FxwmvWUTuLf6w
         xz062Gg38AtZ8z2XnoRxa8hljj37sn8Hf8VAFTiYvEsly5/B2LS0v5SB/dq7Wwam8mWG
         rk7DdnsNwYHFNBHlG76yXRNYd1NUgUbTJguQcr+GIXAcOn9oWsJ8bqMu1o1Lcl8hfuCR
         h6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245953; x=1785850753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWLSoQUrxbW8ffU1hMIvqVbw2cAnieAmgRFRZP9/rN8=;
        b=Ml0fwyKZq21hs0sKEMJX8wAl8Fd+ZhcCDIlwfrcpbe+AVgDmwK+lYkG/BUeQUHlL1g
         QVY5MX4Mw1vpiGuALWzgnbXlanaJQKPRLW5EBCATbSo5i4/J7HIwO+6lIkCfi0oFYzvT
         WlJD/OG+pOfgPk+EwuSLZq7vY/YkgJV3JjISCwgOPpyUpg3xuAAWN1QqYuSL5hT3vghH
         LwqLMOEnrBlG0ZKfy4fOVfBjnhkThdrxM0zDH1lTtWVhm0LF/81WzMOeB7k/E4x+WHFt
         Fvhu/pbYKZ8K7knFoybKcL0mABNTj0CuuIsUfcH8NzPucsf4+pY2XamUZHaSv/k5g8Ew
         in4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrus8N+bE01ZaS+ckCr5FEAKZxC3OXBcuxnVJ/mJdqa7ITrDaTiVnbUXAgJ6L7GUB3zaBaDXn3PMkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Gvfj6USazkhrLosZsE6O8oYvdBWb7wlrQL9i1/V0iW7gItKX
	jgVs5OzwU1A9jD8Ffz/zrgY0HTnFdpqT+nF1w0BpsvokuE4fsi7c6vK1
X-Gm-Gg: AR+sD12/k1mFoFdn5Y3o2KipLOQBSlpzXpLXo4FQIicCMoB3fR93WyMUzHQI4ytByIh
	K4X51mh2sfZ+osSDhFS9CP0/0ywAAEAT2ZjSy6gfiZbruy8O3ZL7w54DPkGWDTkYev5ldbgnhKf
	9G9ZNWZ/wuH5yGeISfRN1oPZrhhXGmmatko+rBwIyrKHaxk7C92ePy54ep3UxeKhll8yEGV9604
	oSvNuRieQsglLZdA+ZcE0hsY3xUh4cmdIy4Pj0axIoDG5xdPrsdMHcfL051uHm1pFWWVxA80cuj
	3abQYSkYwMsAIx3n0Z0D0Q8grVcdj2ojkI+HzoENTnGfiE+E31nWCxxkpKgFahQH3GBNW+vEl+4
	EPtz5C2bN4ugqX5HG+uqEthO3LEOCN5Xd+iKKIEy4w4bh+tSd+57MjaLVNdQflJexlpeJVyYRul
	oJ7oFSk1eDHT5duFQHzB+RyRk7y7TV5wl2MauR9tRxIRBkKVfwK7EssdDbHqF1uqI=
X-Received: by 2002:a17:903:2308:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2d015d22fd0mr28987505ad.27.1785245953525;
        Tue, 28 Jul 2026 06:39:13 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80ee56sm52793285ad.76.2026.07.28.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:39:13 -0700 (PDT)
Date: Tue, 28 Jul 2026 19:09:11 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: trace: fprobe: fix 'thos' spelling
Message-ID: <amiw_5EeKOErKhD9@acer-nitro-anv15-41>
References: <20260726065633.20897-1-shaikhkamal2012@gmail.com>
 <20260728214645.1e0584e6e654bea696294662@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728214645.1e0584e6e654bea696294662@kernel.org>

On Tue, Jul 28, 2026 at 09:46:45PM +0900, Masami Hiramatsu wrote:
> On Sun, 26 Jul 2026 12:26:33 +0530
> "shaikh.kamal" <shaikhkamal2012@gmail.com> wrote:
> 
> > Fix spelling error reported by codespell: thos -> those.
> > No functional change.
> > 
> 
> OK, let me pick it up.
> 
> Thanks!
>
Thank you Masami

> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> > ---
> >  Documentation/trace/fprobe.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/trace/fprobe.rst b/Documentation/trace/fprobe.rst
> > index 95998b189ae3..46dd46a97c1f 100644
> > --- a/Documentation/trace/fprobe.rst
> > +++ b/Documentation/trace/fprobe.rst
> > @@ -118,7 +118,7 @@ will be cancelled.
> >  @fregs
> >          This is the `ftrace_regs` data structure at the entry and exit. This
> >          includes the function parameters, or the return values. So user can
> > -        access thos values via appropriate `ftrace_regs_*` APIs.
> > +        access those values via appropriate `ftrace_regs_*` APIs.
> >  
> >  @entry_data
> >          This is a local storage to share the data between entry and exit handlers.
> > -- 
> > 2.43.0
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
