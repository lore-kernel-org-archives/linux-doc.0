Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270183A1A3F;
	Fri, 19 Jun 2026 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879641; cv=none; b=HpvRIBMkRLW9JaStkn7OzX+zfL8aefOM5+cdRFxQSvhFdWIGt7bnLTsmRrv11C0aZNLwWn5pDAGn58JvDyO4x6VX+qt7kSZ0tf0l2SpRhYX0nz2b1VnjJtH27cBsRDTHEMe/ZHLVdd0GedPNyW76i1jTmuIALWiT5MaMmF5eZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879641; c=relaxed/simple;
	bh=kRxVS1ONeZRClTtrYfus92QcRqguerRC2O181sOcPB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb2js+wQ+w20DkFDPPjcJctli8L8IBSRuT+UDbCRfmAzaW8GRhds0y9qFC87lgk7oQjWvgnrVbLkQq0gyKhR6o4o2dZsL+glUaXzl01tSMDvIMKZPjPUxRJbjclIBTDM4PhSFE0DY1tJCptMq1B7v7kbT8hK/zckR3N7fBCja2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qt2UYjxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt2UYjxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803D01F000E9;
	Fri, 19 Jun 2026 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781879639;
	bh=iY3PzyT2bvhJB8GQoyEuL/cVwNdncZTwIKXWvjCy5sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qt2UYjxNkeCMkAztbuSIJV++ogincDirPM4tLxFDX44bRbSEbSpl0eTa/0WH0fiOC
	 gbehVeWbaBxkniTtKNZ88i4Ol9SeEKxK9Q8wju3zkrj/5sCaMEUxjBXykncMZugJl3
	 XmCtNx36Mfu/0LIaA+FDqhJayEktKLas8PgHocAlgiX2NT8B2mczkW8RQUF8Zw0+MK
	 7lh2FGD7c839RXq880flX2H7sW6f2pbuWnN0HP8QtFehLCcfxIIRnHoeZ+XJtboXg1
	 1dPrlLW4S4vRyxFjurpsO4xXlfoKCf5bVcIW6gV7syMJ+1Pq3kXvrZd6mnnMeb2xEE
	 IkKgpfPpGwxtg==
Date: Fri, 19 Jun 2026 15:33:55 +0100
From: Will Deacon <will@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
Message-ID: <ajVTU7OsCInkAzoq@willie-the-truck>
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>

On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
> When trying to figure out where to place and call an arm64 Image in
> memory, reading booting.rst should provide the answer. However, it
> requires quite some digging to figure out that text_offset is set via
> ".quad 0" in head.S and is thus actually always 0 since v5.10.
> 
> Update the documentation and make that explicit. Reword the 2MB
> requirement accordingly, and remove the paragraphs that only apply to
> the ancient versions where text_offset could be non-zero, as they only
> confuse a current reader.

Doesn't this needlessly prevent us from having a non-zero offset in future,
if we wanted that for some reason?

Will
