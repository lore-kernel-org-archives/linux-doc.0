Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D49346E7A
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585644; cv=none; b=A7SgAAPzdlDdL0ilMoLUR2730E+jYJcFmKE2on6AT1Fphz+ZcWFPuZazC3u1erdHnY1Aad0evdsDozmi2LHiyrZSOYpaMRIB+KllV0p5aOYfyUEoffNI2PHEgrgEtcrLd1g/+7Slm8ZxEQvVyo6u/c8VhG/SYSB7Orave50sWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585644; c=relaxed/simple;
	bh=Vmp1nvYXXB/z1f2QhxqY8YTVzr1IRv5Cke1rY0bNlks=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SyXjTEdjCvVtyDoy5LdSzzUTnW6w4QMMArnlZS+UfWFoWmhIUw0yFIU5PfDFqnd5gUrcG3E0QoFQwkLh7CdX0ahOdXa6C0nRh9NWntCvmAiiK5bmFtYg4KB2X0pvt4FwnkBOsvbIZ1tTzPaGbqDo6BP7dNkbZcPb7zNzBe36SNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dc61yXA+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dc61yXA+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D0EC40B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770585638; bh=DgwPHkMPcr7GWFVQvDlup6ukaqd/En9GGzH0WSgESpw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=dc61yXA+d5uMInYG84exdqbRCMzDHaV0SRfCwzF5dubzPr21NIapljXujduMrwMAU
	 wd/B0VBArDmckoiBUPWdmukp5Yj8nGcDX/NwCo+xXmvv8wTueklGbnbZ0K0nNCH8A2
	 YFL8JvWdO0nsWhVKnh76ZD/YUmPaNmXhT/CssKCbDv377iUN7jNGddYtmQ8qamV4tI
	 F2rLZ4cRNVcb9+SUmKE7+UtY9PHehnsVlUevkwy3hxjMh+hTAT2q2ZJIqijLN/LjnE
	 UO7YsNPcTYZniS4C+gdgCRq7EEHy/OVj9LaagdMxXWuL4PTFBwrWZP8MPWYfUwoQVX
	 rAmewCbtiFdFA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7D0EC40B32;
	Sun,  8 Feb 2026 21:20:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: Fwd: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
In-Reply-To: <CAMAsx6c-Gc7hN9pj1GSeEYAVRY9jp1L0gVcyxos43v6RtKUaCw@mail.gmail.com>
References: <20260204113210.185221-1-danielmaraboo@gmail.com>
 <761e2297-3481-4df6-9ec0-7fc6fd919797@infradead.org>
 <CAMAsx6cH9OdFEM_aMWwT717tQEdu5C6Nd+K3YipWfPxNFYeteg@mail.gmail.com>
 <CAMAsx6c-Gc7hN9pj1GSeEYAVRY9jp1L0gVcyxos43v6RtKUaCw@mail.gmail.com>
Date: Sun, 08 Feb 2026 14:20:37 -0700
Message-ID: <878qd3c4pm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Following the v5 submission and the Acked-by/Tested-by from Randy
> Dunlap, I would like to ask about the next steps for merging the
> Portuguese (Brazilian) documentation into the mainline kernel.
>
> Please let me know if any further adjustments are required or if I
> should wait for the next merge window.

The merge window starts tomorrow and closes in two weeks; new material
will be applied after that.  There's nothing more you need to do.

Thanks,

jon
