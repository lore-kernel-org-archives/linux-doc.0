Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3D40DFA4;
	Sat, 28 Mar 2026 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656600; cv=none; b=rTln5B8fpTnEvN1upzGm0Lv143GCcPk9GpyYsUaYdVWblsYpNB3186OZixx3/UTsONBpZfoLE/s/zdkRqCj7ahXnYs1648qcj07C1MQGAYIRP18lmUipn/1nve4ZP10t8bPckz6xp8CnQWhyPc2uKBeMCpxJLM402jvXysqzArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656600; c=relaxed/simple;
	bh=sZWr6QBzpVOyfkdJcct8t7t9BZnw1T0oxays9/d+gCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqZBXY3kFig2Wn3UReCPlb0N9ftqETMYWMpRFSENzT0X6ZxyYBvJJNKWrr4wzRo5Gi02B44W2ZRgTsz/SMhKaKnMOYn8API2DO/nvZWD9MlYLZN0AgvALZ3Z2pTmiWYFsLReHAKfLlayBN4zQLq57yqUbEjg85aoS39gVe12hNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH36LBEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH36LBEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFE7C19423;
	Sat, 28 Mar 2026 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774656600;
	bh=sZWr6QBzpVOyfkdJcct8t7t9BZnw1T0oxays9/d+gCk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dH36LBEzdqn3fdTb1fzSyo5zPX8QYu2oxCiJSgD/W8fMJtshmQlytiHe4xtQztQlh
	 gv0jMdxvVeK+ixP+dEys/mC9ktEeXc0O6zFXwddNUkhHGqk39c5umE7m7Od7wg2AQ4
	 7uWJy1asFg4m0lVmKx1g7R+user8jwbWzsfMqySKi2xFYZEEoU7UlRLSWLJmzoErru
	 u5r3nU+/5PwuGyPsCjrVDRg8Lslqdk9AjousNBCWe81Z5GwN5/xdUP3MhasAcu8Sfu
	 7BXiTwRVULomvT9GxD34wY6zfgJSWomqdF6Bg0xKMzXX8B2SRPrmvs9LBAfNEaG5xe
	 VkQd4l/D8+76g==
Date: Sat, 28 Mar 2026 01:09:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Shuah
 Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] doc tools: better handle KBUILD_VERBOSE
Message-ID: <20260328010955.19a90582@foz.lan>
In-Reply-To: <540ceb4a-fd54-4e95-9431-8f233252259c@intel.com>
References: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
	<540ceb4a-fd54-4e95-9431-8f233252259c@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 11:35:39 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> On 3/26/2026 10:57 PM, Mauro Carvalho Chehab wrote:
> > As reported by Jacob, there are troubles when KBUILD_VERBOSE is
> > set at the environment.
> > 
> > Fix it on both kernel-doc and sphinx-build-wrapper.
> > 
> > Reported-by: Jacob Keller <jacob.e.keller@intel.com>
> > Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---  
> 
> I loaded this on my system and tested the build works as expected both
> with V=0 and when I export KBUILD_VERBOSE manually.
> 
> Thanks for fixing this quickly!
> 
> Tested-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> >  tools/docs/sphinx-build-wrapper     | 7 ++++++-
> >  tools/lib/python/kdoc/kdoc_files.py | 7 ++++++-
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> > index 2c63d28f639d..1bb962202784 100755
> > --- a/tools/docs/sphinx-build-wrapper
> > +++ b/tools/docs/sphinx-build-wrapper
> > @@ -238,7 +238,12 @@ class SphinxBuilder:
> >              self.latexopts = os.environ.get("LATEXOPTS", "")
> >  
> >          if not verbose:
> > -            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
> > +            try:
> > +                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
> > +            except ValueError:
> > +                # Handles an eventual case where verbosity is not a number
> > +                # like KBUILD_VERBOSE=""  
> 
> Strictly speaking I think os.environ.get() will handle the case of an
> empty KBUILD_VERBOSE by converting to the default value (in this case 0).

It won't. See:

	$ FOO="" python3
	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
	Type "help", "copyright", "credits" or "license" for more information.
	>>> import os
	>>> os.environ.get("FOO", 0)
	''

	$ FOO="0" python3 
	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
	Type "help", "copyright", "credits" or "license" for more information.
	>>> import os
	>>> os.environ.get("FOO", 0)
	... 
	'0'

	$ unset FOO; python3 
	Python 3.14.3 (main, Feb  4 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] on linux
	Type "help", "copyright", "credits" or "license" for more information.
	>>> import os
	>>> os.environ.get("FOO", 0)
	... 
	0

it will only get an integer 0 if the env var (at the above example, FOO)
is not on env.

That's basically why we need to first convert it to integer than to
bool.

> The intent of the comment and code is pretty clear though, so I don't
> know that deserves a re-roll.

I opted to add a comment there because having two conversions,
first to int then to bool is not that obvious ;-)

Thanks,
Mauro
