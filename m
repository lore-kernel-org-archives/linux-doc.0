Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C84233151
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733765590; cv=none; b=FC6bwXd6xetjBAZuAMH5HTPQyNSytWcGOq/7TY/gY/TPakj79e/kRTHOb8WE1wjJbQmJ7CxuWs2cm3UMTvWQ0D4pntNL6afFw1ZaP9YN9pB9mi+3HVfAywO2LuPDqdA2V9PstpdSaGAur/8rlvPHNz4tCvyKJBF6Qs+0ah92mHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733765590; c=relaxed/simple;
	bh=gVCx24NA02RU+IAQVaaJtFwrt9rrVY6XAOHyRRCAkXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MS+VKyfZnCwJPojmBmhJ4NWKwqyb/CeQbAZRssqqmD+nCp7SJhvhVO0WLd1QkBxrB/LYPPAdqHdsoNOB12p94wKlwYv8v3yWH9deSfULS+Co4jJ5mkt/QbuOeWNcQCkDjUVTCkZvim0O8GO+y29JRQEinAoRByf6P+X+RrR7eaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rfy+u31v; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rfy+u31v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WD2yrfW7Z7cuyxrZXZia4LvEBtq3c7HPo31QgdQZb80=; b=rfy+u31v2hM5Q0XP0ftsz4p3Fq
	8ZEA6ViqmU3xHnyfE7kNaxtaLuiMDRdChI/ZajoyrtQ12t8HghcSDv6f1RjU1ED0HDsAA/TSNphCf
	JC2C8++dPb6UYv7BFDCGfdvqzcLGoOxEqIQ+2oVm6fgCm7Qs0nycrEUx/lYsTy1z9Irgyr3RHkklR
	SG1k8G4SJzpx4Oo75DpLjMRdnLzRSer678CD3H4KZ8H1Cg9YLgGpqjCa24Tv598ClLwur1C0zuokT
	S2X591+lt1eFtJsBrwA62qcHX1lI0ZaZxwAJ/maK5Of17B6s5nH841lgDtaNhUFm5vLBNXcuVlaFZ
	T9fNnHtg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhd3-00000003Ypr-25GP;
	Mon, 09 Dec 2024 17:33:06 +0000
Message-ID: <5041114e-6337-40fc-b00f-51745676db46@infradead.org>
Date: Mon, 9 Dec 2024 09:33:01 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kref: Improve documentation
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241209160953.757673-1-willy@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241209160953.757673-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/24 8:09 AM, Matthew Wilcox (Oracle) wrote:
> There is already kernel-doc written for many of the functions in kref.h
> but it's not linked into the html docs anywhere.  Add it to kref.rst.
> 
> Improve the kref documentation by using the standard Return: section,
> rewording some unclear verbiage and adding docs for some undocumented
> functions.
> 
> Update Thomas' email address to his current one.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/kref.rst |  7 ++++-
>  include/linux/kref.h            | 48 +++++++++++++++++++++++----------
>  2 files changed, 40 insertions(+), 15 deletions(-)
> 


Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
