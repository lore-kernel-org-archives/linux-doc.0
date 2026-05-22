Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF49403E88
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466074; cv=pass; b=eO6nUeXTGyReOD0Kwiy8CtPZtQ+3r79uELjnMi1YG6yZxSEparZpaxMdaSJk0AnY3Cl864Uy5waL/JkCYYvkqtNjPNsayEZpUy9PvL4yT9ucHbv2dKRy3timfEcRWKUYMaZtekN0hg1X1lx3u7uTaKBChE48S/8LPiJemqWn23Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466074; c=relaxed/simple;
	bh=Z7CZniyudQvtGykBjwFqflJux61iIz/Fi25N4Y0qOJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bk3ZqACZwCRfM1RrNiggktvOS4y44Hgm4PTJ3NDLmQqY/e9ZSI0UrvLw/NBgHo9jmlLGXMZTlstvJFJ5lhMGWFfzH0taLEsRFZEHWsiqAIrnpoPKB6Zho0EStpcCDbEvZUHH4FuMZWhrU7MJg21Ydsn7CYDVfjRw0Txr3Oe3nkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PNl7Q6/b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsfD6CpS; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNl7Q6/b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsfD6CpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779466072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7CZniyudQvtGykBjwFqflJux61iIz/Fi25N4Y0qOJI=;
	b=PNl7Q6/bpFzjlNljoTdLqlnYTmyofZ5nREKlsDKT9jic1gkPoAQ6vx5aRIeulfzIScIUNX
	A5WXOwfWT243UwsTXJgx24rip3fBryDqCQ8lQHgx9HdStqTwupnJj3OwVOyghiMWcZ0Z4C
	RxNfkDjbJswHqBOSSc91RYNo47Epgto=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-MaFP9HSdP4a3kiqSncEFbQ-1; Fri, 22 May 2026 12:07:50 -0400
X-MC-Unique: MaFP9HSdP4a3kiqSncEFbQ-1
X-Mimecast-MFC-AGG-ID: MaFP9HSdP4a3kiqSncEFbQ_1779466070
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65c5afaff48so14354687d50.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779466070; cv=none;
        d=google.com; s=arc-20240605;
        b=G0Y+MdjcdXHAsMDjWvDwt9hJeUzItwc/L/cINuRt45uFjec5dRucZXWSXzADb+t7v9
         GfQeVRawQ1Dmz/tkm6+2iDehUw7G3usj6C2ufqR3kM3wDKEOH3WTuO5Dz9JZRzOB0T0K
         FxCpm6+5Ovn/ZJuvwXTZyoG8UySlSLRZh3q3oTsZ3tii3sblZt5evu910L1bfdJEiiKk
         2Jyam2Is4gB8xDpj4r+WRUAPB8kgIti2URik1Zm3UcLIGMqrpvknbrpcSdNWCzSVvOBx
         I8EElvmlTCFg8WWBHJoBsJgFf669x4Ncsr9JHLnOGETYA+dvOYzNVrjDtfXbxyMVzaGk
         F61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7CZniyudQvtGykBjwFqflJux61iIz/Fi25N4Y0qOJI=;
        fh=3D24Mvw81a1Q1yPJJVAzsN4anbdeKBvwx8nZ82hhRTQ=;
        b=CRnx7Sq/mtzt5x1K6PM7dgzMs44UVEBIyxNY/togC2m5Gj7ij2f+2wOPrM7OSpDWoQ
         WeRGrm7MkLoiAbopQgCo5h6hSuLqOkxaRrXHLKjmGQO/IXlMZrUYCeShIqATg7keAsPG
         aAS+EgIshFs218wZe4vDpjdVpgWIbSfbayX0eJbVpPR0Dk9u6AYva6Gph0WUTFHHWYxx
         g9Y7qbI2T/mXre1lRQKCWHPF06A8C4NJXgN+8GmAa5vPRjGdL3MuqHmE+UuY4eaxOa/B
         diegVItEwQfTchYzeCy26RQI/mUi1uPYaZr6qK0YZfneGZbjrvWi9N2NZvPMjzlWGWtJ
         tJ8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779466070; x=1780070870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7CZniyudQvtGykBjwFqflJux61iIz/Fi25N4Y0qOJI=;
        b=WsfD6CpSXzMVBF5ycy8WTjt94zv/T236yoRbMrkRUFA5kEW3spKkYcQ4o/yeN0PO+q
         2pBf8aTxs1bhtrRv+aF+Ktu6FZj+dRuMEAhXkQry2FPkqEQ31LJvDj4XYWiR/PNci/Hs
         uVsuR4Ra7oxnpcOPsaqGjrHPRkma5Vmdaxxcz/PT1ilXSY7CR1zNzinsyg2tZZJ7pTPF
         f1XYO1cDsunFRCTNOM27xVRquMMG53oyZfPYf3HreWXv3yU24jmgrYUzTfMipWaV6c0i
         KK1IjBzRS6emUIzDegjLjvJYnh1vlu7d7h1LzkgK/lv4raBzuyDqz7wAgNWHuiyR4MID
         XuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466070; x=1780070870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z7CZniyudQvtGykBjwFqflJux61iIz/Fi25N4Y0qOJI=;
        b=Q59POtnpvz/+J60L72fVfbYT0jYAVgQmOSguj1HHglsnVHdM7T4+RWxRasql/ItkBM
         GQMS7oalnq/gJMJdaXJbi/QC15JkTuZqUWCKMWjXdvWnJaK4/oKCC3VIbyHs/q4Suc0t
         r20URtS6IOq2rJ/tqbJZhu0baqALQ3OJrwlbsXMYDbaBI4Tg6anvwKcbYiGzV+o6Uhos
         kuszqCEAWg/KqRoZW0y+Y8ct0tLpjcELkJfzxNIn7WafzeCp/Zc2DaPjP0NQ2UNa7HsR
         qS/tFhFXGsYnaDcspj3t0GQwidUt4mZEUer17yYcidaQa5gHQMF+3Lpgv2S0NIUsr9Tm
         twyQ==
X-Gm-Message-State: AOJu0YyYLv2ePGiCPKNa7LWT4z+yI92iGZEe1UktCWNDk9z2IIFi9Cgv
	/JwGyvqQMJP5k7OFS91KntgcAvyIrm2eLVlUeXRiNPjib+R60r3ivG4bTzI4StIKwbiLrqQjRXI
	oDkHpojAJN++k1/D6v/rh8SJZaWciCpVRKGwQsm925FCyfAANzga5LtAh4/XXITVMnvRFa+wCTk
	IfL+cRR+VncTzILJdxSqbZehYUXoL1EhjsOBx0
X-Gm-Gg: Acq92OE9QgaayPClVThdxDAHqMJALbHj86EGp0CO/e6F7NaMu6Nmz0VvWuGUpVymZ4M
	t1Yz9saWltAiKN/WUmWAM7PlNeIPXuVPklceGkkLvRmwXUv6U5o7Vo93w+G831usptBRLKb1HP9
	vy6VZvUvK0tc4a3Pd5Q1rL0eBaP28aSu7JjhzGcq81VhS2TQQjsw+1HAL1YpMmtnHT9zeyFnKBr
	E1aPg==
X-Received: by 2002:a05:690e:1284:b0:65c:74c2:31c6 with SMTP id 956f58d0204a3-65eca654410mr2973347d50.5.1779466070039;
        Fri, 22 May 2026 09:07:50 -0700 (PDT)
X-Received: by 2002:a05:690e:1284:b0:65c:74c2:31c6 with SMTP id
 956f58d0204a3-65eca654410mr2973309d50.5.1779466069568; Fri, 22 May 2026
 09:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <CAA1CXcCoDU_pnp0SmMzRi8wPGB1OBjbbokevq2X_03X1vpWtOw@mail.gmail.com>
 <ahByO_HWn6MB8z-u@lucifer>
In-Reply-To: <ahByO_HWn6MB8z-u@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Fri, 22 May 2026 10:08:19 -0600
X-Gm-Features: AVHnY4K-NMEYaoOF8CwzqrbGVrRxOSsC61YCW8vw8BzLOXMR_M4k6Y4gQwbZHRs
Message-ID: <CAA1CXcDoFdZZ4aBx0BPA7QXYKYBYDoqUiLTLYe3L5opJ0LsJGg@mail.gmail.com>
Subject: Re: [PATCH mm-hotfixes-unstable v18 00/14] khugepaged: add mTHP
 collapse support
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-doc@vger.kernel.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 9:17=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Fri, May 22, 2026 at 09:07:29AM -0600, Nico Pache wrote:
> > Whoops I manually changed the coverletter subject to reflect that this
> > in on mm-hotfixes-unstable but never updated the others...
> >
> > Hopefully that is ok. Just a small mistake. Base commit is referenced h=
ere.
>
> It's not ok, this isn't suitable for a hotfix in any way shape or form?
>
> As you know, because we told you :) May has been difficult because of
> conferences, holidays (and in my case burnout recovery).
>
> And unfortunately the series seems to have needed quite a bit of review a=
gain
> (my suggestion to you would be to ensure you don't make major changes, on=
ly
> small incremental ones on the basis of review feedback).
>
> So this isn't viable for 7.2, and we'll have to target 7.3. Therefore the=
re
> was no rush.
>
> Also please don't spring a respin on this series on us without discussion
> first, with people away and (frankly) the amount of work involved here,
> you're going to have to accept the pace that workload/availability permit=
s.
>
> Adding spurious hotfixes tags doesn't help anything :) please don't do th=
at
> again.

Hi,

Sorry for the confusion but Andrew and I spoke about this before I
sent it, and he confirmed that I should send it against this tree to
prevent merge conflicts.

Because Zi's series depends on this, and this is already in the mm
tree, choosing a candidate before my commits was best to prevent merge
conflicts.

The intent wasn't that this is a hotfix, just that this was the
closest base before the v17 that is already in the tree.

Sorry for the confusion, hopefully Andrew can still apply it to the
correct tree.

-- Nico

>
> Thanks, Lorenzo
>

