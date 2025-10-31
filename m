Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DFC3C17
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919420; cv=none; b=bhlwC1278aUne42baKVeO0fGdRtjUZK43HiveYtTuh9pHAVD3ayTIa/3pPBAf9Fu7+JzRvKL4YeyaIf9vIcn7FZBbrumnGEUtPO/OYxXByufLo5GgIuY/0xj5YSbJsbIBlFm33WAzmi1KJtABRZjJWsoZn2bqbhMGc3LLsD8+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919420; c=relaxed/simple;
	bh=aIGUb5vcRCCb77Dd4tNDiezyLr3CO2Ez5ENgg2+qbv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8zPh5KwXBK32JB6UL4NQN8e40hvluD3kDK6VYms89ARvV6e1bJmFPnx/X8wow69etDvHwo8qRtDFH70m+Fct4MGDI+qewRHJjPOgA79SjtUs6zJlbdvQqg51Dhsg6cbo5f/URSHd9RmJ+i/kNnxK7Hyr5FB5eDFLzBMS2VHVKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jAlAjlZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jAlAjlZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA05C4CEF8;
	Fri, 31 Oct 2025 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761919419;
	bh=aIGUb5vcRCCb77Dd4tNDiezyLr3CO2Ez5ENgg2+qbv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAlAjlZ4dvoykKLcZvjaoZyb1E91vXBGe7qOESmCD/7p6rKyHhyQSEupyQZBwR2yM
	 0QOUDPF28ntdeqbqqE8t3ESczdZM+eeoC+wNBSpCOhqarizK7DyNdAaqN3g1cGa5/I
	 7c2k7Fb9+yuI7l1R3+p5LpXd9cmSRiqRrldwzX2E=
Date: Fri, 31 Oct 2025 10:03:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later
 in args list
Message-ID: <20251031-impossible-excellent-stingray-4ea6a7@lemur>
References: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
 <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
 <87v7jxr9hd.fsf@trenco.lwn.net>
 <d1ade088-30d3-4ee3-8df6-ba240adf2ec4@gmail.com>
 <51a7cad1-e0c6-44fa-a7f7-50ecc95a58f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51a7cad1-e0c6-44fa-a7f7-50ecc95a58f4@gmail.com>

On Fri, Oct 31, 2025 at 10:25:56AM +0900, Akira Yokosawa wrote:
> > Today's build at https://www.kernel.org/doc/html/next/ still has
> > "6.18.0-rc3" as the version tag.  Other new changes in docs-next are
> > reflected there.
> > 
> 
> Now, the version tag reads "next-20251030".

Yes, this is now working properly, thanks everyone!

-K
