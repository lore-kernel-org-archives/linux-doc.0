Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582EA227EBB
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449255; cv=none; b=januAJOU/8JWqgF1PnWpQZPWCX7nEVEu6YJ+5/MQwdoBOYJhrQv7h/GehP9+yP0xHxC239u/kNtlVt7gaSxSZiBIGDwwDv0cJntcpb9UgEEJrjuFazaZynqAjbejojCWZjKSYNgSFG8GBzDzRZQVVGqhRL6EOhVE5WSr3//rz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449255; c=relaxed/simple;
	bh=IRReHnP82xDBIGV02SKSAdezrhghPyFUklTXLeug0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcC59T08HuxgxvUtVp92RYk9D41fiPlPjTuXntlx1PpcvYpfTtDGH7qaXNGsp0FAyyP4eOk/cZEVcUWf0GoQHcdRIeiDSKO6rf685BNhS9ETaMn/iTrnx5HyeUP6LBOpVkFZq0eOIJtje1qqKlL8xRzlIYW3jPXsKi7xyx8VN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwA+WNor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwA+WNor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3968C4CEE3;
	Fri, 20 Jun 2025 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750449254;
	bh=IRReHnP82xDBIGV02SKSAdezrhghPyFUklTXLeug0AQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LwA+WNor8fBJjQnX98EJsiDlM3Kz8g15ew2BCpMP9dKEVhxGXKC6jFm8sexwTRMr3
	 afad6YKPYR+0L6EkcfZwIpcFiNdxJL0qADMRF82TaLh7GmWDSsC8KG5PPUJBHg3Xl0
	 jRBBsZTCoJY9PpEQqqBu4H0QMw24K1s6ztRPvNaoX3VjKpoHgl3Of9PBZRMhDk7ngV
	 gr+cw7bhanVbsNuQxysqoc3yp6cQVFZnZeUMePc/RL5gyhXLD197OBUOp/B3h9fyPk
	 ZGM8Ms4qGZMNxZi2GuVwHHCdME7Zxlt8kis2U5FmlFhSzkn4wDpAw/KpovPgrJx+45
	 oBTKYwfoksJJA==
Date: Fri, 20 Jun 2025 21:54:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
Message-ID: <20250620215410.5e28861a@foz.lan>
In-Reply-To: <20250620204459.4ae733d3@foz.lan>
References: <87wm97fmn3.fsf@trenco.lwn.net>
	<03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
	<20250620094430.212779e5@foz.lan>
	<528f0354-1869-4cfe-b71d-fe169b2bfc76@gmail.com>
	<20250620150406.3e2291c2@sal.lan>
	<20250620204459.4ae733d3@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 20 Jun 2025 20:44:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Fri, 20 Jun 2025 15:05:39 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Fri, 20 Jun 2025 20:14:57 +0900
> > Akira Yokosawa <akiyks@gmail.com> escreveu:
> > 
> > > Mauro!
> > > 
> > > On Fri, 20 Jun 2025 09:44:30 +0200, Mauro Carvalho Chehab wrote:  
> > > > Em Fri, 20 Jun 2025 11:22:48 +0900
> > > > Akira Yokosawa <akiyks@gmail.com> escreveu:
> > > >     
> > > [...]
> > >   
> > > > 
> > > > I didn't test it yet, but yesterday I wrote a script which allows us to test
> > > > for Sphinx version breakages on multiple versions in one go.
> > > > 
> > > > Using it (and again before this patch, but after my parser-yaml series), I 
> > > > noticed that 6.0.1 with "-jauto" with those packages:    
> > > 
> > > Why did you pick 6.0.1, which was in the middle of successive releases in
> > > early 6.x days.   
> > 
> > I added all major,minor,latest-patch version since 3.4.3 and added to
> > the script. I didn't check what of those are inside a distro or not.
> > 
> > > No distro Sphinx packagers have picked this version.  
> > 
> > The hole idea is to have a script where we can automate build tests
> > with old versions. Perhaps it makes a sense to add a flag at the table
> > indicating what major distros have what sphinx version and a command
> > line parameter to either test all or just the ones shipped on major
> > distros.
> > > 
> > > Just see the release history:
> > > 
> > > [2022-10-16]  5.3.0  ### stable ###
> > > [2022-12-29]  6.0.0
> > > [2023-01-05]  6.0.1
> > > [2023-01-05]  6.1.0  6.1.1 
> > > [2023-01-07]  6.1.2
> > > [2023-01-10]  6.1.3  ### stable ###
> > > [2023-04-23]  6.2.0
> > > 
> > > The crash you observed is hardly related to this fix.  
> > 
> > Almost certainly, the breakage with 6.0.1 is unrelated to this
> > change.
> 
> Heh, I'm not even sure that the problem is with 6.0.1 or with
> Fedora OOM killer setup...
> 
> Even with 64GB ram and 8GB swap(*), I'm getting lots of those:
> 
> jun 20 03:23:46 myhost kernel: [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rss_shmem pgtables_bytes swapents oom_score_adj name
> jun 20 03:23:46 myhost kernel: [   1762]   998  1762     4074      467       96      371         0    77824      144          -900 systemd-oomd
> jun 20 03:23:46 myhost kernel: oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=user.slice,mems_allowed=0,global_oom,task_memcg=/user.slice/user-1000.slice/user@1000.service/app.slice/app-org.kde.konsole-433443.scope,task=sphinx-build,pid=1043271,uid=1000
> jun 20 03:23:46 myhost kernel: Out of memory: Killed process 1043271 (sphinx-build) total-vm:4222280kB, anon-rss:3934380kB, file-rss:688kB, shmem-rss:0kB, UID:1000 pgtables:7812kB oom_score_adj:200
> jun 20 03:24:28 myhost kernel: sphinx-build invoked oom-killer: gfp_mask=0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0, oom_score_adj=200
> jun 20 03:24:28 myhost kernel:  oom_kill_process.cold+0xa/0xbe
> 
> Will do some extra texts here and try to adjust this.
> 
> (*) Granted, I need more swap... the FS was generated when 8GB
>     were good enough ;-)
>     Still 64GB RAM should be enough. Will try to change overcommit
>     and see how it goes.

Yeah, the problem with 6.0.1 was indeed with OOM killer. Once
I added more 64GB of swap, and wait for a long time, it finally
compleded the task without crashes:

	$ ./scripts/test_doc_build.py -m -V 6.0.1 -v
	...
	Finished doc build for Sphinx 6.0.1. Elapsed time: 00:31:02

	Summary:
        	Sphinx 6.0.1 elapsed time: 00:31:02

Looking at the past log I have handy, this is by far the worse one:

	Finished doc build for Sphinx 6.1.3. Elapsed time: 00:11:15
	Finished doc build for Sphinx 6.2.1. Elapsed time: 00:09:21
	Finished doc build for Sphinx 7.0.1. Elapsed time: 00:09:17
	Finished doc build for Sphinx 7.1.2. Elapsed time: 00:09:22
	Finished doc build for Sphinx 7.2.3. Elapsed time: 00:09:17
	Finished doc build for Sphinx 7.3.7. Elapsed time: 00:09:34
	Finished doc build for Sphinx 7.4.7. Elapsed time: 00:04:54
	Finished doc build for Sphinx 8.0.2. Elapsed time: 00:03:40
	Finished doc build for Sphinx 8.1.3. Elapsed time: 00:03:47
	Finished doc build for Sphinx 8.2.3. Elapsed time: 00:03:45

(3.4.3 was the previous "champion" with about 14 minutes)

All of them are using "-jauto" on a machine with 24 CPU threads.

The only one that didn't work with my past scenario was 6.0.1,
so OOM killer seems the one to blame: it is killing a sub-process,
but keeping the main one active, thus causing Sphinx to run for
a long time, only to notice at the end that something bad happened
and producing a completely bogus log. 

Heh, systemd-oomd, shame on you!

Thanks,
Mauro
