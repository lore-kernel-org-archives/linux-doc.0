Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856001;
	b=WoX55UB7q6+WjMraC6CYCFLoJaSNZj6s2VEqNnHAc6wwJRKdepCbDXe3+ullTZ58+5qv
	 e02K3yc6VmyF3ykVYdabIIOUzcjBbQUgaci/Dqjr/RoiiQGteS35bCzEtRhFNmdVdJV46
	 rNeGJuYFiXVoSowobQizmY73Io4393jGrjGnTRauLv41vJ15xZGI1p3pCBDmnTjchAvLt
	 181o8LS+JC2PvDwglYS8GFgEqyMOKH24GIT92LmpXVUNsj1UfBnjdwtL3Q8mn1O/gddLx
	 6lSnb+FZX/UwQcuOAKtwZIiaQogO2GfKGhphAwnegKhr48gHrQYjr82Yfj0ozyyroDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856001;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=24oBY7xjgwOJ3yyvgEh7J4P3UyCLoIMlq+5kd0ulOU4=;
	b=DdbwvVnLhN32tczWcAI9d/QO7wW8GHSclgocUTAb1+KBbdRlgOnLLTpFvFH+oJXAxCMj
	 j/G/5paV1QZxqKnO+jAWwAZNyHFt1lwyYdCApw+m6auaOlpbvBUuhrtRtfaTn9U9pO+Sl
	 fI/EIkzH15vgfOujNyiMIP7XkkhrSw3LMyN4sH76+szDFxz7eFJuPN9wesGH+pQ5tNoDg
	 S28JH+e4unFk9AIEXB/9sZsvv65d4XdwJWIAXEw3hngIFWZwwCU8fPaZf7HSV5idHyqLd
	 5x8zAtRRPpjwCT7aLugkmQxldaJHmAY/Ws7HeybrcDvpoAawAEoffa6NTvDHCt9hN6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=RmPXPgXu;
	arc=none smtp.remote-ip=95.215.58.34
Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870B606A31C
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 08:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1870B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=RmPXPgXu
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5pEmEQ274n3Zky1EJZiZDot0lUoJDPGX4znbg8xvVQk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795855998; v=1; x=1796460798;
 b=RmPXPgXu3DQZheczbNiqgavme1H8+hy9thLjbMsYxDBy6+RE9GhSE8h7k97oHnbYL2k7HYV8
 ZEwkg3Ku+W2lQymXXKutAsEpJjcFv1NiD5gshjPN/xLZQjAdvw5n7sYIxSag0HNVZN0kELaIG87
 K/M23LB8KnbFtYb73IBPzfXgJCDJrSNG3vuQ3PfT1oz7YUIUKXOdFzfSDhdPHWx4sivQfGSP05t
 x6T/N6YbTquKmjazN4vSPf1sTuBdftyiCL+0dJG9dfETEOhyACB0z6Hq+XyTwg7Bkq8xSvbrmGK
 js26P2Q4mN9mPUHppA/pw0joEDWgEy1pWUYeWjSHdCwJg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7c492602e54b1734;
	Sat, 28 Nov 2026 08:53:17 +0000
X-Mizu-Trace-ID: 7c492602e54b1734
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:53:13 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yikun Wei <YikunWei@126.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] docs/zh_CN: Add four process translations
Message-ID: <awqWeTBMI9jJ2nll@wyuan.org>
References: <20261117115527.27937-1-YikunWei@126.com>
 <avxh6NCMrsJI3f_x@wyuan.org>
 <363BC4B1-D712-4EAE-96A3-6F4A15BE6377@126.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363BC4B1-D712-4EAE-96A3-6F4A15BE6377@126.com>


Somehow our list rejects this mail, maybe because the "Content-Type:
multipart/alternative;" header.

Anyway,

On Sat, Nov 28, 2026 at 04:09:03PM +0800, Yikun Wei wrote:
> Hi all,
> 
> Gentle ping on this patch. It has been a week since the first
> review comment from Weijie Yuan. Happy to address any further
> feedback.

Thanks for your follow-up. I suggest you could try to interact with my
reviews first so that it might get more interests from other reviewers.

Please don't get me wrong. I may be off the mark on some of the points I
raised in my review. The questions were genuine, and I'd like to hear
and know what the ones on the thread thinks, of course including you as
the author ;-).

So in other words, do you agree with all my comments? If so, I
personally appreciate much more that:

"Do not let an updated patch series be your only response. Tell
reviewers which suggestions you plan to use, which ones you disagree
with, and when a comment leads you to consider a different approach. Use
these replies and any follow-up discussion as input when preparing an
updated set of patches."

So now you've got a review from me, then please let me know your
opinions or ideas and perhaps wait for reviewers' ack (if different
ideas come to you when replying to reviews), after those you can sent
your v3 out since it's already over a week.

Thanks.
