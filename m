Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139445106B;
	Tue, 20 Jan 2026 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924138; cv=none; b=rGVm+BF3+CfMX7SvN1cQZAYzRHeMsUtPb28zuUQCYtFpCTD4+qp00Th3KK7l1BtdAuFQadqBqOu/+eoLzJnlFafL5FL/koG5KC2gncAICoeIf8RLwrIORJ2A+FUdKeBRdN5IC/4hmUWOK9KlacGBNGffBnGcx9giFYq30q9grkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924138; c=relaxed/simple;
	bh=Sibm+aZ98LIkL5kbuZa070QHCHMd8TMrKU2FEeENzvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pCaGRMaOTw/1Vla2nfbz1uSHkBApxp4Dhhq9pNDFhWh1RytkGP45YX3/ehKZswbqykSxSeMiTWL5EA/nxUd0z17KKYnN/ioTXRtE7H4mbeijanvnKqtQmivIVtGbf/ZkgM/CSEWvASgbKe5PFhGATak3kc5VHL/CRQnW3RQmaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhkDiB2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhkDiB2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B08C16AAE;
	Tue, 20 Jan 2026 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924138;
	bh=Sibm+aZ98LIkL5kbuZa070QHCHMd8TMrKU2FEeENzvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GhkDiB2Vp1VQB8+q+3lgV8ww3kKRKo+NC2AOuTXsRDcK8rLtDeAOOvRR25qyOkbDJ
	 A15QFxATiZSqYrRwpleFYkpRYLHyPxiuJ0ALEULuUJHTcS7GR2Sf0CBPSCCtrVbTPo
	 GnLK5XOXviPq0Sdv++gz07BSE0UjK6kkHVQPh3AWLBoUMa2vtJ05mFEHn7Fttk2hUm
	 0aGYilay/5fTAwUq70c0ukjadN/sh5lIOaHib2CP6gc/G+dEu3I5kzIY+0Pg4kaITt
	 Nt2C9z4eMdxr/n+/INAP0hq5Im5Otbn83ml2ISTrZpUR2hmIW54KqlowRHJdPy9z99
	 YfikI/LkK4b6g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 1/6] kho/abi: luo: make generated documentation more
 coherent
In-Reply-To: <20260105165839.285270-2-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:34 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-2-rppt@kernel.org>
Date: Tue, 20 Jan 2026 15:48:54 +0000
Message-ID: <2vxzikcwe13t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> LUO ABI description starts with "This header defines" which is fine in
> the header but reads weird in the generated html documentation.
>
> Update it to make the generated documentation coherent.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
