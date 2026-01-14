Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBB346AD7;
	Wed, 14 Jan 2026 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418681; cv=none; b=mtTT/HhfI8qkqT/+vUuxdbzwSvyQ0Z1I3CotKNJ9B2szij2tHU/+LcSp4trt1egrvJAngLsPMFLUngMsFbEGhyjAjIhCNFT5zzgHJZJJg8h1ninczOZe8SOSjQVKmashMwUfvXMx3zaY2aj2E9E8Hjp69r2ffsrvvaGQzP4w2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418681; c=relaxed/simple;
	bh=WYF2wW4PXFp8iVn51RRMqTOdsLe7cFP/i+VmUuAJ5GE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NYv/nFikdlUpo01TPAuHIIJAnbv70Dc5BsE4LlXGR1EcidUaHY26KdSnWiU8MBo/cyKz5epdKlPn+lQN5rbh6U0M325y03KsHErx/UBqO+zYqKKfXTd9R1F1oAi2crv76YTGWY0YncWNknDCZpM+CvaaY21b6GYBsFcSUXPcxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Efyy1dLh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Efyy1dLh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A43D440C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768418672; bh=p9AjR/UbZ1dl11VzOU7hAjsllzzG0yWSU3fCsT+Xkwo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Efyy1dLhFkaBFBWAFfcqBymuKEtPqiiSnDEcOH5UWpkDxKBBLxjLzzMNVpd91assd
	 AYcLKbPMvBZkB1OQ32tC0QVQYuVPKKgNFPwJq7VDmy0oH5cTD4UjCrLoOjXZWJF5pz
	 z2JyhdGV/idx02igvOltXf5ivaKTg2ONgMPpgYulSwQJ5Krka7jA2pfYBUw8Cu6Opg
	 zp0yiwPLoX3pCRvnWoyVpyLC8iU9GZkB8Q4s2vJ6eb/QHCFJDcMZPldEBlqQnBaA4F
	 YPeks5eAPGU3vjV01myWqbSESZwZt7Aa1V6jx+dpXkK7hbx9xni77iLGC5MEmeLXEb
	 +qOs/CMqnNyhg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A43D440C42;
	Wed, 14 Jan 2026 19:24:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
Date: Wed, 14 Jan 2026 12:24:31 -0700
Message-ID: <87zf6gt2ts.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> I do many of these on a regular basis:
>
> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>
> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?

Yes.  The tool moves, but its functionality remains unchanged.

Thanks,

jon
