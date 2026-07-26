Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8B1F942
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785051184; cv=none; b=ivknnfjmHF8tpRvloqkUfHZ5f/i4TP3ViXQ3uVDm+oRlW+JiNA5hSYu2JaNu2wxCuEJkLUAIaNiQdOR5kTjCTtIRmryKyRH43pFsZtSvK3KLFYTbnQFybZBAiJtCkE+BQBraSi0QNulQn1BPeOBwRzpv57/+skOr2HnuaG6gdEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785051184; c=relaxed/simple;
	bh=LMDkApk8royLihhFE6lrHOk5oS1oTVfR/flPTk1fELs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgMCYJj2wPML96QdwGsQ0YVWUEmOsPGGSaY6ABRsaWLxlkcrEIzmsXKTd3ka26Q8KGpDnKNkw2Tbzghj+PM6rBg1I7fUmdtsTJO3PafUKBDCdHzjNBDvthcosc6HFYgvfPdGri0bZil7SfcHbXpnhg/Hm9RH6gfUxmWLj1gKZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=n7r5fmhF; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="n7r5fmhF"
Date: Sun, 26 Jul 2026 15:32:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785051170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLY5H8aMO+dFZNwQxO4ZbYOsaZdsYzvJTjnebF8LhL0=;
	b=n7r5fmhFds+2+5rjZsONauUC7IMmuaNVw3081n403K6sbuFV/o4UI7WbM7Rtirp++DbM9r
	L02bgZb//5oX3gwaUyQbxdmWctVYsAbhfpUjFA2yerSIL4OaoDw4xI8FLV0TxQwchb4rPA
	/4s8jqpd8RLzhh172d/LYZYqYe0CY3W0pA+rd6+niz0D1+AlYbP2zHlka1OhRRfOJ+My3B
	cE5Mml/6zgueGOSXuoRam/F+37ppApJzwKFNsQ5cKW1NfO9Vo1TVBmL/5Z7PywOw4Ks8Qs
	w7XGv+6JQ/ydW5TGQEd5aCEg/6omJNvQFHNsl/U0i5KTnxpVqKSfcFOMGTUqQQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>, Alex Shi <alexs@kernel.org>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_CN: add process/applying-patches Chinese
 translation
Message-ID: <amW4EVx9WzhAIA5w@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
 <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
 <alpbykBaX-8BkUzB@wyuan.org>
 <babde62f-9669-4f0d-b240-c79f450bbef1@gmail.com>
 <amWzFbquJmSgNQey@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amWzFbquJmSgNQey@wyuan.org>
X-Migadu-Flow: FLOW_OUT

Sorry I mistakenly dropped alexs@kernel.org, add it back.

(Is the forwarding address of kernel.org gmail.com? I was worried about
sending duplicate emails. So I removed kernel.org)

Anyway, sorry for the noise.

On Sun, Jul 26, 2026 at 03:11:23PM +0800, Weijie Yuan wrote:
> +cc Chen-Yu
> 
> Hi Alex,
> 
> On Sat, Jul 25, 2026 at 07:59:37AM +0800, Alex Shi wrote:
> > On 2026/7/18 00:43, Weijie Yuan wrote:
> > > On Fri, Jul 17, 2026 at 08:07:42PM +0800, Weijie Yuan wrote:
> > > > Translate .../process/applying-patches.rst into Chinese.
> > > > 
> > > > Update the translation through commit fa04150b8ef7
> > 
> > Is it the original meaning: translation updated to commit xxxx?
> 
> My bad. I might misunderstand "update through" and "update to".
> 
> I originally thought that "update through" could only mean that this
> current Chinese commit only updated the specific content from that
> previous English commit.
> 
> Thanks to Chen-Yu, he taught me a lot:
> 
> In tools/docs/checktransupdate.py, the function
> get_origin_from_trans_smartly() uses two regular expressions to extract
> the reference point:
> 
>     update to commit <12bits-hash>
>     Update the translation through commit <12bits-hash>
> 
> So both of them works.
> 
> But later he mentioned a few potential gotchas which perhaps would be
> worth leaving a note here.
> 
> 1. The regex does not enable IGNORECASE, so "update to commit" must be
>    written in lowercase. If it is written as "Update to commit" with an
>    uppercase U, the script will not recognize it and will fall back to
>    using the author date to guess the base commit.
> 
>    This is particularly subtle because the script does not report an
>    error; it simply produces an incorrect result silently.
> 
> 2. The script only checks how many commits the translation is behind
>    relative to the hash you specified. It does not verify whether that
>    hash is actually the latest commit touching the corresponding English
>    file.
> 
>    As a result, if you accidentally specify an older hash, the script
>    may instead report that the translation is "up to date." Before
>    sending his latest series, Chen-Yu manually checked every file with:
>    git log -1 -- <English file>
> 
> 3. valid_commit() skips merge commits, so a merge commit cannot be used
>    as the base. 
> 
> Sorry I have not yet dug into the script in detail. So if any of the
> points above are already documented there, I apologize for having
> overlooked them. If they are not, we could add them to howto.rst, or
> take a look at how the script might be improved when time permits.
> 
> Thanks!
