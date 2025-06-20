Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADAA2E717B
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445104; cv=none; b=lSwevMy71QyR18+37hCN59Uy4PXCVroIEUsUG7HbOHKBzpbTeuL4tQLKVPpI6jNynnbEg61wL2hVbdFhS54y5m+l7FZHJtrhszWv51FK2dxmAw+ftZr+zLT3L78zTesusvqg3UJW9iaVEKL2ZBbGKYH0vv0CKFgg/N7Apma+bXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445104; c=relaxed/simple;
	bh=9P/2ckcF2CBJZjsfwZarOJDLFkdTGXtVcwnMfUaJ40c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TanL5Td5xqlsqM9Keo08QblMDzEcQma5T7SNZ8VBmREwIVqknwRMQwxZ8qBYF/t6SZ0xPdXwtdzCjhY0El/9OfkoNj2d0dWYYhCWNrgk+MYLAGHAQRhf+7KKfrIa32QY6ngaVloonq5Pw3st87Hr3XT0deq5kCO9l6dc/LtVmpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACj3hn0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACj3hn0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C4AC4CEED;
	Fri, 20 Jun 2025 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750445103;
	bh=9P/2ckcF2CBJZjsfwZarOJDLFkdTGXtVcwnMfUaJ40c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ACj3hn0s2zpgy4qr1reUwrEQQl7GjW8leMCUXwSIUnopxz/sv1ukptGUysNivf9do
	 2nONbJ6bur7hhXBfo7IC36E/+ghthkR2J9Td0hDajutx2AowO7hqQK9wiYcT9Y6l+6
	 bO+ooMTxuypRAB0Ry5lwsltxhDsvMp1/ZkzyVvB29Nbzp4hhTGLvQJ2InW5OB82i7m
	 TKrlS+3RQVaCHA+19pqG4OMCOFeGOwvFhUJxgurhROAb2shDh0zegLHoSXeeQQiCDZ
	 MY01pcIRRr3fek1hpPLMwA4VV3Z+E4qrLLeq1jr4T9x4kielb1N3MaMrGOSC0rECfZ
	 4bU+sjbBuW1cQ==
Date: Fri, 20 Jun 2025 20:44:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
Message-ID: <20250620204459.4ae733d3@foz.lan>
In-Reply-To: <20250620150406.3e2291c2@sal.lan>
References: <87wm97fmn3.fsf@trenco.lwn.net>
	<03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
	<20250620094430.212779e5@foz.lan>
	<528f0354-1869-4cfe-b71d-fe169b2bfc76@gmail.com>
	<20250620150406.3e2291c2@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 20 Jun 2025 15:05:39 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Fri, 20 Jun 2025 20:14:57 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
> > Mauro!
> > 
> > On Fri, 20 Jun 2025 09:44:30 +0200, Mauro Carvalho Chehab wrote:  
> > > Em Fri, 20 Jun 2025 11:22:48 +0900
> > > Akira Yokosawa <akiyks@gmail.com> escreveu:
> > >     
> > [...]
> >   
> > > 
> > > I didn't test it yet, but yesterday I wrote a script which allows us to test
> > > for Sphinx version breakages on multiple versions in one go.
> > > 
> > > Using it (and again before this patch, but after my parser-yaml series), I 
> > > noticed that 6.0.1 with "-jauto" with those packages:    
> > 
> > Why did you pick 6.0.1, which was in the middle of successive releases in
> > early 6.x days.   
> 
> I added all major,minor,latest-patch version since 3.4.3 and added to
> the script. I didn't check what of those are inside a distro or not.
> 
> > No distro Sphinx packagers have picked this version.  
> 
> The hole idea is to have a script where we can automate build tests
> with old versions. Perhaps it makes a sense to add a flag at the table
> indicating what major distros have what sphinx version and a command
> line parameter to either test all or just the ones shipped on major
> distros.
> > 
> > Just see the release history:
> > 
> > [2022-10-16]  5.3.0  ### stable ###
> > [2022-12-29]  6.0.0
> > [2023-01-05]  6.0.1
> > [2023-01-05]  6.1.0  6.1.1 
> > [2023-01-07]  6.1.2
> > [2023-01-10]  6.1.3  ### stable ###
> > [2023-04-23]  6.2.0
> > 
> > The crash you observed is hardly related to this fix.  
> 
> Almost certainly, the breakage with 6.0.1 is unrelated to this
> change.

Heh, I'm not even sure that the problem is with 6.0.1 or with
Fedora OOM killer setup...

Even with 64GB ram and 8GB swap(*), I'm getting lots of those:

jun 20 03:23:46 myhost kernel: [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rss_shmem pgtables_bytes swapents oom_score_adj name
jun 20 03:23:46 myhost kernel: [   1762]   998  1762     4074      467       96      371         0    77824      144          -900 systemd-oomd
jun 20 03:23:46 myhost kernel: oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=user.slice,mems_allowed=0,global_oom,task_memcg=/user.slice/user-1000.slice/user@1000.service/app.slice/app-org.kde.konsole-433443.scope,task=sphinx-build,pid=1043271,uid=1000
jun 20 03:23:46 myhost kernel: Out of memory: Killed process 1043271 (sphinx-build) total-vm:4222280kB, anon-rss:3934380kB, file-rss:688kB, shmem-rss:0kB, UID:1000 pgtables:7812kB oom_score_adj:200
jun 20 03:24:28 myhost kernel: sphinx-build invoked oom-killer: gfp_mask=0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0, oom_score_adj=200
jun 20 03:24:28 myhost kernel:  oom_kill_process.cold+0xa/0xbe

Will do some extra texts here and try to adjust this.

(*) Granted, I need more swap... the FS was generated when 8GB
    were good enough ;-)
    Still 64GB RAM should be enough. Will try to change overcommit
    and see how it goes.

Thanks,
Mauro
