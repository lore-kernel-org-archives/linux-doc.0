Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CD1F608
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710862643; cv=none; b=KBtR5QQFxhJkIGGcuy4Kec1WfmI0FIgdS9wu4rfflu8GfRz14xqGhN66uql2VXTERLJuyDopE7Y7J29sLeCoJaqfBWhHp0P3de/5SWCnvx6TNQcWRc6UK8WT4sPS+X/TZOJo5Qs648sgDsKBdnrunpvQ6f8DXWsntpBjQCprQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710862643; c=relaxed/simple;
	bh=+e6PBZtRSqbzUmJZl60CInLWws2zKLQtfjPL0GbBqFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhZ1zdr+t13EzXw22RLII57e+21JoW08cTR5qI7ADLguRZ+7KvB7cQs9GGzrhEimpTeOcwdSGnaHXeW6QQb4MV8YsWBrpQI2pPK5XlBD6FcpMGR3qZfA19IZXZAfGqusSNjJpaF0Wa55bS+I3KgTvbRR6DGBFHVZAlOechTK7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l2VoOtie; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l2VoOtie"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dQNmjKEd+HmiqnzhMp2b9iKRUTkrgtmaxcqZKPjppLo=; b=l2VoOtie94b0ykFOCTqX2T/zhx
	3/RwCqhU7lan5mWnxlNOTLS8rXirdKz64j3qe3ZAEo75MDfXIsB4UeS9TK0I/zpcAx0VnwgJ87c/j
	Eh7ZEKxBKg1VIXJnDPWjwHGQ+kp7EDjwtr6SadYo8qWfze0Wa2utWo3jtX0E9nfH3w7EjsnC+75HN
	qQXlnd4Xswuaq/LIQVquXK2UvnDsmCFetHGHlpOP20/jORBw0eSQyQKulX1BG0HdAZxPgs3QufKmm
	jGmj0lRj8HMpBABrB7ePOn3NFCbQBTZnC3syFe/yWvfkPqmO5bhQ/WkxKtg6ijhft1gKxsfl3Oh7K
	CKASUt8g==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbWh-0000000DBIV-2sQg;
	Tue, 19 Mar 2024 15:37:19 +0000
Message-ID: <945e7341-1fc1-44c0-b2a7-9f8c8340668a@infradead.org>
Date: Tue, 19 Mar 2024 08:37:19 -0700
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
Cc: corbet@lwn.net
References: <CAHAQYrN7_0+gi2p=fYPpHHMdOk2jwx9cX+nbovynphU8zSAZ5Q@mail.gmail.com>
 <2ca49f75-6ca6-4006-a332-554aa85399e2@infradead.org>
 <CAHAQYrMc2c6aQH3fuhHY2zkjd6b0oUHr5O7ykRHFkzFwDivT4w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAHAQYrMc2c6aQH3fuhHY2zkjd6b0oUHr5O7ykRHFkzFwDivT4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/24 08:30, Linem Davton wrote:
> Hey Randy,
>> Please send patches inline instead of as an attachment.
> Since you are using gmail (which mangles inline text, ugh), you will
> probably need to use
> 'git send-email'.
> 
> Thanks for the info.
> 
>> Regarding the patch contents:
>> The master list of over lists and how to subscribe/unsubscribe them is at
>> https://vger.kernel.org
>> which redirects to the URL to that used:
>  >https://subspace.kernel.org/vger.kernel.org.html
> 
> The https://vger.kernel.org leads nowhere, since the site is HTTP only
> and the modern browser doesn't redirect you, some clients have "https"
> only enabled which does not even allow the HTTP://vger.kernel.org.
> Thus I decided to add
> "https://subspace.kernel.org/vger.kernel.org.html", as it works and
> has a better use experience as what users see is what they get.

OK, I didn't check all of that.

> One question - Does no team use trivial@kernel.org, or is it just the
> documentation team? If so, I will patch the corresponding document.

Nobody uses trivial@kernel.org any more.

> Signed-off-by: Linem Davton <linemdavton@gmail.com>
> ---
>  Documentation/process/2.Process.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/process/2.Process.rst
> b/Documentation/process/2.Process.rst
> index 613a01da4717..8d8fff825590 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -397,6 +397,11 @@ be found at:
> 
>   http://vger.kernel.org/vger-lists.html
> 
> +To subscribe or unsubscribe to lists, please visit:
> +
> +  https://subspace.kernel.org/vger.kernel.org.html
> +
> +and use the "sub/unsub" links next to the list you want.
>  There are lists hosted elsewhere, though; a number of them are at
>  redhat.com/mailman/listinfo.
> 

thanks.
-- 
#Randy
