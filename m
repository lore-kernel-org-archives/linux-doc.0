Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE133A9D8F
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786747788; cv=none; b=ggq1f8coJroaG2+vmJ98eeh3eHfT3KriFSEhjceff7pKV8LkMvtIMg+Qq2SLtWh/OSw1/e6sOmzE1HmqI5XhPH/cZZm2bonQsCiCsKGe6XMmGFAAyPQKSDryDIxFzWwsZ5Z9dSRFo4dlptPaRIQVtICukASRxWUCBTMAFHSO5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786747788; c=relaxed/simple;
	bh=Uj2+R/XlIIBkzBOTJl+GOwS1l87hHD9TviV6bZAx7kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpsqfVhGP0SmfQWCYRa0F/06WOIcfPKrREhFBmBRicQOv+VP/bAUPgFfcQ38OBZpLWhE7nw8t3nsBB4W2uYKtgGxuNjkiZg6gxIqIxRfB8X0u4FYOw+MAGpJhaGvNPD8q2an6sn1Cp6mW+KrR9/bwwR/TiHp34+d9XY4GARbo3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3rN+lFC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3rN+lFC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1055820f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 15:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747785; x=1787352585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXr1BCwnVUg1iSuJ2/QuEA4a6oezRbOQNZkSmQqG+MI=;
        b=I3rN+lFCImZcC0GU2DKz0KIxeDllzGi6w9FPm6LQibHQWZrpATi0WW9XF2P8CuK5S7
         KHhidyGIve1nCDBtEbYkuXCCD8A9bHKvvBqCMmcLJhdVfEA+YRDF7YNg2vCpn0cTuF+U
         hWIxaFLD9dAglEKkLVZzcxtCaSzNHVtI21uRFPSzi+pJgpBdUQnHzyvTnjrwDzVGUzvT
         1EOkU+bSyMqshXFBPih4n1pxfWmM0s8HNFUxI6malr9ybS4c4gDnMQkcCsXKXDsihvYP
         pTvvXP+WTuyuBh4MdL2xceDhTi7F5+2mvHr1XhOZP/gSVWq7ypcu+ZjKbTr/hS11MOD/
         jhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747785; x=1787352585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXr1BCwnVUg1iSuJ2/QuEA4a6oezRbOQNZkSmQqG+MI=;
        b=MQNSKWEy03Iy36VKAzUvL1kYM4BYYS9v4IU6cNJA8/keMpcY/uXJCAmazOCPCqNrnB
         +FypYpwNU7gErVpqwcdQocyHzrtfGGniLDNaGc5Vg6Dj7+WUYa7HleFwr58fAPGH7YRI
         cjiQquugHP3zmLZmWawg2RJ/Ag+QBWGQWawAGdZtggNHV56BlJxN4c0I2amfiiURSDPU
         acrpQjZ1J/kv1fcZcApZG27PEBJNzU9LvFelGTJBmbmZ+Kv5UKJUl9PG2XFxpUhBvsdv
         vxZzEmEHonvzxa9GRrBhViNwZjPnww1JIPQPJVqI/O3Kunn0xxMktuDrZ1cspOuIidY1
         qbTA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6dp+Lg6b8cLjjQYH9mx6ODhA8ynI4Rqk89IFQVbChjyrIhlKpTJP20fHp06gsgcw/CrkRtKVHrxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWkXrqB8KuEc4Apid8VG22o8lwebrNzezUiLS31oQ12EYqm9U
	grX2Eq4QUSWe4zTGyr+Pn8AKxSOla2KOnPY/Sq94sh30gmbuDKVRWrdP
X-Gm-Gg: AR+sD10Sjk1gWsEt8OTxh+5p/RVVFIdxmy+rhDVtnllxnCk9ahJZHuaVie0NzSlNmr7
	WCNro409Yu4r/BmyM/HNuGf/Za7MrQ6trK8bYwHalEivZU7u3VlMvIn5jP4oW2Ax6bp+1VD49ZQ
	ZR2hbJwbZBZ0I8tw4+en1eQHNex+Zm2fOiJqh8986vkRZUWNZoVL69cM8luZzEWHnVw/+LLOumI
	dBEd3syPhxqjRnvgjsA/OdEQQr0f2KdvLkzwVTUdtJM8ZGScnEOZez/jE/yeQZ6P5IWzs4f5aPq
	4IUsDg3eLx/BXSTQxfX8dnnNKEjwsuerOhIWytSJBhmRRo4ELqAqQII6/TSC8JzWsydLJ6l8KYG
	gD1uzE1EntZ14ECRxePPno6vomYV9dK59U21FeOJANfRVn3hxZPl4IkPYflVSEHawMv0jD4zs3V
	VsJxffILz4/mVR3afCsdC71dttSJFeww4NgblNlI2+EVF7i2N7/tjkAJuzhb2EydxSel47RXMoC
	z2mOLkpueNXzdpOJhaAFU4yni2MH7yQ9gwGDH5STlCzX+DZ87T0MgG89MwH9UZLxtr4a40ulI8u
	eGop22EvHszkXUHL2nizmSYOQfnaLJMV4ZsWPslO/UQ9q63jclltW0DmQkoht6jKMg==
X-Received: by 2002:a05:6000:29da:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-48160759b98mr8911102f8f.11.1786747784612;
        Fri, 14 Aug 2026 15:49:44 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9d7d-f301-9495-44ec-73e6-1be7.310.pool.telefonica.de. [2a02:3100:9d7d:f301:9495:44ec:73e6:1be7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48294e70f8asm3029024f8f.11.2026.08.14.15.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:49:44 -0700 (PDT)
Date: Sat, 15 Aug 2026 00:49:41 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH net-next] net_shaper: fix net_shaper_ops kernel-doc
Message-ID: <an-ZnZWVWtDemvSv@gmail.com>
References: <20260813192131.21254-1-kmehltretter@gmail.com>
 <20260814101408.13bc8cc2@kernel.org>
 <984e036c-0d90-435f-a56b-ea39a2adf923@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984e036c-0d90-435f-a56b-ea39a2adf923@infradead.org>

On Fri, Aug 14, 2026 at 12:04:05PM +0100, Randy Dunlap wrote:
> On 8/14/26 10:14 AM, Jakub Kicinski wrote:
> > 
> > Isn't this a problem in kernel-doc extraction / how we embed it for
> > rendering? Heading are quite useful and IMHO far more natural to use.
> > My understanding was that kdoc should be able to use basic ReST
> > formatting.
> > 
> > Ack on the list indent fix
> > 
> 
> I don't know of another reasonable solution for this (although I'm no expert
> on ReST), so
> 

Yes, this is a problem in how Documentation/sphinx/kerneldoc.py embeds
kernel-doc output. It parses generated content into a detached node while
retaining the surrounding title hierarchy.

The key kerneldoc.py change is replacing the parser call:

-            self.state.nested_parse(result, 0, node, match_titles=1)
+            nested_parse_with_titles(self.state, result, node)

This preserves the headings.

I tested the networking documentation with Sphinx 9.1.0 and Docutils
0.21.2 and 0.22.4, and a full htmldocs build with Docutils 0.22.4. The
full build produced only unrelated existing warnings.

I can send this as a two-patch v2, with the list correction first.

Thanks,
Karl
