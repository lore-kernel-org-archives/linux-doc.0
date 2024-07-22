Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B101428F1
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661542; cv=none; b=llU6OBH1izRTsqHYDSD4s3ZS6jx045NS8f3i897JIDyLv8DWmONwCr6j/JADxbzsMud19HvCk7ycYhKfHEKOCXk0XaPWkSMuO5tlOmgJ/EszD44cOLg0D80AvUYWsXBWjDqyxUzX2KXDStLMAevabw9wifPUdy8oLkSsVVKnZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661542; c=relaxed/simple;
	bh=tKK9/3I13MvhyzlrlIeNEK5w1H/w6SfkKGofIH4mavE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sn5s84t4IOJMP+y/APcnixN55zaL8qwDC9sMw4w/tmaEPp9C/Zi3nn7EeP3n4WHbEVpcIEye3XZhUjD1JX9nKz7BXgySk28hdN3HfDDPrh9ACn+4MjoomBjcNNG3Y/Fbfr2bV92J/4qKFhzxEylWSHrHGVQ6kqdlK3HoxN/xOWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=i4Cbwlc0; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="i4Cbwlc0"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5cebd3bd468so2376462eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721661539; x=1722266339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKK9/3I13MvhyzlrlIeNEK5w1H/w6SfkKGofIH4mavE=;
        b=i4Cbwlc06yyXfGyahehPPMh3yr3UQydrIPvcHMTYu9nJItReGlduFJEqG4pbMakiJT
         6Wmkunb+Ln/HBtjm79WClX52pQex1Uzv2ApvSABOFIQyEz1YRxW9Fq5RsqeVDzDPMXOo
         4KfbQ9hsi865IdJmcsLSKi9F+UTj4dfe7qxbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721661539; x=1722266339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKK9/3I13MvhyzlrlIeNEK5w1H/w6SfkKGofIH4mavE=;
        b=rdq+LmnJnPEwPktQib2SFHIMVGnf1rLXZsgeKNnVUoQ1IfezjR+YP5HcS0QbI8lget
         Jxvb/2DInUkUezak983PhDjBURWOJHZNw5ExPI7jwXWE6/jpuxvZHVv1K67yB41WAK+w
         yKJTZaaAAXJAb3PWNzgSUCPlToWocKBojpPWodh/GFGWz7zHKVNm83HEP7J+fePBZOAz
         E/W0inSENTp0+peYtAJIxdkmg32SwortEmEjyioGGvzFaFzqIDTI0EB43N5QsMMGWnpz
         Uv0+CuHtB+ezHmeh9zqM3v2GZYjUG6c1dwrq/xekJtfSBEwvf/X63eaN1aRFSiSS+2mO
         kv+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHAbsn+qk0mdO6+FQrbVVhktgwkwV7DIOFl56Ubc5oMIi3UU2EdboTdqdE3yA8qvrW7NAJJ1t9a9K38BL7T6NOetOyeigtlKe2
X-Gm-Message-State: AOJu0YxukBIrFVC8DQFg/es7rxKDGeJENjl5EX+KmqPBO0ec1x5TSHqP
	T6ZLnVV8swdtiOqXLAj8SZPGyFUJekie7Y/mgNPb7i20cNykXZxKPI1S4zshl0Z/FmBsG1LP6eu
	tcGS9w87QYHAoDSypps4P3y8wIzHh1cQa8RabcA==
X-Google-Smtp-Source: AGHT+IH5LDxowoDamLUYoLl291IngnNdCcTq6/3wHFVuWdTaH42FkypxLhePVVQznXZrboSlC/zmNdEhr4+x0rPlRJ0=
X-Received: by 2002:a05:6870:1715:b0:25e:1ced:744 with SMTP id
 586e51a60fabf-263c7612bb6mr6127529fac.47.1721661538646; Mon, 22 Jul 2024
 08:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka> <ZpajW9BKCFcCCTr-@slm.duckdns.org>
 <20240717170408.GC1321673@cmpxchg.org> <CAFUnj5OkHp3fYjByCnXJQ51rog93DsimSoc1qxcU7UyKw-nFrw@mail.gmail.com>
 <fcb8f0ec-59ff-4f79-82dd-7eaf2530aef3@redhat.com>
In-Reply-To: <fcb8f0ec-59ff-4f79-82dd-7eaf2530aef3@redhat.com>
From: David Finkel <davidf@vimeo.com>
Date: Mon, 22 Jul 2024 11:18:47 -0400
Message-ID: <CAFUnj5MsGdswXbvy6neGzDsD=9=CuTCcezrkz0ofFsJedydUag@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 11:23=E2=80=AFPM Waiman Long <longman@redhat.com> w=
rote:
>
>
> On 7/18/24 17:49, David Finkel wrote:
> > I spent some time today attempting to implement this.
> > Here's a branch on github that compiles, and I think is close to what y=
ou
> > described, but is definitely still a WIP:
> >
> > https://github.com/torvalds/linux/compare/master...dfinkel:linux:memcg2=
_memory_peak_fd_session
> >
> > Since there seems to be significant agreement that this approach is bet=
ter
> > long-term as a kernel interface, if that continues, I can factor out so=
me of
> > the changes so it supports both memory.peak and memory.swap.peak,
> > fix the tests, and clean up any style issues tomorrow.
> >
> > Also, If there are opinions on whether the cgroup_lock is a reasonable =
way
> > of handling this synchronization, or if I should add a more appropriate=
 spinlock
> > or mutex onto either the pagecounter or the memcg, I'm all ears.
>
> cgroup_lock() should only be used by the cgroup core code, though there
> are exceptions.
>
> You may or may not need lock protection depending on what data you want
> to protect and if there is any chance that concurrent race may screw
> thing up. If lock protection is really needed, add your own lock to
> protect the data. Since your critical sections seem to be pretty short,
> a regular spinlock will be enough.

Thanks, using cgroup_lock() created a deadlock, and using a spinlock
resolved that.

>
> Cheers,
> Longman
>


--=20
David Finkel
Senior Principal Software Engineer, Core Services
