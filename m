Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A514D6F5
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714075393; cv=none; b=MYLtaPuAopxZRLZbOobDJTaiOCrWLwJDzN+Dftx0Vf+0VT89h2Z1O5EC7W/Waty/gr+Pcwi5YNN46PMAXFoOuTYluBa7UEREvYTrcwvWbINqS219dFpnV0zQoLI9ay61OjQgPm2NJl4258h6Xm/INUahZKWBA+R7WUddEaGU8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714075393; c=relaxed/simple;
	bh=WXioVrdtqdg/+f7YVujTUAKyHs8jas6ZFL6qXIXYYN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMLVYOnvFtAS6EfQoig2Ua4Hcg5KpvHHLGFZwkdjBBUnbBwJw+02VncZHtkrgcUJGfhkScG1yFapAerJ3eDl0JeRciWxcpkwzXS/Mu2w7G4G8D92+aMPqNZzzRZotD21oWPhf2ffPHeYNZ3fzX7IygiCvI4PxkU5qA8qE4t/qYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=eJFLEzEf; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="eJFLEzEf"
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43PK2dnR005391
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 16:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1714075362; bh=Bamg4HkyQPSYLLg77yTDxKCM/KPuzg9eu2jBw6RdVcs=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=eJFLEzEf1SyXcvEiSayjxa9Hx02TtusRy2q5hXuWSQ7StYHMiOO82WgV5KJ7rRLF2
	 NM+izZeevaTc/i7NzhNHbXngrJ848lG+SMfY4nxfOQMdeuBJVKrkqaS1XMsk6RC1zK
	 DHbXfZs3DpNChxW283xJcU/8oNacLe+UImu2JHjb27LPO7+D6DAJ+YWdNH6o7QtML1
	 nRQB9rZfyrU0t0sobd9Ppeoxf+0yRz5L54AqS8rAU1AcC10P+zrFeIJGOGh9l9tEDr
	 ZPMU26HPT1Mc8NMBPVlFVRPTEiXYoIg0lD66djSqgjoduFhsNTB4mUhi1XMT7E6YQk
	 tUl8LPQRL3P1w==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 9B47E15C0CBA; Thu, 25 Apr 2024 16:02:39 -0400 (EDT)
Date: Thu, 25 Apr 2024 16:02:39 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Bilbao, Carlos" <carlos.bilbao@amd.com>
Cc: Josh Marshall <joshua.r.marshall.1991@gmail.com>, ngn <ngn@ngn.tf>,
        linux-newbie@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com,
        "bilbao@vt.edu" <bilbao@vt.edu>
Subject: Re: Feedback on my development setup
Message-ID: <20240425200239.GB3749403@mit.edu>
References: <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw>
 <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>

On Tue, Apr 23, 2024 at 11:39:59AM -0500, Bilbao, Carlos wrote:
> 
> If I may offer a suggestion, focusing on documenting the challenges you've
> encountered with KVM, etc., could be more valuable that trying to cover
> everything.

Many people have their own scripts for building and testing kernels.
Very often those scripts tend to be specialized for a particular use
case, or development workflow, and trying to enshrine it as _the_ way
to develop kernels may not all that helpful.

For example, my preferred workflow, and the one which I recommend to
people who want to contribute to my file system, will build kernels
which can then be used to run tests using either kvm/qemu, Google
Compute Engine, or on Android devices.  It's also a bit more turn-key
that the instructions that you've given which is both a plus and a
minus.  On the plus side, it means much easier to get started, and
they don't have to cut and paste expect scripts, and manually edit
kernel config files.  On the minus side, because a lot of the steps
are automated, people don't have as much of an opportunity to learn
about what various kernel config options mean.

If you're interested, documentation for my scripts can be found here:

https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-xfstests.md
https://thunk.org/gce-xfstests

The short version is after you've downloaded the git tree, installed
the binaries via "make install", and installed some package
dependencies, setting up a kernel config which is suitable for KVM, a
GCE VM, or Android, is done via:

	install-kconfig

Then building a kernel is done via:

	kbuild

And then running said kernel under KVM is done via:

	kvm-xfstests shell

Or if you want to run a file system smoke test:

	kvm-xfstests smoke

It was designed so that even graduate students who have no interest in
kernel development other than getting their FAST academic paper
published, can use it to test their research file systems, hopefully
helping them to understand the gulf that can sometimes exist between
research prototypes and production file systems.  :-)

	       	      	      	    - Ted
