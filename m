Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A44ADD9E
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320939; cv=none; b=qdiQq7tDHKKjKCv7kV14947wfo/GWI38ILOwTp3CTpowho8H5unfP9rlurEAqFKHI2FMhDkiRXjnMafnCBJt/vY9RhAa+F5kFFSlsNZIzQeBahjAbKqN+p55Rg9w43Ujh4AEdK/FRVZ1BCkdDdo/jVGyIbsEqZZkZRm4gq13YiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320939; c=relaxed/simple;
	bh=5Bce8UCSpGUx7+bc/l8LPpYyHEbasaZ6iYSssOgAvqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOfwA6dae884l30vcUX4eoi4paVrW6q9RUzNesy8js74xXKFSYgI2LxE4EBbsoU8uzHEVp8sGkf7LxpVyWDsdBymNjtgl+PxfWhfYq6T26hNefO/jtb2jfZa1bCD1E6C7EledBqoAifiA4n7f8t/7oEPEGDwJNiSlRA/IjiJ6DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Hb607i9Z; arc=none smtp.client-ip=91.218.175.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Hb607i9Z"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5Bce8UCSpGUx7+bc/l8LPpYyHEbasaZ6iYSssOgAvqg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787320935; v=1; x=1787925735;
 b=Hb607i9ZbsSqHPgeSxhQS3pajOB/Cb4w4iPk5b+sebkoQVyAxwCB8I5I3QrP5g6MsN3Hkwq9
 7bX0FCzCHttGpxrlSGnt95Q1oQlCTF8rvCtaxblR8gnTNO39Th+DSpqse1aG0IhVhr3GwHyE+PQ
 IczOfCdRhR5ZEy4TvFl7GM8JY9KfeRlolyFyTdIyt06xBazhN/+wV0zYer9UungZlPbW84ZAbAE
 TmaFndbdniwqk5a9iimKY4/vOAVuxSaEHnrdno9Nle1R9MzYBRAzplrxgrMiTR70VkSyNrcVZyn
 fK7qtnG1zq7vYerth+xwwb4wOWbv3G4ggGQygH9KKklmw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 125b54dded4b0c04;
	Fri, 21 Aug 2026 14:02:05 +0000
X-Mizu-Trace-ID: 125b54dded4b0c04
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 22:01:57 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
Message-ID: <aohaVdbMM2T871-s@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
 <aof8rCuuwzHUNtka@wyuan.org>
 <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>
 <aog87UzDIz20XzU_@wyuan.org>
 <0e437b53-5a44-406f-a482-518a6c09f7e2@hust.edu.cn>
 <aohJLNK5Cqv1iMLd@wyuan.org>
 <771c1b11-f7d3-4a1b-a26a-b20187eeae59@hust.edu.cn>
 <aohOiXppk2Px7SXx@wyuan.org>
 <b7c913d1-578b-47c1-a2b7-c1420deb4d21@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c913d1-578b-47c1-a2b7-c1420deb4d21@hust.edu.cn>

On Fri, Aug 21, 2026 at 09:45:26PM +0800, Dongliang Mu wrote:
> On 8/21/26 9:11 PM, Weijie Yuan wrote:
> > On Fri, Aug 21, 2026 at 08:57:46PM +0800, Dongliang Mu wrote:
> > > On 8/21/26 8:48 PM, Weijie Yuan wrote:
> > > > On Fri, Aug 21, 2026 at 08:17:06PM +0800, Dongliang Mu wrote:
> > > > [...]
> > > > > > (I definitely won't admit that the log file annoyed me a few times
> > > > > > because I accidentally included it with 'git add .' and then had to 'git
> > > > > > commit --amend' right after) ;-)
> > > > > My experience is to not use 'git add .'. In Linux, hidden files are not
> > > > > listed by default.
> > > > Yes, I was being lazy to type the full pach/full file name, oops.
> > > > 
> > > > While hidden files are not listed by default on Linux, thankfully the
> > > > kernel source tree ignores .* via .gitignore. But 'git add .' is indeed
> > > > a bad habit.
> > > > 
> > > > Btw, git commit -v, or setting commit.verbose = true, can really save
> > > > one at the last minute. (as mentioned in our how-to doc) And sadly I
> > > > actually happened to use another computer to write patches last night,
> > > > which I hadn't configured it. XD
> > > Actually these labor-tensive works should be done by LLM. This is one of the
> > > right directions of LLM usage.
> > > 
> > > You can write a simple skill to help you complete these works.
> > That makes sense. I'll give it a try. Still, given that the kernel
> > community tends to be a bit conservative, I've generally tried to do
> > things myself. Of course, the most important thing is that we supervise
> > what the LLM is doing and make sure it follows our actual intent rather
> > than hallucinating.
> 
> My experience is to always double check the result of LLM.
> 
> However, to be honest, translation is not a complicated task. Sometimes LLM
> proposes greater translation than me.

Aha, yes, I said that in [PATCH 1/4] too. ;-)

> And LLM is really good at capturing some common problems in the patchset.

Yes, agreed.

> > > > > > > > Btw I've been trying to know more about Sphinx and kernel-docs, hope my
> > > > > > > > mistake won't happen again.
> > > > > > > That change can fix problem. The underlying problem is RST syntax. Maybe you
> > > > > > > can have a look at this or query it in the LLM.
> > > > > > Absolutely. I did have relatively little experience writing rst before.
> > > > > > But that's definitely no excuse - I'll try to pick it up quickly.
> > > > > LLM is really useful to capture some syntax and semantics issues. Therefore,
> > > > > before submitting patch, use LLM to scan problem in this issue.
> > > > Got it, thanks.
> > > > 
> > > > > I am writing a draft skill for reviewing patches of kernel Chinese
> > > > > documentation.
> > > > Nice! I've been trying "b4 review tui" these days and I also made some
> > > > modifications to its pre-configured prompt to fit our specific
> > > > workflows:
> > > > 
> > > >     https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/misc/agent-reviewer.md
> > > > 
> > > > b4 review tui 'agents' - AI-assisted review:
> > > > 
> > > >     https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html#ai-assisted-review
> > > > 
> > > > Sometimes my agent makes false alarms, but at other times it does manage
> > > > to identify the issues that we have overlooked. This is probably also
> > > > one of the reasons why the community is gradually becoming more
> > > > accepting of LLMs.
> > > Ah, this is interesting.
> > > 
> > > My skill is to use LLM to search the patch name, use b4 to apply patches and
> > > finally ask LLM to refer to how-to.rst and review the patch or patchset.
> > As Chen-Yu mentioned before, I´ve basically trained myself to find
> > almost any email in the lore archives manually. ;-)
> > 
> > And yes, every time before I send a patch, I have an LLM check whether
> > it follows the instructions in the how-to.rst.
> 
> Please take a look at my review:
> 
> https://lore.kernel.org/all/b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn/
> 
> The first comment is from Codex + ChatGPT.
> 
> And my skill complains the following warning:
> 
> https://lore.kernel.org/all/7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn/

I'm looking at right now ;-) because I'm at the "blame" line already.

> > 
> > > And I think we could try to add our subsystem to sashiko. What we need to do
> > > is to write some subsystem-related prompts.
> > I was thinking about this a few days ago. I'd actually planned to talk
> > to the Sashiko maintainer about it first, but I haven´t gotten around
> > to it yet. As far as I know, though, Sashiko can currently only be
> > enabled based on mailing lists; it can't filter or match patches
> > specifically for the Chinese translation subsystem.
> > 
> > Overall, though, I´m in favor of enabling Sashiko for us. Having an
> > extra pair of automated eyes certainly doesn't hurt. That said, some
> > settings may be worth discussing - for example, whether the Sashiko bot
> > should be allowed to send review comments directly to the original patch
> > thread.
> 
> Maybe we can do some tricks in the prompt. docs/zh_CN: is an obvious signal
> for us.

Yes, I'll take a look at it later.
