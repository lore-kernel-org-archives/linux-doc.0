Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0152F3627
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003770; cv=none; b=kSr6248991EXkbYR6OxbJbLGIOYaNgGZsvDr20raB/Qz2lZ3U4OOl5QZ2swyHVEoWXjL5M1fDx4R53CWP8ni/QtT3Jjejs8JhfB4bpFaP8fNtSSq5FAebqbA0jNNODcHwOe/DOUKiD1QDPFQFVoqcdGSOEFAmszzy9qJrWGym4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003770; c=relaxed/simple;
	bh=aUMN8FhsVSLElUBbjq69uzF7yGIJy4XWSGdIWxOT+WA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RXEtT2wEkCaqeuzLLDzAxe07sCpIhJppvbV7YTppdS4vMFTGKUXYopi8MKb+BBT0uZvD4RtE9oGHkRoKU8tBfWtBOeA6hdFRIR4dsJnPmaxpLHb0J/QtMMGRTPrOthz5upkVwGjF20sIDl+lIlzZDiiobAgWum/ItFuBKnxP48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kbs/ppUu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kbs/ppUu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32659406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757003761; bh=lfE8crIdcaJ14VvA828SA+k213F040wU5vYEB48LVxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kbs/ppUuEOAtnfaFLk00P1VZXTsr+qbXfi7pKT8xx/D8eVD9VPJXPyR1nE/0UTU4o
	 obVdWC7h88ZsPfF2A/+po1Nz2s4wz0/0lWGqWzwOgVP1kHCoi9GYvDb+4/8etbxioB
	 cERJtTRCP8nRot7L9Ty3O/gJiT9etB4wvZoeBAnW54WdqE0NVdSrGaFb9mnspYHK9a
	 JDrur6pcQRfLe86BnXkjfMkNB+aDjhTSXU28+Qs99hFzVJ646xRJYZtvzpJgHFvAiu
	 hspD8xK9kxzjYC3Gjs29z17EoQalxL+ggj0O0IEo6UAZu1j0sMTv7W5cCDtloV6URI
	 Ld1UMq+NC8XGw==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32659406FA;
	Thu,  4 Sep 2025 16:36:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH RFC 1/3] docs: add scripts/documentation-gen-renames.py
In-Reply-To: <20250904094520.451070-1-vegard.nossum@oracle.com>
References: <20250904094520.451070-1-vegard.nossum@oracle.com>
Date: Thu, 04 Sep 2025 10:36:00 -0600
Message-ID: <87qzwmmaz3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Add a new script that wraps git to trawl the repository history for
> renames of .rst files in the Documentation/ directory.
>
> Example usage:
>
>   scripts/documentation-gen-renames.py --rev v6.17-rc3 > Documentation/.renames.txt
>
> The output format is simply:
>
>   <old path> SPACE <new path> NEWLINE
>
> where neither <old path> nor <new path> contain the Documentation/
> prefix or the .rst suffix. The file is sorted alphabetically.
>
> We can suggest rerunning the script for future renames (and squash the
> resulting change) or rerun it periodically to keep the file up to date.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/documentation-gen-renames.py | 122 +++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100755 scripts/documentation-gen-renames.py

No cover letter?

It seems to work as advertised, thanks.

One request: the plan is to move all of the documentation-related tools
into tools/docs once the churn settles a bit.  Rather can making us
... rename ... these, can you just create them there in the first place?
At that point, the "documentation-" prefix on the names would also be
unnecessary.

The programs need SPDX lines at the top.  Can we also get a brief
comment block at the beginning of each saying what they do and how to
run them?

I'm not convinced about ".renames" as a hidden file, but I guess I'm not
deeply opposed to it either.

Thanks,

jon
