Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28861401A13
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814752; cv=none; b=N/htdd8aD4Lvz/q3gvUHwyz78QbfbfSRVSD7LIvRooCdEwGpnVOiKsrD0vvK8F9IOIN4d7c23s9WrOjnJFUYthOxSa21GJ+T6zR806ElrJ3XCfhP6v7jcHOEDqVRPiUHvV0qNi7UWVUHGe5eT753xC2DvzuQ2ygHi3A+V7Xh6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814752; c=relaxed/simple;
	bh=Qu3cX7hp15/dx5l9QwIIMPC3NhQ0zgTS490oYVxhoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCLKybfS2/O02Y+ktvS9SkLrq8NIY0q1hGpcJYiwHcA4V984XR0/uaF8bjOxl88EMLsl44WEA1i7COtHdM6D6iwcmmTNTgJfO4D2GwdTvfA/rZpg74i4tSpXpOq7zBSgeEinHcAkatyApmfPQ+mGkOuOMyMIjrTJoj4NiZAwG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IrQshl4Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oQ+fycG6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IrQshl4Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oQ+fycG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779814750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73qJRcIVQTUMp+UCzOKPBNoPdNKc7KyWvvJbngzri24=;
	b=IrQshl4YLBEKVQSARTc1lqzl/wPCM635kGALBBri5JNqMDQvMAAYmG241r4s74vZh4Pp9O
	qGwIiLdZdIOxQ8YI+HlfK8RlRPlCWWbsoquKZI+4lyn9zZWCxwe0m07f5pA/xSfz5gRsfZ
	nvPDjr3bTS+KKgj4k0dlLP4VjAA+wnk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-vTcqpqVPOdOvZu2Cxx-_wQ-1; Tue, 26 May 2026 12:59:08 -0400
X-MC-Unique: vTcqpqVPOdOvZu2Cxx-_wQ-1
X-Mimecast-MFC-AGG-ID: vTcqpqVPOdOvZu2Cxx-_wQ_1779814748
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90cbd806004so2299216985a.0
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779814748; x=1780419548; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=73qJRcIVQTUMp+UCzOKPBNoPdNKc7KyWvvJbngzri24=;
        b=oQ+fycG6vge/XN5x6UArwwdDi8lLNOc77iVLsBK+Y9sFj3i+9d4DjuETJv8G+e11VV
         Nm5Y6AD2PfMCHj/y9tfGi2SsV799XE/PnZF4bNbqa9Ot/HkHOp0oTqhlHf+54+1qu4mw
         My0ORacKIjdbhHSbK7aE174okp3bL1FYtatUjEF2ysMsfP8sVgX2+EWbghVlOPjZOql/
         PGgCFBAIpPobmnZiQULQbxXVtSOD0uAnXAGiKcuU8hxFtdzVpUcmo+9iN2+rq5zx+s+3
         TZvqrwoqz0m1nmKN1x89Tl9OU83pFmEQItsMts6+QNGNgTbpGoPb2cXHPyF/WODZmje5
         SUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814748; x=1780419548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73qJRcIVQTUMp+UCzOKPBNoPdNKc7KyWvvJbngzri24=;
        b=nTcNspSF6w0tdBMLT/W4e6QqxxxwCiuciXrZcBgwuh7b75k7G8A+xRg6XWllwbxAE0
         pYh/32koh/RKH+xtQQKbZs3vcN4A0B8BdMiXbkap+Ghh++xqM0ZvCinyD7mXTC5V8nr8
         6n4NaSQw9fHZ1i9DiK90Al0XBSHj/s7cl8sP+JYgvc5MOk8wnjqM4mgGMP05rDw3JquM
         EYdAENNG/F0+QC2/kQ29oxGro3eLTPT36T2nfVfhKiLgv8Z2qtmQ5pmnoVN2e/0wJA56
         cRijShsPcNGoS0lXGUYHmcUMhfDDwn2m9rA5UN5EO9fy/x1lSBqVfH7W8y3oUEfAax3d
         vy5w==
X-Forwarded-Encrypted: i=1; AFNElJ/GFVTjuuQUx/FV8+CZVMklTHOpvSr0YvLhZj1F1kbS4xX3t59OeXcd1dleFH2MVpUVajuV/QHC7bM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ1fHoF5jiJZqMVUshpR1wtAo3XiRVpwhf19UZfo6OzR/OUZiS
	+gNjLLcXq9KrQPhaZuzG5t+K6wYK7qlZTp+TRrSf/fzTOQnwhauETF/lDjq3+PX3dZu42x4gGAq
	Bvz2MzFg1Ccck1E8Wn2jU7ma16+kiSDSq7XHf0yZ+U6v9UR+U6wmuLfOcoYupHg==
X-Gm-Gg: Acq92OHqQJFOaEhAxXUHVPYg2Ofj9T0fhjZQI4foRfNIadNEQYIHqg4WL9Gi+MGdKtF
	iLBuYOf75oi+23nlasSbnUSUgsRVoiHRBmNDTSDjk0fJ/YJS3YV70lblPO1ZazbOnT10fax/Q2e
	ENPBy/8AYoiipMpyw4bfvvukjR4a2kJ87As+9hrx2cW3M+VWgQ52IMg6BujRvP1hOAXOGZzohZW
	zMSsSow+WxyRLU8OW+sIp59UBK/K/cjRrNiSq+AhmVXwgbhwiiW6/SxKf3s+24bDpMCjbUWbKCd
	rBwb3cOtIm2jKn6bIeed+pu+8pASXp0OOEmOU8C3k/zFxj+TCzYXT1R3EUnsBhzOxrrRtDBkauk
	oi35lSRG/gZlhi3hMm3Cx+2IujSBvfJLmlLGbGbJmULt65CZ8itT7cyeA4dTqGm1IJA==
X-Received: by 2002:a05:620a:2718:b0:914:c0e8:224 with SMTP id af79cd13be357-914c0e80a72mr2780659685a.54.1779814748220;
        Tue, 26 May 2026 09:59:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:914:c0e8:224 with SMTP id af79cd13be357-914c0e80a72mr2780650485a.54.1779814747523;
        Tue, 26 May 2026 09:59:07 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f8806496sm245054085a.38.2026.05.26.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:59:06 -0700 (PDT)
Date: Tue, 26 May 2026 12:59:05 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
Message-ID: <ahXKFYBdCMDBvc_N@x1nano>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>
 <ahBxB5a9sX9DEWvl@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahBxB5a9sX9DEWvl@localhost.localdomain>

On Fri, May 22, 2026 at 05:26:16PM +0200, Michal Koutný wrote:
> Hello Eric.
> 
> On Tue, May 19, 2026 at 11:59:02AM -0400, Eric Chanudet <echanude@redhat.com> wrote:
> > Add a root-only cgroupfs file "dmem.memcg" that lets an administrator
> > configure whether allocations in a dmem region should also be charged to
> > the memory controller.
> 
> This kinda makes sense as it is not unlike io.cost.* device
> configurators.
> 
> Just for my better understanding -- will there be a space for userspace
> to switch this? (No charged dmem allocations happen before responsible
> userspace runs, so that the attribute remains unlocked.)
> 
> (I'm rather indifferent about the actual double charging/non-charging
> matter.)

Yes, this is intended to be configured before the user space stack that
would start allocating things is started. Once it has started (and tried
to charge something), the configuration is locked

> 
> > 
> > To handle inheritance, dmem adds a depends_on the memory controller,
> > unless MEMCG isn't configured in.
> > 
> > Double-charging is disabled by default. Once a charge is attempted, the
> > setting is locked to prevent inconsistent accounting by a small 4-state
> > machine (off, on, locked off, locked on).
> > 
> > The memcg to charge is derived from the pool's cgroup, since the pool
> > holds a reference to the dmem cgroup state that keeps the cgroup alive
> > until it gets uncharged.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  Documentation/admin-guide/cgroup-v2.rst |  23 +++++
> >  kernel/cgroup/dmem.c                    | 158 +++++++++++++++++++++++++++++++-
> >  2 files changed, 178 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > index 6efd0095ed995b1550317662bc1b56c7a7f3db23..1d2fa55ddf0faa17baa916a8914d3033e8e42359 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -2828,6 +2828,29 @@ DMEM Interface Files
> >  	  drm/0000:03:00.0/vram0 12550144
> >  	  drm/0000:03:00.0/stolen 8650752
> >  
> > +  dmem.memcg
> > +	A readwrite nested-keyed file that exists only on the root
> > +	cgroup.
> 
> Strictly speaking this is not nested-keyed but flat keyed [1],

Indeed,

> which leads me to realization that this is the first instance of a boolean.
> All in call, such a composition comes to my mind (latter is RO):
> 
> 	drm/0000:03:00.0/vram0 enable=0|1 locked=0|1
> 

So per[1] 1 key, 2 sub-keys (enable RW, locked RO), that looks better
and match the documentation, thanks!

> 
> 
> > +static ssize_t dmem_cgroup_memcg_write(struct kernfs_open_file *of, char *buf,
> > +				       size_t nbytes, loff_t off)
> > +{
> > +	while (buf) {
> > +		struct dmem_cgroup_region *region;
> > +		char *options, *name;
> > +		bool flag;
> > +
> > +		options = buf;
> > +		buf = strchr(buf, '\n');
> > +		if (buf)
> > +			*buf++ = '\0';
> 
> I recall there was a discussion about accepting only a single device per
> write(2) (at the same time I see this idiom is still present in other
> dmem.* files, so this is nothing to change in _this_ patch).

I would second that. When setting say dmem.max for 2 regions, with a
typo on the second, the first one is set, but write still get EINVAL.

Also, I just notice dmemcg_limit_write() returns EINVAL if the region is
not found (this patch returns ENODEV).

> 
> Thanks,
> Michal
> 
> [1] https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#format



-- 
Eric Chanudet

