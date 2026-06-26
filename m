Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FA3DC85B;
	Fri, 26 Jun 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464656; cv=none; b=PSfTSiN/BaN4ywctZDrQEIyjUdGmrveTNAqlEibDPnbS8df3lfn47w7runGbPlFfdGUI7Qy2GIEvaugrpmBeX1hIuVV2lFNBQ1AdOgjqWnyvgUOaDR53VPSH3o5emsl6n38grMTyAIfyRwiOhijKkFVVTeMH1arfzhxJeYA+Lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464656; c=relaxed/simple;
	bh=ocg3Ma13+1eKCLtlUsa5I+4b/JWskFOjHa5Pbta8nDU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U2zJEBoFgpMkvx1TVZqMvBcHLb+1iEHjhAzjvIYWG9PCb0B9bcGXeBId2VdngiPGE7870guL5OoCQtn+nH2/osD0Peszn3KbSSCLbEsMp5LUEJ4Vlc+uNaqkkUy811R2ioI5uKFwXAace+zDXq88Z5Xu8L9oYHlJmwNXyTpkgvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+w/s8dQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+w/s8dQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151641F000E9;
	Fri, 26 Jun 2026 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782464653;
	bh=ocg3Ma13+1eKCLtlUsa5I+4b/JWskFOjHa5Pbta8nDU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L+w/s8dQt9TymP6DnhqkmuBsUx82Qkb2gchip0ksbj34ubUQRf0u/84ikUutxDQNH
	 BsW/0cbBclhqfLVm4ulf6R4HicCdx3PsQlga4X45sA5TzL9zlxy7BSW9Zb9Shb6Lwr
	 GUOF2Xntn4lIrOW1cPzqlaRijNrDTp5hbSv6ee0xH+c+gSDH+1cN8fZtSWSIN0CzqG
	 jxL8vvAq9l02uSydgALiOeQRp01h6ICwgU/1/b2ZHTED28dRA5jentWPcSTjklyKRy
	 gbpiml+kRNX7yfSe7lV4CIdjZu1Vr3hVceWV9Xl9tYeqDkrJD1WY82mxPII1SU+M68
	 QHiPTn2CdjW/A==
From: Thomas Gleixner <tglx@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Peter
 Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Docs: SMP: add an SMP docbook chapter
In-Reply-To: <20260625210331.1050915-1-rdunlap@infradead.org>
References: <20260625210331.1050915-1-rdunlap@infradead.org>
Date: Fri, 26 Jun 2026 11:04:10 +0200
Message-ID: <87mrwhk705.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

TOn Thu, Jun 25 2026 at 14:03, Randy Dunlap wrote:

> Add SMP primitives to the core-api documentation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Thomas Gleixner <tglx@kernel.org>
