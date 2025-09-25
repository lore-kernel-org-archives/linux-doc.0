Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5B831A06C
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758825446; cv=none; b=QQFX2xTgTdbyVUsXY0fhLO8nUwiMJAPbVPSdesGCxFBVxBk39pKDyCdkuVjUy/4rGxScmYPFSaCNtfvzyVqtU/RqiWWaLqaSBBHofyNo58g4MFPV4NXbxruz+y7yO9zCwQRuM15TCLBWJpepE5ZDNpw7BehjjvPjedaruLeMOms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758825446; c=relaxed/simple;
	bh=mQRAl77ydUW6Be6dG0QITiA9uakAuYu2yHTh4CekeR8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=O83T6syYTslVgxvqXz2jOfzb0Q4LIpmKSy7aeMRjrtDQVpFgmXwcU86vnIeIW6PJId2m74BeFN35gsFkV18WpNpR60YWygQatVC7VZyI8oZgtivCsxHCRT6WekdaC2NyfOW0/Py6fQcvC9Gww5DQFP+c6LGOFzxBYfEFot67C24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DQ60Jick; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DQ60Jick"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=AriquNS/B2uB3EzafQHVsZYT5QQJ7TAIrnmG3+S2j4U=; b=DQ60JickjrHONlOsHaibzh9dfS
	ZZgfbiuGzpr6K0Tfb4sTa91dlRxpQtFcs1O56VUSomtq/BXSzF87dJ9httMqsrgd7Zexsz5l7Ragh
	DDwrjEDfIQ7ZzrzBUSAmtUJ9HWETA9JmF2zq4MoWdAuVRwYJ9kXROSr6aaFavwOeW/YoKAnvsCHL4
	dDYKnvOrhfxx8Oh94Il5A45pBUWg2nSK0tjy+/cpEbWcqd2DAvFJGn5ent+CSjmDrTN+fV0UbwuPA
	//7DalWDBjbkcFNyb9LKm1wawaHPKRXb4xWzSpnHViMlzubWU1bgLslcxooPHnh3e2XDMWBFRQbPG
	gtlHEwOg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1qqK-0000000BzBU-2Cbc;
	Thu, 25 Sep 2025 18:37:24 +0000
Message-ID: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
Date: Thu, 25 Sep 2025 11:37:24 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: make mandocs questions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

I'm happy to see that you added mandocs as a docs build target.

Would it make sense to place the man output files into various
subdirectories?  On linux-next-20250925, I have 76402 files in
the man/ subdirectory. One time 'ls' told me something like
"command line argument list too long" but I can't reproduce that.


Is the output produced just by scanning the entire kernel
directory structure? That may be too much subdirectory structure
for the man output.

Or would it make sense to include the source file path in each
man page?  E.g., if I am looking at fsl_asrc_sel_proc.9,
include something like "[from sound/soc/fsl/fsl_asrc.c]"
at the top or the bottom of the man page?


Can we get more meaningful output info for warnings like these?

Warning: 385
Warning: 389

I see 9 warnings like these.

Thanks.
-- 
~Randy

