Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC273314C4
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049897; cv=none; b=VHKVEvmzGvUETUhopbOzgMmYv6h/iD5hLiHOX0JbjE4UMDcsqLCXWUEB1q8Me833JP+B9D4b3q6COCqRj9SUGgTXkR2pKRC6R+AKoYItDt1tIwQVOHy+LXtvIobCvOtKnHCaoL62cBrRNJ6j2/gYIXY/GFnMsY27g6awLMYs7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049897; c=relaxed/simple;
	bh=oQOU1B2a0yFZG9JoJPtJGj1mHA/OgnvlqIGtWX8O+X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1PGveG915SJGClMu5NpnRxuyvVS7fhx9EQvz6jeR3Dxm8ZS87tFHSEh7xZhofB+ep4GO694gVTwb2+iorSTU72Rq+GMz5xM9wwkI0SCUEdebQW3MixmH+oIQj92dtm9GF/4+puQfyuzxkHWFU8GMDodb2aGsaBUWZuj/ldTuhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=vu/tFaCs; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="vu/tFaCs"
Date: Sun, 26 Jul 2026 15:11:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785049883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vC2wwztSx7OP01WT93ZZNvUMEaAUne2nvEbzHyC5S1I=;
	b=vu/tFaCsfAgvanl0BfUxTF6K8WPutRhcsOdnf2J6g2X7LVTDrvl4Dj///k/IuE2BK36inE
	PUJ1g/tqcYHtYt7kv85dgHdpdjVRwU81aIHhdSmig4VLX+in3L4OGWhxUZ07R1hy3h6DFb
	+EHbPB9MRS2S+YCj9x9Al/4qZqEGviUqzMnUgvduYyPkQ3rCh+rHQCchRnDX17NyhRTt7p
	vLVs7llGLxvg/WXg5xTFmwh/sEDY9nEJSteuLez2/tXbSt56MKKCXZ75nX8bi46y5+7d5f
	2qPpdd2nfUfg5qJNBUZc1Verp1hNOxhFAm8d/yF0yNH49rtDxS1/n3dO7xS6Sg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_CN: add process/applying-patches Chinese
 translation
Message-ID: <amWzFbquJmSgNQey@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
 <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
 <alpbykBaX-8BkUzB@wyuan.org>
 <babde62f-9669-4f0d-b240-c79f450bbef1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <babde62f-9669-4f0d-b240-c79f450bbef1@gmail.com>
X-Migadu-Flow: FLOW_OUT

+cc Chen-Yu

Hi Alex,

On Sat, Jul 25, 2026 at 07:59:37AM +0800, Alex Shi wrote:
> On 2026/7/18 00:43, Weijie Yuan wrote:
> > On Fri, Jul 17, 2026 at 08:07:42PM +0800, Weijie Yuan wrote:
> > > Translate .../process/applying-patches.rst into Chinese.
> > > 
> > > Update the translation through commit fa04150b8ef7
> 
> Is it the original meaning: translation updated to commit xxxx?

My bad. I might misunderstand "update through" and "update to".

I originally thought that "update through" could only mean that this
current Chinese commit only updated the specific content from that
previous English commit.

Thanks to Chen-Yu, he taught me a lot:

In tools/docs/checktransupdate.py, the function
get_origin_from_trans_smartly() uses two regular expressions to extract
the reference point:

    update to commit <12bits-hash>
    Update the translation through commit <12bits-hash>

So both of them works.

But later he mentioned a few potential gotchas which perhaps would be
worth leaving a note here.

1. The regex does not enable IGNORECASE, so "update to commit" must be
   written in lowercase. If it is written as "Update to commit" with an
   uppercase U, the script will not recognize it and will fall back to
   using the author date to guess the base commit.

   This is particularly subtle because the script does not report an
   error; it simply produces an incorrect result silently.

2. The script only checks how many commits the translation is behind
   relative to the hash you specified. It does not verify whether that
   hash is actually the latest commit touching the corresponding English
   file.

   As a result, if you accidentally specify an older hash, the script
   may instead report that the translation is "up to date." Before
   sending his latest series, Chen-Yu manually checked every file with:
   git log -1 -- <English file>

3. valid_commit() skips merge commits, so a merge commit cannot be used
   as the base. 

Sorry I have not yet dug into the script in detail. So if any of the
points above are already documented there, I apologize for having
overlooked them. If they are not, we could add them to howto.rst, or
take a look at how the script might be improved when time permits.

Thanks!
