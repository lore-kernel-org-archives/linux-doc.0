Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1B34AAE9
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590807; cv=none; b=Twah0/bpuo706AVp/g5CEqnLJCwKJhZ+CfBnhhrmOg/fKSfBAY03DQvuwC7RRLAswVmW43HfS7njoDCaHES/fMwuwWpKpc+IZ4SE37OhKhufsOuPrpo+fHpuPwClUB+p1yR2NbNiClOI/hEBEGT8SUb6LHgZwvkawv64ffgn8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590807; c=relaxed/simple;
	bh=3jWXCb9nzGDdlpwcm5XDm1DLzz1gt8vgo8qdy7QykMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cwRHJ4qsYHFiDRENgum8Pz9OFRRKVwX18mOKXJxH+RyLB+J6+j/UVWIpzv9IvKC7VT2CCjPy4XhCiFGuCb9yTvkOhAZ0IGIFWBdRpQbe3RFR56HRTIRx2i8gT38tx5eAicFFWElhoEm76fF9n9kj5+QGegYeQCYBkL3GVSBFxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTWjDhsO; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTWjDhsO"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66077e888b2so3714382d50.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781590805; x=1782195605; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnltuqW5l5nPcDELedENMkU+jfNg+GYItheRAD/A5zg=;
        b=UTWjDhsOBQTF+NBsBKB5yqIF7/Y/ZROFtS2EQN1cyhmF1WwBn5EBokhMBoBo6w22je
         jwjTTtYGNQwHAB+hL/sk5mNAg5FvHKJMobqVsBKgw11uRDy6CawaPF4kRgdLRee9SDBU
         vGICrg2yJA4iX3N/3RCg2Ztk493e5tkAO2NjvzhHy7O5hxAfjH4HIisHj6j/LAwzeMrS
         Gk1HlN3PknSEGyytZcWTdYtB1XqCwk9CZdBNFHdL0S5+AU9DXCuOFe1zuS7S//vVDgUT
         51Ir1AYfUNkLfo9Xq4/3xH0pBEcoClpNGzl7MaZaC9xUbFGt8L2PQVvfqHfJNY9BtJKh
         QAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590805; x=1782195605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnltuqW5l5nPcDELedENMkU+jfNg+GYItheRAD/A5zg=;
        b=o010lN6FpFuSxHGa77CWgvSApQIbaaYIkyQM7v26zgDHjUuy82FWz32atjT0WN6xcc
         QU3j8fl8yn2ziLXzYE8F3jRfq9BrBXtH051f5S81cz4ku6YD9F/L4Ba45JbAsheRpPsQ
         7FXtYGU+tZEfbPVwxqyKqYY4rqZGIgoIaBB4j/A0KVSMxjUxQTFEZs3FA9h98ZfyjInG
         3AHH7LA8sRq29nUXJ6owbCPXdmu9qTF9KFqP/BcyiIg1tHsqWw0UuWPUvFKLZ2g5V9yJ
         +9e2gzPh+b3eChXHuAuDMHOqZyeOt6pYA8KV+FLhWH0wWuQVgZXHo7DIwTvdtqftAz9I
         PpKg==
X-Forwarded-Encrypted: i=1; AFNElJ/p7Y/mXjKlC1IlDrrSTUNT51AgC39nG1PBpr0reb/ZagUu29DDMHlErovYSSGHB2bJC5rkWzYkjqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENl4aheANuyXAq2DqhV1NJGhGhs9WiB4yMJyScXWbZ7+aD9Jk
	qw/Ltx186WQeQJq9sGQMoAkr3SU13uuu6tPIXJdfWrrrZ1ohS5inoqfUGOwq8D0AUg==
X-Gm-Gg: Acq92OH17HWy4LSOsyOuSI+04pydPD/lfjOxzc9Wj+1iJD3ENskK7svMo7M4B1FFFzE
	ILbQ54P7Gg3iUntfXRV5YTLkhhy+/sQjpdece0gCofym0tAtwMnpe+gn1thK4LGPddPySnglhVH
	3tpo28DHrh72y/sDeSe5Q4xUXWjOw0ys6zNhaL++Ps4Ssm1dKmySNiCJ2gR69gkol8kAzGSsh9O
	x2/U5qa6ksh7LgjWz1tVXN0gaIgoG4YIzUhdZyM3ojfCxvAkIZ/fweFWwTF1yAhnCVaCJvwANJG
	Pk6M3cqE6SvjWTc0/qjk0xkC3qgOAdo3jUXKsrcpVPxB157CHyoCtt9mv+r2HboUObK9P+dWzwY
	HbHIfB4hAS7mPwXyn40nHwpfG2Nyr7Siixnhdjh4NYADIwGf4Gw9udcRUhJR9stiMJLv82h5GtE
	vXa1UbarJNPxW7csf8kclG6fxGxfn44ybWAgvWPfqt+5jUUE+Rc9d8YFPCDaat6ZyZJ18fUP3FR
	otouJ22XuI=
X-Received: by 2002:a05:690e:13c6:b0:661:75a5:3ad with SMTP id 956f58d0204a3-66277f19a03mr15544305d50.3.1781590803692;
        Mon, 15 Jun 2026 23:20:03 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274e2c884sm6362800d50.17.2026.06.15.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:20:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:19:49 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Hugh Dickins <hughd@google.com>, 
    Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Sergey Senozhatsky <senozhatsky@chromium.org>, 
    Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
    Jonathan Corbet <corbet@lwn.net>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
In-Reply-To: <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
Message-ID: <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com> <20260610043545.3725735-4-anshuman.khandual@arm.com> <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org> <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Jun 2026, David Hildenbrand (Arm) wrote:
> On 6/12/26 23:26, Hugh Dickins wrote:
> > On Fri, 12 Jun 2026, David Hildenbrand (Arm) wrote:
> > ...
> >>
> >> After some off-list discussion, I wonder if we can make our life easier.
> >>
> >> I think, even with your patch, there is still the case:
> >>
> >> pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
> >> 	 pgtable_level_to_str(level), entry);
> >>
> >> Where we cast all entries to an "unsigned long" in the callers. We'd have to rework all
> >> that for 128bit entries either way (passing them in some struct instead).
> >>
> >> I really just extended what we used to do here in print_bad_pte() before commit ec63a44011d.
> >>
> >> Maybe we should just drop the "print the involved page table entries" thing?
> >>
> >> I mean, we do have the actual page, and we do have the address in the address space, which
> >> we all print.
> >>
> >> Not sure if the actual page table entries are that relevant?
> > 
> > The page table entry is BUGgily Bad: we want to see what it looks like
> > (sometimes, a sequence of bad page map entries may even show up as ASCII).
> 
> But is printing raw page table entries really what we want? I guess to detect
> "random corruption" it might help sometimes.

Yes, that's what it's for. What we really want is to understand what went
wrong: that's too much to ask of a printk, but it can give us a good clue.

> 
> And do we really need information about the full page table walk, or is the last
> level good enough?

Page table entry and pmd entry are good enough: higher levels got
added at some stage, but they are unlikely to be useful here.

Hugh
