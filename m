Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBC2E62A2
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230926; cv=none; b=igHfnrcZEfDewFLl6wvtod9t6bn/DaQViAlGyih1AJ6fsjfqi8p+GXCGqgEROfjk/RSJgZs5ZUoTXt99ekE3cEUUE+rhUhhjGz85Yh77f4GA0Gf3YVMt4x6t4dMIn2EZJFzDiwmIjAZl16tOp/CtZ+dBQP0g4W+Tyo8dPtrQgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230926; c=relaxed/simple;
	bh=UWmSshBEHQ7KxE8MnHPkIfsFEU9/Q6SjGSI/Gge/kD8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VCN6m2aF3zMO/YIMhb1pRg4FeyZWDorXyI/tEvs5Sy+lYmT5Fj5xg5D+rCp9qMFaR4J2LRUbBgPzPtsRYct/nM4qsu5QoGlrkM1BnEDZw/AsIKRwmS3W1TfhbkeHoszvQ6B/LpWcUWDr8ydU7ryzmYodhP8VxrqVw1qNE/cNZKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OquIy3yk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioGvxbv3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OquIy3yk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioGvxbv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768230923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yBnEhkF7Qdzoo2GNW/2wAAQ4zQejO2Ma9rGc252Ro1o=;
	b=OquIy3ykPivdZ4P3JfPsaDY8hP4Rxp3Wbq8INII1kreH92PLKkSqo9vg/PcyOphmZtNKNQ
	Jixtypw/kDeJdBj4bzNL02vB4hukIC/LfpYO+LDlmD9TujviMcUM6jXS3MSb1F0gwzUZeP
	4mLNWwmEGuz6XuXEluoh1LVXXsQ7yjs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-ZH1LIiWNNWWd_APvMo1Yiw-1; Mon, 12 Jan 2026 10:15:21 -0500
X-MC-Unique: ZH1LIiWNNWWd_APvMo1Yiw-1
X-Mimecast-MFC-AGG-ID: ZH1LIiWNNWWd_APvMo1Yiw_1768230921
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so183756686d6.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768230921; x=1768835721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBnEhkF7Qdzoo2GNW/2wAAQ4zQejO2Ma9rGc252Ro1o=;
        b=ioGvxbv3KePlaaSTy5wqTAqfaMPBb7jFEBOvmyp1gXHqCeS6U7WOtjPN+HGMDrEI4V
         p6FfEQy1kafw0OI9oqueCm7CMl4tFj6NByWvaFm07qVReKjisc/pDAl9pFvmtL7qK3BT
         Ck8zDj8dk4i6RUTc17Uc2lU5hB3hMb+035RVg3LnvSX6xHyQwdvg6MFpKA2/luEQ0pFg
         h5Luum8SQ40G05TbtnelPwm+XVQ6K/mCG1jBdlnt3yroW3Hquyj7MqpF9wBshxuygRWL
         MnWrGsHolYYrJfZj5ZAYMneMzUqob4EHAE00kRblHCg9XKvS/vaG1EkrcJtS1vx+Qdyp
         1lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230921; x=1768835721;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBnEhkF7Qdzoo2GNW/2wAAQ4zQejO2Ma9rGc252Ro1o=;
        b=QumBMg9K3m5toljza8bVYlObijZy0errG5MfdjMHjRphFdTBWgrNcySVSk7OJmMp+z
         x2cmJPeG1Iu0TDVuS8qGq+oVdg9F8lxM8P9+xnFZcG/V5dCuPbgNr1IckjDwg12kXSHO
         nUD/fkAkDdMmE5N3aqH6hyzLgueqcC6W853QBK3wR9O2TozBFAS+rPGpVT7qRscPOOlT
         MbOXhA45uW21ZIujC/RhMoGi4INP9a5/LYrhlB7VJht2eDEFBodlwRmqAUDsuGUkOnWa
         mE8SI+vqp3fhFVGwdSvw0j51WZxB8fxeaQQyEgtOmbkx8RnTRTijUku8DQQnZIyhAd0X
         vZyw==
X-Forwarded-Encrypted: i=1; AJvYcCUk50avPjoUn6wiA2LMohgGNBqukk8fLqzl2yBB5KDKALuG5l74iufgCIjFA9uVCtxrxFIDzaKcZbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpbP95hEeKtkiU3tsgXcm/ppl/1tVWptRPb2KWoEa3X1SkBPhs
	vrwfr7LvXBJY22wfgW/n8/8WglBWXMdf+CcYoiHwaN1P7dRFgjiQlTPrwlJMTvCy7gJPsN2qMqF
	Evpe7rAkR3TYmoc5rWcObCxgNxfaiDrJDPt5Ctrr0Xqu3BXLLHz904wTK2EUC3g==
X-Gm-Gg: AY/fxX6H4GsYnpo9baGvNSnwzJovngYwohzfws/M0OtZWrVYjMBieqipuME9OHT689B
	zZ7d4zqlH4xOqZcJvWoeSA/iYAegu7X0axOf+C3ReULbHfq5eBP21L9X/X3uxt+F1XQZKjSvB7+
	ZfR2+kYWYRI4rOqfJ04DD5BY3v5tlQImSVSGG10P5lf5Vp9Nj+wm4PZzglxUhy7ddUADAluYDBW
	NzKaaS59NRjVex7o1o7V2/uLIG1jVq35dsH0DHE3S3/JbapzJ/z1iL6Kr3dkh4813IziGcj9mjg
	zd9FaM8MgAivE7RGu1qUlTdLVWteLmJmnSFDh84IJwQ9OEPoXUD3ajI4/aNslfK+omw06TlI79J
	MwbVyjJwNHWY3O+o2XcNwCs5IdEqxrs97aUBohfus2FggGcQUEDSl0+Gg
X-Received: by 2002:ad4:5b87:0:b0:87f:e1b3:2014 with SMTP id 6a1803df08f44-890842d60cdmr242991916d6.66.1768230920859;
        Mon, 12 Jan 2026 07:15:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEEvjOnKFKxOB5sHeF3FHbEdls66ozWBRKEY9iiOUfJDVYVV2wAJMexcKiVyLElIE1U7IUUw==
X-Received: by 2002:ad4:5b87:0:b0:87f:e1b3:2014 with SMTP id 6a1803df08f44-890842d60cdmr242991006d6.66.1768230920201;
        Mon, 12 Jan 2026 07:15:20 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253218sm137736816d6.43.2026.01.12.07.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:15:19 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <9a1b7583-7695-484f-a290-807b6db06799@redhat.com>
Date: Mon, 12 Jan 2026 10:15:17 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Waiman Long <llong@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>, Chen Ridong
 <chenridong@huaweicloud.com>, Chen Ridong <chenridong@huawei.com>
References: <20260112040856.460904-1-longman@redhat.com>
 <20260112040856.460904-5-longman@redhat.com>
 <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
 <f33eb2b3-c2f4-48ae-b2cd-67c0fc0b4877@redhat.com>
 <uogjuuvcu7vsazm53xztqg2tiqeeestcfxwjyopeapoi3nji3d@7dsxwvynzcah>
Content-Language: en-US
In-Reply-To: <uogjuuvcu7vsazm53xztqg2tiqeeestcfxwjyopeapoi3nji3d@7dsxwvynzcah>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 10:08 AM, Michal Koutný wrote:
> On Mon, Jan 12, 2026 at 09:51:28AM -0500, Waiman Long <llong@redhat.com> wrote:
>> Sorry, I might have missed this comment of yours. The
>> "cpuset.cpus.exclusive" file lists all the CPUs that can be granted to its
>> children as exclusive CPUs. The cgroup root is an implicit partition root
>> where all its CPUs can be granted to its children whether they are online or
>> offline. "cpuset.cpus.effective" OTOH ignores the offline CPUs as well as
>> exclusive CPUs that have been passed down to existing descendant partition
>> roots so it may differ from the implicit "cpuset.cpus.exclusive".
> Howewer, there's no "cpuset.cpus" configurable nor visible on the root
> cgroup. So possibly drop this hunk altogether for simplicity?

Ah, you are right. I thought there was a read-only copy in cgroup root. 
Will correct that.

Thanks,
Longman

