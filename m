Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405C387349
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054096; cv=none; b=S36rx7VfVKI1FPlJueuPQ6RUR7J7izSgYdzLYFD/j1OwbhFb3naAq/fj9T+SVaukHjJa8wYbSX4mSFL3MVZx4kCjK9vPVy4Ya6TXUdhOPwz1VR18kpAjozTAmGq1pfU3vD0t9GmBhRAPVISey+iiwZTcFTgUL6bpGzRPcApQDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054096; c=relaxed/simple;
	bh=NvSchrP/3iqVAPZQcFrmz3WZ5MlQLRFV2NZ/1rw7880=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBUscuQKW34Wrabq0mza6nHm824D1QcnztTGQk+3rDyPZHOTCNiPywZhnu9N4NUjYd4v/mT7iZ8318+7uS73YZDmkMB6837iQjDbCE1eutbGpS++97ypDu0Ma3Jx2jU/gKbqR1OeSIH8qeiiTCjfaj5WM2ZFDH8QcJg7t/HI8Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Sx5Ofipm; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Sx5Ofipm"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a288811a4so46341326d6.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1770054094; x=1770658894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OBDEWLEmHCzYPUVrTciErMQbNpqUwuoibpvHtq101E=;
        b=Sx5OfipmZy6VSguN3UfYogDNou/OpbG+PH0pl1nyOXT/V88T3HqakBgwdFYC+dChwy
         KrfUKFMnK+VPp7SscQaJqHz4Y1qi1pb+EvNbv1A1I5UJQHVApan8h2NlPs3kwrOopt7r
         y4Lw6oGg2jS1pmfG6ekVvTRmo1L8kOib4WH3udiGLUpqz4qCYg1VIrNNkZTKubhK3gpn
         Gqb3MfSjSna1InoYN45/s0i9wis222PsHOK/zHXWJ/1KC87XnaGFrbkvmpO9/P7YEWQp
         YWEWbmhF3jHygOmg1Fc0fuEVSOIRe+4Brv/7e6Hn1ooqZ8FZV4enITWnxGAtd7lEOO37
         04dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054094; x=1770658894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OBDEWLEmHCzYPUVrTciErMQbNpqUwuoibpvHtq101E=;
        b=DqrI4BmYDWp19H+9CkT3TvmzZOxmN5PzN+QSxdngXqUHoxDtue5hDc4ERy4g3Qudxv
         1Fe2ooNorQuB7qqMWoNXwQzXQ/YWQoTfgdw/VGBA0J1pIGNMVYER258x5xYJVhXzId2Y
         ytYYIwUKlekpEy1v4VR1ExgHHlQqMbG3NJX1N8ljNbRHIX/EARnCh+DGBWeZ1Kv7okk8
         ImTasHChlv+Y89msUelMi/ZtRnp550neTEvHXNmBeZW++0RLeE25GHP+aRsNAIKp1DxW
         7+b9Ml9WqqyKA4/NpSA1CkQ/TwRvkkOLJDA7ottDv+tnSxjQvhFfnbVTu5Grgmb5OeQk
         kNyw==
X-Forwarded-Encrypted: i=1; AJvYcCW/0bMpmfpYbvBo8I2UgIb9R5tWWAEm5tDhiCM7AIvyrEKyC9+7Bj2tdTJAd3gDv7AzfXi/LNu1rR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgqeEdh/DRGA/9H4L0J7Zej0hpYyg1TjlfV66IBzNTjjJRXBK
	YNHLp6g89KU1WviH+p59oPAy4rSPkE5p55jN7yyTUN53UL2I6QwZKY1gwV98bbjJRbk=
X-Gm-Gg: AZuq6aI85goYWPERyQXSMTchdSUUadSrb+F7m5njnAkmR4xEDOHsqegw9PJidrbmGfF
	TzmkmskyE+gZPwd5Kaw2yINMSr7ufyrsSQpVol4JC1ZsiKoE8SGZeAUUYMVzb5FoZQt/CT7kBKL
	8vMWQob5vl5BaxpPZ44l3Mccbf7HgNtDWbUtitnjNt0XJpF3UKMtLn86KyTMI/GPRU3Y8AnHiNJ
	pqg6y8ER1Xfgg/9hIJqEfpoCEAOjlKfYpv85Tk2XAfTBZZkUyPKZ15st/6iXGNGKpzyM2kNeMv5
	g8HfrLk3WFRQq+gPVbcRAxrzIQwAVHxbGrX1Uv1K+i3G98T8BlOi0bC07H7HhkWhpmarh9w3/PO
	aPOSGvHifXGJ/sGAEPETwfzpIGu+fYR5XvAITdTHBmBQmrMmP2WA0kG2LpmrM2Ug0d/91IZna2W
	RZBLAfI/QoVvKy6DT9ZN/Kvvw3ey5XnUbHZbUyxLYQHNBEcOcp3coT5arZMf55elbREONLPuGU4
	w3lDHkS
X-Received: by 2002:a05:6214:20ae:b0:894:7fa3:7a32 with SMTP id 6a1803df08f44-894ea0f90c0mr191291886d6.68.1770054094267;
        Mon, 02 Feb 2026 09:41:34 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b7c789sm1274632885a.7.2026.02.02.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:41:33 -0800 (PST)
Date: Mon, 2 Feb 2026 12:41:31 -0500
From: Gregory Price <gourry@gourry.net>
To: "Cheatham, Benjamin" <benjamin.cheatham@amd.com>
Cc: linux-mm@kvack.org, linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, willy@infradead.org,
	jack@suse.cz, terry.bowman@amd.com, john@jagalactic.com
Subject: Re: [PATCH 8/9] cxl/core: Add dax_kmem_region and sysram_region
 drivers
Message-ID: <aYDhyxjzKtbqFWdM@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
 <20260129210442.3951412-9-gourry@gourry.net>
 <c1d7d137-b7c2-4713-8ca4-33b6bc2bea2b@amd.com>
 <aX0s4i5OqFhHkEUp@gourry-fedora-PF4VCD3F>
 <9652a424-6eb1-462f-8cbd-181af880f98b@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9652a424-6eb1-462f-8cbd-181af880f98b@amd.com>

On Mon, Feb 02, 2026 at 11:02:37AM -0600, Cheatham, Benjamin wrote:
> > 
> > For auto-regions:
> >    region_probe() eats it and you get the default behavior.
> > 
> > For non-auto regions:
> >    create_x_region generates an un-configured region and fails to probe
> >    until the user commits it and probes it.
> 
> I think this was the source of my misunderstanding. I was trying to understand how it
> works for auto regions when it's never meant to apply to them.
> 
> Sorry if this is a stupid question, but what stops auto regions from binding to the
> sysram/dax region drivers? They all bind to region devices, so I assume there's something
> keeping them from binding before the core region driver gets a chance.
> 

Auto regions explicitly use the dax_kmem path (all existing code,
unchanged)- which auto-plugs into dax/hotplug.

I do get what you're saying that everything binds on a region type,
I will look a little closer at this and see if there's something more
reasonable we can do.

I think i can update `region/bind` to use the sysram driver with
   online_type=mhp_default_online_type

so you'd end up with effective the auto-region logic:

cxlcli create-region -m ram ... existing argument set
------
    echo region0 > create_ram_region
    /* program decoders */
    echo region0 > region/bind
    /* 
     * region_bind():
     *    1) alloc sysram_region object
     *    2) sysram_regionN->online_type=mhp_default_online_type()
     *    3) add device to bus
     *    4) device auto-probes all the way down to dax
     *    5) dax auto-onlines with system default setting
     */
------

and Non-auto-region logic (approximation)

cxlcli creation-region -m ram --type sysram --online-type=movable
-----
   echo region0 > create_ram_region
   /* program decoders */
   echo region0 > sysram/bind
   echo online_movable > sysram_region0/online_type
   echo sysram_region0 > dax_kmem/bind
-----


I want to retain the dax_kmem driver because there may be multiple users
other than sysram.   For example, a compressed memory region wants to
utilize dax_kmem, but has its own complex policy (via N_MEMORY_PRIVATE)
so it doesn't want to abstract through sysram_region, but it does want
to abstract through dax_kmem.

weeeee "software defined memory" weeeee

~Gregory
