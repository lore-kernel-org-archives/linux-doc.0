Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B112930EF7B;
	Thu,  7 May 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191803; cv=none; b=hzl9tP1lbRODHG79MTPiyBfJTJy6dOpbBc0YS1O1ZR27QNCWaHDYuW1kKMvdhj5Vvfx5JWNzc+JPnhAdp2oNgCJJiiMqGK+Mnl8dJpojRv8XBcM3GId3blj5I0ve4H18dehtbDgW8Mvb/7SBWY/4HRvzdx3u9+uGlQiq37wyA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191803; c=relaxed/simple;
	bh=jTOX2TqyeO2cWkSnac14LlKPe5V5EVCnWKW2ovINUB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGeXWXp8htJB8qivU6y0oYXAiAWxLGvHHlN5QoArvvVrUAWb8a1VKow+S2L8yfYRa9Bqq3fXR0HDUi+mC3HwUNNUOiiR+ZmdPfU2P7tHZws4Efs+5nkijo86GS3hsVFX9EG1zim+fhicKk4ICDR4n6sS++tJUkSyOn9m9cXjTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DgGG2vvs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DgGG2vvs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4925C19F0;
	Thu,  7 May 2026 15:09:54 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3090A3F763;
	Thu,  7 May 2026 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778191799; bh=jTOX2TqyeO2cWkSnac14LlKPe5V5EVCnWKW2ovINUB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgGG2vvsVyzMfSGvMdlwVIEzP3CbT0HmzJKIO9QbZQmR/128UWPhZcbay7Ad8oSQK
	 S6YJNfbK60E98hpW5pRgQt24WSLV9NnPtbtg/1/O2TWDHSJ6zhFpTLjpQXDlYJGEGI
	 867B0mfya1qXjN68cKQnC9FyR+jxegDUxxLfJCNQ=
Date: Thu, 7 May 2026 23:09:48 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] Documentation: maple_tree: Clarify behavior when
 using reserved values
Message-ID: <q2dtphja7i45kknjk3bs4hn2bpictyoaideyjfbdh4sz4pxllo@xtsyvo3eztdb>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-3-weilin.chang@arm.com>
 <5qnwgdcxqat2zo5qe7qy63xm5awo5l4lkdkf4umbj3sl2ct5sj@v5c3szzdbbq3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5qnwgdcxqat2zo5qe7qy63xm5awo5l4lkdkf4umbj3sl2ct5sj@v5c3szzdbbq3>

On Thu, May 07, 2026 at 05:24:11AM +0200, Liam R. Howlett wrote:
> On 26/05/04 05:57PM, Wei-Lin Chang wrote:
> > It doesn't matter whether the normal or the advanced API is used if the
> > user uses xa_{mk, to}_value when storing and retrieving the values. Just
> > specify that the normal API blocks usages of reserved values while the
> > advanced API does not.
> 
> Your comment above is incorrect.
> 
> The normal API will filter out reserved values on return while the
> advanced API will return whatever is stored there regardless of the
> value.
> 
> Meaning, if you store a reserved value with the advanced API, it will
> not be returned by the normal API.

This is valuable information, thanks for explaining.
However, I'm confused how this shows my comment incorrect?

From the original doc:

<quote>
If the user needs to use a reserved value, then the user can convert the
value when using the :ref:`maple-tree-advanced-api`, but are blocked by
the normal API.
</quote>

To me this is conveying the following points:

1. User can convert the value with xa_{mk, to}_value() when using the
   advanced API if reserved values are being stored. This works because
   those functions transform the reserved values into non-reserved ones.
2. User can not use reserved values with or without xa_{mk, to}_value()
   with the normal API.
3. What happens when reserved values are stored is not clearly stated,
   but the normal API will block it.

In my understanding 2. is incorrect because if xa_{mk, to}_value() are
deployed, it doesn't matter whether the normal or advanced API is used,
they both work since the values stored aren't reserved.

Please do you mind pointing out what I am getting wrong here?

I was genuinely confused when I was reading the doc and trying to use
this data structure.

> 
> > 
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  Documentation/core-api/maple_tree.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> > index 87020a30ba69..e5ccafb84804 100644
> > --- a/Documentation/core-api/maple_tree.rst
> > +++ b/Documentation/core-api/maple_tree.rst
> > @@ -30,9 +30,9 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
> >  (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
> >  entries then the users can convert the entries using xa_mk_value() and convert
> >  them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
> > -the given data, so the top bit will be lost.  If the user needs to use a
> > -reserved value, then the user can convert the value when using the
> > -:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
> > +the given data, so the top bit will be lost.  Usage of reserved values is
> > +blocked by the normal API, and will cause undefined behavior if used with the
> > +:ref:`maple-tree-advanced-api`.
> 
> Which behaviour is undefined?

I originally thought storing reserved values could break the tree
because of its internal use (see 3. above).

Thanks,
Wei-Lin Chang

> 
> >  
> >  The Maple Tree can also be configured to support searching for a gap of a given
> >  size (or larger).
> > -- 
> > 2.43.0
> > 
> > 
> > -- 
> > maple-tree mailing list
> > maple-tree@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/maple-tree
