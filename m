Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54871B85FD
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 23:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762643311; cv=none; b=mFNBUT0A4O26PZN5tLMO5JLn+o5P+ikzV8uMw4gAyPsl6lfpH3fEix1AedyXAhZKn9VCzLlk2HlLWZVv16MQZTcsRaXb8OSBWaClJzN7KJT4ctGobl4lGhpuUm//Ee6RkVu1Eazc6IGsGJrrT3ZgT2IJN3Y3nFsNo9wPPYHzna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762643311; c=relaxed/simple;
	bh=JgskukYaral/UB7qfK8GK9QzEEjCFnzx+NeLe2KBkb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQhmh7B6hUYC2+PbghskhDZDy8wSHL5IdhOxUuZkV5keulx7PH0FX+NnjoXrvSprlNOUo9f5ejw6rTriHcOsrWbHjEnlvnumqH/REYY73M2JhPi6P1zpXQopQJcD5LkHmvjWMR7axBmnbVZAJ/tGsjhTvmldRLgu7PAa2hCkm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAa9f0mY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAa9f0mY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A649C113D0;
	Sat,  8 Nov 2025 23:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762643310;
	bh=JgskukYaral/UB7qfK8GK9QzEEjCFnzx+NeLe2KBkb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gAa9f0mY951VVtpVOwntCb7hYWGRzkeRybrHmJF5CQAxwO6QVnNM0RZaRdWolYuoH
	 WRdXmzqH18vfgy5/C4fbGs3HmSWaD4vxYPvS+d6a55t7wX1m8JdXTZDT8xBzvrPXQU
	 ZVm5jilwEU1LBiLFNYGAZOYeP28JDX/0FtUNzT4no9vxR+4lJe/5UlS9BFJzIZEfUf
	 4ag5StMvkYhuGlpTLcVS4xDS8B1+s8Ez9iD7H+OVelhDDx/fukCBqmCNciXIEVRut6
	 ijpxW/SKr02SKOSNE+CRgNHvovvnLUet0fp2HpNqokEymvWa0Wc8IaHLQ5bBkaAjW4
	 oN6WnFXnuLTOw==
Date: Sun, 9 Nov 2025 00:08:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: make mandocs: subdirectories scanned
Message-ID: <20251109000825.0bb65270@foz.lan>
In-Reply-To: <80701524-09fd-4d68-8715-331f47c969f2@infradead.org>
References: <80701524-09fd-4d68-8715-331f47c969f2@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 8 Nov 2025 14:50:35 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi,
> 
> I just hit a problem that I haven't encountered in the past.
> 
> I always use O=subdir to build test kernels, where subdir is
> at the top level of the kernel source tree.
> (I just found this maybe because I haven't been doing a lot of
> kernel builds lately.)
> 
> This causes 'make mandocs' to recurse continuously because
> subdir/source is a symbolic link to ".." (top level of kernel
> tree) and kernel-doc finds all of the (same) source files again
> there.
> 
> I first discovered this with a subdir named ARM, for arch/arm/
> builds. I tried renaming it .ARM but same result. Then I tried
> a subdir name of "snap" because it is in the .gitignore file.
> 
> All of these have the same result. Here is an example of the
> output:
> 
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rstat' not described in 'gfar_priv_grp'
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_tx_queues' not described in 'gfar_priv_grp'
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'tx_bit_map' not described in 'gfar_priv_grp'
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_rx_queues' not described in 'gfar_priv_grp'
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rx_bit_map' not described in 'gfar_priv_grp'
> Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/fec_mpc52xx.c:698 function parameter 'may_sleep' not described in 'mpc52xx_fec_stop'
> 
> Would it be reasonable to have kernel-doc not follow symbolic links?
> 
> Any other suggestions (other than not using local [in the kernel source tree]
> build subdirectories)?
> 
> thanks.

The logic which parses the directory structure is at
scripts/lib/kdoc/kdoc_files.py:

    def _parse_dir(self, dirname):
        """Internal function to parse files recursively"""

        with os.scandir(dirname) as obj:
            for entry in obj:
                name = os.path.join(dirname, entry.name)

                if entry.is_dir():
                    yield from self._parse_dir(name)

                if not entry.is_file():
                    continue

                basename = os.path.basename(name)

                if not basename.endswith(self.extensions):
                    continue

                yield name

The recursive logic is at:

                if entry.is_dir():
                    yield from self._parse_dir(name)

It should be easy to change the above to check for symlinks with either:

+	if entry.is_symlink():
+	    continue
+
        if entry.is_dir():
            yield from self._parse_dir(name)

(this would ignore symlinks on files - not sure if this is the best
strategy)

or:

                if entry.is_dir():
+		    if entry.is_symlink():
+		        continue
+
                    yield from self._parse_dir(name)

Alternatively, you can, instead, do:

-               if entry.is_dir():
+               if entry.is_dir(follow_symlinks=False):
                    yield from self._parse_dir(name)

which should prevent it to follow symlinks.

I would try the last one first.

It is likely easier if you write such patch, as you have already a setup
where you can test it.


Thanks,
Mauro
