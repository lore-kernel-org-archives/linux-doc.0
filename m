Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962F349CD1
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178950; cv=none; b=EPoyR224Dk0RgFLS4eWeKGhDCEVKU4aCsXtAo3P8W+8azc27yVbzrfclpniPXaXjSo4VezlFaRUNSjzGBvbwGdBFXv685q0JJdlNSBOt3eEGJUy7k0p9rcrQr2mecje+gW4pCLBT7cWM9nYpFgJ6Tldlsh1DgkVLiWeuScUek/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178950; c=relaxed/simple;
	bh=JJpNBZwIaZWRBORwSQX2UvfRtD0C/0R0+WBroR+DQ6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr9VIs/otCcS/QCqFH19bILj8v2C2MBgxcSE0B+3tSEF+YYzBGFPOlyjtR/Liq1rBHpdPDEUErlPj0rOaaNOx2ZlHNNyx6TA0yfFRH1Xe3kQyL7V5FS7zdisFceaYDPFHAgOReZIvGUn4k6cnuQUObRuCpnneemb50uSXPunjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XRRvqBLN; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XRRvqBLN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c1d487f2cso20999671cf.1
        for <linux-doc@vger.kernel.org>; Sat, 04 Jul 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783178947; x=1783783747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWvMpJ6vVFy/STzfc3oW5UmrUK1xBjIYyy4n15fLuTk=;
        b=XRRvqBLN4ncVyhvjVzHqyM7ec4Imcl2vryRUQJBEb4RlGN0V5qAmXRbs+6kKxf9qeZ
         MM7yzern3FjE1ed/SCStlmLmmOwmWrLMz7pjcXcIS2zvw1xdpGPwxJVzZ6QxRXpkuZGW
         ZliarqOR/TtSnTAeIo23QJODGAetzRs3ZMS7EAMuMmHGpINOlziEZ9UQO/5iBzRog+Ud
         mv6Q8C5uPZ9o+mmhVHOttS9dyo5NzQ18AVe1jI2vUDJSzvrWkdlJvry6c3MV6Us/E4OH
         ZWBP23RY/TUQ6r/a7CLAVftoYat820LbLzh/3q2TZ/96u+pXAcHKGhzAyW9DCxaVyNBs
         kNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783178947; x=1783783747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWvMpJ6vVFy/STzfc3oW5UmrUK1xBjIYyy4n15fLuTk=;
        b=RDDsTdkQbMHLSFSE3CnbM+QhHaYYoolNWqSNJVOnF/y95oVuR9+jd82IhHnqpxlsnD
         DBiwGH64MQ2oApRyJunvksre2OunCebqoOyu9u+DNCQBxIWK1847VMv7SfJwcKFcsHdj
         Wd/iRwFiIUegJt/i4MUc4ZwCTCOl5B0aPMMbC47YiqU3o6mLtKvsM9CJ05LcI1kbSDTl
         Kvzu3NPglI51P6SIKKWvS3Lb1G1GXDV3Bl+vkyM5XBPr7z8ZFkTzBMQ9uh7gdvFK3sx1
         R3smFrhms6R7QeQXnN8CvBQfzMekZtJ58yUoRS/wqMVIiRwQPMxknK6juGchtFK8bjDz
         R91Q==
X-Forwarded-Encrypted: i=1; AFNElJ96kEjWUbevdnTmJ4QGEi7P1M14TpjB0hlyQYHYhDdijj8cnrNxRfjlsg1IW73BtDYIakwIgvpEpRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXivStOo5ELy6ugjzvFuWSeHyW7qr6Kd9m1ydvMkq7rkgcJKl
	Um4pMfnhhvU9jbkgXyZxDN5vPvlxxuen53rfqgS1Oi2xjaPjZuPa7jjRvqyp89s6gsU=
X-Gm-Gg: AfdE7cmVhwFNRnlhsvyIApVKcNbi3N1Hx357zRPR6z3AwTic+j4dgqG5bATs6DLzvsR
	iE56qNZwqaMPo1jcoK5+th6l1F3/o9RAk47J+DIvZCCiIyJvqGgIosui7jL90Yj3huCD7zg0nJJ
	D5mUZLq5EGk2gSr6VArJTQc+9yE1nBXL3EeJfNRANkMjJQW5i1FjGPRKcXxR+qJtnN3ucTWEeRa
	VsMjfLFN4Jr3tK+DSgNQ/o9cv563WLVirmP7m3C+X2oQ5gX9IiKhMRwkB7qQ50l9s1Bp8X5cPdi
	uM4J1uH2dDNUhj6dvTOOF1nSbCJI822WwFhOt+yYkcICLdBg0mr1Ej47ZnjXVnoKWsAmHE4q3Q3
	dDqgAJGZYi2fVtocXDTdV8OaIaTrYQuTltGOPwJlrCEoATOo6RCgkwJZhqJbjn1UDHzBinCTaRV
	d9QXPfR2xGAiFsH02sWXZvIDrM3I1uzazkRk8ThvJRNss=
X-Received: by 2002:a05:622a:408f:b0:51b:feee:b08b with SMTP id d75a77b69052e-51c4c2ad144mr54928601cf.45.1783178947583;
        Sat, 04 Jul 2026 08:29:07 -0700 (PDT)
Received: from fedora (50-32-2-77.vng01.dlls.pa.frontiernet.net. [50.32.2.77])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41ab77dcsm42756101cf.2.2026.07.04.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 08:29:06 -0700 (PDT)
Date: Sat, 4 Jul 2026 11:29:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, peterz@infradead.org,
	luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
Message-ID: <akkmv2fRxJIsbxq9@fedora>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
 <akklLLPZ1fbcZRML@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akklLLPZ1fbcZRML@casper.infradead.org>

On Sat, Jul 04, 2026 at 04:22:20PM +0100, Matthew Wilcox wrote:
> On Fri, Jul 03, 2026 at 09:58:58PM -0400, Gregory Price wrote:
> > +config SYSCALL_USER_DISPATCH
> > +	bool "Syscall User Dispatch"
> > +	depends on GENERIC_ENTRY
> > +	default y
> > +	help
> > +	  Syscall User Dispatch lets a thread have its own system calls outside
> > +          an allowed IP address range to be intercepted and redirected to a
> > +          userspace signal handler.
> 
> I was very confused when I read this.  IP expands to Internet Protocol
> long before it gets to Instruction Pointer in my brain.

Hah, fair, i was just going with tglx's [1] explanation.

https://lore.kernel.org/all/87a4s8m69c.ffs@fw13/
