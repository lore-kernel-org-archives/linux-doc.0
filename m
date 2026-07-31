Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C21DFFD
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489453; cv=none; b=IJ85VS8TINo8wqbraCo0Iq8fgt0doE3TvLfFu13JYBbsna+8ng0tUjpgfGik/hPxApAQ08QTcpkZQN0QMKuCEV9BEuSFNcvKbeBoASuwHD68GYM+omoLYbKJ4vbh5msVssHFyh6/zoohNrRtYissdrpu5dijPwd3Wqkb5LTbmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489453; c=relaxed/simple;
	bh=ETsAF6YHjL8uUDxCDN+lcKhsiPyhc8pwr29n5cxxUS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpIkxEvsbeX6vC+vjSSSQVL2zAIDJ6cThCr9jIoiZiH3NikiS0wwo0li44THsBVghG8CWmdXQkI6qgd1fKdzlCV4baTfbWn72dXf6G6T9qqBCTqXmFbp8pLoeFwwrpnH2+KG52TjfucRpTkWnFk3nPNnzpiE1Q7jrbvtiMX9jDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPz9HUnd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPz9HUnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633691F000E9;
	Fri, 31 Jul 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489452;
	bh=SmXHxm/S8gWAcFTPx9bcFZXCiUJzwFzL8tV4kp0WIxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HPz9HUnd+RzfuNqF4BxNb0nf8/PabOFpkZi9AJIOfsuvqKyxT30y6mUyqxgyCYHFM
	 uqc0pOT5Y9b7sAYZWt6oUoR0VVwHAfSk2nlCmbHIWTrIOqMx+cT6ne8RCsWfuZRS9F
	 GnJ1gkId/DRMKHTI4gNwt2umOzD5HUuF7gNcuNS/Zc5fSrAW4jF19EU6Ni/SDixRor
	 m2nRC6k2xKe9tFMXKxPpAW+9yhKKc0JD0lOPfL/dbLASYEHYavC/1dQJWHYbu6KfHp
	 c9rt5F70+bY+sm0lRsq9YaKj1Vo8CjKIRAOLJ/gNs0gnn1NVpYA6vO3QCIFqA00+3z
	 jhVgVxUKa+b4g==
Message-ID: <33b55954-71e7-4e8d-868a-0440c1b28ae8@kernel.org>
Date: Fri, 31 Jul 2026 11:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/ksm: fix advisor_min_pages_to_scan description
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn, chengming.zhou@linux.dev, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
 shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc: wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-3-tujinjiang@huawei.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260731083526.3953421-3-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 10:35, Jinjiang Tu wrote:
> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
> lower limit of the pages_to_scan parameter, but that is not how the
> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
> scan-time advisor is enabled. This will mislead the users.
> 
> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
> [1], but the documention wasn't updated.

s/documention/documentation/

> 
> Update the documentation and comment to match the semantics of
> advisor_min_pages_to_scan.
> 
> Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
> Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
> Fixes: 66790e9a735b ("mm/ksm: add sysfs knobs for advisor")

Drop these.

> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
>  Documentation/admin-guide/mm/ksm.rst | 4 ++--
>  mm/ksm.c                             | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index c9f533b10f6f..c329ca747b8c 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -183,8 +183,8 @@ advisor_target_scan_time
>          pages. The default value is 200 seconds.
>  
>  advisor_min_pages_to_scan
> -        specifies the lower limit of the ``pages_to_scan`` parameter of the
> -        scan time advisor. The default is 500.
> +        specifies the initial value of the ``pages_to_scan`` parameter of
> +        the scan time advisor. The default is 500.

Makes sense.

>  
>  advisor_max_pages_to_scan
>          specifies the upper limit of the ``pages_to_scan`` parameter of the
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 7d5b76478f0b..1e3a9c657a64 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
>   * Only called through the sysfs control interface:
>   */
>  
> -/* At least scan this many pages per batch. */
> +/* Initial number of pages to scan per batch when the scan-time advisor is enabled. */
>  static unsigned long ksm_advisor_min_pages_to_scan = 500;
"when the scan-time advisor is enabled" is clear from the variable name.

So I'd shorten it to "Initial number of pages to scan per batch"

-- 
Cheers,

David
