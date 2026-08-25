Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5748380C
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669288; cv=none; b=uhr/2oWrbWoFb20gZ3quweg7HoP2r2oujZtklyLB3J1TpMCUs8jsZNN+ATvfMdwexVfdqRJG2+GqLuKlvEf9MdDEak/GgMMtHHiPjlrPS+T+5llX2M1bL2sOsRMONWbrbR6zXvqYcXf2x9BGmpwCVh1Opd0BYhU9H4nsFndUVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669288; c=relaxed/simple;
	bh=pzHvhf/kcUn1uGQQoMmmsZdAbSQgFg/DB45H52WF0/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IruUT+YQyhJ/xoOJp1Kt51SnnlAWh3GUvzSQBYa/It9WcVjRW7U6IlQfgn78vvyd96pdWYmg6eLkU5pVoUZAo1v3bfP5bG0SEVJQ1pcLqV6e4x+w7YNJri4eotZmAJrreM7Vvgj20zEW4dNQ3D7fxGtqsJsrQzmJQzmOS8+fvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdbz7zf7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qZsXYCQg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdbz7zf7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qZsXYCQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787669278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
	b=cdbz7zf7rNr6bXdMkqRyUlRtrnItztwOlrbKbDknxtAy9xI2Ap2RWYHtnBludjVPbYx7Kj
	MIkwVq5plcaypH5oPF7fdMCJFmUI5246YjjA3Hs3tskt+YPM4VXLJ+qFBarS0vCgQylV3m
	CF46D6Y18NYQ7RWY0vmBJFnfmnHhxC8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-_j09JKiaOE2_fHRt--sSTA-1; Tue, 25 Aug 2026 10:47:56 -0400
X-MC-Unique: _j09JKiaOE2_fHRt--sSTA-1
X-Mimecast-MFC-AGG-ID: _j09JKiaOE2_fHRt--sSTA_1787669275
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso937081285a.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787669275; x=1788274075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
        b=qZsXYCQg0NcRrl7FoyWeU9aVLadAaFI5eoIdcamwsj3oq/aHNZllmiigvELzLiCzpL
         K0TjfSf/+Fdlo5+wkJc2dXQIyFKRWLta9hlLN7GLmaR77QVOoouajeRg6SWDKVNIYnWO
         dKTdm76ZRaIWWwmP1ccSTiJFapcI3SQZRzQmHx48G3XLkChevTDvHes81cPP9EUkkjs4
         2aSyZjHysL0+zJS6OgCcKF1VBRN30520Nzws+AVKQZNwOk+hvtEXPUmh/+fJhZP6gFBf
         e7MIOGBuNCwjBSAM/GQNdwz+bGT1d8WCj1ER6nLmXBDNK0bXBaoMozUalybvFbfLuQML
         pHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669275; x=1788274075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
        b=Ryp6S+THix/KFRvi4Hsk9rYtHfymck8IdLvmJYGv4HzmHdQ6ZKykHggGccYsTGyxS+
         N5IUoh5emCY3esgphbElYFMKUsInhohbmiTTgi2+8v2FfhDxOSAy4056Xax3VWQaFfBr
         YdPTF+9FZxI9eKuqCaJTTiqcThBBWYK42PqrA8Kgqm8be4islNVrmF+j/L+RNjRs2Hy4
         kIYLX/1FvusVi5wsVY+MRnUfSiJUrYU6Yknuj32kTCarUedmVZejUt0zpFQCmOrGsGNo
         3UAKkrExA1ujW6U3WB+D0ZyC5MsjERzGL/FYy9eafgFsKQcTbxxs04l3WX1PbCNE1cb/
         qypQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8P6q9ImHsdlA2hO2vxsm5boUNznxw/30NwcJkHuZWr3JsdmpVYWr382XRsX0aMxKyNacPn+3f6uw=@vger.kernel.org
X-Gm-Message-State: AFuF++npKxQnYCd/OKzV6ezd5N5FdniPa88ccyhUab1gGsr+CFgbwBBD
	k8VeWR3HWN53rlyy5ZmKbd3993QdLsiaFQvScWz26SJY+R4nn2QUEtV/Tpjxpg12xISoVmMVypa
	4NXXBnU3KLrqtOjIJfNtguEfsvj9VG0KlTwv0pm0dUiMkSPGj4/DnSvkrZJ0GBw==
X-Gm-Gg: AR+sD11rpfypZmjnNXeYD1v33b8BxiJlRA0rd+tRPjOgjCpZ2Nb0qfe/uOTFY9Ptz3k
	T7AhqVoaIkYfltbT4ma38J5SwpxcQQe3qGzEE4yrOf/dv/hKtQ275Pw9LQToVJG6WWhpDUFlYBk
	vdYIuHTij7jGQnKpSi+p4q+/2qtYotaUi/YYLfrB1KCe6B4GnL13nvMq9KeoRHkbo4J2sNp24yE
	bIAbddK7woZEGyHBUHRYMCV0UForcksvWPNZQDLpNfzbNJwQ4XCPMdqHMvWwZlK3Fq9fg/actkE
	lZVXWZ0Sh3CqJ9rwGoMt9Fvkn5aRY2TiCzm8hFrqoqn13v2TqHY+74OY8oZWHgIchzZPFa44cZ6
	rvdo8dzy7/7WD/ynsG1yhyCNB3ruro8WpMKIuCHqNTfHM
X-Received: by 2002:a05:620a:a413:10b0:936:d35d:204 with SMTP id af79cd13be357-937468b3248mr1928934485a.13.1787669275390;
        Tue, 25 Aug 2026 07:47:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a413:10b0:936:d35d:204 with SMTP id af79cd13be357-937468b3248mr1928929085a.13.1787669274849;
        Tue, 25 Aug 2026 07:47:54 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abeba9sm745605585a.3.2026.08.25.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:47:54 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:47:53 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aowHqqaqK7TeexQH@tiehlicka>

On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > CMA allocations are currently unaccounted for by cgroup memory
> > controllers. As system resources, they should fall under memcg, but CMA
> > areas partition the available space for different purposes and memcg
> > doesn't have a good representation for that.
> 
> Which CMA usecases are covered by this work? It would be also great to
> spend more time describing usecases.

We would like to offer some usage guaranties to userspace processes
ending up doing allocations in CMA.

For example, a shared CMA area is described in device-tree for an ARM64
platforms. Userspace components could then, for example, allocate from
it through the dmabuf heap, or a device or framework-specific ioctl for
that matter, to use the buffer with sensors. The dtb may have other CMA
areas described additionally that may or may not be used by that
component. In this context, we would like the ability to limit one of
the userspace component to over-allocate and choke the other(s). memcg
looked like a good fit to achieve this, albeit handling the areas, so a
cgroup has a quota in a given CMA resource.

This trails from an earlier post where we tried doing this using
dmem[1], but I was unable to reconcile the requirement for memcg
accounting[2] since from dmem I didn't have memory objects to charge nor
the guaranty there was one. Given CMA is always system memory, it looked
like a better fit to try something without dmem.

Best,

[1] https://lore.kernel.org/all/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com/
[2] https://lore.kernel.org/all/ahB7pCu_G4vuswc0@linux.dev/

> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Eric Chanudet

