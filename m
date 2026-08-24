Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81E34404E
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550450; cv=none; b=aeOztDws+nBXqJ2TrYuqnMmu60BitJJS0798tLj9vkIgZjBI/wWZKxxPWHeY2pkVQydBDapdoorB37eU9ZYjjdlunzHMxJh0r2R+Vf8QISJj/slbH6AqxHxD9fHg6N5Cp57UrO84wV9v0kVh8AiyjhEdRVw3WqWwusKj31/H4Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550450; c=relaxed/simple;
	bh=ww4m+1C9cWp0jhCZrHJPvxxmsl7vr657BDYSroysXow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZA+NnEyryho4wO2drG3lXJPIU7OyigVs002whvXKW60DqdlIdZfyhPcUJSXAUN24qOpc0jzOI2TFzec+9cWb74smmRq0JrPFpiC40mAO1Um1LdUSQtnjE+ihEClgIR0lLi7MQFB9jFTJPY4NfpWaIn5lCBnX0wWP9m03vv9Tx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=gFNV7ZOu; arc=none smtp.client-ip=95.215.58.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="gFNV7ZOu"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ww4m+1C9cWp0jhCZrHJPvxxmsl7vr657BDYSroysXow=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787550444; v=1; x=1788155244;
 b=gFNV7ZOuWIJ9NHLqmMlhftWTP3p+xH5KXQBDYNtqNTHuSMzMkCRKKHjrXtQ+3pLs4Gb1Ede4
 9RtjejjbiYQ9uU9xqxKaYk1rw0vUUs2abblCr/QA/5upSmv5hM3J1qfBO4QujQlYRKWDxnQv3E3
 MOS9Ij/4eesKoOm/ah5xjDEFFMHwjDLeNZ9om7awE8cIaoAf2116fvJtB04/KojFemadxobDtJI
 rAARbNES8kCSWAmL+WGwjsDLlwuF6B9hpUJ6pMIZ929B8g0iPu/4glxgduAgb82qFex1ozzhbmX
 LppUDTZtATSqtYt3S/b3N0Vto2nkHWX6TJtpyYUk/1LiQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 0d9f46d43ee1f983;
	Mon, 24 Aug 2026 05:47:24 +0000
X-Mizu-Trace-ID: 0d9f46d43ee1f983
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 13:47:19 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Wu XiangCheng <bobwxc@email.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: update maintainer/configure-git.rst
 translation
Message-ID: <aova5zNnu4tGHeRJ@wyuan.org>
References: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
 <6c674f81-35ca-4074-b22a-b9ed6122ce6c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c674f81-35ca-4074-b22a-b9ed6122ce6c@gmail.com>

On Mon, Aug 24, 2026 at 09:59:47AM +0800, Alex Shi wrote:
> 
> 
> On 2026/8/23 23:13, Weijie Yuan wrote:
> > Upstream documented the common 'git tag -s' workflow and cleaned up
> > unneeded RST markup. It briefly updated the automatic lore Link: hook
> > for Git 2.41 and HTTPS, then removed that guidance because Link: tags
> > should only point to useful additional information.
> > 
> > Add a SPDX-License-Identifier.
> > 
> > Remove a useless top-of-file label, as Jon always tries to do.
> > 
> > Update the translation through commit 944df7a31452
> > ("docs: update the guidance for Link: tags").
> > 
> > Signed-off-by: Weijie Yuan<wy@wyuan.org>
> > ---
> > Hi Jon, I added a SPDX-License-Identifier for this file while the
> > original English one doesn't have one yet. Should I do that? / Is it
> > "legal" to do so? , if XiangCheng would be happy with what I'm doing.
> > 
> 
> I am not Jon. but usually changes should start from the original file. we
> don't add or change anything different from it.

Thanks, Alex. The reason why I asked Jon is because I have witnessed him
make some comments on this matter several times. And of course, you also
have much more experience. ;-)

And it seems that I haven't quite figured out how to handle this
identifier in different situations for our translation.

I also asked this question on another topic. The original English text
at that time did not have this identifier, but the Chinese translation
added it:

Quote [1]:

| The SPDX identifier of this translation was added at its birth, while
| the SPDX identifier of its original English version was added this year
| 2026. Although it has been added, I'm quite curious about whether it is
| "legal" to add the identifier on top of the Chinese translation while
| the English original does not have one back in 2023.
| 
| I know Jon has been a little bit careful about it, so I'd better leave
| my thoughts here for future reference.
| 
| Thanks.

Also, I need to take a closer look at the description of this
identifier.

Ultimately, however, I agree that our top principle should be to
maintain consistency with the original text.

Thanks!

[1] https://lore.kernel.org/linux-doc/20260823-maintainer-pgp-guide-v2-3-bea33b2ece54@wyuan.org/
