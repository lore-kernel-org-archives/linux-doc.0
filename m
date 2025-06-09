Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBC21E0AA
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510699; cv=none; b=indT8MGincSDGNc2PoHHUnKIjmPbolK88cNp6lInCg/kz14wPCJIkoEAAvbDwXY1KL1Wku/6bsYQlRUrXNiq3QtRml55yixDFRysa8YLnNgRlqjQ89RLSw2rmNt7UqrBt3ugZiAnESP+3XONuDJEXoeEdev2TWXZrGm7iOiDkds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510699; c=relaxed/simple;
	bh=YBYZyG/zejxervw8g2ljD323j9IDrb4e87zC59nYm8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuWHS/qvVFBDOcjjMuUeCjVBYmo190B5Hd4JR1hjJiVAsmp6GAbqE+nx43LM/8otqZ39599tb4Od6lItdmswefrxcOZvcwthYF0/1XsEGx6OObeKYKlTCTUqHOd3rfw4TAc95Cj91XNKqFvtrHC4IvqrYxz2SAItsDk+K11qY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fSxPFUEI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fSxPFUEI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sJ8/lWbF9HxjdniQadUJFWFi7JyWW8Wf0F5/EhKAG1Y=; b=fSxPFUEI153ULuPg0W8RAIEZG4
	UA30zezeL9sDPuU4843ynTlstlBKJAYYgGI8WQZvJWzRhNy+KLvmjLyeuuzfvlKYjUNEZOhK55D3U
	2tChFT11psyN4FpRshycHFG0TG3nHHhnfA6Bicw+cIVCKC2d4aUqvPqxrLBETpIpzrLHgwZK4D/Do
	lL2i0Pi7+fDrHx8PjW2Zh54EHaIQutPEIkVhgFXsLZFrFv5LlC3DUsIflJesUy9h73FevUnqFwbgR
	c0X1fCs/RTg3PwgVKGRQUOohWk6lHC+rP+RIntpbae5KQgDBJiRPGUdEw2xu1Ll5Gc5DzFCkErphR
	sYLIejKg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOleR-00000001hFQ-2SCY;
	Mon, 09 Jun 2025 23:11:36 +0000
Message-ID: <8b5ebc23-2885-4ab8-8b86-91e220567bbe@infradead.org>
Date: Mon, 9 Jun 2025 16:11:33 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify terms;
 added note.
To: Dante Strock <dantestrock@hotmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net>
 <PAXPR06MB8224F9CF845C22E7BE930624A76BA@PAXPR06MB8224.eurprd06.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <PAXPR06MB8224F9CF845C22E7BE930624A76BA@PAXPR06MB8224.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/9/25 12:17 PM, Dante Strock wrote:

[snip]

>        diff --git a/Documentation/process/2.Process.rst
>        b/Documentation/process/2.Process.rst index
>        ef3b116492df..70f8a6603454 100644 ---
>        a/Documentation/process/2.Process.rst +++
>        b/Documentation/process/2.Process.rst @@ -18,17 +18,17 @@ major
>        kernel release happening every two or three months. The recent
>        release history looks like this: ====== ================= - 5.0
>        March 3, 2019 - 5.1 May 5, 2019 - 5.2 July 7, 2019 - 5.3
>        September 15, 2019 - 5.4 November 24, 2019 - 5.5 January 6, 2020
>        + 6.10 July 14, 2024 + 6.11 September 15, 2024 + 6.12 November
>        17, 2024 + 6.13 January 20, 2025 + 6.14 March 24, 2025 + 6.15
>        May 25, 2025 ====== ================= -Every 5.x release is a
>        major kernel release with new features, internal +Every 6.x
>        release is a major kernel release with new features, internal
>        API changes, and more. A typical release can contain about
>        13,000 -changesets with changes to several hundred thousand
>        lines of code. 5.x is +changesets with changes to several
>        hundred thousand lines of code. 6.x is the leading edge of Linux
>        kernel development; the kernel uses a rolling development model
>        which is continually integrating major changes.
> 
>    I do not object to these change and could apply this, but it might
>    be nice at some point to rephrase this stuff so that we don't end up
>    doing these updates repeatedly. After all, we'll be at 7.x within a
>    year...

+1

>        @@ -48,9 +48,9 @@ detail later on). The merge window lasts for
>        approximately two weeks. At the end of this time, Linus Torvalds
>        will declare that the window is closed and release the -first of
>        the "rc" kernels. For the kernel which is destined to be 5.6,
>        +first of the "rc"("release candidate") kernels. For the kernel
>        which is destined to be 6.16,
> 
>    This is a separate change. But, of course, yesterday's 6.16-rc1 is
>    in no way a "release candidate". It's really just the naming scheme
>    that Linus uses for his testing releases, calling them "release
>    candidates" muddies the water and risks reigniting old debates.

I have also thought of -rc as "release candidate", but -rc[1234] are
"early release candidates" to my brain. Or the could be called -nc[1234]
as in "non-candidates."

> 
>        +Note that not all Linux distributions have the latest version
>        of Git +or Mercurial available in their repositories. Consult
>        the package +maintainer for your distribution to get the package
>        updated or +download it directly from the website.
> 
[snip]

> 
> Hello,
> 

Parts of this email style guide might be helpful in the future:
  https://people.kernel.org/tglx/notes-about-netiquette

[snip]

Thanks.
-- 
~Randy

