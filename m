Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAD315D27;
	Tue,  2 Dec 2025 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684382; cv=none; b=ux/xIt477yR8Jcym8jgBT3wx3RSVVX8H5TnkINoAIh3vnJuEnRjDO4Pman5AsOAgyKnXS6xKBCxnCag6mR1tdcR9FFqR2eKRV0M5v3r+MxuUESb3iktCXoxxgNv5B0NtKBAJirOTQGBzsKRSFy0UXsCyf+6Crnr3/swv1F3saZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684382; c=relaxed/simple;
	bh=G2feBLO7BWhizlnQ94253t8gNKnIjAErMQCzfMKOX3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNgmlZExkbLUAYTTPinwAyZdDR99yU9HmgaXtd00RYacEcmmrjl6zPCFXxQAoc3UUR11SQj2xClP5CqFGmTXwwrimjt1iUGamvaO+BM6vxQ5tq10xAlnl7HxLEaNjm+icPDwaVWvnVdn2xByoQujkxwmpnmjRXlVwT4IuHMTgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVR2sqhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVR2sqhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F67C4CEF1;
	Tue,  2 Dec 2025 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764684381;
	bh=G2feBLO7BWhizlnQ94253t8gNKnIjAErMQCzfMKOX3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVR2sqhk4AozjJAc6sgzcVNXxivi+423XUDokzS1pnbFAkNiPk/GtAIR5cI3NvYGI
	 N2jxqE+Ykeb5WLoCHA/n8I3HBgUzN2mJmUBkXqEcvl92YSomYEJJ731WkqkqDAiP+2
	 T4zfRW4fPZkeVvgGhK9fdqngZEQr0shju9v+Lk6sJd3/92yPFPwdMNXakYjf2APW8t
	 c30lsF8De/Uo2GhDQWioUHLkfCHUrY3l6v5jV/fNVZnkMi5h7EC/JoDy4tOY1p09C4
	 fM3zQZ81rcPRFQ4hZ98a7gyn7uT/q5HH45pOh/+dW2nRd63Wixxr4jwLkhbxU9Onuf
	 rR7iQa5IFj6Fw==
Date: Tue, 2 Dec 2025 07:06:20 -0700
From: Tycho Andersen <tycho@kernel.org>
To: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support
 more than one listener
Message-ID: <aS7yXLwDH8hYJBIl@tycho.pizza>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>
 <aS2lBui4JSe3uI3m@tycho.pizza>
 <CAEivzxeMG=+_KmmvksZtgeVePcXPx7SO=fDekh5fU=F0rHvdGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEivzxeMG=+_KmmvksZtgeVePcXPx7SO=fDekh5fU=F0rHvdGQ@mail.gmail.com>

On Tue, Dec 02, 2025 at 12:58:14PM +0100, Aleksandr Mikhalitsyn wrote:
> On Mon, Dec 1, 2025 at 3:24 PM Tycho Andersen <tycho@kernel.org> wrote:
> >
> > On Mon, Dec 01, 2025 at 01:23:59PM +0100, Alexander Mikhalitsyn wrote:
> > > +/**
> > > + * struct seccomp_filter_matches - container for seccomp filter match results
> > > + *
> > > + * @n: A number of filters matched.
> > > + * @filters: An array of (struct seccomp_filter) pointers.
> > > + *        Holds pointers to filters that matched during evaluation.
> > > + *        A first one in the array is the one with the least permissive
> > > + *        action result.
> > > + *
> > > + * If final action result is less (or more) permissive than SECCOMP_RET_USER_NOTIF,
> > > + * only the most restrictive filter is stored in the array's first element.
> > > + * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
> > > + * all filters that resulted in the same action to support multiple listeners
> > > + * in seccomp tree.
> > > + */
> > > +struct seccomp_filter_matches {
> > > +     unsigned char n;
> > > +     struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];
> >
> > Maybe a __counted_by() for this?
> 
> I thought that __counted_by() only makes sense for flex arrays, while
> in this case we have a static array.

Oh, duh, you're right of course.

Tycho
