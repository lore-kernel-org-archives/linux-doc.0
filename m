Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A5372B4B;
	Wed, 22 Apr 2026 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844117; cv=none; b=mNJzIj0YLJgYalggpTdQVwa9lq4DdXNSet439GZe4FQVDbRz3oyQtYkYSwKy1m+DMtW4trqLWGxeTX34hX83rtoEU5LsRhVOOEF4ky3DM1heDYym5O2n2oBrUBbFAQzMlHUnoM43yzyaS62KeCM7DRfyfx+1aUP0r8ppFlxU0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844117; c=relaxed/simple;
	bh=1WW5ypgL9+kd4wByKxBwZgxmVkHgEWeyIpu4HP8j2iQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WaUsQQzHl9W4hNSbDIB9CW93yzkAqdQ7HtSzO+ON+Bkc2YA7ib4DCoM0kwymvIQlkHD0IowFyLF60ugEVwDBSj+9x4Tg9dnADlFHmtrFRoKMKzl4J5kFSMeZZ1rTKS9X7OC3enUtOBzyS3F6ldwmBsVvfoktW/cBMFqYPMIbxLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com; spf=pass smtp.mailfrom=truealter.com; dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b=w1D7Rcr7; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truealter.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b="w1D7Rcr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=truealter.com;
	s=protonmail; t=1776844097; x=1777103297;
	bh=rRvrYoTdSRGxha4x+rUEL++YYnP3AcflnWJircooC8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=w1D7Rcr79w3dfmcPjnATsR6DUZCaBYTKmApNA4wuTGL6NwP5yHYHRCchkZ8guH3hM
	 lC9J+Q4sFd2TvmYsfCUfZ5/70FNBSIMSiikYU2wHnLm0ATkA2LH79ElaXk9sGoqh10
	 YPbZPzFuoWNM2etNIKfuhce3Rp4b7EbPNFf29+qHPqvUzW1fMTxtN8l0aF9XaHmmIF
	 TXgOO1eOmVrdUkGgsS1PFZTVLw8wySjKqxh4SZTQ4TOE3fO2SUVjNfNFabcMtHunHs
	 DXTDOsyqSSzCm0hIzsbLbJ19ogRykFyimO/kDw6qeBRx0UnWyPiitXFSq595gTA5NP
	 fokIAbvjXBvmQ==
Date: Wed, 22 Apr 2026 07:48:14 +0000
To: Konstantin Ryabitsev <mricon@kernel.org>
From: Blake <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By: trailer
Message-ID: <eSjEj2dXsx6UutDw5totTZVDMBnsHRCESU-GOUPU_GknJKufOv1hPFzgRCy5TNq4xC5lxVhBKvKP76dKTclmMPw7nr0uIS5bgJabhXO9Ldk=@truealter.com>
In-Reply-To: <20260421-simple-dingo-of-piety-d033ad@meerkat>
References: <20260420142741.3187814-1-blake@truealter.com> <20260421-simple-dingo-of-piety-d033ad@meerkat>
Feedback-ID: 187617253:user:proton
X-Pm-Message-ID: f717befa548383b2a5ed552aeacf885e3498e8d1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Konstantin, Vlastimil, all - thankyou for the close reading.

Two things I had wrong I would like to correct:

1. DCO real-name requirement (Vlastimil) - commit d4563201f33a
   removed that framing; my earlier reply to Greg that
   Signed-off-by requires a legal name was based on pre-change
   Documentation. Retracted.

2. Tree-hash stability across git am (Konstantin) - agreed.
   Mbox transit and apply-on-current-HEAD drift will invalidate
   Ed25519 tree signatures on the majority of kernel patch
   submissions. The draft's rationale-for-tree-hash-signing
   section overstates operational viability for patch-based
   workflows an produces a real gap.

Withdrawing this patch and will take the scheme to the git list
first as recommended. Thank you all for your time and
consideration.

Blake
