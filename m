Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCC2D78A
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708187661; cv=none; b=Af376SvYRM+eQVjoC02kKP3y0WkPVeZ37SCYypRxfGWsqLbWnLf1ayiyFn+Vzd6+F9kxMYtidPb1jepD4mhLTD7s+oaF9dORtq+meuUnlz5zhHK2F3rd3EigIUWC4uxv9NQS40J1RvzUAnFC5Vm9GQMg4/NMHYwOptGDC/9jyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708187661; c=relaxed/simple;
	bh=D1bRGTKhYbAaTA23n7QfW1h1Ir0TNAXseDoCvb0Jgcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6ngJNtdBq8N7+jrD7WDix0UsQi0U4rT/AL6oEAyRWkMVDHiz6NoBq5N0zmFCqsNSjuWxN+N+qQqxfJIl+Bf4nfYhEI/KHnq2ef2A3JV0ONbRB/hPSsKOigG/AkpX1DPFe3va+GVlatBfuQ9qJeKcZbOUPLMZEIE1MW2mbxuGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FGzKLh5a; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FGzKLh5a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=J8bIo5mYrgCW5S2otUZnc/+y0FuV38my26nSwy6FVCU=; b=FGzKLh5aUyCedM+zUp47AQGy3e
	uKSyp70D/WGdtTCgEj68FvfhZwHpzk5qBHQ5eqS/oEvfJlJSjzHxQMqwF+n40oACZyM5oPocGDpKp
	9hemjf7VcUXP2pG5PkqVU3gTzWQi67kF+4tQePlTv+W0ja3HrYeWjmsIrJSbsuJ1oWmFcAdEx4Pww
	mGNtnWJwBi7WGhnCQLecaYdjpPIlya8+6NUK8r7RGt6JpubCQBxWwnFP0LDR2bPul5CE6NK8/EPzf
	9wG2oRc1Ce3Xip+yUdumwKvmXSLu/mzWtEJwTUfpPZFQBeEH3jYVt2h1YkJpfHnqVMtE+tDoJeoWl
	9xEeZw7Q==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbNdn-000000061AR-0K8S;
	Sat, 17 Feb 2024 16:34:15 +0000
Message-ID: <e096699e-723f-4dcc-9da9-ec967cfc213f@infradead.org>
Date: Sat, 17 Feb 2024 08:34:14 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] doc headings sweep
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet
 <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org
References: <2024021430-blanching-spotter-c7c8@gregkh>
 <00057b93-b5fc-4536-b13d-cd3b6cead5b1@oracle.com>
 <2024021530-plank-cornmeal-90eb@gregkh>
 <26b25204-9829-44a8-9836-1ce1c8725586@oracle.com> <87v86o4xu0.fsf@intel.com>
 <2024021619-barrack-shack-206c@gregkh> <87r0hcv4lj.fsf@meer.lwn.net>
 <e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/16/24 23:31, Vegard Nossum wrote:
> On 16/02/2024 15:58, Jonathan Corbet wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>>
>>> On Fri, Feb 16, 2024 at 10:28:39AM +0200, Jani Nikula wrote:
>>>> rst basically allows any order of the heading underlines, and their
>>>> relative hierarchy is determined by how they show up in each document,
>>>> it's not specified by rst. However, it would be much easier for everyone
>>>> if all the kernel documents followed the same style.
>>>
>>> Agreed, someone should pick a style and sweep the whole directory and
>>> sync them up to the agreed formatting. :)
>>
>> Somebody did pick a style, it's in Documentation/doc-guide/sphinx.rst :)
> 
> I have a (very long and ugly) script that can fix these up to a
> consistent style, the attached patch is the result of running it on
> Documentation/process/ only.
> 
> I've done builds before and after the patch and diffed the resulting
> HTML files, they show no difference. (HOWEVER, you do need a 'make
> cleandocs' in between, as it seems doing 'make htmldocs; find
> Documentation | xargs touch; make htmldocs' is going to change the
> generated HTML for the sidebar -- another issue to look into at some
> point, I guess; maybe it's specific to the Sphinx version I used here,
> 4.3.2.)
> 
> The script will leave alone any file that it doesn't quite understand
> (e.g. for a lot of the translations there are way more underlines than
> characters in the heading and it doesn't match up with the byte count
> either).
> 
> Anyway, the question is: Is this worth doing in the first place, or is
> it just churn? I assume just after -rc1 would be the ideal time to
> submit these to avoid conflicts.

Yes, do it, please.
Thanks.

-- 
#Randy
