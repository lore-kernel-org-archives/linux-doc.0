Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668C11709
	for <linux-doc@vger.kernel.org>; Sat,  4 Nov 2023 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PYaopbC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02272C433C8;
	Sat,  4 Nov 2023 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699091529;
	bh=8COzUm5abIRtA3WEuZEqBqc5ZHnRoZ8wIZOh1TTWgDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYaopbC0R0OGZ+0BmIKFy/B+BLUH3wvIlQnPKU13DJyXpPAKT7Sgi3QJ8K7iuohWq
	 fL3vXGwq3izWilZYznlCf0QJY1RshipxRdNwxVk22vMri8bJaaQ98trkV31v4vfvBA
	 munjei52lRY5M76ohYRB3HhKa7qP9jhMCbovbtZo=
Date: Sat, 4 Nov 2023 10:52:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>, linux-spdx@vger.kernel.org,
	Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH RFC 1/4] LICENSES: Add SIL Open Font License 1.1
Message-ID: <2023110450-overview-charbroil-5101@gregkh>
References: <20231102120053.30630-1-bagasdotme@gmail.com>
 <20231102120053.30630-2-bagasdotme@gmail.com>
 <2023110222-renewed-monologue-008e@gregkh>
 <ZUSrOKDuvcSL6gOH@debian.me>
 <2023110317-unhealthy-playable-d5d6@gregkh>
 <ZUWV88wRf9suUQfH@debian.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUWV88wRf9suUQfH@debian.me>

On Sat, Nov 04, 2023 at 07:53:07AM +0700, Bagas Sanjaya wrote:
> On Fri, Nov 03, 2023 at 09:49:54AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Nov 03, 2023 at 03:11:36PM +0700, Bagas Sanjaya wrote:
> > > On Thu, Nov 02, 2023 at 03:06:19PM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Nov 02, 2023 at 07:00:43PM +0700, Bagas Sanjaya wrote:
> > > > >  LICENSES/dual/OFL-1.1 | 107 ++++++++++++++++++++++++++++++++++++++++++
> > > > 
> > > > You add this license, but then never actually reference it in the later
> > > > changes, so it's going to be very confusing as to why it is here.  Any
> > > > way to add it to the font files themselves so our checker tools can
> > > > handle this properly?
> > > 
> > > There is TTF name string ID called "License". For example, on IBM Plex Sans,
> > > the string value is:
> > > 
> > > ```
> > > This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: http://scripts.sil.org/OFL
> > > ```
> > > 
> > > Checking that string requires scripting fontforge, and since the string value
> > > may differ (but has the same license) across different fonts, scripting it
> > > can be non-trivial.
> > 
> > And is that in the files you added?  They are binary so it's hard to
> > determine this :(
> 
> Yes.
> 
> > 
> > > > 
> > > > And, it's not going to work as a dual-license, you can't just suddenly
> > > > dual-license those font files, right?
> > > 
> > > I was thinking of putting OFL in LICENSES/exceptions instead due to this
> > > nature.
> > 
> > Yes, it can not be a dual one.
> 
> That's right!
> 
> What about just saying below in the CSS file that includes the fonts?
> 
> ```
> ...
> /* Some cool fonts are licensed under OFL 1.1, see
>  * LICENSES/exceptions/OFL-1.1 for more information. */
> ...
> ```

That's not in SPDX format :)

Anyway, I think the meta-comment so far is "do we want to include fonts
in the kernel source", right?  For that, I would argue "no, let's not
deal with that mess for now".

thanks,

greg k-h
