Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138E2F3C3E;
	Wed, 15 Jul 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123571; cv=none; b=tgVVyO0b3px8sGbkuMCDWd3i2+mJz6bRwWS4Hk/9XyKD4Dk0SGwKLUGyf1gUITqR4AQU702QXQKXOL/QFzwTNYGJmRudtx46KS2/3zkh+yyH7fnIJa9hSeeKNooKzflEJvLwkr3AsyYxFrKbhejxfGe/YbQLw4ryeMk1VWtiT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123571; c=relaxed/simple;
	bh=74n7GiSJCJZQs4aoEQ0cDAKgID8+/e91/lHjjyF/VBA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2pjL3M/WLDY/kxMTcTpGner1qVZfkPENKli/FF9JtL1swa71FhNwtP/4becrDekguuVUix05yEQfYtjWy+ZsZZ31qGK8ie6OdNSkitPL2honpN0rHxAaHMz4ST+CMsFcdjatscx7jtfz6CYtvNnx7KQx5bMT/eyRGu1sil9M9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/fYhfVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/fYhfVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C571F000E9;
	Wed, 15 Jul 2026 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123569;
	bh=n17UUGVt6x+NY1Wkr3wtIH6doqyvvkAqo6qNMZ0vXSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D/fYhfVs3T3lkjHBilQuN7aTQ5UVXwvrjd57UrNrfeixq5MA6PcsNtxTK1SZc0hL3
	 QLHD7TOMckPMsZH5mMw8l2E8in4outPiuYkriuDHSvRbhtHozcjbUX5M4UKP/4qCYq
	 d2oUxR8mbadxOPgpZ/S7QauQZvIqkAASDGDNp+hPQJJzy59ifVRvH3yNxSkBcGeY4j
	 +WvRRi0iOkmqiEhYb3tlIW8MYhFHfgilvXUwAnKskrR5IvXPI/yvCgP5Nt1quTTSjs
	 9MuphY6GD1eOzXQLwlR/Op7rxdlj20q+Xs50n8itj2C44Mg0qDT/CPwwrQBvgzpL5J
	 3Grq5aaaV1oKg==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wk02Z-00000007LeO-3j5f;
	Wed, 15 Jul 2026 15:52:47 +0200
Date: Wed, 15 Jul 2026 15:52:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "rdunlap@infradead.org"
 <rdunlap@infradead.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] scripts/kernel-doc: Suggest possible names for
 excess descriptions
Message-ID: <20260715155247.3b9fb363@localhost>
In-Reply-To: <80ccd6405e31b1200a391b2755780b7676597c74.camel@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
	<20260715111726.394565-1-ryszard.knop@intel.com>
	<20260715144243.60686000@localhost>
	<80ccd6405e31b1200a391b2755780b7676597c74.camel@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 13:21:27 +0000
"Knop, Ryszard" <ryszard.knop@intel.com> wrote:

> On Wed, 2026-07-15 at 14:42 +0200, Mauro Carvalho Chehab wrote:
> > On Wed, 15 Jul 2026 13:17:26 +0200
> > Ryszard Knop <ryszard.knop@intel.com> wrote:
> >   
> > > Since check_sections() now warns if a documentation tag member name is
> > > the same as defined in the struct, we can suggest names the checker
> > > knows, so that it's more obvious how to deal with the warning.
> > > 
> > > v2 (rdunlap):
> > > - Strip whitespace from warnings, nicer when the hint is empty
> > > 
> > > Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> > > ---
> > >  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> > > index 2dedda215c22..a22c3e3182f0 100644
> > > --- a/tools/lib/python/kdoc/kdoc_parser.py
> > > +++ b/tools/lib/python/kdoc/kdoc_parser.py
> > > @@ -558,6 +558,13 @@ class KernelDoc:
> > >                          self.push_parameter(ln, decl_type, param, dtype,
> > >                                              arg, declaration_name)
> > >  
> > > +    def get_suggestions_hint(self, decl_name, possible_names):
> > > +        suggestions = set(name for name in possible_names if decl_name in name)
> > > +        if not suggestions:
> > > +            return ""
> > > +
> > > +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> > > +  
> > 
> > There is a better way to propose suggestions. See:
> > 	Documentation/sphinx/kernel_include.py
> > 
> > E.g. use something like:
> > 
> > 	from difflib import get_close_matches
> > 
> > 	matches = get_close_matches(decl_name, possible_names)
> > 
> > See: https://docs.python.org/3/library/difflib.html#difflib.get_close_matches
> > 
> > If the problem is due to a typo, this will likely return the
> > right name.  
> 
> The checks here specifically were added to deal with situations like
> [1] which boils down to:
> 
> struct {
>     /** @flags: good description */
>     int flags;
> 
>     /** @substruct: also good */
>     struct {
>         /** @mode: bad, wrong, no good */
>         int mode;
>     } substruct;
> } big_block_o_data;
> 
> The docs should say "@substruct.mode" instead of just "@mode", so this
> is distant enough from the actual input that difflib would not suggest
> it. 

Ok, but there should be cases like, instead of "mode", someone writes
for instance "modes".

> I could merge suggestions from both difflib and the plain substring
> comparison if you'd like me to?

Makes sense to me. Just ensure that they aren't duplicated.

> 
> [1] https://patchwork.freedesktop.org/patch/734307/?series=168905&rev=1
> 
> > 
> > Regards,
> > Mauro  
> 
> Thanks, Ryszard


-- 
Thanks,
Mauro
