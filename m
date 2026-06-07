Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE42D6E5C;
	Sun,  7 Jun 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810857; cv=none; b=NfrrgX7u92xXESvhiTidQaIsXlG9ol14ZZA4ofT4Q+pAA0rMoJ6uUPlS3GSqTZE7zbeZIn8PaJhdL9GRi1Wx0ZA/szfX9B4hLUDS6a0V/SHl91LNV/WqBrcNLM9r7M9t5MBevu/re2HZIs0CZkS5jq2it9/B9admXel8uW2zqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810857; c=relaxed/simple;
	bh=dUyFbC2koV/kZGMWMfTq7zQcssTYFrEFRwZsEr1ZynQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bwZGqg0jVTPnp5fUoiVJvpCjXmtjs9lKtUA7+ZXDzPe3lbIbqYo9lA/sC1FIfigRNVywxuPQjDeZaYVYK6hTwcFGlszp1Qwi+0RJWGORnDzLkdCQOAEGeT4IP7lyNkGnyeF0iLScKTdITIAQskYr8yxSB8TPZ3zW57jH/M8NFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH0fXT4a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH0fXT4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F5D1F00893;
	Sun,  7 Jun 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810855;
	bh=b7TWqZpXo9m0twdnETZaCSpwwDJItYnjhbOEas7Kni4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OH0fXT4aexoxL3cc0AMzNVuAHnv6cvmkPt20x0NyrjUPQLqk1L+BAVTJ+XfN+0gkP
	 OMfb8ALvfRO53XRZKW1gb2RHvwJSs4TpHDH3aD3eiIHlHyhmP/L0RpKxwUG+v4mjOa
	 jBiVUXsoYKVwZ4m8SA7wIIVPtFiXuszclruaUm+RHQGlWtS8gYsBuGws5Tn9kokFg/
	 fPbtUGHWsI83SxsbpnlKOCzhKDSzYyO8Lmat+pT96B7XebVYgAWIkDOdA18++vPBFQ
	 xvFFWZTbKT7t5rXBxz/qwQzsLim5nWZ69nDWqV7nnKpUnoTE6D6M3mhxLZJ843BEf6
	 z0ppglrgK5LeA==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org
In-Reply-To: <20260605160645.3650271-1-pratyush@kernel.org>
References: <20260605160645.3650271-1-pratyush@kernel.org>
Subject: Re: [PATCH] docs: memfd_preservation: fix rendering of ABI
 documentation
Message-Id: <178081082228.1643309.7441148315833852918.b4-ty@b4>
Date: Sun, 07 Jun 2026 08:40:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 05 Jun 2026 18:06:44 +0200, Pratyush Yadav wrote:
> docs: memfd_preservation: fix rendering of ABI documentation

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/1] docs: memfd_preservation: fix rendering of ABI documentation
      commit: 3a358c78093f98a70d84c934b7054f636bc846f2

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.


