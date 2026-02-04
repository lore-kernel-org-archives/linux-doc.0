Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BA394494
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770240938; cv=pass; b=Tj0tLBTjtKWV5TCBBveSkZUUo0+ZdJ9o8PBzkU2puY73xpUesri0pI6IoFfeNsjwEKYINP8H0FnFklwhy3e3MaOcGY4cbZkUqeuHHFerq4jLUFtVcPed4zOAzCWW/X8t+MNgtzWfTsW3puips0hO0yfMr59214NRUYlFWnbavSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770240938; c=relaxed/simple;
	bh=yOuGpU8BQBEI3wUqRQh0+3eeVXQ5NT8/K0Y+M0gFwEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W56mYF1m+5oQXRJLQbkRB5pMAgCdyF9RQNHtIpc8bj5+vkrolv9j1KHB2qaklFTeLY8TTaEcn3nkwPnLfH57Gtn31o+w5lGwo9NlxyreYc+Mc7KY+9/1oOk2PiCwNbVH/4SihlP3ILZrCtiFgR7avYTkF5louXSJBWdAZDZfvQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxXT9OnS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C/AG+Ktu; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxXT9OnS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C/AG+Ktu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770240937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nlyrMaKGGiD8GgpuGPaSWwtm7U6K5QJqsNa9rsAtym0=;
	b=RxXT9OnS5YLoXS77I4eu7SJYzEVsuQbOXSQ3OCjbgbIQNjBtCbodT0D+7aU8l564Pamc51
	b4ZnkQhj/xPmHWYNWfESpj9ptlFDwuXMrIJIpMwPfNV8J1MLdHXFmG0ipagEDWAIllf1aZ
	RMY9eCk/LRdyEQNcw5Mxce1yhLg/aGw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-3f_-X3PANv6g9vdjXNWXWw-1; Wed, 04 Feb 2026 16:35:36 -0500
X-MC-Unique: 3f_-X3PANv6g9vdjXNWXWw-1
X-Mimecast-MFC-AGG-ID: 3f_-X3PANv6g9vdjXNWXWw_1770240936
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-793b9a4787cso3357997b3.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 13:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770240935; cv=none;
        d=google.com; s=arc-20240605;
        b=eExaHKGhDwkuF6z2Ts22SOidA4wkD7wunoeyyTfj9TP0i8h2yWiBRmmekyKirdu0+V
         phHPnJh8SD9hZgrUxGa7Wy44IpTaQrj3BdY94z6U5vNQcKVR1nfRZLJAKofUw3l9JMxG
         WkwRWRTtkut1X76dP++anTio+KeAsj7k9WHfEZ2CB48u3MAKMrAGPERG2czYZC58L9Sa
         L6UCukpzAykcbOVk5JcavSiXbkUsKYCRMQeOljMMByPCennQ9I6mIz1MUSmVxkKVl3zq
         c0H4jwrXqr5TG9VUnBvXq3vTC1hdHl4h/9T/MK3pk1upzrLCG+mBYEp4bu9E4XOFOtrH
         rBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlyrMaKGGiD8GgpuGPaSWwtm7U6K5QJqsNa9rsAtym0=;
        fh=0k8hFCVuCUo0GC3yYrxFcplCM+oMdangSLyVW3gx1OQ=;
        b=KnQEfE6K/OwOfU0xF+gBFKnZyowHqxPNk14JEa79K9+qwi4hU7PZSBWPbfKKxh9aEl
         bti5ExUX3ZWLZEOGxiPu6F8qylH6CAWfJaA+0Ukt/MRxJ6uz+Rkd20khkbWLVO17d268
         wF6YHePiHKyZP3vT+0JFW3+wias4b7ZZfHmejoDvVdMR63kL1yljFpyBKwKhlT6WGndJ
         QZV6DgQ8M35u+ykwyWuVGZ4elOdzpAh7ewOc4QDhf9N+IkLxmQFYlR6RKiCGJauCpwMh
         20zCrZe3TSXYSe6mjVfKOBk+Dzozo9qS/LxwC5CMumgUqsY8QoXT9FCeKi6ImWMLPuyo
         K/uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770240935; x=1770845735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlyrMaKGGiD8GgpuGPaSWwtm7U6K5QJqsNa9rsAtym0=;
        b=C/AG+KtuKKh+2zXFRlL/3w62ka5CzOeSIJHfN2IH2mQVVivuf6/3fiM9v2k9o7uo8G
         0RezClA7kWlj3mMHr0mLk7lHP8i9fOwnc4KzOe9DtJy17QrUmZe21Q5bbWcTibOF6gWj
         sdrZmcnSBSPK9zvz3vSw6v78Yd4Kju1QtNaUpwvyaDVM5+Efwf+ZbaZ4HB/oXixFKuvn
         k7LPRU8wIs5wfZrvZU8KKbvtGeamZLAviuluijek8c0swL/qsyxkvRHdP2X1vg8d2ZJw
         xqwOViqYsq6kFbjmjgBslMA68h/2axNiXXcROaQfW2qu6TdkG8pFVqZOjBrWwkOOXwhx
         16Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770240935; x=1770845735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlyrMaKGGiD8GgpuGPaSWwtm7U6K5QJqsNa9rsAtym0=;
        b=XOBmPMxCyBC6GHwgu74JN4s+CiwP9gJ4NRmWWQWKRFJulcfqGATUtYRTL89FC1MD1I
         yw4N7pKiO+ShYCeoho1dG66XNhkz10DRfZCwT+KadDRZI12pe8PkyQfEgOsAVYKh6aBF
         XIm0QkeTA9lk5kSo3KSa0TiL8kMBPaP0L9wtlinZcvVSUPBhcNFmYEtnZgqQs52fGA3p
         KRhxCiN6O5Q23qPxrtIVMVYGsyaQ22Rcr5O0kCabMX2hy1BOssYrW8DCS3YqMBo8JUSg
         g37bKC9x6n+TiD1mX3or2EtMUseZ7A5RoFPdWkwqexnxHQ5OjNVfznK72GzEJ6IBWmss
         gefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbgDBxyIfZPUL8w1+d4nBY+hQpPi1rQQ6xdYoT0Zi8WKpl6X8gbCln+h5PEqIpY5sKNXoppAuXbLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKs3Jo/tQyI/+K1yVXNjWkHjJxaO+7L6BJZyrrqvwgZubJbUji
	i5Zw260EbKZP3bBbvTkR1w1+U6TE7AMgHBR3WNVqpVTrFeaZjr1LNrHJX94YTofwKna2YMKBo70
	9TUaV4d36Tq/owphbaWBH/JFLnIt9E0RB7V/xkm6J0s5V8BOavBbfzV/fKyQo4D/XXAw5cSuS/3
	wQNTP4KB5PgmYIvewxTP0xw4lcoxfZ/ZzsCTt4Zb/+8KdXnZxHUg==
X-Gm-Gg: AZuq6aL5opULe2t2Dos8Mpf3y2Op92dx1pNoxZ7+qylzH15x5886o6299QdemYGA1Ti
	zGNQMppEX14c/KVLF9Ic4fPcy7lshnqE9YCMgRTeYwqtsLmSD7hI2TD0DS7cWLB8mwBJOkri16c
	+6d+Xxju9pvE1315g5Cp0NExyVvPl1uUeMajyAFaxCa3Cu+mkYosLefUhkA7wpwYCO
X-Received: by 2002:a05:690c:c50d:b0:794:752d:cc73 with SMTP id 00721157ae682-794fe823278mr37751797b3.61.1770240935377;
        Wed, 04 Feb 2026 13:35:35 -0800 (PST)
X-Received: by 2002:a05:690c:c50d:b0:794:752d:cc73 with SMTP id
 00721157ae682-794fe823278mr37751487b3.61.1770240934851; Wed, 04 Feb 2026
 13:35:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122192841.128719-1-npache@redhat.com> <8067c5c9-491e-453a-be1b-33603744758e@lucifer.local>
In-Reply-To: <8067c5c9-491e-453a-be1b-33603744758e@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 4 Feb 2026 14:35:08 -0700
X-Gm-Features: AZwV_Qhj9f0Nsb6Ktl9VTFxoa5W8_cz6au4xpYaFZG8J9_wccM3oiCb7CJWR8Xc
Message-ID: <CAA1CXcA8digLf78mc2UFCGnGMu=xRBGGXsY6Xb4uwwkfr2kB3Q@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v14 00/16] khugepaged: mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, willy@infradead.org, peterx@redhat.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kas@kernel.org, aarcange@redhat.com, 
	raquini@redhat.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, zokeefe@google.com, rientjes@google.com, 
	rdunlap@infradead.org, hughd@google.com, richard.weiyang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:34=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Jan 22, 2026 at 12:28:25PM -0700, Nico Pache wrote:
> > V14 Changes:
> > - Added review tags
> > - refactored is_mthp_order() to is_pmd_order(), utilized it in more pla=
ces, and
> >   moved it to the first commit of the series
> > - squashed fixup sent with v13
> > - rebased and handled conflicts with new madvise_collapse writeback ret=
ry logic [3]
> > - handled conflict with khugepaged cleanup series [4]
>
> Hmm no mention of change to 3/16, unless it's folded into one of the abov=
e?

It's the line with [3], but yeah my bad, i'll try to be more detailed
with these change logs in the future. Was particularly lazy on this
one.

Thanks for the reviews :)

-- Nico

>
> Very important to make reviewers aware of this stuff.
>
> It's also worth separating out things at a fine-grained level, really
> everything. More detail is good. See [0] for example - I practice what I =
preach
> :)
>
> Thanks, Lorenzo
>
> [0]:https://lore.kernel.org/linux-mm/cover.1769198904.git.lorenzo.stoakes=
@oracle.com/
>

