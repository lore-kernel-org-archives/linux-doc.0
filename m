Received: from a27-53.smtp-out.us-west-2.amazonses.com (a27-53.smtp-out.us-west-2.amazonses.com [54.240.27.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832D280329;
	Mon,  1 Dec 2025 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764627412; cv=none; b=OagMsrVq26X6tm3eW9Iu3HCBjsTxQbn18YreZPLKK31NOibLnT2LIMe01gXQkX8a/jKrz5sNQyHgOCY9xW2wK+8Drp/GOIhD+vABEQzGznPeTJYI9WzC5Fb/qFCKaO4anrjOOiI7PNVtWulDhDqFDYMVd7UgGvv7+RcsiJE+8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764627412; c=relaxed/simple;
	bh=eyIG1pVj3QyuiJ+AN8a4Vw/ZQlbH6nD7ZV73gkH9Rw4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=V4alDcciJlFnYF4hn/d/TGrhVbNsL+xDDJiR47KKXmTNoAPxlhbk9DXskykpVwg3EgwqLj5oIwR1SZaEfEMDiEBcTVvQkPX8tyCBKJnAN/WKgVd2XeFdJYR4gUGHpbA2i0j0CxFg9sL36pV6cjFGQwUkzYLEnxfji7x0Ny7+dRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org; spf=pass smtp.mailfrom=ses-us-west-2.bounces.aaront.org; dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b=bd4/xpjb; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=askW6Mkr; arc=none smtp.client-ip=54.240.27.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ses-us-west-2.bounces.aaront.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b="bd4/xpjb";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="askW6Mkr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ude52klaz7ukvnrchdbsicqdl2lnui6h; d=aaront.org; t=1764627409;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To;
	bh=eyIG1pVj3QyuiJ+AN8a4Vw/ZQlbH6nD7ZV73gkH9Rw4=;
	b=bd4/xpjbaiL5c3K4vYURRlhYVvsZvmpf87KstiWcREtH+K6XCNiJ7087JqZzkZUZ
	VPZDXwT9s5lvfxWvr2N5F/Sr7E1h+QZtnvEK05dZa97yBeyIke0QiWxbGmCOUyXgSEA
	z/FdnTb74hWwokn60Q6XP7e0vMPcMYCE9OIuZgjumKYIn3MVOI1ZPP5ZR3ZtjLv+EMC
	b+4ywYTeo+mWrJ5nX6itAd7HuRtdS/VId5R7eMUMyDxXzZAXIR92q7dGoBgRm+cSG7S
	BFhgNqbp7zbUuNRmlGbGr8Iao05GJxgnckZkAlHWIWMeLXC2n/zypEgCU4sinFu6tbl
	EzRyqVVXQw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764627409;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Feedback-ID;
	bh=eyIG1pVj3QyuiJ+AN8a4Vw/ZQlbH6nD7ZV73gkH9Rw4=;
	b=askW6MkrjbGo/GG2qqiE4dmv6KXJ4BGM9MMvWH1runnTGZVo9BNtbjWTpPjn7Hj5
	CStHXaTn5k2gbShLZ2/IMBI1mdwzneD10Tu0MoZQI3AYwepf4jz+8cJxebeBz4xhpEQ
	tHwdt1+nZpI6rVkqmDe9/WYqwwnuhYAebMnOrfNI=
Content-Type: multipart/mixed; boundary="------------PVHkiaedzABUzc80AmBq01N8"
Message-ID: <0101019adbfd6b56-c13ab9c4-a0dd-483c-a6fd-a6ea0d110604-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 22:16:49 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] debugfs: Remove broken no-mount mode
To: Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aishwarya.TCV@arm.com
References: <20251120102222.18371-1-dev@null.aaront.org>
 <20251120102222.18371-3-dev@null.aaront.org>
 <8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk>
Content-Language: en-US
From: Aaron Thompson <dev@aaront.org>
In-Reply-To: <8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk>
Feedback-ID: ::1.us-west-2.OwdjDcIoZWY+bZWuVZYzryiuW455iyNkDEZFeL97Dng=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.53

This is a multi-part message in MIME format.
--------------PVHkiaedzABUzc80AmBq01N8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 09:15, Mark Brown wrote:
> On Thu, Nov 20, 2025 at 10:26:33AM +0000, Aaron Thompson wrote:
> 
>> debugfs access modes were added in Linux 5.10 (Dec 2020) [1], but the
>> no-mount mode has behaved effectively the same as the off mode since
>> Linux 5.12 (Apr 2021) [2]. The only difference is the specific error
>> code returned by the debugfs_create_* functions, which is -ENOENT in
>> no-mount mode and -EPERM in off mode.
> 
> I'm seeing regressions in -next in a lot of testing stuff which bisect
> to this patch.  I've got a test that looks at the deferred probe list to
> see if it's empty, and the mm split_huge_page_test which uses a debugfs
> file called split_huge_pages.  Neither of these mount debugfs for
> themselves, they just assume it'll be there - it looks like that's not
> happening any more but I didn't investigate properly.
> 
> I don't immediately see what's getting confused, DEBUG_FS_ALLOW_ALL is
> the default and not overridden by anything in any defconfig so
> debugfs_enabled still ought to be being set, but I didn't actually try
> to debug this yet.
> 
> Sample bisect:
> 
> git bisect start
> # status: waiting for both good and bad commits
> ...
> # bad: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
> git bisect bad f278809475f6835b56de78b28dc2cc0c7e2c20a4
> # first bad commit: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode

I am terribly sorry, this was a sloppy mistake on my part. The 
IS_ENABLED() check is missing the CONFIG_ prefix. The fix patch is attached.

Greg, should I send a v2 of the patch series, or a separate patch with 
just the fix? Or something else? Again, sorry for the trouble.

-- Aaron

--------------PVHkiaedzABUzc80AmBq01N8
Content-Type: text/x-patch; charset=UTF-8;
 name="debugfs-fix-is-enabled-check.patch"
Content-Disposition: attachment; filename="debugfs-fix-is-enabled-check.patch"
Content-Transfer-Encoding: base64

Y29tbWl0IDkyZGNjMGI2ODY0Mzk1NTMxN2ZhNDE3NDQ0MmE2Mzc2ZGY1YThjOTcKQXV0aG9y
OiBBYXJvbiBUaG9tcHNvbiA8ZGV2QGFhcm9udC5vcmc+CkRhdGU6ICAgTW9uIERlYyAxIDIy
OjE1OjI0IDIwMjUgKzAwMDAKCiAgICBkZWJ1Z2ZzOiBGaXggSVNfRU5BQkxFRCBjaGVjawoK
ZGlmZiAtLWdpdCBhL2ZzL2RlYnVnZnMvaW5vZGUuYyBiL2ZzL2RlYnVnZnMvaW5vZGUuYwpp
bmRleCA5MzBkNjY5MTFmY2QuLjRiMjYzYzMyOGVkMiAxMDA2NDQKLS0tIGEvZnMvZGVidWdm
cy9pbm9kZS5jCisrKyBiL2ZzL2RlYnVnZnMvaW5vZGUuYwpAQCAtMzUsNyArMzUsNyBAQAog
c3RhdGljIHN0cnVjdCB2ZnNtb3VudCAqZGVidWdmc19tb3VudDsKIHN0YXRpYyBpbnQgZGVi
dWdmc19tb3VudF9jb3VudDsKIHN0YXRpYyBib29sIGRlYnVnZnNfcmVnaXN0ZXJlZDsKLXN0
YXRpYyBib29sIGRlYnVnZnNfZW5hYmxlZCBfX3JvX2FmdGVyX2luaXQgPSBJU19FTkFCTEVE
KERFQlVHX0ZTX0FMTE9XX0FMTCk7CitzdGF0aWMgYm9vbCBkZWJ1Z2ZzX2VuYWJsZWQgX19y
b19hZnRlcl9pbml0ID0gSVNfRU5BQkxFRChDT05GSUdfREVCVUdfRlNfQUxMT1dfQUxMKTsK
IAogLyoKICAqIERvbid0IGFsbG93IGFjY2VzcyBhdHRyaWJ1dGVzIHRvIGJlIGNoYW5nZWQg
d2hpbHN0IHRoZSBrZXJuZWwgaXMgbG9ja2VkIGRvd24K

--------------PVHkiaedzABUzc80AmBq01N8--
