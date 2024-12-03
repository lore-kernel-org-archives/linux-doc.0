Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C19208981
	for <linux-doc@vger.kernel.org>; Tue,  3 Dec 2024 21:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733262180; cv=none; b=cxr/7VtBztbaa/Xs78cmfIdR+vtjZX3arNAi1d6v3j83w090yV6YM1bSTelX5OXHRaVbGnk15PbL3mru2cDVoJg23DWC05VsN9h5qK/MJPvD3RSJzUBBatD3cyEMQmlWuTNXlhvb7J1MbDBZeLX4+omHouW1TPUl5ehmaehoruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733262180; c=relaxed/simple;
	bh=KWIPXQ3ygWKfU5JPFFfOSQ67EgaUIpvqijmZYxExCiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZTLDIACa/aoF9XHdmlK+NRW9XQJfUR99AHlpGxFBCZkyWf6XECm0i4bf2gk4UJAAj9PbgkpzTNWnN8FLyx+/uBUMRr+hbiqu3lZ5bHQv4OI5jGXqztIfiua31SY30IBzoWjPSYfyt+mJCqMr3GzTYomDyYpX8+XN+HgqI4rvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kZ56if1O; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kZ56if1O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bLm5GwqmEdvVklvW6TExLfNOvTcubm8w3WyTFKX45p8=; b=kZ56if1OCNITFGBtKg1dUNjztq
	YKhkTSXGpQBIS+QYRt0PMGusU214XLi++gT2FBFG+vkDTF4xPLbMrBNtGbP7nw85+1mlNSm6b1L+U
	cCGFafWpEIrTzHeA3TNzzwOB6PcOH555m0KCJ4+KFpSsuiRFfi1U0WPgusoDLC+E3ZXH2MnicXpJn
	pipehELG3g+Q3aWoSVZOYW0EvrVFdUcQbch82Fb8Y+QXCySb0V9TPfPO5B8uMBqNv65mWRlKkL4WQ
	Qc3mmA6tv7caDYjpAJs75Y7+R4uVfM9/PgNMiuHQdPTc60u7OkekC6qKdNRtDgj9El6WXWJ8sFAvD
	ZUpOhX0A==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tIafV-0000000AIJ1-0OB0;
	Tue, 03 Dec 2024 21:42:54 +0000
Message-ID: <dc993ea5-15ad-4780-9ccf-206224efe027@infradead.org>
Date: Tue, 3 Dec 2024 13:42:49 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: move kgdb.rst from dev-tools to process/debugging/
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
 <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/2/24 1:41 AM, Sebastian Fricke wrote:
> Hey Randy,
> 
> On 30.11.2024 00:10, Randy Dunlap wrote:
>> Hi,
>>
>> It seems to me that documentation for kgdb should be in the new /debugging/
>> sub-directory [or that all of /debugging/ should be under dev-tools].
>>
>> Same treatment for gdb-kernel-debugging.rst.
>>
>> Any comments about those?
> 
> Thanks I have overlooked these files, but yes I would say these are good
> candidates for the new debugging directory. And then we can link those
> pages into the userspace debugging advice guide.

I'm working on this move unless you want to do it.

I don't think that we quite agree on adding links to kgdb & gdb into the
userspace debugging advice guide. I would prefer to see them in the
driver development debugging guide or only listed in debugging/index.rst.

thanks.
-- 
~Randy

