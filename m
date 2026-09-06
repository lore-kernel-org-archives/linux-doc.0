Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2D261B8D
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788664561; cv=none; b=OWQbXFU7v92IpNE6L5F2kiDiZnj1GuPxs39SysAxFk2VN4si4/cFqPpaCpN38V6kDlEN7bv/4CNEfrTtLS5/itTAUWg6fSvhJPFWHI3gUhyFkV1ynDj4Vu6X4MkdAc1r+JiM7T9qmnCknwlUD8gGplb+NmWvd3yeTpAEl3yl1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788664561; c=relaxed/simple;
	bh=wnKEdiVSW8xNioiz5tzpAsaQzEE4IxibXYVBx0iceiw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=OWgbGR4058YQ5FEO4urv0qeRvs2R/4j1mo+kZoEt88ozfh/TpXR//y3oQ+P9p4syztnWHMMeA+9oMOL9ybyUrnr/bnv6sCjPah3QdhKxsL79Zs+lbTSQUxtRp35IssE52ZajN/CKGsb0b2p8nqazGn5OxX/uCWdwVAGo1VAB2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WepOC3HU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WepOC3HU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so2404131a91.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 20:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788664560; x=1789269360; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PzRSn99Z1yk+7HFJo/h+LBTWNWv/4UJ5Z3BeXY+6DqA=;
        b=WepOC3HUkD+nch3Vd/ApXOyd0EkzVlainWIij5MeZ3B3MIIIllOYNgvtp3f6mjYTrM
         1cI28Bvcrjgk5RKDflTPMgbGvAKzOZbt0fwbRN/l1wONlgtdAlwJZdlWvu3Ruw8BuyqM
         DAvSK3HVEa118iNvj4B4EEfCFErTvAxhEKC3r/1xV4pqebJKJaHTMVMeCtvgGlCwZrGZ
         9hsf27HdsQAQWhBeWLhkUc2Tpmu9Q5TvsbcKqW007e6DGKGcnd6FrWnHilvB4lwGn5yA
         SW6tA6WyrhiRdJCF85p9P7iTGyBFluUbyCOY9x7LGIpfQvkzwh6EZ5rBK+4sj8A7Nufb
         dMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788664560; x=1789269360;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzRSn99Z1yk+7HFJo/h+LBTWNWv/4UJ5Z3BeXY+6DqA=;
        b=GI+GdNnT/IcUKFZYiNFnZnFRlunbkB8gFkePga2Oy2AtCL9wVm2krNxczcXnEO+d6X
         ubiQRaZ4NwtUCgnQOG9VOzM8ntNLQZp4+QdirKLxpCRgsOEqnAM16C1HatfONoM8mFgM
         NoWT4yIEjE2JWYOe9J56ry7bmIa9iE/QdWG5ULpnW26gh5tRQuFHav2QIquo/Yf1wg9c
         c7Bi/VtI0/wWPizsq4v1HgOnvKJhGw7/6fMYdTjDZ3mFD1Pg2hQoL1MvUrRqlRGkmK5k
         KZ+sRBvfhRini2daRYLRjNHmKewlb/LMe+u0nPAP8hHWG8OE3LbPi0lXJJ/rWLr9byY7
         Yf8w==
X-Forwarded-Encrypted: i=1; AKwUvBxftgasxJmqNDUMAhtc7KseXI7G/RTEEnHc+cPAL7zM93oho/oGtL0dG+bS05zibPexZqSCi5yPPho=@vger.kernel.org
X-Gm-Message-State: AFuF++lu9gh/O6oybVjhBkIFtckVFcbzvxwdY5o4vvDta8fmvj74psyl
	bI07Rsu0Sn2nb4yz0d5Qo9RxTktwwsygaN+eoc7KIct+pAw8nYtM46CmePUAHZoh
X-Gm-Gg: AYBFou2IIx/jynHvLkD+MctHivONV4/XDqhSKjDhNXub+AyPSC3rjZSQ6SUABsRWQuy
	P0df1J5IszJoQbrl8zJI4rHcxfVhhQ93zwmX33cn5WA8tx7XJKhMjbBXw/Xylu5fmkV5kHmWgI3
	3fDDNjvD10jouLINaQokXPWQhdnmg7y5rvfcQgrGAJkKG2kjswmZhAqbTiGzBo1CDlyMmvu5Ii9
	Eiw/+F/E9ER85B/h0/91LJ5eVPq5tmUWPjZERm2ctuJTKhs+dN1Co0iV+vuXRGmQGviirt81znw
	rcaPZUo5bR2sUYd5/dCAnouueikPOvhImyX+o4+D6EG7LIDhT07kU5Q1xHGWOWQCQT9IprgCmIg
	vC3hNd11ablX3J5U0rL26E9reKiZTNU2HQ31qkdjOsw9AyGVEAY0j720TnGQ31cx4USOEDBL9SM
	KClKtHuCAdcf50NDaY50B5TFXPlKO/bjM0DUEDmEOhTq9D5gQArsY3OzOnQm6ID1u2o8Mx50eZm
	SznUzspORBNlkGZVtcUlpQC9vor6wBTqgm/egVUQy1B
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr23116093a91.21.1788664559815;
        Sat, 05 Sep 2026 20:15:59 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm14664532c88.6.2026.09.05.20.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:15:59 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Haren Myneni <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: powerpc: vas-api: Use the uapi structure name in the example
In-Reply-To: <20260905104313.43620-1-kmehltretter@gmail.com>
Date: Sun, 06 Sep 2026 08:27:27 +0530
Message-ID: <qzj7xf1k.ritesh.list@gmail.com>
References: <20260905104313.43620-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Karl Mehltretter <kmehltretter@gmail.com> writes:

> struct vas_setup_attr does not exist; the name is struct
> vas_tx_win_open_attr.
>
> Use struct vas_tx_win_open_attr.
>
Thanks for fixing this.

> Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")

yup. Looks like this UAPI name was wrong since day one.

While at it - would you like to fix the ioctl definition too in the same
file?

                #define VAS_MAGIC 'v'
-               #define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
+               #define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 0x20,
                                                struct vas_tx_win_open_attr)

                struct vas_tx_win_open_attr attr;



-ritesh

