Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250949EC5D
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465227; cv=none; b=OVY9/wEeKdlk7pcTIh387zVgf4yuoOppFw8O6UUNCaWSRtOjoTkGtdn/Bg/d8pB2YIXypoYG3/VOLghISyxxFSC/+nHbrF3qSayFAHDTzIpZgLzaPpdi5jli7sAVK4kbMJLiU9UGRfloQm9KY4R6dSxXSdGH24M4FyoxMGtdd7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465227; c=relaxed/simple;
	bh=7qtI5gtgg8HMBmacX6qKEDXcXJKwtRBJ+yKlbMqIu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZ/CgiXcl7tsV5DkbZbWzmrtB5bsdX+xOzCDyjIGPh1y+bQZhmXuONWibB2u/1y4cch19pqsW7Q/UEnENxmmBrbHpR01iMuYtOk4lz9OAK5tjrS5hxNl5RlwkFUfI+d5evAMfK2/QFjkUgnbe9vanHJZzcYL3mW78Vaj7/+TyFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D1SCMzeS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D1SCMzeS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso24303635e9.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791465223; x=1792070023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=D1SCMzeSC+3lNkcoGtnd5MZUOxDZCN3wuNj/aDJI/4LcSRRqrhAqs/Hi9CUNMcqHFF
         scv7iSSgs0pq4DXVtxK1HcP+TX2UMEUKqgjygaUCO4jjwffdRYQ35mFnULVYKtlpTSr2
         NHsGPcZZ4Ck5RTw+UneynMefAFGqW4jY2LdZvX3S5iBQvtZZpf3hZOieucAkZf24jP9V
         NxADxxZhMnMZ1FL/SL8HTUDY6ROMGb323/c7WVSmvIz551S/ndHuV25o7mDAi9hg1ccq
         PKvBQP/BYKJM244I8ccBCcDKG4NhIg676rJptZyeAXQKxlYl94D2DZjm9gOjO6SQD5pl
         U8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465223; x=1792070023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=tuB6GyD8qRjRfDVBnoEmwJHQW5ODTUflr2ROICGljLEmm5rJT5BXHLoIMODjZ5vNuT
         YiT34vC+FLeVkuS8pZpixzS80bRvf96zEV0gd/lQkbu+rFxA5w7K6UizBknr8WpwMpVX
         EH9YOKHj2HCtOXeLq7IllIpN0moZW+GUgB3i8oZmck+pC08y9lqpB66iJg3lGyGVreZq
         7Me8CdLegB1j2ul9kl81ZATKZwWRAa7VCHKugceJN9rLrhQalB1GCeHZQJ8HLCHftmdX
         Lp9Iq4rS2wCmNvBxtDiDKcuVJef3aQyhYazCjNlpp+qIj4lFdMJptJ3uv8B92V85qM1t
         TEYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcMXZ3tsQsQgOY6UCyQm/VlFT7SyID9kl+AWIzJX29BcRGgwVp8t1KDhPFRzEYAQdFrmmQ4NbD+o8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4mTLNme9Kx4JKU0oi8OOvuJcHy8L5Ip5vW6Ohe4Cy45Jm0tnE
	Esq+icV3XCVpd2GCo3Qz5ihZAa+oh2PMv53yqFPIEJMtHb2mER7pVAxuL2JRltZvHic=
X-Gm-Gg: AYBFou35Zh1JOtbxnjIqmpdTS49o22ShL1psuxRSF+bO9fNvxjj26/OS2yRNT3nADND
	mdCOwnrtmRVnsgf5doxnr4ncXEHWTqCuNTuQnC+2aAu0X23OiGhjlUFLFjs8mp9fwTGpS7WbcCU
	rQvv46yQLa1DRcx2RlZ7yzA3E+vwlGiBnNAyjQcFnMqtBbF33/fSTrZjcBmscD791b8InhlNwxy
	tvNqH1hsH4z6sbPO5onbznAiZCvpNWrlmTiFczlbuw3NTqgwYDpxbksc75eNHWBt4JQu85MVE30
	H2aASyE8h3VDJqmxUf/GJlAjNCOdJWcrPQc4QyMLzmJ5UDiBZLVe5tSoYpY/zouVist5y5/Vjqp
	VdbQg/8kf+jHRv/yG8eWsTke33Y4nD4CZOK7w5oc2Vzdxe7+TuzqFAOLXheo6L89WtltetNnP4r
	BIUjWCXl5wbqjMrPGB3j0KlXNmtrBgkM2clQj8C9opcZgUm9zm+Fa4oPFLDmJqK3QkNipgwwLQb
	zwXR4ai8g==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr101498205e9.24.1791465222920;
        Thu, 08 Oct 2026 06:13:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm221404825e9.2.2026.10.08.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:13:41 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:13:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
References: <20261008084956.2911790-1-sashal@kernel.org>
 <20261008084956.2911790-6-sashal@kernel.org>
 <aseRXi7hMWBBc0tB@hallyn.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseRXi7hMWBBc0tB@hallyn.com>

On Thu, Oct 08, 2026 at 07:49:34AM -0500, Serge E. Hallyn wrote:
> On Thu, Oct 08, 2026 at 04:49:45AM -0400, Sasha Levin wrote:
> > Add KAPI-annotated kerneldoc for the sys_open system call in fs/open.c.
> > 
> > The specification documents parameter constraints (pathname, flags
> > bitmask, permission mode), 24 error conditions, locking requirements,
> > side effects, required capabilities, and usage examples.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> I know Kees and Jonathan and others asked for exactly this.  But one
> downside to this is it makes just paging through fs/open.c a lot more
> painful.  Maybe it's worth it.  Maybe "noone will ever do that again" bc
> that's why we have ai and tools.  But a) that's how I've historically
> done a lot of code research, b) IMO something like a manpages section 2
> under Documentation/ would be a great place for this, and c) we can also
> use tools to always sync these, or even show/edit in a single view when
> you want  ('kdocedit fs/open.c').
>

In many, many other projects i've worked on, these docs are placed in
the header as opposed to the .c file, but I understand there is some
pain that comes with ifdef.

Keeping it in the header ties the definition to exactly the location
external users import to find the function - so it makes sense.

But separating the contracts from the code guarantees they'll go stale,
so I don't think shoving it in Documentation/ does anyone any good.

~Gregory
