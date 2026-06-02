Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65D2D3EC7
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421477; cv=none; b=hopMgEwsmXqZc1IJ8nIzL/XL+i/IBj6qhvA+zL3HZg0ofGxo2clJfaootF87jralxbtnHRaxZjCqoy01JRDUt4N4jnD3GR1sF2RSzeUW5i3uko48gHsTH0M3lKOYyMOzgAEyqplNFyRXiX0x0W1jT84EXehLIsfHlL4QhneX48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421477; c=relaxed/simple;
	bh=h1jMuU3vzOEfWvNoF88HaVZ2Idd//bX0ugzgHlZgVto=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hTcFpgELOGayvoG8wCOw56+ISzuwVX3heJcGXTp9rB/RrhoA2+Pq+BIZc0FFlbYwhOK0Rnl06+9T6KIrhcZOqK6ryskcMt6rvcCMqkJXtnF5Trevw+jGqpBFQDMof6vYO3FNZZx49REOtpZTFvkSdUqk5nZ/uwMfLPpCDQkukMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0wMsF/9u; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0wMsF/9u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=KMnzrHMvtjzp5lG+Aql6fem1tyh3fk/ywlTSd6NAz3w=; b=0wMsF/9uUswGUvKChwwmdiWK4l
	q5uwgUmQAqMZCGnNFSg2ciWCS/xQlOPhGSDM88BFb6G527YZuLz/XuR+Y2uRhW903XPAiDVGu1KH5
	dIyzInueVOvL1L22ycGE467YAweFBWBSwFydfoMA1LQvLNmg4SFiqiH89lcM0/qSadNedJI+n5NxW
	yF/lwqU/m42N0bR8E+RYh8vsSiwaV5AphQR3/ohRQvhews0x7WVzWPzn/jSSXi+3hXxkm1MEiYBxU
	ntLFkfL0icuTAfcO7xpYNYNpLZPCy7hN7BFtl3knC2yIhKu/j3hAYAZ68aD2ImS8pxNKpEFSNfbVk
	GsJPvv9w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSxN-0000000DaRr-1TXO;
	Tue, 02 Jun 2026 17:31:13 +0000
Message-ID: <b9380d52-f74f-44b9-b307-b797eb197b42@infradead.org>
Date: Tue, 2 Jun 2026 10:31:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux] Documentation/arch/sparc/oradax/dax-hv-api.txt and
 Documentation/driver-api/parport-lowlevel.rst : Form feed (^L) characters
To: Xose Vazquez Perez <xose.vazquez@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, DOC ML <linux-doc@vger.kernel.org>
References: <25667a7c-e426-413d-aa3d-a52ebbeb9de5@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <25667a7c-e426-413d-aa3d-a52ebbeb9de5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/2/26 2:39 AM, Xose Vazquez Perez wrote:
> Hi,
> 
> I noticed that  Documentation/arch/sparc/oradax/dax-hv-api.txt and
> Documentation/driver-api/parport-lowlevel.rst contains several
> legacy form feed (\f, ^L) characters used as page breaks.
> 
> I am not sure if these are still required for any specific formatting
> reasons or if they should be removed.

These form feed ^L characters seem to be ignored in the produced html output.
If someone printed the text files, they would cause page feeds.
In the case of parport-lowlevel.rst the form feeds might make the output
look nicer at the expense of wasting paper.

IMO they can all be removed.

> They appear in the following lines:
> 
> $ grep -n -P '\f' Documentation/arch/sparc/oradax/dax-hv-api.txt Documentation/driver-api/parport-lowlevel.rst
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:66:
>                                                                                                  Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:128:
>                                                                                          Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:176:
>                                                                                          Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:228:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:284:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:342:
>                                                                                                    Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:397:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:454:
>                                                                              Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:504:
>                                                                             Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:554:
>                                                                                                      Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:609:
>                                                                                             Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:667:
>                                                                              Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:719:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:779:
>                                                                              Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:830:
>                                                                                                    Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:887:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:943:
>                                                                                                Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:995:
>                                                                                            Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1048:
>                                                                                                   Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1105:
>                                                                                             Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1156:
>                                                                                                    Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1216:
>                                                                               Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1272:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1326:
>                                                                                                    Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1381:
>                                                                                                     Coprocessor services
> ./Documentation/arch/sparc/oradax/dax-hv-api.txt:1433:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:104:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:504:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:540:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:586:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:674:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:709:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:866:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1102:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1188:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1217:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1253:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1282:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1319:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1355:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1386:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1413:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1444:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1511:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1589:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1629:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1661:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1771:
> 
> ./Documentation/driver-api/parport-lowlevel.rst:1805:
> 

-- 
~Randy

