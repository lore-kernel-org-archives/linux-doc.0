Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4623EA9B;
	Thu, 14 May 2026 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732215; cv=none; b=CbfDo5FEHFW2Q9TKfOVl34qrm8KmRg4uxPv01NerU+PXC4SOP351v2elKuJNUD6B7LHQ1v2XHf06GW7P7Cx7nCRHVP1l795jhPRD4XzAqk6vKcpjfKrVoOxpsz7g4+KvKzANI0B4IppRB6vvHFr38R4an1aPcNcbYOkUrPCFXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732215; c=relaxed/simple;
	bh=BQSZ9ee/VgHstNC8tJm0ej+5RQbrx3NRClPwFKpSEWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fJfHlvmVUeJDR9UOvpTQAywnuEWCWCco9WHYA5I8YvKY4iZsgSxnOkGFCu7bMQzYryDYzbwxL1CCoVJ1mUd9oTmy44bojr8gL7TmYyX2NTlOepbg8Oa5J21zq9XVvsWJ3mzPkVOd/942bj4/ewbMUKZyaKVH84qbUovzzFVBwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5VZAaFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5VZAaFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21CCC2BCB7;
	Thu, 14 May 2026 04:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778732214;
	bh=BQSZ9ee/VgHstNC8tJm0ej+5RQbrx3NRClPwFKpSEWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q5VZAaFlwLXXpqqzimWpLMDbbAvVO0PBwYRla5alMQ8B7Qh1yJRvBb0GT4wPTj1wI
	 hbJfDhqfp+7ggqH5AFoaq60IrqhqsbekJyEAaWMpJogGcpfMtUcKbqspJwn/QCfcxS
	 0197NRkY5U8Z3F/L3zFaTAHwDzFyOW9+nt8eKptTNhouAzLijKyVduk0YptUWzD6hk
	 5P1PD224YEuruHYIvIk42jfNx6FifBvwr+ZGkj+x9Nxpgt8V9/fV7aCVQyaeiMG3pA
	 AP/9nJVx4SgjAjQE2Re88frycf8nsHkQasSWqdpk+Jy8v5iNqIr2RAXEFsZRCMfmb2
	 o79myiZ8PutSw==
Date: Wed, 13 May 2026 22:16:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-kernel@vger.kernel.org, Deepak Gupta <debug@rivosinc.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
In-Reply-To: <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Message-ID: <590cf7aa-1e0c-6cc2-ab69-53d2680f9d36@kernel.org>
References: <20260406232304.1892528-1-rdunlap@infradead.org> <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org> <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Randy,

On Wed, 13 May 2026, Randy Dunlap wrote:

> This docs build warning is now in mainline.
> Should I ask Jon to merge the patch, given no activity on it?

Sorry about the delay; I'll pick it up as a fix.


thanks,

- Paul
