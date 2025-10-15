Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C952D593B
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546093; cv=none; b=EISil46MDybfbATVcQIYppG5YtxQLlhc3wAPlrMijf2Jnu07VtPQ8+bDmHHnGa9IkU5yaU3HDRH1ft6vhNy2MZcbA8J5gwQFF6hgaUs1zN1Co/DHQ5iRMWMZC3UwcN3P/EhJcuMegTDaK1Qk6+NG2T53n3EpCWrbNtCeNicPPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546093; c=relaxed/simple;
	bh=8Uj25XmPqiqgNApOOsTcFoqu0/l/zlTJnwyJAYuubnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iAbhc0i8Ve9zDf5oVfmqtwlyaR84JqlFXwO2nGB/kNW31aGyAff+n2sqO334rIxZJg2YWEZFlXAmyrsTYrd4WIVCIuPVmcKaCYG9tHBvn2dG9Gf/SgMM2ZJ4RBYFcZsAiER0yz483wvhQVbY1cvvRjjeiaPeQr4b2LlZuXxAHhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NlWIkTdH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NlWIkTdH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=9HBF2RortDOHymFxvOGd5bFZGUX2+vNSWpEwCcyMy08=; b=NlWIkTdHdTS/LbVX8GY00sfbSB
	qMqG8bXNfL9VZ8cKdifpvcYutOanW5LG3ML0BRbpQFAGeavGA8psB/KnawM9AXCyd6XWtv80pQ1kg
	G1oKzuwwj+EPufOG+u2oSd0jieWPz5Ch7TswKdRyFy+AR8PJffWs8YHUWBvI60qTh0MptA+yTsmz5
	GtEENCToibEBg0rPxmB1DwJY+FE3XpVFzL0IH015TqBffdMZk93N4vomBrjItgSkhRQsh6Sow/HEr
	64WEP75PWYDhVfGMZxAoWiQg/3E8KJ1J719/ZwR7nuNxY9EDrH8ipZYDjnPKBrFteXS6l/H23v2w6
	PP9FZieg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Sg-00000002IoV-1Aev;
	Wed, 15 Oct 2025 16:34:50 +0000
Message-ID: <0ca2b37c-c3a7-45eb-8c81-83c798e00639@infradead.org>
Date: Wed, 15 Oct 2025 09:34:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: admin-guide: Correct spelling of
 "userspace"
To: weibu@redadmin.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <1760540376-6149-mlmmj-2f9fba2d@vger.kernel.org>
 <01e4150998aa10bc488e4e5e60dfce1d@redadmin.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <01e4150998aa10bc488e4e5e60dfce1d@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/25 8:21 AM, weibu@redadmin.org wrote:
> Thanks. This patch was only to fix the overt typo "userpace"; no treewide wording change intended.
> If there is a preferred style for future docs ("userspace" vs "user space" vs "user-space"), I'm happy to follow it.
> 

No, we have plenty of each of these. No need to fix anything here.
Thanks.

-- 
~Randy

