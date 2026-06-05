Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879123A9BD
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674152; cv=none; b=dW65+bSOKssUQqdD/uIinVyRTySgNYzqiwEaDXK2HgJxTH44zAkDZzGk/r3uO8sx12TSuOvyHLZUFUg8m8pl+BhLI3mNBkBvwcvkjmzwpOsIilH1FGzui7oyYC25FX/SeJizUuQP2xgz+jesXMMEl4LMxgMhQZq5Sy9GZcss8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674152; c=relaxed/simple;
	bh=hNXMOCusmTiv9t8jBH97402lT0OFK1tPV6LcYWEcI0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgCwSWa0tK04a09K9YInOD34Sqs2ityFp48RknkqYghiC1LXK32yFRzlzbRK097Xc+ErUU+/6RKHVuq/lf1ePUPfpoeKGHbEafPuqbhBMgOh4IAAz8xQUtYMgq/84inciwcEynLZAWP8KvkozTJEFk8gH6A43Cqp1knunxCcB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wkm5OHuS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+HEcTwM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wkm5OHuS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+HEcTwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780674150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykStheHWzMecvQlC8/orrpWH+CEGzXq9KPPg3CU9BFw=;
	b=Wkm5OHuSi+DmWKoOEdpiU+hIgQSyLP6VuGQUrH0Y/tIiWwrEhXO+y2PrMIMLBp5oBmg8xj
	Ca9gZhNrsA41N6wgAgqUhdGOhLssc9r8kTqlFsAeLfkSL1i2T4EyFcR/Hsl4/uUhbmMwLE
	eDhwzRyTz7wxu5+79IMxUE2mKJukiL8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-VODafpf3Nl23knXbKHvgTQ-1; Fri, 05 Jun 2026 11:42:28 -0400
X-MC-Unique: VODafpf3Nl23knXbKHvgTQ-1
X-Mimecast-MFC-AGG-ID: VODafpf3Nl23knXbKHvgTQ_1780674147
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91574ad681eso227512985a.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780674147; x=1781278947; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykStheHWzMecvQlC8/orrpWH+CEGzXq9KPPg3CU9BFw=;
        b=Q+HEcTwMSZGwipJDNevrJmq+OjbpOrsA78SyPVjkkw0DSCG8VzY1cUwbluO/8cwhj4
         lHmCtWuNpbTMFUW0OUS6joQeefT8aUj+cBM1QyhcZOOtvDMLJ5EpJniqwvWDRxEYmeUP
         +/0mwUgzndc08H3FeNvMAySqcrNSdbKksb7Th9cf9raFl8AxZpsrgkmSM2kKhB4BsN8j
         hvMLNGFlWACS7hIR3NKbec8/3HeLFKEnBShmJhsenkIMP/Elb/dvnH6mqQzIDnIeMCj/
         lldKC4ABYi2Nr6hlaQl2Ffle1J0JuGLUmQcEdsvpW1GhaY9Sp1gzDtx3FbmUPlX8ldLp
         JJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674147; x=1781278947;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykStheHWzMecvQlC8/orrpWH+CEGzXq9KPPg3CU9BFw=;
        b=M/gC0FMm2aIilhxmuIUSsNq8aQtQZbp6NfGuWQqrv4KSxz0QwJJsfaKhK/C9gLW2uM
         Qz0jKvV9N8janYHDeTs/tsWqYVXAJwPIBRRHYAuj2xlJaopPRMdVCMFTa1jcM+PFg7r9
         sDUi84A6P70Yf/5OUy9s5hwz/g29yot5X8LlK8SZLfZMy/BakbsblZxau9HGgR0r2zg/
         JAXBvnw2ceowOh02HVD+rvLjZSsF/Vc5Y/GUwLe8QygkgO6xk9SXGKceV2Et/r3zqqUX
         FMBlFlitwMHovwqKyNvvPsTKfDWUkPYiP7kO24Tt6D/A21IJn29eMddefLk94WTIlYOm
         s78Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LSwn1crh+U6b6qjCKVPa9AXIaqqMkAXK7qGfTjOncVSnkQU2lzSU9IrvXYZvqe/Kk0c/zCJl/LK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrACLXpmY+QKi3kIGAONiHv4YMknV4ubVK5FkopbhXZ/+JhFi/
	zYasqzrdIKdYFqZXtEC1PuDtFgIuZzTAk/hxI+L+NMz4qe6qt5wBYEUJoZBqUWkyUK9SCOhAGUw
	F5u8emNv58EY3e9SeQDFq6Dtkdtik+wqBU9Iph5LOLb1mvZalUOw2g0dmbPrW3g==
X-Gm-Gg: Acq92OEt5sxscn/jSikGVoHObI80EHUllTVshxXMXYvHxlGOQabJXCsH6ko9miZnNYz
	Ei5bzJOCSR3pAGcjNMTuFsG2g8TsQeupZlD0jLGIY/W5AZ202/eV71zs8ssvUJlME8YzSHTSLEU
	miRSjIkml8iT3thda2O/On8dPD4Zwkm6gUSOhEDPwfuEEadi5Xv8tTO9qopYLzfbknRIfNyZTVc
	KJvbwzpubM/CVqvXF2eK00pWBfD6pTVWnBkVeY54xOKmEWvsqhoGjVE3ALCjwr5bmSfCfIcP+KC
	ucxcwKHZtDKzYHYf9skQogIQPOHQLpP18bIrKPwOzyhkBk2DhTv2BIFnvp/fW4s19XHfRv5wxMm
	H+oB/x431gvhdKO0RsolIcQ7U4uucPzkAy6SeK1NjB7hojRtr8fGB9lDCLp8Vhcr9L03YmAru08
	D2
X-Received: by 2002:a05:620a:f11:b0:915:8f08:5f9d with SMTP id af79cd13be357-915a9dd4bd8mr792213985a.56.1780674147336;
        Fri, 05 Jun 2026 08:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:f11:b0:915:8f08:5f9d with SMTP id af79cd13be357-915a9dd4bd8mr792205585a.56.1780674146859;
        Fri, 05 Jun 2026 08:42:26 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm921805785a.39.2026.06.05.08.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:42:26 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:42:25 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
Message-ID: <aiLVbQPxK1qI1h4p@x1nano>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>
 <ahBxB5a9sX9DEWvl@localhost.localdomain>
 <ahXKFYBdCMDBvc_N@x1nano>
 <158bc103-7f99-4df4-8d3b-2da9b04ac0ed@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <158bc103-7f99-4df4-8d3b-2da9b04ac0ed@lankhorst.se>

On Fri, Jun 05, 2026 at 01:27:09PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> On 5/26/26 18:59, Eric Chanudet wrote:
> > On Fri, May 22, 2026 at 05:26:16PM +0200, Michal Koutný wrote:
> >> Hello Eric.
> >>
> >> On Tue, May 19, 2026 at 11:59:02AM -0400, Eric Chanudet <echanude@redhat.com> wrote:
> >>> Add a root-only cgroupfs file "dmem.memcg" that lets an administrator
> >>> configure whether allocations in a dmem region should also be charged to
> >>> the memory controller.
> >>
> >> This kinda makes sense as it is not unlike io.cost.* device
> >> configurators.
> >>
> >> Just for my better understanding -- will there be a space for userspace
> >> to switch this? (No charged dmem allocations happen before responsible
> >> userspace runs, so that the attribute remains unlocked.)
> >>
> >> (I'm rather indifferent about the actual double charging/non-charging
> >> matter.)
> > 
> > Yes, this is intended to be configured before the user space stack that
> > would start allocating things is started. Once it has started (and tried
> > to charge something), the configuration is locked
> > 
> >>
> >>>
> >>> To handle inheritance, dmem adds a depends_on the memory controller,
> >>> unless MEMCG isn't configured in.
> >>>
> >>> Double-charging is disabled by default. Once a charge is attempted, the
> >>> setting is locked to prevent inconsistent accounting by a small 4-state
> >>> machine (off, on, locked off, locked on).
> >>>
> >>> The memcg to charge is derived from the pool's cgroup, since the pool
> >>> holds a reference to the dmem cgroup state that keeps the cgroup alive
> >>> until it gets uncharged.
> >>>
> >>> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >>> ---
> >>>  Documentation/admin-guide/cgroup-v2.rst |  23 +++++
> >>>  kernel/cgroup/dmem.c                    | 158 +++++++++++++++++++++++++++++++-
> >>>  2 files changed, 178 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> >>> index 6efd0095ed995b1550317662bc1b56c7a7f3db23..1d2fa55ddf0faa17baa916a8914d3033e8e42359 100644
> >>> --- a/Documentation/admin-guide/cgroup-v2.rst
> >>> +++ b/Documentation/admin-guide/cgroup-v2.rst
> >>> @@ -2828,6 +2828,29 @@ DMEM Interface Files
> >>>  	  drm/0000:03:00.0/vram0 12550144
> >>>  	  drm/0000:03:00.0/stolen 8650752
> >>>  
> >>> +  dmem.memcg
> >>> +	A readwrite nested-keyed file that exists only on the root
> >>> +	cgroup.
> >>
> >> Strictly speaking this is not nested-keyed but flat keyed [1],
> > 
> > Indeed,
> > 
> >> which leads me to realization that this is the first instance of a boolean.
> >> All in call, such a composition comes to my mind (latter is RO):
> >>
> >> 	drm/0000:03:00.0/vram0 enable=0|1 locked=0|1
> >>
> > 
> > So per[1] 1 key, 2 sub-keys (enable RW, locked RO), that looks better
> > and match the documentation, thanks!
> > 
> >>
> >>
> >>> +static ssize_t dmem_cgroup_memcg_write(struct kernfs_open_file *of, char *buf,
> >>> +				       size_t nbytes, loff_t off)
> >>> +{
> >>> +	while (buf) {
> >>> +		struct dmem_cgroup_region *region;
> >>> +		char *options, *name;
> >>> +		bool flag;
> >>> +
> >>> +		options = buf;
> >>> +		buf = strchr(buf, '\n');
> >>> +		if (buf)
> >>> +			*buf++ = '\0';
> >>
> >> I recall there was a discussion about accepting only a single device per
> >> write(2) (at the same time I see this idiom is still present in other
> >> dmem.* files, so this is nothing to change in _this_ patch).
> > 
> > I would second that. When setting say dmem.max for 2 regions, with a
> > typo on the second, the first one is set, but write still get EINVAL.
> > 
> > Also, I just notice dmemcg_limit_write() returns EINVAL if the region is
> > not found (this patch returns ENODEV).
> > 
> >>
> >> Thanks,
> >> Michal
> >>
> >> [1] https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#format
> > 
> > 
> > 
> 
> Perhaps a bit late, but before we start adding this UAPI we should enforce a
> single region per write?

I can send that separately, although that is a UAPI change. Is there any
user that would be affected?

This series is hung on charging memcg using memory objects from the
context of dmem, when at that level of abstraction it doesn't have
access to the underlying pieces that were allocated.

Best,

> 
> Kind regards,
> ~Maarten Lankhorst
> 

-- 
Eric Chanudet

