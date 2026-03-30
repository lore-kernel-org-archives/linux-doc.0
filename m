Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C947E2F25F0
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883842; cv=none; b=hC1LTpEqSaQirt0nRQy9aHtbkca91PNXyNI0Ih8xGxtpZha4cBUoSCEgo2SEH2obBzMk5Lejw0Z0CnCbILDluGbxuZAxiPpalRzIFjADD3Z/MEoKZeQrn9P2uXRlDn+4wr3ELgQYGiu6CgQOEoUFhQfLEFf0dHoy6lYnFpwk6/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883842; c=relaxed/simple;
	bh=2wFihfL/44XcAEfBCnwRd1W9aOt0YKtdzb6VECUt7RM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uUDM9vKr9LcLrWa557tj5/7W6QTI4XriO8jZTsX8Hkoeo1svIEUDQ5YAum36xhAsjHAr77UMLo995xBEjBPCTnBQcobaHot8jhmN5DJ1zL1sUP/QcvR5VYMmSkMbfepjyirNjiPFhtOsWBniRB0KtTV3pyBAB+I5nh8xHLppSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DdXZZLaV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DdXZZLaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379E6C4CEF7;
	Mon, 30 Mar 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883842;
	bh=2wFihfL/44XcAEfBCnwRd1W9aOt0YKtdzb6VECUt7RM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=DdXZZLaVyhTb2ZQOqaj67hwNeb6j5QOUyxQsBujPKYc08zK+q9iiNBZHLBYn9PLA0
	 WhKc7N0IBkwRIpn87FSVObAWBbeRSztJv+lvurI5joSozx4bowa5USzaBTTVqfnQ8I
	 HCDsZlVJ2U1TsMHwTEVZAAXX+nrrnabUjPVPGhvs=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/5] docs: pt_BR: Complete PGP maintainer guide
 translation
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-1-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383987.1817745.16164460917376587462.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=1837;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=2wFihfL/44XcAEfBCnwRd1W9aOt0YKtdzb6VECUt7RM=;
 b=iV2DEFdcRsUM04GWhTdmbBmEOaTIfj28cK97GEtNg3FSTG89CqpJUNml7Gs8fpNcJtEtYzj3m
 996EIZ48mbCCX0iBx4J+eat7r8S5jgXqn9vqdck8EUoNg783ZDqdG3a
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=

On Sun, 29 Mar 2026 13:50:34 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> This series provides the complete Brazilian Portuguese translation for
> the Kernel Maintainer PGP guide. The translation was divided into
> subsequent patches to facilitate review, covering PGP basics, hardware
> tokens (smartcards), Git integration, and identity verification.

Thank you for providing this translation. My Portuguese is not great -- 
I mostly nerded out one year after attending the Kernel Summit in Lisbon 
to get myself to a decent level of reading fluency, but haven't kept it 
up in a while. This translation was a fun refresher, so thank you for 
the opportunity. Please take all my comments with a large grain of salt 
as coming from someone for whom Portuguese is a 5th or 6th foreign 
language.

> 
> All internal cross-references were updated to ensure a clean Sphinx
> build, and terminology aligns with the existing pt_BR documentation.
> 
> Changes in v2:
> - Fixed translation of "Periodic release snapshots" to "Arquivos
>   tarballs por release" as suggested by Mauro Carvalho Chehab.
> - Corrected a double-hyphen formatting error in the first translation
>   patch.
> - Added missing Signed-off-by and fixed line wrapping in the
>   KVM index patch (1/5).
> - Rebased onto the latest docs-next branch.
> 
> Daniel Pereira (5):
>   docs: add maintainer-kvm-x86 to maintainer-handbooks index

I don't think this belongs in this series.

>   docs: pt_BR: start translation of the PGP maintainer guide
>   docs: pt_BR: continue PGP guide translation
>   docs: pt_BR: continue PGP guide: Git and maintenance
>   docs: pt_BR: complete PGP guide translation

I don't think the translation needs to be split into 4 patches. Just 
submit it as a single translated document.

-- 
KR

