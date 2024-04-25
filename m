Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D556A34F
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714076086; cv=none; b=OwQcgS6gtDGcTczxssvPiF/LAZPOjPNgII0izSL8ooA0CIqLjeH2epjM97NkSeEn9UGfjx8raOcMZUOG5ZyORWH2dm9yM6UO/fssFfRxqesjuZjiZnc4PFUY3wmujZUQF8jiLIZNSZ6yPeRol5IRPhhvVzEowKSflffzFnG4zmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714076086; c=relaxed/simple;
	bh=qjFKtsoAKCz0ScKoe6yzt15InsGEID68ILFHrtMbLCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOi+jbQSmBh3H7H1bGJ2NXOsDV1tRYRthhKSlgmnSbdaDOF3KLUd4Z1mKCeqA5USgVIZuam0S0xL6e2xOjMDneH1OwdFNoBvjTSJbnHqZujfJoS/uaSt3fHKs0kRVpTT/BcaRoVUHPJd6P2AKNdkEpVglAVtVjYkKjguIe1tmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=hqSDzkI1; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="hqSDzkI1"
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43PKERbt012079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 16:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1714076069; bh=NABw6fRRVPQSSx2uzfH9QlrfV+blNnHcxwPSqibtEds=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=hqSDzkI1f6rWdtqkz9/qJAnEa48MpHW6FwruYovbhKJ1o6TaA5hLYZU/e4W+BkVLu
	 nbTxWSN0UqM6JjXrppYmCz1OE+P/51bj50FEkm3U/1E+QAJeqMU07LkrFuKwF9ccgy
	 VTcvUR88TE9xpLi/VYcEmgnKILxfg1C58V1W1aT2USCNLZNX4rFRDuha7K7HKCqoDp
	 FUwt7R+1TNG89A0WzHpKyY+QI6PqVP4NKmS+NVJdGlfK8TOqg+l/e7KZAJ3tFJmTF3
	 NyNIbEWrZSMH+76Afg/8MmcES50AMb4hVDzL5uTt//EeCp8PNlPHOtTjhFyEWHEcFc
	 Z3QaR0cURfY3A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 52FA515C0CBA; Thu, 25 Apr 2024 16:14:27 -0400 (EDT)
Date: Thu, 25 Apr 2024 16:14:27 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "Bilbao, Carlos" <carlos.bilbao@amd.com>,
        ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        pranjal.singh4370@gmail.com, "bilbao@vt.edu" <bilbao@vt.edu>
Subject: Re: Feedback on my development setup
Message-ID: <20240425201427.GC3749403@mit.edu>
References: <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
 <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
 <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
 <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
 <87o79xqxtp.fsf@meer.lwn.net>
 <CAFkJGRf+K7iGY+TJQu3RDuUv_Xna4BMZmEfeuhHJ0JPg3KQmTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkJGRf+K7iGY+TJQu3RDuUv_Xna4BMZmEfeuhHJ0JPg3KQmTg@mail.gmail.com>

On Thu, Apr 25, 2024 at 01:08:36PM -0400, Josh Marshall wrote:
> 
> I cannot abide by this.  Not out of obstinance.  This document is not
> written for a veteran.  It probably isn't even written for anyone on
> this list.  It is meant to be much more approachable than that.
> Comparing to the closest existing document at
> https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html , the
> difference in intended audience and skill level is stark.  Let alone
> being able to find that document since it is so buried relative to the
> intent of someone trying to get started.  I have heard several times "
> you should rather improve existing docs" but without really breaking
> into all the implications that 'just' doesn't help.  Given the back
> and forth required to express the finesse here, I am willing to have a
> phone or video call to get this right.

Just as there are dozens of git tutorials which are floating around
the web which are separate from the official git documentation, if
what you want is to have an unofficial document designed for a
specific audience which is not the "vetran", that's totally fine.

Perhaps you can work with the kernel newbies folks, and look at
joining forces with their documentation, e.g.:

	https://kernelnewbies.org/FirstKernelPatch

The benefit of joining forces with them might be that more people will
see your document.  A random gitlab page is not going to be as
discoverable.

So I think there may be some crosstalk because your goals might not be
what others have been assuming your goals to be.  If you want to have
your own unofficial kernel tutorial, have at it!  You don't need to
get permission from anyone else, and you don't need to engage with the
community on this mailing list or anywhere else.

The flip side is if you want to get input from this community, you may
find that you are more likely to get that help if you are discussing
things on the mailing list, as opposed to expecting us to go find your
gitlab site and participating there.  We can't force you to use
mailing list threads; but at the same time, your expecting to us to
use gitlab might not be very fruitful.

Best regards,

						- Ted
