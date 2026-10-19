Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421805;
	b=BSGZvwdIe+yNDLb0Qh6gNFAs7szdKFb9tH3W6pF66bqthH0/rUrmMU6DUZe2QtN7B94v
	 fK1ytmREfMoYSyUSW+W+zbfjdG4SGxn8Us+ETwhstps8qfwW2XcPAohhKR3kr6/6kslmR
	 uMECfPxnBFXQCcf2xbM9p453n8KqrK3K8/R8YEAWxyXQx00vqYLA1ueWpcjTvCckSKcq/
	 UwO14JPIhM1WgCN1p8LxViBj8Z2k8obcRI0Mhlkp2ARhgGUh5u0oMwq9dI7e5KgSU5shk
	 8CYk1m0s4wtJBDGyBfGalr+WIS2EfuA8U7QquPetsefi2GBypDoTOSk0JlquhZA1sag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421805;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
	b=HJTcb6erSJZxwB/UsxkDUEgTf1Y4lQ6alkOSsgGknmWW1h2YyJ5p16nHI4bHp/AW4VXT
	 Yv9/tGeje5Y4cRf4qO5jiteb28jRxFceKGJtkZE9sKmCtwN0PeNrd7Yqf8mxHUdk3yjNq
	 EGKpimFUwl8giCgxYBX+X0eY8xOs8dh7uMQuomThU+5fkZkZepyN45LR4e804s+lKIHwZ
	 2tfBW4+IaRRlWbEjmLdPYtj9LoZ+Jq+KrtHYap5Ss+mE1CHddEdw/m9j/VILKfGJFXgqC
	 xw6lKykyQxnsbVuWa7vKH0OJammdjqp9x/P572+Y9wY1ui68SyI1d5ERUmhbN2nWmXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L286vrqT;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD2160724B5
	for <linux-doc.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L286vrqT
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9590C353A72
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421805; cv=none; b=OqafQE4yltwrpY94+FcDAnzuNZnmi9YpdCKD++Wis1g6WhrAzCGaxS31drNqiOB9jtercm6LMD2GJu8ddYPX4qrLpctFPOBetY/xLR31LV6CdHgVlLH8i3LVqq1cv6yL4WB3cXM3V+cs5+JZAictva5dICNIG7prqh1SNjIz0r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421805; c=relaxed/simple;
	bh=u2tKfwJJB5e+aehW1DXNufVLzIp2GEmIlBWnRfLHRIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV0B6f5kyHiJ/6J24XuhC/Y77xl+VUDtBCPXD1BdA5wTOgOGNzWmoef5SRukkBGcK5vRMM2v46TBrJfeCRYQqrPi98Z987xFbBwO6ZNDrejuycQrxWALCMnmmdT6ZxROuQ01FaGpHyM0qcsRWfwYHWvb6EBYhl4OEdbvNQUg+D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L286vrqT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso10367555e9.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421801; x=1793026601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
        b=L286vrqT8T6jLBeoez8OooEpdAjbQEiY+tq7E/WbKpPzFgIx/2BPvl1/dJQuaeUzjh
         J3f66zeCNjRzfjoo+QQmwZW7e26FAnK2Jofd3oMrHR1dh5Qvl7uh/bSpfoelIA4ck4Ll
         Cays0x8EFufCSWM4edqZY/XITfUtDhy46JUF0RxIZHrjbCXEftmxDw++foAYjXaOQp9w
         Vd+vTdCsHISJlyz4kDELZOm3djmYW7/6Oepo1SGlvCHOWJI7++hBUteJNXJHGa9PJbxi
         4kzBE5f8vES9sEC9dmyNwPVD1ai38DNWIC65XCh2yGyL/nVcORYQmX2m1v86Q+tlmM8K
         BvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421801; x=1793026601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
        b=UxdeWcCYxRsM/kwv5F8ou6b4wURDpZe6yk4t+0kKhYYko5eRpjDjOOWpD0pqkrv+zB
         qMcPanRRSkEjH7Mjly5zDC7LGnUTa6DA9Ay01eHo8v1s2GkqgWH7yaGFTQq5E45K4aTh
         u3rgHwYO5P6tRTq3PtH3GcvOvQJHsD84zwotwj9dxXEoIJkoyuLOh9+Jo6LbuTZoeCZ4
         iXygkoc63fNC+2uGC8M4R9i+UFyYfdQramD5Rdni6Fsat4uqG5oytZ+si1UKZ/jkBfF6
         pWFCjc8DpwMp7NIm6svgytoK2XZsLTBxABQrV9FPilM6eLGuIpIc8SM/00W/6IiEO1O1
         h2XA==
X-Forwarded-Encrypted: i=1; AKwUvByfaJobHUSkL0oJ+npis9/i/6ovVy3OJBR1pdadHIo0mTD+mFcCZac8edIGqYdks/hVwsZD/YQj9mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbsBAAQl49WxtdO5WulpNVMpnb/2otGUhbqIxq/+Zq7YYAIlMV
	MJ4jnv+p3Xlmm/Xp3l8+iukuhzijhA3Zbq82fbZW9AhzSCBX275OPXGC
X-Gm-Gg: AYBFou3jJMIkQOES9zflrPmae1vWRr6ZGs+PQt5QuzUIVhaq35+7MGcYTwy/SFK1Sqi
	+6apTF0DDijb8UgUDFQEmGcy6O5hIyp3NsqL+5YHTF97tFdvT0WiJL4e5iao9+tC/VIq/050P5H
	+A8PhfV3BJd6jwK6zwQRnrLuQM2U/+827VTOaz+IBz6WdmmavySJtn25Ob/Ki7DxSWlnXTizQ2W
	YXEUF6FrRXsG2t6S8g5QcMN1d793grDtFXLBaTmPgYBFJ5w7++ZtUC+0YqFENPZ4GyQxGbjzF7f
	/cwXDdRqQlMiEAX0w8yagELJ96UB++afGj4ABvmagOiScykSRNmp4CSsQHrFYATEA0RiWJgXGvk
	uce7ul2y20ufT0c4XqvhvQc8a+M1or9MpwI6DltSsc4W0xuXD6QNz/zkhNB2WwPUbZjANFNtEMO
	El3iF8zVM6KyLBD5uHWAO8XW3SEbLTRZeJ/o3XjUaYsLrpoeWnBFKkiNz1+uky7lwLTSs=
X-Received: by 2002:a05:600c:548c:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a1d7610f2dmr171252085e9.20.1792421800470;
        Mon, 19 Oct 2026 07:56:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20913100f8f.15.2026.10.19.07.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:56:36 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:56:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] tools/vm: rename tools/vm to tools/mm
Message-ID: <atYvmj4ZKlOfphJ2@stanley.mountain>
References: <atYOvqkdVSgjXZVM@stanley.mountain>
 <20261019135355.87175-1-sj@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019135355.87175-1-sj@kernel.org>

On Mon, Oct 19, 2026 at 06:53:54AM -0700, SJ Park wrote:
> Hello Dan,
> 
> On Mon, 19 Oct 2026 15:36:14 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > On Tue, Jan 03, 2023 at 06:07:52PM +0000, SeongJae Park wrote:
> > > Rename tools/vm to tools/mm for being more consistent with the code and
> > > documentation directories, and won't be confused with virtual machines.
> > > 
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  Documentation/admin-guide/mm/idle_page_tracking.rst | 2 +-
> > >  Documentation/admin-guide/mm/pagemap.rst            | 4 ++--
> > >  Documentation/mm/page_owner.rst                     | 2 +-
> > >  Documentation/mm/slub.rst                           | 2 +-
> > >  Documentation/translations/zh_CN/mm/page_owner.rst  | 2 +-
> > >  MAINTAINERS                                         | 2 +-
> > >  mm/Kconfig.debug                                    | 2 +-
> > >  mm/memory-failure.c                                 | 2 +-
> > >  tools/{vm => mm}/.gitignore                         | 0
> > >  tools/{vm => mm}/Makefile                           | 0
> > >  tools/{vm => mm}/page-types.c                       | 0
> > >  tools/{vm => mm}/page_owner_sort.c                  | 0
> > >  tools/{vm => mm}/slabinfo-gnuplot.sh                | 0
> > >  tools/{vm => mm}/slabinfo.c                         | 0
> > >  14 files changed, 9 insertions(+), 9 deletions(-)
> > >  rename tools/{vm => mm}/.gitignore (100%)
> > >  rename tools/{vm => mm}/Makefile (100%)
> > >  rename tools/{vm => mm}/page-types.c (100%)
> > >  rename tools/{vm => mm}/page_owner_sort.c (100%)
> > >  rename tools/{vm => mm}/slabinfo-gnuplot.sh (100%)
> > >  rename tools/{vm => mm}/slabinfo.c (100%)
> > 
> > Is there a reason we left the tools/vm directory even though
> > it's empy?  Is it for backwards compatability or something?
> 
> No, I think this patch didn't leave tools/vm/.  I cannot see that on my tree:
> 
>     $ git log -1 799fb82aa132fa3a3886b7872997a5a84e820062
>     commit 799fb82aa132fa3a3886b7872997a5a84e820062 (HEAD)
>     Author: SeongJae Park <sj@kernel.org>
>     Date:   Tue Jan 3 18:07:52 2023 +0000
>     
>         tools/vm: rename tools/vm to tools/mm
>     
>         Rename tools/vm to tools/mm for being more consistent with the code and
>         documentation directories, and won't be confused with virtual machines.
>     
>         Link: https://lkml.kernel.org/r/20230103180754.129637-4-sj@kernel.org
>         Signed-off-by: SeongJae Park <sj@kernel.org>
>         Cc: Jonathan Corbet <corbet@lwn.net>
>         Cc: Shuah Khan <shuah@kernel.org>
>         Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     $ git show 799fb82aa132fa3a3886b7872997a5a84e820062:tools/vm
>     fatal: path 'tools/vm' does not exist in '799fb82aa132fa3a3886b7872997a5a84e820062'
> 
> If your local tree has some git-untracked hidden files under tools/vm/
> directory, the directory might not be removed.  That could made you think this
> patch left the directory?

Ah, yeah, you're right.

What happened was ChatGPT told me to type:

	make -C tools/testing/selftests/ TARGETS="vm" run_tests

That command is outdated since it's supposed to be mm instead of vm but
it creates an empty vm directory...  PEBKAC on me.

regards,
dan carpenter

