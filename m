Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974F182B4
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 05:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734670974; cv=none; b=I4qcQTguiv8O0aSklEkPO0QUQOToSxHY7Db4JuP+AJVM3ac+Zyg8qNQVENC4WHl/76JFeM7VP+diOlwSGsLPSXJq5ypkBFpYXAAPnJYEwRD1TFQufa4sJbHFbTuj0mHTsdsejd6BNY+DJ8LhtSP1wCcWJLiJRHhNgS5qGA3VmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734670974; c=relaxed/simple;
	bh=3dkMKpx12fljnfOS9FqlePthSuEGaYOGZHKOoOum71Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AmTbpA3KX2VU6JZ5xEYCIX5DYlYUj9+aEIAXxiQaRNUnbJkEw1Qj+DyLkAZiz074m9k7DqIlGuxO5eP1xhIU/e+7IyssUajZthz+VhCGDH+9B6RmWpejQHLkbig98kyT2GRCvUhJX7JaJFYQC3smc86o/uJFxgeCHE+wGYvcPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qJq1FQQB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qJq1FQQB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=1Qv3lLZyRlavXDbduBS+5s48SombC7XvyZbCyYMZaIc=; b=qJq1FQQBdzouc0NqESh44Z2QFy
	E5tJ4F3RO9sYO9wKCb3FyOxHnkroRYUSYxsm7PkCROQyfz0C4pXWn62/PV1iZ1XbOJzUp0BphYYco
	zwCuWHuU0qE6xmAGAbcqWyrRLODh8jRc0HX9HL19t4/UWgau6GQrPuppMxBEJK0MfVQwMY9fJOoGL
	TRE2VvdWDHpo4teER0fPiCIAJlJNwd0jIeWrKCQyiU0HxcOONXSVihd+khxRaI1EMJWRSg8QbX9qY
	COYmsf5UVPNS5m3+kW/P7jXx81BJfqICdXsTT/RmlaS6xEzYr2NZV+IF1LAAEVIy505juLHNXiJxd
	+QMyELrA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOV9x-000000081Bh-2DS3;
	Fri, 20 Dec 2024 05:02:46 +0000
Message-ID: <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
Date: Thu, 19 Dec 2024 21:02:43 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in kernel-doc ("-" misinterpretation)
To: John Ousterhout <ouster@cs.stanford.edu>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi John,

Thanks for the report. (I have confirmed it.)


On 12/19/24 10:37 AM, John Ousterhout wrote:
> kernel-doc gets confused by code like the following:
> 
> /**
>  * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>  * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>  * for well-defined server ports. The remaining ports are used for client
>  * ports; these are allocated automatically by Homa. Port 0 is reserved.
>  */
> #define HOMA_MIN_DEFAULT_PORT 0x8000
> 
> It seems to use the last "-" on the line (the one in "16-bit") rather
> than the first one, so it produces the following false error message:
> 
> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
> 
> There are similar problems if there is a ":" later on the line.


@Vegard, can you look at this, please?
I have already looked but didn't arrive at a solution.


It appears to be these lines in process_name() that are confusing the function name
and following description:

        # Look for foo() or static void foo() - description; or misspelt
        # identifier
        elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
            $identifier = $1;

Thanks.
-- 
~Randy

