Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B1E3DE45A
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046997; cv=none; b=GYDrBBTwRT+jyLwV6zLCMj6C513NbmRaE6C0/0m4Di/yWp0qAsG1B0EpW+Yqr4bESIx2oLInseFpsRe6qbxh5f4Sf1BiPYK/ct1d3KVOlnYarBpBETV+AYNJYjMNijvizk28JI8kS/UzODyCTC+NhLtOc8Y9arT4HKBZunJfmsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046997; c=relaxed/simple;
	bh=2ouheRYAPVivepVFahxoOCkRgEDqPg4oI4DjSnLOeB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oR7qifeMWVZVeIttkBKmQVNrj00CA0ADbwS7wF4CZ5xSV5SsA33Vws6DUsj+TKsIDlGA00L9h3dxmx5ABP/J/4KDlO8lDIzZFxSz1sNrN5trJ5JcwLRbpe1jrRRA1f6ep8XPlEqspab3ZVN4yLr5Dh2Y5mW1dnWQVtK2IAGT+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SLBnIix6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rjw0vtOW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLBnIix6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rjw0vtOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777046994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zynltM+qCB1+gf0Itcd03ZQyLMvAA175jbKGHoVBPI=;
	b=SLBnIix67xe1BaCEkRrr7GrvhNm/0LMQWXgXN7nJKALWaKhnIpSPYnvOUtzKjVgwIq0nvA
	OyvkKFmIt93RxqUfzhkwnfdvrjaZyLXpW6yf6RdZ53n4nfzjqUKK1kMG/n+mW/GTU20esJ
	DKRofNU5Y6gy6yUXEpAF9B6u0Dla0cw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-PgrUwVK-PUqb0JOIEwny4w-1; Fri, 24 Apr 2026 12:09:51 -0400
X-MC-Unique: PgrUwVK-PUqb0JOIEwny4w-1
X-Mimecast-MFC-AGG-ID: PgrUwVK-PUqb0JOIEwny4w_1777046991
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7982c466ee1so184387377b3.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777046991; x=1777651791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zynltM+qCB1+gf0Itcd03ZQyLMvAA175jbKGHoVBPI=;
        b=rjw0vtOW27JBX4TIoZ6gQWnCUoFyOnYx/Ec18lgRztIwl8DJSK4dusVvRK32gn3UmD
         6CurLE5P0xv/LlIeAjIUQORf44xhduC/MdoHZEF0u87t+vyE/Z7o5ajJjkxtgPkhPepI
         rzDRM+CdNpMZgbgG6DE41dWO5DF5IgGsCqyDiSxBciJhDoJmMlvGlhta2YU7sFD9q0CW
         OV3q/VMi8T16ad3Fwx1PloCdTbAaQ3qywmO2rIjPVOTIPM4dExfZEjUGTJzwmcBAB7NF
         EuAeI6hmWXYn1M+4DNYkZfuFkFrnqBSL28pb6UIkZ2fTTIyOEJLWXLpT5iVRT/jdLDaT
         XZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046991; x=1777651791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zynltM+qCB1+gf0Itcd03ZQyLMvAA175jbKGHoVBPI=;
        b=nz0fRrg6BsfE9WKZkchV+i6KlU9w4PoUrNhEMZiVS9rFujEO1ArjUgjGuBHXmCNRLM
         V7n21B+3mxwvi+GrFHeCVwbvUFcVACmlSn9gCNZgIaqJfbb04arhGDVTtD1MuK8wyk7k
         fv/kLxVOcTxGRM3ThIYaNPCEPoFN9PxiwE6uiKEYAfSzn0kchiX0UfDCz0SlnEx68Dgl
         8Gph/j7ApTrUc+V9MVc+jQtsscyZAsJm6L9C+s30UTT0AAoBzMAeIoM2O+4tZ+fJQW1m
         +Zox42mDUD5nO2kvEKTIdSjy/hKfiNdtzXs8ShSO9j0yML86WlsLzskzTwF1CwFzVtGj
         SOlg==
X-Forwarded-Encrypted: i=1; AFNElJ8e7Dc+yesl81GQSqNs07Kjld5YSSZEyXBMOZVlYhUKeDscNXtNdSMw7K4TMNXUEq+DUdpDCSgXRew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wO+Jy6DXcLpxlgNrdQiniyEBwHC9eghyKevoFCoHfnujFQbz
	u8EBOSKh/gvMylmdennd3lfQeJ7paXt79FCDTQMkfHCDeK0RSx5jPYKOfEVjWM+rkA81r+8rNuk
	vJUL77WvPw7twR+oUW1LY2Sg+LK2c3NlKga4B/2Pts7LYbedKkz+sdAHc1Rmtjw==
X-Gm-Gg: AeBDiesX8v0bSq/ea6Or2DscB4E10KasWi3N0qZdFhfEYcLieKcEjnNSvckhmEjbF7I
	pDVXC/Ge3YZBvf9F74YCdq/3zqZY/YTvnf9bk3gn+v2QMkgMDOYq0WB4LdiRS204rpLlw7fNZxM
	rd6LmetDKI5vQP17ROUoruLcVxmypzAnQsJqhRtISf8nr38q+/LMfCKN7YIjfDMK2VW1aewIfXx
	HnPrw4wMgc76cvqRY8YyEaoMwx1QvOUjy+z3AQf+Cxb809LCz8UktbCU8pU4D7retdqbxOOVuGx
	aTcztBWRRPLuTF235uR0igymZDCjCMr796I1Eeb/IGYDz8KVVUr9j84DUOFR/xZUsHogr3sl+dc
	WPBdp9GGIJv9D+Wgbcu4Vfp8Q3jjYlqh2K2/99zYdOiBGExCVPH2o1SaM4w==
X-Received: by 2002:a05:690e:419c:b0:651:cf84:7744 with SMTP id 956f58d0204a3-653107ebc28mr25160560d50.11.1777046990837;
        Fri, 24 Apr 2026 09:09:50 -0700 (PDT)
X-Received: by 2002:a05:690e:419c:b0:651:cf84:7744 with SMTP id 956f58d0204a3-653107ebc28mr25160511d50.11.1777046990305;
        Fri, 24 Apr 2026 09:09:50 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5eaf1sm191939006d6.30.2026.04.24.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:09:49 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:09:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aeuVzCUJ1P3pL4rD@x1.local>
References: <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
 <aeprnnccJeyHB2rt@x1.local>
 <aes7b17nG0cXrtEd@thinkstation>
 <aetZUOINzfTXChLL@x1.local>
 <aetyhki-UD70dyRL@thinkstation>
 <aeuSe0PY-g10KNUF@x1.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeuSe0PY-g10KNUF@x1.local>

On Fri, Apr 24, 2026 at 11:55:39AM -0400, Peter Xu wrote:
> For us, we know the overhead in theory, but we never really measured how
> much.

I think I didn't discuss the other side of things, where hypervisor can
touch some pages and mark it accessed, even if you don't want to.

IMHO we should track most of such accesses, except special cases.

One example is when the access happened because of emulated DMAs, then it
should be marked alongside to the guest access: that's when you mentioned
vhost, and I believe whatever vhost touched on the pages it should be
marked hot even the guest didn't touch it.

The special case is really migration that I can think so.

When at this, I also want to know whether you can benefit from something
like swap_access() / maccess() that I can propose when it's ready.  It
means we can shift some corner case accesses from hypervisor to that API
then it won't cause false-positive even if rmap is involved.  Then rmap
will be a pure perf issue, if it will still be an issue at all.

I can also share at least my plan on our side, in case it helps to find
shared goals. Basically we at least have two ways to go:

Plan A: propose maccess() then use it in qemu for migration purpose.
        migration is so far the only thing we want to rule out.  We want to
        keep DMAs access promote pages, for example.  This will keep
        relying on kernel to do hotness tracking and evictions.  IMHO the
        best and simplest solution so far taking both user+kernel into
        account.

Plan B: if above didn't work, we can implement swap in qemu.  We need some
        API like what you're looking for, except that the major challenge
        to us is MGLRU compatibility.

So IIUC if you're looking for completely flexible swap backends, then Plan
A won't work for you: that'll always stick with kernel's swapfile
managements and it's not always flexible enough.  Then I want to look if we
can share goal in plan B.  But if we can find some shared goal in plan A /
maccess(), then I'll also be more than willing to know.  For that part I
can definitely see what I can do.

Thanks,

-- 
Peter Xu

