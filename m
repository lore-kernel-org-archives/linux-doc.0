Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04EC299927;
	Mon, 19 Jan 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817871; cv=none; b=VU6FguM0FCfENEenX+fXAykLPK7SKR+vd7YjRh8rfsisZADiTviub9Po3IPujRma/totSyQ6l7Yk0pNlOoLoKY1J4RCVooAWnaWE+pNafF/faHzmbMmK9jJsKOQZJ+uR/BNkFrx6K1gb3Kx8zpzfkiJ+dOLikzapFh3UrsHRjqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817871; c=relaxed/simple;
	bh=zo079K5if4X5Mj0iLO8+5F3Iv+c05FfF1dvi1ojRJIM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIyI+QbZJiTsTQk7qJPIkzM/J6B1SU9pKkZOine1I5i1lpggDJupNJ9FXdTTPUmU7IHyaYm4fJ8NC2xpcznmcs6z/ra9XQjSSeVFw4d7jXn0zC0eMZwJUZsqv3RG0C4KNoOvF6jbJzyUha2sKqFPaqKWb6OaPXnoAfLBld/jNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVR9hNtL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVR9hNtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B505C16AAE;
	Mon, 19 Jan 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768817870;
	bh=zo079K5if4X5Mj0iLO8+5F3Iv+c05FfF1dvi1ojRJIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eVR9hNtLL/fXr8xy8SPseVn7vOasXBOcPUy08JvjSXnt8ZfDbFl8VYXjJI7cHrKSh
	 NEfu8PWAgyYPSCthrh0ftrJqadVOygGOS2Wftcn9xz77BiWdB9M7dgpBZ3n4eWDgQ7
	 uoteSU+zQ41bwomJTOsC8GIbleppxbFz8GxeR0/oyOnmCbThqZn+IsQdoyx1g2spFM
	 j8Er5qLo9LV8w9o3+R7rAnuYISkwapT6veZDC3UAx1Pe1yMQhxMWg/au7Fv3rIzwSh
	 2ANTI+62+Pny+lJmyTDrHKtLEIK+VjedI3eZ0A+n2Qed23zrmfP1Mq8YjRa9FQZXVd
	 YvT6a9iQx3JSQ==
Date: Mon, 19 Jan 2026 11:17:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
Message-ID: <20260119111745.4694546b@foz.lan>
In-Reply-To: <1fd4145f-b9f2-471b-8203-679ecea0d214@infradead.org>
References: <20260114164146.532916-1-corbet@lwn.net>
	<813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
	<87zf6gt2ts.fsf@trenco.lwn.net>
	<20260114212558.1aeb1b17@foz.lan>
	<87wm1ho3cs.fsf@trenco.lwn.net>
	<20260117110049.6cc49048@foz.lan>
	<1fd4145f-b9f2-471b-8203-679ecea0d214@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 17 Jan 2026 10:09:56 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 1/17/26 2:00 AM, Mauro Carvalho Chehab wrote:
> > Em Fri, 16 Jan 2026 10:48:51 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >   
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >>  
> >>> Em Wed, 14 Jan 2026 12:24:31 -0700
> >>> Jonathan Corbet <corbet@lwn.net> escreveu:
> >>>    
> >>>> Randy Dunlap <rdunlap@infradead.org> writes:
> >>>>     
> >>>>> I do many of these on a regular basis:
> >>>>>
> >>>>> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
> >>>>>
> >>>>> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?      
> >>>>
> >>>> Yes.  The tool moves, but its functionality remains unchanged.    
> >>>
> >>> That's actually a good point: should we preserve a link on scripts
> >>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
> >>> that could break some machinery on several CI tools and scripts
> >>> out there. If so, it could be useful to keep a link - at least for
> >>> a couple of kernel releases.    
> >>
> >> So is the location of kernel-doc part of our ABI, or an internal detail?
> >> :)  
> > 
> > Surely it is not part of ABI: it can be changed whenever we want.
> > 
> > From my side, I don't mind where it is located: it will take some
> > time, but my fingers will end learning its new location/name ;-)
> >   
> >> I'm not deeply opposed to maintaining the symlink, though I'd rather
> >> not.  It won't be for "a couple of releases", though; if the symlink is
> >> there, nothing will ever change.  
> > 
> > I see two reasons why having a symlink:
> > 
> > 1. to avoid the risk of eventually breaking someone's CI or scripts.
> >    This is just a preventive measure, as I'm not aware of anyone
> >    with such scripts;  
> 
> I have some such scripts. And it's easy to update them, but I'd like for them
> to be compatible both going forward and backward in kernel versions -- without
> having to do something like:
> 
> 	if [ -x scripts/kernel-doc ]; then
> 		foo
> 	elif [ -x tools/docs/kernel-doc ]; then
> 		baz
> 	else { help; }
> 
> I doubt that I am unique/alone in this.
> 
> > 2. as you don't want ".py" extension on execs, but PEP8 mandates it, 
> >    together with replacing "-" with "_", you can have a symlink that
> >    would make both PEP8 and you happy ;-)

Just to be clear, when I'm talking about PEP8, I'm actually referring
to the language support for import a python code with "import" and "from". 

The rationale is that some day we may end needing using autodoc(*), or
some other Sphinx extension that would require it, like argparse ones:

	https://sphinxcontrib-autoprogram.readthedocs.io/en/stable/
	https://pypi.org/project/sphinxcontrib-autoprogram/

This would avoid the need of documenting some things twice: at the
code and at the documentation itself.

(*) Right now, we don't have any strong reasons to use autodoc on
    kernel-doc exec: the only possible reason on kernel-doc would be
    to avoid documenting return codes twice, but we could do it also
    via argparse, with something like:

	RETURN_CODE=deident("""
	    The return value is:

	    - 0: success or Python version is not compatible with
	      kernel-doc.  If -Werror is not used, it will also
	      return 0 if there are issues at kernel-doc markups;

	    - 1: an abnormal condition happened;

	    - 2: argparse issued an error;

	    - 3: if -Werror is used, and one or more unfiltered parse
		warnings happened.
	""")

	argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                description=DESC, epilog=RETURN_CODE)

    Eventually, it could be useful to use an argparse extension in
    the future, if we want to add the help output inside the
    auto-generated docs.

    Anyway, after having this series merged and mine fixing
    the issues with -Werror, I intend to send you a separate patch
    series with something like the above and moving MsgFormatter
    to a separate module.
	
Thanks,
Mauro
