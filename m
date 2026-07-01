Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060EA477E2A
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905241; cv=none; b=mAp/X82+ir8DBPmAAFXMZzfQqOsGnBL6BJJOpRsQvA7/vSnTpyShdJcARFnqRHXIsGM+joHy5eL96jEq9htjoJw9qS4XwHFStB2Xd+DdrY7H3f0nnOEaVBRmvnLh/fMzxRW3P8zqdXsnEsa6R7Z90PshikrVKoNJOSivh/5WTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905241; c=relaxed/simple;
	bh=CCOzFLkfJgt+CMumxNevtMRsu20SLhTsRhYEhL2ZFrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=einidtKuIvK6lXdM++0ZV632Qrh0uCWUQ7y/CXecaoBQ+pdHiBT8b/Tk5+jgCPqsWw0D331S+oOasfW/Xm/rxRF5Q8ulN34dsnL40MZr5XNl+2UrF2CQmnhG3gT/eAz518cpzWr4S9+kaDhpZIguHFaHpSiFKYKvI5EHvs8YwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRrwGtXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRrwGtXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BC51F00A3E
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905238;
	bh=6Z4qh1P94ZbI1sFyg6TBGTHtGazITFuVN1NDcYfzFck=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CRrwGtXk5CpcQ4AnjsykpbmP3ScPNzaF5Vj6YCK1/v7TjVJCKU4vkfMGpgK7Uy5Lt
	 HFt7Fp1OEc0LFiM6qsTOR8ZSZImEz4Gpxhwx3Ktxc+fOcwEUCjlGVssQZzOTe83SoW
	 JaNdHE5AVwc87VEB40KH9MOHU7bVpmelxV9GW5Pc6tMzr/IEmhjdg064z5fLBkQL4U
	 ICA2RR4BKnos5QyFENCkrDKXx/bC+7yrMBQTvH8grHQqK+k70uXDNW7zNf1yUyG0K4
	 H7xT0sQmXtf2mBHiv5iZWnXEqTUZyYzCDPMfwamtW4KJ4Phwuh9IBawmkKVCp8rmxK
	 TskJWw0BHcQ7A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso535573e87.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 04:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1mRtXz+f9UaM14JzTdtiwKBz4RODTkISp8l4dfVb2tuoymDDpBhW8Ufl1L86dellUQtUGI2M0678=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdftEIceVw/V4ara8TG3C5SCJ6BdBqy1eqWjGpqZ4eFAIEUhSr
	4sjLxw/IoJMFu0dGE/pYwL4Z6BNIsCf9+GorXXTk2yvw/eRpkQNbCdHvF09GejvSUmgubfecoVq
	IyJ/RyQ4aVQRu+kXzO7D0NWrBjpPiFFU=
X-Received: by 2002:a05:6512:2c0f:b0:5ae:be88:6db3 with SMTP id
 2adb3069b0e04-5aec67b2b36mr324767e87.29.1782905237123; Wed, 01 Jul 2026
 04:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701045640.3130090-1-tzungbi@kernel.org> <20260701045640.3130090-2-tzungbi@kernel.org>
 <2026070110-unrented-crummiest-d6af@gregkh>
In-Reply-To: <2026070110-unrented-crummiest-d6af@gregkh>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 1 Jul 2026 13:27:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jNq5SMtAxLb6UqUO6OrZSYKK1+AfY6CQAcym7q0GntKA@mail.gmail.com>
X-Gm-Features: AVVi8CfypQtJjqXcSgyTkGn6D_6xva6NAxRxk7oopv5I9Wg-xygkFTB1rarCSVg
Message-ID: <CAJZ5v0jNq5SMtAxLb6UqUO6OrZSYKK1+AfY6CQAcym7q0GntKA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] PM: sleep: Rename module parameters prefix to "pm_sleep"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, tfiga@chromium.org, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 9:20=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 01, 2026 at 04:56:39AM +0000, Tzung-Bi Shih wrote:
> > Currently, the module parameters defined in drivers/base/power/main.c
> > use the default prefix "main" (derived from the filename).  The prefix
> > is too generic and non-descriptive.
> >
> > Redefine MODULE_PARAM_PREFIX to "pm_sleep." to group the module
> > parameters under the namespace instead.  This makes the parameters more
> > descriptive.
>
> You just changed the user/kernel api, right?  That will break things...

Or not, if that part of the ABI is not really used or the users of it
can live with the change.

This actually is an attempt to correct a mistake in the ABI and only
one module parameter is affected by this change
(dpm_watchdog_all_cpu_backtrace).  I'm not expecting the people using
it to get a particular heartburn about the change.   Or if they do,
we'll back off.

I'm now thinking though that using "pm" as the new prefix might be better.
