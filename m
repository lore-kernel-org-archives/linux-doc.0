Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35461A2398
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885542; cv=none; b=MNwHPxqzufp4UqdZh7Ly3tJ4sPtoCnWbTNKDuKHIqVWOmnrKMjTZZ7ZIDbAE2YI7naFyQ4ZPDn+vCJaq1CUSeapII1LWaWXJCWu8yBj9Op+2D8bxuGoa+4P8k1b7gflFBAyYwlofbY+A1p8U62AK84+hnhnXDIXqaAWUwuvwsvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885542; c=relaxed/simple;
	bh=zTxeMahJYiwb0SYGtH6kvqbgxLcJVzBs9lH8OOAW66U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXKc3UQ5zlVMc86BoZuuwSZeE8I4gs77z0tYXQa7dc+3ajS+36Vjl3xJVqIl8i0eBJJNKdglwwUIF8N4PhkTtE/nlzeDYEVf6nIS76Y8bs6smebzBrnvAjtnD/zXa9m0fH5wnYJDUbhzIezAtHHuApye0JVDWwTc73T2gqbZE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1g29csj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1g29csj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770ECC4CEF4;
	Fri, 26 Sep 2025 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758885542;
	bh=zTxeMahJYiwb0SYGtH6kvqbgxLcJVzBs9lH8OOAW66U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N1g29csj/zdY3tVhdZ8HXlB9CRx8X/cELJncWkuXIhCOo5+8Hn1TZsSSeDOcX5obO
	 AbVTxs0wl19rm8DniPCh6UdDWsOx9BqgLpzUJcjylTroKkxbDbyy1FfY3JMx+o+QXL
	 I6enyYZBsxzCsCDXOxmys4uk5WdLe+O2J9ga894JYpWZcfA9R+Wlx+emIKzlEhpj1A
	 4nZ3q8EuFoPmQ/TL7C6Ol0CT27Tyw6L4wb+TMEWUzVsN8nxWtuRB/yRKyipNdeLEoG
	 oH/k7NeYMtIRrwDFKmTJv+e3HVuT49eze7O4sOpZHBvow3nMH1GqPFpzrteGhHh/GQ
	 A3tCTAlMG/MJA==
Date: Fri, 26 Sep 2025 13:18:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: make mandocs questions
Message-ID: <20250926131858.24de6de1@foz.lan>
In-Reply-To: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
References: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 25 Sep 2025 11:37:24 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Mauro,
>=20
> I'm happy to see that you added mandocs as a docs build target.
>=20
> Would it make sense to place the man output files into various
> subdirectories? =20

I'm not sure if manpages supports reading man(9) pages from
different drectories, but see more below.

> On linux-next-20250925, I have 76402 files in
> the man/ subdirectory. One time 'ls' told me something like
> "command line argument list too long" but I can't reproduce that.

you probably did something like:

	$ ls Documentation/output/man/*.9
	bash: /usr/bin/ls: Argument list too long

> Is the output produced just by scanning the entire kernel
> directory structure? That may be too much subdirectory structure
> for the man output.

By default, yes. It runs:

	$ ./scripts/kernel-doc . --man

and then splits its output into one man file per man page.
=09
The behavior changes if you set SPHINXDIRS
You can specify just the directories you want with:

	$ make SPHINXDIRS=3D"core-api driver-api" mandocs
	$ tree -d Documentation/output/
	Documentation/output/
	=E2=94=9C=E2=94=80=E2=94=80 core-api
	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 man
	=E2=94=94=E2=94=80=E2=94=80 driver-api
	    =E2=94=94=E2=94=80=E2=94=80 man

	$ for i in Documentation/output/*; do echo -n "$i: "; ls $i/man|wc -l; done
	Documentation/output/core-api: 2464
	Documentation/output/driver-api: 6875

On such case, the algorithm changes: it will produce man pages
using only the files that are inside a .. kernel-doc markup from
Documentation, and using SPHINXDIRS normal behavior, each book
will be on its own directory, which is somewhat similar to what
you wanted.

Yet, notice that if you make SPHINXDIRS=3D<alldirs>, the output
will contain less man pages, as it won't include "orphaned"
descriptions(*).

(*) e.g. files with kernel-doc markups that aren't mentioned by any
    Documentation/* rest file.

> Or would it make sense to include the source file path in each
> man page?  E.g., if I am looking at fsl_asrc_sel_proc.9,
> include something like "[from sound/soc/fsl/fsl_asrc.c]"
> at the top or the bottom of the man page?

It shouldn't be hard to add it. See a quickhack patch example below.

> Can we get more meaningful output info for warnings like these?
>=20
> Warning: 385
> Warning: 389

I'm not getting those here on docs tree. will try later to check
with linux-next.

>=20
> I see 9 warnings like these.
>=20
> Thanks.


Thanks,
Mauro
