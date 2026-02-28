Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208313064B2
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243601; cv=none; b=B4UXQ2mzmIzdE/Vcf9nbFp6dXCMvKm1ofoVLgOCSuSybZue3X5iOnpVwrEYW7NmKd0IoMPV50/lUjCbrLanFskeo5nB8sO4hnnyojng8l/nbCviAMMXAOFrJCdZAJld8YplJPIePO63+rQmjQvnH0uEBwCn+ckIEmkefAKsihPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243601; c=relaxed/simple;
	bh=uJBC9++iqt162lkiJOxS26Hv2u+/N1Cek43ZwBUB7Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHyFIVCCZGgkYrg6D35bOfXgjz9Tfdv913Yv8zuOc8Ls4eqaNtcLl5sMa2llN+6db+q0l/Fd+T12wfu7VWX9/aOdBsne36F6313/CkOoKgJXn09EZr1WlDJt0kK0nhem1XPCf2fm7sGPtQk+VuWgUvz0urg4uaMQznUbAKmfzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF7n4E7C; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF7n4E7C"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bddf5091c0so2909532eec.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243597; x=1772848397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH3UsBo2SV+jK/1cDb4i/nx16X7bNeZrLF/ABqKb7ak=;
        b=gF7n4E7Cvt+TjzBEzuJIc7HO3RHpNxZPjVvV3PL6RikN4S+RDXnVKATUksU8Y7eoQ9
         v77n+cxC7aDHNs66iZUP0KfUYxSV0knfFDysbyreUaY7g2R1Mld36WSf6QhZv4k49u+m
         JesceP6d5VoNI8IF5lEOKIyKRU1ymq7gpMaFMONgiIIZFJGMt9LBU6+fukzaqTPbPoLh
         W28y0Y4R6O7sXgq8Tvn1RZHLvtf4bhdjxKxLuPIbEMVi0NyIRIzMe2QNvR5SaQzuJAYh
         iiu5R7U/dwS8JIX3Da+L1QbRCXYp8vFp+cRX1EWLYK1cHKmKfk8W86m1YSzg7zO7ZHy4
         /npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243597; x=1772848397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nH3UsBo2SV+jK/1cDb4i/nx16X7bNeZrLF/ABqKb7ak=;
        b=gMYO5c+WQqqx/Sua6j2VtcpadYJhBLeFdrJFO2SgTVB3qSST1z7XZqKY1tJ9hWqc2G
         nzE/Qqlfp0tlf/ptebX/ARQEYvx1eTp1ofwpkFgv9rJ+83GAn4kayQ/1mKAPCTmOZpsK
         2JiUJFx92xXkidCi6IBSpdkPGOi/uQh0dgWjPhzdxExgPBwaKXVuaje1WWqCrctqQdfE
         oHxFFzpMdR0AF+cpPcU5Gct3qHgQSlQfPFHzbtJhR9VCWXTlBf3Hfi5s04HmpK7qZvib
         1ZspcGI4V3NboytVrH4j3KHcQAoNnv+A2Pf5gCjWPxBBxg1DXKSvlsekWD/8RjFKcOMT
         yQaA==
X-Forwarded-Encrypted: i=1; AJvYcCXurc8wAUW5v1nKXi0aeYFbek1ZYkN5OoNxFgwW/lhPZ5VT3w7Zkrm8iN0BAN0cbdHnTt882lqus1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2eajEphY2p25IPgd9U0dSix8sgvqgOLD7cT6RB9n/cxDexf9x
	8592Y01u8ptlcOcyDjWNj8HEfP5jYDVbDiQV/kbnIG+E4jizyb4QPtT1avLkXDxW
X-Gm-Gg: ATEYQzyvkGqiFcgDK0sfbLlTmAwKAZY6o7PnsvelT2iWqv3Dpi1QbLJOocGByv8l9MB
	lZCgjV26hdJBfBX3A51QDENvW+3DSYoQy0SWjs+D90+IHP1AOlspvgZUZwVo1z/UTzJAVDAmBQ/
	xuE46A70Ih5xTQ/o9nN55NF9BTqcMKTBSYWVLYpJzR22W1wFvBVTmB6haFt85uo3yUt7qOU5TMK
	NTqx6d002Pu/GS9IcxLSM5rFTu7oqILi0QBOPVFILndppoQ+4uAGdSN9lQYSeiDQu4P8798f/lc
	AnYxrObqgXyuWd/N2LAHxclGnAZxhLh2oYsAhY2hxxAsC4i8YkdPuzPqCegrsuA67sS5B9el7zX
	Cu6v3RvwMXZyOFwvjtqS2p4rf3NpN24l+zD1hZIBSNvD3712/zN5dN4hHSD+6yaqRiKP5WvDfYn
	GRw6973d+K9mGN36MhVjxSWFLbm7b1YF+FCwkQ
X-Received: by 2002:a05:7300:dc83:b0:2bd:d04c:a42e with SMTP id 5a478bee46e88-2bde1c1a1f3mr2209031eec.15.1772243596986;
        Fri, 27 Feb 2026 17:53:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0045sm4737697eec.11.2026.02.27.17.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:53:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:53:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: watchdog-api: general cleaning
Message-ID: <766878b2-f697-4c6d-af30-313a3a5a752c@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-4-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-4-rdunlap@infradead.org>

On Fri, Feb 27, 2026 at 05:04:00PM -0800, Randy Dunlap wrote:
> Correct some grammar, punctuation, and capitalization mistakes.
> 
> Drop extra words in printf() calls [likely a copy-paste error].
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
