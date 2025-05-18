Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB071F941
	for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747593869; cv=none; b=LwYrkv6xbMuQfQHyFmKfb3oZfG58gumQuRg09IKRHWyclbMI7JvWnGZDZdt1/plW/gpH4KHgtDzpDzrFEdgig84oWptmckXXqPnxu6hBooZMbRrhoCYWGNZj5FAG+fLxvM/qf3R1pienWF4OnznwHL/VrHET99anRE6ACs8dIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747593869; c=relaxed/simple;
	bh=arZo3ed9sfFFw2D4kmRquTb4vTbObN7EcS3iZGr3qSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HI0ZtQvaGdUBwQYULuFKzGGBESvylk9KQZw5K2LJoxqbmDFDD4UbMDBjNUvSyV6n3b1BQi1ZI5Yr+OJNimJpXbhMFmgU/4j2Mdx0xKkkCyMhxE6ZL7I2SjVZoXrrVt1l9nAnkCAgkH23t5gILSd6iZURKd+K6Ck60ZWIzf0FCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=m224pPHk; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="m224pPHk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=d2aPVj2/PKgskQeOplwt0yyBNrffv1J3KXTOWSoA5no=; t=1747593867;
	x=1748025867; b=m224pPHkGfGugoXsaR4SLs0DQ9rvahKdyDV5j6yZS3QJK920RxukQKc7h+Xux
	bTJSBJVLO5DkZjRdUFOgDhNiCtIs+IdzfK+rmDt+Zlj/stOBcdKdxGDylMWQRAAQU9etiN2f4MxrJ
	NcQ5iqWMz+B/aX25zlSs5+A68gxFlg+HQRP9SFIVo5RsnoP4AK1Xf3mvOrgk9M1+a2Fd4g9FKMdXL
	0kOIZkpdwnqOAkO47ovGREGzDEpvD/SfkFGwg4Zrsrs9Oj3MBFtYVuDPX0pW+spomdMe8S9blZ4Jo
	zXE93rPmfTRgNe+HWzo68XSIM4sZ5HVTWD3m4w3syPX23fS6EA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uGizg-0006OX-2h;
	Sun, 18 May 2025 20:44:16 +0200
Message-ID: <70e524d5-7695-406d-bcac-622bbece613b@leemhuis.info>
Date: Sun, 18 May 2025 20:44:16 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: admin-guide: fix typos in reporting-issues.rst
To: 10sharmashivam@gmail.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20250518172658.6983-1-10sharmashivam@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCX31PIwUJFmtPkwAKCRBytubv
 TFg9LWsyD/4t3g4i2YVp8RoKAcOut0AZ7/uLSqlm8Jcbb+LeeuzjY9T3mQ4ZX8cybc1jRlsL
 JMYL8GD3a53/+bXCDdk2HhQKUwBJ9PUDbfWa2E/pnqeJeX6naLn1LtMJ78G9gPeG81dX5Yq+
 g/2bLXyWefpejlaefaM0GviCt00kG4R/mJJpHPKIPxPbOPY2REzWPoHXJpi7vTOA2R8HrFg/
 QJbnA25W55DzoxlRb/nGZYG4iQ+2Eplkweq3s3tN88MxzNpsxZp475RmzgcmQpUtKND7Pw+8
 zTDPmEzkHcUChMEmrhgWc2OCuAu3/ezsw7RnWV0k9Pl5AGROaDqvARUtopQ3yEDAdV6eil2z
 TvbrokZQca2808v2rYO3TtvtRMtmW/M/yyR233G/JSNos4lODkCwd16GKjERYj+sJsW4/hoZ
 RQiJQBxjnYr+p26JEvghLE1BMnTK24i88Oo8v+AngR6JBxwH7wFuEIIuLCB9Aagb+TKsf+0c
 HbQaHZj+wSY5FwgKi6psJxvMxpRpLqPsgl+awFPHARktdPtMzSa+kWMhXC4rJahBC5eEjNmP
 i23DaFWm8BE9LNjdG8Yl5hl7Zx0mwtnQas7+z6XymGuhNXCOevXVEqm1E42fptYMNiANmrpA
 OKRF+BHOreakveezlpOz8OtUhsew9b/BsAHXBCEEOuuUg87BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJffU8wBQkWa0+jAAoJEHK25u9MWD0tv+0P/A47x8r+hekpuF2KvPpGi3M6rFpdPfeO
 RpIGkjQWk5M+oF0YH3vtb0+92J7LKfJwv7GIy2PZO2svVnIeCOvXzEM/7G1n5zmNMYGZkSyf
 x9dnNCjNl10CmuTYud7zsd3cXDku0T+Ow5Dhnk6l4bbJSYzFEbz3B8zMZGrs9EhqNzTLTZ8S
 Mznmtkxcbb3f/o5SW9NhH60mQ23bB3bBbX1wUQAmMjaDQ/Nt5oHWHN0/6wLyF4lStBGCKN9a
 TLp6E3100BuTCUCrQf9F3kB7BC92VHvobqYmvLTCTcbxFS4JNuT+ZyV+xR5JiV+2g2HwhxWW
 uC88BtriqL4atyvtuybQT+56IiiU2gszQ+oxR/1Aq+VZHdUeC6lijFiQblqV6EjenJu+pR9A
 7EElGPPmYdO1WQbBrmuOrFuO6wQrbo0TbUiaxYWyoM9cA7v7eFyaxgwXBSWKbo/bcAAViqLW
 ysaCIZqWxrlhHWWmJMvowVMkB92uPVkxs5IMhSxHS4c2PfZ6D5kvrs3URvIc6zyOrgIaHNzR
 8AF4PXWPAuZu1oaG/XKwzMqN/Y/AoxWrCFZNHE27E1RrMhDgmyzIzWQTffJsVPDMQqDfLBhV
 ic3b8Yec+Kn+ExIF5IuLfHkUgIUs83kDGGbV+wM8NtlGmCXmatyavUwNCXMsuI24HPl7gV2h n7RI
In-Reply-To: <20250518172658.6983-1-10sharmashivam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1747593867;0ca6485d;
X-HE-SMSGID: 1uGizg-0006OX-2h

On 18.05.25 19:26, 10sharmashivam@gmail.com wrote:
> From: Shivam Sharma <10sharmashivam@gmail.com>
> 
> Correct pin-point to pinpoint, If that the case to If that is the case,
> and its only slightly modified to it's only slightly modified in
> Documentation/admin-guide/reporting-issues.rst for proper spelling and grammar.
> 
> Signed-off-by: Shivam Sharma <10sharmashivam@gmail.com>

Many thx for this, change looks good.

Acked-by: Thorsten Leemhuis <linux@leemhuis.info>

That being said: I wonder if the the changelog could or should be
improved, as it IMHO just describes what is quite obvious from the
change itself. I'd go with "Fix three spelling/grammar mistakes."
instead[1]. Yes, it's feels like "too short" and "what the subject
already says". But well, there is not much to say here, so why bore
readers with more? But it's just a detail and for a small change like
this likely not worth bothering much about.

Ciao, Thorsten

> ---
>  Documentation/admin-guide/reporting-issues.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 2fd5a030235a..9a847506f6ec 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -41,7 +41,7 @@ If you are facing multiple issues with the Linux kernel at once, report each
>  separately. While writing your report, include all information relevant to the
>  issue, like the kernel and the distro used. In case of a regression, CC the
>  regressions mailing list (regressions@lists.linux.dev) to your report. Also try
> -to pin-point the culprit with a bisection; if you succeed, include its
> +to pinpoint the culprit with a bisection; if you succeed, include its
>  commit-id and CC everyone in the sign-off-by chain.
>  
>  Once the report is out, answer any questions that come up and help where you
> @@ -206,7 +206,7 @@ Reporting issues only occurring in older kernel version lines
>  This subsection is for you, if you tried the latest mainline kernel as outlined
>  above, but failed to reproduce your issue there; at the same time you want to
>  see the issue fixed in a still supported stable or longterm series or vendor
> -kernels regularly rebased on those. If that the case, follow these steps:
> +kernels regularly rebased on those. If that is the case, follow these steps:
>  
>   * Prepare yourself for the possibility that going through the next few steps
>     might not get the issue solved in older releases: the fix might be too big
> @@ -312,7 +312,7 @@ small modifications to a kernel based on a recent Linux version; that for
>  example often holds true for the mainline kernels shipped by Debian GNU/Linux
>  Sid or Fedora Rawhide. Some developers will also accept reports about issues
>  with kernels from distributions shipping the latest stable kernel, as long as
> -its only slightly modified; that for example is often the case for Arch Linux,
> +it's only slightly modified; that for example is often the case for Arch Linux,
>  regular Fedora releases, and openSUSE Tumbleweed. But keep in mind, you better
>  want to use a mainline Linux and avoid using a stable kernel for this
>  process, as outlined in the section 'Install a fresh kernel for testing' in more

