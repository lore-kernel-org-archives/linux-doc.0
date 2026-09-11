Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFC3F1678
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153455; cv=pass; b=IFjv5XLL/P4m4XrQvrD1vSLCI+9QALXqIqjWgX3voMhcIxnxqczlPwmDhgT+VkoFfEV93H/Uk6KZLHz8G2ruKc71LcJlCfC3s+NphYqx4o+7pZidBJclWC0j6PJJyWggojUAkCRYDyZVYPB/YwR2FLLq7Fr+bd3gPCpKpXR6U2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153455; c=relaxed/simple;
	bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bivkGcSxIdgoRXTsebdP24YKtLgh7Gy0YEUIOoGKm2e8VVRpLoyWwFhhhFMGCDF6+1sXy76MW4ZypGkdhfSIIhP+y2Mf9vXP/hdJtv3G8IzHXKZDUjNFCXvn1KXk1l+VtU1/klMzZmvgO+3LpOpkuXcn6Hesufy/jL5kQTyYG/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guED+60N; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guED+60N"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so6337865e9.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 12:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153451; cv=none;
        d=google.com; s=arc-20260327;
        b=QtHmvsaKkQSkGhjkmjdKCSSkraiZimt2miDBTOeOnniAkgOx0Y64R+ECm21SzxKAPU
         YckKV3uogf1ACdJb3x+eIT4OkNKF/VtBpeqVivXhUtV8rw2raJNYQGCDVFZyFKG2jciG
         3cfzZQBr7evra/LPoCFshNlEGhq7XDLTPttWAiYJk+VUU8Eiq7ISkvEHRbl9HExxsuhm
         5LywUgwMuous69p/sk+fgldsuOvb4KQOWLWMX+5VJ6E85T0n+Ff3ANyiS0Lx8gBCJzBx
         pEMhO99PHmeUMEgHF3xWlpyvY5MxH+evckk5qM/aNyo1X7S6pb1BB3voDDsTIJaW8Cqg
         DHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        fh=9QBYqrJXQAmF0jOUvbK52pmJnyN4CTJMh834rHtFdSM=;
        b=O0zBWwFo78RdufJ8Iau2uLdWsyb+GlufUXFD+feHCDlw9rcEaxO1c6pzAWG4BPrpSA
         H/EPSM6MQFuRgo8UkLvLZVvBjJgpuely4DcpYvhPPek8i6U6tN11DJ6Xau8+9qM0oga4
         oVKAP11Xiz0mjqTfRpvZv0OZ2Olnf8dggvNpfX/Lbfe4rZQPg++9QXineUze+/Qwhj51
         cLWKZW9IR9Vg/D8Jy3huYQ+NptbLVY30pDHAnJDJTycIRfHIbCLvWD2+U8T3rDAfQya5
         /Hlk0KlfOjEpaXeJZ5iZ8G1IiSugoVFPSCW4pTCEBn0m2UR8fpYEqXSIS2oAAAh03mLC
         miLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789153451; x=1789758251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        b=guED+60N9+7cL2o6r9EPpthdfQPVqZkG1OXjvqUx2o2JRExpILfXtPPkI/X8ey4as6
         dKsiFfySJHOKnLnBILgFwNydmhCWDXyOoqF92TR0943aJzhX0BIkV6Yecc+VoSPME0J2
         ipvhtsAsUsEjH4XSJ06th4871uh4PJ2ht+2CYBWpWd+6NUjcB+3Ph2d4uQRU5pD7+R+g
         /RDfqZbDUhbcOrEUYXpI6beBmfU7zRCiMrcQZtfPT6XYMOkpmhezMwMxDv6AngTeOWA6
         ISYzeB6suuXFsCZ228rNDj3xuNjmc43QN22rdKP6O+QLyIqm2ghaQ7Ze4A35ELA0XFcM
         Fltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153451; x=1789758251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        b=Qvp3RVebUQ/LJg+j5+vXDC4kWhXV3hxVzF+VaThsIlQaenc/DT4VIO82mlbj5rAnLM
         bY1EClBqvbCA0lJmd/anVyvedkcBGv7GGp0j8nJUp5pP/6QmdbreXtJtbEaPCC0mPFwV
         s7QjYXyEPQOVlSoHc+o9EvREQDVePW+wkyII0sIMt64e1RMyB7KV/SlddViwo61qJrYx
         /6qWWZ//DSpo8zijTHCFJWT90w+gpY+d+bgYju9p/NiDESLhIYzqcttWq0Vi1XeIsTRa
         QPEGBddJDd4k7DGOonL/A0NS+GPKjwO/GPUpfVJNqar/tSX2mR2GjEcbBv7o/1HHPhbE
         dfgw==
X-Forwarded-Encrypted: i=1; AKwUvBwxExF85yZpHpH9MVSWlPTEoBrjU6+3sHeluHFISBMvZMAK5itLT6tyLI8QItL6dyIS4WAKetOIjqc=@vger.kernel.org
X-Gm-Message-State: AFuF++kIlbbxwEenlHIYk3lX5sOWh8Q/Rm1YmKm9urTUFvvRB3ErZJjJ
	RCDrLbxSIXLcOYMYs4gnpbJKlbJeDFyBK3khb0aUBlC9thVXOkS/uDIG1oELmGc6gOGoWEBjTMv
	7y53tJe/rQHJvfoFDI2viyhNjxDiN+j0=
X-Gm-Gg: AYBFou0KgVqZvJEjLBF26tdsDHSpalcV0tRS3Nv1hOS3bPYBF/4XXAnUsTNNvwYFthE
	r3Vzg2xBcjnP24QROH5cEnw+qpnxBtyLKo945AO0PeIN0k+fBk5TuYweyEvBZ2387ZT8J9UHv+I
	FJ1+EM+sjlpwb2zMoBUWwt/uZAhDo+wUFlX8ZCTq+P9Tft1TWpvbqidxlVNdiKDJXLmslh9Odjl
	Zlyu6PDkTz7i7F5aar5ugeoEB2dHugc33UpgSXIYxnGvbmmUjrSePKgeRfaGKLdXdEE0138+9JJ
	4P9t9LmofBc5s0a7yIgvGIxy9aw1jHmq7m1sNMX9bTNOSz2pJMCegO1e1ieLE8nJOoQHxvnS3xj
	0d672xbroNhA=
X-Received: by 2002:a05:600c:3584:b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49d26d7f8a2mr170508775e9.7.1789153450782; Fri, 11 Sep 2026
 12:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com>
 <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com> <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
In-Reply-To: <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 11 Sep 2026 12:03:59 -0700
X-Gm-Features: AcwNN1WTqoBlEbiKI6CdE02QFoxhwTxTh-PKBQg_YuUX7rc2TMIFeAiuSkD6Ytk
Message-ID: <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
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

On Fri, Sep 11, 2026 at 11:14=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> > Would something like this fix it for you? ZRAM users will not get
> > vswap indirection overhead at all, because it would bypass vswap :)
> > Down the line we can revisit this decision - for e.g, if there is a
> > use case for vswap-on-top-of-swapfile. There might be other interface
> > that makes more sense.
>
> Hmm, this interface looks confusing though. you mean tangles vswap
> with zswap through the cgroup's zswap limit? I originally expected
> this to be a problem solved by tiering, skipping certain tiers seems
> much more intuitive. Maybe Youngjun have some idea here?

It wouldn't be confusing if this is something users don't have to
think about at all :) My point is that we don't have a use case where
we need userspace input on vswap-enablement on a per-cgroup basis yet,
so let's just keep it all transparent. From user perspective, they
enable zswap, and it just works - vswap is just an internal
implementation details.

I have discussed with Youngjun regarding vswap participation in swap
tiering interface in the first version of this new design. It's
technically achievable, but we decided to post-pone that for now until
a true use case comes about - trying to cut down as much code as
possible...

>
> >
> > Potentially, but we have many users at Meta. There's a huge diversity
> > of machine types, workingset size, access patterns (both frequency and
> > file:anon split), compressibility, etc.
>
> You can just set the number as 8PB? :)

Sure, but with the vmalloc-array approach, there is more metadata
overhead even if we have not allocated the backing page of the
clusters yet. This will be annoying on the smaller size machines
(O(dozen of GB)) to also pay the overhead of 8PB-swap space metadata
reservation.

With xarray yeah it's truly just a number limit. Put it as big as it is all=
owed.

The "allowed" part brings me to the next point - not sure if you have
seen my other thread, but I think we need to be even more careful with
this limit - I have found another weird interaction between memcg and
swap subsytem, specifically with the refcount of private id. I think
this is another argument for transparency - this limit is now also
capped on architectural (page size?) and implementational (refcount
type) details of the host and the kernel.

https://lore.kernel.org/all/CAKEwX=3DNYoMH8pTKeCvA=3DXHFmmNVMeDz3mxbhp5q6-P=
xSTJ5wOg@mail.gmail.com/

Seems a bit much to ask the userspace to know all of this. Better to just l=
et:

a. the space grow on demand, automatically.

b. the space be limited by an implementation-induced cap.

all transparent to user (until we have a true use case for a userspace
sizing knob).
