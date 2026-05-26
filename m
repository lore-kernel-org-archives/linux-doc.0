Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE143D8908;
	Tue, 26 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788375; cv=none; b=GNXokhqovmERtxch+ncTyxzwuVC5az1HoS4qpZE2xIasbnSlwXxLDICmQ4lom5VHsIb+DdGWFx7bc5GovNNWP/MakYN09ePAg3xivDYvmBEgxhF0uj5QrLaT5bgapLswXtWlx1n4Y6kMltQTlk1LJlzQStghKmnfOpG3CkERL0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788375; c=relaxed/simple;
	bh=oMmoMD+GjALPUvOfptwGTWbIMDRQTKkEmSqw2+XfJvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl9gs1Z5EPQewAcmIelSe/KaexcMS/2+O9nAp4f70ZdFPOflTzkD8a6VK7s4awDTuSDfPt6iLh/rkkYzhtguSuyThyvFSe8nKTxYaCcMvyBeEXKXZeTqCfWqSpNBqBe4FqBTFu0F5bGLgOTp2+Q4nHf/7eH6tejVLGk1Uc7o84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qoNEcAdf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qoNEcAdf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7FFE16F3;
	Tue, 26 May 2026 02:39:25 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89FF53F86F;
	Tue, 26 May 2026 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779788371; bh=oMmoMD+GjALPUvOfptwGTWbIMDRQTKkEmSqw2+XfJvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoNEcAdfIv6OxKiwWgg6Qodpo0AIVqevYc0ITRnZAVuHBGkLI45Yq0n51FQdVnUxw
	 /dsmasqhbW1eQwcvx3sjeHlUbewhgu3PlcuPlBOFrfUIySQqZfR4rEEJhaIrCtY3Ef
	 jX2igp5g1BVy3pANfLTkrmgkzVtcd50TqMTT1+eU=
Date: Tue, 26 May 2026 10:39:18 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] Documentation: maple_tree: Clarify behavior when
 using reserved values
Message-ID: <uspsobhmhxsuw6f6nwmug3jqcyrhhhhzcnt2gqlx2lxwzknc44@vvyqe5snqtjg>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-3-weilin.chang@arm.com>
 <5qnwgdcxqat2zo5qe7qy63xm5awo5l4lkdkf4umbj3sl2ct5sj@v5c3szzdbbq3>
 <q2dtphja7i45kknjk3bs4hn2bpictyoaideyjfbdh4sz4pxllo@xtsyvo3eztdb>
 <kkunuk6hph3uwljo26qqgskczsodydsxvbadycube6n2rldjba@rz6of4335slj>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kkunuk6hph3uwljo26qqgskczsodydsxvbadycube6n2rldjba@rz6of4335slj>

On Tue, May 12, 2026 at 04:50:36PM -0400, Liam R. Howlett wrote:
> On 26/05/07 11:09PM, Wei-Lin Chang wrote:
> > On Thu, May 07, 2026 at 05:24:11AM +0200, Liam R. Howlett wrote:
> > > On 26/05/04 05:57PM, Wei-Lin Chang wrote:
> > > > It doesn't matter whether the normal or the advanced API is used if the
> > > > user uses xa_{mk, to}_value when storing and retrieving the values. Just
> > > > specify that the normal API blocks usages of reserved values while the
> > > > advanced API does not.
> > > 
> > > Your comment above is incorrect.
> > > 
> > > The normal API will filter out reserved values on return while the
> > > advanced API will return whatever is stored there regardless of the
> > > value.
> > > 
> > > Meaning, if you store a reserved value with the advanced API, it will
> > > not be returned by the normal API.
> > 
> > This is valuable information, thanks for explaining.
> 
> Hmm, maybe I answered too quickly here.  We filter out XA_ZERO_ENTRY on
> normal API searches, which is in the reserved range.
> 
> > However, I'm confused how this shows my comment incorrect?
> 
> It matters if you use the xa_(mk, to}_value since the top bit will be
> lost.  Re-reading your comment, you don't specifically say that though,
> you said 'if the user uses..', so I was confused by your wording of what
> you were saying.

Ah, sorry for not being clear.

> 
> > 
> > From the original doc:
> > 
> > <quote>
> > If the user needs to use a reserved value, then the user can convert the
> > value when using the :ref:`maple-tree-advanced-api`, but are blocked by
> > the normal API.
> > </quote>
> > 
> > To me this is conveying the following points:
> > 
> > 1. User can convert the value with xa_{mk, to}_value() when using the
> >    advanced API if reserved values are being stored. This works because
> >    those functions transform the reserved values into non-reserved ones.
> > 2. User can not use reserved values with or without xa_{mk, to}_value()
> >    with the normal API.
> > 3. What happens when reserved values are stored is not clearly stated,
> >    but the normal API will block it.
> > 
> > In my understanding 2. is incorrect because if xa_{mk, to}_value() are
> > deployed, it doesn't matter whether the normal or advanced API is used,
> > they both work since the values stored aren't reserved.
> > 
> > Please do you mind pointing out what I am getting wrong here?
> 
> I think you are missing the part where the top bit may be lost?
> 
> I also don't think the reserved values will matter if you use the
> advanced API exclusively.  You would have to filter the special cases or
> whatever you want - that is, if you mix the interfaces then you may see
> odd behaviour in regards to the special cases in the normal API while
> the advanced API would return the reserved items and need to be filtered
> at a higher level than the maple tree code.

I see.

> 
> > 
> > I was genuinely confused when I was reading the doc and trying to use
> > this data structure.
> 
> Then we need to rework the wording somehow.  Thanks.
> 
> > 
> > > 
> > > > 
> > > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > > ---
> > > >  Documentation/core-api/maple_tree.rst | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> > > > index 87020a30ba69..e5ccafb84804 100644
> > > > --- a/Documentation/core-api/maple_tree.rst
> > > > +++ b/Documentation/core-api/maple_tree.rst
> > > > @@ -30,9 +30,9 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
> > > >  (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
> > > >  entries then the users can convert the entries using xa_mk_value() and convert
> > > >  them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
> > > > -the given data, so the top bit will be lost.  If the user needs to use a
> > > > -reserved value, then the user can convert the value when using the
> > > > -:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
> > > > +the given data, so the top bit will be lost.  Usage of reserved values is
> > > > +blocked by the normal API, and will cause undefined behavior if used with the
> > > > +:ref:`maple-tree-advanced-api`.
> > > 
> > > Which behaviour is undefined?
> > 
> > I originally thought storing reserved values could break the tree
> > because of its internal use (see 3. above).
> 
> You can't break the tree by storing reserved values.  The normal API
> will outright not allow storing it while the advanced API will store and
> return it.
> 
> The issue comes from when you mix and match - if you store a reserved
> value using the advanced api and then iterate through with the normal
> api, some values may be lost.  Today, that's XA_ZERO_ENTRY only, but we
> reserve the right to change that if it is necessary for some tree
> version.
> 
> Does that make sense?

Yes! Thanks for taking the time to explain.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Liam
