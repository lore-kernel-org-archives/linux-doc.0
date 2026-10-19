Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443439;
	b=pSoq/xrN+BWTJViPUvVZZcbp27CbF/xO6RhysLpPb0jGSEeHyskD6IavLqE8XpZxRrjj
	 Vo+EVC6P4ZDbUt6tMNOXHat2Ls14VnYbziwpPIVun69cLT2Dy71d1ZurgUUXtfJNoIpa9
	 pCKt6Gg1id3fZq/7AjZeYgxLLedwKh4ygYlM0FoNX9B+iKNMnnKES9In98FRUAx7x2KGI
	 imHzDm9oj3pLdohI9Q7nuXa+0+d92Jz/i+DY8eCX2QjeZ488RaY7W07yY/2cJRWaz9rjY
	 g45BVbRXJVGLo6r2ehyTvAkFDofguzQLvChr9jNkAvirgrPotz/bmCOhDVk/YVBqrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443439;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=iUxDgCC6thNE6bahIcLevwQy6B6nWx+XvwiMIDf3yFM=;
	b=Yy1zNiSqRHblNDSMvAk5T2q1oPbkCU6ORzrBjOyv7krvyHYiDNKqC+/TOsd8nnIb0qE1
	 X2529Ox0peESQRQDlCVWJH57bk5c5BxNiXc3Q0hlqfCt7e0MIPzVYFHsiBRXPWWvWswit
	 wt44L53g3k4Ek8qvYNtKvQNJjhFQeyhhnHDWML6sYJ3BEHYC+j3Ry0tuVgPaZo9EEXpzb
	 0lR0v2LyVl2l1UByKh2TR9UlaxuAXe+N6hOwOfVpWO76jj++F6kxWJNgJv3XdTItG1uA8
	 aVdgPHCKsuLKVYN8b9rQxDl8/2Z3MShFpeU2v0ztgLn4j/ku8bsr3MXjJ3QH82+x3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dc7zM8QO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC5606A328
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 20:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BC5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dc7zM8QO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792443438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUxDgCC6thNE6bahIcLevwQy6B6nWx+XvwiMIDf3yFM=;
	b=Dc7zM8QOP7JmJiGACKWGlUA50hNGjvrxpGHZDh+APcvEMSuTwotSrpi1fxuFAwOWD6Cepz
	N5KHvWzQJDo+8VtaxHCrBFZq/loU0msnNY6FwVM11JmAAFhgK9sCMtG6SSfNXKz0KjcBrl
	y/o9nFVxcCz3kF0HO17wNlk1oDXjwqg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-VXEkOMxNPdyM2fxjJV-9zg-1; Mon,
 19 Oct 2026 20:57:14 +0000
X-MC-Unique: VXEkOMxNPdyM2fxjJV-9zg-1
X-Mimecast-MFC-AGG-ID: VXEkOMxNPdyM2fxjJV-9zg_1792443432
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B67881800654;
	Mon, 19 Oct 2026 20:57:11 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43CBE410;
	Mon, 19 Oct 2026 20:57:08 +0000 (UTC)
Message-ID: <3531bfe0-d5a3-4a38-af5b-68ce5406c591@redhat.com>
Date: Mon, 19 Oct 2026 16:57:07 -0400
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 0/9] cgroup/cpuset: Fix various housekeeping check
 problems
To: Tejun Heo <tj@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Hui Peng <benquike@gmail.com>,
 Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261019181020.1069325-1-longman@redhat.com>
 <ataCxJxYwg_uhS-j@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ataCxJxYwg_uhS-j@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


On 10/19/26 4:51 PM, Tejun Heo wrote:
> On Mon, Oct 19, 2026 at 02:10:11PM -0400, Waiman Long wrote:
>>   v4:
>>    - Adjust a number of patches to fix issues reported by Sashiko and
>>      Guopeng Zhang.
>>    - Add more test cases to test_cpuset_prs.sh to improve test coverage.
>>
>>   v3:
>>    - https://lore.kernel.org/lkml/20261014140548.575122-1-longman@redhat.com
>>    - Further revise the code based on feedback from sashiko and
>>      reviewers.
>>    - Add a new fix patch which fixes a bug found during the testing process.
>>    - Add a patch to impose a new restriction that creating a child root
>>      partition under an isolated parent partition is not allowed.
>>
>>   v2:
>>    - Update patches 2 and 3 to address bugs reported by sashiko.
>>    - Add a new test_cpuset_prs.sh patch to skip the test if some of the
>>      required CPUs are offline.
> Can you ping me after -rc1 drops?

Yes, I will.

Cheers,
Longman

>
> Thanks.
>

