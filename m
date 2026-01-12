Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11293624C4;
	Mon, 12 Jan 2026 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233433; cv=none; b=cNHNihvn+rVMkkRu5O5XndE/KeaR6OJWJ5lwN62wmc7yAqkCXlVnEBv3X/wwjuRHHY5Vpu2S/c4PljcmQP1foFVfslVXxqBPTPA5KPYNPahRicTn1t22zNz94+E9zC8VVsqN2HAzgtmrxLE/xwM/CsJbM+Qc4foWqTMM2resUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233433; c=relaxed/simple;
	bh=xJkc9pMy5KlxcsaizX+CFnLRpiuY1uFbrRu83mdatPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKRl4payedItIHmY3A1k7d0XIf1ohdA31ihLIcLEMieReULfhy8MSl70XIQsa9wMAx8MeqorN12Dq5pfC8lwCOKgBhD7lI+QItPDgK7fkUQ0LZHZzaEUXAoAkA6SPQ1aImNG4rF98l1WwCR5n2imY8W7wk2BMo9334h/60M4GEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaP5MVym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaP5MVym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F6AC19423;
	Mon, 12 Jan 2026 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768233432;
	bh=xJkc9pMy5KlxcsaizX+CFnLRpiuY1uFbrRu83mdatPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaP5MVym/FieSUrb6oqiL3a4Y7ms7d+uoB3WuvwBU4vP2GdTrg49jxaxXmkHPPZE+
	 8adeRObR2SAFKhFJbj0VuHz/iHaLPh8BciOJTx5xy7nwDgp+UkWFT9z47G1Cd637nD
	 uSzXEytvZPJsKHCCp6ItHIa4w0KPcX8U9T95Frn529rCsNmLqWCszKMCINGBhEGNDo
	 BRkaSJEuVouatnlctGA8/Jju3PYOmYCFvieT1FtMygIETvywIfuos/4FIQFS2Zzm9m
	 +0TPBkcMWNpQBOs1g0nIXAbfKTh5jK14TLz/B/BnpLVqxsGLq6zaxlJKH/KDbwR4qH
	 MO5evlce7573w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfKI2-00000000Kk7-2bfE;
	Mon, 12 Jan 2026 16:57:10 +0100
Date: Mon, 12 Jan 2026 16:57:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 3/4] scripts/kernel-doc: ensure that comments are
 using our coding style
Message-ID: <aWUXVv1nt4Npjznw@foz.lan>
References: <cover.1768229902.git.mchehab+huawei@kernel.org>
 <7604a45e8ade06994afeb68616cf1838dd1101ec.1768229902.git.mchehab+huawei@kernel.org>
 <878qe23kgv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qe23kgv.fsf@trenco.lwn.net>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Jan 12, 2026 at 08:43:28AM -0700, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Along kernel-doc libs, we opted to have all comments starting/ending
> > with a blank comment line. Use the same style here.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/kernel-doc.py | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
> > index 5d2f29e90ebe..7ccee4626478 100755
> > --- a/scripts/kernel-doc.py
> > +++ b/scripts/kernel-doc.py
> > @@ -197,7 +197,9 @@ def main():
> >      parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
> >                                       description=DESC)
> >  
> > +    #
> >      # Normal arguments
> > +    #
> >  
> >      parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
> >                          help="Verbose output, more warnings and other information.")
> 
> [nit] I approve of this kind of change, but I would get rid of the extra
> blank lines, just like we do with C code.

Ok. FYI, this is mostly to preserve the same coding style everywhere,
and we did a similar change at kdoc libs. At the initial versions of patch 2,
I wrote a new comment about why we needed to avoid error code > 255.

At v2, we're using a different approach, so no new comments are needed.

> (I wouldn't redo the series just for this).

Patch 4 depends on it, so what I can do - assuming that v2 doesn't need
rebase - is to send you a new patch to drop it extra blank lines.
Or, if this series needs another rebase, I'll fold such changes on it
for the next version.

> 
> Thanks,
> 
> jon

-- 
Thanks,
Mauro
