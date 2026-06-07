Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07F264A86
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780849255; cv=none; b=Mr7X4ha0MTDzFlFPJqw7f8wKxkTPeChFiAB/th/xO1mriTcQbCTPhgoRRHBDU9yh090+Zh0mZP72yDl1Pb+3mgpoNqjAEgnNLsTRR1z8koIWDjbV4eg/AwtOTYHdyO8qrgNwE5OFc50aqGXq7TkzYNKLCXogVNfa1vOZlIcqkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780849255; c=relaxed/simple;
	bh=PrHdqXHWOtXY5GwqkXOIGw0IR8A7wbHv/1b/5m3/WWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzOyHZW1EQpKW1C8i4JLF2+u5E2hygjj0HgWXtWIdnuAAzwQd6MjhOEIpXqJMqeZ76/tUVYZau+8AOMGD+PUfK+8l03ts8Gn1j4rVGtiw7D9yceQg1/1S3itzcF9WvCNH3nDhe5YV3WEGqYkN/1OzdjHbASP7SWOeCNcdhipGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ji5gRsrI; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ji5gRsrI"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91562bf6c12so456252685a.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780849253; x=1781454053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HrqFsYWh7IgIodQ4s8E7nh3lZZmydvw5nlZkHywms4=;
        b=ji5gRsrIz5dSEIZLwMqnq5QzoSBPeGS1RI68PcNvlxkfHVEfVbXZIswgNsL0qHmmTx
         c5j6OovcVkkdv0y22jNjA9kTZzsU0sDMAGB4QQGQnvv7ovvz9f+9mJQ+WW/N+2mt+Mmi
         yz+3p2zZhg5dLBLb8DGwGDbqBuQZN+a0GGtAvIbRRNXRP+n0MHysNDQc3cfDZ1ukfLXy
         s1+t0sZbneTCF4Z+WKgh7HDiffYXmq72z9p1ZwQjMk7FDa+EDz2BmJOrPN9kIw2PZR8w
         49v5Yd1rZgvGXhG9PJ7cYHzR3uTMOIZ/o2R6HEgvfBmy99Zoh2zuH63QApHUFOaaf0Bq
         Vu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780849253; x=1781454053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HrqFsYWh7IgIodQ4s8E7nh3lZZmydvw5nlZkHywms4=;
        b=FRQ6F/Q16Fv+ktjuTVi4zSYUSj2Wrkb7MGUSXNwCvJKBfHoi1j59oB4UcU39UFniNT
         73u7Uf+nNyaibkBY48zEmDqZmY+E0RYf/hTXJLCoGsOdPKP6nHr4cGdCXAUZG36h5yry
         yEel/AUUnmxsi7F81Ja67Sa4nBz33pJYzdDZvsVxyy+bKlSMZh27V9zAvzYFUz08QdGU
         W8VNYNp4E4t7r9aLSeZ/gWkrmPh+GjeUReQNt9kv0M8dpP9IVs1MxXpbgGr+oE8Wur9w
         STjbSlsstPRGprzDKO2jfUsjKT1IELlHOeTTBqptbpXLbGKDx7Y1+7KRG4PnZAdm4brB
         Y3Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/Vp//q4mllMKzl3ZSZDcNC+Wc+Xe+1EfINtglPWX+DzHQEVr7pPU7BeQD8oLcKsC2tLhbV7kqEn00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ETCkQFlI+Fbwv2q7ar+y5XSb6npndhE9dXxFft8c5YVGCZZ8
	+zlXaV+NeYw+AXEvA/eCKo2xOBRx19QBA9baUz1M6oS0glbLlCbQu5m+0g8oz0uo4ng=
X-Gm-Gg: Acq92OHV+bWF6XEI8fw9koOIaTgCactkPQGdHkfIyKdyjzROFYssH4BPY29hmGAoUUQ
	uYsazpHy+9uHrpy4KCeMYX6Ys0R10FmY9QBGje2znK7XpkVb5PDvDCkVBQKWQaWVNu/uP8FKYxK
	xKWUdB3ywFIIygGvDkTTLb2EuyesDelSGQFWc7A86lKUZcEYuKYxDotvTDGw59nApvmMjCRv0bV
	5ccLIfHhobZdPtdNXMQ7NOg5P0m3SDBMkQKgfb3lwzy8Tts1iOj9OCXJjZBXDxHokTs+7H1QyTm
	/B8tevYIg8dPFqZ68rFg0qUtDZstu+/JpQ/KIKQp2vlu8Z2IbSZCcdBA30o2S0gCQP1Mbamqczw
	N0LNRPAoR+trU0J2KvE6rig+q/JNvjg7hBM1M5IZXgBLfod4niKCeYm65+dWhW+KZslaNazpoDm
	RY2BJkhamjiRwfk1P2ZzCyrqjdQ58gynztK24UVodWg8VgtdIxRb/S2jmJpn8keU6cjbiZXUMD
X-Received: by 2002:a05:620a:29d4:b0:915:cda5:2803 with SMTP id af79cd13be357-915cda52c57mr287390585a.56.1780849252787;
        Sun, 07 Jun 2026 09:20:52 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37cab6sm1456344985a.22.2026.06.07.09.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:20:51 -0700 (PDT)
Date: Sun, 7 Jun 2026 16:20:50 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 1/9] kho: split out radix tree tracker into kho_radix.c
Message-ID: <aiWYZhoSOAruIIM3@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
 <178083348873.1648214.11020626647820932506.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178083348873.1648214.11020626647820932506.b4-review@b4>

On 06-07 14:58, Mike Rapoport wrote:
> On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > Move the radix tree tracker implementation from the core KHO code
> 
> It's radix tree data structure implementation, kho memory tracker is it's
> user. Please rephrase to keep the semantics clear.

Yeap, I will update it.

> 
> >
> >
> > diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> > index eec9d3ae07eb..a3ee8a5c27a2 100644
> > --- a/kernel/liveupdate/Makefile
> > +++ b/kernel/liveupdate/Makefile
> > @@ -7,7 +7,11 @@ luo-y :=								\
> >  		luo_flb.o						\
> >  		luo_session.o
> >  
> > -obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
> > +kho-y :=								\
> > +		kexec_handover.o					\
> 
> I don't see much value in moving kexec_handover.o to a separate line,
> btw, the same is true for luo_core.o, but it's not important enough to
> change.

This is purely for consistency. I wanted to use the exact same style in 
the Makefile instead of having two different ways of declaring the 
object lists.

This:
    luo-y :=                                \
            luo_core.o                      \
            luo_file.o                      \
            luo_flb.o                       \
            luo_session.o

    kho-y :=                                \
            kexec_handover.o                \
            kho_radix.o                     \
            kho_block.o                     \
            kho_vmalloc.o

Or this:

    obj-$(CONFIG_LIVEUPDATE)        += luo_core.o
    obj-$(CONFIG_LIVEUPDATE)        += luo_file.o
    obj-$(CONFIG_LIVEUPDATE)        += luo_flb.o
    obj-$(CONFIG_LIVEUPDATE)        += luo_session.o

    obj-$(CONFIG_KEXEC_HANDOVER)        += kexec_handover.o
    obj-$(CONFIG_KEXEC_HANDOVER)        += kho_radix.o
    obj-$(CONFIG_KEXEC_HANDOVER)        += kho_vmalloc.o
    obj-$(CONFIG_KEXEC_HANDOVER)        += kho_block.o

I do not care which way is chosen as long as it is consistent. Since 
this series adds new separate files for KHO, and does not touch LUO, I 
used  LUO as template, but we can do the other way around.
