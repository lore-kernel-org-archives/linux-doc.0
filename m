Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED715A5
	for <linux-doc@vger.kernel.org>; Mon,  6 May 2024 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003998; cv=none; b=H00y+iKK4/v3NEL1N+VyB7qQFUO9MQ9T0fmGNXbYZ6BoHOZG+wVCTz7NKjFyWVP5B7S4agX7EzzNAcdhWEXjApQwtbXWdaDdTYVH5YhB9UNpYaszOz1ndkrvgRLhB0hNXzyX99DR6yFvNO5atptkbVm8MICn2Fyqe8yBIR74t9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003998; c=relaxed/simple;
	bh=9QyoBM5OciUWfzMMtP7ILW37nhWVCyfuC2Ea6o5QqBM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ryFb1q2S4ZrgN+Iwx3jvKMEYy3ihpJW51yLAqBZHZx8Den7/oPQ7T0TPX8zyhbSobBsgC97l4yDdpnBHYzgHV5zd0yKRLWGuUPLcwqwiuCW6mp5oIQwJd07iNlbRSdNTBjwLROOScGvTIi01iVEbIbB98dEcVgaDQPR8EVT3gcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Fyg5inRz; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Fyg5inRz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1715003993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2WXk0EuQ5nz923nMjKal2VZpAShTUCRAYCxi1j7Elg=;
	b=Fyg5inRzsFupkLS22MxFbipSXdQ1DagF8r0dKViA7k6L3gMVIK47QdqbYigBLbts78MSlu
	VARuqc8HybL9bCtrohTB6OvD15fy+fJG79WVQBQcOt1bVnE9vKLCESY7tBIehboltvJDdC
	kIwMM3Ba9dokeoYxETe0nzZFV5jgPAgmzoOTRQxJOgiak2Ad9mkv7AOuhd4uoS3aUqPhsV
	rhPUiYbHnNEjNgsHb0xyg+Ao3Iqo13ZVNktgrx9Z41ZSdSxdDE2aUecz3V+vfnunFTPlm8
	Ta1BrwI37Axsdvhyxhp2StcljNl+0mKQV1bY6HOjLobFpNl83ogHLGEl06dcDA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: checkpatch doc suggestion
Date: Mon, 06 May 2024 15:59:41 +0200
Message-ID: <5571273.FuBcWSoPN1@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZjTe1STECXg2mmmJ@archie.me>
References: <8090211.0vHzs8tI1a@bagend> <ZjTe1STECXg2mmmJ@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart17503119.A57yYLbYUM";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart17503119.A57yYLbYUM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: checkpatch doc suggestion
Date: Mon, 06 May 2024 15:59:41 +0200
Message-ID: <5571273.FuBcWSoPN1@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZjTe1STECXg2mmmJ@archie.me>
References: <8090211.0vHzs8tI1a@bagend> <ZjTe1STECXg2mmmJ@archie.me>
MIME-Version: 1.0

On Friday, 3 May 2024 14:55:49 CEST Bagas Sanjaya wrote:
> > I think it would be really useful if (f.e.) the following URL
> > https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG
> > 
> > would lead me straight to the BAD_FIXES_TAG explanation.
> 
> So to add link to arbitrary location in the docs, you have to explicitly add
> target (anchor) to desired location. Then you can reference it using the
> target's name. For example, to accomplish your suggestion above:

Thanks for that hint as I indeed didn't know how to add anchors in .rst files.

Cheers,
  Diederik
--nextPart17503119.A57yYLbYUM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZjjiTQAKCRDXblvOeH7b
bk7PAQDlQnHmUItWk3KtKE0rgIx7VBmHvxUzKAnnPvbFkejtmwEAvvSdebTBbZo/
vbO0da+1e2KAQtTwVF4+6Y1fxrOEWQU=
=Rgdc
-----END PGP SIGNATURE-----

--nextPart17503119.A57yYLbYUM--



