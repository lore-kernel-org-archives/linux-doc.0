Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29720E030
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759943136; cv=none; b=GetxLCfLx+d+CfwcfDireoYUx8ERiaTqzI2vqBYLyQsdwOTGFmrhJUSjPBLax8LyhI4RZcFTH4zpjk3pmiJWFvBFQXD2tifef+M2BIhWbr6VSDzbnDfdVbKCxftEfgoQdRmbB31Ew1qEq4LiEiY/pxrz80fCr9o7s/tHTnTIi7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759943136; c=relaxed/simple;
	bh=lykQn+FQT55p68zRDbABBcOsa9TTYqQN8lbfQUCfsfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG+N1xgCNrvrgYevIsvuJQLWpj6gkRRGr6y/hAz77qrjRMfCN4TlTHA/cyblbKoDYB/8BidN74hmyvdwvDHAf5EIYgs8jF5KxyOOp9+lY15VmnOoIWXBHGuwsRnGmFlqO1WK6W9e3ZZU+/AAM+xoPqRecunoNA7ll6FrGFLgp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EvH+GnTm; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EvH+GnTm"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-85cee530df9so3522885a.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759943133; x=1760547933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PXvJ84I7DoVfJBSKO4yOsPRB7++PVFt2jBMWq/ZPjB0=;
        b=EvH+GnTm+k6YDM8esAi37vaDX+VvfVKdXkH/voeTh7/oothCZg+pvk0hIni90+aoBq
         HIoI9dvfe0/ayaNuYz5s+IWggFAe+4gpY+WrxmvxE5rO+N74IoaVEKqTPKat2Ydoj5sp
         cJlg4JNJ7MirffoJvMEffpuQDPozToeFWWw/KUO6fbWKAOltLjobC5rV3hMKPB1PWJol
         6N3t89xTSOtUD+4PXT2u7wO8IU2aMajIxee5LdFha+VOfR4y+r1vkCtJw+a9WXXlXYKW
         1poyoR5o27mpO6vPCeUNDiBGuCXxZzYOYRhcUcqhQ82bG8fz6qV7Zsjcv7jI8maT3xCE
         HYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759943133; x=1760547933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXvJ84I7DoVfJBSKO4yOsPRB7++PVFt2jBMWq/ZPjB0=;
        b=lyhdAD2ci6mFD5K47D44Gc42WiTzeQhcsiqHrcGWXYGFQAVxrhiCbJbbkxpakIF1KK
         4oylsRZiehKEnE3tjVCRNa4u3kH9ATnPEq1hUuhQwmac192xOc4VoH5tqOY+yKvL+cde
         HxxpKKHAsYQpGiImZprXmosIffAVxnZdLNtfDmPHLfK7YYPWSfzRSZEy+gGVRNx5KN0z
         8YNC60qYnh7iiJbnSv48BnB41YoCdiZ+EV13JtnBGm5otkK1JldCxQaF6k2Qlkr9lFbG
         OQRlKJmQI0mLwORiq2zpxN4LoBoLPom/EnZi6gIK2+wuycqYKVdI5KWoTGdGwCwDGafE
         0W/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2zmgsWsBuSlc7F16bjeReiK23UsaIGupQfwf6JJXFP+eoINOuMuVdEsxGwcvO5zVXBHptVcPawKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCErvUM55OqlTFgQ4E3PF+Wh+z/Y4yC5mUdvFzBBS6e66dxf8
	G6EA3YQy8KgW6NP+UnrGlq5jiJSw95NAMpJB591cDyX3bURu6fRXtZVqFpBbRQ055iw=
X-Gm-Gg: ASbGncug8vqmPzLPR2GIQTbbNp4XRYqjL5mOlHdn9JI7pqebQc18diOEcFgRElXV9ah
	1DBUW37vsTtxW7DjF4PUZw5H6s2GlIEjDN1Tvo8ZCgj+kDPTwpRfW8h6I2BS5s2sx8iq6e8vBNf
	9FBbGanPrKE2ADk03gIeSSS9TM5sf+EyIewbcI7dKZLZjk6c4I1fU7u3ffuAwbtYf7BI+ej/owx
	sb3BVGUzEhUzb6AogkblU8upiIUgdFlF0bDYZXZSNhJhDaHJlthw726j7IktzYIPK4CaoOQDp6p
	jzhKWj0QDGXocpuLV4AM9mky5mt/za/VSmTjmwXrxW3u0klpSUcpBqr3KNcWWFVM6loSfzBApuN
	lIm5HUiUYAaqky1JtbupE6zyD4dJLjt1l0nW6PptpUzkn5DhKnQXfnF5/rMZuC3+wVFsjIzQRR3
	npmao2VDz2BxbIKpNSYVOlY1oYLZYD/59uQvbjY2YP36y0qqVWOyE=
X-Google-Smtp-Source: AGHT+IHTTVXTCiYKFRjp/R7MyfRa3HWK9EIiUGj0jtPBpCzSk6p5BgpHTweDq92wD5qHBCW74OIL9A==
X-Received: by 2002:a05:620a:44d0:b0:863:b78e:d159 with SMTP id af79cd13be357-88354ea751amr597920685a.51.1759943132915;
        Wed, 08 Oct 2025 10:05:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bdf53343sm168514456d6.54.2025.10.08.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:05:32 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:30 -0400
From: Gregory Price <gourry@gourry.net>
To: Frank van der Linden <fvdl@google.com>
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOaZ2o3l7ufX-9Ly@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <CAPTztWaH7mJ3ACfqqYr1CFCDycw6Zm727t7wAa4n9Th22bn-yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTztWaH7mJ3ACfqqYr1CFCDycw6Zm727t7wAa4n9Th22bn-yQ@mail.gmail.com>

On Wed, Oct 08, 2025 at 09:08:01AM -0700, Frank van der Linden wrote:
> On Wed, Oct 8, 2025 at 7:59 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > Maybe what we really want is to have a configurable zone rather than a
> > very specific consumer of it instead. What do I mean by that? We clearly
> > have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> > zones. So rather than having a MOVABLE zone we can have a single zone
> > $FOO_NAME zone with configurable attributes - like allocation
> > constrains (kernel, user, movable, etc). Now that we can overlap zones
...
> 
> I agree that having mutiple zone properties is probably the way to go.
> 

Ah, I should also mention that I've been kicking around the idea of a
ZONE_DEVICE allocator - but this blows up pretty quickly into
maintaining an entirely separate page allocator for non-general-use
memory, so i didn't want to start off with that until later.

tl;dr: pgmap->alloc_folio(gfp, order)

Then allow driver managed memory to "online" this capacity via
ZONE_DEVICE and integrate *specific* areas of the kernel to use it -
rather than everything.  The device's driver is then responsible for
implementing alloc_folio(gfp, order), and a zone_device_alloc() is
responsible for hitting all the relevant devices for a compatible
allocation.

I alluded to this in the hotness/compression discussions - where there
is some compressed memory you want to draw hard boundaries around how
it is accessed/mapped, but want it available as a demotion source.

https://lore.kernel.org/linux-mm/aNzWwz5OYLOjwjLv@gourry-fedora-PF4VCD3F/

Not sure if i'm just overcomplicating the discussion here, but if we're
talking about new ZONEs then maybe it's worth considering something like
this as well.

~Gregory
