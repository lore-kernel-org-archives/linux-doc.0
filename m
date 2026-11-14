Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666077;
	b=RziOSSvHpvYg1EQIHHqS4so/V7Y8PbJeio3j0ToCe9rW+Hyke28dYpDh4GX5ssGOPG88
	 3xOKkGbBcr6pp6P58E9IywSK0RSanMqUWZRVjDvzMSlGUSDNqfQntczdd/RKpikZhFkSz
	 wwuxwrp4tq1JqlkZt+Oc6rWZ3odqh0RUSryXATAs9wvc/blpekh8A5mKD4O5TGwTEXIck
	 FotNfiF4ymt4W7a2MFBkzrmWVhLuHF3nauVXtdMAZul5MhDr5ne+8/+5407PK9pgp+LNL
	 IgMzQKbTfWSDXWKp/UCSJrgdBC8a2RKdyEpmYg5i5IJa6sjHvrMIKfoOloxdCfzhitA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666077;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FqnHMYlKaSA8Ft2QevowFaKT6pdWror7xfjpOfngALs=;
	b=jYrHjd//AzEWGATF+6LNQNRvCOmjduV+bZQHzHhhET7nm1HNSZOFIlGjMEeRBS9gsREz
	 PEuSybYQWEJfIvrV6RiE3GNpka3ufHLFysEts56MAhJGxvxJA0k79ety6//EZRYiaWcFq
	 rHWE+PZqRaGiXSAF8SoNVcDHazZZA8JFrh/lMVERNdT0N75kxvfou8hVsuhA2kGLrsfeA
	 bhmYXkV7sUlObpsHbybMlm1J339alWnXv1kv8yJaYcxba0BYW2EcLNUY6pA/TEtvvyqu9
	 X39FkelaCu/C1NyQgtIeW/BUmoRWc8WrJbIZdJClEn0RzYH4yN7dTzHAmJODnY0pHrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=aIBBELEn;
	arc=none smtp.remote-ip=91.218.175.207
Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBA606A333
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEBA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=aIBBELEn
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qUS2XBe2YZ7bGkxDICrEYx9w9WRwXYDG0onMhdWkZeQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794666069; v=1; x=1795270869;
 b=aIBBELEnghTsRhxJn6zyOU8ziOCmV6TGaJEu9rOwX2gJ1ZFA6RBAiFjsuTVQ2zJj5Ih/yME2
 A3/atKba+wgDV0OK0cuyKOtdXmNgxbPi+FLqS5DSZtDu4nEzirO0FubIdHQf3X1g1HvI6CZu5yI
 Q6d51blsc5w/HgRvttS5YnlrF0JJKfVr57sg94G9ETWfQL2caJvYFshi94MdfPGqiqWZMPo/Vle
 VlIywYRnTS1mQxKxruvnl+K689EFl00A0vnEoZnjkB1m40Mjlyog3EhfVRTOKjFkYREOLX3wyLH
 MW8/fVzGuCPsI3jB7Pcopk5FYNyd4d/eqcWWgZGTblJqQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba8871558e610b89;
	Sat, 14 Nov 2026 14:21:07 +0000
X-Mizu-Trace-ID: ba8871558e610b89
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 22:21:04 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6Zey6YCb?= <2368492046@qq.com>
Cc: corbet <corbet@lwn.net>, mchehab <mchehab@kernel.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	skhan <skhan@linuxfoundation.org>, rdunlap <rdunlap@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] docs: kernel-doc: fix export selection and error
 handling
Message-ID: <avhuUH2BLm-EQpPw@wyuan.org>
References: <tencent_9BF64A4FFFB7B990DD5E6D6CF26C43565306@qq.com>
 <avgDq_FrLSbuC7bK@wyuan.org>
 <tencent_79B4A967C5ADFFCE3CCF0EA9362419ABE105@qq.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_79B4A967C5ADFFCE3CCF0EA9362419ABE105@qq.com>

On Sat, Nov 14, 2026 at 05:05:38PM +0800, 闲逛 wrote:
> Hi Weijie,
> 
> Thank you for reviewing my submission, and sorry for the mistakes.
> Although I have been familiar with and using Linux for nearly ten
> years, this is my first time submitting a bug fix to the kernel
> community, and I still have a lot to learn about the process.

Thanks, you're welcome! No need to worry. And sorry if my previous reply
was a bit straightforward. I was a bit out of form this afternoon. :)

Unfortunately, your actual patches of v2 this time were not sent as
replies to the cover letter. Usually, your actual patch, let's say
[2/4], should have a 'In-Reply-To' email header that points to the
Message-ID of your cover letter [0/4]. But now they do not have that
header, therefore not in a thread. See also:

  https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers
  https://docs.kernel.org/translations/zh_CN/process/submitting-patches.html#in-reply-to

If you were using 'git format-patch' and 'git send-email', that should
work well as expected. What did you use to send patches? Is it QQMail
web page? I suspect it would damage the process of sending patches. (But
it seems that your [1/4] can be applied successfully with 'b4 shazam',
so anyway) I had heard before that using QQ email might cause problems,
but I wasn't quite sure either. You may want to take a look at 'git
send-email' or b4.

I'm not familiar with this part, so please wait for others to review.
;-) I suggest that sending out your v3 after receiving some comments,
so you don't need to reroll too often beacause of this format issues.
(But if they want you to tidy it up, that's fine too.)

Yup, the process is not that easy to get familiar with at once. But
please don't be discouraged. If still meet any problems, please feel
free to let me know.

[...]

> Thank you for your time and guidance.
> 
> Best regards,
> yuehua-meng

Thanks. The usual practice is to write it as "Yuehua Meng" in your
From and Signed-off-by. But since I can tell that it's a known identity,
I guess it's fine unless later asked. Or perhaps this is just your
original intention. ;-)

Thanks.
