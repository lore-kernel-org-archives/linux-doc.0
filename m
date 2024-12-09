Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298BBE6C
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 01:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733708067; cv=none; b=q96gc/uzU4VML9n6GeipyTDloDWhjnlZdXprOwF573faKIPXqsUCRDiarMzIQUbBVrDL/97BazfWnYhhZfCvKNfNjOQTn5eZTblJ1bp08SH4nuhNDKCvuummy7UTrmqRoChIeWiyQ5cYmUgVvxRL84Bl9K7txr9MRUNef1e+8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733708067; c=relaxed/simple;
	bh=sMRDgYoHnhfuVYq3deZ3g/KRUqJRTzlbsPka6maG+q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3hGaeQswVwVBJDfcB6bHlV1m80YZ2oeipIahc73qTGRmbhzpvWg1FaFLVCZI0KpdAClYDlddb1OnxXbYcJMcnXySTGxOlerFTWq2iXxWtjHFOzi2RinE26h3iZW7S9BiPqbLtOGqnzmDRjHemJhL1O641aMZ9aZiY8PUaiBZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R2YhPzZ9; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R2YhPzZ9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733708056; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/6H8UYBpi3RLqB/YI5BIcxsaeHvSJOKb+bemUYC8zXQ=;
	b=R2YhPzZ9cC7hXDQpb9u4r92h/uNvSYlztCblNFy34MZgZD0QLwbJbSgfy6FowlIly+XWoeT4BnpAsvclkyi+NLp6YWucELFHDaizXTz6UkzHLRGn6I19thWcjK3pvsvtiglljPUh9gkdze3q3+AtMnCl+7doe75pgDfjVlWF96w=
Received: from 30.178.82.25(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WL1R4D7_1733708054 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Dec 2024 09:34:15 +0800
Message-ID: <72dc2f3a-3c90-44f1-b497-2f60bde06f96@linux.alibaba.com>
Date: Mon, 9 Dec 2024 09:34:13 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH separete v2] docs, nvme: introduce nvme-multipath document
To: Jonathan Corbet <corbet@lwn.net>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
References: <20241206072507.37818-1-kanie@linux.alibaba.com>
 <87frn0vpn1.fsf@trenco.lwn.net>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <87frn0vpn1.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2024/12/6 22:42, Jonathan Corbet 写道:
> Guixin Liu <kanie@linux.alibaba.com> writes:
>
>> This adds a document about nvme-multipath and policies supported
>> by the Linux NVMe host driver, and also each policy's best scenario.
>>
>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>> ---
>> Hi,
>>    We found that we should take care of the throughput of each path in
>> service-time policy, so separate the doc patch. And continue working
>> on service-time policy patch.
>>
>> Changes from v1 to v2:
>> - Remove service-tome policy.
>>
>>   Documentation/nvme/nvme-multipath.rst | 72 +++++++++++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>   create mode 100644 Documentation/nvme/nvme-multipath.rst
> Thanks for working to improve our documentation.
>
> When you add a new file, you need to add it to the relevant index.rst
> file as well; if you had run a docs build, you would have seen a warning
> about this.
>
> I would also suggest that this material perhaps belongs in the admin
> guide rather than in its own directory?
>
> Thanks,
>
> jon

Thanks, I dont know how documentation works, my bad, changed in v3.

Best Regards,

Guixin Liu

