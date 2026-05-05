Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F9363099
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777960610; cv=none; b=nGx3H7/P+5fcK1zwa+ZWJaEH1couOgzO2QiukSUTy0Mq8EECs3YDqb7CpmcPJyH5KtkeCt38eJpPD5B60S/9szhYNBcPKsGgwsqV79EkoAl61SgezTNZd+mlEaBmm6HbUkFbf6TUgTwDTkB2GU0zmu0opFykwBLfZrnlkFVX3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777960610; c=relaxed/simple;
	bh=vxrRsHG92zCqD2taOXq5dagh2LonMjKOdXTDxmuA5Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R67Nknr7VGcByCuV+GuUW2SnU2YFCxxMLtSnbj4WAp6won8xhLQrj7votfnFOfx2hdaqfjntvxLKLB9GsptmILrZmXRvnAchuCHZrwFXEex6WC/oZxAVUT0PPYi6Ltda4YqMPw/9PjhJrc+PDqjEfUFxDH/7QnQW0+4nAciXiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BRsMaWHT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BRsMaWHT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qs+ecXoF7v3nk0kuFCvPfN1KNtLwF5NOS/E0KViL+MQ=; b=BRsMaWHTekQXw3zjFlUNBQFzxY
	ZU6y2RV5Vm7r1U6LqThqmhKCvowG1VHbHs0xuLltfHSmTVZz6PPJ7dNBuZpROyIzsTAMH17yA39jF
	IBxozyn/a2okuvoaw9mvRaQxpz3n2munq1UW9kvbEQz3z3SdBOa5bP3Rvqb3Rh6df2SFB7uv33TgT
	g/gUg+RU8GayVZJxS4V4oD3/jz45fVdrp+ZyzMMwfCZ+MNlIjr1cgCyZU5kow6brQ9KQJ2ejXaz7F
	zY3D3kftTUof6/lnI7t6d1wDVLF/c4cJxh3CCfc2HgSWpGrT+s5qMVYZEG91yAqva/1hG+oj0A3gb
	+JR9BGJw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8ly-0000000FEqL-05WH;
	Tue, 05 May 2026 05:56:46 +0000
Message-ID: <f7950aaa-8b0b-499d-a421-134593ffaec0@infradead.org>
Date: Mon, 4 May 2026 22:56:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix broken links in bpf, driver_api & filesystem
 documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jeremy Bobbin <jer@jer.cx>,
 corbet@lwn.net
Cc: linux-doc@vger.kernel.org
References: <20260505014839.2670290-1-jer@jer.cx> <afl-79jS4RiGpx_c@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <afl-79jS4RiGpx_c@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/4/26 10:23 PM, Bagas Sanjaya wrote:
> On Mon, May 04, 2026 at 06:48:38PM -0700, Jeremy Bobbin wrote:
>> @@ -712,7 +712,7 @@ the following:
>>     * - 0x80
>>       - This filesystem has a snapshot (RO_COMPAT_HAS_SNAPSHOT).
>>     * - 0x100
>> -     - `Quota <Quota>`__ (RO_COMPAT_QUOTA).
>> +     - `Quota </filesystems/quota.html>`__ (RO_COMPAT_QUOTA).
> 
> Maybe :doc:`Quota </filesystems/quota>`?
> 
> Thanks.

I just tried that - unsuccessfully. (Maybe because this is in
a table?)

What works for me is this: (FWIW)

--- linux-next-20260504.orig/Documentation/filesystems/ext4/super.rst
+++ linux-next-20260504/Documentation/filesystems/ext4/super.rst
@@ -408,11 +408,11 @@ The ext4 superblock is laid out as follo
    * - 0x240
      - __le32
      - s_usr_quota_inum
-     - Inode number of user `quota <quota>`__ file.
+     - Inode number of user `quota <../quota.html>`__ file.
    * - 0x244
      - __le32
      - s_grp_quota_inum
-     - Inode number of group `quota <quota>`__ file.
+     - Inode number of group `quota <../quota.html>`__ file.
    * - 0x248
      - __le32
      - s_overhead_blocks
@@ -712,7 +712,7 @@ the following:
    * - 0x80
      - This filesystem has a snapshot (RO_COMPAT_HAS_SNAPSHOT).
    * - 0x100
-     - `Quota <Quota>`__ (RO_COMPAT_QUOTA).
+     - `Quota <../quota.html>`__ (RO_COMPAT_QUOTA).
    * - 0x200
      - This filesystem supports “bigalloc”, which means that file extents are
        tracked in units of clusters (of blocks) instead of blocks



-- 
~Randy

