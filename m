Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A1257AC2
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759952649; cv=none; b=sYz/Oct6NzU+Vi5xbK0ryUJj5MHpFG1WqruL95hA11sSAoW3N2JcpnO9gSZ2uYV3Xe5mL4lrLHfYgdLrJGCq+EhUNfLz3QAoIlAIG1BMKSEzFhOaMqMOsDejTM9RGOqOyPcv5+dOJkq+FsoVNXxLWCosAcgjfnteQG5CWm5hbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759952649; c=relaxed/simple;
	bh=0sHxe3ikfgkbYfnXEhUGZNytNU5bsJ5ilzWd0eHp0mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMkmwQpHk8oFE6JsvJEWzcyFxqJNBJ42+zU9u/NRn10CCHRFvbcjC8xdQc2tZWF7aI78Yd1g2i90/8dTOPUSTNAlNvV2cfF79O2ndB6oab298aYV5QVpzVC9cw752ixK0PTze0Gg5ULQVCfaZpnKw9ca6J903eVJiNMYcTL07Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j/J9SFLj; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j/J9SFLj"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856222505eeso18832885a.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759952646; x=1760557446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vflrBSpkNsrYFG4aEkF621olmmdCSiqIKbvUazecPWQ=;
        b=j/J9SFLjcOsLVcOE8tjug1oTDxWZYi860fXcMZQ8j9AMeBoi0GO87wyNjkzzShcDS7
         Z98x4p9OpCKwq+ORSA1bUJqnwKoWIsdbYM7gqIQPU6Il59lq8KJqNxoBrRNd8Nnsqp2g
         WYsWJ+0/ioYfoKXbYk0o9wdM/0FFLIzLWqfiT8ZZB5E4AcV3YRFSfA61rsyI0zCxx3oJ
         4oRPNNxLNUbJYb+RP4XiNFPR5ec8EF9RR5138/Q05h306LvB+z/ttfVGjbBjAc0L/cNA
         +koFWZDgKaI3lZ4D+RiHPMrsZ11jMHkRux5d03NH7v9oHHY9SaYgO6TDbTJdc44XopVb
         QL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759952646; x=1760557446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vflrBSpkNsrYFG4aEkF621olmmdCSiqIKbvUazecPWQ=;
        b=qk/n5BEnDrMM176mytREvhR4nd93UsJKYjQwDcc+2Tp4nNysAIHXYdlD1FIJ4hgReq
         MdJXWtEyLdJt22xwVXGVUMPWyDvQ19UjjeGcEryu6rk4Qss61Qc8JkBIN2LpOURljcPW
         m5zYQsnCcemQMc8+bk+EiWAiCe0DypPTyO6wfV3DxuTYS2uF2+Ys7xVX69HP+gijZyDm
         TyLta73UNNS84QA/tNU9O486uSqUDQ3KkLgsohQ7Zmczv+fJ0eXb3v3kiQuVnE28k6wc
         pa+fl8t7zCuCxXYa1tKOkuLfNjMYqLvd7UqXjO7mzUfR/tmpVATZlh55SW8lMK/8IcB5
         gTWA==
X-Forwarded-Encrypted: i=1; AJvYcCXTGjb1vaKt29Fqyy/jy/Q6LOxbfllmECdAU/XoQ8945xASOEM3ct5XhMH8Kjk+uz6NSJZrvzcw0jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFG/XFcmpFm00FLoXia+cMVx+57flUa5/2vc42EOop5LO92jf
	RyxzbRerviAZ/tV6iJWFWqd9YX6yDdvLPfh3g3Uvqm9hqVwNBe0idKjDmdglxt2RkkFqegP9U/v
	ASs2p
X-Gm-Gg: ASbGncv1+uW0+15Bl4/DZhLIOnyaydI5JS5XmnaXigNSpUW3gXuLgeu9p/VNDy8aWAC
	8FHz+j09J/R/wCQfKP4A1TvT1JTG7O8j2krFAxn0l34d/l3EpxPW8jNRxSijaMZBk+yMO1W/ZPb
	mMfBj8JAOp+tsA237H/mTWr2FEBjxSQrdvxZB0ZLJvTrlCoRoFJ9qNY9Q/L4mpiLtlYvPuKc14W
	scJo01N7BfdHNE7w5Wc7RkUTd1mt/8Af0Vq71yhMKRTvSGVoAzmYk5XPkQ3/7I/J+9qaekzKPxT
	lKE70MJvGX21WBDKQ3VLhgqPvdMBhKJEe/3RKugBgDCyi6PKwdhqEF91PnFju/oOiDPnrAqgt/0
	BZrrUYIum0Go5OLgp0f3sA62Qrq8OqHsqtEV1wsuhhyDeGvtsFWmfjjUwQ06b5Hyt/2aUDqI6G0
	nj5YIx0H1BoDnturHFmxUE9mDpyuz/lRPMAKpOua/q
X-Google-Smtp-Source: AGHT+IEt2akHgGZEKwCwlTLJzKYM/iMK/f7JPmuxQehpQT5vGVvCZLvTXGY+F0lhMaWM66A92qQEEg==
X-Received: by 2002:a05:622a:590b:b0:4df:bba:5acc with SMTP id d75a77b69052e-4e6ead7788emr71769211cf.79.1759952646315;
        Wed, 08 Oct 2025 12:44:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34c6e5sm170740411cf.6.2025.10.08.12.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:44:05 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:44:03 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOa_A_i1HUt1wzCj@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZyt-7sf5PFCdpb@gourry-fedora-PF4VCD3F>
 <f4d0e176-b1d4-47f0-be76-4bff3dd7339a@redhat.com>
 <aOa0UPnxJVGvqc8S@gourry-fedora-PF4VCD3F>
 <b6d472ba-e6cf-4c96-935d-88c842ab3cd8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6d472ba-e6cf-4c96-935d-88c842ab3cd8@redhat.com>

On Wed, Oct 08, 2025 at 09:01:09PM +0200, David Hildenbrand wrote:
> > 
> > fwiw this works cleanly.  Just dropping this here, but should continue
> > the zone conversation.  I need to check, but does this actually allow
> > pinnable allocations?  I thought pinning kicked off migration.
> 
> Yes, it should because longterm pinning -> unmovable.
> 

You know i just realized, my test here only works before I allocated 1GB
pages on both node0 and node1.  If I only allocate 1gb hugetlb on node1,
then the migrate pages call fails - because there are no 1gb pages
available there.

I imagine this would cause hot-unplug/offline to fail since it uses the
same migration mechanisms.

Worse I would imagine this would fail for 2MB.

Seems like the 1GB limitation is arbitrary if 2MB causes the same issue.

~Gregory
