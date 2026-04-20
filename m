Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CE15746F;
	Mon, 20 Apr 2026 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667372; cv=none; b=uKLj60xmgmRpPzSi8iv7H+gE8EMw6nOfBnyvujgiTioGuKjeKQ0MV3h39D5yWB9wPJjUNLQBNsIiFmr20thgsjiRWo7KEGJ9WQTdiT2aY/e4oQ8r8S1QPOlG8OLuTbCXwZ+sGZdkNpaaQdpaL/GXX1kKwpJPsmVwpFwSKQdSCNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667372; c=relaxed/simple;
	bh=/8oTGofPNIwnGZ/hP8RSwOl+oZ+p6L7gCu2+01kkP70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZ3nS+MA8Fs/fwKDCI/mXG+TnTy1Pj1nXNeAsYqqKsY6CBy/Fkv8RouQFQrexaktWSTCWEITovo84aQFNsXxUtpRtUZYgY3LUVImoDtfekatQ+uomWf0Sc3sjT+DF/fA1rt9c42vTCuklCPJG52kwjql4XvUUqed2fNMBHc2pY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIEDycGX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIEDycGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59964C19425;
	Mon, 20 Apr 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776667372;
	bh=/8oTGofPNIwnGZ/hP8RSwOl+oZ+p6L7gCu2+01kkP70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIEDycGXtVBILbo3ZrjYk+ZzVYGUiLxlF+JHSDWmqeSlgLHZDSzvNmHDxVNAHbMSI
	 0w1xXf6viXXHoYY7jqbYOQcqHKXr6YuFz6YVjbiL/1L6fDcKTIbD1jgXYvBN8q/ZOi
	 KIODX3tHeiAQQX7nc4YkMvN+PZqz0iPfjrzJXMyYf3Ax42GEeTsWwpN1FJGte1lOHN
	 UBeOWNFubwZBZPrEVjwcnrgwth61Dq2u+74E4Pt1iEGpKU2QyQuhjN4/Tyja3Me/Yc
	 NNMgU1ltrUcLfDUssrpXwMjUXkMk+FRQc/m/rsR9vqVHJziuPTWmyi1vxG1dP70Qx4
	 H7hgUphnx8NhQ==
Date: Mon, 20 Apr 2026 09:42:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeXK4tjGFUgKDf5-@kernel.org>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeNGbNyPxJssnkbO@lucifer>
 <aeOuCH8ydw_yzdXZ@casper.infradead.org>
 <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
 <aeTTw4gziJigaNbU@lucifer>
 <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>

Hi Nick,

On Mon, Apr 20, 2026 at 12:52:25PM +0800, Nick Huang wrote:
> 
> I am really sorry for causing trouble for everyone. I would like to
> ask which aspect of mine was disrespectful, so that I can be more
> careful next time.

Maintainers time is valuable and sending LLM generated patch completely
without understanding what it is about is disrespect for maintainers wasted
time.
 
> If I want to make this kind of change, should I send an [RFC patch] to
> ask for everyone's opinion?

If you want to make that kind of change, you should start with researching
and understanding yourself what the code is doing, double check the LLM
output and verify it and not just take an LLM slop and send it.
 
> Sorry, I really am not very clear about the process.

Start with reading kernel process documentation:
https://docs.kernel.org/process/development-process.html

> -- 
> Regards,
> Nick Huang

-- 
Sincerely yours,
Mike.
