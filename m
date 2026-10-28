Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793173124;
	b=ugIsieKXr+AkXyHxATr3hiWnBUblxVeANxy6HN2MXQI5ekg2Ey2pbMwwmG2wJY+qCa31
	 yeOFl6Y0pGIu8c65LPhiSHlpneXKtg7yYZMS1t9U8MSakT5Erkd2/PA9iFzVLsOuXUCHH
	 Xj9IxnRXqR7w8BJ97LVcPytxNjirR46fqeK1zJDyhP64pqhtJdpzjQZb6sI0DveRj0kM0
	 Ow/T7CRF8qvKVfRHDlgea/5Ubsp8ORzYr4tWxj9aNUn9gYYVTJnelZoBIf+n2HeEa+XSj
	 7AAgEKpG7/7LFbcMJWG2vZ2KnjIfXw8Pko44M28BvTYAJt4enD1X2b3mA4OYxhv+x1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
	b=f+OEW3gTseNUIEIbZzMIOtF0+2Vscpgc3YKUMIDCH0g5brRhm8RNGJN1sm0p25fbZRvI
	 CnTF+UmxeEEcTC8fq8rO9fsfitgE2CAu97A6fGRepCUTk15Eu7hGaE8YKl/6clt+5tERt
	 6BBdb3JLG93wuqCSF4f77KzbbKlcsbbMifu1ZVIezg9bSE44QovlP1VBZ934VFC/KwjqI
	 cC8eNnXiBqPEiazFZ1725Bwynq7E8jktETmWZb1ZXSEOBdw9kiu55JQfydbzSs7VEy8q/
	 VYoZs2t+AEau8Y3Tpr1pxLL7K24N6/0IP4qOM0pd2xKpjDdY1n24/bnmQkA7ux38osQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zklaNDR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203E606A320
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 07:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9203E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zklaNDR5
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c43373ae89aso81401566b.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 00:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793173123; cv=none;
        d=google.com; s=arc-20260327;
        b=DQH8G6nUl8cpUZG4FRZrkdJL8i08F6hBh9zqi2+rAuuId57n6rl3iSei7U4gpUsPG5
         /G8dXeSQQ6Ui8AIdd++TG2kVUT1PRSHwmqL3P0MNTg1Kb8zwVdIgrkoLPBQVrenpZy/z
         Z5QnT5S/9b3KZl5prjyHeH4wcDO7w0BTl11Vb0PGtSgpq/Abi3BEI2HGnnXpy0SRyBU6
         BQD8MjR1RQ5ufTI7wdmg7s8bsP3WwEiBB37SSiYDiYV/aeiGg6ZeEdOVoOatAwDPQTtv
         v90nDHIluKBl9K/IfB5rIOzupsQIYhlEpgrRjHVTPzX5znZM3HC+4xKFxZUbUhOBh0Uz
         LLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        fh=ciOIbZGWuSd7kVg3bWM65YchbbqqHF/G3spb0Fz9k3U=;
        b=Y1CzskdgGjbvA2ZErBHtWv14GwvyOs/G1zZHA6y3esPKxMcVhctP271P6WqblwEMx7
         LzVQGTAzuIOqC2KMlDzc9A+sTNbgCe4cRc3BjYhLi4hASyB70RgaAt6FhJL51s7dwEvi
         JeKgzInKmrWmVWLysl62HXohR2qk3isEH1tBPrX8YL71u0V87aynxe/d3II97Mlx9zjF
         sP/QTKF7oIhI/PIpdHgKVfZztdGHiuSTjwL5zvAYM/x6XWFemafKQ2pzJGEZ0G0DXxFF
         4Amj9J/9YwDWAWHIRXMFbE/hm237do3P8+hTV2E4cB0S3pjmgQiiTvmcUQWCjFj7UHqm
         rq7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173123; x=1793777923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        b=zklaNDR5CX5KpN3HuGoYhIyGZYuSEuP05buHr5SZEdsCFMrjreIo9qb3BmjVgwO8CZ
         gD9l+cpnqzVJrP1ItqA1uQKdDP6DA+IO5K1u6bZHclNbZGPKdbCI3UJSXFaxe96fJTBr
         55pEopCUZHL4egHDIXBn16EMalOL78//B96Ut3lxfUgAUtQaCjNyFdJtRUp9eNbtzfDF
         9LOv25/WL4hEqcUaZwQGNEdLSjt0AhgUO5v3lbFjej7Xb7GY9DrYkNToLes0HDW+Wu5d
         iy7EyUuqS5JgOaZ5YUfbUr4no4xKW6q/BVbiVWc2cKSzAk47ZS9KKtf91Hiap3/x2WVH
         8oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173123; x=1793777923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        b=Kbn4Vw8bfTHxbuVNFN1IIjziw9Hv5G350+1nk/6y6hhPrOTlBW9cD9wkdVaYVIb5rc
         CfrkPSWPO5EWJp9UoTN56SR7FchbytJCVSFlfVmln8Wsr9BsjinpPORQrwwW9FQf8PsR
         oMKdF3n43hqljpveMD40lixTjmOdm7eKiZdh8PPFde5g63krGOMK0o6RIEnb4xbutxdM
         TPPhdG2Atw76GoaeOQkbUXX/xJwGXdh8fVuDULoIgOo4i6FWbFSfkGc3iGmz+2MBgmGH
         dH/pN+k6lZJf/BqsnU+IUm+vBF3uDYw+xe89noFH/ogU9LIQLKnIltZp7NnpacpS50c8
         Antw==
X-Forwarded-Encrypted: i=1; AKwUvBw2IbGIt5JAKNqJ1rrrDafH/euCed26fs7I/j04n0Fborp0qv1iKan5A3I6RhStOVW2zbGqah2SW+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ADDa1coba1Dq5MGCgzvSVjKeFsPSNMWoD3DKwj2O+yLuAgrU
	pHkedHPQfpZpV49T49g6OChgBEGTTEXppQKAaUB5XMUREDxcPwS3BQLj1FmRV7MDJC/RFzEHJDz
	7D72CL3j9MIYrBwlezlmuXS7X3HJzyCg=
X-Gm-Gg: AYBFou0OhMRmJJ1tO7SUasSRXp3I6/Jbe17NfCvN8ZPS+KRHNEK2AQvkkOUaI6PapiH
	F6iLHsa7YXHZnDxxBkJmJVzqVHf3kkDkD96hNLOeoXbO3M8QVrSq/gNawC8oSssWyGXg6BBgHjL
	rAr9sUo4CLqxBVadvRr30j+G02gKf47pM1OLFC0iaLznPoE6c5xn7IaxXo4Wv9FaKpKrkBozCni
	tfltge4kSfsTuMsKkLJ0NmVdEFHDlR3gs865Jkn5Z70MNOE0LQmsl+7l+crkTVanJIh87PTeaQD
	7eZ8Bj1l6z6RF9Wlly5yk2ErSCM1LrNiMsndMbsuBvoyq0FjUYRosZOQ38b+ibRX0ImZOYTkv9T
	PE28atn1+ktUOJaOhqubAKeBtuRFcyxO2BulzBEXm3za229KDAvbykTYbkSjm34UJhSbqRubE5n
	b8DIwRcbmE7aYweFo=
X-Received: by 2002:a17:907:d90:b0:c40:aa04:18d0 with SMTP id
 a640c23a62f3a-c49bdf0b830mr127577966b.17.1793173122715; Wed, 28 Oct 2026
 00:38:42 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
 <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
 <CAMgjq7Cjt==BxXPNw5HjiA0hjxhfzWn=9gDQ+2x-rdrEQBWTeg@mail.gmail.com> <340025b7e3bdc6d905da2cd052ccbbda63a58ac0.camel@surriel.com>
In-Reply-To: <340025b7e3bdc6d905da2cd052ccbbda63a58ac0.camel@surriel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 28 Oct 2026 15:38:06 +0800
X-Gm-Features: AclHuK-mX8ixSikBppmP8XVxk2jjNDTFYKjV7_1Dyl2RLvPqe5fDdGLjEWtahao
Message-ID: <CAMgjq7BQ-K-ZDmP_ZW-2+t+OQWWKEZP4ynoNk5C7NaWq+PP3Eg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:59=E2=80=AFPM Rik van Riel <riel@surriel.com> wr=
ote:
>
> On Sun, 2026-10-25 at 12:21 +0800, Kairui Song wrote:
> > Rik van Riel <riel@surriel.com> =E4=BA=8E 2026=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E6=97=A5 02:16=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > > > On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.=
com>
> > > > wrote:
> > > > >
> > > > > In my mind, we have vswap sitting as kind
> > > > > of a swap VFS between the rest of the system
> > > > > and the swap devices:
> > > > >
> > > > > +-------+     +------------+
> > > > > > vswap |-----| swap cache |
> > > > > +---+---+     +------------+
> > > > >     |
> > > > >     +----------+-----------+
> > > > >     |          |           |
> > > > > +---+---+  +---+---+   +---+---+
> > > > > > swap  |  | zswap |   | zram  |
> > > > > > file  |  |       |   |       |
> > > > > +-------+  +-------+   +-------+
> > > > >
> >
> > > However, having swapoff remove all data from the swap
> > > cache, after mapping the memory back into userspace
> > > page tables, seems like it would be fairly easy to do.
> > >
> > > Does that meet the needs of your use case?
> >
> > Right, it's nothing hard, as long as we don't add mandatory new
> > layers. For very high bandwidth swap devices, a mandatory indirection
> > layer is pure overhead.
>
> Don't we need a swap cache lookup regardless, to
> make sure the data we want to swap into the
> process is not already present in memory?
>
> At that point, it shouldn't matter whether we
> get the backing swap location from the swap
> cache lookup data structure, or from the
> page tables?
>
> We have the page table lookup, and the swap
> cache lookup. That is two lookups, regardless
> of whether there is indirection, or not.
>
> Am I missing something?

It involves more than just the swap cache. It includes book keeping in
cgroup accounting, statistics, allocation, device info reading, etc..
And swap cache is blazing fast nowadays so that isn't the problem
here.

We used to need to bypass the swap cache for similar reason, but we no
longer do that since the swap cache is flatten now:
https://lore.kernel.org/linux-mm/20251125-swap-table-p2-v3-7-33f54f707a5c@t=
encent.com/

Other parts I mentioned do not have zero overhead so keeping the layer
thin seems like the best approach.
