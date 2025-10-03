Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F111CA9
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759501568; cv=none; b=u4GFRAPdeQ6NhftiQc6bpghYDXvj0Fx3G1rROdYCAkPhITKtJkSmfLSgQYjoGpd0T01yov4ffbmj5iTAYSFOJLFMnABGtevUZntnLMAGi+jv7JbI7rXvXT4KX7u9LpykM6u1nTYVnHz9T7hZADPj6dLFExOaVvpZYr9SeTPZ/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759501568; c=relaxed/simple;
	bh=F2UvfxoQOzCnEuV3gA9j70rbCAmuwqvMYfQ1kpolsgo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SQRvmiWWOJBqphh/PGAuFe1+rJz8xZaz6y1xOQ7UK4d5Aem/TEWxU62moLUnXgY1PzVkmCJNd9l3kSpGMZGf5PUTBMSMQdz52lamkklZORO8PmWFx0ooi1+cWWgtXMNZo+Te9pQtii3xK17y9Q7YTZmssPHxk08Az4ncI6WVBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QloeOuB4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QloeOuB4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3FD48406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1759501564; bh=dr8l1J90GVv9nmM6s7NkdNN0PsFQe3x4xl6oPqmqvvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QloeOuB4ZlH7P95VRqKX5nSu1wmKPfwficrDvGd87FyGMBs1mHNvhe2r3lcc3WEvf
	 +lNSmabJPaK3P+BkY642EgCb1d6qPe45g2B+ZTuKYXbT1fEPWz3O4NpIrNQoxCJW/H
	 fRWoDU5rt1kJ2aISHl0oKlOwdAIVi4vg6cZAVR+XwtodoL9TACcpXwsqJU+Gds+868
	 +fca7YrhOeYNpMJG1dO+WBSQAIgmnGy/xBkQv1lvAm/cUzv00UOluY5PUXYASPYT78
	 orxHys+NZW/rg1zSfAtYrqpU+oS9qcQnn9s1gIKfl59kvTSEkbetehmvOCIRKa7V6O
	 jkslVE50lw7Wg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3FD48406FA;
	Fri,  3 Oct 2025 14:26:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matthew Wilcox <willy@infradead.org>, Mr Tourist <zakiuddin321@gmail.com>
Cc: rdunlap@infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for clarity
In-Reply-To: <aN5uu-yJZQiORUEL@casper.infradead.org>
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
 <aN3RjymBjn_VfcLe@casper.infradead.org>
 <CAOXP31FT7cZ79gAH-yOb+E8UX5sNnztL_rwjn_x-aLHdefjk9Q@mail.gmail.com>
 <aN5uu-yJZQiORUEL@casper.infradead.org>
Date: Fri, 03 Oct 2025 08:25:59 -0600
Message-ID: <878qhsrrig.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> On Thu, Oct 02, 2025 at 09:46:26AM +0530, Mr Tourist wrote:
>> Thanks for the review and comments provided Matthew and Randy,
>> 
>> I have addressed the comments shared and have attached the updated patch
>> over the email.
>
> No, send the patch inline.
>
> Also generate the patch relative to what is currently in the tree,
> not relative to the last patch you sent.

...also, copying the documentation maintainer would be a good thing to
do...

Thanks,

jon
