Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF540DFB0;
	Sat, 18 Apr 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526237; cv=none; b=JcSinVE16pIOjPf1it+KX4zNZT29mxdlxwU4fmARkPctNVDflKYNHOhlfJxTt649OJpZs3y+RLV1EwmGJelEtQfiQPGVOJvN95iAdv+1Alg/4av3UcaZ3mGPU6kL9TBAVtBRuNhk7E/u+AxN5/mvwHehsALHVNIcs81QUvdA00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526237; c=relaxed/simple;
	bh=ZkqedO1+/KX2dVkAjxmTlTJE7OhLU/Oi+zD52I3fudk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3ATNi9NLYbl5bqHQJp46RRafkz/IFZ2oPs2HnjPlFWpX6cnmnuvQ3GtqQ82J1BVB2pD/4KNswnNvFxkB/9esIfdml8/lazkUxBI4ZSP1gJqjuMCmnEgkl5hFC995GwAFKnDiFoNEJ806BtB1v8ifUX0/tqf6pyKM5FMIFhPK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2Lpe7la; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2Lpe7la"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74699C19424;
	Sat, 18 Apr 2026 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776526236;
	bh=ZkqedO1+/KX2dVkAjxmTlTJE7OhLU/Oi+zD52I3fudk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2Lpe7laQ4FtpTW1u0i+4bKpSZ80WTLPFWjyydgWKSIZMgZhq4aXGnxpdHpsf05Uq
	 5PUJX/JbgiidwwND4yVJwvC8MdFg86SpRTD5oAAbDvL/OKm2uHeL9P1Iy5QEPS1Ws8
	 1jYVSiL+zl7MT6NoWc4Ry4Q7bP+Ks45iBExmSpmnRquK3YnFHrEjfjiviZzcPwTiuQ
	 mshk5ZddhUX3R1K8LYMh75MBcg2ZefkDN21+RmFvgrfObUqeFOb4aYoBgoVcmuXUbj
	 ZJZPYUBpxLzsJaXvP/AxewXBDfvAb41Hlqy7kCXv8/qrkvFY2TlNGOt9TKo2cTUqHT
	 Yr+WlTLh2TrtA==
Date: Sun, 19 Apr 2026 00:30:34 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Nick Huang <sef1548@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeOjmvP2nR6ri9qr@hyeyoo>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeMQ36jFnCKmCSyA@casper.infradead.org>
 <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
 <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com>
 <aeNKDh8S6pXHqRFh@lucifer>
 <CABZAGRGCwM1PiSxennV-Uy9y1gGKjpcHeq+eOAbqSZcy3Qb55g@mail.gmail.com>
 <75b2b254-2e02-43ca-9109-9812cf3f85b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75b2b254-2e02-43ca-9109-9812cf3f85b2@kernel.org>

On Sat, Apr 18, 2026 at 01:20:42PM +0200, Vlastimil Babka (SUSE) wrote:
> On 4/18/26 1:00 PM, Nick Huang wrote:
> > Hi Lorenzo Stoakes
> > Lorenzo Stoakes <ljs@kernel.org> 於 2026年4月18日週六 下午5:11寫道：
> >>
> >> On Sat, Apr 18, 2026 at 02:12:22PM +0800, Nick Huang wrote:
> >>> Nick Huang <sef1548@gmail.com> 於 2026年4月18日週六 下午1:27寫道：
> >>>>
> >>>> Matthew Wilcox <willy@infradead.org> 於 2026年4月18日週六 下午1:04寫道：
> >>>>>
> >>>>> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> >>>>>> - Add "Overview" section explaining the slab allocator's role and purpose
> >>>>>> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
> >>> Hi Matthew Wilcox
> >>> I will remove this sentence in the next version:
> >>> “Document the three main slab allocator implementations (SLAB, SLUB, SLOB).”
> >>> I’m not entirely sure I fully understand your point. If I’ve missed
> >>> anything, please let me know what needs to be changed. Thank you.
> >>
> >> No, please don't send any more revisions of this garbage, thanks.
> > 
> > thank you for your guidance. I will correct my work and introduce the
> > more recent `barn`, `sheave`, and `kmalloc_obj`.
> > Do you think this is appropriate?
> 
> No, this whole thing is inappropriate from the beginning. We are not
> going to waste more time on development-by-review for something that
> started as undisclosed LLM slop.

Just to be clear, Nick.

I'm no longer willing to answer all of your questions and request for
guidance sent in private as you keep ignoring questions & feedback
and still looking for other "interesting" items to contribute.

Let's not waste your and others' time.
I don't think this is going to work out.

Expect NACK on your future slab contributions.

-- 
Cheers,
Harry / Hyeonggon
