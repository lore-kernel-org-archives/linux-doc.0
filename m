Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2464F0552
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089473; cv=none; b=tFHv43ynpkx39RgkvsjheN/lU3aL5XlNMn62c5qWWrHd5tesp3WMd8gxwlxmhAcKLdKUp59TLH1ks5hRnf3CiJnYdtX96rZQn3J2fC9NHxdRd45IhmHMnyNvyll1dcFLgeKhkMEKUrWTZqOoYPZvXcaSM7357oWsX6kM+UqKgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089473; c=relaxed/simple;
	bh=JVqrVLbpqaV4yYWEGdvRO/b8euCJwpqA++3GCxL7hmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGHeTThVtXgIyxrABlvB9D7EXfGNS1APA/a4v5h0VSvFFlqxEhl+knx1q1qImEAjqO5YtbSZzEUOUhPxfS4+kVXPxsfyhx3YAi+n2AiFJOtKqay6rt70L0lLHewrb2qzgujCmR58lpVE9mpwh02EXdKu8XK5ykVP2QfppclnBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VVbx5Oeq; arc=none smtp.client-ip=91.218.175.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VVbx5Oeq"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JVqrVLbpqaV4yYWEGdvRO/b8euCJwpqA++3GCxL7hmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790089461; v=1; x=1790694261;
 b=VVbx5Oeqqw2rNX+UPZrMlh5/OXQrdmaOg9k6E7EI0rnAhhG6bEBGAe4PdPUTYjOCbVIQ9fTz
 oeRzSmFTuUs18GPs+3dZSA992WFPrBaqMcDUU3/TFH03tkekH+y969PMiyYOy2OY54hhkTipTLL
 PMH2zPNoqv6jyYkbbN4Y6504=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ccb4c3c2135a73a;
	Tue, 22 Sep 2026 15:04:21 +0000
X-Mizu-Trace-ID: 5ccb4c3c2135a73a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 22 Sep 2026 23:04:14 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Babu Moger <babu.moger@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	bp@alien8.de, ben.horgan@arm.com, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	fenghuay@nvidia.com, akpm@linux-foundation.org, rppt@kernel.org,
	dapeng1.mi@linux.intel.com, elver@google.com, jlayton@kernel.org,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	seanjc@google.com, peterz@infradead.org, chao.gao@intel.com,
	jmattson@google.com, naveen@kernel.org,
	ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
	chang.seok.bae@intel.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, elena.reshetova@intel.com,
	darwi@linutronix.de, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 00/16] x86/resctrl: Add kernel-mode (e.g., PLZA)
 support to the resctrl subsystem
Message-ID: <arKY7nyMuR7fjIon@three-body>
References: <cover.1787772750.git.babu.moger@amd.com>
 <arCjBqclcfHBP8fH@chenyu-dev>
 <0729c208-b3d6-40cd-8316-185226838310@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0729c208-b3d6-40cd-8316-185226838310@amd.com>

Hi Babu,

On Mon, Sep 21, 2026 at 02:27:45PM -0500, Babu Moger wrote:
> 
> Hi Chenyu,
> 
> On 9/20/26 22:22, Chen Yu wrote:
> > Hi Babu,
> > 
> > On Wed, Aug 26, 2026 at 02:32:14PM -0500, Babu Moger wrote:
> > > 
> > > 
> > >    # Create a CTRL_MON group and associate kernel-mode allocation with it.
> > >    # mkdir ctrl1
> > >    # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" \
> > >            > info/kernel_mode
> > >    # cat info/kernel_mode
> > >    inherit_user
> > >    [assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//]
> > > 
> > >    # kmode_cpus and kmode_cpus_list are visible only on the associated group.
> > >    # ls ctrl1/kmode_cpus*
> > >    ctrl1/kmode_cpus  ctrl1/kmode_cpus_list
> > > 
> > 
> > Just curious, would the other existing files like "tasks" be exposed under ctrl1?
> > If this ctrl1 is used only for "kernel space" mode, would the schemata of ctrl1 be
> > shared by all tasks in the system? That is to say, it seems that there is no need to
> > expose "tasks" under ctrl1. Should we hide "tasks" for the kernel group? Please
> > correct me if I misunderstood.
> 
> No, I don't think we should hide the tasks interface here. It provides the
> option to use a group in a mixed mode.
> 
> # mkdir ctrl1
> # cd ctrl1
> # echo "1,2,3" > tasks
> 
> At this point, PIDs 1, 2, and 3 will use the schemata from ctrl1, regardless
> of which CPU they are running on. They will use the same limits in both user
> and kernel mode.
> 
> # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//"
> \
>           > info/kernel_mode
> 
> After this, all CPUs in the system will use the schemata from ctrl1 while
> running in kernel mode, including when executing on behalf of PIDs 1, 2, and
> 3.
> 
> Essentially, this provides the flexibility to run in a mixed mode.
>

I see, a single group can be used both for regular resource control and global kernel resource
control. Thanks for this explanation.

thanks,
Chenyu 
