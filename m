Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546079CD;
	Mon, 23 Mar 2026 23:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306902; cv=none; b=ZCJHhtQmdGCwh/TZiXQC4XjJLqJ0txsj7sDOTUW/KDWfvPywZdv5GQjLO+fFKRWJAHxt//DwUAp+rQGjrrFgJrWaAEkvcPobm6CnfzOs2DPnOlUhxR+DRPukzPPL51OM6QehXOFgHz6w96+gn30gf4lwlerQ5rqmOHeAGPSy5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306902; c=relaxed/simple;
	bh=toyhR0KbEaSMuTUVSxlNnq5OtFVNtTeUOy3I6MZQPts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd+UCcCB0jcc4bwlUhn/4v374eu0y29uNqC9vYHxrFSn0drv87Ao2mqmr6Mt7b8I8q7j5P5oanyYbxY4D6rsBQvOwY8/UAEjl5XjspHJT40f0TIQCeOlnkW2qOEKafd5vEg6Rs2nuDfuqYYrHgDYP1VhMUTQvrOuSN5nqy3am8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EQh9N5ul; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EQh9N5ul"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=99hlkLfa8IThBgtzSY8NsrJ2ygIkKnZEJHYHwGg1HNs=; b=EQh9N5ul4hcUwmTS5/WS1HGTF8
	Lt4HK9k55+7MV63WMFcLXRn880gcUK1yw5D20xJJuOw8Dua2bgBgUmULpL4x2TPr3behDT0NhmM3H
	DpmaQBSf4HNYjO7ZWbj9bFGdx1bebCb/5N4LYEeKZQmNQDxoD/P5jf82E7vqyrShHwYoJy3zb7giZ
	RGC492oTrG0islK8JJ2ah39BY35xvqWtPxS6+8905L3ed8jcnEvo7ZO7n0aqOXq/kKglvCmGrXLUw
	VEDqIrhUOU8SfNuEKrVDa3YPV2lXjf+8+bJme6WmARzNKWEyN0xuIYmZLnGXdfObr1C2lQaea0ejV
	M3bH5zHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oH7-0000000076D-0adi;
	Mon, 23 Mar 2026 23:01:33 +0000
Message-ID: <04294157-7833-4dfa-b41a-457cbd8750a5@infradead.org>
Date: Mon, 23 Mar 2026 16:01:31 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
 <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
 <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
 <4620a35c-5293-4973-aa71-49046fae9911@infradead.org>
 <DHAJ2FE2Z4OL.ZUA8AQEMPC01@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DHAJ2FE2Z4OL.ZUA8AQEMPC01@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/23/26 3:50 PM, Rito Rhymes wrote:
> I believe I identified the issue as a Sphinx version compatibility
> problem.
> 
> I've been working on a more robust reroll. I expect to have it by
> tomorrow, and we can test it when you're ready.

Sounds good. Thanks.

-- 
~Randy

