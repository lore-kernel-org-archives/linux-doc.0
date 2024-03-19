Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490F624B33
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710860919; cv=none; b=HBGYZZEGuHA4lyM4pBNZyPA6HmWEFfbjqwdvn1ZCElFoJJdGprQ5WFsBWOBQ1HF3Z2dj0w8ngyl3a67sNPNZVb0XLIKGO6ahm7KFwgJctsoCvVXahyYHDESuZ9J6vfhwu3HtsMxJEu2qEjHhrwn7oCSeGjr+otGlRlKjGcCV9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710860919; c=relaxed/simple;
	bh=sxZN2o95urbMPRfwNt4JUA4DiyRQ8wmJf5b6Ku3zJGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XStg2uhL1zMU6NDMClYlnMmjt9GGl7PO4akyEqzD7eeNY8kIbhjFvIlkopDFwDDG5GUzVgybaK4j7AuyflaSBBw7aSTtzCLn9wWSKBk/k/OnFuC/GEpYrU7UvyJM1X6CcuIMRt6GjaDoBXZA/1jNDGCoVDYtkAOztOB34rLroEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vFVWE8mO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vFVWE8mO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=P6ej6SicWvP76LY/cndAHkrsNLu3shgwHIWA+agxRJo=; b=vFVWE8mObA3NJsFATKbd6Tt09w
	KDzEiSeajt1BBBGEQBgvTRirX3ExxaHdXeiASpcnuIskeus15adoCt7Nx71402/369HjtDBeHeCvM
	dazWrIcHHnj7kIej6A9vL8fGEWnrOCiSgVYQaRnsDB8deGqSozb1gRuhHNhk7wi4m5KHdLFdEKHMY
	dEedY4fVv0Eaf+vxct7+yI5ONG0gBvI9Drs7oZ1Mi4MQXXga4mAGKpbs9yHgTZfrxUsv57oJ5Gfet
	anIsrcICndYslAuDqXerMfeVLaQ2WP+37OKPZxxH2YlFF/xfbfc1WBbY7dBEoDVrjg84u3cngbk8d
	yqPHU0tw==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmb4u-0000000D5B4-2CrH;
	Tue, 19 Mar 2024 15:08:36 +0000
Message-ID: <2ca49f75-6ca6-4006-a332-554aa85399e2@infradead.org>
Date: Tue, 19 Mar 2024 08:08:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Document Patch
Content-Language: en-US
To: Linem Davton <linemdavton@gmail.com>, linux-doc@vger.kernel.org
Cc: trivial@kernel.org
References: <CAHAQYrN7_0+gi2p=fYPpHHMdOk2jwx9cX+nbovynphU8zSAZ5Q@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAHAQYrN7_0+gi2p=fYPpHHMdOk2jwx9cX+nbovynphU8zSAZ5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,


On 3/19/24 05:11, Linem Davton wrote:
> Added mailing list link - https://subspace.kernel.org/lists.linux.dev.html <https://subspace.kernel.org/lists.linux.dev.html>
>  
> 2. Process.rst lists - http://vger.kernel.org/vger-lists.html <http://vger.kernel.org/vger-lists.html>, but the subscribe button on this uses older system i.e Majordomo.
> 
> Chapter 2 of "A guide to the Kernel Development Process" now has the susbspace link mentioned above and users are encouraged to subscribe via this link. 


Please send patches inline instead of as an attachment.
Since you are using gmail (which mangles inline text, ugh), you will probably need to use
'git send-email'.

Regarding the patch contents:

The master list of vger lists and how to subscribe/unsubscribe them is at
  https://vger.kernel.org

which redirects to the URL to that used:
  https://subspace.kernel.org/vger.kernel.org.html


Also, no need to Cc: trivial@kernel.org. We don't use that email address
to collect trivial patches any more. Just Cc: the Documentation maintainer instead.


thanks.
-- 
#Randy
