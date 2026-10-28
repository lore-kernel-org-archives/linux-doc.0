Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201264;
	b=SNjXe7pawnffqvTQ+nwnqVifmSdQk2sbAQIb4m5VcEy2kKooE9vO9LoamSIF+b6XMtCo
	 pTIDxhe3CLmwvRxatLY8likWmFo7zCr8+A2tMToRshkqcrfOLJvPUVqM9kfrFMYTxWG0O
	 qt1ooXCJaPfDnWU+fe0uZGAo/0Qgb0e1EUy/spe5PLjT5mcmUwco0ja925XHOd03y1csB
	 UhQtKluWEfdNVchOI+Y0EIyGs9QJFR60PtZrP66V9Xtyye519TORtJL9d2uscRQ9zI1T2
	 6YsUC8e8zO9w9gUB0R5YiH8EEcRvJDMX1RJ4bhsbwwkQmYI91EuUz3YuzsvQEQqDfAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
	b=je7SdTztoz6QSvZdZj7rijr/Ml8Za9SuDOf6NCPYCD/bdqIFb/qE9raCPJcBNXQ5uQQx
	 Pk+1+4DbNrPB8IG9mDzHQ5KJ05TXSAThNRlY9+lM61DDq+R3tMgtkOtspglfVsgZBvtZ2
	 YFRTHhCaexNTksINmWkJGSOn2udpHT2PJjhowiIp1azjpMme5P0KlHqVxjwx1dy8Z+e+g
	 5JPei5qpmUKNPEHfP6ZlK2Qwlr23V6nV1OodPHJgKqrWtlo/M1ectCDiTze8dIvj1OEZJ
	 jzWl4uULRvjHqfyGeMpr65tFGssGzdhiKB6gmXvz1WuSNT5T1SiLXsbqpHhwlxZoAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hfRxv3UW;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E5606A31C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hfRxv3UW
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d290b10a35so560730eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793201263; x=1793806063; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
        b=hfRxv3UW4853Ya5L+aMGqL9c/zDLOUs2TFKfwaIJCPDx4yTq96Z1eEw53AWzmRE7zT
         LCES5c/EKioiYR3UK0H/tQFybpmUkk0PTiWKTVQ7MDAdZ53nYTpkmdTo4nDAxFluoWaP
         g67IkK7SsBkO7Mdsowmvv/nQBdTN7DvEtz7ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201263; x=1793806063;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
        b=J3OEGNfcyaqm5tOS5oJEvLkW76VKZgDB7tZRf22qGiC9Z4wEisjG7KWKjozF56RlCV
         0mNMEP9h7ZhXohFU8TypEiiOMYi25wadnPEacJDti1ozSQbYYTWGVSWR6LEoLfGJIb9D
         niHow3KPKkogxS4eXaepv8CWNNP3VqKcqguL5AmxRhw7iZQJf8k/WsvyPxDiX+h073iL
         4a6EAvavPVO7eQOl1bk0ZwOx/vC9C7DMm+CD08fIN30EQO9lzBRMSZ03eVeuwCXT6NVd
         5IM4zHBtxRuTO+zgVbl1FErhCyi/X34K+uCOrS0VBYAijKDB1KPxwI2M2JTenbt2V0tD
         5S0A==
X-Forwarded-Encrypted: i=1; AKwUvByuJMMdDObFPaLuXKXkCmVTK095htYdfPydiIJ6vciwgubEwLjBw9scYQ4927rlOR+jM97It4Ti3ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjbK+/c2GnQSWNPXBtKu5LvhLfDaJTHKC3jMtVljmJWX/ZjNnP
	Zzhp1yApcGb5chMnW500FUiW7ISA+Uo1FUcMCeqo2YAY4SVVaZDU5p/O2Zl+35gSHDA=
X-Gm-Gg: AYBFou1XjB/wQAzHunsneGV1PDcPah99u308/rrTYcWD/60AaEPNEfzZLEOj52bQN2F
	RMJw9TXpKANxelbUL/Rls3WMsgv+NHKZohbYeVV/X2hk7s9PyHJrb7JBovEyXM/vTJc8znacIcG
	hEDCl1ICX/aJ1JhbeA7Z0kFJrE0kHFrIDa1Szh/ELiHr0zP1WAXHQk2YC1taejZYvhWZp7NS8ii
	RYseBJnKz88ri2VDlE2qc8i57tj66YXdWBsfSxOXYfws/oCfBNPUOX4oYECVAT1MT/vN9ubhXHW
	eFInuy0eqRVUnm8WIRNNWYxWL4Dgcz6xFghQ3CaIzg11OlXAX0kFUpCyqFmz9nOno/gBv8MPlRC
	4zhvo7wy7/uHLgqkA4vXyf4Ib9rXrxEBF3gIZ9F7TpoGs9pSuZXoWuMoeCcXrNtBGHLx+DuFQnv
	uG06KelVcwVhrIb1xlCJA344u3SoyedO7/OZpjSFHMg4qHH6j+jXieEYDKZAgdmOgpd66y1zyxi
	+z6fX4J4T4gE1EMmPMPiPoCgXiC6AyqN0NxFWb24EDl+eW9YZBUiB3UFkxHYmYYUmOJmepzNafA
	db72FsH33GpwPp9qsQ9VrKOiDCm/00bHlEUC8tMd+B19yu4sQgL/pFeEcB6RXhWOwiRJz8vhW/k
	uqu63eQ1ejJ4iq03cZ5jR3cvohPYx0r1YQR4cUxshaNp4NFLuOT9GV3KSN7S9M7F5sHl6HHz0SF
	XhrUVGCGEH0FloUEin9g==
X-Received: by 2002:a05:6820:5718:20b0:6f4:d9d4:3948 with SMTP id 006d021491bc7-713ee7665afmr996593eaf.45.1793201262701;
        Wed, 28 Oct 2026 08:27:42 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71429e7b7basm1517856eaf.1.2026.10.28.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:27:37 +0800
From: Chris Down <chris@chrisdown.name>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/8] mm/slab: Support selecting slab hardening features
 at boot
Message-ID: <auIUaT6LyEI2cXpj@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
 <auIN44CnAyzvR_Ll@thinkstation>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auIN44CnAyzvR_Ll@thinkstation>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Harry,

Harry Yoo writes:
>If we end up supporting boot-time parameters for hardening,
>I think it should be all enabled (or disabled) by:
>
>  slab_hardening=none|light|full
>  # please feel free to suggest bertter names
>
>none: "Turn of all of them to maximize performance"
>
>light: "I'm willying to sacrifice _some_ memory and CPU for security"
>
>full: "I'm willying to sacrifice more overhead for security
>
>IMHO more fine-grained knob for each feature doesn't make much sense.

I think if we did the 4 knobs that is a good idea. Given now it's two, I think 
it seems reasonable to keep it as two separate knobs unless you object?  
Otherwise I think given it will only cover the latter two, it should be 
something like kmalloc_isolation= instead. Let me know what you think.

Thanks!
