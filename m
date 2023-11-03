Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8E2D604
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QwYJFGNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071A1C433C8;
	Fri,  3 Nov 2023 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699001397;
	bh=Ofczzi1jOkw0vNrrSnkW9v3BzVIAL4bIxgVuUOXMTqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwYJFGNqvz8Axixfu9jsq3mxC60EdJcXHwusEqN9sP2JpS+9xqL+Zng3IWiDJOkMK
	 UUC2BbOiQ/9G9cAd77y6lD5y1ddMOlGWIQjsj3pNLyj1uEDdf0G+MO1pnZ/0INaeF8
	 Ln2goZa+7rxe6xigUGWpluhfvPmkmNMYRwqgsGBw=
Date: Fri, 3 Nov 2023 09:49:54 +0100
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
Message-ID: <2023110317-unhealthy-playable-d5d6@gregkh>
References: <20231102120053.30630-1-bagasdotme@gmail.com>
 <20231102120053.30630-2-bagasdotme@gmail.com>
 <2023110222-renewed-monologue-008e@gregkh>
 <ZUSrOKDuvcSL6gOH@debian.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUSrOKDuvcSL6gOH@debian.me>

On Fri, Nov 03, 2023 at 03:11:36PM +0700, Bagas Sanjaya wrote:
> On Thu, Nov 02, 2023 at 03:06:19PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Nov 02, 2023 at 07:00:43PM +0700, Bagas Sanjaya wrote:
> > > Add the license text along with appropriate tags for reference and
> > > tooling. The text is taken from the text as distributed in Google
> > > Fonts's zip files.
> > > 
> > > As the license itself may or may note be compatible with GPLv2,
> > > let's take on the err side and require combining it with
> > > GPL-compatible licenses when using the license.
> > > 
> > > Cc: linux-spdx@vger.kernel.org
> > > Cc: Richard Fontana <rfontana@redhat.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > ---
> > >  LICENSES/dual/OFL-1.1 | 107 ++++++++++++++++++++++++++++++++++++++++++
> > 
> > You add this license, but then never actually reference it in the later
> > changes, so it's going to be very confusing as to why it is here.  Any
> > way to add it to the font files themselves so our checker tools can
> > handle this properly?
> 
> There is TTF name string ID called "License". For example, on IBM Plex Sans,
> the string value is:
> 
> ```
> This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: http://scripts.sil.org/OFL
> ```
> 
> Checking that string requires scripting fontforge, and since the string value
> may differ (but has the same license) across different fonts, scripting it
> can be non-trivial.

And is that in the files you added?  They are binary so it's hard to
determine this :(

> > 
> > And, it's not going to work as a dual-license, you can't just suddenly
> > dual-license those font files, right?
> 
> I was thinking of putting OFL in LICENSES/exceptions instead due to this
> nature.

Yes, it can not be a dual one.

> > >  1 file changed, 107 insertions(+)
> > >  create mode 100644 LICENSES/dual/OFL-1.1
> > > 
> > > diff --git a/LICENSES/dual/OFL-1.1 b/LICENSES/dual/OFL-1.1
> > > new file mode 100644
> > > index 00000000000000..00b8db08bd0e54
> > > --- /dev/null
> > > +++ b/LICENSES/dual/OFL-1.1
> > > @@ -0,0 +1,107 @@
> > > +Valid-License-Identifier: OFL-1.1
> > > +SPDX-URL: https://spdx.org/licenses/OFL-1.1
> > > +Usage-Guide:
> > > +  Do NOT use this license for code, but it's acceptable for fonts (where the
> > > +  license is specifically written for them). It's best to use it together
> > > +  with a GPL2 compatible license using "OR", as OFL-1.1 texts processed by
> > > +  the kernel's build system might combine it with content taken from more
> > > +  restrictive licenses.
> > > +  To use the SIL Open Font License 1.1, put the following SPDX tag/value pair
> > > +  into a comment according to the placement guidelines in the licensing rules
> > > +  documentation:
> > > +    SPDX-License-Identifier: OFL-1.1
> > 
> > Where did this Usage-Guide from?
> 
> Adapted from LICENSES/dual/CC-BY-4.0.

Which it shouldn't be :(

Anyway, this is independent of the issue if we actually should take
these fonts into the kernel tree, and mandate their use (my opinion is
no, that's not for us to use, and especially for any action that might
cause a web browser to look elsewhere outside of our documentation.)

Also, for documentation, I'm pretty sure that serif fonts is proven to
be "nicer" overall by many studies.

thanks,

greg k-h
