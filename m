Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D2047ECC6
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316554; cv=none; b=SViAWXzoB6PS1GlYsws/sV4wk7ayVxrl9T+C9XmKuO9YOS2J+YjgpT4n8GIDS8Dg18dazsFbESrhWJzeU/DX/0jFDAKidsx40nfdHW5y2ZDvr9bevKF6Jt0Qb+Lbv6djyvwovEBUtGTONf7XyOPaF0paZA+JV1fyTo2QeB5MTVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316554; c=relaxed/simple;
	bh=2oGvT9usEFd+lrRyyv2TTksGNvI3sMWvw69XnCkk2sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBSaJ3NjIU+OzIJ2mnKuGtr0WybCiqfsR4HL5IWuCJTfgyjJv1oC4JG6P9oT80xvc0RkX6ipQJlWH0v6yKG8arQQr0APmFnQpHY4km+SWFTDtXKHzsALm4b3HDuoyce/js1xShfcrw2hBw1IRWa+y/ltZ1gWDtIQngBVuEjOebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=lhkuzypo; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="lhkuzypo"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2oGvT9usEFd+lrRyyv2TTksGNvI3sMWvw69XnCkk2sQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787316544; v=1; x=1787921344;
 b=lhkuzypojXkPQKV3ues4KmVzrTzC+ecOTNRBnEcTD7cKFtF3/tHNWKxV6PyliETW+3C4YSbW
 AuTJ/8guO2OxTN9M2YIH7rTpwy8K5/nCOGnt5G/RFD/GRxBo+o0xIWMC/oYYaIzhL6l3QomuMyc
 WMUTHqqm+5ogZm5PraKyJGh6tDpO68PqgnDHCdaB3GnQ6yttLALfEd+EsabRSBhO5nRMvFTJ3vk
 Mf9eLLo9he7fuFyvX4aiY21HvnX8dRxQhky5X8wvxwXaF/oZf87Ea6UB6Ojfwqk4sObBuKaOQve
 +enMGq+3TPv7gkbao07KVWZNG2T7D17xCLfpSNtBwuAKQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 490483a4a4e8f585;
	Fri, 21 Aug 2026 12:48:54 +0000
X-Mizu-Trace-ID: 490483a4a4e8f585
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 20:48:44 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
Message-ID: <aohJLNK5Cqv1iMLd@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
 <aof8rCuuwzHUNtka@wyuan.org>
 <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>
 <aog87UzDIz20XzU_@wyuan.org>
 <0e437b53-5a44-406f-a482-518a6c09f7e2@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e437b53-5a44-406f-a482-518a6c09f7e2@hust.edu.cn>

On Fri, Aug 21, 2026 at 08:17:06PM +0800, Dongliang Mu wrote:
[...]
> > (I definitely won't admit that the log file annoyed me a few times
> > because I accidentally included it with 'git add .' and then had to 'git
> > commit --amend' right after) ;-)
> My experience is to not use 'git add .'. In Linux, hidden files are not
> listed by default.

Yes, I was being lazy to type the full pach/full file name, oops.

While hidden files are not listed by default on Linux, thankfully the
kernel source tree ignores .* via .gitignore. But 'git add .' is indeed
a bad habit.

Btw, git commit -v, or setting commit.verbose = true, can really save
one at the last minute. (as mentioned in our how-to doc) And sadly I
actually happened to use another computer to write patches last night,
which I hadn't configured it. XD

[...]
> > > > Btw I've been trying to know more about Sphinx and kernel-docs, hope my
> > > > mistake won't happen again.
> > > That change can fix problem. The underlying problem is RST syntax. Maybe you
> > > can have a look at this or query it in the LLM.
> > Absolutely. I did have relatively little experience writing rst before.
> > But that's definitely no excuse - I'll try to pick it up quickly.

> LLM is really useful to capture some syntax and semantics issues. Therefore,
> before submitting patch, use LLM to scan problem in this issue.

Got it, thanks.

> I am writing a draft skill for reviewing patches of kernel Chinese
> documentation.

Nice! I've been trying "b4 review tui" these days and I also made some
modifications to its pre-configured prompt to fit our specific
workflows:

  https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/misc/agent-reviewer.md

b4 review tui 'agents' - AI-assisted review:

  https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html#ai-assisted-review

Sometimes my agent makes false alarms, but at other times it does manage
to identify the issues that we have overlooked. This is probably also
one of the reasons why the community is gradually becoming more
accepting of LLMs.

Thanks!
